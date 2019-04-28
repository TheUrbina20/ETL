class MaterialesPorReciboController < ApplicationController
  def index
    initialize_materiales_por_recibo
    @materiales_por_recibo = MaterialPorRecibo.using(:dwh_t).all
  end

  def edit
    @material_por_recibo = MaterialPorRecibo.using(:dwh_t).find(params[:id])
  end

  def update
    @material_por_recibo = MaterialPorRecibo.using(:dwh_t).find(params[:id])
    if @material_por_recibo.update(material_por_recibo_params)
      flash[:notice] = 'Actualizado'
      redirect_to materiales_por_recibo_index_path
    else
      flash.now[:alert] = 'Actualizado'
      render 'edit'
    end
  end

  def material_por_recibo_params
    params.require(:material_por_recibo).permit(:id_sistema, :sistema, :id_material, :id_recibo, :cantidad, :tipo_paquete, :f_caducidad)
  end

  def initialize_materiales_por_recibo
    MaterialPorRecibo.using(:dwh_t).delete_all

    materiales_por_recibo = MaterialPorRecibo.using(:rrhh).all
    material_por_recibo = MaterialPorRecibo.using(:dwh_t).new

    materiales_por_recibo.each do |material_por_recibo_r|
      material_por_recibo = MaterialPorRecibo.using(:dwh_t).new

      material_por_recibo.id_sistema = material_por_recibo_r.id
      material_por_recibo.id_recibo_compra = material_por_recibo_r.id_recibo_compra
      material_por_recibo.id_material = material_por_recibo_r.id_material
      material_por_recibo.cantidad = material_por_recibo_r.cantidad
      material_por_recibo.f_caducidad = material_por_recibo_r.f_caducidad
      material_por_recibo.tipo_paquete = material_por_recibo_r.tipo_paquete
      material_por_recibo.sistema = 'RR'
      material_por_recibo.save!
    end

    materiales_por_recibo = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_materiales_recibo']

    materiales_por_recibo.each do |material_por_recibo_r|
      material_por_recibo = MaterialPorRecibo.using(:dwh_t).new

      material_por_recibo.id_sistema = material_por_recibo_r[:Id]
      material_por_recibo.id_material = material_por_recibo_r[:id_material]
      material_por_recibo.id_recibo_compra = material_por_recibo_r[:id_rec_rm]
      material_por_recibo.cantidad = material_por_recibo_r[:cantidad]
      material_por_recibo.sistema = 'R'
      material_por_recibo.save!
    end

  end


end
