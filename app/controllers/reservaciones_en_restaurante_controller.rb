class ReservacionesEnRestauranteController < ApplicationController
  def index
    initialize_reservaciones_en_restaurante
    @reservaciones_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).all
  end

  def initialize_reservaciones_en_restaurante
    ReservacionEnRestaurante.using(:dwh_t).delete_all

    reservaciones_en_restaurante = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Reservacion']

    reservaciones_en_restaurante.each do |reservacion_en_restaurante_r|
      reservacion_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).new

      reservacion_en_restaurante.id = reservacion_en_restaurante_r[:Id]
      reservacion_en_restaurante.f_reservacion = reservacion_en_restaurante_r[:fecha_reservacion]
      reservacion_en_restaurante.hora = reservacion_en_restaurante_r[:hora]
      reservacion_en_restaurante.id_cliente = reservacion_en_restaurante_r[:id_cliente]
      reservacion_en_restaurante.id_empleado = reservacion_en_restaurante_r[:id_empleado]
      reservacion_en_restaurante.save!
    end
  end
end
