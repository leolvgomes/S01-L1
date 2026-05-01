class MicroondasTelefone
  def ativar
    puts "Banana Verde detectada! O Microondas-Telefone está operando!"
  end
end

class Relatorio
  attr_accessor :nome_projeto, :autor

  def initialize(nome_projeto, autor)
    @nome_projeto = nome_projeto
    @autor = autor
  end
end

class LabRegistro
  def initialize
    @microondas = MicroondasTelefone.new
    @registros = []
  end

  def adicionar_registro(nome_projeto, autor)
    @microondas.ativar
    @registros << Relatorio.new(nome_projeto, autor)
  end

  def listar_experimentos
    @registros.each do |r|
      puts "#{r.nome_projeto} - #{r.autor}"
    end
  end
end

lab = LabRegistro.new

lab.adicionar_registro("KRR", "Okabe")
lab.adicionar_registro("CERN Hack", "Kurisu")

lab.listar_experimentos