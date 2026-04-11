#include <iostream>
#include <string>
using namespace std;

struct Robo {
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

    void disparar(Robo &alvo) {
        cout << modelo << " disparou em " << alvo.modelo << endl;
        alvo.integridade -= (int)potenciaLaser;
        if (alvo.integridade < 0) alvo.integridade = 0;
    }
};

int main() {
    Robo r1 = {"RX-78", 2, 20.0, 100};
    Robo r2 = {"Zaku", 1, 10.0, 100};

    r1.disparar(r2);

    cout << "Integridade " << r1.modelo << ": " << r1.integridade << endl;
    cout << "Integridade " << r2.modelo << ": " << r2.integridade << endl;

    return 0;
}