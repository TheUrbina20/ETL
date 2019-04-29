class PaquetesController < ApplicationController
    def index
        initialize_paquetes
        @paquete = Paquete.using(:dwh_t).where(error: true)
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
        flash.now[:alert] = 'Error actualizando'
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
          paquete_t.id = pa.idPaquete
          paquete_t.nombre = pa.Nombre
          paquete_t.descripcion = pa.Descripcion
          paquete_t.precio_por_dia = pa.PrecioDia
          unless valid_name?(paquete_t.nombre)
            paquete.errro = true
          end

          unless valid_number?(paquete_t.precio_por_dia)
            paquete.errro = true
          end

          paquete_t.save!
        end
      end
end
