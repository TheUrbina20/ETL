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


    excel_file.serialize('data_warehouse.xlsx')
    send_file('data_warehouse.xlsx', filename: 'data_warehouse.xlsx')
  end
end
