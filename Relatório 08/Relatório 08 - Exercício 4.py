from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao

class NetRunner(Cibernetico):
    def __init__(self, nome):
        self.nome = nome
        self.implante = Implante(5000, "Hack avançado")

    def realizar_hack(self):
        print(f"{self.nome} executa um hack com {self.implante.funcao}")

class Faccao:
    def __init__(self, membros):
        self.membros = membros

    def executar_hacks(self):
        for m in self.membros:
            m.realizar_hack()

n1 = NetRunner("V")
n2 = NetRunner("Lucy")

faccao = Faccao([n1, n2])
faccao.executar_hacks()