class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise validate
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


         

  # relationships
  has_many :stores
  has_many :orders
  
  enum role: {user: 0, vender:1}
end
