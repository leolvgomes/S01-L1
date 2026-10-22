
# ------- Contexto: Steins;Gate ---------
# No Laboratorio de Gadgets do Futuro, o PhoneWave e um dispositivo
# construido dentro do laboratorio, capaz de enviar mensagens ao passado.
# Os membros ja existem antes de entrar no laboratorio.


# OBJETO UTILIZADO NA COMPOSIÇÃO
class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail: '#{mensagem}' foi enviada para o passado pelo PhoneWave!"
  end
end


# CLASSE DOS MEMBROS
class MembroDoLab
  attr_reader :numero, :nome

  # CONSTRUTOR
  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end


# COMPOSIÇÃO + AGREGAÇÃO
class LaboratorioDeGadgets

  # CONSTRUTOR
  def initialize

    # COMPOSIÇÃO
    # O PhoneWave e criado dentro do laboratorio.
    # O laboratorio controla a criacao do aparelho.
    @phonewave = PhoneWave.new

    # Array que armazena os membros admitidos
    @membros = []
  end

  # AGREGAÇÃO
  # Recebe um membro que ja existia fora do laboratorio
  def admitir(membro)
    @membros << membro
    puts "Lab Mem ##{membro.numero}: #{membro.nome} foi admitido!"
  end

  # METODO DE EXPERIMENTO
  # Lista os membros e utiliza o PhoneWave
  def experimento(mensagem)
    puts "\n--- Experimento do Laboratório de Gadgets ---"

    # COLLECTIONS - EACH
    @membros.each do |membro|
      puts "Presente: Lab Mem ##{membro.numero} - #{membro.nome}"
    end

    @phonewave.enviar_dmail(mensagem)
  end
end


# --- MAIN ---

# AGREGAÇÃO
# Os membros sao criados antes do laboratorio.
# Mesmo sem o laboratorio, continuam existindo independentemente.
okabe = MembroDoLab.new(1, "Rintarou Okabe")
kurisu = MembroDoLab.new(4, "Kurisu Makise")

# Criando o laboratorio
laboratorio = LaboratorioDeGadgets.new

# Admitindo os membros
laboratorio.admitir(okabe)
laboratorio.admitir(kurisu)

# Executando o experimento
laboratorio.experimento("El Psy Kongroo")