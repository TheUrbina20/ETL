class LandingPageController < ApplicationController
    def index
      initialize_empleados
      @empleados = Empleado.using(:dwh_t).all.order(:nombre)
    end

    def initialize_empleados
      Empleado.using(:dwh_t).destroy_all

      empleados_rrhh = Empleado.using(:rrhh).all
      empleados_hot = Empleado.using(:restaurant).all
     # empleados_rest = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Empleados']

     # empleados_rest.each do |empleado_r|
     #   empleado = Empleado.using(:dwh_t).new()
     #empleado.nombre = empleado_r[:nombre] + ' ' + empleado_r[:apellido_p]
      #                                      + ' ' + empleado_r[:apellido_m]
      #  empleado.n_telefono = empleado_r[:telefono]
       # empleado.sistema = 'A'

        #empleado.save!
     # end

      empleados_rrhh.each do |empleado_r|
        empleado = Empleado.using(:dwh_t).new()
        empleado.nombre = empleado_r.nombre
        empleado.f_nacimiento = empleado_r.f_nacimiento
        empleado.c_electronico = empleado_r.c_electronico
        empleado.n_telefono = empleado_r.n_telefono
        empleado.f_entrada = empleado_r.f_entrada
        empleado.genero = empleado_r.genero
        empleado.rfc = empleado_r.rfc
        empleado.baja = empleado_r.baja
        empleado.sistema = 'M'
        empleado.save!
      end

      empleados_hot.each do |empleado_r|
        empleado = Empleado.using(:dwh_t).new()
        empleado.nombre = empleado_r.Nombre
        empleado.f_nacimiento = empleado_r.FechaNa
        empleado.n_telefono = empleado_r.Telefono
        empleado.sistema = 'R'
        empleado.save!
      end
    end
end
