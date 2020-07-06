require_relative 'receita'

def  menu
    puts '[1] Cadastrar uma receita'
    puts '[2] Ver todas as receitas'
    puts '[3] Buscar uma receita'
    puts '[4] Sair'
    print 'Escolha uma opção: '
    opcao = gets.to_i
end

def new_recipe
    print 'Digite o nome da sua receita: '
    nome = gets.chomp
    print 'Digite o tipo da sua receita: '
    tipo = gets.chomp
    puts "Receita de #{nome} cadastrada com sucesso!"
    return Receita.new(nome, tipo)
end

def list_recipes(receitas)
    receitas.each_with_index do |receita, index|
        puts "##{index + 1} - #{receita}"
    end
    puts 'Nenhuma receita cadastrada' if receitas.empty?
end

def busca(receitas)
    print "Digite a sua busca: "
    busca = gets.chomp
    resultado = receitas.select {|receita| receita.nome == busca.capitalize || receita.tipo == busca.capitalize }
    if resultado.empty?
        puts "Nenhuma receita encontrada"
    else
        puts resultado
    end
end

receitas = []
puts 'Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!'
opcao = menu
while opcao != 4
  if opcao == 1
    receitas << new_recipe
  elsif opcao == 2
    list_recipes(receitas)
  elsif opcao == 3
    puts busca(receitas)
  else
    puts 'Opção inválida'
  end
  opcao = menu
end

puts 'Obrigado por usar o Cookbook'