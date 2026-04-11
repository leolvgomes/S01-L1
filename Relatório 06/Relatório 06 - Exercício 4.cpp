#include <iostream>
#include <string>
#include <vector>
using namespace std;

class MembroConselho {
public:
    string nome;
    virtual void saudar() { cout << "Um membro do conselho faz uma reverencia silenciosa." << endl; }
};

class Anao : public MembroConselho {
public:
    void saudar() override { cout << "Pela forca da montanha, eu sou " << nome << " e honro nosso aco!" << endl; }
};

class Orc : public MembroConselho {
public:
    void saudar() override { cout << "Pela sangue e gloria, eu sou " << nome << " e trago a forca de minha tribo!" << endl; }
};

class Draconato : public MembroConselho {
public:
    void saudar() override { cout << "Pela sopro dos ancestrais, eu sou " << nome << " e falo em nome dos dragoes!" << endl; }
};

int main() {
    vector<MembroConselho*> lista;

    Anao* a = new Anao(); a->nome = "Gimli";
    Orc* o = new Orc(); o->nome = "Thrall";
    Draconato* d = new Draconato(); d->nome = "Balasar";

    lista.push_back(a);
    lista.push_back(o);
    lista.push_back(d);

    for (auto m : lista) {
        m->saudar();
    }

    for (auto m : lista) delete m;

    return 0;
}