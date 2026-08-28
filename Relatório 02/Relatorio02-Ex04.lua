print("--- ANALISADOR DE NUMEROS ---")

-- Definindo a funcao para calcular a media
function calcularMedia(a, b)
    local media = (a + b) / 2
    return media
end

-- Definindo a funcao para encontrar o maior valor
function encontrarMaior(a, b)
    if a > b then
        return a
    else
        return b
    end
end

-- Definindo a funcao para calcular a diferenca absoluta
function calcularDiferencaAbsoluta(a, b)
    if a > b then
        return a - b
    else
        return b - a
    end
end

-- Funcao principal que escolhe a operacao
function analisarNumeros(n1, n2, operacao)

    if operacao == "media" then
        return calcularMedia(n1, n2)

    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)

    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)

    else
        return "Operacao invalida!"
    end
end

print("Digite o primeiro numero:")
local n1 = tonumber(io.read())

print("Digite o segundo numero:")
local n2 = tonumber(io.read())

print('Digite a operacao ("media", "maior" ou "diferenca"):')
local operacao = io.read()

if n1 and n2 then

    -- Usando a funcao principal
    local resultado = analisarNumeros(n1, n2, operacao)

    print("Resultado: " .. resultado)

else
    print("Entrada invalida! Digite apenas numeros.")
end