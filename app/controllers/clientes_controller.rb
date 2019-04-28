class ClientesController < ApplicationController
  def index
    initialize_clientes
    @clientes = Cliente.using(:dwh_t).all
  end

  def edit
    @cliente = Cliente.using(:dwh_t).find(params[:id])
  end

  def update
    @cliente = Cliente.using(:dwh_t).find(params[:id])
    if @cliente.update(cliente_params)
      flash[:notice] = 'Actualizado'
      redirect_to clientes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def cliente_params
    params.require(:cliente).permit(:nombre, :correo, :telefono)
  end

  private

  def initialize_clientes
    Cliente.using(:dwh_t).delete_all

    clientes = Cliente.using(:restaurant).all
    cliente = Cliente.using(:dwh_t).new()


    clientes.each do |cliente_r|
      cliente = Cliente.using(:dwh_t).new()

      cliente.nombre = cliente_r.Nombres + ' ' + cliente_r.ApellidoP + ' ' + cliente_r.ApellidoM
      cliente.estado = cliente_r.EntidadFederativa
      cliente.correo = cliente_r.Correo
      # cliente.telefono = cliente_r.Telefono
      cliente.save!
    end

    clientes = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Clientes']

    clientes.each do |cliente_r|
      cliente = Cliente.using(:dwh_t).new()
      cliente.nombre = cliente_r[:nombre] + ' ' + cliente_r[:apellido_p] + ' ' + cliente_r[:apellido_m]
      # cliente.estado = cliente_r.EntidadFederativa
      # cliente.correo = cliente_r.Correo
      cliente.telefono = cliente_r[:telefono]
      cliente.save!
    end

  end
end
