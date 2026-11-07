-- PF COM HASKELL: EXERCÍCIO 1 - O CAFÉ DO LEBLANC
-- Relatório 12
-- o dono do Leblanc quer descrever os cafés do dia, dizer a força de
-- cada um e calcular o preço quando o cliente pede leite
-- tudo o que vem antes do main é puro: recebe valores e devolve
-- valores, sem imprimir nada
-- só o main conversa com o mundo (imprime no terminal)


-- TIPO PERSONALIZADO COM data (CAMPOS POSICIONAIS)
-- lendo a linha abaixo da esquerda para a direita:
--   data                  palavra-chave que cria o tipo
--   Cafe (o primeiro)     nome do tipo, usado nas assinaturas
--   Cafe (o segundo)      construtor: a função que monta um café
--   String Double Int     os campos, em ordem: nome, preço e intensidade
-- sem chaves, os campos não têm nome: cada um é identificado pela
-- sua POSIÇÃO
-- exemplo: Cafe "Blend do Leblanc" 5.0 6
data Cafe = Cafe String Double Int


-- PATTERN MATCHING NO PARÂMETRO
-- (Cafe nome preco _) separa os campos pela posição: o primeiro vai
-- para nome, o segundo para preco, e o _ ignora a intensidade
-- show converte o preço (Double) em texto; sem ele, o ++ daria erro,
-- porque ++ só junta textos
-- não existe return: o que vem depois do = já é o resultado
descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ ": R$ " ++ show preco


-- CONDIÇÕES COM GUARDS
-- cada | é uma condição; leia como "quando"
-- as condições são testadas de cima para baixo e a primeira verdadeira
-- decide o resultado, por isso a ordem importa: se intensidade >= 5
-- viesse primeiro, um café de intensidade 9 seria "Equilibrado"
-- como o >= 8 já foi testado antes, o >= 5 só pega de 5 a 7
-- otherwise é o "senão": vale sempre, então fica por último
forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"


-- CONDIÇÃO COM if ... then ... else
-- a assinatura Bool -> Cafe -> Double diz: recebe um Bool e um Cafe e
-- devolve um Double (o último tipo é sempre o retorno)
-- comLeite é True quando o cliente pediu leite
-- o if é uma EXPRESSÃO: ele vale um dos dois números, por isso o else
-- é obrigatório e os dois ramos têm o mesmo tipo (Double)
precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco


-- IO E A FUNÇÃO main
-- main :: IO () diz que o main é uma ação de entrada e saída que não
-- devolve nenhum valor útil
-- o do executa as ações abaixo dele em sequência, uma por linha
main :: IO ()
main = do
  -- CRIANDO OS CAFÉS
  -- dentro do do, let dá nome a um valor
  -- um café em cada faixa de intensidade: suave, equilibrado e forte
  let kilimanjaro = Cafe "Kilimanjaro" 4.5 3
  let blendLeblanc = Cafe "Blend do Leblanc" 5.0 6
  let mandheling = Cafe "Mandheling" 6.5 9

  -- putStrLn imprime um texto e pula para a linha seguinte
  -- ++ junta a descrição e a força em um texto só
  putStrLn "--- Cafes do dia ---"
  putStrLn (descrever kilimanjaro ++ " | " ++ forca kilimanjaro)
  putStrLn (descrever blendLeblanc ++ " | " ++ forca blendLeblanc)
  putStrLn (descrever mandheling ++ " | " ++ forca mandheling)

  -- print exibe qualquer valor exibível, como um Double
  -- os parênteses agrupam: primeiro calcula o preço, depois imprime
  putStrLn "--- Blend do Leblanc com e sem leite ---"
  print (precoDoPedido True blendLeblanc)
  print (precoDoPedido False blendLeblanc)


-- SAÍDA DO PROGRAMA
-- --- Cafes do dia ---
-- Kilimanjaro: R$ 4.5 | Suave
-- Blend do Leblanc: R$ 5.0 | Equilibrado
-- Mandheling: R$ 6.5 | Forte
-- --- Blend do Leblanc com e sem leite ---
-- 7.0
-- 5.0