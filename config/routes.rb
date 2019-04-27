Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  resources :accidentes_laborales
  resources :asignacion_materiles
  resources :aplicaciones_a_vacantes
  resources :areas
  resources :areas_por_empleado
  resources :asistencias
  resources :bajas
  resources :bajas_empleado
  resources :capacitaciones_por_empleado
  resources :clientes
  resources :dhabitaciones
  resources :dmantenimiento_equipos
  resources :dmantenimiento_habitaciones
  resources :equipos
  resources :equipo_habitaciones
  resources :equipos_por_pedido
  resources :empleados
  resources :empresas
  resources :empleados
  resources :habitaciones
  resources :habitaciones_rentadas
  resources :habitaciones_reservadas
  resources :historico_servicios
  resources :landing_page, only: [:index]
  resources :mantenimientos
  resources :materialgastado_habitaciones
  resources :paquetes
  resources :paquetes_vendidos_rentas
  resources :postulantes
  resources :programas_capacitacion
  resources :proveedores
  resources :reservaciones
  resources :recibos_de_compras
  resources :reporte_perdido_robos
  resources :servicios
  resources :serviciol_habitaciones
  resources :servicio_limpiezas
  resources :servicio_habitaciones
  resources :servicios_paquetes
  resources :solicitudes_de_mantenimiento
  resources :vacantes

end

