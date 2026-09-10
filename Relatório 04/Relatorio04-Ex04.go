package main

import "fmt"

func validarIngresso(setor string, codigo int) bool {

	if setor == "VIP" && codigo == 2026 {
		return true
	}

	return false
}

func main() {

	for {

		var setor string
		var codigo int

		fmt.Print("Digite o setor do ingresso: ")
		fmt.Scanln(&setor)

		fmt.Print("Digite o código do ingresso: ")
		fmt.Scanln(&codigo)

		status := validarIngresso(setor, codigo)

		if status {
			fmt.Println("Acesso liberado à área VIP!")
			break
		} else {
			fmt.Println("Ingresso ou setor inválido. Tente novamente.")
		}
	}
}