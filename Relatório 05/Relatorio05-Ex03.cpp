#include <iostream>
using namespace std;

int main() {
    float capacidade_maxima;
    float peso_atual = 0.0;
    float peso_pacote;
    int opcao;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidade_maxima;

    do {
        cout << endl;
        cout << "=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if(opcao == 1) {
            cout << "Carga Atual: " << peso_atual;
            cout << " kg / " << capacidade_maxima << " kg" << endl;

            cout << "Espaco Disponivel: ";
            cout << capacidade_maxima - peso_atual << " kg" << endl;
        }

        else if(opcao == 2) {
            cout << "Digite o peso do pacote a ser carregado (kg): ";
            cin >> peso_pacote;

            if(peso_atual + peso_pacote > capacidade_maxima) {
                cout << "Alerta: Peso maximo de decolagem excedido! ";
                cout << "Operacao cancelada." << endl;
            }
            else {
                peso_atual = peso_atual + peso_pacote;

                cout << "Pacote adicionado com sucesso!" << endl;
            }
        }

        else if(opcao == 3) {
            cout << "Digite o peso a ser removido (kg): ";
            cin >> peso_pacote;

            if(peso_pacote > peso_atual) {
                cout << "Erro: Nao e possivel remover mais peso ";
                cout << "do que o peso atual." << endl;
            }
            else {
                peso_atual = peso_atual - peso_pacote;

                cout << "Pacote removido com sucesso!" << endl;
            }
        }

        else if(opcao == 4) {
            cout << "Encerrando sistema de telemetria..." << endl;
        }

        else {
            cout << "Opcao invalida." << endl;
        }

    } while(opcao != 4);

    return 0;
}