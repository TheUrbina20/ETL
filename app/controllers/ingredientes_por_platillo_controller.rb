class IngredientesPorPlatilloController < ApplicationController
  def index
    initialize_ingredientes_por_platillo
    @ingredientes_por_platillo = IngredientePorPlatillo.using(:dwh_t).all
  end

  def initialize_ingredientes_por_platillo
    IngredientePorPlatillo.using(:dwh_t).delete_all

    ingredientes_por_platillo = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Ingrediente_por_platillo']

    ingredientes_por_platillo.each do |ingrediente_por_platillo_r|
      ingrediente_por_platillo = IngredientePorPlatillo.using(:dwh_t).new

      ingrediente_por_platillo.id = ingrediente_por_platillo_r[:id]
      ingrediente_por_platillo.id_platillo = ingrediente_por_platillo_r[:id_platillo]
      ingrediente_por_platillo.id_producto = ingrediente_por_platillo_r[:id_producto]
      ingrediente_por_platillo.id_tipo_medida = ingrediente_por_platillo_r[:id_tipo_medida]
      ingrediente_por_platillo.cantidad = ingrediente_por_platillo_r[:cantidad]
      ingrediente_por_platillo.save!
    end
  end
end
