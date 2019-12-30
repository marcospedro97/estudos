require 'sqlite3'

class Receita
  attr_accessor :nome, :tipo

  def initialize(nome:, tipo:)
    @nome = nome
    @tipo = tipo
  end

  def to_s
    "#{nome} - #{tipo}"
  end

  def to_json(options = {})
    { nome: nome, tipo: tipo }.to_json(options)
  end

  def include?(termo)
    termo.downcase!
    nome.downcase.include?(termo) || tipo.downcase.include?(termo)
  end

  def self.busca(receitas, termo)
    receitas.select do |receita|
      receita.include?(termo)
    end
  end

  def self.create(nome, tipo)
    db = SQLite3::Database.open("cookbook.db")
    db.execute("INSERT INTO receitas(nome, tipo) VALUES(?, ?)", nome, tipo)
  end

  def self.load
    receitas = Array.new
    db = SQLite3::Database.open("cookbook.db")
    db.execute("SELECT * FROM receitas") do |row|
      receitas << Receita.new(nome: row[0], tipo: row[1])
    end
    return receitas
  end
end