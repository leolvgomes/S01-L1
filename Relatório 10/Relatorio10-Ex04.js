class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(
            `${this.nome} lança um ataque genérico de aura contra ${alvo.nome}!`
        );
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(
            `${this.nome} concentra sua aura em um golpe poderoso contra ${alvo.nome}!`
        );
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(
            `${this.nome} transforma sua aura em eletricidade e atinge ${alvo.nome}!`
        );
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(
            `${this.nome} materializa uma arma de aura para atacar ${alvo.nome}!`
        );
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`\nAranhas avistadas em ${this.cidade}:`);

        this.#aranhas.forEach(aranha => {
            console.log(`Aranha nº ${aranha.numero}: ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(
            aranha => aranha.numero === numero
        );
    }
}

// MAIN
const chrollo = new Aranha('Chrollo', 0);
const machi = new Aranha('Machi', 3);

const trupe = new TrupeFantasma('Yorknew', [chrollo, machi]);

trupe.revelarAranhas();

const alvo = trupe.buscarAranha(3);

if (alvo) {
    const hunters = [
        new Intensificador('Gon'),
        new Transmutador('Killua'),
        new Materializador('Kurapika')
    ];

    hunters.forEach(hunter => {
        hunter.atacar(alvo);
    });
} else {
    console.log('Nenhuma Aranha foi encontrada com esse número.');
}