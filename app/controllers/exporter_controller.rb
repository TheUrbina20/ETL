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

      materiales = Material.using(:dwh).all
      materiales.each do |material|
        sheet.add_row [ material.id, material.id_sistema, material.sistema, material.nombre, material.stock_max, material.stock_min, material.cantidad_stock ]
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
