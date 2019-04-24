class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :roles
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

         enum roles: %i[admin hotel restaurant rrhh ]

end
