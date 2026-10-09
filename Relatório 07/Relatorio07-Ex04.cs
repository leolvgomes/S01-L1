
using System;
using System.Collections.Generic;

// CLASSE BASE
public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    // CONSTRUTOR
    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    // Método virtual
    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"{Nome} esta se manifestando!");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

// HERANÇA
public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    // SOBRESCRITA sem chamar o pai
    public override void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"{Nome} emerge das profundezas do oceano!");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

// HERANÇA
public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    // SOBRESCRITA chamando o método do pai
    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"{Nome} emite sons alienigenas!");
    }
}

// CLASSE PESQUISADOR
public class Pesquisador
{
    public string Nome { get; set; }

    // Lista privada de entidades
    private List<EntidadeCosmica> _catalogo;

    // CONSTRUTOR
    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    // AGREGAÇÃO
    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    // POLIMORFISMO
    public void LerCatalogo()
    {
        Console.WriteLine($"\n=== Catalogo de {Nome} ===");

        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Biblioteca Miskatonic ===");

        // Criando as entidades
        EntidadeCosmica cthulhu =
            new EntidadeCosmica("Cthulhu");

        Profundo dagon =
            new Profundo("Dagon");

        MiGo alienigena =
            new MiGo("Mi-Go");

        // Definindo a origem de algumas entidades
        cthulhu.Origem = "R'lyeh";
        dagon.Origem = "Profundezas do Oceano";

        // Criando o pesquisador
        Pesquisador pesquisador =
            new Pesquisador("Henry Armitage");

        // Catalogando as entidades
        pesquisador.Catalogar(cthulhu);
        pesquisador.Catalogar(dagon);
        pesquisador.Catalogar(alienigena);

        // Exibindo o catalogo
        pesquisador.LerCatalogo();

        Console.WriteLine("\n=== Fim da Pesquisa ===");
    }
}
