#include <iostream>
using namespace std;

int main() {
    float saldo;
    int opcao;

    cout << "Digite o saldo inicial: ";
    cin >> saldo;

    do {
        cout << "\n--- MENU ---\n";
        cout << "1. Ver Saldo\n";
        cout << "2. Depositar\n";
        cout << "3. Sacar\n";
        cout << "4. Sair\n";
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1) {
            cout << "Saldo atual: R$ " << saldo << endl;
        }

        else if (opcao == 2) {
            float deposito;
            cout << "Valor para depositar: ";
            cin >> deposito;
            saldo += deposito;
        }

        else if (opcao == 3) {
            float saque;
            cout << "Valor para sacar: ";
            cin >> saque;

            if (saque > saldo) {
                cout << "Saldo insuficiente!" << endl;
            } else {
                saldo -= saque;
            }
        }

    } while (opcao != 4);

    cout << "Programa encerrado.\n";

    return 0;
}