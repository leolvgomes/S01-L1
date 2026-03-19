use std::io;

fn calcular_media(n1: f64, n2: f64, npl: f64) -> f64 {
    let npt = (n1 + n2) / 2.0;
    (0.7 * npt) + (0.3 * npl)
}

fn main() {
    let mut s1 = String::new();
    let mut s2 = String::new();
    let mut s3 = String::new();

    println!("Digite a nota NP1:");
    io::stdin().read_line(&mut s1).unwrap();

    println!("Digite a nota NP2:");
    io::stdin().read_line(&mut s2).unwrap();

    println!("Digite a nota NPL:");
    io::stdin().read_line(&mut s3).unwrap();

    let n1: f64 = s1.trim().parse().unwrap();
    let n2: f64 = s2.trim().parse().unwrap();
    let n3: f64 = s3.trim().parse().unwrap();

    let media = calcular_media(n1, n2, n3);

    println!("Média final: {:.2}", media);

    if media >= 60.0 {
        println!("Parabéns! Você foi aprovado!");
    } else {
        println!("Você foi reprovado.");
    }
}