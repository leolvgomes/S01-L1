module Localizavel
  def local_atual
    puts "#{@nome} está no local"
  end
end

module Perigoso
  def exibir_ameaca
    puts "#{@nome} é perigoso!"
  end
end

class Pessoa
  def initialize(nome)
    @nome = nome
  end
end

class Testemunha < Pessoa
  include Localizavel
end

class Suspeito < Pessoa
  include Localizavel
  include Perigoso
end

class CenaDoCrime
  def initialize
    @pessoas = []
  end

  def adicionar_pessoa(p)
    @pessoas << p
  end

  def listar_todos
    @pessoas.each { |p| puts p.inspect }
  end

  def identificar_perigosos
    @pessoas.select { |p| p.respond_to?(:exibir_ameaca) }
  end
end

t = Testemunha.new("John")
s1 = Suspeito.new("Moriarty")
s2 = Suspeito.new("Irene")

cena = CenaDoCrime.new

cena.adicionar_pessoa(t)
cena.adicionar_pessoa(s1)
cena.adicionar_pessoa(s2)

cena.listar_todos

puts "Perigosos:"
cena.identificar_perigosos.each { |p| p.exibir_ameaca }