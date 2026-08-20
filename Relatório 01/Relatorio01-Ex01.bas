Dim peso As Double
Dim agua As Double
Dim meta As Double

Print "--- META DIARIA DE AGUA ---"

Input "DIGITE SEU PESO EM KG: ", peso
Input "DIGITE A QUANTIDADE DE AGUA INGERIDA EM ML: ", agua

meta = peso * 35

Print "SUA META DIARIA E: "; meta; " ML"

If agua >= meta Then
    Print "META ATINGIDA!"
Else
    Print "META NAO ATINGIDA"
End If

Sleep