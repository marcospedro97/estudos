require 'rails_helper'

feature 'Admin view all car model' do
  scenario 'successfully' do
    # Arrange
    manufacturer = Manufacturer.create!(name: 'Fabricante')
    car_category = CarCategory.create!(name: 'Tipo A', daily_rate: 100.0, car_insurance: 20.0, third_party_insurance: 30.0)
    CarModel.create!(name: 'carro', year: '2019', Manufacturer: manufacturer, motorization: '10000', CarCategory: car_category, fuel_type: 'Gasolina')

    # Act
    visit root_path
    click_on 'Modelos de carros'

    # Asset
    expect(page).to have_content('carro')
  end
end

feature 'Admin view car model' do
  scenario 'successfully' do
    # Arrange
    manufacturer = Manufacturer.create!(name: 'Fabricante')
    car_category = CarCategory.create!(name: 'Tipo A', daily_rate: 100.0, car_insurance: 20.0, third_party_insurance: 30.0)
    CarModel.create!(name: 'carro', year: '2019', Manufacturer: manufacturer, motorization: '10000', CarCategory: car_category, fuel_type: 'Gasolina')

    # Act
    visit root_path
    click_on 'Modelos de carros'
    click_on 'carro'

    # Asset
    expect(page).to have_content('carro')
    expect(page).to have_content('2019')
  end
end
