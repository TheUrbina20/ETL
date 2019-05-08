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

  get 'delete_with_errors_asignacion_materiales', to: 'asignacion_materiales#delete_with_errors_asignacion_materiales', as: :delete_asignacion_materiales
  get 'delete_with_errors_clientes', to: 'clientes#delete_with_errors_clientes', as: :delete_clientes
  get 'delete_with_errors_detalle_factura', to: 'detalles_de_factura_hotel#delete_with_errors_detalle_factura', as: :delete_detalle
  get 'delete_with_errors_equipos', to: 'equipos#delete_with_errors_equipos', as: :delete_equipo
  get 'delete_with_errors_equipos_por_recibo', to: 'equipos_por_recibo#delete_with_errors_equipos_por_recibo', as: :delete_equipo_por_recibo
  get 'delete_with_errors_empleados', to: 'empleados#delete_with_errors_empleados', as: :delete_empleados
  get 'delete_with_errors_factura_hotel', to: 'facturas_hotel#delete_with_errors_factura_hotel', as: :delete_factura_hotel
  get 'delete_with_errors_habitaciones', to: 'habitaciones#delete_with_errors_habitaciones', as: :delete_habitaciones
  get 'delete_with_errors_historico_servicios', to: 'historico_servicios#delete_with_errors_historico_servicios', as: :delete_historico_servicios
  get 'delete_with_errors_materiales', to: 'materiales#delete_with_errors_materiales', as: :delete_materiales
  get 'delete_with_errors_materialesgastados_habitacion', to: 'materialgastado_habitaciones#delete_with_errors_materialesgastados_habitacion', as: :delete_materiales_por_habitacion
  get 'delete_with_errors_materiales_por_pedido', to: 'materiales_por_pedido#delete_with_errors_materiales_por_pedido', as: :delete_materiales_por_pedido
  get 'delete_with_errors_materiales_por_recibo', to: 'materiales_por_recibo#delete_with_errors_materiales_por_recibo', as: :delete_materiales_por_recibo
  get 'delete_with_errors_ordenes_mantenimiento', to: 'ordenes_de_mantenimiento#delete_with_errors_ordenes_mantenimiento', as: :delete_ordenes_de_mantenimiento
  get 'delete_with_errors_paquetes', to: 'paquetes#delete_with_errors_paquetes', as: :delete_paquetes
  get 'delete_with_errors_pedidos_por_empleado', to: 'pedidos_por_empleado#delete_with_errors_pedidos_por_empleado', as: :delete_pedidos_por_empleado
  get 'delete_with_errors_recibos_de_compra', to: 'recibos_de_compras#delete_with_errors_recibos_de_compra', as: :delete_recibos_de_compras
  get 'delete_with_errors_rentas', to: 'rentas#delete_with_errors_rentas', as: :delete_rentas
  get 'delete_with_errors_reservacion_hotel', to: 'reservaciones_en_hotel#delete_with_errors_reservacion_hotel', as: :delete_reservaciones_hotel
  get 'delete_with_errors_reporte', to: 'reporte_perdido_robos#delete_with_errors_reporte', as: :delete_reportes
  get 'delete_with_errors_servicios', to: 'servicios#delete_with_errors_servicios', as: :delete_servicios
  get 'delete_with_errors_servicio_limpieza', to: 'servicio_limpiezas#delete_with_errors_servicio_limpieza', as: :delete_servicios_limpiezas
  get 'delete_with_errors_servicio_limpieza_habitaciones', to: 'serviciol_habitaciones#delete_with_errors_servicio_limpieza_habitaciones', as: :delete_servicios_limpiezas_habitaciones
  get 'delete_with_errors_tipo_habitaciones', to: 'dhabitaciones#delete_with_errors_tipo_habitaciones', as: :delete_tipo_habitaciones

  #DELETE ALL RECORDS WITH ERROR, ORUTES
  get 'delete_with_errors_areas', to: 'areas#delete_with_errors_areas', as: :delete_areas #delete_areas IS THE PATH TO CALL THE CONTROLLER ACTION delte_with_errors

  resources :deletter, only: [:new]
end

