require 'roo'
require 'roo-xls'

class ExporterController < ApplicationController
  def new

    file = Roo::Spreadsheet.open(Rails.root.join('public', 'export.xlsx').to_s)
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(:name => "Basic Worksheet") do |sheet|
      sheet.add_row ["First Column", "Second", "Third"]
      sheet.add_row [1, 2, 3]
      sheet.add_row ['     preserving whitespace']
    end

    p.serialize("example.xlsx")

    # file.sheet('accidentes_laborales')
    # AccidenteLaboral.using(:dwh_t).all.each_with_index do |accidente, index|
    #   file.sheet('accidentes_laborales').row(index) = [accidente.id, accidente. id_empleado, accidente.f_accidente]
    # end

    redirect_to root_path
  end
end
