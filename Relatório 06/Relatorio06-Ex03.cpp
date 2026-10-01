#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
public:
    string nome;

    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: "
             << nome << "." << endl;
    }
};

class Aluno : public MembroInatel {
public:
    string curso;

    void seApresentar() override {
        cout << "Meu nome e " << nome
             << " e estudo no curso de "
             << curso << "." << endl;
    }
};

class Professor : public MembroInatel {
public:
    string disciplina;

    void seApresentar() override {
        cout << "Meu nome e " << nome
             << " e leciono a disciplina de "
             << disciplina << "." << endl;
    }
};

int main() {

    Aluno aluno;
    Professor professor;

    aluno.nome = "Leonardo";
    aluno.curso = "Engenharia de Software";

    professor.nome = "Pedro";
    professor.disciplina = "Paradigmas de Programacao";

    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}