class ProveedoresController < ApplicationController
  def index
    initialize_proveedores
    @proveedores = Proveedor.using(:dwh_t).all
  end

  def edit
    @proveedor = Proveedor.using(:dwh_t).find(params[:id])
  end

  def update
    @proveedor = Proveedor.using(:dwh_t).find(params[:id])
    if @proveedor.update(proveedor_params)
      flash[:notice] = 'Actualizado'
      redirect_to proveedores_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def proveedor_params
    params.require(:proveedor).permit(:id_sistema, :nombre, :sistema, :id_empresa)
  end

  private


  def initialize_proveedores
    Proveedor.using(:dwh_t).destroy_all
    proveedores = Proveedor.using(:rrhh).all
    proveedor = Proveedor.using(:dwh_t).new

    proveedores.each do |proveedor_r|
      proveedor = Proveedor.using(:dwh_t).new
      proveedor.id_sistema = proveedor_r.id
      proveedor.nombre = proveedor_r.nombre
      proveedor.id_empresa = proveedor_r.id_empresa
      proveedor.sistema = 'RR'
      unless valid_name?(proveedor.nombre)
        proveedor.error = true
      end
      proveedor.save!
    end

    proveedores = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Proveedores']

    proveedores.each do |proveedor_r|
      proveedor = Proveedor.using(:dwh_t).new

      proveedor.id_sistema = proveedor_r[:Id]
      proveedor.nombre = proveedor_r[:razon_social]
      proveedor.sistema = 'R'
      proveedor.save!
    end

  end
end
