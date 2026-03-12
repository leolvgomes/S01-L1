print("Quantos numeros deseja inserir?")
local N = tonumber(io.read())

local tabela = {}
local impares = {}

for i = 1, N do
    print("Digite o numero "..i..":")
    tabela[i] = tonumber(io.read())
end

for i = 1, #tabela do
    if tabela[i] % 2 ~= 0 then
        table.insert(impares, tabela[i])
    end
end

print("Numeros impares encontrados:")

for i = 1, #impares do
    print(impares[i])
end
