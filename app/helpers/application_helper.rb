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
      # reg = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/
      # reg = /\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i
      reg = /^([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\']+[\s])+([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\'])+[\s]?([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\'])?$/
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

    def valid_genero?(genero)
      reg = /^M$|F$/
      regex_validator(reg, genero)
    end


    def valid_price?(number)
      reg = /^[0-9]*\.[0-9]$/
      regex_validator(reg, number)
    end

    def valid_status? (status)
      reg = /^Activa$|Cancelada$/
      regex_validator(reg, status)
    end

    def valid_estado?(status)
      reg = /^Activo$|Inactivo$/
      regex_validator(reg, status)
    end

    def valid_tipomantenimietno (tipo)
      reg = /^Preventivo$|Correctivo$/
      regex_validator(reg, tipo)
    end

    def valid_date?(date)
      !!(date&.match(/\d{2}-\d{2}-\d{4}/) && Date.strptime(date, '%d-%m-%y'))
      # reg = /^[0-3][0-9]\/(0?[1-9]|1[012])\/[0-1][0-9]$/
      #regex_validator(reg, date)
    end

    def valid_word?(word)
      reg = /[a-zA-Z]*$/
      regex_validator(reg, word)
    end

    def valid_words?(words)
      reg = /[a-zA-Z ]*$/
      regex_validator(reg, words)
    end

    def valid_rfc?(rfc)
      reg = /^[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z0-9][A-Z0-9][A-Z0-9]$/
      regex_validator(reg, rfc)
    end

    def valid_number?(number)
      reg = /^[0-9]*$/
      regex_validator(reg, number)
    end

    def valid_estado_capacitacion?(estado)
      reg = /^Cancelado$|^Finalizado$|^Pendiente$|^Programado$/
      regex_validator(reg, estado)
    end

    def valid_estadoc?(estado)
      reg = /^([A-Za-zÁÉÍÓÚñáéíóúÑ]|[A-Za-zÁÉÍÓÚñáéíóúÑ\']+[\s])+([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\'])+[\s]?([A-Za-zÁÉÍÓÚñáéíóúÑ]{0}?[A-Za-zÁÉÍÓÚñáéíóúÑ\'])?$/
      regex_validator(reg, estado)
    end

    def valid_nombrecosas?(nombre)
      reg = /^[A-Za-zÁÉÍÓÚñáéíóúÑ]*$|^[A-Za-zÁÉÍÓÚñáéíóúÑ]*\s{1}[A-Za-zÁÉÍÓÚñáéíóúÑ]*$|^[A-Za-zÁÉÍÓÚñáéíóúÑ]*\s{1}[A-Za-zÁÉÍÓÚñáéíóúÑ]*\s{1}[A-Za-zÁÉÍÓÚñáéíóúÑ]*$/
      regex_validator(reg, nombre)
    end

    def valid_numserie?(serie)
      reg = /^[A-Z][0-9][0-9][A-Z][A-Z][0-9][A-Z][A-Z][A-Z][A-Z][A-Z][0-9]$/
      regex_validator(reg, serie)
    end

    def valid_tipopago?(tipo)
      reg = /^Contado$|^Credito$/
      regex_validator(reg, tipo)
    end

    def valid_alpha?(words)
      reg = /[a-zA-Z0-9 ]*/
    end

    def valid_estadopostulante?(estado)
      reg = /^En proceso$|^Rechazado$|^Contratado$/
      regex_validator(reg, estado)
    end

    def regex_validator(reg, word)
      reg.match(word) ? true : false
    end
 end


