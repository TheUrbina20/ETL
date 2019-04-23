Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  resources :accidentes_laborales
  resources :aplicaciones_a_vacantes
  resources :areas
  resources :areas_por_empleado
  resources :asistencias
  resources :bajas_empleado
  resources :capacitaciones_por_empleado
  resources :clientes
  resources :empresas
  resources :landing_page, only: [:index]
  resources :postulantes
  resources :programas_capacitacion
  resources :proveedores
  resources :solicitudes_de_mantenimiento
  resources :vacantes
end
