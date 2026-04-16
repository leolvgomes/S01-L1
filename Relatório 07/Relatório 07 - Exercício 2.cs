using System;
using System.Collections.Generic;

class CriaturaPokemon
{
    public string Especie;

    public virtual void ExecutarMovimento()
    {
        Console.WriteLine($"{Especie} realiza um ataque.");
    }
}

class TipoFogo : CriaturaPokemon
{
    public override void ExecutarMovimento()
    {
        Console.WriteLine($"{Especie} lança uma rajada de chamas.");
    }
}

class TipoAgua : CriaturaPokemon
{
    public override void ExecutarMovimento()
    {
        Console.WriteLine($"{Especie} dispara uma bolha de água.");
    }
}

class Program
{
    static void Main()
    {
        List<CriaturaPokemon> pokemons = new List<CriaturaPokemon>();

        TipoFogo scorbunny = new TipoFogo();
        scorbunny.Especie = "Scorbunny";

        TipoAgua greninja = new TipoAgua();
        greninja.Especie = "Greninja";

        pokemons.Add(scorbunny);
        pokemons.Add(greninja);

        foreach (var p in pokemons)
        {
            p.ExecutarMovimento();
        }
    }
}