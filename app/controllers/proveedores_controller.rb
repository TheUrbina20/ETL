class ProveedoresController < ApplicationController
  def index
    initialize_proveedores
    @proveedores = Proveedor.using(:dwh_t).all
  end

  private


  def initialize_proveedores
    Proveedor.using(:dwh_t).destroy_all
    proveedores = Proveedor.using(:rrhh).all

    proveedores.each do |proveedor_r|
      proveedor = Proveedor.using(:dwh_t).new()

      #proveedor.id = proveedor_r.id
      proveedor.nombre = proveedor_r.nombre
      proveedor.id_empresa = proveedor_r.id_empresa
      proveedor.save!
    end
  end
end
