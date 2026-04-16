using System;

class CombatenteAliado
{
    private string nome;
    private string linhagem;
    private string patente;

    public CombatenteAliado(string nome, string linhagem, string patente)
    {
        this.nome = nome;
        this.linhagem = linhagem;
        this.patente = patente;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"{nome} - {linhagem} - {patente}");
    }
}

class Program
{
    static void Main()
    {
        CombatenteAliado c1 = new CombatenteAliado("Boromir", "Humano", "Capitão");
        CombatenteAliado c2 = new CombatenteAliado("Gimli", "Anão", "Guerreiro");
        CombatenteAliado c3 = new CombatenteAliado("Legolas", "Elfo", "Arqueiro");

        c1.ApresentarUnidade();
        c2.ApresentarUnidade();
        c3.ApresentarUnidade();
    }
}