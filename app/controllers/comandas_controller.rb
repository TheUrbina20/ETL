class ComandasController < ApplicationController
  def index
    initialize_comandas
    @comandas = Comanda.using(:dwh_t).where(error: true)
  end

  def edit
    @comanda = Comanda.using(:dwh_t).find(params[:id])
  end

  def update
    @comanda = Comanda.using(:dwh_t).find(params[:id])
    if @comanda.update(comanda_params)
      flash[:notice] = 'Actualizado'
      redirect_to comandas_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def comanda_params
    params.require(:comanda).permit(:id_reservacion, :id_empleado, :fecha, :hora_reservacion)
  end

  def initialize_comandas
    Comanda.using(:dwh_t).delete_all
    comandas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Comanda']

    comandas.each do |comanda_r|
      comanda = Comanda.using(:dwh_t).new
      comanda.id = comanda_r[:Id]
      comanda.id_reservacion = comanda_r[:id_reserva_m]
      comanda.id_empleado = comanda_r[:id_empleado]
      comanda.fecha = comanda_r[:fecha]
      comanda.hora_reservacion = comanda_r[:hora]
      unless valid_date?(comanda.fecha)
        comanda.error = true
      end
      comanda.save!
    end
  end
end
