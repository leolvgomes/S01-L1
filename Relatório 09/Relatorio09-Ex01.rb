
# ------- Contexto: Cyberpunk 2077 ---------
# O Afterlife e um bar famoso de Night City, frequentado por mercenarios.
# O cardapio possui coqueteis comuns e drinks que homenageiam lendas.
# Cada drink possui um nome fixo e um preco que pode ser reajustado.


# CLASSE BASE
# Representa os coqueteis vendidos no Afterlife
class CoquetelAfterlife

  # ENCAPSULAMENTO
  # attr_reader permite ler o nome, mas nao altera-lo diretamente
  attr_reader :nome

  # CONSTRUTOR
  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  # GETTER MANUAL
  # Retorna o preco atual do coquetel
  def preco
    @_preco
  end

  # SETTER MANUAL
  # O preco so pode ser alterado para valores entre 5 e 200
  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  # METODO DE EXIBICAO
  # Retorna as informacoes do coquetel
  def ficha
    "Drink: #{@nome} | Preço: R$ #{@_preco}"
  end
end


# HERANÇA
# DrinkDeLenda herda os atributos e metodos de CoquetelAfterlife
class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  # SUPER
  # Reaproveita o construtor da classe pai
  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  # SOBRESCRITA DE METODO
  # Reaproveita a ficha do pai e adiciona a lenda homenageada
  def ficha
    "#{super} | Lenda: #{@lenda}"
  end
end


# --- MAIN ---

# Criando um array com um coquetel comum e dois drinks de lenda
drinks = [
  CoquetelAfterlife.new("Night City", 25),
  DrinkDeLenda.new("Johnny Silverhand", 50, "Johnny Silverhand"),
  DrinkDeLenda.new("Jackie Welles", 45, "Jackie Welles")
]

puts "--- Cardápio do Afterlife ---"

# POLIMORFISMO
# Cada objeto executa sua propria versao do metodo ficha
drinks.each do |drink|
  puts drink.ficha
end

# TESTANDO O ENCAPSULAMENTO
puts "\n--- Alterando o preço ---"

# Tentativa de atribuir um preco invalido
drinks[1].preco = 500

# Atribuindo um preco valido
drinks[1].preco = 80

puts drinks[1].ficha

# TESTE DE ATRIBUTO SOMENTE LEITURA
# Esta linha provoca NoMethodError porque nome nao possui setter
# drinks[1].nome = "Novo nome"