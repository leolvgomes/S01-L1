print("Quantos numeros deseja inserir?")
local N = tonumber(io.read())

local tabela = {}

for i = 1, N do
    print("Digite o numero "..i..":")
    tabela[i] = tonumber(io.read())
end

local function maiorValor(t)
    local maior = t[1]

    for i = 2, #t do
        if t[i] > maior then
            maior = t[i]
        end
    end

    return maior
end

print("Maior valor da tabela:", maiorValor(tabela))
