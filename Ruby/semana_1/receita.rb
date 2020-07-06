class Receita
    attr_reader :nome, :tipo
    def initialize(nome, tipo)
        @nome = nome.capitalize
        @tipo = tipo.capitalize
    end

    def to_s
        "{'nome': '#{@nome}', 'tipo': '#{@tipo}'"
    end
end