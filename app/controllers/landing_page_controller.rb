class LandingPageController < ApplicationController
  def index; end

  def new
    initialize_accidentes
    initialice_aplicaciones
    initialize_areas
    initialize_areas_por_empleado
    initialize_asignacion_de_materiales
    initialize_material_gastado_por_habitacion
    initialize_asistencias
    initialize_bajas
    initiallize_bajas_empleados
    initialize_bebidas
    initialize_bebidas_por_comanda
    initialice_capacitaciones
    initialize_clientes
    initialize_comandas
    initialize_detalle_factura_restaurante
    initialize_detalle_factura_hotel
    initialize_dhabitaciones
    initialize_mantenimientos
    initialize_mantenimientoh
    initialize_empleados
    initialice_empresas
    initialice_equiposh
    initialize_equipos
    initialize_equipos_por_pedido
    initialize_equipos_por_recibo
    initialize_facturas_hotel
    initialize_facturas
    initialize_habitaciones
    initialize_hrentadas
    initialize_hreservadas
    initialize_servicios
    initialize_servicios_a_domicilio
    initialize_ingredientes
    initialize_ingredientes_por_bebida
    initialize_ingredientes_por_platillo
    initialize_ingredientes_por_proveedor
    initialize_mantenimientos
    initialize_materials
    initialize_materiales_por_pedido
    initialize_materiales_por_recibo
    initialize_mesas
    initialize_mesas_por_reservacion
    initialize_mantenimientos_por_equipo
    initialize_paquetes
    initialize_paquetesvr
    initialize_pedidos_por_empleados
    initialize_platillo
    initialize_platillos_por_comanda
    initialice_postulantes
    initialice_programas
    initialize_proveedores
    initialize_recibos
    initialize_rentas
    initialize_reporte
    initialize_reservaciones
    initialize_reservaciones
    initialize_reservaciones_en_restaurante
    initialize_serviciosh
    initialize_serviciosl
    initialize_servicioslh
    initialize_servicios
    initialize_mesas_por_reservacion
    initialize_serviciosp
    # initialice_solicitudes
    initialize_tipos_productos
    initialize_tipos_medidas
    initialize_vacantes
    redirect_to empleados_path
  end

  private

  def initialize_accidentes
    AccidenteLaboral.using(:dwh_t).delete_all
    accidente = AccidenteLaboral.using(:dwh_t).new
    accidentes = AccidenteLaboral.using(:rrhh).all

    accidentes.each do |accidente_r|
      accidente = AccidenteLaboral.using(:dwh_t).new
      accidente.id = accidente_r.id
      accidente.id_empleado = accidente_r.id_empleado
      accidente.f_accidente = accidente_r.f_accidente
      unless valid_date?(accidente.f_accidente)
        accidente.error = true
      end
      accidente.save!
    end
  end

  def initialice_aplicaciones
    AplicacionAVacante.using(:dwh_t).delete_all
    aplicaciones = AplicacionAVacante.using(:rrhh).all
    aplicacion = AplicacionAVacante.using(:dwh_t).new

    aplicaciones.each do |aplicacion_r|
      aplicacion = AplicacionAVacante.using(:dwh_t).new
      aplicacion.id = aplicacion_r.id
      aplicacion.id_postulante = aplicacion_r.id_postulante
      aplicacion.id_vacante = aplicacion_r.id_vacante
      aplicacion.id_empleado = aplicacion_r.id_empleado
      aplicacion.f_aplicacion = aplicacion_r.f_aplicacion.to_s
      unless valid_date?(aplicacion.f_aplicacion)
        aplicacion.error = true
      end
      aplicacion.save!
    end
  end


  def initialize_areas
    area = Area.using(:dwh_t).delete_all
    areas = Area.using(:rrhh).all
    area = Area.using(:dwh_t).new

    areas.each do |area_r|
      area = Area.using(:dwh_t).new
      area.id = area_r.id
      area.nombre = area_r.nombre
      area.clave = area_r.clave
      unless valid_nombrecosas?(area.nombre)
        area.error = true
      end
      unless valid_nombrecosas?(area.clave)
        area.error = true
      end
      area.save!
    end
  end

  def initialize_areas_por_empleado
    area=AreasPorEmpleado.using(:dwh_t).delete_all
    areas = AreasPorEmpleado.using(:rrhh).all
    area = AreasPorEmpleado.using(:dwh_t).new

    areas.each do |area_r|
      area = AreasPorEmpleado.using(:dwh_t).new
      area.id = area_r.id
      area.id_area = area_r.id_area
      area.id_empleado = area_r.id_empleado
      area.f_asignacion = area_r.f_asignacion
      unless valid_date?(area.f_asignacion)
        area.error = true
      end
      area.save!
    end
  end

  def initialize_asignacion_de_materiales
    AsignacionMaterial.using(:dwh_t).delete_all
    materiales = AsignacionMaterial.using(:restaurant).all
    material = AsignacionMaterial.using(:dwh_t).new

    materiales.each do |se|
      material = AsignacionMaterial.using(:dwh_t).new
      material.id = se.idAsignacion
      material.cantidad = se.Cantidad
      unless valid_cantidad?(material.cantidad)
        material.error = true
      end
      material.id_habitacion = se.idHabitacion
      material.id_material = se.idMaterial
      material.save!
    end
  end


  def initialize_asistencias
    asistencia = Asistencia.using(:dwh_t).delete_all
    asistencias = Asistencia.using(:rrhh).all
    asistencia = Asistencia.using(:dwh_t).new

    asistencias.each do |asistencia_r|
      asistencia = Asistencia.using(:dwh_t).new
      asistencia.id = asistencia_r.id
      asistencia.id_empleado = asistencia_r.id_empleado
      asistencia.fecha = asistencia_r.fecha
      unless valid_date?(asistencia.fecha)
        asistencia.error = true
      end
      asistencia.hora_entrada = asistencia_r.h_entrada
      asistencia.hora_salida = asistencia_r.h_salida
      asistencia.save!
    end
  end

  def initialize_bajas
    Baja.using(:dwh_t).delete_all
    bajas = Baja.using(:rrhh).all
    baja = Baja.using(:dwh_t).new

    bajas.each do |baja_r|
      baja = Baja.using(:dwh_t).new
      baja.id = baja_r.id
      baja.id_articulo = baja_r.id_articulo
      baja.tipo = baja_r.tipo
      baja.fecha = baja_r.fecha
      baja.motivo = baja_r.motivo
      unless valid_word?(baja.tipo)
        baja.error = true
      end
      unless valid_date?(baja.fecha)
        baja.error = true
      end
      baja.save!
    end
  end

  def initiallize_bajas_empleados
    BajaEmpleado.using(:dwh_t).delete_all
    bajas = BajaEmpleado.using(:rrhh).all
    baja = BajaEmpleado.using(:dwh_t).new

    bajas.each do |baja_r|
      baja = BajaEmpleado.using(:dwh_t).new
      baja.id = baja_r.id
      baja.id_empleado = baja_r.id_empleado
      baja.motivo = baja_r.motivo
      baja.fecha = baja_r.f_baja

      unless valid_date?(baja.fecha)
        baja.error = true
      end
      baja.save!
    end
  end

  def initialize_bebidas
    Bebida.using(:dwh_t).delete_all
    bebidas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Bebidas']
    bebida = Bebida.using(:dwh_t).new

    bebidas.each do |bebida_r|
      bebida = Bebida.using(:dwh_t).new
      bebida.id = bebida_r[:Id]
      bebida.nombre = bebida_r[:nombre]
      bebida.precio = bebida_r[:precio]
      bebida.descripcion = bebida_r[:descripcion]
      unless valid_nombrecosas?(bebida.nombre)
        bebida.error = true
      end

      unless valid_price?(bebida.precio)
        bebida.error = true
      end
      bebida.save!
    end
  end

  def initialize_bebidas_por_comanda
    BebidaPorComanda.using(:dwh_t).delete_all
    bebidas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Bebida_comanda']
    bebida = BebidaPorComanda.using(:dwh_t).new

    bebidas.each do |bebida_r|
      bebida = BebidaPorComanda.using(:dwh_t).new
      bebida.id = bebida_r[:Id]
      bebida.id_comanda = bebida_r[:id_comanda]
      bebida.id_bebida = bebida_r[:id_bebida]
      bebida.cantidad = bebida_r[:cantidad]
      unless valid_cantidad?(bebida.cantidad)
        bebida.error = true
      end
      bebida.save!
    end
  end


  def initialice_capacitaciones
    CapacitacionPorEmpleado.using(:dwh_t).delete_all
    capacitaciones = CapacitacionPorEmpleado.using(:rrhh).all
    capacitacion = CapacitacionPorEmpleado.using(:dwh_t).new

    capacitaciones.each do |capacitacion_r|
      capacitacion = CapacitacionPorEmpleado.using(:dwh_t).new
      capacitacion.id = capacitacion_r.id
      capacitacion.id_programa = capacitacion_r.id_programa
      capacitacion.id_empleado = capacitacion_r.id_empleado
      capacitacion.f_inicio = capacitacion_r.f_inicio
      capacitacion.f_fin = capacitacion_r.f_fin
      capacitacion.estado = capacitacion_r.estado
      unless valid_date?(capacitacion.f_inicio)
        capacitacion.error = true
      end
      unless valid_date?(capacitacion.f_fin)
        capacitacion.error = true
      end
      unless valid_estado_capacitacion?(capacitacion.estado)
        capacitacion.error = true
      end
      capacitacion.save!
    end

  end

  def initialize_clientes
    Cliente.using(:dwh_t).delete_all
    clientes = Cliente.using(:restaurant).all
    cliente = Cliente.using(:dwh_t).new

    clientes.each do |cliente_r|
      cliente = Cliente.using(:dwh_t).new
      cliente.nombre = cliente_r.Nombres + ' ' + cliente_r.ApellidoP + ' ' + cliente_r.ApellidoM
      cliente.estado = cliente_r.EntidadFederativa
      cliente.correo = cliente_r.Correo

      unless valid_estadoc?(cliente.estado)
        cliente.error = true
      end

      unless valid_name?(cliente.nombre)
        cliente.error = true
      end

      unless valid_email?(cliente.correo)
        cliente.error = true
      end

      cliente.save!
    end

    clientes = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Clientes']

    clientes.each do |cliente_r|
      cliente = Cliente.using(:dwh_t).new
      cliente.nombre = cliente_r[:nombre] + ' ' + cliente_r[:apellido_p] + ' ' + cliente_r[:apellido_m]
      cliente.telefono = cliente_r[:telefono]

      unless valid_name?(cliente.nombre)
        cliente.error = true
      end

      unless valid_estadoc?(cliente.estado)
        cliente.error = true
      end

      unless valid_telefono?(cliente.telefono)
        cliente.error = true
      end

      cliente.save!
    end

  end



  def initialize_comandas
    Comanda.using(:dwh_t).delete_all
    comandas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Comanda']
    comanda = Comanda.using(:dwh_t).new

    comandas.each do |comanda_r|
      comanda = Comanda.using(:dwh_t).new
      comanda.id = comanda_r[:Id]
      comanda.id_reservacion = comanda_r[:id_reserva_m]
      comanda.id_empleado = comanda_r[:id_empleado]
      comanda.fecha = comanda_r[:fecha]
      comanda.hora_reservacion = comanda_r[:hora]
      unless valid_date?(comanda.fecha)
        comanda.error = true
      end
      comanda.save!
    end
  end


  def initialize_detalle_factura_hotel
    DetalleDeFacturaHotel.using(:dwh_t).delete_all
    detalles_de_factura_hotel = DetalleDeFacturaHotel.using(:restaurant).all
    detalles_de_factura = DetalleDeFacturaHotel.using(:dwh_t).new

    detalles_de_factura_hotel.each do |detalles_de_factura_r|
      detalles_de_factura = DetalleDeFacturaHotel.using(:dwh_t).new
      detalles_de_factura.id = detalles_de_factura_r.idDetalle
      detalles_de_factura.cantidad = detalles_de_factura_r.Cantidad
      detalles_de_factura.total = detalles_de_factura_r.Total
      detalles_de_factura.id_factura = detalles_de_factura_r.idFactura
      detalles_de_factura.id_servicio_hotel = detalles_de_factura_r.idServicioH
      unless valid_number?(detalles_de_factura.cantidad)
        detalles_de_factura.error = true
      end
      unless valid_price?(detalles_de_factura.total)
        detalles_de_factura.error = true
      end
      detalles_de_factura.save!
    end
  end




  def initialize_detalle_factura_restaurante
    DetalleDeFacturaRestaurante.using(:dwh_t).delete_all
    detalles_de_factura = DetalleDeFacturaRestaurante.using(:dwh_t).new
    detalles_de_factura = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Detalle_factura']

    detalles_de_factura.each do |detalles_de_factura_r|
      detalles_de_factura = DetalleDeFacturaRestaurante.using(:dwh_t).new
      detalles_de_factura.id = detalles_de_factura_r[:Id]
      detalles_de_factura.id_factura = detalles_de_factura_r[:id_factura]
      detalles_de_factura.id_comanda = detalles_de_factura_r[:id_comanda]
      detalles_de_factura.fecha_emision = detalles_de_factura_r[:fecha]
      detalles_de_factura.total = detalles_de_factura_r[:total]
      unless valid_date?(detalles_de_factura.fecha_emision.to_s)
        detalles_de_factura.error = true
      end
      unless valid_price?(detalles_de_factura.to_s)
        detalles_de_factura.error = true
      end
      detalles_de_factura.save!
    end
  end

  def initialize_dhabitaciones
    Dhabitacion.using(:dwh_t).delete_all
    habitaciones_h = Dhabitacion.using(:restaurant).all
    habitacion_t = Dhabitacion.using(:dwh_t).new

    habitaciones_h.each do |pa|
      habitacion_t = Dhabitacion.using(:dwh_t).new
      habitacion_t.id = pa.idTipo
      habitacion_t.nombre = pa.Nombre
      habitacion_t.precio = pa.Precio
      unless valid_nombrecosas?(habitacion_t.nombre)
        habitacion_t.error = true
      end
      unless valid_price?(habitacion_t.precio)
        habitacion_t.error = true
      end
      habitacion_t.save!
    end
  end

  # def initialize_mantenimiento
  #   DmantenimientoEquipo.using(:dwh_t).delete_all
  #   mantenimientos = DmantenimientoEquipo.using(:restaurant).all
  #   mantenimiento = DmantenimientoEquipo.using(:dwh_t).new()

  #   mantenimientos.each do |ma|
  #     mantenimiento = DmantenimientoEquipo.using(:dwh_t).new()
  #     mantenimiento.idDetalle = ma.idDetalle
  #     mantenimiento.FechaInicio = ma.FechaInicio
  #     mantenimiento.FechaTermino = ma.FechaTermino
  #     mantenimiento.idEquipoH = ma.idEquipoH
  #     mantenimiento.idMantenimientoE = ma.idMantenimientoE
  #     mantenimiento.idEmpleado = ma.idEmpleado
  #     unless valid_date?(mantenimiento.FechaInicio)
  #       mantenimiento.error = true
  #     end
  #     unless valid_date?(mantenimiento.FechaTermino)
  #       mantenimiento.error = true
  #     end
  #     mantenimiento.save!
  #   end
  # end

  def initialize_mantenimientoh
    DmantenimientoHabitacion.using(:dwh_t).delete_all
    mantenimientos = DmantenimientoHabitacion.using(:restaurant).all
    mantenimiento = DmantenimientoHabitacion.using(:dwh_t).new()

    mantenimientos.each do |ma|
      mantenimiento = DmantenimientoHabitacion.using(:dwh_t).new()
      mantenimiento.id = ma.idDetalle
      mantenimiento.Descripcion = ma.Descripcion
      mantenimiento.FechaInicio = ma.FechaInicio
      mantenimiento.FechaTermino = ma.FechaTermino
      mantenimiento.idHabitacion = ma.idHabitacion
      mantenimiento.idMantenimientoH = ma.idMatenimientoH
      mantenimiento.idEmpleado = ma.idEmpleado
      unless valid_date?(mantenimiento.FechaInicio)
        mantenimiento.error = true
      end
      unless valid_date?(mantenimiento.FechaTermino)
        mantenimiento.error = true
      end
      mantenimiento.save!
    end
  end

  def initialize_empleados
    Empleado.using(:dwh_t).delete_all
    empleado = Empleado.using(:dwh_t).new
    empleados_rest = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Empleados']

    empleados_rest.each do |empleado_r|
      empleado = Empleado.using(:dwh_t).new
      empleado.nombre = empleado_r[:nombre].titleize + ' ' + empleado_r[:apellido_p].titleize
      + ' ' + empleado_r[:apellido_m].titleize
      empleado.n_telefono = empleado_r[:telefono]
      empleado.sistema = 'R'
      empleado.error = true
      empleado.save!
    end

    Empleado.using(:rrhh).find_each(batch_size: 10) do |empleado_r|
      empleado = Empleado.using(:dwh_t).new
      empleado.nombre = empleado_r.nombre.titleize
      empleado.f_nacimiento = empleado_r.f_nacimiento
      empleado.c_electronico = empleado_r.c_electronico
      empleado.n_telefono = empleado_r.n_telefono
      empleado.f_entrada = empleado_r.f_entrada
      empleado.genero = empleado_r.genero
      empleado.rfc = empleado_r.rfc
      empleado.baja = empleado_r.baja
      empleado.sistema = 'RR'
      unless valid_name?(empleado.nombre)
        empleado.error = true
      end
      unless valid_date?(empleado.f_entrada)
        empleado.error = true
      end
      unless valid_date?(empleado.f_nacimiento)
        empleado.error = true
      end
      unless valid_email?(empleado.c_electronico)
        empleado.error = true
      end
      unless valid_name?(empleado.nombre)
        empleado.error = true
      end
      unless valid_telefono?(empleado.n_telefono)
        empleado.error = true
      end
      unless valid_rfc?(empleado.rfc)
        empleado.error = true
      end

      unless valid_genero?(empleado.genero)
        empleado.error = true
      end
      empleado.save!
    end

    Empleado.using(:restaurant).find_each(batch_size: 10) do |empleado_r|
      empleado = Empleado.using(:dwh_t).new
      empleado.nombre = empleado_r.Nombre
      empleado.id_sistema = empleado.id
      empleado.f_nacimiento = empleado_r.FechaNa
      empleado.n_telefono = empleado_r.Telefono
      empleado.sistema = 'H'

      unless valid_name?(empleado.nombre)
        empleado.error = true
      end

      unless valid_date?(empleado.f_nacimiento)
        empleado.error = true
      end

      unless valid_telefono?(empleado.n_telefono)
        empleado.error = true
      end
      empleado.save!
    end
  end

  def initialice_empresas
    Empresa.using(:dwh_t).delete_all
    empresas = Empresa.using(:rrhh).all
    empresa = Empresa.using(:dwh_t).new

    empresas.each do |empresa_r|
      empresa = Empresa.using(:dwh_t).new
      empresa.id = empresa_r.id
      empresa.nombre = empresa_r.nombre
      unless valid_nombrecosas?(empresa.nombre)
        empresa.error = true
      end
      empresa.save!
    end
  end

  def initialice_equiposh
    EquipoHabitacion.using(:dwh_t).delete_all
    equipos = EquipoHabitacion.using(:restaurant).all
    equipo = EquipoHabitacion.using(:dwh_t).new

    equipos.each do |equipo_r|
      equipo = EquipoHabitacion.using(:dwh_t).new
      equipo.id = equipo_r.idEquipoH
      equipo.idEquipo = equipo_r.idEquipo
      equipo.idHabitacion = equipo_r.idHabitacion
      equipo.save!
    end
  end


  def initialize_equipos
    Equipo.using(:dwh_t).delete_all
    equipos = Equipo.using(:rrhh).all
    equipo = Equipo.using(:dwh_t).new

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new
      equipo.id_sistema = equipo_r.id
      equipo.nombre = equipo_r.nombre
      equipo.modelo = equipo_r.modelo
      unless valid_nombrecosas?(equipo.nombre)
        equipo.error = true
      end
      equipo.sistema = 'RH'
      equipo.save!
    end

    equipos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Equipo']

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new()
      equipo.id_sistema = equipo_r[:Id]
      equipo.nombre = equipo_r[:nombre]
      equipo.sistema = 'R'

      unless valid_nombrecosas?(equipo.nombre)
        equipo.error = true
      end

      equipo.save!
    end

    equipos = Equipo.using(:restaurant).all
    equipo = Equipo.using(:dwh_t).new

    equipos.each do |equipo_r|
      equipo = Equipo.using(:dwh_t).new
      equipo.id_sistema = equipo_r.idEquipo
      equipo.nombre = equipo_r.Nombre

      unless valid_nombrecosas?(equipo.nombre)
        equipo.error = true
      end
      equipo.sistema = 'H'
      equipo.save!
    end
  end

  def initialize_equipos_por_pedido
    EquipoPorPedido.using(:dwh_t).delete_all
    equipos_por_pedido = EquipoPorPedido.using(:rrhh).all
    equipo = EquipoPorPedido.using(:dwh_t).new

    equipos_por_pedido.each do |equipo_r|
      equipo = EquipoPorPedido.using(:dwh_t).new
      equipo.id_sistema = equipo_r.id
      equipo.id_pedido = equipo_r.id_pedido
      equipo.id_equipo = equipo_r.id_equipo
      equipo.sistema = 'RR'
      equipo.save!
    end

    equipos_por_pedido = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_equipo_pedido']
    equipo = EquipoPorPedido.using(:dwh_t).new

    equipos_por_pedido.each do |equipo_r|
      equipo = EquipoPorPedido.using(:dwh_t).new
      equipo.id_sistema = equipo_r[:Id]
      equipo.id_pedido = equipo_r[:id_pedido]
      equipo.id_equipo = equipo_r[:id_equipo_c]
      equipo.sistema = 'R'
      equipo.save!
    end
  end

  def initialize_equipos_por_recibo
    EquipoPorRecibo.using(:dwh_t).delete_all
    equipos_por_recibo = EquipoPorRecibo.using(:rrhh).all
    equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).new

    equipos_por_recibo.each do |equipo_por_recibio_r|
      equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).new
      equipo_por_recibo.id_sistema = equipo_por_recibio_r.id
      equipo_por_recibo.id_equipo = equipo_por_recibio_r.id_equipo
      equipo_por_recibo.id_recibo_compra = equipo_por_recibio_r.id_recibo_compra
      equipo_por_recibo.n_serie = equipo_por_recibio_r.n_serie
      equipo_por_recibo.f_finalizacion_garantia = equipo_por_recibio_r.f_finalizacion_garantia
      unless valid_numserie?(equipo_por_recibo.n_serie)
        equipo_por_recibo.error = true
      end

      unless valid_date?(equipo_por_recibo.f_finalizacion_garantia)
        equipo_por_recibo.error = true
      end
      equipo_por_recibo.sistema = 'RR'
      equipo_por_recibo.save!
    end

    equipos_por_recibo =Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_equipo_recibo']

    equipos_por_recibo.each do |equipo_por_recibo_r|
      equipo_por_recibo = EquipoPorRecibo.using(:dwh_t).new
      equipo_por_recibo.id_sistema = equipo_por_recibo_r[:Id]
      equipo_por_recibo.id_equipo = equipo_por_recibo_r[:id_equipo_c]
      equipo_por_recibo.id_recibo_compra = equipo_por_recibo_r[:id_rec_rm]
      equipo_por_recibo.sistema = 'R'
      equipo_por_recibo.error = true
      equipo_por_recibo.save!
    end
  end


  def initialize_facturas
    FacturaRestaurante.using(:dwh_t).delete_all
    facturas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Factura']
    factura = FacturaRestaurante.using(:dwh_t).new

    facturas.each do |factura_r|
      factura = FacturaRestaurante.using(:dwh_t).new
      factura.id_sistema = factura_r[:Id]
      factura.id_cliente =factura_r[:id_cliente]
      factura.fecha_emision = factura_r[:fecha_factura]
      factura.tipo_pago = factura_r[:id_tipo_pago]
      factura.sistema = 'R'
      factura.total = factura_r[:total]
      unless valid_date?(factura.fecha_emision)
        factura.error = true
      end
      factura.save!
    end
  end


  def initialize_habitaciones
    Habitacion.using(:dwh_t).delete_all
    habitaciones = Habitacion.using(:restaurant).all
    habitacion = Habitacion.using(:dwh_t).new()

    habitaciones.each do |ha|
      habitacion = Habitacion.using(:dwh_t).new()
      habitacion.id = ha.idHabitacion
      habitacion.tipo_habitacion = ha.idTipo
      habitacion.estado = ha.Estado
      unless valid_activah?(habitacion.estado)
        habitacion.error = true
      end
      habitacion.save!
    end
  end


  def initialize_hrentadas
    HabitacionRentada.using(:dwh_t).delete_all
    habitaciones_r = HabitacionRentada.using(:restaurant).all
    habitacion_r = HabitacionRentada.using(:dwh_t).new

    habitaciones_r.each do |hr|
      habitacion_r = HabitacionRentada.using(:dwh_t).new
      habitacion_r.id = hr.idHabitacionR
      habitacion_r.id_renta = hr.idRenta
      habitacion_r.id_habitacion = hr.idHabitacion
      habitacion_r.save!
    end
  end

  def initialize_hreservadas
    HabitacionReservada.using(:dwh_t).delete_all
    habitaciones_r = HabitacionReservada.using(:restaurant).all
    habitacion_r = HabitacionReservada.using(:dwh_t).new

    habitaciones_r.each do |hr|
      habitacion_r = HabitacionReservada.using(:dwh_t).new()
      habitacion_r.id_reservacion = hr.idReservacion
      habitacion_r.id_habitacion = hr.idHabitacion
      habitacion_r.save!
    end
  end


  def initialize_historicoservicios
    HistoricoServicio.using(:dwh_t).delete_all
    historicos = HistoricoServicio.using(:restaurant).all
    historico = HistoricoServicio.using(:dwh_t).new()

    historicos.each do |se|
      historico = HistoricoServicio.using(:dwh_t).new()
      historico.id = se.idHistorico
      historico.precio = se.Precio
      historico.f_inicio = se.FechaInicio
      historico.f_termino = se.FechaTermino
      historico.id_servicio = se.idServicio
      unless valid_date?(historico.f_inicio)
        historico.error = true
      end
      unless valid_date?(historico.f_termino)
        historico.error = true
      end
      unless valid_price?(historico.precio)
        historico.error = true
      end
      historico.save!
    end
  end


  def initialize_ingredientes
    Ingrediente.using(:dwh_t).delete_all
    ingrediente = Ingrediente.using(:dwh_t).new
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
      unless valid_nombrecosas?(ingrediente.nombre)
        ingrediente.error = true
      end
      unless valid_number?(ingrediente.stock_maximo)
        ingrediente.error = true
      end
      unless valid_number?(ingrediente.stock_minimo)
        ingrediente.error = true
      end
      unless valid_number?(ingrediente.cantidad_stock)
        ingrediente.error = true
      end
      ingrediente.save!

    end
  end


  def initialize_ingredientes_por_bebida
    IngredientePorBebida.using(:dwh_t).delete_all
    ingrediente = IngredientePorBebida.using(:dwh_t).new
    ingredientes = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Ingrediente_por_bebida']

    ingredientes.each do |ingrediente_r|
      ingrediente = IngredientePorBebida.using(:dwh_t).new
      ingrediente.id = ingrediente_r[:Id]
      ingrediente.id_bebida = ingrediente_r[:id_bebida]
      ingrediente.id_producto = ingrediente_r[:id_producto]
      ingrediente.id_tipo_medida = ingrediente_r[:id_tipo_med]
      ingrediente.cantidad = ingrediente_r[:cantidad]
      unless valid_number?(ingrediente.cantidad)
        ingrediente.error = true
      end
      ingrediente.save!
    end
  end


  def initialize_ingredientes_por_platillo
    IngredientePorPlatillo.using(:dwh_t).delete_all
    ingrediente_por_platillo = IngredientePorPlatillo.using(:dwh_t).new
    ingredientes_por_platillo = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Ingrediente_por_platillo']

    ingredientes_por_platillo.each do |ingrediente_por_platillo_r|
      ingrediente_por_platillo = IngredientePorPlatillo.using(:dwh_t).new
      ingrediente_por_platillo.id = ingrediente_por_platillo_r[:id]
      ingrediente_por_platillo.id_platillo = ingrediente_por_platillo_r[:id_platillo]
      ingrediente_por_platillo.id_producto = ingrediente_por_platillo_r[:id_producto]
      ingrediente_por_platillo.id_tipo_medida = ingrediente_por_platillo_r[:id_tipo_medida]
      ingrediente_por_platillo.cantidad = ingrediente_por_platillo_r[:cantidad]
      unless valid_number?(ingrediente_por_platillo.cantidad)
        ingrediente_por_platillo.error = true
      end
      ingrediente_por_platillo.save!
    end
  end


  def initialize_ingredientes_por_proveedor
    IngredientePorProveedor.using(:dwh_t).delete_all
    ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).new
    ingredientes_por_proveedor = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Producto_proveedor']

    ingredientes_por_proveedor.each do |ingrediente_por_proveedor_r|
      ingrediente_por_proveedor = IngredientePorProveedor.using(:dwh_t).new
      ingrediente_por_proveedor.id = ingrediente_por_proveedor_r[:Id]
      ingrediente_por_proveedor.id_ingrediente = ingrediente_por_proveedor_r[:id_producto]
      ingrediente_por_proveedor.id_proveedor = ingrediente_por_proveedor_r[:id_proveedor]
      ingrediente_por_proveedor.precio = ingrediente_por_proveedor_r[:precio]
      unless valid_price?(ingrediente_por_proveedor.precio)
        ingrediente_por_proveedor.error = true
      end
      ingrediente_por_proveedor.save!
    end
  end


  def initialize_mantenimientos
    Mantenimiento.using(:dwh_t).delete_all
    mantenimientos = Mantenimiento.using(:restaurant).all
    mantenimiento = Mantenimiento.using(:dwh_t).new()

    mantenimientos.each do |ma|
      mantenimiento = Mantenimiento.using(:dwh_t).new()
      mantenimiento.id = ma.id
      mantenimiento.tipo = ma.tipo
      unless valid_tipomantenimietno(mantenimiento.tipo)
        mantenimiento.error = true
      end
      mantenimiento.save!
    end
  end


  def initialize_materials
    Material.using(:dwh_t).delete_all
    materiales  = Material.using(:restaurant).all
    material = Material.using(:dwh_t).new

    materiales.each do |material_r|
      material = Material.using(:dwh_t).new
      material.id_sistema = material_r.idMaterial
      material.nombre = material_r.Nombre
      material.cantidad_stock = material_r.Cantidad
      material.stock_max = material_r.Max
      material.stock_min = material_r.Min
      material.sistema = 'H'

      unless valid_number?(material.cantidad_stock)
        material.error = true
      end

      unless valid_number?(material.stock_max)
        material.error = true
      end

      unless valid_number?(material.stock_min)
        material.error = true
      end

      unless valid_alpha?(material.nombre)
        material.error = true
      end

      material.save!
    end

    materiales  = Material.using(:rrhh).all

    materiales.each do |material_r|
      material = Material.using(:dwh_t).new
      material.id_sistema = material_r.id
      material.nombre = material_r.nombre
      material.cantidad_stock = material_r.cantidad_stock
      material.stock_max = material_r.cantidad_maxima
      material.stock_min = material_r.cantidad_minima
      material.sistema = 'RR'
      unless valid_number?(material.stock_max)
        material.error = true
      end
      unless valid_number?(material.stock_min)
        material.error = true
      end
      unless valid_number?(material.cantidad_stock)
        material.error = true
      end
      unless valid_alpha?(material.nombre)
        material.error = true
      end
      material.save!
    end

    materiales = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Materiales']

    materiales.each do |material_r|
      material = Material.using(:dwh_t).new
      material.id_sistema = material_r[:Id]
      material.nombre = material_r[:nombre]
      material.cantidad_stock = material_r[:cantidad]
      material.stock_max = material_r[:stock_max]
      material.stock_min = material_r[:stock_min]
      material.sistema = 'R'

      unless valid_number?(material.cantidad_stock)
        material.error = true
      end

      unless valid_number?(material.stock_max)
        material.error = true
      end

      unless valid_number?(material.stock_min)
        material.error = true
      end

      unless valid_alpha?(material.nombre)
        material.error = true
      end

      material.save!
    end
  end


  def initialize_materiales_por_pedido
    MaterialPorPedido.using(:dwh_t).delete_all
    materiales_por_pedido = MaterialPorPedido.using(:rrhh).all
    material_por_pedido = MaterialPorPedido.using(:dwh_t).new

    materiales_por_pedido.each do |material_por_pedido_r|
      material_por_pedido = MaterialPorPedido.using(:dwh_t).new
      material_por_pedido.id_sistema = material_por_pedido_r.id
      material_por_pedido.id_pedido = material_por_pedido_r.id_pedido_empleado
      material_por_pedido.id_material = material_por_pedido_r.id_material
      material_por_pedido.cantidad = material_por_pedido_r.cantidad
      material_por_pedido.sistema = 'RR'
      unless valid_number?(material_por_pedido.cantidad)
        material_por_pedido.error = true
      end
      material_por_pedido.save!
    end

    materiales_por_pedido = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_materiales_pedido']

    materiales_por_pedido.each do |material_por_pedido_r|
      material_por_pedido = MaterialPorPedido.using(:dwh_t).new
      material_por_pedido.id_sistema = material_por_pedido_r[:id]
      material_por_pedido.id_pedido = material_por_pedido_r[:id_pedido]
      material_por_pedido.id_material = material_por_pedido_r[:id_material]
      material_por_pedido.cantidad = material_por_pedido_r[:cantidad]
      material_por_pedido.sistema = 'R'

      unless valid_number?(material_por_pedido.cantidad)
        material_por_pedido.error = true
      end

      material_por_pedido.save!
    end

  end

  def initialize_materiales_por_recibo
    MaterialPorRecibo.using(:dwh_t).delete_all
    materiales_por_recibo = MaterialPorRecibo.using(:rrhh).all
    material_por_recibo = MaterialPorRecibo.using(:dwh_t).new

    materiales_por_recibo.each do |material_por_recibo_r|
      material_por_recibo = MaterialPorRecibo.using(:dwh_t).new
      material_por_recibo.id_sistema = material_por_recibo_r.id
      material_por_recibo.id_recibo_compra = material_por_recibo_r.id_recibo_compra
      material_por_recibo.id_material = material_por_recibo_r.id_material
      material_por_recibo.cantidad = material_por_recibo_r.cantidad
      material_por_recibo.f_caducidad = material_por_recibo_r.f_caducidad
      material_por_recibo.tipo_paquete = material_por_recibo_r.tipo_paquete
      material_por_recibo.sistema = 'RR'
      unless valid_number?(material_por_recibo.cantidad)
        material_por_recibo.error = true
      end

      unless valid_date?(material_por_recibo.f_caducidad)
        material_por_recibo.error = true
      end

      unless valid_name?(material_por_recibo.tipo_paquete)
        material_por_recibo.error = true
      end

      material_por_recibo.save!
    end

    materiales_por_recibo = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_materiales_recibo']

    materiales_por_recibo.each do |material_por_recibo_r|
      material_por_recibo = MaterialPorRecibo.using(:dwh_t).new
      material_por_recibo.id_sistema = material_por_recibo_r[:Id]
      material_por_recibo.id_material = material_por_recibo_r[:id_material]
      material_por_recibo.id_recibo_compra = material_por_recibo_r[:id_rec_rm]
      material_por_recibo.cantidad = material_por_recibo_r[:cantidad]
      material_por_recibo.sistema = 'R'

      unless valid_date?(material_por_recibo.f_caducidad)
        material_por_recibo.error = true
      end

      unless valid_name?(material_por_recibo.tipo_paquete)
        material_por_recibo.error = true
      end


      material_por_recibo.save!
    end
  end

  def initialize_material_gastado_por_habitacion
    MgHabitacion.using(:dwh_t).delete_all
    materiales = MgHabitacion.using(:restaurant).all
    material = MgHabitacion.using(:dwh_t).new()

    materiales.each do |se|
      material = MgHabitacion.using(:dwh_t).new()
      material.id = se.id
      material.cantidad = se.Cantidad
      material.id_material_por_recibo = se.idMaterial
      material.id_servicio_limpieza = se.idServicioLH
      unless valid_number?(material.cantidad)
        material.error = true
      end
      material.save!
    end
  end

  def initialize_mesas
    Mesa.using(:dwh_t).delete_all
    mesas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Mesa']
    mesa = Mesa.using(:dwh_t).new()

    mesas.each do |mesa_r|
      mesa = Mesa.using(:dwh_t).new()
      mesa.id = mesa_r[:id]
      mesa.numero = mesa_r[:numero]
      mesa.capacidad = mesa_r[:capacidad]
      unless valid_number?(mesa.capacidad)
        mesa.error = true
      end
      mesa.save!
    end
  end

  def initialize_mesas_por_reservacion
    MesaPorReservacion.using(:dwh_t).delete_all
    mesa_por_reservacion = MesaPorReservacion.using(:dwh_t).new
    mesas_por_reservacion = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Reservacion_mesa']

    mesas_por_reservacion.each do |mesa_por_reservacion_r|
      mesa_por_reservacion = MesaPorReservacion.using(:dwh_t).new
      mesa_por_reservacion.id_reservacion = mesa_por_reservacion_r[:id_reservac]
      mesa_por_reservacion.id_mesa = mesa_por_reservacion_r[:id_mesa]
      mesa_por_reservacion.estado = mesa_por_reservacion_r[:estado]
      if mesa_por_reservacion.estado != "0" && mesa_por_reservacion.estado != "1"
        mesa_por_reservacion.error = true
      end
      mesa_por_reservacion.save!
    end
  end

  def initialize_mantenimientos_por_equipo
    MantenimientoPorEquipo.using(:dwh_t).delete_all
    mantenimientos = MantenimientoPorEquipo.using(:restaurant).all
    mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new

    mantenimientos.each do |mantenimiento_r|
      mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new
      mantenimiento.id_sistema = mantenimiento_r.id
      mantenimiento.f_inicio = mantenimiento_r.FechaInicio
      mantenimiento.f_termino = mantenimiento_r.FechaTermino
      mantenimiento.id_equipo = mantenimiento_r.idEquipo_recibo
      mantenimiento.tipo_mantenimiento = mantenimiento_r.tipo_mantenimiento
      mantenimiento.id_empleado = mantenimiento_r.idEmpleado
      mantenimiento.sistema = 'H'
      mantenimiento.error = true
      mantenimiento.save!
    end

    mantenimientos = MantenimientoPorEquipo.using(:rrhh).all

    mantenimientos.each do |mantenimiento_r|
      mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new
      mantenimiento.id_sistema = mantenimiento_r.id
      mantenimiento.f_inicio = mantenimiento_r.f_solicitud
      mantenimiento.f_termino = mantenimiento_r.f_recibo
      mantenimiento.estado = mantenimiento_r.estado
      mantenimiento.id_equipo = mantenimiento_r.id_equipo_por_recibo
      mantenimiento.tipo_mantenimiento = mantenimiento_r.tipo
      mantenimiento.id_empleado = mantenimiento_r.id_empleado
      mantenimiento.sistema = 'RR'
      unless valid_date?(mantenimiento.f_inicio)
        mantenimiento.error = true
      end
      unless valid_date?(mantenimiento.f_termino)
        mantenimiento.error = true
      end
      unless valid_name?(mantenimiento.tipo_mantenimiento)
        mantenimiento.error = true
      end
      mantenimiento.save!
    end

    mantenimientos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['D_correccion_mantenimiento']

    mantenimientos.each do |mantenimiento_r|
      mantenimiento = MantenimientoPorEquipo.using(:dwh_t).new
      mantenimiento.id_sistema = mantenimiento_r[:ID]
      mantenimiento.f_inicio = mantenimiento_r[:fecha]
      mantenimiento.id_equipo = mantenimiento_r[:id_equipo_c]
      mantenimiento.tipo_mantenimiento = mantenimiento_r[:Id_cor_mant]
      mantenimiento.sistema = 'R'
      mantenimiento.error = true
      mantenimiento.save!
    end
  end

  def initialize_paquetes
    Paquete.using(:dwh_t).delete_all
    paquetes_h = Paquete.using(:restaurant).all
    paquete_t = Paquete.using(:dwh_t).new()

    paquetes_h.each do |pa|
      paquete_t = Paquete.using(:dwh_t).new()
      paquete_t.id = pa.idPaquete
      paquete_t.nombre = pa.Nombre
      paquete_t.descripcion = pa.Descripcion
      paquete_t.precio_por_dia = pa.PrecioDia

      unless valid_nombrecosas?(paquete_t.nombre)
        paquete_t.error = true
      end

      unless valid_price?(paquete_t.precio_por_dia)
        paquete_t.error = true
      end

      paquete_t.save!
    end
  end

  def initialize_paquetesvr
    PaqueteVendidoRenta.using(:dwh_t).delete_all
    paquetes_h = PaqueteVendidoRenta.using(:restaurant).all
    paquete_t = PaqueteVendidoRenta.using(:dwh_t).new()

    paquetes_h.each do |pa|
      paquete_t = PaqueteVendidoRenta.using(:dwh_t).new()
      paquete_t.id = pa.idpvr
      paquete_t.id_paquete = pa.idPaquete
      paquete_t.id_renta = pa.idRenta
      paquete_t.id_empleado = pa.idEmpleado
      paquete_t.save!
    end
  end


  def initialize_pedidos_por_empleados
    PedidoPorEmpleado.using(:dwh_t).delete_all
    pedidos = PedidoPorEmpleado.using(:rrhh).all
    pedido = PedidoPorEmpleado.using(:dwh_t).new

    pedidos.each do |pedido_r|
      pedido = PedidoPorEmpleado.using(:dwh_t).new
      pedido.id_sistema = pedido_r.id
      pedido.id_empleado = pedido_r.id_empleado
      pedido.f_peticion = pedido_r.f_peticion
      pedido.sistema = 'RR'
      unless valid_date?(pedido.f_peticion)
        pedido.error = true
      end
      pedido.save!
    end

    pedidos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Pedido_rm']

    pedidos.each do |pedido_r|
      pedido = PedidoPorEmpleado.using(:dwh_t).new
      pedido.id_sistema = pedido_r[:Id]
      pedido.id_empleado = pedido_r[:id_empleado]
      pedido.f_peticion = pedido_r[:fecha]
      pedido.sistema = 'R'
      unless valid_date?(pedido.f_peticion)
        pedido.error = true
      end
      pedido.save!
    end

    pedidos = PedidoPorEmpleado.using(:restaurant).all

    pedidos.each do |pedido_r|
      pedido = PedidoPorEmpleado.using(:dwh_t).new
      pedido.id_sistema = pedido_r.idPedido
      pedido.id_empleado = pedido_r.id_empleado
      pedido.f_peticion = pedido_r.Fecha
      pedido.sistema = 'H'
      unless valid_date?(pedido.f_peticion)
        pedido.error = true
      end
      pedido.save!
    end
  end


  def initialize_platillo
    Platillo.using(:dwh_t).delete_all
    platillo = Platillo.using(:dwh_t).new
    platillos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Platillos']

    platillos.each do |platillo_r|
      platillo = Platillo.using(:dwh_t).new
      platillo.id = platillo_r[:Id]
      platillo.nombre = platillo_r[:nombre]
      platillo.precio = platillo_r[:precio]
      platillo.descripcion = platillo_r[:descripcion]
      unless valid_nombrecosas?(platillo.nombre)
        platillo.error = true
      end
      unless valid_price?(platillo.precio)
        platillo.error = true
      end
      platillo.save!
    end
  end



  def initialize_platillos_por_comanda
    PlatilloPorComanda.using(:dwh_t).delete_all
    platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).new
    platillos_por_comanda = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Platillo_comanda']

    platillos_por_comanda.each do |platillo_por_comanda_r|
      platillo_por_comanda = PlatilloPorComanda.using(:dwh_t).new
      platillo_por_comanda.id = platillo_por_comanda_r[:Id]
      platillo_por_comanda.id_platillo = platillo_por_comanda_r[:id_platillo]
      platillo_por_comanda.id_comanda = platillo_por_comanda_r[:id_comanda]
      platillo_por_comanda.cantidad = platillo_por_comanda_r[:cantidad]
      unless valid_number?(platillo_por_comanda.cantidad)
        platillo_por_comanda.error = true
      end
      platillo_por_comanda.save!
    end
  end


  def initialice_postulantes
    Postulante.using(:dwh_t).delete_all
    postulantes = Postulante.using(:rrhh).all
    postulante = Postulante.using(:dwh_t).new

    postulantes.each do |postulante_r|
      postulante = Postulante.using(:dwh_t).new
      postulante.id = postulante_r.id
      postulante.nombre = postulante_r.nombre
      postulante.estado = postulante_r.estado
      unless valid_name?(postulante.nombre)
        postulante.error = true
      end
      unless valid_estadopostulante?(postulante.estado.to_s)
        postulante.error = true
      end
      postulante.save!
    end
  end



  def initialice_programas
    ProgramaCapacitacion.using(:dwh_t).delete_all
    programa = ProgramaCapacitacion.using(:dwh_t).new
    programas = ProgramaCapacitacion.using(:rrhh).all

    programas.each do |programa_r|
      programa = ProgramaCapacitacion.using(:dwh_t).new
      programa.id = programa_r.id
      programa.id_empresa = programa_r.id_empresa
      programa.nombre = programa_r.nombre
      programa.costo = programa_r.costo
      programa.duracion = programa_r.duracion
      unless valid_nombrecosas?(programa.nombre)
        programa.error = true
      end
      unless valid_price?(programa.costo)
        programa.error = true
      end
      unless valid_number?(programa.duracion)
        programa.error = true
      end
      programa.save!
    end
  end


  def initialize_proveedores
    Proveedor.using(:dwh_t).delete_all
    proveedores = Proveedor.using(:rrhh).all
    proveedor = Proveedor.using(:dwh_t).new

    proveedores.each do |proveedor_r|
      proveedor = Proveedor.using(:dwh_t).new
      proveedor.id_sistema = proveedor_r.id
      proveedor.nombre = proveedor_r.nombre
      proveedor.id_empresa = proveedor_r.id_empresa
      proveedor.sistema = 'RR'
      unless valid_name?(proveedor.nombre)
        proveedor.error = true
      end
      proveedor.save!
    end

    proveedores = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Proveedores']

    proveedores.each do |proveedor_r|
      proveedor = Proveedor.using(:dwh_t).new
      proveedor.id_sistema = proveedor_r[:Id]
      proveedor.nombre = proveedor_r[:razon_social]
      proveedor.sistema = 'R'
      unless valid_name?(proveedor.nombre)
        proveedor.error = true
      end
      proveedor.save!
    end

  end



  def initialize_recibos
    ReciboDeCompra.using(:dwh_t).delete_all
    recibo = ReciboDeCompra.using(:dwh_t).new
    recibos = ReciboDeCompra.using(:rrhh).all

    recibos.each do |recibo_r|
      recibo = ReciboDeCompra.using(:dwh_t).new
      recibo.id_sistema = recibo_r.id
      recibo.sistema = 'RR'
      recibo.id_pedido_compra = recibo_r.id_pedido_compra
      recibo.f_entrega = recibo_r.f_entrega
      unless valid_date?(recibo.f_entrega)
        recibo.error = true
      end
      recibo.save!
    end

    recibos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Recibo_rm']
    recibos.each do |recibo_r|
      recibo = ReciboDeCompra.using(:dwh_t).new
      recibo.id_sistema = recibo_r[:Id]
      recibo.id_pedido_compra = recibo_r[:id_pedido]
      recibo.f_entrega = recibo_r[:fecha]
      recibo.sistema = 'R'
      unless valid_date?(recibo.f_entrega)
        recibo.error = true
      end
      recibo.save!
    end
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
      unless valid_date?(renta.f_entrada)
        renta.error = true
      end
      unless valid_date?(renta.f_salida)
        renta.error = true
      end
      renta.save!
    end
  end


  def initialize_reporte
    ReportePerdidaRobo.using(:dwh_t).delete_all
    servicios_h = ReportePerdidaRobo.using(:restaurant).all
    servicio_t = ReportePerdidaRobo.using(:dwh_t).new()

    servicios_h.each do |s|
      servicio_t = ReportePerdidaRobo.using(:dwh_t).new()
      servicio_t.id = s.idReporte
      servicio_t.cantidad = s.Cantidad
      servicio_t.fecha = s.Fecha
      servicio_t.id_servicio_limpieza = s.idServicioLH
      servicio_t.id_habitacion = s.idHabitacion
      servicio_t.id_empleado = s.idEmpleado
      servicio_t.id_material = s.idMaterial
      unless valid_number?(servicio_t.cantidad)
        servicio_t.error = true
      end
      unless valid_date?(servicio_t.fecha)
        servicio_t.error = true
      end
      servicio_t.save!
    end
  end


  def initialize_reservaciones
    Reservacion.using(:dwh_t).delete_all
    reservaciones = Reservacion.using(:restaurant).all
    reservacion = Reservacion.using(:dwh_t).new()

    reservaciones.each do |r|
        reservacion = Reservacion.using(:dwh_t).new()
        reservacion.idReservacion = r.idReservacion
        reservacion.FechaIn = r.FechaIn
        reservacion.FechaOut = r.FechaOut
        reservacion.FechaReserv = r.FechaReserv
        reservacion.Estado = r.Estado
        reservacion.idCliente = r.idCliente
        reservacion.idEmpleado = r.idEmpleado
        unless valid_date?(reservacion.FechaIn)
          reservacion.error = true
        end
        unless valid_date?(reservacion.FechaOut)
          reservacion.error = true
        end
        unless valid_date?(reservacion.FechaReserv)
          reservacion.error = true
        end
        unless valid_status?(reservacion.Estado)
          reservacion.error = true
        end
        reservacion.save!
    end
  end


  def initialize_reservaciones
    ReservacionEnHotel.using(:dwh_t).delete_all
    reservaciones = ReservacionEnHotel.using(:restaurant).all
    reservacion = ReservacionEnHotel.using(:dwh_t).new()

    reservaciones.each do |reservacion_r|
        reservacion = ReservacionEnHotel.using(:dwh_t).new()
        reservacion.id = reservacion_r.id
        reservacion.f_entrada = reservacion_r.FechaIn
        reservacion.f_salida = reservacion_r.FechaOut
        reservacion.f_reservacion = reservacion_r.FechaReserv
        reservacion.estado = reservacion_r.Estado
        reservacion.id_cliente = reservacion_r.idCliente
        reservacion.id_empleado = reservacion_r.idEmpleado
        unless valid_date?(reservacion.f_entrada)
          reservacion.error = true
        end
        unless valid_date?(reservacion.f_salida)
          reservacion.error = true
        end
        unless valid_status?(reservacion.estado)
          reservacion.error = true
        end
        unless valid_date?(reservacion.f_reservacion)
          reservacion.error = true
        end
        reservacion.save!
    end
  end


  def initialize_reservaciones_en_restaurante
    ReservacionEnRestaurante.using(:dwh_t).delete_all
    reservacion_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).new
    reservaciones_en_restaurante = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Reservacion']

    reservaciones_en_restaurante.each do |reservacion_en_restaurante_r|
      reservacion_en_restaurante = ReservacionEnRestaurante.using(:dwh_t).new
      reservacion_en_restaurante.id = reservacion_en_restaurante_r[:Id]
      reservacion_en_restaurante.f_reservacion = reservacion_en_restaurante_r[:fecha_reservacion]
      reservacion_en_restaurante.hora = reservacion_en_restaurante_r[:hora]
      reservacion_en_restaurante.id_cliente = reservacion_en_restaurante_r[:id_cliente]
      reservacion_en_restaurante.id_empleado = reservacion_en_restaurante_r[:id_empleado]
      unless valid_date?(reservacion_en_restaurante.f_reservacion)
        reservacion_en_restaurante.error = true
      end
      reservacion_en_restaurante.save!
    end
  end


  def initialize_serviciosh
    ServicioHabitacion.using(:dwh_t).delete_all
    servicios_h = ServicioHabitacion.using(:restaurant).all
    servicio_t = ServicioHabitacion.using(:dwh_t).new()

    servicios_h.each do |s|
      servicio_t = ServicioHabitacion.using(:dwh_t).new()
      servicio_t.id = s.idServicioH
      servicio_t.id_habitacion_rentada = s.idHabitacionR
      servicio_t.id_renta = s.idRenta
      servicio_t.id_historico_servicio = s.idHistoricoS
      servicio_t.id_empleado = s.idEmpleado
      servicio_t.save!
    end
  end


  def initialize_serviciosl
    ServicioLimpieza.using(:dwh_t).delete_all
    servicios_h = ServicioLimpieza.using(:restaurant).all
    servicio_t = ServicioLimpieza.using(:dwh_t).new()

    servicios_h.each do |s|
      servicio_t = ServicioLimpieza.using(:dwh_t).new()
      servicio_t.id = s.idServicioL
      servicio_t.nombre = s.Nombre
      unless valid_nombrecosas?(servicio_t.nombre)
        servicio_t.error = true
      end
      servicio_t.save!
    end
  end


  def initialize_servicioslh
    ServiciolHabitacion.using(:dwh_t).delete_all
    servicios_h = ServiciolHabitacion.using(:restaurant).all
    servicio_t = ServiciolHabitacion.using(:dwh_t).new

    servicios_h.each do |s|
      servicio_t = ServiciolHabitacion.using(:dwh_t).new
      servicio_t.id= s.idServicioLH
      servicio_t.fecha = s.Fecha
      servicio_t.id_servicio_limpieza = s.idServicioL
      servicio_t.id_habitacion = s.idHabitacion
      servicio_t.id_empleado = s.idEmpleado
      unless valid_date?(servicio_t.fecha)
        servicio_t.error = true
      end
      servicio_t.save!
    end
  end


  def initialize_servicios_a_domicilio
    ServicioADomicilio.using(:dwh_t).delete_all
    servicio = ServicioADomicilio.using(:dwh_t).new()
    servicios = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Servicio_hotel']

    servicios.each do |servicio_r|
      servicio = ServicioADomicilio.using(:dwh_t).new()
      servicio.id = servicio_r[:id]
      servicio.id_habitacion = servicio_r[:id_habitacion]
      servicio.fecha = servicio_r[:fecha]
      unless valid_date?(servicio.fecha)
        servicio.error = true
      end
      servicio.save!
    end
  end

  # def initialize_mesas_por_reservacion
  #   ReservacionPorMesa.using(:dwh_t).delete_all
  #   servicio = ReservacionPorMesa.using(:dwh_t).new()
  #   mesas_por_reservacion = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Reservacion_mesa']

  #   mesas_por_reservacion.each do |servicio_r|
  #     servicio = ReservacionPorMesa.using(:dwh_t).new()
  #     servicio.id = servicio_r[:Id]
  #     servicio.id_reservacion = servicio_r[:id_reservac]
  #     servicio.id_mesa = servicio_r[:id_mesa]
  #     servicio.estado = servicio_r[:estado]
  #     servicio.save!
  #   end
  # end

  def initialize_servicios
    Servicio.using(:dwh_t).delete_all
    servicios_h = Servicio.using(:restaurant).all
    servicio_t = Servicio.using(:dwh_t).new

    servicios_h.each do |s|
      servicio_t = Servicio.using(:dwh_t).new
      servicio_t.id = s.idServicio
      servicio_t.nombre = s.Nombre
      unless valid_nombrecosas?(servicio_t.nombre)
        servicio_t.error = true
      end
      servicio_t.save!
    end
  end

  def initialize_serviciosp
    ServicioPaquete.using(:dwh_t).delete_all
    servicios_h = ServicioPaquete.using(:restaurant).all
    servicio_t = ServicioPaquete.using(:dwh_t).new()

    servicios_h.each do |s|
      servicio_t = ServicioPaquete.using(:dwh_t).new()
      servicio_t.id = s.idServicioP
      servicio_t.id_historico_servicio = s.idHistoricoS
      servicio_t.id_paquete = s.idPaquete
      servicio_t.save!
    end
  end


  # def initialice_solicitudes
  #   SolicitudMantenimiento.using(:dwh_t).delete_all
  #   solicitudes = SolicitudMantenimiento.using(:rrhh).all
  #   solicitud = SolicitudMantenimiento.using(:dwh_t).new

  #   solicitudes.each do |solicitud_r|
  #     solicitud = SolicitudMantenimiento.using(:dwh_t).new
  #     solicitud.id = solicitud_r.id
  #     solicitud.id_empleado = solicitud_r.id_empleado
  #     solicitud.id_equipo_por_recibo = solicitud.id_equipo_por_recibo
  #     solicitud.f_solicitud = solicitud_r.f_solicitud
  #     solicitud.f_recibo =solicitud_r.f_recibo
  #     solicitud.estado = solicitud_r.estado
  #     solicitud.motivo = solicitud_r.estado
  #     solicitud.tipo = solicitud_r.tipo
  #     unless valid_date?(solicitud.f_solicitud)
  #       solicitud.error = true
  #     end
  #     unless valid_date?(solicitud.f_recibo)
  #       solicitud.error = true
  #     end
  #     solicitud.save!
  #   end
  # end


  def initialize_tipos_productos
    TipoDeProducto.using(:dwh_t).delete_all
    tipo_de_producto = TipoDeProducto.using(:dwh_t).new
    tipos_de_productos = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Tipo de prodcuto']

    tipos_de_productos.each do |tipo_de_producto_r|
      tipo_de_producto = TipoDeProducto.using(:dwh_t).new
      tipo_de_producto.id = tipo_de_producto_r[:Id]
      tipo_de_producto.tipo = tipo_de_producto_r[:tipo]
      unless valid_nombrecosas?(tipo_de_producto.tipo)
        tipo_de_producto.error = true
      end
      tipo_de_producto.save!

    end
  end


  def initialize_tipos_medidas
    TipoMedida.using(:dwh_t).delete_all
    tipo_medida = TipoMedida.using(:dwh_t).new
    tipos_medidas = Mdb.open(Rails.root.join('db', 'access_db.accdb'))['Tipo_medida']

    tipos_medidas.each do |tipo_medida_r|
      tipo_medida = TipoMedida.using(:dwh_t).new
      tipo_medida.id = tipo_medida_r[:Id]
      tipo_medida.nombre = tipo_medida_r[:nombre]
      unless valid_nombrecosas?(tipo_medida.nombre)
        tipo_medida.error = true
      end
      tipo_medida.save!
    end
  end


  def initialize_vacantes
    Vacante.using(:dwh_t).delete_all
    vacante = Vacante.using(:dwh_t).new()
    vacantes = Vacante.using(:rrhh).all

    vacantes.each do |vacante_r|
      vacante = Vacante.using(:dwh_t).new()
      vacante.id = vacante_r.id
      vacante.nombre = vacante_r.nombre
      vacante.estado = vacante_r.estado
      unless valid_nombrecosas?(vacante.nombre)
        vacante.error = true
      end
      unless valid_estado?(vacante.estado.to_s)
        vacante.error = true
      end
      vacante.save!
    end
  end

  def initialize_facturas_hotel
    FacturaHotel.using(:dwh_t).delete_all
    facturas = FacturaHotel.using(:restaurant).all
    factura = FacturaHotel.using(:dwh_t).new

    facturas.each do |factura_r|
      factura = FacturaHotel.using(:dwh_t).new

      factura.id_sistema = factura_r.id
      factura.id_cliente = factura_r.idCliente
      factura.id_empleado = factura_r.idEmpleado
      factura.total = factura_r.Total
      factura.tipo_pago = factura_r.Tipopago
      factura.id_renta = factura_r.idRenta

      unless valid_price?(factura.total)
        factura.error = true
      end
      unless valid_date?(factura.fecha)
        factura.error = true
      end
      unless valid_tipopago?(factura.tipo_pago)
        factura.error = true
      end

      factura.save!
    end

  end

end
