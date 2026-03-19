Dim senhaCorreta As Integer
Dim senhaDigitada As Integer

senhaCorreta = 1234

Print "--- SISTEMA DE LOGIN ---"

Print "Digite a senha:"
Input senhaDigitada

While senhaDigitada <> senhaCorreta
    Print "Senha incorreta. Tente novamente."
    Print "Digite a senha:"
    Input senhaDigitada
Wend

Print "Acesso liberado!"

Sleep
