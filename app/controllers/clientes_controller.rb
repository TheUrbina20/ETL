class ClientesController < ApplicationController
  def index
    if current_user.admin?
      @clientes = Cliente.using(:dwh_t).where(error: true)
    elsif current_user.rrhh?
      @clientes = Cliente.using(:dwh_t).where(sistema: 'RH', error: true).order(:nombre)
    elsif current_user.restaurant?
      @clientes = Cliente.using(:dwh_t).where(sistema: 'R', error: true).order(:nombre)
    else
      @clientes = Cliente.using(:dwh_t).where(sistema: 'H', error: true).order(:nombre)
    end
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

  def delete_with_errors_clientes
    if current_user.rrhh?
      Cliente.using(:dwh_t).where(sistema: 'RH', error: true).delete_all
    elsif current_user.restaurant?
      Cliente.using(:dwh_t).where(sistema: 'R', error: true).delete_all
    else
      Cliente.using(:dwh_t).where(sistema: 'H', error: true).delete_all
    end
    redirect_to landing_page_index_path
  end

  def cliente_params
    params.require(:cliente).permit(:id, :nombre, :correo, :telefono, :estado)
  end

  def validate_attributes
    valid_name?(params[:cliente][:nombre]) && valid_email?(params[:cliente][:correo]) && valid_telefono?(params[:cliente][:telefono]) && valid_estadoc?(params[:cliente][:estado])
  end

end
