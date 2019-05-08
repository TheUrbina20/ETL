class DeletterController < ApplicationController
  def new
    model = params[:model].constantize
    if params[:model] == 'Proveedor'
      if current_user.restaurant?
        model.using(:dwh_t).where(sistema: 'R', error: true).delete_all
      else current_user.rrhh?
        model.using(:dwh_t).where(sistema: 'RH', error: true).delete_all
      end
    else
      model.using(:dwh_t).where(error: true).delete_all
    end
    flash[:notice] = "Registror erroneos eliminados del modelo #{params[:model]}"
    redirect_to root_path
  end
end
