class ClientesController < ApplicationController
  def index

    @clientes = Cliente.using(:dwh_t).where(error: true)
  end

  def edit
    @cliente = Cliente.using(:dwh_t).find(params[:id])
  end

  def destroy
    @cliente = Cliente.using(:dwh_t).find(params[:id])
    if @cliente.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to clientes_path
  end

  def update
    @cliente = Cliente.using(:dwh_t).find(params[:id])
    if validate_attributes && @cliente.update(cliente_params)
      @cliente.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to clientes_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def cliente_params
    params.require(:cliente).permit(:id, :nombre, :correo, :telefono, :estado)
  end

  def validate_attributes
    valid_name?(@cliente.nombre) && valid_email?(@cliente.correo) && valid_telefono?(@cliente.telefono) && valid_estadoc?(@cliente.estado)
  end

end
