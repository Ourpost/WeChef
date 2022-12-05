class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise validate
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # relationships
  has_many :stores
        
end
