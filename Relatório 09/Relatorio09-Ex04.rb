
# ------- Contexto: Sherlock Holmes ---------
# Sherlock investiga um crime ouvindo testemunhas e suspeitos.
# Todos podem depor, mas somente os suspeitos podem ser detidos
# e encaminhados a Scotland Yard.


# MÓDULO COMO CONTRATO
# Define um comportamento que as classes devem implementar
module Depoente
  def depor
    raise NotImplementedError, "#{self.class} deve implementar depor"
  end
end


# MÓDULO COM IMPLEMENTAÇÃO PRONTA
# Classes que incluem Detivel recebem o metodo ser_detido
module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end


# CLASSE BASE
# Representa qualquer pessoa envolvida na investigacao
class Envolvido
  attr_reader :nome

  # CONSTRUTOR
  def initialize(nome)
    @nome = nome
  end
end


# HERANÇA + MÓDULO
# A testemunha herda de Envolvido e inclui apenas Depoente
class TestemunhaOcular < Envolvido
  include Depoente

  # IMPLEMENTAÇÃO DO MÓDULO
  def depor
    puts "#{nome} testemunhou: 'Vi uma pessoa saindo da cena do crime.'"
  end
end


# HERANÇA + DOIS MÓDULOS
# O suspeito pode depor e tambem ser detido
class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  # IMPLEMENTAÇÃO DO MÓDULO
  def depor
    puts "#{nome} apresenta seu álibi: 'Eu estava em casa naquela noite.'"
  end
end


# AGREGAÇÃO + POLIMORFISMO
# A investigacao recebe pessoas que ja foram criadas
class Investigacao

  # CONSTRUTOR
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  # AGREGAÇÃO
  # Adiciona um envolvido ao array
  def registrar(envolvido)
    @envolvidos << envolvido
  end

  # POLIMORFISMO
  # Todos executam depor, mas cada classe tem sua implementacao
  def ouvir_todos
    puts "\n--- Investigação: #{@caso} ---"

    @envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  # INTROSPECÇÃO COM SELECT
  # Filtra apenas os envolvidos que podem ser detidos
  def acionar_scotland_yard
    puts "\n--- Scotland Yard ---"

    # respond_to? verifica se o objeto possui determinado metodo
    detiveis = @envolvidos.select do |envolvido|
      envolvido.respond_to?(:ser_detido)
    end

    # Apenas os suspeitos possuem o metodo ser_detido
    detiveis.each do |envolvido|
      envolvido.ser_detido
    end
  end
end


# --- MAIN ---

# AGREGAÇÃO
# Os envolvidos sao criados antes da investigacao
testemunha = TestemunhaOcular.new("John Watson")
suspeito1 = SuspeitoDoCrime.new("James Moriarty")
suspeito2 = SuspeitoDoCrime.new("Sebastian Moran")

# Criando a investigacao
investigacao = Investigacao.new("O Mistério da Baker Street")

# Registrando os envolvidos
investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

# POLIMORFISMO
# Cada envolvido apresenta seu depoimento
investigacao.ouvir_todos

# Apenas os suspeitos sao detidos
investigacao.acionar_scotland_yard