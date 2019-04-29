class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  def valid_word?(word)
    reg = /[a-zA-Z ]*/
    regex_validator(reg, word)
  end

  def valid_alpha?(words)
    reg = /[a-zA-Z0-9 ]*/
  end

  def valid_name?(name)
    #reg = /^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$/
    reg = /\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i
    regex_validator(reg, name)
  end

  def valid_words?(words)
    reg = /[a-zA-Z ]*/
    regex_validator(reg, words)
  end

  def valid_email?(email)
    reg = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    regex_validator(reg, email)
  end

  def valid_number?(number)
    reg = /[0-9]*/
    regex_validator(reg, number)
  end

  def valid_price?(number)
    reg = /[0-9]*\.[0-9]/
    regex_validator(reg, number.to_s)
  end

  def valid_telefono?(telefono)
    reg = /^[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/
    regex_validator(reg, telefono)
  end

  def valid_date?(date)
    reg = /[0-3][0-9]\/[0-1][0-2]\/[0-1][0-9]/
    regex_validator(reg, date.to_s)
  end

  def valid_rfc?(rfc)
    reg = /[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z0-9][A-Z0-9][A-Z0-9]/
    regex_validator(reg, rfc)
  end

  def regex_validator(reg, word)
    reg.match(word) ? true : false
  end

end
