using System;
using System.Collections.Generic;

class ReliquiaMagica
{
    public string NomeItem { get; set; }
}

class BauDeReliquias
{
    public List<ReliquiaMagica> reliquias = new List<ReliquiaMagica>();

    public void GuardarItem(ReliquiaMagica item)
    {
        reliquias.Add(item);
    }
}

class ItemDeAcampamento
{
    public string Nome { get; set; }
}

class Maga
{
    public string Nome;
    public BauDeReliquias bau;
    public List<ItemDeAcampamento> itensAcampamento;

    public Maga(string nome, List<ItemDeAcampamento> itens)
    {
        Nome = nome;
        bau = new BauDeReliquias();
        itensAcampamento = itens;
    }
}

class Program
{
    static void Main()
    {
        List<ItemDeAcampamento> itens = new List<ItemDeAcampamento>()
        {
            new ItemDeAcampamento{ Nome = "Saco de Dormir"},
            new ItemDeAcampamento{ Nome = "Pote de Cozinha"}
        };

        Maga frieren = new Maga("Frieren", itens);

        frieren.bau.GuardarItem(new ReliquiaMagica{ NomeItem = "Anel de Prata"});
        frieren.bau.GuardarItem(new ReliquiaMagica{ NomeItem = "Grimório Antigo"});

        foreach (var item in frieren.itensAcampamento)
        {
            Console.WriteLine(item.Nome);
        }
    }
}