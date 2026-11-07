-- PF COM HASKELL: EXERCÍCIO 2 - AS ENTREGAS DA KIKI
-- Relatório 12
-- a vassoura da Kiki só aguenta um peso máximo por viagem, então ela
-- quer saber quais encomendas do dia consegue levar e quanto vai
-- receber de frete por elas
-- tudo o que vem antes do main é puro: recebe valores e devolve
-- valores, sem imprimir nada
-- só o main conversa com o mundo (imprime no terminal)


-- DEFINIÇÕES E IMUTABILIDADE
-- isto não é uma variável: é uma definição
-- o = quer dizer "é igual a", e não "recebe": pesoMaximo É 5.0, para
-- sempre
-- uma função que lê esta constante continua pura, porque ela nunca muda
pesoMaximo :: Double
pesoMaximo = 5.0
-- a linha abaixo tenta definir pesoMaximo de novo; sem o --, o
-- programa nem compila, e o GHC acusa definição duplicada:
--   Multiple declarations of 'pesoMaximo'
-- pesoMaximo = 8.0


-- DATA COM CAMPOS NOMEADOS (record syntax)
-- com chaves, cada campo ganha um nome e um tipo
-- o Haskell cria sozinho uma função para ler cada campo:
--   destinatario e, peso e e frete e
data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }


-- LENDO OS CAMPOS COM AS FUNÇÕES DE CAMPO
-- destinatario e lê o campo destinatario da encomenda e
-- show converte os Double em texto para poder juntar com ++
-- a linha que começa com ++ continua a expressão da linha de cima
descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " kg, frete de R$ "
    ++ show (frete e)


-- FILTER COM LAMBDA
-- \e -> peso e <= pesoMaximo é uma função sem nome (lambda):
-- "dada a encomenda e, responda se o peso dela cabe na vassoura"
-- filter devolve uma lista NOVA só com as encomendas que passaram no
-- teste; a lista recebida não é alterada
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas


-- COMPOSIÇÃO: uma função dentro da outra, lida de dentro para fora
-- map frete pega o frete de cada encomenda (uma lista de Double), e
-- sum soma todos eles
totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)


-- IO E A FUNÇÃO main
main :: IO ()
main = do
  -- CRIANDO REGISTROS COM CAMPOS NOMEADOS
  -- cada campo recebe seu valor pelo nome, então a ordem não importa
  -- a encomenda da padaria (10.0 kg) e a da Ursula (7.0 kg) passam do
  -- peso máximo
  let encomendas =
        [ Encomenda { destinatario = "Neta da senhora"
                    , peso = 2.5, frete = 15.0 }
        , Encomenda { destinatario = "Padaria da Osono"
                    , peso = 10.0, frete = 20.0 }
        , Encomenda { destinatario = "Menino do gato de pelucia"
                    , peso = 1.5, frete = 12.0 }
        , Encomenda { destinatario = "Ursula"
                    , peso = 7.0, frete = 25.0 }
        , Encomenda { destinatario = "Tombo"
                    , peso = 1.0, frete = 8.0 }
        ]

  let cabem = cabemNaVassoura encomendas

  -- map descrever transforma cada encomenda em texto, e mapM_ executa
  -- putStrLn para cada texto dessa lista
  putStrLn ("--- Todas as encomendas (maximo: " ++ show pesoMaximo ++ " kg) ---")
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever cabem)
  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes cabem))


-- SAÍDA DO PROGRAMA
-- --- Todas as encomendas (maximo: 5.0 kg) ---
-- Neta da senhora - 2.5 kg, frete de R$ 15.0
-- Padaria da Osono - 10.0 kg, frete de R$ 20.0
-- Menino do gato de pelucia - 1.5 kg, frete de R$ 12.0
-- Ursula - 7.0 kg, frete de R$ 25.0
-- Tombo - 1.0 kg, frete de R$ 8.0
-- --- Cabem na vassoura ---
-- Neta da senhora - 2.5 kg, frete de R$ 15.0
-- Menino do gato de pelucia - 1.5 kg, frete de R$ 12.0
-- Tombo - 1.0 kg, frete de R$ 8.0
-- Total de fretes: R$ 35.0