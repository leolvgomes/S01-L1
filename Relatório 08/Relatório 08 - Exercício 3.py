class ArmaCorpoACorpo:
    def __init__(self, nome):
        self.nome = nome

class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

class Joker:
    def __init__(self, equipe):
        self.arma = ArmaCorpoACorpo("Faca")
        self.equipe = equipe

    def mostrar_equipe(self):
        for membro in self.equipe:
            print(f"{membro.nome} - arma: {membro.arma}")

equipe = [
    PhantomThieves("Ryuji", "Bastão"),
    PhantomThieves("Ann", "Chicote")
]

joker = Joker(equipe)
joker.mostrar_equipe()