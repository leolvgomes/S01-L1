class Musico
  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(obra)
    raise NotImplementedError
  end
end

class Pianista < Musico
  def tocar_partitura(obra)
    puts "#{@nome} toca #{obra} no piano"
  end
end

class Violinista < Musico
  def tocar_partitura(obra)
    puts "#{@nome} toca #{obra} no violino"
  end
end

class Maestro
  def initialize(musicos)
    @musicos = musicos
  end

  def iniciar_concerto(obra)
    @musicos.each { |m| m.tocar_partitura(obra) }
  end

  def ajustar_postura(estado)
    @musicos.map { |m| "#{m.instance_variable_get(:@nome)} está em #{estado}" }
  end
end

musicos = [
  Pianista.new("Kosei", "Piano"),
  Violinista.new("Kaori", "Violino")
]

maestro = Maestro.new(musicos)
maestro.iniciar_concerto("Spring Sonata")

puts maestro.ajustar_postura("Allegro")