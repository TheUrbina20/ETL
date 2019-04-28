class MaterialesPorPedidoController < ApplicationController
  def index
    initialize_materiales_por_pedido
    @materiales_por_pedido = MaterialPorPedido.using(:dwh_t).all
  end

  def edit
    @material_por_pedido = MaterialPorPedido.using(:dwh_t).find(params[:id])
  end

  def update
    @material_por_pedido = MaterialPorPedido.using(:dwh_t).find(params[:id])
    if @material_por_pedido.update(material_por_pedido_params)
      flash[:notice] = 'Actuaizado'
      redirect_to materiales_por_pedido_index_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def material_por_pedido_params
    params.require(:material_por_pedido).permit(:id_sistema, :sistema, :id_material, :id_pedido, :cantidad)
  end

  def initialize_materiales_por_pedido
    MaterialPorPedido.using(:dwh_t).delete_all

    materiales_por_pedido = MaterialPorPedido.using(:rrhh).all
    material_por_pedido = MaterialPorPedido.using(:dwh_t).new

    materiales_por_pedido.each do |material_por_pedido_r|
      material_por_pedido = MaterialPorPedido.using(:dwh_t).new

      material_por_pedido.id_sistema = material_por_pedido_r.id
      material_por_pedido.id_pedido = material_por_pedido_r.id_pedido_empleado
      material_por_pedido.id_material = material_por_pedido_r.id_material
      material_por_pedido.cantidad = material_por_pedido_r.cantidad
      material_por_pedido.sistema = 'RR'
      material_por_pedido.save!
    end

    materiales_por_pedido = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_materiales_pedido']

    materiales_por_pedido.each do |material_por_pedido_r|
      material_por_pedido = MaterialPorPedido.using(:dwh_t).new

      material_por_pedido.id_sistema = material_por_pedido_r[:id]
      material_por_pedido.id_pedido = material_por_pedido_r[:id_pedido]
      material_por_pedido.id_material = material_por_pedido_r[:id_material]
      material_por_pedido.cantidad = material_por_pedido_r[:cantidad]
      material_por_pedido.sistema = 'R'
      material_por_pedido.save!
    end

  end
end
