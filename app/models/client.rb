class Client < ActiveRecord::Base

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  CPF_REGEX   = /([0-9])\w{10}/i
  # Validations
  validates :first_name, :last_name, :phone, :email, :cpf, presence: true
  validates :email, format: { with:  EMAIL_REGEX }, uniqueness: true
  validates :cpf, format: { with: CPF_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 } allow_blank: true

  has_secure_password
end
