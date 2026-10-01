#include <iostream>
#include <string>

using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << nome << " esta duelando contra " << rival.nome << "!" << endl;

        rival.energia -= potenciaSom;

        cout << nome << " realizou sua apresentacao!" << endl;
    }

    void exibirStatus() {
        cout << "Banda: " << nome << endl;
        cout << "Integrantes: " << integrantes << endl;
        cout << "Potencia do som: " << potenciaSom << endl;
        cout << "Energia da plateia: " << energia << endl;
        cout << endl;
    }
};

int main() {

    Banda banda1;
    Banda banda2;

    banda1.nome = "Linkin Park";
    banda1.integrantes = 6;
    banda1.potenciaSom = 30;
    banda1.energia = 100;

    banda2.nome = "System of a Down";
    banda2.integrantes = 4;
    banda2.potenciaSom = 25;
    banda2.energia = 100;

    cout << "STATUS ANTES DO DUELO" << endl << endl;

    banda1.exibirStatus();
    banda2.exibirStatus();

    banda1.duelar(banda2);

    cout << endl;
    cout << "STATUS DEPOIS DO DUELO" << endl << endl;

    banda1.exibirStatus();
    banda2.exibirStatus();

    return 0;
}