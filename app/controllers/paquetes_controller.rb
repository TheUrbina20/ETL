class PaquetesController < ApplicationController
    def index
        initialize_paquetes
        @paquete = Paquete.using(:dwh_t).all
    end
    
    def edit
      @paquete = Paquete.using(:dwh_t).find(params[:id]) 
    end

    def update
      @paquete = Paquete.using(:dwh_t).find(params[:id])

      if @paquete.update(paquetes_params)
        flash[:notice] = 'Actualizado Correctamente'
        redirect_to paquetes_path
      else 
        flash[:alert] = 'Error actualizando'
        render 'edit'
      end
    end

    def paquetes_params
      params.require(:paquete).permit(:id, :idPaquete, :Nombre, :Descripcion, :PrecioDia)
    end

    def initialize_paquetes
        Paquete.using(:dwh_t).delete_all
    
        paquetes_h = Paquete.using(:restaurant).all
        paquete_t = Paquete.using(:dwh_t).new()
    
    
        paquetes_h.each do |pa|
          paquete_t = Paquete.using(:dwh_t).new()
          paquete_t.idPaquete = pa.idPaquete
          paquete_t.Nombre = pa.Nombre
          paquete_t.Descripcion = pa.Descripcion
          paquete_t.PrecioDia = pa.PrecioDia
          paquete_t.save!
        end
      end
end