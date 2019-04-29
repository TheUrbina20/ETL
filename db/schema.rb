# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_21_213214) do

  create_table "accidentes_laborales", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_empleado", limit: 100
    t.string "f_accidente", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "aplicaciones_a_vacante", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_postulante", limit: 100
    t.string "id_vacante", limit: 100
    t.string "f_aplicacion", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "areas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "clave", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "areas_de_empleado", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_area", limit: 100
    t.string "id_empleado", limit: 100
    t.string "f_asignacion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "asignacion_materiales", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cantidad", limit: 100
    t.string "id_habitacion", limit: 100
    t.string "id_material", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "asistencias", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_empleado", limit: 100
    t.string "fecha", limit: 100
    t.string "hora_entrada", limit: 100
    t.string "hora_salida", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "bajas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_articulo", limit: 100
    t.string "tipo", limit: 100
    t.string "fecha", limit: 100
    t.string "motivo", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "bajas_empleados", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "motivo", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "bebida_por_comandas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_comanda", limit: 100
    t.string "id_bebida", limit: 100
    t.string "cantidad", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "bebidas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "precio", limit: 100
    t.string "descripcion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "capacitaciones_por_empleado", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_programa", limit: 100
    t.string "id_empleado", limit: 100
    t.string "f_inicio", limit: 100
    t.string "f_fin", limit: 100
    t.string "estado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "clientes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre"
    t.string "estado"
    t.string "correo"
    t.string "telefono"
  end

  create_table "comandas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_reservacion", limit: 100
    t.string "id_empleado", limit: 100
    t.string "fecha", limit: 100
    t.string "hora_reservacion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "detalle_facturas_restaurante", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_factura", limit: 100
    t.string "id_comanda", limit: 100
    t.string "fecha_emision", limit: 100
    t.string "total", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "detallefacturas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cantidad", limit: 100
    t.string "total", limit: 100
    t.string "id_factura", limit: 100
    t.string "id_servicio_hotel", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "dhabitaciones", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "precio", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "empleados", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "f_nacimiento", limit: 100
    t.string "c_electronico", limit: 100
    t.string "n_telefono", limit: 100
    t.string "genero", limit: 100
    t.string "rfc", limit: 100
    t.string "baja", limit: 100
    t.string "sistema", limit: 100
    t.string "f_entrada", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "empresas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "equipohabitaciones", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "idEquipoH", limit: 100
    t.string "idEquipo", limit: 100
    t.string "idHabitacion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "equipos", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "modelo", limit: 100
    t.string "id_sistema", limit: 100
    t.string "sistema", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "equipos_por_pedido", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_equipo", limit: 100
    t.string "id_pedido", limit: 100
    t.string "sistema", limit: 100
    t.string "id_sistema", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "equipos_por_recibo", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "sistema", limit: 100
    t.string "id_equipo", limit: 100
    t.string "id_recibo_compra", limit: 100
    t.string "n_serie", limit: 100
    t.string "f_finalizacion_garantia", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "facturas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "id_cliente", limit: 100
    t.string "id_empleado", limit: 100
    t.string "total", limit: 100
    t.string "fecha_emision", limit: 100
    t.string "tipo_pago", limit: 100
    t.string "id_renta", limit: 100
    t.string "sistema", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "facturas_restaurante", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "id_cliente", limit: 100
    t.string "fecha_emision", limit: 100
    t.string "tipo_pago", limit: 100
    t.string "sistema", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "habitaciones", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipo_habitacion", limit: 100
    t.string "estado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "habitaciones_rentadas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_renta", limit: 100
    t.string "id_habitacion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "habitaciones_reservadas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_reservacion", limit: 100
    t.string "id_habitacion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "historico_servicios", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "precio", limit: 100
    t.string "f_inicio", limit: 100
    t.string "f_termino", limit: 100
    t.string "id_servicio", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "ingredientes", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "stock_minimo", limit: 100
    t.string "stock_maximo", limit: 100
    t.string "cantidad_stock", limit: 100
    t.string "id_tipo", limit: 100
    t.string "id_tipo_cantidad", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "ingredientes_por_bebida", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_bebida", limit: 100
    t.string "id_producto", limit: 100
    t.string "id_tipo_medida", limit: 100
    t.string "cantidad", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "ingredientes_por_platillo", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_platillo", limit: 100
    t.string "id_producto", limit: 100
    t.string "id_tipo_medida", limit: 100
    t.string "cantidad", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "ingredientes_por_proveedor", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_proveedor", limit: 100
    t.string "id_ingrediente", limit: 100
    t.string "precio", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "mantenimientos_por_equipo", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "f_inicio", limit: 100
    t.string "f_termino", limit: 100
    t.string "id_equipo", limit: 100
    t.string "sistema", limit: 100
    t.string "tipo_mantenimiento", limit: 100
    t.string "id_empleado", limit: 100
    t.string "estado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "mantenimientos_por_habitacion", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipo", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "materiales", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "sistema", limit: 100
    t.string "nombre", limit: 100
    t.string "stock_max", limit: 100
    t.string "stock_min", limit: 100
    t.string "cantidad_stock", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "materiales_por_habitacion", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_servicio_limpieza", limit: 100
    t.string "id_material_por_recibo", limit: 100
    t.string "cantidad", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "materiales_por_pedido", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "id_material", limit: 100
    t.string "sistema", limit: 100
    t.string "cantidad", limit: 100
    t.string "id_pedido", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "materiales_por_recibo", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "id_recibo_compra", limit: 100
    t.string "id_material", limit: 100
    t.string "cantidad", limit: 100
    t.string "sistema", limit: 100
    t.string "f_caducidad", limit: 100
    t.string "tipo_paquete", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "mesa", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "numero", limit: 100
    t.string "capacidad", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "mesas_por_reservacion", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_reservacion", limit: 100
    t.string "id_mesa", limit: 100
    t.string "estado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "paquetes", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "descripcion", limit: 100
    t.string "precio_por_dia", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "paquetes_vendidos_por_renta", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_paquete", limit: 100
    t.string "id_renta", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "pedidos_por_empleado", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "f_peticion", limit: 100
    t.string "estado", limit: 100
    t.string "id_empleado", limit: 100
    t.string "sistema", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "platillos", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "precio", limit: 100
    t.string "descripcion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "platillos_por_comanda", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_platillo", limit: 100
    t.string "id_comanda", limit: 100
    t.string "cantidad", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "postulantes", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "estado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "programas_de_capacitacion", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_empresa", limit: 100
    t.string "nombre", limit: 100
    t.string "costo", limit: 100
    t.string "duracion", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "proveedores", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "id_empresa", limit: 100
    t.string "id_sistema", limit: 100
    t.string "sistema", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "recibos_de_compra", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_sistema", limit: 100
    t.string "sistema", limit: 100
    t.string "f_entrega", limit: 100
    t.string "id_pedido_compra", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "rentas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_cliente", limit: 100
    t.string "id_reservacion", limit: 100
    t.string "id_empleado", limit: 100
    t.string "f_entrada", limit: 100
    t.string "f_salida", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "reportes_perdida_robo", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cantidad", limit: 100
    t.string "fecha", limit: 100
    t.string "id_servicio_limpieza", limit: 100
    t.string "id_habitacion", limit: 100
    t.string "id_empleado", limit: 100
    t.string "id_material", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "reservacion_mesa", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_reservacion", limit: 100
    t.string "id_mesa", limit: 100
    t.string "estado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "reservacion_por_habitacion", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "f_reservacion", limit: 100
    t.string "hora", limit: 100
    t.string "id_cliente", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "reservaciones", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "f_entrada", limit: 100
    t.string "f_salida", limit: 100
    t.string "f_reservacion", limit: 100
    t.string "estado", limit: 100
    t.string "id_cliente", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "reservaciones_en_restaurante", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "f_reservacion", limit: 100
    t.string "hora", limit: 100
    t.string "id_cliente", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "servicio_hotel", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_habitacion", limit: 100
    t.string "fecha", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "servicios", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "servicios_a_habitacion", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_habitacion_rentada", limit: 100
    t.string "id_renta", limit: 100
    t.string "id_historico_servicio", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "servicios_limpieza", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "servicios_limpieza_por_habitacion", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fecha", limit: 100
    t.string "id_servicio_limpieza", limit: 100
    t.string "id_habitacion", limit: 100
    t.string "id_empleado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "servicios_por_paquete", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_historico_servicio", limit: 100
    t.string "id_paquete", limit: 10
    t.index ["id"], name: "id", unique: true
  end

  create_table "solicitudes_de_mantenimiento", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_empleado", limit: 100
    t.string "id_equipo_por_recibo", limit: 100
    t.string "f_solicitud", limit: 100
    t.string "f_recibo", limit: 100
    t.string "estado", limit: 100
    t.string "motivo", limit: 100
    t.string "tipo", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "tipos_de_producto", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "tipo", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "tipos_medidas", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.index ["id"], name: "id", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacantes", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nombre", limit: 100
    t.string "estado", limit: 100
    t.index ["id"], name: "id", unique: true
  end

end
