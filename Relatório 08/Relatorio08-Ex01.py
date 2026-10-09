
# CLASSE BASE
class MortoVivo:

    # CONSTRUTOR
    def __init__(self, nome: str, almas: int, estus: int):
        self.nome = nome          # público
        self._almas = almas       # protegido
        self.__estus = 0          # privado
        self.set_estus(estus)

    # GETTER
    def get_estus(self):
        return self.__estus

    # SETTER
    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")

    def mostrar_status(self):
        return (f"Morto-vivo {self.nome} | Almas: {self._almas} | "
                f"Estus: {self.__estus}")


# HERANÇA
class Clerigo(MortoVivo):

    def __init__(self, nome: str, almas: int, estus: int, milagre: str):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    # SOBRESCRITA
    def mostrar_status(self):
        return (f"{super().mostrar_status()} | "
                f"Milagre: {self.milagre}")


if __name__ == "__main__":
    print("=== Dark Souls ===")

    clerigo = Clerigo("Petrus", 2000, 5, "Cura")

    print("\n--- Status Inicial ---")
    print(clerigo.mostrar_status())

    # Testando o setter com valor inválido
    clerigo.set_estus(15)

    # Testando o setter com valor válido
    clerigo.set_estus(10)

    print("\n--- Status Final ---")
    print(clerigo.mostrar_status())

    # ENCAPSULAMENTO
    # Acesso direto ao atributo privado gera AttributeError
    # print(clerigo.__estus)

    # Forma correta de acessar o atributo
    print(f"\nEstus via getter: {clerigo.get_estus()}")
