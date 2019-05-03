require 'roo'
require 'roo-xls'

class ExporterController < ApplicationController
  def new
    excel_file = Axlsx::Package.new
    workbook = excel_file.workbook

    # cascaron del proceso
    workbook.add_worksheet(name: 'Materiales') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id sistema', 'Sistema', 'Nombre', 'Stock maximo', 'Stock mínimo', 'Cantidad en stock']

      materiales = Material.using(:dwh_t).all
      materiales.each do |material|
        sheet.add_row [ material.id, material.id_sistema, material.sistema, material.nombre, material.stock_max, material.stock_min, material.cantidad_stock ]
      end
    end

    workbook.add_worksheet(name: 'Asignacion_Materiales') do |sheet|
      sheet.add_row ['id', 'Cantidad', 'id_habitacion', 'id_material']
      
      asignacionmaterial = AsignacionMaterial.using(:dwh_t).all
      asignacionmaterial.each do |am|
        sheet.add_row [am.id, am.cantidad, am.id_habitacion, am.id_material]
      end
    end

    workbook.add_worksheet(name: 'Detalle_Factura_hotel') do |sheet|
      sheet.add_row ['id', 'Cantidad', 'Total', 'id_factura', 'id_servicio_hotel']
      
      detalle = DetalleDeFacturaHotel.using(:dwh_t).all
      detalle.each do |d|
        sheet.add_row [d.id, d.cantidad, d.total, d.id_factura, d.id_servicio_hotel]
      end
    end

    workbook.add_worksheet(name: 'Tipos_Habitaciones') do |sheet|
      sheet.add_row ['id', 'Nombre', 'Precio']
      
      tipo = Dhabitacion.using(:dwh_t).all
      tipo.each do |t|
        sheet.add_row [t.id, t.nombre, t.precio]
      end
    end

    workbook.add_worksheet(name: 'Equipo_Por_Habitaciones') do |sheet|
      sheet.add_row ['id', 'id_equipo', 'id_habitacion']
      
      equipohabitacion = EquipoHabitacion.using(:dwh_t).all
      equipohabitacion.each do |eh|
        sheet.add_row [eh.id, eh.idEquipo, eh.idHabitacion]
      end
    end

    workbook.add_worksheet(name: 'Facturas_Hotel') do |sheet|
      sheet.add_row ['id', 'id_cliente', 'id_empleado', 'Total', 'FechaEmision', 'TipoPago', 'id_renta']
      
      factura = FacturaHotel.using(:dwh_t).all
      factura.each do |f|
        sheet.add_row [f.id, f.id_cliente, f.id_empleado, f.total, f.fecha_emision, f.tipo_pago, f.id_renta]
      end
    end

    workbook.add_worksheet(name: 'Habitaciones') do |sheet|
      sheet.add_row ['id', 'tipo_habitacion', 'Estado']
      
      habitaciones = Habitacion.using(:dwh_t).all
      habitaciones.each do |h|
        sheet.add_row [h.id, h.tipo_habitacion, h.estado]
      end
    end

    workbook.add_worksheet(name: 'Habitaciones_Rentadas') do |sheet|
      sheet.add_row ['id', 'id_renta', 'id_habitacion']
      
      habitaciones = HabitacionRentada.using(:dwh_t).all
      habitaciones.each do |h|
        sheet.add_row [h.id, h.id_renta, h.id_habitacion]
      end
    end

    workbook.add_worksheet(name: 'Habitacion_Reservada') do |sheet|
      sheet.add_row ['id', 'id_reservacion', 'id_habitacion']
      
      habitaciones = HabitacionReservada.using(:dwh_t).all
      habitaciones.each do |h|
        sheet.add_row [h.id, h.id_reservacion, h.id_habitacion]
      end
    end

    workbook.add_worksheet(name: 'Historico_Servicios') do |sheet|
      sheet.add_row ['id', 'Precio', 'FechaInicio', 'FechaTermino', 'id_servicio']
      
      historico = HistoricoServicio.using(:dwh_t).all
      historico.each do |h|
        sheet.add_row [h.id, h.precio, h.f_inicio, h.f_termino, h.id_servicio]
      end
    end

    workbook.add_worksheet(name: 'Materiales_por_Habitacion') do |sheet|
      sheet.add_row ['id', 'id_servicio_limpieza', 'id_material', 'Cantidad']
      
      material = MgHabitacion.using(:dwh_t).all
      material.each do |m|
        sheet.add_row [m.id, m.id_servicio_limpieza, m.id_material_por_recibo, m.cantidad]
      end
    end

    workbook.add_worksheet(name: 'Paquetes') do |sheet|
      sheet.add_row ['id', 'Nombre', 'Descripcion']
      
      paquete = Paquete.using(:dwh_t).all
      paquete.each do |pa|
        sheet.add_row [pa.id, pa.nombre, pa.descripcion]
      end
    end

    workbook.add_worksheet(name: 'Paquetes_Vendidos_por_Renta') do |sheet|
      sheet.add_row ['id', 'id_paquete', 'id_renta', 'id_empleado']
      
      paquete = PaqueteVendidoRenta.using(:dwh_t).all
      paquete.each do |pa|
        sheet.add_row [pa.id, pa.id_paquete, pa.id_renta, pa.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Rentas_Hotel') do |sheet|
      sheet.add_row ['id', 'id_cliente', 'id_reservacion', 'id_empleado', 'f_entrada', 'f_salida']
      
      renta = Renta.using(:dwh_t).all
      renta.each do |r|
        sheet.add_row [r.id, r.id_cliente, r.id_reservacion, r.id_empleado, r.f_entrada, r.f_salida]
      end
    end

    workbook.add_worksheet(name: 'Reporte_Perdida_Robo') do |sheet|
      sheet.add_row ['id', 'Cantidad', 'Fecha', 'id_servicio_limpieza', 'id_habitacion', 'id_empleado', 'id_material']
      
      reporte = ReportePerdidaRobo.using(:dwh_t).all
      reporte.each do |r|
        sheet.add_row [r.id, r.cantidad, r.fecha, r.id_servicio_limpieza, r.id_habitacion, r.id_empleado, r.id_material]
      end
    end

    workbook.add_worksheet(name: 'Reservaciones_en_Hotel') do |sheet|
      sheet.add_row ['id', 'FechaEntrada', 'FechaSalida', 'FechaReservacion', 'Estado', 'id_cliente', 'id_empleado']
      
      reservacion = ReservacionEnHotel.using(:dwh_t).all
      reservacion.each do |r|
        sheet.add_row [r.id, r.f_entrada, r.f_salida, r.f_reservacion, r.estado, r.id_cliente, r.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Reservaciones') do |sheet|
      sheet.add_row ['id', 'FechaEntrada', 'FechaSalida', 'FechaReservacion', 'Estado', 'id_cliente', 'id_empleado']
      
      reservacion = ReservacionEnHotel.using(:dwh_t).all
      reservacion.each do |r|
        sheet.add_row [r.id, r.f_entrada, r.f_salida, r.f_reservacion, r.estado, r.id_cliente, r.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Servicios') do |sheet|
      sheet.add_row ['id', 'Nombre']
      
      servicio = Servicio.using(:dwh_t).all
      servicio.each do |s|
        sheet.add_row [s.id, s.nombre]
      end
    end

    workbook.add_worksheet(name: 'Servicios_por_Habitaciones') do |sheet|
      sheet.add_row ['id', 'id_habitacion_rentada', 'id_renta', 'id_historico_servicio', 'id_empleado']
      
      servicio = ServicioHabitacion.using(:dwh_t).all
      servicio.each do |s|
        sheet.add_row [s.id, s.id_habitacion_rentada, s.id_renta, s.id_historico_servicio, s.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Servicios_Limpieza') do |sheet|
      sheet.add_row ['id', 'Nombre']
      
      servicio = ServicioLimpieza.using(:dwh_t).all
      servicio.each do |s|
        sheet.add_row [s.id, s.nombre]
      end
    end

    workbook.add_worksheet(name: 'Servicio_Limpieza_habitacion') do |sheet|
      sheet.add_row ['id', 'Fecha', 'id_servicio_limpieza', 'id_habitacion', 'id_empleado']
      
      servicio = ServiciolHabitacion.using(:dwh_t).all
      servicio.each do |s|
        sheet.add_row [s.id, s.fecha, s.id_servicio_limpieza, s.id_habitacion, s.id_empleado]
      end
    end

    workbook.add_worksheet(name: 'Servicios_por_Paquete') do |sheet|
      sheet.add_row ['id', 'id_historico_servicio', 'id_paquete']
      
      servicio = ServicioPaquete.using(:dwh_t).all
      servicio.each do |s|
        sheet.add_row [s.id, s.id_historico_servicio, s.id_paquete  ]
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

    workbook.add_worksheet(name: 'Bebidas') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'Nombre', 'Precio', 'Descripción']

      bebidas = Bebida.using(:dwh).all
      bebidas.each do |bebida|
        sheet.add_row [ bebida.id, bebida.nombre, bebida.precio, bebida.descripcion ]
      end
    end

    workbook.add_worksheet(name: 'Comandas') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id reservación', 'id empleado', 'Fecha', 'Hora']

      comandas = Comanda.using(:dwh).all
      comandas.each do |comanda|
        sheet.add_row [ comanda.id, comanda.id_reservacion, comanda.id_empleado, comanda.fecha, comanda.hora ]
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

    workbook.add_worksheet(name: 'Reservación mesa') do |sheet|
      #obtener los registros
      sheet.add_row ['id', 'id reservación', 'id mesa', 'Estado']

      reservacionmesa = ReservacionPorMesa.using(:dwh).all
      reservacionmesa.each do |reservacion_por_mesa|
        sheet.add_row [ reservacion_por_mesa.id, reservacion_por_mesa.id_reservacion, reservacion_por_mesa.id_mesa, reservacion_por_mesa.estado ]
      end
    end
   
    workbook.add_worksheet(name: 'Servicio hotel') do |sheet|
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
        sheet.add_row [ tipo_de_producto.id, tipo_de_producto.id_tipo ]
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




    excel_file.serialize('data_warehouse.xlsx')
    send_file('data_warehouse.xlsx', filename: 'data_warehouse.xlsx')
  end
end
