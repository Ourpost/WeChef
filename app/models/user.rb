# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar

  # devise validate
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:google_oauth2]

  # relationships
  has_many :stores, dependent: :destroy
  has_many :orders

  enum role: { user: 0, vender: 1 }

  # google api
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
