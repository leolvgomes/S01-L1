class BebidaAfterlife
  attr_accessor :nome

  def initialize(nome, custo_base)
    @nome = nome
    self.custo_base = custo_base
  end

  def custo_base
    @custo_base
  end

  def custo_base=(valor)
    @custo_base = valor if valor > 0
  end

  def preco_total
    @custo_base
  end

  def to_s
    "Bebida: #{@nome} | Valor Final: $#{preco_total}"
  end
end

class DrinkIconico < BebidaAfterlife
  def initialize(nome, custo_base, nivel_notoriedade)
    super(nome, custo_base)
    @nivel_notoriedade = nivel_notoriedade
  end

  def preco_total
    @custo_base + (@nivel_notoriedade * 8)
  end
end

drinks = [
  DrinkIconico.new("Johnny Silverhand", 20, 5),
  DrinkIconico.new("David Martinez", 15, 3),
  DrinkIconico.new("Rogue", 18, 4)
]

drinks.each { |d| puts d }