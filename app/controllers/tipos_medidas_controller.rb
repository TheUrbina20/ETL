class TiposMedidasController < ApplicationController
  def index
    initialize_tipos_medidas
    @tipos_medidas = TipoMedida.using(:dwh_t).all
  end

  def initialize_tipos_medidas
    TipoMedida.using(:dwh_t).delete_all

    tipos_medidas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Tipo_medida']

    tipos_medidas.each do |tipo_medida_r|
      tipo_medida = TipoMedida.using(:dwh_t).new
      tipo_medida.id = tipo_medida_r[:Id]
      tipo_medida.nombre = tipo_medida_r[:nombre]
      tipo_medida.save!
    end
  end
end
