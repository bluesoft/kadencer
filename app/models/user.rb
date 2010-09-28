class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :subdomain
end
