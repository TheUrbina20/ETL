class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  def valid_word?(word)
    reg = /[a-zA-Z]*/
    regex_validator(reg, word)
  end

  def valid_name?(name)
    reg = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/
    regex_validator(reg, name)
  end

  def valid_email?(email)
    reg = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    regex_validator(reg, email)
  end

  def valid_number?(number)
    reg = /[0.9]*/
    regex_validator(reg, number)
  end

  def valid_date?(date)
    reg = /[0-3][0-9]\/[0-1][0-2]\/[0-1][0-9]/
    regex_validator(reg, date.to_s)
  end

  def regex_validator(reg, word)
    reg.match(word) ? true : false
  end

end
