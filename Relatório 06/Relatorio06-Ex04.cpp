#include <iostream>
#include <string>
#include <vector>

using namespace std;

class Hobbit {
public:
    string nome;

    virtual void fazerAtividade() {
        cout << "O hobbit " << nome
             << " esta aproveitando um dia tranquilo na Comarca."
             << endl;
    }
};

class Jardineiro : public Hobbit {
public:

    void fazerAtividade() override {
        cout << "O jardineiro " << nome
             << " esta cuidando das flores e plantas ao redor das tocas!"
             << endl;
    }
};

class Cozinheiro : public Hobbit {
public:

    void fazerAtividade() override {
        cout << "O cozinheiro " << nome
             << " esta preparando o segundo cafe da manha para os convidados!"
             << endl;
    }
};

class Fazendeiro : public Hobbit {
public:

    void fazerAtividade() override {
        cout << "O fazendeiro " << nome
             << " esta colhendo vegetais e hortalicas em suas terras!"
             << endl;
    }
};

int main() {

    Jardineiro jardineiro;
    Cozinheiro cozinheiro;
    Fazendeiro fazendeiro;

    jardineiro.nome = "Sam";
    cozinheiro.nome = "Bilbo";
    fazendeiro.nome = "Frodo";

    vector<Hobbit*> hobbits;

    hobbits.push_back(&jardineiro);
    hobbits.push_back(&cozinheiro);
    hobbits.push_back(&fazendeiro);

    for (Hobbit* hobbit : hobbits) {
        hobbit->fazerAtividade();
    }

    return 0;
}