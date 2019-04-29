class RentasController < ApplicationController
  def index
    initialize_rentas
    @rentas = Renta.using(:dwh_t).where(error: true)
  end

  def edit
    @renta = Renta.using(:dwh_t).find(params[:id])
  end

  def update
    @renta = Renta.using(:dwh_t).find(params[:id])
    if @renta.update(renta_params)
      flash[:notice] = 'Actualizado'
      redirect_to rentas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def renta_params
    params.require(:renta).permit(:id_cliente, :id_empleado, :f_entrada, :f_salida)
  end

  def initialize_rentas
    Renta.using(:dwh_t).delete_all
    rentas = Renta.using(:restaurant).all
    renta = Renta.using(:dwh_t).new()

    rentas.each do |renta_r|
      renta = Renta.using(:dwh_t).new()

      renta.id = renta_r.id
      renta.id_cliente = renta_r.idCliente
      renta.id_reservacion = renta_r.idReservacion
      renta.id_empleado = renta_r.idEmpleado
      renta.f_entrada = renta_r.FechaIn
      renta.f_salida = renta_r.FechaOut
      unless valid_date?(renta.f_entrada)
        renta.error = true
      end

      unless valid_date?(renta.f_salida)
        renta.error = true
      end
      renta.save!
    end
  end
end
