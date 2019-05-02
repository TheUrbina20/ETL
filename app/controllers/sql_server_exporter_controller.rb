class SqlServerExporterController < ApplicationController
  def new
    copy_acidentes_laborales
    copy_aplicaciones_a_vacantes
    copy_areas
    copy_areas_por_empleado
    copy_asignacion_materiales
    copy_asistencias
    copy_bajas
    copy_bajas_empleado
    copy_bebidas
    copy_bebidas_por_comanda
    copy_capacitaciones_empleado
    copy_clientes
    copy_comandas
    copy_detalles_factura_hotel
    copy_detalles_factura_retaurante
    copy_dhabitaciones
    # copy_dmantenimitno_equipos
    copy_mantenimiento_habitaciones
    copy_empleados
    copy_empresas
    copy_habitaciones
    copy_equipo
    copy_equipos_por_pedido
    copy_equipos_por_recibo
    copy_facturas_hotel
    copy_facturas_restaurante
    copy_habitaciones
    copy_habitaciones_rentadas
    copy_habitaciones_reservadas
    copy_historial_de_servicios
    copy_ingredientes
    copy_ingredientes_por_bebida
    copy_ingrediente_por_platillo
    copy_ingredientes_por_proveedor
    copy_mantenimientos
    copy_materiales
    copy_materiales_por_pedido
    copy_materiales_por_pedido
    copy_material_gastado_por_habitacion
    copy_mesas
    copy_mesas_por_reservacion
    copy_ordenes_mantenimiento
    copy_paquetes
    copy_paquetes_vendidos_por_renta
    copy_pedidos_por_empleado
    copy_platillos
    copy_platillos_por_comanda
    copy_postulantes
    copy_programas_capacitacion
    copy_proveedores
    copy_recibos_de_compras
    copy_rentas
    copy_reporte_de_perdidas
    # copy_reservaciones
    copy_reservacion_en_hotel
    copy_reservacion_en_restaurante
    copy_servicios_por_habitacion
    copy_servicio_limpieza
    copy_serviciol_habitaciones
    copy_servicios_a_domicilio
    copy_servicios
    copy_servicios_por_paquete
    copy_solicitudes_mantenimiento
    copy_tipos_productos
    copy_tipos_medidas
    copy_vacantes
    flash[:notice] = 'Datos exportados 👏🏻'
    redirect_to root_path
  end

  def copy_acidentes_laborales
    accidentes = AccidenteLaboral.using(:dwh_t).where.not(error: true)
    accidente = AccidenteLaboral.using(:dwh).delete_all

    accidentes.each do |accidente_r|
      accidente = AccidenteLaboral.using(:dwh).new(accidente_r.serializable_hash)
      accidente.save!
    end
  end

  def copy_aplicaciones_a_vacantes
    aplicaciones = AplicacionAVacante.using(:dwh_t).where.not(error: true)
    AplicacionAVacante.using(:dwh).delete_all

    aplicaciones.each do |aplicacion_r|
      AplicacionAVacante.using(:dwh).create(aplicacion_r.serializable_hash)
    end
  end

  def copy_areas
    areas = Area.using(:dwh_t).where.not(error: true)
    Area.using(:dwh).delete_all
    areas.each do |area_r|
      Area.using(:dwh).create(area_r.serializable_hash)
    end
  end

  def copy_areas_por_empleado
    areas_por_empleado = AreasPorEmpleado.using(:dwh_t).where.not(error: true)
    AreasPorEmpleado.using(:dwh).delete_all
    areas_por_empleado.each do |area_por_empleado|
      AreasPorEmpleado.using(:dwh).create(area_por_empleado.serializable_hash)
    end
  end

  def copy_asignacion_materiales
    asignaciones = AsignacionMaterial.using(:dwh_t).where.not(error: true)
    AsignacionMaterial.using(:dwh).delete_all
    asignaciones.each do |asignacion|
      AsignacionMaterial.using(:dwh).create(asignacion.serializable_hash)
    end
  end

  def copy_asistencias
    asistencias = Asistencia.using(:dwh_t).where.not(error: true)
    Asistencia.using(:dwh).delete_all
    asistencias.each do |asistencia|
      Asistencia.using(:dwh).create(asistencia.serializable_hash)
    end
  end

  def copy_bajas
    bajas = Baja.using(:dwh_t).where.not(error: true)
    Baja.using(:dwh).delete_all
    bajas.each do |baja|
      Baja.using(:dwh).create(baja.serializable_hash)
    end
  end

  def copy_bajas_empleado
    bajas_empleado = BajaEmpleado.using(:dwh_t).where.not(error: true)
    BajaEmpleado.using(:dwh).delete_all

    bajas_empleado.each do |baja_empleado|
      BajaEmpleado.using(:dwh).create(baja_empleado.serializable_hash)
    end
  end

  def copy_bebidas
    bebidas = Bebida.using(:dwh_t).where.not(error: true)
    Bebida.using(:dwh).delete_all
    bebidas.each do |bebida|
      Bebida.using(:dwh).create(bebida.serializable_hash)
    end
  end

  def copy_bebidas_por_comanda
    bebidas_por_comanda = BebidaPorComanda.using(:dwh_t).where.not(error: true)
    BebidaPorComanda.using(:dwh).delete_all
    bebidas_por_comanda.each do |bebida_por_comanda|
      BebidaPorComanda.using(:dwh).create(bebida_por_comanda.serializable_hash)
      puts bebida_por_comanda
    end
  end

  def copy_capacitaciones_empleado
    capacitaciones_por_empelado = CapacitacionPorEmpleado.using(:dwh_t).where.not(error: true)
    CapacitacionPorEmpleado.using(:dwh).delete_all
    capacitaciones_por_empelado.each do |capacitacion_por_empleado|
      CapacitacionPorEmpleado.using(:dwh).create(capacitacion_por_empleado.serializable_hash)
    end
  end

  def copy_clientes
    clientes = Cliente.using(:dwh_t).where.not(error: true)
    Cliente.using(:dwh).delete_all
    clientes.each do |cliente|
      Cliente.using(:dwh).create(cliente.serializable_hash)
    end
  end

  def copy_comandas
    comandas = Comanda.using(:dwh_t).where.not(error: true)
    Comanda.using(:dwh).delete_all
    comandas.each do |comanda|
      Comanda.using(:dwh).create(comanda.serializable_hash)
    end
  end

  def copy_detalles_factura_hotel
    detalles_factura_hotel = DetalleDeFacturaHotel.using(:dwh_t).where.not(error: true)
    DetalleDeFacturaHotel.using(:dwh).delete_all
    detalles_factura_hotel.each do |detalle_factutra_hotel|
      DetalleDeFacturaHotel.using(:dwh).create(detalle_factutra_hotel.serializable_hash)
    end
  end

  def copy_detalles_factura_retaurante
    detalles_factura_restaurante = DetalleDeFacturaRestaurante.using(:dwh_t).where.not(error: true)
    DetalleDeFacturaRestaurante.using(:dwh).delete_all
    detalles_factura_restaurante.each do |detalle_factura|
      DetalleDeFacturaRestaurante.using(:dwh).create(detalle_factura.serializable_hash)
    end
  end

  def copy_dhabitaciones
    dhabitaciones = Dhabitacion.using(:dwh_t).where.not(error: true)
    Dhabitacion.using(:dwh).delete_all
    dhabitaciones.each do |dhabitacion|
      Dhabitacion.using(:dwh).create(dhabitacion.serializable_hash)
    end
  end

  # def copy_dmantenimiento_equipos
  #   detalles_mantenimiento = DmantenimientoEquipo.using(:dwh_t)
  #   DmantenimientoEquipo.using(:dwh).delete_all
  #   detalles_mantenimiento.each do |detalle|
  #     DmantenimientoEquipo.using(:dwh).create(detalle.serializable_hash)
  #   end
  # end

  def copy_mantenimiento_habitaciones
    detalles_mantenimiento_habitacion = DmantenimientoHabitacion.using(:dwh_t).where.not(error: true)
    DmantenimientoHabitacion.using(:dwh).delete_all
    detalles_mantenimiento_habitacion.each do |detalle_mantenimiento|
      DmantenimientoHabitacion.using(:dwh).create(detalle_mantenimiento.serializable_hash)
    end
  end

  def copy_empleados
    empleados = Empleado.using(:dwh_t).where.not(error: true)
    Empleado.using(:dwh).delete_all
    empleados.each do |empleado|
      Empleado.using(:dwh).create(empleado.serializable_hash)
    end
  end

  def copy_empresas
    Empresa.using(:dwh).delete_all
    empresas = Empresa.using(:dwh_t).where.not(error: true)
    empresas.each do |empresa|
      Empresa.using(:dwh).create(empresa.serializable_hash)
    end
  end

  def copy_habitaciones
    EquipoHabitacion.using(:dwh).delete_all
    equipos_habitacion = EquipoHabitacion.using(:dwh_t).where.not(error: true)
    equipos_habitacion.each do |equipos_habitacion|
      EquipoHabitacion.using(:dwh).create(equipo_por_pedido.serializable_hash)
    end
  end

  def copy_equipo
    Equipo.using(:dwh).delete_all
    equipos = Equipo.using(:dwh_t).where.not(error: true)

    equipos.each do |equipo|
      Equipo.using(:dwh).create(equipo.serializable_hash)
    end
  end

  def copy_equipos_por_pedido
    EquipoPorPedido.using(:dwh).delete_all
    equipos_por_pedido = EquipoPorPedido.using(:dwh_t).where.not(error: true)
    equipos_por_pedido.each do |equipo_por_pedido|
      EquipoPorPedido.using(:dwh).create(equipo_por_pedido.serializable_hash)
    end
  end

  def copy_equipos_por_recibo
    EquipoPorRecibo.using(:dwh).delete_all
    equipos_por_recibo = EquipoPorRecibo.using(:dwh_t).where.not(error: true)
    equipos_por_recibo.each do |equipo_por_recibo|
      EquipoPorRecibo.using(:dwh).create(equipo_por_recibo.serializable_hash)
    end
  end

  def copy_facturas_hotel
    FacturaHotel.using(:dwh).delete_all
    facturas_hotel = FacturaHotel.using(:dwh_t).where.not(error: true)
    facturas_hotel.each do |factura_hotel|
      FacturaHotel.using(:dwh).create(factura_hotel.serializable_hash)
    end
  end

  def copy_facturas_restaurante
    FacturaRestaurante.using(:dwh).delete_all
    facturas_restaurante = FacturaRestaurante.using(:dwh_t).where.not(error: true)
    facturas_restaurante.each do |factura_restaurante|
      FacturaRestaurante.using(:dwh).create(factura_restaurante.serializable_hash)
    end
  end

  def copy_habitaciones
    Habitacion.using(:dwh).delete_all
    habitaciones = Habitacion.using(:dwh_t).where.not(error: true)
    habitaciones.each do |habitacio|
      Habitacion.using(:dwh).create(habitacio.serializable_hash)
    end
  end

  def copy_habitaciones_rentadas
    HabitacionRentada.using(:dwh).delete_all
    habitaciones_por_renta = HabitacionRentada.using(:dwh_t).where.not(error: true)
    habitaciones_por_renta.each do |haabitacion_por_renta|
      HabitacionRentada.using(:dwh).create(haabitacion_por_renta.serializable_hash)
    end
  end

  def copy_habitaciones_reservadas
    HabitacionReservada.using(:dwh).delete_all
    habitaciones_reservadas = HabitacionReservada.using(:dwh_t).where.not(error: true)
    habitaciones_reservadas.each do |habitacion_reservada|
      HabitacionReservada.using(:dwh).create(habitacion_reservada.serializable_hash)
    end
  end

  def copy_historial_de_servicios
    HistoricoServicio.using(:dwh).delete_all
    historial_de_servicios = HistoricoServicio.using(:dwh_t).where.not(error: true)
    historial_de_servicios.each do |historial|
      HistoricoServicio.using(:dwh).create(historial.serializable_hash)
    end
  end

  def copy_ingredientes
    Ingrediente.using(:dwh).delete_all
    ingredientes = Ingrediente.using(:dwh_t).where.not(error: true)
    ingredientes.each do |ingrediente|
      Ingrediente.using(:dwh).create(ingrediente.serializable_hash)
    end
  end

  def copy_ingredientes_por_bebida
    IngredientePorBebida.using(:dwh).delete_all
    ingredientes_por_bebida = IngredientePorBebida.using(:dwh_t).where.not(error: true)
    ingredientes_por_bebida.each do |ingrediente_por_bebida|
      IngredientePorBebida.using(:dwh).create(ingrediente_por_bebida.serializable_hash)
    end
  end

  def copy_ingrediente_por_platillo
    IngredientePorPlatillo.using(:dwh).delete_all
    ingredientes_por_platillo = IngredientePorPlatillo.using(:dwh_t).where.not(error: true)
    ingredientes_por_platillo.each do |platillo_por_platillo|
      IngredientePorPlatillo.using(:dwh).create(platillo_por_platillo.serializable_hash)
    end
  end

  def copy_ingredientes_por_proveedor
    IngredientePorProveedor.using(:dwh).delete_all
    ingredientes_por_proveedor = IngredientePorProveedor.using(:dwh_t).where.not(error: true)
    ingredientes_por_proveedor.each do |ingrediente_por_proveedor|
      IngredientePorProveedor.using(:dwh).create(ingrediente_por_proveedor.serializable_hash)
    end
  end

  def copy_mantenimientos
    Mantenimiento.using(:dwh).delete_all
    mantenimientos = Mantenimiento.using(:dwh_t).where.not(error: true)
    mantenimientos.each do |mantenimiento|
      Mantenimiento.using(:dwh).create(mantenimiento.serializable_hash)
    end
  end

  def copy_materiales
    Material.using(:dwh).delete_all
    materiales = Material.using(:dwh_t).where.not(error: true)
    materiales.each do |material|
      Material.using(:dwh).create(material.serializable_hash)
    end
  end

  def copy_materiales_por_pedido
    MaterialPorPedido.using(:dwh).delete_all
    materiales_por_pedido = MaterialPorPedido.using(:dwh_t).where.not(error: true)
    materiales_por_pedido.each do |material|
      Material.using(:dwh).create(material.serializable_hash)
    end
  end

  def copy_materiales_por_pedido
    MaterialPorRecibo.using(:dwh).delete_all
    materiales_por_recibo = MaterialPorRecibo.using(:dwh).where.not(error: true)
  end

  def copy_material_gastado_por_habitacion
    MgHabitacion.using(:dwh).delete_all
    materiales_gastados_por_habitacion = MgHabitacion.using(:dwh_t).where.not(error: true)
    materiales_gastados_por_habitacion.each do |material_gastado|
      MgHabitacion.using(:dwh).create(material_gastado.serializable_hash)
    end
  end

  def copy_mesas
    Mesa.using(:dwh).delete_all
    mesas = Mesa.using(:dwh_t).where.not(error: true)
    mesas.each do |mesa|
      Mesa.using(:dwh).create(mesa.serializable_hash)
    end
  end

  def copy_mesas_por_reservacion
    MesaPorReservacion.using(:dwh).delete_all
    mesas_por_reservacion = MesaPorReservacion.using(:dwh_t).where.not(error: true)
    mesas_por_reservacion.each do |mesa_por_reservacion|
      MesaPorReservacion.using(:dwh).create(mesa_por_reservacion.serializable_hash)
    end
  end

  def copy_ordenes_mantenimiento
    MantenimientoPorEquipo.using(:dwh).delete_all
    mantenimientos_por_equipo = MantenimientoPorEquipo.using(:dwh_t).where.not(error: true)
    mantenimientos_por_equipo.each do |mantenimiento_por_equipo|
      MantenimientoPorEquipo.using(:dwh).create(mantenimiento_por_equipo.serializable_hash)
    end
  end

  def copy_paquetes
    Paquete.using(:dwh).delete_all
    paquetes = Paquete.using(:dwh_t).where.not(error: true)
    paquetes.each do |paquete|
      Paquete.using(:dwh).create(paquete.serializable_hash)
    end
  end

  def copy_paquetes_vendidos_por_renta
    PaqueteVendidoRenta.using(:dwh).delete_all
    paquetes_por_renta = PaqueteVendidoRenta.using(:dwh_t).where.not(error: true)
    paquetes_por_renta.each do |paquete_por_renta|
      PaqueteVendidoRenta.using(:dwh).create(paquete_por_renta.serializable_hash)
    end
  end

  def copy_pedidos_por_empleado
    PedidoPorEmpleado.using(:dwh).delete_all
    pedidos_por_empleado = PedidoPorEmpleado.using(:dwh_t).where.not(error: true)
    pedidos_por_empleado.each do |pedido_por_emplado|
      PedidoPorEmpleado.using(:dwh).create(pedido_por_emplado.serializable_hash)
    end
  end

  def copy_platillos
    Platillo.using(:dwh).delete_all
    platillos = Platillo.using(:dwh_t).where.not(error: true)
    platillos.each do |platillo|
      Platillo.using(:dwh).create(platillo.serializable_hash)
    end
  end

  def copy_platillos_por_comanda
    PlatilloPorComanda.using(:dwh).delete_all
    platillos_por_comanda = PlatilloPorComanda.using(:dwh_t).where.not(error: true)
    platillos_por_comanda.each do |platillo_por_comanda|
      PlatilloPorComanda.using(:dwh).create(platillo_por_comanda.serializable_hash)
    end
  end

  def copy_postulantes
    Postulante.using(:dwh).delete_all
    postulantes = Postulante.using(:dwh_t).where.not(error: true)
    postulantes.each do |postulante|
      Postulante.using(:dwh).create(postulante.serializable_hash)
    end
  end

  def copy_programas_capacitacion
    ProgramaCapacitacion.using(:dwh).delete_all
    programas_de_capacitacion = ProgramaCapacitacion.using(:dwh_t).where.not(error: true)
    programas_de_capacitacion.each do |programa_capacitacion|
      ProgramaCapacitacion.using(:dwh).create(programa_capacitacion.serializable_hash)
    end
  end

  def copy_proveedores
    Proveedor.using(:dwh).delete_all
    proveedores = Proveedor.using(:dwh_t).where.not(error: true)
    proveedores.each do |proveedor|
      Proveedor.using(:dwh).create(proveedor.serializable_hash)
    end
  end

  def copy_recibos_de_compras
    ReciboDeCompra.using(:dwh).delete_all
    recibos_de_compras = ReciboDeCompra.using(:dwh_t).where.not(error: true)
    recibos_de_compras.each do |recibo_de_compra|
      ReciboDeCompra.using(:dwh).create(recibo_de_compra.serializable_hash)
    end
  end

  def copy_rentas
    Renta.using(:dwh).delete_all
    rentas = Renta.using(:dwh_t).where.not(error: true)
    rentas.each do |renta|
      Renta.using(:dwh).create(renta.serializable_hash)
    end
  end

  def copy_reporte_de_perdidas
    ReportePerdidaRobo.using(:dwh).delete_all
    reportes_de_perdida = ReportePerdidaRobo.using(:dwh_t).where.not(error: true)
    reportes_de_perdida.each do |reporte_de_perdida|
      ReportePerdidaRobo.using(:dwh).create(reporte_de_perdida.serializable_hash)
    end
  end

  # def copy_reservaciones
  #   Reservacion.using(:dwh).delete_all
  #   reservaciones = Reservacion.using(:dwh_t).where.not(error: true)
  #   reservaciones.each do |reservacion|
  #     Reservacion.using(:dwh).create(reservacion.serializable_hash)
  #   end
  # end

  def copy_reservacion_en_hotel
    ReservacionEnHotel.using(:dwh).delete_all
    reservaciones_en_hotel = ReservacionEnHotel.using(:dwh_t).where.not(error: true)
    reservaciones_en_hotel.each do |reservacion_en_hotel|
      ReservacionEnHotel.using(:dwh).create(reservacion_en_hotel.serializable_hash)
    end
  end

  def copy_reservacion_en_restaurante
    ReservacionEnRestaurante.using(:dwh).delete_all
    reservaciones_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).where.not(error: true)
    reservaciones_en_restaurante.each do |reservacion_en_restaurante|
      ReservacionEnRestaurante.using(:dwh).create(reservacion_en_restaurante.serializable_hash)
    end
  end

  def copy_servicios_por_habitacion
    ServicioHabitacion.using(:dwh).delete_all
    servicios_por_habitacion = ServicioHabitacion.using(:dwh_t).where.not(error: true)
    servicios_por_habitacion.each do |servicio_por_habitacion|
      ServicioHabitacion.using(:dwh).create(servicio_por_habitacion.serializable_hash)
    end
  end

  def copy_servicio_limpieza
    ServicioLimpieza.using(:dwh).delete_all
    servicios_de_limpieza = ServicioLimpieza.using(:dwh_t).where.not(error: true)
    servicios_de_limpieza.each do |servicio_de_limpieza|
      ServicioLimpieza.using(:dwh).create(servicio_de_limpieza.serializable_hash)
    end
  end

  def copy_serviciol_habitaciones
    ServiciolHabitacion.using(:dwh).delete_all
    serviciosl_habitacion = ServiciolHabitacion.using(:dwh_t).where.not(error: true)
    serviciosl_habitacion.each do |servicio_l|
      ServiciolHabitacion.using(:dwh).create(servicio_l.serializable_hash)
    end
  end

  def copy_servicios_a_domicilio
    ServicioADomicilio.using(:dwh).delete_all
    servicios_a_domicilio = ServicioADomicilio.using(:dwh_t).where.not(error: true)
    servicios_a_domicilio.each do |servicio_a_domicilio|
      ServicioADomicilio.using(:dwh).create(servicio_a_domicilio.serializable_hash)
    end
  end

  def copy_servicios
    Servicio.using(:dwh).delete_all
    servicios = Servicio.using(:dwh_t).where.not(error: true)
    servicios.each do |servicio|
      Servicio.using(:dwh).create(servicio.serializable_hash)
    end
  end

  def copy_servicios_por_paquete
    ServicioPaquete.using(:dwh).delete_all
    servicios_por_paquete = ServicioPaquete.using(:dwh_t).where.not(error: true)
    servicios_por_paquete.each do |servicio_por_paquete|
      ServicioPaquete.using(:dwh).create(servicio_por_paquete.serializable_hash)
    end
  end

  def copy_solicitudes_mantenimiento
    SolicitudMantenimiento.using(:dwh).delete_all
    solicitudes_de_mantenimiento = SolicitudMantenimiento.using(:dwh_t).where.not(error: true)
    solicitudes_de_mantenimiento.each do |solicitud_mantenimiento|
      SolicitudMantenimiento.using(:dwh).create(solicitud_mantenimiento.serializable_hash)
    end
  end

  def copy_tipos_productos
    TipoDeProducto.using(:dwh).delete_all
    tipos_de_producto = TipoDeProducto.using(:dwh_t).where.not(error: true)
    tipos_de_producto.each do |tipo_de_producto|
      TipoDeProducto.using(:dwh).create(tipo_de_producto.serializable_hash)
    end
  end

  def copy_tipos_medidas
    TipoMedida.using(:dwh).delete_all
    tipos_de_medidas = TipoMedida.using(:dwh_t).where.not(error: true)
    tipos_de_medidas.each do |tipo_medida|
      TipoMedida.using(:dwh).create(tipo_medida.serializable_hash)
    end
  end

  def copy_vacantes
    Vacante.using(:dwh).delete_all
    vacantes = Vacante.using(:dwh_t).where.not(error: true)
    vacantes.each do |vacante|
      Vacante.using(:dwh).create(vacante.serializable_hash)
    end
  end

end
