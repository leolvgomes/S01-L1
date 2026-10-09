
# CLASSE PERSONA
class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"\nPersona: {self.nome}")
        print(f"Arcano: {self.arcano}")


# CLASSE ALIADO
class Aliado:

    def __init__(self, nome: str, codinome: str):
        self.nome = nome
        self.codinome = codinome


# CLASSE LIDER
class Lider:

    def __init__(self, codinome: str):
        self.codinome = codinome

        # COMPOSIÇÃO
        # A Persona é criada junto com o líder
        self.persona = Persona("Arsène", "Louco")

        self._equipe = []

    # AGREGAÇÃO
    # Os aliados existem independentemente do líder
    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"{aliado.codinome} entrou para a equipe!")

    def infiltrar(self, palacio):
        print(f"\n=== Palácio de {palacio} ===")
        print(f"Líder: {self.codinome}")

        # Invocando a Persona
        self.persona.invocar()

        # Listando os aliados
        print("\n--- Equipe ---")

        for aliado in self._equipe:
            print(f"{aliado.nome} | Codinome: {aliado.codinome}")


if __name__ == "__main__":
    print("=== Phantom Thieves ===")

    # Aliados criados antes do líder
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    # Criando o líder
    joker = Lider("Joker")

    # AGREGAÇÃO: recrutando aliados existentes
    joker.recrutar(ryuji)
    joker.recrutar(ann)

    # Infiltrando no Palácio
    joker.infiltrar("Kamoshida")

    print("\n=== Fim da Infiltração ===")
