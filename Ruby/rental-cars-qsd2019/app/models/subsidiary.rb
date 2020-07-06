class Subsidiary < ApplicationRecord
  validates :cnpj, presence: { message: 'CNPJ não pode ficar em branco' }
  validates :cnpj, uniqueness: { message: 'CNPJ deve ser único' }
  validates :cnpj, length: { is: 14, message: 'CNPJ deve ter 14 digitos' }
  validates :cnpj, numericality: { only_integer: true, message: 'CNPJ deve ter apenas inteiros' }
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
  validates :name, uniqueness: { message: 'Nome deve ser único' }
  validates :adress, presence: { message: 'Endereço não pode ficar em branco'}
end
