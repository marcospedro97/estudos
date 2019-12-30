require 'rails_helper'

feature 'Admin car categories' do
  scenario 'succesfully' do
    # Arrange
    CarCategory.create!(name: 'Tipo A', daily_rate: 100.0, car_insurance: 20.0, third_party_insurance: 30.0)

    # Act
    visit root_path
    click_on 'Categorias'
    click_on 'Tipo A'

    # Assert
    expect(page).to have_content('Tipo A')
  end
end

feature 'Admin create car category' do
  scenario 'succesfully' do
    # Act
    visit root_path
    click_on 'Categorias'
    click_on 'Registrar nova categoria'

    fill_in 'Nome', with: 'Tipo A'
    fill_in 'Valor diária', with: '100.0'
    fill_in 'Seguro do veículo', with: '20.0'
    fill_in 'Seguro contra terceiros', with: '30.0'
    click_on 'Enviar'
    # Assert
    expect(page).to have_content('Tipo A')
    expect(page).to have_content('Categoria criada com sucesso')
  end

  feature 'Admin edit car category' do
    scenario 'succesfully' do
      # Arrange
      CarCategory.create!(name: 'Tipo A', daily_rate: 100.0, car_insurance: 20.0, third_party_insurance: 30.0)

      # Act
      visit root_path
      click_on 'Categorias'
      click_on 'Tipo A'
      click_on 'Editar'
      fill_in 'Nome', with: 'Tipo B'
      fill_in 'Valor diária', with: '200.0'
      fill_in 'Seguro do veículo', with: '40.0'
      fill_in 'Seguro contra terceiros', with: '60.0'
      click_on 'Enviar'

      # Assert
      expect(page).to have_content('Tipo B')
    end
  end

  feature 'Validates create car category' do
    scenario 'succesfully' do
      # Act
      visit root_path
      click_on 'Categorias'
      click_on 'Registrar nova categoria'
      fill_in 'Nome', with: ''
      fill_in 'Valor diária', with: 'cem'
      fill_in 'Seguro do veículo', with: '20.0'
      fill_in 'Seguro contra terceiros', with: '30.0'
      click_on 'Enviar'
      # Assert
      expect(page).to have_content('Nome não pode ficar vazio')
      expect(page).to have_content('Diária deve ser númérica')
    end
  end
end
