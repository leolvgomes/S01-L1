use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    let diferenca = (palpite - numero_secreto).abs();

    diferenca <= 5
}

fn main() {
    let numero_secreto: i32 = 42;

    loop {
        let mut entrada = String::new();

        println!("Digite seu palpite:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        let palpite: i32 = entrada.trim().parse().unwrap_or(0);

        if acertou_o_alvo(palpite, numero_secreto) {
            let distancia = (palpite - numero_secreto).abs();

            println!("Parabéns, você acertou o alvo!");
            println!(
                "Você ficou a apenas {} unidade(s) do número secreto ({})",
                distancia, numero_secreto
            );

            break;
        } else {
            println!("Você passou longe! Tente novamente.");
        }
    }
}