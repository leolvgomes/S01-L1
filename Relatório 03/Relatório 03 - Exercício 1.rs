use std::io;

fn verificar_senha(senha: &str) -> bool {
    let mut tem_maiuscula = false;
    let mut qtd_numeros = 0;

    if senha.len() < 10 {
        return false;
    }

    for c in senha.chars() {
        if c.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
        if c.is_digit(10) {
            qtd_numeros += 1;
        }
    }

    tem_maiuscula && qtd_numeros >= 2
}

fn main() {
    loop {
        let mut senha = String::new();

        println!("Digite uma senha:");
        io::stdin().read_line(&mut senha).unwrap();

        let senha = senha.trim();

        if verificar_senha(senha) {
            println!("A senha é válida, seja bem vindo!");
            break;
        } else {
            println!("Senha inválida, tente novamente.");
        }
    }
}