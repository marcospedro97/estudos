class CarCategory < ApplicationRecord
  validates :name, presence: { message: 'Nome não pode ficar vazio' }
  validates :daily_rate, numericality: { message: 'Diária deve ser númérica' }
  validates :car_insurance, numericality: { message: 'Seguro do veículo deve ser númérico' }
  validates :third_party_insurance, numericality: { message: 'Seguro contra terceiros deve ser númérico' }
end
