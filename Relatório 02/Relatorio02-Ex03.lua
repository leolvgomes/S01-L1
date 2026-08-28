print("--- FILTRO DE NUMEROS ---")

print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())

local tabela = {}

if N then

    -- Preenchendo a tabela
    for i = 1, N do
        print("Digite o elemento " .. i .. ":")
        tabela[i] = tonumber(io.read())
    end

    print("Digite o valor limite (K):")
    local K = tonumber(io.read())

    if K then

        -- Definindo a logica
        function filtrarMaiores(tabela, limite)
            local novaTabela = {}

            -- Adiciona somente os valores maiores que o limite
            for i = 1, #tabela do
                if tabela[i] > limite then
                    table.insert(novaTabela, tabela[i])
                end
            end

            return novaTabela
        end

        -- Usando a funcao
        local resultado = filtrarMaiores(tabela, K)

        print("--- Elementos maiores que " .. K .. " ---")

        for i = 1, #resultado do
            print(resultado[i])
        end

    else
        print("Entrada invalida! Digite apenas numeros.")
    end

else
    print("Entrada invalida! Digite apenas numeros.")
end