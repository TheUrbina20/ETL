class EmpleadosController < ApplicationController
  def index
    initialize_empleados
    @empleados = Empleado.using(:dwh_t).all.order(:nombre)
  end

  def edit
    @empleado = Empleado.using(:dwh_t).find(params[:id])
  end

  def update
    @empleado = Empleado.using(:dwh_t).find(params[:id])
    if @empleado.update(empleado_params)
      flash[:notice] = 'Actualizado'
      redirect_to empleados_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def empleado_params
    params.require(:empleado).permit(:nombre, :f_nacimiento, :c_electronico, :n_telefono, :genero, :rfc, :baja, :sistema, :f_entrada)
  end

  def initialize_empleados
    Empleado.using(:dwh_t).destroy_all

    empleados_rrhh = Empleado.using(:rrhh).all
    empleados_hot = Empleado.using(:restaurant).all
    empleados_rest = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Empleados']

    empleados_rest.each do |empleado_r|
      empleado = Empleado.using(:dwh_t).new()
      empleado.nombre = empleado_r[:nombre].titleize + ' ' + empleado_r[:apellido_p].titleize
                                          + ' ' + empleado_r[:apellido_m].titleize
      empleado.n_telefono = empleado_r[:telefono]
      empleado.sistema = 'A'

      empleado.save!
    end

    empleados_rrhh.each do |empleado_r|
      empleado = Empleado.using(:dwh_t).new()
      empleado.nombre = empleado_r.nombre.titleize
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
      empleado.nombre = empleado_r.Nombre.titleize
      empleado.f_nacimiento = empleado_r.FechaNa
      empleado.n_telefono = empleado_r.Telefono
      empleado.sistema = 'R'
      empleado.save!
    end
  end
end
