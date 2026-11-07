-- PF COM HASKELL: EXERCÍCIO 3 - O CADERNO DE ESBOÇOS
-- Relatório 12
-- o caderno é uma lista, e cada esboço novo entra NA FRENTE dela: o
-- primeiro da lista é sempre o mais recente
-- a ilustradora quer saber qual foi o último desenho, quantos esboços
-- já fez e quantas horas passou desenhando
-- tudo o que vem antes do main é puro; só o main imprime no terminal


-- DATA COM CAMPOS NOMEADOS (record syntax)
-- o Haskell cria sozinho as funções titulo, tecnica e horas para ler
-- cada campo de um esboço
data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }


-- PATTERN MATCHING EM LISTAS
-- toda lista é vazia ou "um elemento na frente do resto"
--   []      casa só com o caderno vazio
--   (e:_)   casa com um caderno de pelo menos 1 esboço: e é o
--           primeiro (o mais recente), e o _ ignora o resto
-- as equações são testadas de cima para baixo; tratar a lista vazia
-- evita o erro que head [] causaria
esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno esta vazio."
esbocoMaisRecente (e:_) = "Mais recente: " ++ titulo e ++ " (" ++ tecnica e ++ ")"


-- RECURSÃO
-- em Haskell não existe for nem while: para repetir, a função chama a
-- si mesma com um pedaço menor da lista
--   caso base: o caderno vazio tem 0 esboços (é aqui que a repetição
--   para)
--   caso recursivo: (_:resto) separa o primeiro esboço do resto, e a
--   resposta é 1 (o primeiro) + a contagem do resto
-- passo a passo, com um caderno de 3 esboços [a, b, c]:
--   contarEsbocos [a, b, c]
--   = 1 + contarEsbocos [b, c]
--   = 1 + (1 + contarEsbocos [c])
--   = 1 + (1 + (1 + contarEsbocos []))
--   = 1 + (1 + (1 + 0))
--   = 3
contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto


-- RECURSÃO SOMANDO UM CAMPO
-- mesma ideia, mas agora o primeiro esboço interessa: (e:resto) guarda
-- o primeiro em e, e a resposta é as horas dele + as horas do resto
-- o caderno vazio tem 0 horas
-- sum (map horas caderno) faria o mesmo; aqui é escrito à mão para
-- mostrar a recursão
horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto


-- IO E A FUNÇÃO main
main :: IO ()
main = do
  -- o primeiro da lista é o mais recente
  let caderno =
        [ Esboco { titulo = "Ruinas da catedral", tecnica = "nanquim", horas = 5 }
        , Esboco { titulo = "Criatura do pantano", tecnica = "grafite", horas = 3 }
        , Esboco { titulo = "Floresta sombria", tecnica = "carvao", horas = 4 }
        ]

  -- show transforma o número (Int) em texto para poder juntar com ++
  putStrLn "--- Caderno ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  -- o caderno vazio cai na equação do [], e não quebra o programa
  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])

  -- OPERAÇÃO : COLOCA UM ELEMENTO NA FRENTE
  -- o : cria uma lista NOVA com o esboço na frente do caderno; o
  -- caderno original não é alterado (imutabilidade)
  let cadernoNovo = Esboco { titulo = "Farol abandonado", tecnica = "nanquim", horas = 2 } : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos: " ++ show (contarEsbocos cadernoNovo))
  putStrLn "--- Caderno anterior (continua igual) ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))

  -- HEAD EM LISTA VAZIA
  -- head devolve o primeiro elemento, mas não tem o que devolver em uma
  -- lista vazia: o programa compila, mas quebra AO EXECUTAR, com um
  -- erro de lista vazia (Prelude.head: empty list)
  -- por isso a linha fica comentada; o esbocoMaisRecente acima é a
  -- forma segura
  -- putStrLn (titulo (head []))


-- SAÍDA DO PROGRAMA
-- --- Caderno ---
-- Mais recente: Ruinas da catedral (nanquim)
-- Esbocos: 3
-- Horas desenhando: 12
-- --- Caderno vazio ---
-- O caderno esta vazio.
-- --- Caderno novo ---
-- Mais recente: Farol abandonado (nanquim)
-- Esbocos: 4
-- --- Caderno anterior (continua igual) ---
-- Mais recente: Ruinas da catedral (nanquim)
-- Esbocos: 3