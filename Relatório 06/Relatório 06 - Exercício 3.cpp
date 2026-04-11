#include <iostream>
#include <string>
using namespace std;

class MembroInatel {
public:
    string nomeCompleto;
    virtual void identificar() { 
        cout << "Sou um membro da comunidade Inatel: " << nomeCompleto << endl; 
    }
};

class Coordenador : public MembroInatel {
public:
    string departamento;
    void identificar() override { 
        cout << "Meu nome e " << nomeCompleto << ", sou o coordenador do departamento de " << departamento << " no Inatel." << endl; 
    }
};

class Pesquisador : public MembroInatel {
public:
    string laboratorio;
    void identificar() override { 
        cout << "Meu nome e " << nomeCompleto << ", e realizo pesquisas no laboratorio " << laboratorio << " do Inatel." << endl; 
    }
};

int main() {
    MembroInatel* p1 = new Coordenador();
    p1->nomeCompleto = "Dr. Silva";
    ((Coordenador*)p1)->departamento = "Computacao";

    MembroInatel* p2 = new Pesquisador();
    p2->nomeCompleto = "Eng. Ana";
    ((Pesquisador*)p2)->laboratorio = "Wernher von Braun";

    p1->identificar();
    p2->identificar();

    delete p1; delete p2;
    return 0;
}