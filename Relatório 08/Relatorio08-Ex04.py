
from abc import ABC, abstractmethod


# INTERFACE
class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


# CLASSE CYBERDECK
class Cyberdeck:

    def __init__(self, modelo: str):
        self.modelo = modelo


# IMPLEMENTAÇÃO DA INTERFACE
class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome: str, modelo: str):
        self.nome = nome

        # COMPOSIÇÃO
        # O Cyberdeck é criado junto com o Netrunner
        self.cyberdeck = Cyberdeck(modelo)

    def executar_invasao(self):
        print(f"\nNetrunner: {self.nome}")
        print(f"Cyberdeck: {self.cyberdeck.modelo}")
        print("Quebrando o gelo (ICE) do servidor!")


# IMPLEMENTAÇÃO DA INTERFACE
class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"\nDrone: {self.codigo}")
        print("Interceptando o sinal da rede!")


# CLASSE CELULA HACKER
class CelulaHacker:

    # AGREGAÇÃO
    # Recebe unidades que já foram criadas
    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self._membros = membros

    def iniciar_ataque(self):
        print(f"\n=== Ataque da Célula {self.nome} ===")

        # POLIMORFISMO
        for membro in self._membros:
            membro.executar_invasao()


if __name__ == "__main__":
    print("=== Cyberpunk: Night City ===")

    # Criando as unidades
    netrunner = OperadorNetrunner("V", "Militech Paraline")
    drone = DroneDeVigilancia("DR-2077")

    # Criando a célula com membros existentes
    membros: list[IUnidadeDeRede] = [
        netrunner,
        drone
    ]

    celula = CelulaHacker("Samurai", membros)

    # Iniciando o ataque
    celula.iniciar_ataque()

    # ERRO: não é possível instanciar uma classe abstrata
    # unidade = IUnidadeDeRede()

    print("\n=== Fim da Operação ===")
