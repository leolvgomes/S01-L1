print("--- TABELA DE POTENCIAS ---")

print("Digite o expoente inicial (M):")
local M = tonumber(io.read())

print("Digite o expoente final (N):")
local N = tonumber(io.read())

print("Digite a base:")
local base = tonumber(io.read())

if M and N and base then

    -- A funcao percorre os expoentes de inicio ate fim
    function gerarTabelaPotencias(inicio, fim, base)
        for i = inicio, fim do
            local resultado = base ^ i
            print(base .. " ^ " .. i .. " = " .. resultado)
        end
    end

    -- Usando a funcao
    gerarTabelaPotencias(M, N, base)

else
    print("Entrada invalida! Digite apenas numeros.")
end