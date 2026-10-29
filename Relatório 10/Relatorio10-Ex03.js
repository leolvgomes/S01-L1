class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} — nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`\nDiário Misterioso nº ${this.numero}`);

        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(
            `\nA Cabana do Mistério, administrada por ${this.dono}, abriu as portas!`
        );

        this.#funcionarios.forEach(funcionario => {
            console.log(`${funcionario.nome} — ${funcionario.cargo}`);
        });
    }
}

// MAIN
const diario = new DiarioMisterioso(3);

diario.anotar('Gnomo', 2);
diario.anotar('Bill Cipher', 10);
diario.anotar('Homem-Cabra', 7);

diario.exibirFichas();

// Os funcionários são criados antes da Cabana.
const dipper = new Funcionario('Dipper Pines', 'Pesquisador');
const mabel = new Funcionario('Mabel Pines', 'Atendente');

const cabana = new CabanaDoMisterio('Tio-avô Stan');

cabana.contratar(dipper);
cabana.contratar(mabel);

cabana.abrirAsPortas();

/*
COMPOSIÇÃO:
O DiarioMisterioso cria suas FichaDeCriatura dentro do método anotar().
As fichas são partes internas do diário.

AGREGAÇÃO:
Os funcionários são criados antes da CabanaDoMisterio e depois
adicionados pelo método contratar(). Eles existem independentemente
da cabana.
*/