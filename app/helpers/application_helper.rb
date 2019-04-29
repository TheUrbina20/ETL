module ApplicationHelper
    def flash_class(category)
        case category
            when 'notice' then "alert alert-info"
            when 'success' then "alert alert-success"
            when 'warning' then "alert alert-warning"
            when 'error' then "alert alert-error"
            else "alert alert-danger"
        end
    end

    def valid_name?(name)
      reg = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/
      regex_validator(reg, name)
    end

    def valid_email?(email)
      reg = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
      regex_validator(reg, email)
    end

    def valid_telefono?(telefono)
      reg = /^[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/
      regex_validator(reg, telefono)
    end

    def valid_activah?(estado)
      reg = /^Activa$|Inactiva$/
      regex_validator(reg, estado )
    end

    def valid_nombre_servicio? (nombre)
      reg = /^[A-Za-z]*$/
      regex_validator(reg, nombre )
    end

    def valid_cantidad? (cantidad)
      reg = /^\d+$/
      regex_validator(reg, cantidad )
    end

    def valid_precio? (precio)
      reg = /^\d+.\d+$/
      regex_validator(reg, precio )
    end

    def valid_status? (status)
      reg = /^Activa$|Cancelada$/
      regex_validator(reg, status)
    end

    def valid_tipomantenimietno (tipo)
      reg = /^Preventivo$|Correctivo$/
      regex_validator(reg, tipo)
    end

    def valid_date?(date)
      reg = /^[0-3][0-9]\/(0?[1-9]|1[012])\/[0-1][0-9]$/
      regex_validator(reg, date)
    end

    def regex_validator(reg, word)
      reg.match(word) ? true : false
    end
 end


