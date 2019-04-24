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

    def regex_validator(reg, word)
      reg.match(word) ? true : false
    end
 end


