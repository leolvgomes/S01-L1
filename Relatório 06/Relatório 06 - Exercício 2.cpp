#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;
public:
    void setDados(string n, int i) { nome = n; idade = i; }
    string getNome() { return nome; }
};

class Protagonista : public Pessoa {
private:
    int nivel;
public:
    void setNivel(int n) { nivel = n; }
    void mostrar() { cout << "Protagonista: " << getNome() << " | Nivel: " << nivel << endl; }
};

class Personagem : public Pessoa {
private:
    int rank;
public:
    void setRank(int r) { rank = (r > 10) ? 10 : (r < 0 ? 0 : r); }
    void mostrar() { cout << "Personagem: " << getNome() << " | Rank: " << rank << endl; }
};

int main() {
    Protagonista p; 
    p.setDados("Joker", 17); 
    p.setNivel(10);

    Personagem c; 
    c.setDados("Ryuji", 17); 
    c.setRank(4);

    p.mostrar();
    c.mostrar();

    return 0;
}