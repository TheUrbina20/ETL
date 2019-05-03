class CustomSessionsController < Devise::SessionsController
  before_action :register_log, only: [:create]

  def register_log
    Log.create(action: 'Inicio de sesion', user: current_user.email, time: Date.today)
  end
end
