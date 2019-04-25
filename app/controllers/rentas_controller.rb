class RentasController < ApplicationController
  def index
    initialize_rentas

    @rentas = Renta.using(:dwh_t).all
  end

  def initialize_rentas
    Renta.using(:dwh_t).delete_all
    rentas = Renta.using(:restaurant).all
    renta = Renta.using(:dwh_t).new()

    rentas.each do |renta_r|
      renta = Renta.using(:dwh_t).new()

      renta.id = renta_r.id
      renta.id_cliente = renta_r.idCliente
      renta.id_reservacion = renta_r.idReservacion
      renta.id_empleado = renta_r.idEmpleado
      renta.f_entrada = renta_r.FechaIn
      renta.f_salida = renta_r.FechaOut
      renta.save!
    end
  end
end
