#include <iostream>
#include <string>

using namespace std;

class LinkSocial {
private:
    string nome;
    string arcana;
    int rank;

public:

    void setNome(string novoNome) {
        nome = novoNome;
    }

    void setArcana(string novaArcana) {
        arcana = novaArcana;
    }

    void setRank(int novoRank) {
        rank = novoRank;
    }

    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void subirRank() {
        rank++;
    }
};

int main() {

    LinkSocial personagem;

    personagem.setNome("Ryuji Sakamoto");
    personagem.setArcana("Chariot");
    personagem.setRank(1);

    cout << "Antes de subir o rank:" << endl;
    cout << "Nome: " << personagem.getNome() << endl;
    cout << "Arcana: " << personagem.getArcana() << endl;
    cout << "Rank: " << personagem.getRank() << endl;

    personagem.subirRank();

    cout << endl;

    cout << "Depois de subir o rank:" << endl;
    cout << "Nome: " << personagem.getNome() << endl;
    cout << "Arcana: " << personagem.getArcana() << endl;
    cout << "Rank: " << personagem.getRank() << endl;

    return 0;
}