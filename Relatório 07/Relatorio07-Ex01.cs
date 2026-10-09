
using System;

public class CombatenteDeGondor
{
    // ENCAPSULAMENTO
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    // CONSTRUTOR
    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
    }

    // Método para equipar o combatente
    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    // Método para apresentar o combatente
    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");

        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===");

        CombatenteDeGondor combatente1 =
            new CombatenteDeGondor("Aragorn", "Homens", "Rei");

        CombatenteDeGondor combatente2 =
            new CombatenteDeGondor("Gandalf", "Maiar", "Mago");

        CombatenteDeGondor combatente3 =
            new CombatenteDeGondor("Faramir", "Homens", "Capitao");

        combatente1.Equipar("Anduril");
        combatente3.Equipar("Espada");

        combatente1.ApresentarUnidade();
        combatente2.ApresentarUnidade();
        combatente3.ApresentarUnidade();

        // ERRO: Posto possui private set
        // combatente1.Posto = "Soldado";
        // A propriedade só pode ser alterada dentro da classe.

        Console.WriteLine("\n=== Fim da Demonstracao ===");
    }
}
