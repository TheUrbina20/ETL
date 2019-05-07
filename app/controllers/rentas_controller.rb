class RentasController < ApplicationController
  def index

    @rentas = Renta.using(:dwh_t).where(error: true)
  end

  def edit
    @renta = Renta.using(:dwh_t).find(params[:id])
  end

  def destroy
    @renta = Renta.using(:dwh_t).find(params[:id])
    if @renta.destroy
      flash[:notice] = 'Eliminado'
    else
      flash[:alert] = 'Error eliminando'
    end
    redirect_to rentas_path
  end

  def update
    @renta = Renta.using(:dwh_t).find(params[:id])
    if validate_attributes && @renta.update(renta_params)
      @renta.update_attributes(error: false)
      flash[:notice] = 'Actualizado'
      redirect_to rentas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def delete_with_errors_rentas
    Renta.using(:dwh_t).where(error: true).delete_all
    redirect_to landing_page_index_path
  end 

  def renta_params
    params.require(:renta).permit(:id_cliente, :id_empleado, :f_entrada, :f_salida)
  end

  def validate_attributes
    valid_date?(params[:renta][:f_entrada]) && valid_date?(params[:renta][:f_salida])
  end

end
