import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        Sobrenatural alien = new Alienigena("Serpoian");
        Sobrenatural espirito = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Túnel", espirito);
        mapa.registrar("Hospital", alien);

        mapa.investigar("Túnel");
        mapa.investigar("Hospital");
        mapa.investigar("Escola");
    }
}

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " tenta abduzir quem chegou perto");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " aparece e assombra o local");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local);
        if (ser == null) {
            System.out.println(local + " está tranquilo");
        } else {
            ser.manifestar();
        }
    }
}