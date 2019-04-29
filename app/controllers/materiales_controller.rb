class MaterialesController < ApplicationController
  def index
    initialize_materials
    if current_user.admin?
      @materiales = Material.using(:dwh_t).where(error: true).order(:nombre)
    elsif current_user.hotel?
      @materiales = Material.using(:dwh_t).where(sistema: 'H', error: true).order(:nombre)
    elsif current_user.rrhh?
      @materiales = Material.using(:dwh_t).where(sistema: 'RR', error: true).order(:nombre)
    else
      @materiales = Material.using(:dwh_t).where(sistema: 'R', error: true).order(:nombre)
    end

  end

  def edit
    @material = Material.using(:dwh_t).find(params[:id])
  end

  def update
    @material = Material.using(:dwh_t).find(params[:id])
    if @material.update(material_params)
      flash[:notice] = 'Material actualizado'
      redirect_to materiales_path
    else
      flash.now[:alert] = 'Error actualizando'
      render 'edit'
    end
  end

  def material_params
    params.require(:material).permit(:id, :nombre, :stock_min, :stock_max, :cantidad_stock, :id_sistema)
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
      material.save!
    end

  end
end
