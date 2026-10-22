
# ------- Contexto: Your Lie in April ---------
# Jovens musicos participam de apresentacoes e competicoes.
# O solista conduz a melodia principal, enquanto o acompanhador
# segue seu ritmo. Todos sao conduzidos por um regente.


# CLASSE BASE - ABSTRAÇÃO
# Define o comportamento geral de um instrumentista
class Instrumentista
  attr_reader :nome, :instrumento

  # CONSTRUTOR
  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  # METODO ABSTRATO (equivalente)
  # As classes filhas devem implementar interpretar
  def interpretar(peca)
    raise NotImplementedError, "A classe deve implementar interpretar"
  end
end


# HERANÇA
# Solista herda de Instrumentista
class Solista < Instrumentista

  # SOBRESCRITA
  # Define o comportamento especifico do solista
  def interpretar(peca)
    puts "#{nome}, no #{instrumento}, interpreta #{peca} conduzindo a melodia principal."
  end
end


# HERANÇA
# Acompanhador tambem herda de Instrumentista
class Acompanhador < Instrumentista

  # SOBRESCRITA
  # Define o comportamento especifico do acompanhador
  def interpretar(peca)
    puts "#{nome}, no #{instrumento}, interpreta #{peca} acompanhando o ritmo do solista."
  end
end


# CLASSE REGENTE
# Responsavel por organizar e conduzir a orquestra
class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  # Adiciona um instrumentista ao array
  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  # POLIMORFISMO
  # Chama interpretar em cada instrumentista
  def reger(peca)
    puts "\n--- Apresentação: #{peca} ---"
    puts "Regente: #{@nome}"

    @orquestra.each do |instrumentista|
      instrumentista.interpretar(peca)
    end
  end

  # COLLECTIONS - MAP
  # Cria um novo array com a classe e o nome de cada musico
  def escalacao
    @orquestra.map do |instrumentista|
      "#{instrumentista.class}: #{instrumentista.nome}"
    end
  end
end


# --- MAIN ---

# Criando os instrumentistas
kousei = Solista.new("Kousei Arima", "Piano")
kaori = Acompanhador.new("Kaori Miyazono", "Violino")

# Criando o regente
regente = Regente.new("Hiroko Seto")

# Convocando os musicos
regente.convocar(kousei)
regente.convocar(kaori)

# Iniciando a apresentacao
regente.reger("Ballade No. 1")

# Exibindo a escalacao
puts "\n--- Escalação da orquestra ---"

regente.escalacao.each do |musico|
  puts musico
end

# TESTE DE ABSTRAÇÃO
# O objeto pode ser criado normalmente
instrumentista = Instrumentista.new("Musico generico", "Piano")

# Mas interpretar gera NotImplementedError
# instrumentista.interpretar("Teste")