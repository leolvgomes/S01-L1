Dim distancia As Double
Dim combustivel As Double
Dim consumo As Double

Print "--- CALCULO DE CONSUMO DO VEICULO ---"

Print "Digite a distancia percorrida em KM:"
Input distancia

Print "Digite a quantidade de combustivel gasto (litros):"
Input combustivel

consumo = distancia / combustivel

Print "Distancia percorrida: "; distancia; " km"
Print "Combustivel gasto: "; combustivel; " litros"
Print "Consumo medio do veiculo: "; consumo; " km/l"

Sleep
