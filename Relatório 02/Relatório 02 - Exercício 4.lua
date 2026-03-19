function soma(a, b)
    return a + b
end

function subtracao(a, b)
    return a - b
end

function multiplicacao(a, b)
    return a * b
end

function divisao(a, b)
    if b == 0 then
        return "Erro: divisao por zero"
    end
    return a / b
end

function calculadora(a, b, operador)

    if operador == "+" then
        return soma(a, b)

    elseif operador == "-" then
        return subtracao(a, b)

    elseif operador == "*" then
        return multiplicacao(a, b)

    elseif operador == "/" then
        return divisao(a, b)

    else
        return "Erro: operador invalido"
    end
end

print("Digite o primeiro numero:")
local num1 = tonumber(io.read())

print("Digite o segundo numero:")
local num2 = tonumber(io.read())

print("Digite o operador (+ - * /):")
local op = io.read()

local resultado = calculadora(num1, num2, op)

print("Resultado:", resultado)
