class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida = Math.max(0, this.#vida - pontos);
        console.log(`${this.apelido} recebeu dano. Vida restante: ${this.#vida}`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} realizou um ataque genérico!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Jato de Água contra ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usou Chicote de Vinha contra ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}

// MAIN
const squirtle = new Squirtle('Bolha', 50);
const bulbasaur = new Bulbasaur('Folhinha', 30);

bulbasaur.atacar(squirtle);
squirtle.atacar(bulbasaur);
squirtle.atacar(bulbasaur);

console.log(`Vida de ${squirtle.apelido}: ${squirtle.vida}`);
console.log(`Vida de ${bulbasaur.apelido}: ${bulbasaur.vida}`);

// A linha abaixo gera erro porque #vida é um atributo privado.
// console.log(squirtle.#vida);