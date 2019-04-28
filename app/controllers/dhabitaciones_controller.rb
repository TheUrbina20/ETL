class DhabitacionesController < ApplicationController
    def index
        initialize_dhabitaciones
        @dhabitaciones = Dhabitacion.using(:dwh_t).all
    end
    
    def edit
      @dhabitaciones = Dhabitacion.using(:dwh_t).find(params[:id]) 
    end

    def update
      @dhabitaciones = Dhabitacion.using(:dwh_t).find(params[:id])

      if @dhabitaciones.update(dhabitaciones_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to dhabitaciones_path
      else 
        flash.now[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def dhabitaciones_params
      params.require(:dhabitacion).permit(:id, :idTipo, :Nombre, :Precio)
    end

    def initialize_dhabitaciones
        Dhabitacion.using(:dwh_t).delete_all
    
        habitaciones_h = Dhabitacion.using(:restaurant).all
        habitacion_t = Dhabitacion.using(:dwh_t).new()
    
    
        habitaciones_h.each do |pa|
          habitacion_t = Dhabitacion.using(:dwh_t).new()
          habitacion_t.idTipo = pa.idTipo
          habitacion_t.Nombre = pa.Nombre
          habitacion_t.Precio = pa.Precio
          habitacion_t.save!
        end
      end
end
