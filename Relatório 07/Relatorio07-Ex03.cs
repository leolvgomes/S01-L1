
using System;
using System.Collections.Generic;

// CLASSE GRIMORIO
public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"\nFeitico favorito: {FeiticoFavorito}");
    }
}

// CLASSE COMPANHEIRO
public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    // CONSTRUTOR
    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"\nNome: {Nome}");
        Console.WriteLine($"Funcao: {Funcao}");
    }
}

// CLASSE MAGA
public class Maga
{
    public string Nome { get; set; }

    // COMPOSIÇÃO
    public Grimorio GrimorioAssociado { get; set; }

    // Lista privada de companheiros
    private List<Companheiro> _companheiros;

    // CONSTRUTOR
    public Maga(string nome)
    {
        this.Nome = nome;

        // COMPOSIÇÃO: o grimorio nasce com a maga
        this.GrimorioAssociado = new Grimorio();

        this._companheiros = new List<Companheiro>();
    }

    // AGREGAÇÃO
    // Os companheiros existem independentemente da maga
    public void Recrutar(Companheiro c)
    {
        this._companheiros.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\n=== Grupo de {Nome} ===");

        foreach (var companheiro in _companheiros)
        {
            companheiro.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Jornada de Frieren ===");

        // Companheiros criados antes da maga
        Companheiro fern =
            new Companheiro("Fern", "Maga");

        Companheiro stark =
            new Companheiro("Stark", "Guerreiro");

        // Criação da maga
        Maga frieren = new Maga("Frieren");

        // AGREGAÇÃO: recrutando companheiros existentes
        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        // Definindo o feitiço favorito
        frieren.GrimorioAssociado.FeiticoFavorito = "Zoltraak";

        // Exibindo o grupo e o grimorio
        frieren.MostrarGrupo();
        frieren.GrimorioAssociado.Abrir();

        Console.WriteLine("\n=== Fim da Jornada ===");
    }
}
