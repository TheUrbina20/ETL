class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  enum role: %i[admin hotel restaurant rrhh]


  def can_manage_hotel?
    admin? || hotel?
  end

  def can_manage_restaurant?
    admin? || restaurant?
  end

  def can_manage_rrhh?
    admin? || rrhh?
  end
end
