from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} usa ultimate defensiva!")

class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} causa dano massivo!")

herois = [
    Tanque("Reinhardt", "Tanque"),
    Dano("Genji", "Dano")
]

for h in herois:
    h.usar_ultimate()