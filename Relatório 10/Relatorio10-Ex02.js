class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(
            `O agente ${this.codinome} deve implementar usarHabilidade().`
        );
    }

    entrarEmCombate() {
        console.log(
            `${this.codinome} entrou em combate com a pistola ${this.#pistola.modelo}.`
        );

        console.log(`Habilidade: ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Fumaça estratégica para bloquear a visão inimiga.';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Dispositivo de reconhecimento para localizar adversários.';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Avanço agressivo para abrir espaço para a equipe.';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\nEsquadrão ${this.nome} iniciou a partida!`);

        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(
            agente => agente instanceof Controlador
        );
    }
}

// MAIN
const omen = new Controlador('Omen', 'Classic');
const brimstone = new Controlador('Brimstone', 'Ghost');
const sova = new Iniciador('Sova', 'Sheriff');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao(
    'Protocolo Alfa',
    [omen, brimstone, sova, jett]
);

esquadrao.iniciarPartida();

console.log('\nControladores do esquadrão:');

esquadrao.listarControladores().forEach(agente => {
    console.log(`- ${agente.codinome}`);
});

// A chamada abaixo gera erro porque usarHabilidade() não foi sobrescrito.
// const agenteBase = new AgenteProtocolo('Base', 'Classic');
// agenteBase.entrarEmCombate();