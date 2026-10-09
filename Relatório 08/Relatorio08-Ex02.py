
# CLASSE BASE
class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"\n{self.codinome} usou uma suprema genérica!")


# HERANÇA
class HeroiTanque(HeroiOverwatch):

    # SOBRESCRITA
    def usar_suprema(self):
        print(f"\n{self.codinome} usou sua suprema de Tanque!")
        print("O inimigo foi derrubado!")


# HERANÇA
class HeroiSuporte(HeroiOverwatch):

    # SOBRESCRITA
    def usar_suprema(self):
        print(f"\n{self.codinome} usou sua suprema de Suporte!")
        print("A equipe recebeu um aumento de cura!")

    # Método exclusivo do suporte
    def curar_equipe(self):
        print(f"{self.codinome} está curando a equipe!")


if __name__ == "__main__":
    print("=== Batalha Overwatch ===")

    soldado = HeroiOverwatch("Soldado 76", "Dano")
    reinhardt = HeroiTanque("Reinhardt", "Tanque")
    mercy = HeroiSuporte("Mercy", "Suporte")

    # POLIMORFISMO
    equipe: list[HeroiOverwatch] = [
        soldado,
        reinhardt,
        mercy
    ]

    for heroi in equipe:
        heroi.usar_suprema()

        # Verifica se o herói é um suporte
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()

    print("\n=== Fim da Batalha ===")
