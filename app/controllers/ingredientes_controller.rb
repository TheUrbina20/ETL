class IngredientesController < ApplicationController
  def index
    initialize_ingredientes
    @ingredientes = Ingrediente.using(:dwh_t).all
  end

  def initialize_ingredientes
    Ingrediente.using(:dwh_t).delete_all

    ingredientes = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Productos']

    ingredientes.each do |ingrediente_r|
      ingrediente = Ingrediente.using(:dwh_t).new

      ingrediente.id = ingrediente_r[:Id]
      ingrediente.id_tipo = ingrediente_r[:id_tipo_p]
      ingrediente.id_tipo_cantidad = ingrediente_r[:id_tipo_cad]
      ingrediente.nombre = ingrediente_r[:nombre]
      ingrediente.stock_minimo = ingrediente_r[:stock_min]
      ingrediente.stock_maximo = ingrediente_r[:stock_max]
      ingrediente.cantidad_stock = ingrediente_r[:cantidad]
      ingrediente.save!

    end
  end
end
