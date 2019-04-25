Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  resources :accidentes_laborales
  resources :aplicaciones_a_vacantes
  resources :areas
  resources :areas_por_empleado
  resources :asistencias
  resources :bajas
  resources :bajas_empleado
  resources :capacitaciones_por_empleado
  resources :clientes
  resources :equipos
  resources :equipos_por_pedido
  resources :empleados
  resources :empresas
  resources :empleados
  resources :landing_page, only: [:index]
  resources :mesas
  resources :platillos
  resources :postulantes
  resources :programas_capacitacion
  resources :proveedores
  resources :rentas
  resources :recibos_de_compras
  resources :servicios_a_domicilio
  resources :solicitudes_de_mantenimiento
  resources :vacantes

end

