Dim nota1 As Integer
Dim nota2 As Integer
Dim nota3 As Integer

Dim peso1 As Integer
Dim peso2 As Integer
Dim peso3 As Integer

Dim media As Double

Print "--- CALCULO DE MEDIA PONDERADA ---"

Print "Digite a nota 1:"
Input nota1
Print "Digite o peso da nota 1:"
Input peso1

Print "Digite a nota 2:"
Input nota2
Print "Digite o peso da nota 2:"
Input peso2

Print "Digite a nota 3:"
Input nota3
Print "Digite o peso da nota 3:"
Input peso3

media = (nota1*peso1 + nota2*peso2 + nota3*peso3) / (peso1 + peso2 + peso3)

Print "Media final: "; media

If media > 70 Then
    Print "Aprovado direto"
Else
    Print "Reprovado direto"
End If

Sleep
