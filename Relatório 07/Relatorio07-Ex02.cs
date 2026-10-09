
using System;
using System.Collections.Generic;

// CLASSE BASE
public class Pokemon
{
    public string Especie { get; set; }
    public int Nivel { get; set; }

    // CONSTRUTOR
    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    // Método virtual
    public virtual void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} ---");
        Console.WriteLine($"Nivel: {Nivel}");
        Console.WriteLine($"{Especie} usou um ataque comum!");
    }
}

// HERANÇA
public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel)
        : base(especie, nivel)
    {
    }

    // SOBRESCRITA sem chamar o pai
    public override void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} ---");
        Console.WriteLine($"Nivel: {Nivel}");
        Console.WriteLine($"{Especie} usou Chicote de Vinha!");
    }
}

// HERANÇA
public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel)
        : base(especie, nivel)
    {
    }

    // SOBRESCRITA chamando o método do pai
    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine($"{Especie} usou Choque do Trovao!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha Pokemon ===");

        Pokemon eevee = new Pokemon("Eevee", 15);
        TipoPlanta bulbasaur = new TipoPlanta("Bulbasaur", 20);
        TipoEletrico pikachu = new TipoEletrico("Pikachu", 25);

        // POLIMORFISMO
        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(eevee);
        pokemons.Add(bulbasaur);
        pokemons.Add(pikachu);

        foreach (var pokemon in pokemons)
        {
            pokemon.Atacar();
        }

        Console.WriteLine("\n=== Fim da Batalha ===");
    }
}
