using System;
using System.Collections.Generic;

abstract class AbominacaoCosmica
{
    public string Nome;

    public abstract void Manifestar();
}

class Shoggoth : AbominacaoCosmica
{
    public override void Manifestar()
    {
        Console.WriteLine("A massa de protoplasma se arrasta borbulhando.");
    }
}

class CacadorAlado : AbominacaoCosmica
{
    public override void Manifestar()
    {
        Console.WriteLine("A criatura bate suas asas e mergulha do céu.");
    }
}

class Program
{
    static void Main()
    {
        List<AbominacaoCosmica> criaturas = new List<AbominacaoCosmica>();

        criaturas.Add(new Shoggoth());
        criaturas.Add(new CacadorAlado());

        foreach (var c in criaturas)
        {
            c.Manifestar();
        }
    }
}