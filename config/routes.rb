Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: 'custom_sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  resources :accidentes_laborales
  resources :asignacion_materiales
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
  resources :comandas
  resources :detalles_de_factura_restaurante
  resources :detalles_de_factura_hotel#
  resources :dhabitaciones
  resources :dmantenimiento_equipos ##REMOVED
  resources :dmantenimiento_habitaciones ## REMOVED
  resources :equipos
  resources :equipo_habitaciones
  resources :equipos_por_pedido
  resources :equipos_por_recibo
  resources :empleados
  resources :empresas
  resources :facturas_restaurante
  resources :facturas_hotel
  resources :habitaciones
  resources :habitaciones_rentadas
  resources :habitaciones_reservadas
  resources :historico_servicios
  resources :ingredientes
  resources :ingredientes_por_bebida
  resources :ingredientes_por_platillo
  resources :ingredientes_por_proveedor
  resources :landing_page, only: [:index, :new]
  resources :mantenimientos
  resources :materiales
  # resources :materiales_por_habitaciones
  resources :materiales_por_pedido
  resources :materiales_por_recibo
  resources :materialgastado_habitaciones
  resources :mesas
  resources :mesas_por_reservacion
  resources :ordenes_de_mantenimiento
  resources :pedidos_por_empleado
  resources :paquetes
  resources :paquetes_vendidos_rentas
  resources :platillos
  resources :platillos_por_comanda
  resources :postulantes
  resources :programas_capacitacion
  resources :proveedores
  resources :recibos_de_compras
  resources :rentas
  resources :reservaciones_en_hotel
  resources :reservaciones_en_restaurante
  resources :reporte_perdido_robos
  resources :servicios
  resources :serviciol_habitaciones
  resources :servicio_limpiezas
  resources :servicio_habitaciones
  resources :servicios_paquetes
  resources :servicios_a_domicilio
  resources :solicitudes_de_mantenimiento#
  resources :tipos_medidas
  resources :tipos_de_productos
  resources :vacantes#

  resources :exporter, only: [:new]
  resources :logs, only: [:index]
  resources :sql_server_exporter, only: [:new]
end

