class ServicioLimpiezasController < ApplicationController
    def index
        initialize_serviciosl
        @serviciol = ServicioLimpieza.using(:dwh_t).all
    end
    def edit
      @serviciol = ServicioLimpieza.using(:dwh_t).find(params[:id]) 
    end

    def update
      @serviciol = ServicioLimpieza.using(:dwh_t).find(params[:id])

      if @serviciol.update(serviciosl_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to servicio_limpiezas_path
      else 
        flash[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def serviciosl_params
      params.require(:servicio_limpieza).permit(:id, :idServicioL, :Nombre)
    end
 private
    def initialize_serviciosl
        ServicioLimpieza.using(:dwh_t).delete_all
    
        servicios_h = ServicioLimpieza.using(:restaurant).all
        servicio_t = ServicioLimpieza.using(:dwh_t).new()
    
    
        servicios_h.each do |s|
          servicio_t = ServicioLimpieza.using(:dwh_t).new()
          servicio_t.idServicioL = s.idServicioL
          servicio_t.Nombre = s.Nombre
          servicio_t.save!
        end
      end
end
