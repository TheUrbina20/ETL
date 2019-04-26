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
  resources :bebidas
  resources :bebidas_por_comanda
  resources :capacitaciones_por_empleado
  resources :clientes
  resources :dmantenimiento_equipos
  resources :dmantenimiento_habitaciones
  resources :equipos
  resources :equipo_habitaciones
  resources :equipos_por_pedido
  resources :empleados
  resources :empresas
  resources :habitaciones
  resources :habitaciones_rentadas
  resources :habitaciones_reservadas
  resources :historico_servicios
  resources :ingredientes
  resources :ingredientes_por_proveedor
  resources :ingredientes_por_bebida
  resources :ingredientes_por_platillo
  resources :landing_page, only: [:index]
  resources :mantenimientos
  resources :mesas
  resources :paquetes
  resources :paquetes_vendidos_rentas
  resources :platillos
  resources :platillos_por_comanda
  resources :postulantes
  resources :programas_capacitacion
  resources :proveedores
  resources :postulantes
  resources :reservaciones
  resources :serviciol_habitaciones
  resources :servicio_limpiezas
  resources :servicio_habitaciones
  resources :servicios_paquetes
  resources :rentas
  resources :recibos_de_compras
  resources :servicios_a_domicilio
  resources :solicitudes_de_mantenimiento
  resources :tipos_medidas
  resources :tipos_de_productos
  resources :vacantes

end

