require 'roo'
require 'roo-xls'

class ExporterController < ApplicationController
  def new
    excel_file = Axlsx::Package.new
    workbook = excel_file.workbook


    workbook.add_worksheet(name: 'Accidentes laborales') do |sheet|
      sheet.add_row ['Id', 'Id Empleado', 'Fecha accidente']
      accidentes_laborales = AccidenteLaboral.using(:dwh).all
      accidentes_laborales.each do |accidente|
        sheet.add_row [accidente.id, accidente.id_empleado, accidente.f_accidente]
      end
    end

    workbook.add_worksheet(name: 'Asignacion_Materiales') do |sheet|
      sheet.add_row ['id', 'Cantidad', 'id_habitacion', 'id_material']

      asignacionmaterial = AsignacionMaterial.using(:dwh).all
      asignacionmaterial.each do |am|
        sheet.add_row [am.id, am.cantidad, am.id_habitacion, am.id_material]
      end
    end

    workbook.add_worksheet(name: 'Aplicaciones a vacantes') do |sheet|
      sheet.add_row ['id', 'id postulante', 'id vacante', 'Fecha aplicación', 'id empleado']
      aplicaciones_a_vacantes = AplicacionAVacante.using(:dwh).all
      aplicaciones_a_vacantes.each do |aplicacion|
        sheet.add_row [aplicacion.id, aplicacion.id_postulante, aplicacion.id_vacante, aplicacion.f_aplicacion, aplicacion.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Areas') do |sheet|
      sheet.add_row ['id', 'nombre', 'clave']
      areas = Area.using(:dwh).all
      areas.each do |area|
        sheet.add_row [area.id, area.nombre, area.clave]
      end
    end

    workbook.add_worksheet(name: 'Areas por empleado') do |sheet|
      sheet.add_row ['id', 'id area', 'id empleado', 'Fecha asignacion']
      areas_por_empleado = AreasPorEmpleado.using(:dwh).all
      areas_por_empleado.each do |area_por_empleado|
        sheet.add_row [area_por_empleado.id, area_por_empleado.id_area, area_por_empleado.id_empleado, area_por_empleado.f_asignacion]
      end
    end

    workbook.add_worksheet(name: 'Asistencias') do |sheet|
      sheet.add_row ['id', 'id empleado', 'Fecha', 'Hora entrada', 'Hora salida']
      asistencias = Asistencia.using(:dwh).all
      asistencias.each do |asistencia|
        sheet.add_row [asistencia.id, asistencia.id_empleado, asistencia.fecha, asistencia.hora_entrada, asistencia.hora_salida]
      end
    end

    workbook.add_worksheet(name: 'Bajas') do |sheet|
      sheet.add_row ['id', 'id articulo', 'Tipo', 'Fecha', 'Motivo']
      bajas = Baja.using(:dwh).all
      bajas.each do |baja|
        sheet.add_row [baja.id, baja.id_articulo, baja.tipo, baja.fecha, baja.motivo]
      end
    end

    workbook.add_worksheet(name: 'Bajas de empleados') do |sheet|
      sheet.add_row ['id', 'id empleado', 'Motivo']
      bajas_empleados = BajaEmpleado.using(:dwh).all
      bajas_empleados.each do |baja|
        sheet.add_row [ baja.id, baja.id_empleado, baja.motivo]
      end
    end

    workbook.add_worksheet(name: 'Bebidas') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'Nombre', 'Precio', 'Descripción']

      bebidas = Bebida.using(:dwh).all
      bebidas.each do |bebida|
        sheet.add_row [ bebida.id, bebida.nombre, bebida.precio, bebida.descripcion ]
      end
    end

    workbook.add_worksheet(name: 'Bebidas por comanda') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id comanda', 'id bebida', 'Cantidad']

      bebidascomanda = BebidaPorComanda.using(:dwh).all
      bebidascomanda.each do |bebida_por_comanda|
        sheet.add_row [ bebida_por_comanda.id, bebida_por_comanda.id_comanda, bebida_por_comanda.id_bebida, bebida_por_comanda.cantidad ]
      end
    end

    workbook.add_worksheet(name: 'Capacitaciones por empleado') do |sheet|
      sheet.add_row ['id', 'id programa', 'id empleado', 'Fecha inicio', 'Fecha fin', 'Estado']
      capacitaciones = CapacitacionPorEmpleado.using(:dwh).all
      capacitaciones.each do |capacitacion|
        sheet.add_row [capacitacion.id, capacitacion.id_programa, capacitacion.id_empleado, capacitacion.f_inicio, capacitacion.f_fin, capacitacion.estado]
      end
    end

    workbook.add_worksheet(name: 'Clientes') do |sheet|
      sheet.add_row ['id', 'Nombre', 'Estado', 'Correo', 'Teléfono']
      clientes = Cliente.using(:dwh).all
      clientes.each do |cliente|
        sheet.add_row [cliente.id, cliente.nombre, cliente.estado, cliente.correo, cliente.telefono]
      end
    end

    workbook.add_worksheet(name: 'Comandas') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id reservación', 'id empleado', 'Fecha', 'Hora']

      comandas = Comanda.using(:dwh).all
      comandas.each do |comanda|
        sheet.add_row [ comanda.id, comanda.id_reservacion, comanda.id_empleado, comanda.fecha, comanda.hora_reservacion ]
      end
    end

    workbook.add_worksheet(name: 'Detalle facturas restaurante') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id factura', 'id comanda', 'Fecha de emisión']

      detallefactrestau = DetalleDeFacturaRestaurante.using(:dwh).all
      detallefactrestau.each do |detalle_de_factura_restaurante|
        sheet.add_row [ detalle_de_factura_restaurante.id, detalle_de_factura_restaurante.id_factura, detalle_de_factura_restaurante.id_comanda, detalle_de_factura_restaurante.fecha_emision  ]
      end
    end

    workbook.add_worksheet(name: 'Detalles de factura hotel') do |sheet|
      sheet.add_row ['id', 'Cantidad', 'Total' , 'id_factura', 'id_servicio_hotel']

      detalle = DetalleDeFacturaHotel.using(:dwh).all
      detalle.each do |d|
        sheet.add_row [d.id, d.cantidad, d.total, d.id_factura, d.id_servicio_hotel]
      end
    end

    workbook.add_worksheet(name: 'Equipos') do |sheet|
      sheet.add_row ['id','id sistema', 'sistema', 'Nombre', 'Modelo']
      equipos = Equipo.using(:dwh).all
      equipos.each do |equipo|
        sheet.add_row [equipo.id, equipo.id_sistema, equipo.sistema, equipo.nombre, equipo.modelo]
      end
    end

    workbook.add_worksheet(name: 'Equipos por habitaciones') do |sheet|
      sheet.add_row ['id', 'id_equipo', 'id_habitacion']

      equipohabitacion = EquipoHabitacion.using(:dwh).all
      equipohabitacion.each do |eh|
        sheet.add_row [eh.id, eh.idEquipo, eh.idHabitacion]
      end
    end

    workbook.add_worksheet(name: 'Equipos por pedido') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'id equipo', 'id pedido']
      equipos_por_pedido = EquipoPorPedido.using(:dwh).all
      equipos_por_pedido.each do |equipo|
        sheet.add_row [equipo.id, equipo.id_sistema, equipo.sistema, equipo.id_pedido]
      end
    end

    workbook.add_worksheet(name: 'Equipo por recibo') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'id equipos', 'id recibo', '# serie', 'Fecha final garantía']
      equipos_por_recibo = EquipoPorRecibo.using(:dwh).all
      equipos_por_recibo.each do |equipo|
        sheet.add_row [equipo.id, equipo.id_sistema, equipo.sistema, equipo.id_equipo, equipo.n_serie, equipo.f_finalizacion_garantia]
      end
    end

    workbook.add_worksheet(name: 'Empleado') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'Nombre','Fecha nacimiento', 'Correo electrónico', '# teléfono', 'Genero', 'RFC', 'Baja', 'Fecha ingreso']
      empleados = Empleado.using(:dwh).all
      empleados.each do |empleado|
        sheet.add_row [empleado.id, empleado.id_sistema, empleado.sistema, empleado.nombre, empleado.f_nacimiento, empleado.c_electronico, empleado.n_telefono, empleado.genero, empleado.rfc, empleado.baja, empleado.f_ingreso]
      end
    end

    workbook.add_worksheet(name: 'Empresas') do |sheet|
      sheet.add_row ['id', 'Nombre']
      empresas = Empresa.using(:dwh).all
      empresas.each do |empresa|
        sheet.add_row [empresa.id, empresa.nombre]
      end
    end

    workbook.add_worksheet(name: 'Facturas de hotel') do |sheet|
      sheet.add_row ['id', 'id_cliente', 'id_empleado', 'Total' , 'FechaEmision', 'TipoPago', 'id_renta']

      factura = FacturaHotel.using(:dwh).all
      factura.each do |f|
        sheet.add_row [f.id, f.id_cliente, f.id_empleado, f.total, f.fecha_emision, f.tipo_pago, f.id_renta]
      end
    end

    workbook.add_worksheet(name: 'Facturas de Restaurante') do |sheet|
      sheet.add_row ['id', 'id cliente', 'Fecha emisión', 'Tipo pago']
      facturas = FacturaRestaurante.using(:dwh).all
      facturas.each do |factura|
        sheet.add_row [factura.id, factura.id_cliente, factura.fecha_emision, factura.tipo_pago]
      end
    end

    workbook.add_worksheet(name: 'Habitaciones') do |sheet|
      sheet.add_row ['id', 'tipo_habitacion', 'Estado']

      habitaciones = Habitacion.using(:dwh).all
      habitaciones.each do |h|
        sheet.add_row [h.id, h.tipo_habitacion, h.estado]
      end
    end

    workbook.add_worksheet(name: 'Habitaciones rentadas') do |sheet|
      sheet.add_row ['id', 'id_renta', 'id_habitacion']

      habitaciones = HabitacionRentada.using(:dwh).all
      habitaciones.each do |h|
        sheet.add_row [h.id, h.id_renta, h.id_habitacion]
      end
    end

    workbook.add_worksheet(name: 'Habitaciones reservada') do |sheet|
      sheet.add_row ['id', 'id_reservacion', 'id_habitacion']

      habitaciones = HabitacionReservada.using(:dwh).all
      habitaciones.each do |h|
        sheet.add_row [h.id, h.id_reservacion, h.id_habitacion]
      end
    end

    workbook.add_worksheet(name: 'Historial de servicios') do |sheet|
      sheet.add_row ['id', 'Precio', 'FechaInicio', 'FechaTermino', 'id_servicio']

      historico = HistoricoServicio.using(:dwh).all
      historico.each do |h|
        sheet.add_row [h.id, h.precio, h.f_inicio, h.f_termino, h.id_servicio]
      end
    end

    workbook.add_worksheet(name: 'Ingredientes') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'Nombre', 'Stock minimo', 'Stock maximo', 'Cantidad stock', 'id tipo', 'id tipo cantidad']

      ingredientes = Ingrediente.using(:dwh).all
      ingredientes.each do |ingrediente|
        sheet.add_row [ ingrediente.id, ingrediente.nombre, ingrediente.stock_minimo, ingrediente.stock_maximo, ingrediente.cantidad_stock, ingrediente.id_tipo, ingrediente.id_tipo_cantidad ]
      end
    end

    workbook.add_worksheet(name: 'Ingredientes por bebida') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id bebida', 'id producto', 'id tipo medida', 'Cantidad']

      ingredientesbebida = IngredientePorBebida.using(:dwh).all
      ingredientesbebida.each do |ingrediente_por_bebida|
        sheet.add_row [ ingrediente_por_bebida.id, ingrediente_por_bebida.id_bebida, ingrediente_por_bebida.id_producto, ingrediente_por_bebida.id_tipo_medida, ingrediente_por_bebida.cantidad ]
      end
    end

    workbook.add_worksheet(name: 'Ingredientes por platillo') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id platillo', 'id producto', 'id tipo medida', 'Cantidad']

      ingredientesplatillo =  IngredientePorPlatillo.using(:dwh).all
      ingredientesplatillo.each do |ingrediente_por_platillo|
        sheet.add_row [ ingrediente_por_platillo.id, ingrediente_por_platillo.id_platillo, ingrediente_por_platillo.id_producto, ingrediente_por_platillo.id_tipo_medida, ingrediente_por_platillo.cantidad ]
      end
    end

    workbook.add_worksheet(name: 'Ingredientes por proveedor') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id proveedor', 'id ingrediente', 'Precio']

      ingredienteproveedor = IngredientePorProveedor.using(:dwh).all
      ingredienteproveedor.each do |ingrediente_por_proveedor|
        sheet.add_row [ ingrediente_por_proveedor.id, ingrediente_por_proveedor.id_proveedor, ingrediente_por_proveedor.id_ingrediente, ingrediente_por_proveedor.precio]
      end
    end

    workbook.add_worksheet(name: 'Mantenimientos por habitacion') do |sheet|
      sheet.add_row ['id', 'Tipo']
      mantenimientos = Mantenimiento.using(:dwh).all
      mantenimientos.each do |mantenimiento|
        sheet.add_row [mantenimiento.id, mantenimiento.tipo]
      end
    end

    workbook.add_worksheet(name: 'Materiales') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id sistema', 'Sistema', 'Nombre', 'Stock maximo', 'Stock mínimo', 'Cantidad en stock']

      materiales = Material.using(:dwh).all
      materiales.each do |material|
        sheet.add_row [ material.id, material.id_sistema, material.sistema, material.nombre, material.stock_max, material.stock_min, material.cantidad_stock ]
      end
    end

    workbook.add_worksheet(name: 'Materiales por pedido') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'cantidad', 'id pedido']
      materiales = MaterialPorPedido.using(:dwh).all
      materiales.each do |material|
        sheet.add_row [material.id, material.id_sistema, material.sistema, material.cantidad, material.id_pedido]
      end
    end

    workbook.add_worksheet(name: 'Materiales por recibo') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'id material', 'Cantidad', 'Fecha caducidad', 'Tipo ´paquete']
      materiales = MaterialPorRecibo.using(:dwh).all
      materiales.each do |material|
        sheet.add_ro [material.id, material.id_sistema, material.sistem, material.id_material, material.cantidad, material.f_caducidad, material.tipo_paquete]
      end
    end

    # workbook.add_worksheet(name: 'Material gastado por habitación') do |sheet|
    #   sheet.add_row ['']
    # end

    workbook.add_worksheet(name: 'Mesas') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'Numero', 'Capacidad']

      mesas = Mesa.using(:dwh).all
      mesas.each do |mesa|
        sheet.add_row [ mesa.id, mesa.numero, mesa.capacidad ]
      end
    end

    workbook.add_worksheet(name: 'Mesas por reservación') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id reservación', 'id mesa', 'Estado']

      mesareservacion = MesaPorReservacion.using(:dwh).all
      mesareservacion.each do |mesa_por_reservacion|
        sheet.add_row [ mesa_por_reservacion.id, mesa_por_reservacion.id_reservacion, mesa_por_reservacion.id_mesa, mesa_por_reservacion.estado ]
      end
    end

    workbook.add_worksheet(name: 'Ordenes de mantenimiento') do |sheet|
      sheet.add_row ['id', 'id_sistema', 'Sistema', 'Fecha inicio', 'Fecha termino', 'id equipo', 'Tipo mantenimiento', 'id empleado', 'Tipo']
      mantenimientos = MantenimientoPorEquipo.using(:dwh).all
      mantenimientos.each do |mantenimiento|
        sheet.add_row [mantenimiento.id, mantenimiento.id_sistema, mantenimiento.sistema, mantenimiento.f_inicio, mantenimiento.f_termino, mantenimiento.id_equipo, mantenimiento.tipo_mantenimiento, mantenimiento.id_empleado, mantenimiento.tipo]
      end
    end

    workbook.add_worksheet(name: 'Pedidos por empleado') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'Fecha peticion', 'estado', 'id empleado']
      pedidos = PedidoPorEmpleado.using(:dwh).all
      pedidos.each do |pedido|
        sheet.add_row [pedido.id, pedido.id_sistema, pedido.sistema, pedido.f_peticion, pedido.estado, pedido.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Paquetes') do |sheet|
      sheet.add_row ['id', 'Nombre', 'Descripcion']

      paquete = Paquete.using(:dwh).all
      paquete.each do |pa|
        sheet.add_row [pa.id, pa.nombre, pa.descripcion]
      end
    end

    workbook.add_worksheet(name: 'Paquetes vendidos por renta') do |sheet|
      sheet.add_row ['id', 'id_paquete', 'id_renta', 'id_empleado']

      paquete = PaqueteVendidoRenta.using(:dwh).all
      paquete.each do |pa|
        sheet.add_row [pa.id, pa.id_paquete, pa.id_renta, pa.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Platillos') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'Nombre', 'Precio', 'Descripción']

      platillos = Platillo.using(:dwh).all
      platillos.each do |platillo|
        sheet.add_row [ platillo.id, platillo.nombre, platillo.precio, platillo.descripcion ]
      end
    end

    workbook.add_worksheet(name: 'Platillos por comanda') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id platillo', 'id comanda', 'Cantidad']

      platilloscomanda = PlatilloPorComanda.using(:dwh).all
      platilloscomanda.each do |platillo_por_comanda|
        sheet.add_row [ platillo_por_comanda.id, platillo_por_comanda.id_platillo, platillo_por_comanda.id_comanda, platillo_por_comanda.cantidad ]
      end
    end

    workbook.add_worksheet(name: 'Postulantes') do |sheet|
      sheet.add_row ['id', 'Nombre', 'Estado']
      postulantes = Postulante.using(:dwh).all
      postulantes.each do |postulante|
        sheet.add_row [postulante.id, postulante.nombre, postulante.estado]
      end
    end

    workbook.add_worksheet(name: 'Programas de capacitación') do |sheet|
      sheet.add_row ['id', 'id empresa', 'Nombre', 'Costo', 'Duración']
      programas = ProgramaCapacitacion.using(:dwh).all
      programas.each do |programa|
        sheet.add_row [programa.id, programa.id_empresa, programa.nombre, programa.costo, programa.duracion]
      end
    end

    workbook.add_worksheet(name: 'Proveedores') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'id empresa', 'Nombre']
      proveedores = Proveedor.using(:dwh).all
      proveedores.each do |proveedor|
        sheet.add_row [proveedor.id, proveedor.id_sistema, proveedor.sistema, proveedor.id_empresa, proveedor.nombre]
      end
    end

    workbook.add_worksheet(name: 'Recibos de compra') do |sheet|
      sheet.add_row ['id', 'id sistema', 'sistema', 'id pedido', 'Fecha entrega']
      recibos = ReciboDeCompra.using(:dwh).all
      recibos.each do |recibo|
        sheet.add_row [recibo.id, recibo.id_sistema, recibo.sistema, recibo. id_pedido_compra, recibo.f_entrega]
      end
    end

    workbook.add_worksheet(name: 'Rentas Hotel') do |sheet|
      sheet.add_row ['id', 'id_cliente', 'id_reservacion', 'id_empleado', 'f_entrada', 'f_salida']

      renta = Renta.using(:dwh).all
      renta.each do |r|
        sheet.add_row [r.id, r.id_cliente, r.id_reservacion, r.id_empleado, r.f_entrada, r.f_salida]
      end
    end

    workbook.add_worksheet(name: 'Reservaciones en hotel') do |sheet|
      sheet.add_row ['id', 'FechaEntrada', 'FechaSalida', 'FechaReservacion', 'Estado', 'id_cliente', 'id_empleado']

      reservacion = ReservacionEnHotel.using(:dwh).all
      reservacion.each do |r|
        sheet.add_row [r.id, r.f_entrada, r.f_salida, r.f_reservacion, r.estado, r.id_cliente, r.id_empleado]
      end
    end

    # workbook.add_worksheet(name: 'Reservaciones') do |sheet|
    #   sheet.add_row ['id', 'FechaEntrada', 'FechaSalida', 'FechaReservacion', 'Estado', 'id_cliente', 'id_empleado']

    #   reservacion = ReservacionEnHotel.using(:dwh).all
    #   reservacion.each do |r|
    #     sheet.add_row [r.id, r.f_entrada, r.f_salida, r.f_reservacion, r.estado, r.id_cliente, r.id_empleado]
    #   end
    # end

    workbook.add_worksheet(name: 'Reservación mesa') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id reservación', 'id mesa', 'Estado']

      reservacionmesa = ReservacionPorMesa.using(:dwh).all
      reservacionmesa.each do |reservacion_por_mesa|
        sheet.add_row [ reservacion_por_mesa.id, reservacion_por_mesa.id_reservacion, reservacion_por_mesa.id_mesa, reservacion_por_mesa.estado ]
      end
    end

    workbook.add_worksheet(name: 'Reporte perdida robo') do |sheet|
      sheet.add_row ['id', 'Cantidad', 'Fecha', 'id_servicio_limpieza', 'id_habitacion', 'id_empleado', 'id_material']

      reporte = ReportePerdidaRobo.using(:dwh).all
      reporte.each do |r|
        sheet.add_row [r.id, r.cantidad, r.fecha, r.id_servicio_limpieza, r.id_habitacion, r.id_empleado, r.id_material]
      end
    end

    workbook.add_worksheet(name: 'Servicios') do |sheet|
      sheet.add_row ['id', 'Nombre']

      servicio = Servicio.using(:dwh).all
      servicio.each do |s|
        sheet.add_row [s.id, s.nombre]
      end
    end

    workbook.add_worksheet(name: 'Servicios por habitaciones') do |sheet|
      sheet.add_row ['id', 'id_habitacion_rentada', 'id_renta', 'id_historico_servicio', 'id_empleado']

      servicio = ServicioHabitacion.using(:dwh).all
      servicio.each do |s|
        sheet.add_row [s.id, s.id_habitacion_rentada, s.id_renta, s.id_historico_servicio, s.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Servicios de limpieza') do |sheet|
      sheet.add_row ['id', 'Nombre']

      servicio = ServicioLimpieza.using(:dwh).all
      servicio.each do |s|
        sheet.add_row [s.id, s.nombre]
      end
    end

    workbook.add_worksheet(name: 'Servicio de limpieza-habitacion') do |sheet|
      sheet.add_row ['id', 'Fecha', 'id_servicio_limpieza', 'id_habitacion', 'id_empleado']

      servicio = ServiciolHabitacion.using(:dwh).all
      servicio.each do |s|
        sheet.add_row [s.id, s.fecha, s.id_servicio_limpieza, s.id_habitacion, s.id_empleado]
      end
    end


    workbook.add_worksheet(name: 'Servicios por paquete') do |sheet|
      sheet.add_row ['id', 'id_historico_servicio', 'id_paquete']

      servicio = ServicioPaquete.using(:dwh).all
      servicio.each do |s|
        sheet.add_row [s.id, s.id_historico_servicio, s.id_paquete  ]
      end
    end


    workbook.add_worksheet(name: 'Servicios a hotel') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id habitación', 'Fecha']

      servicioshotel = ServicioADomicilio.using(:dwh).all
      servicioshotel.each do |servicio_a_domicilio|
        sheet.add_row [ servicio_a_domicilio.id, servicio_a_domicilio.id_habitacion, servicio_a_domicilio.fecha ]
      end
    end

    workbook.add_worksheet(name: 'Tipos de producto') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'Tipo']

      tiposproducto = TipoDeProducto.using(:dwh).all
      tiposproducto.each do |tipo_de_producto|
        sheet.add_row [ tipo_de_producto.id, tipo_de_producto.tipo ]
      end
    end

    workbook.add_worksheet(name: 'Tipos de medidas') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'Nombre']

      tiposmedidas = TipoMedida.using(:dwh).all
      tiposmedidas.each do |tipo_medida|
        sheet.add_row [ tipo_medida.id, tipo_medida.nombre ]
      end
    end

    workbook.add_worksheet(name: 'Tipos de habitaciones') do |sheet|
      sheet.add_row ['id', 'Nombre', 'Precio']

      tipo = Dhabitacion.using(:dwh).all
      tipo.each do |t|
        sheet.add_row [t.id, t.nombre, t.precio]
      end
    end


    workbook.add_worksheet(name: 'Vacantes') do |sheet|
      sheet.add_row ['id', 'Nombre', 'Estado']
      vacantes = Vacante.using(:dwh).all
      vacantes.each do |vacante|
        sheet.add_row [vacante.id, vacante.nombre, vacante.estado]
      end
    end

    # workbook.add_worksheet(name: 'Materiales_por_Habitacion') do |sheet|
    #   sheet.add_row ['id', 'id_servicio_limpieza', 'id_material', 'Cantidad']

    #   material = MgHabitacion.using(:dwh).all
    #   material.each do |m|
    #     sheet.add_row [m.id, m.id_servicio_limpieza, m.id_material_por_recibo, m.cantidad]
    #   end
    # end

    excel_file.serialize('data_warehouse.xlsx')
    send_file('data_warehouse.xlsx', filename: 'data_warehouse.xlsx')
  end
end
