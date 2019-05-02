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


    excel_file.serialize('data_warehouse.xlsx')
    send_file('data_warehouse.xlsx', filename: 'data_warehouse.xlsx')
  end
end
