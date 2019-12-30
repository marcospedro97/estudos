require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'succesfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Tatuapé'
    fill_in 'CNPJ', with: '11111111111111'
    fill_in 'Endereço', with: 'Rua Tuití 500'
    click_on 'Enviar'

    expect(page).to have_content('Tatuapé')
    expect(page).to have_content('Filial criada com sucesso')

  end

  scenario 'and must fill in all fields' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você corrigir os seguintes erros para continuar')
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end

  scenario 'name must be unique' do
    Subsidiary.create!(name: 'Paulista', cnpj: '00000000000000', adress: 'av. Paulista 500')

    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova filial'

    fill_in 'Nome', with: 'Paulista'
    fill_in 'CNPJ', with: '00000000000000'
    fill_in 'Endereço', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você corrigir os seguintes erros para continuar')
    expect(page).to have_content('Nome deve ser único')
    expect(page).to have_content('CNPJ deve ser único')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end
end

feature 'Admin delete subsidiary' do
  scenario 'delete subsidiary' do
    Subsidiary.create!(name: 'Paulista', cnpj: '00000000000000', adress: 'av. Paulista 500')

    visit root_path
    click_on('Filiais')
    click_on('Paulista')
    click_on('Apagar')

    expect(page).to have_no_content('Paulista')
    expect(page).to have_content('Filial apagada com sucesso')
  end
end

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    Subsidiary.create(name: 'Paulista', cnpj: '00000000000000', adress: 'Av. Paulista 500')

    visit root_path
    click_on 'Filiais'
    click_on 'Paulista'
    click_on 'Editar'
    fill_in 'Nome', with: 'Faria Lima'
    fill_in 'CNPJ', with: '11111111111111'
    fill_in 'Endereço', with: 'Av. Faria Lima 1000'
    click_on 'Enviar'

    expect(page).to have_content('Faria Lima')
  end
end

feature 'Admin view subsidiaries' do
  scenario 'succesfully' do
  # Arrange
  Subsidiary.create!(name: 'Paulista', cnpj: "11111111111111", adress: "Av. Paulista 500")
  
  # Act
  visit root_path
  click_on 'Filiais'
  click_on 'Paulista'

  # Assert
  expect(page).to have_content('Paulista')
  expect(page).to have_link('Voltar')
  end
end