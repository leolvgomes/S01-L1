Dim pinCorreto As Integer
Dim pin As Integer

pinCorreto = 4321

Print "--- ACESSO ---"

Input "DIGITE O PIN: ", pin

While pin <> pinCorreto
    Print "PIN INVALIDO. TENTE NOVAMENTE."
    Input "DIGITE O PIN: ", pin
Wend

Print "TRANSACAO AUTORIZADA!"

Sleep