-- PF COM HASKELL: EXERCÍCIO 4 - A CASA DE BANHOS DA YUBABA
-- Relatório 12
-- cada atendimento registra o espírito, o serviço, o valor e a etapa
-- em que ele está: na fila, no banho ou concluído
-- só os atendimentos concluídos já foram pagos
-- tudo o que vem antes do main é puro; só o main imprime no terminal


-- TIPO COM OPÇÕES (vários construtores)
-- o | separa as opções: uma Etapa é NaFila OU NoBanho OU Concluido, e
-- nenhum outro valor é aceito
-- deriving (Show, Eq) pede ao compilador duas capacidades prontas:
--   Show: permite converter em texto com show (usado no descrever)
--   Eq:   permite comparar com == (usado no arrecadado)
data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)


-- DATA COM CAMPOS NOMEADOS (record syntax)
-- um campo pode ser de um tipo criado por você: etapa guarda uma Etapa
-- o Haskell cria as funções cliente, servico, valor e etapa para ler
-- os campos
data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }


-- show (etapa a) transforma a Etapa em texto ("NaFila", "Concluido"...)
-- isso só funciona por causa do deriving (Show)
descrever :: Atendimento -> String
descrever a = cliente a ++ " - " ++ servico a ++ " (" ++ show (etapa a) ++ ")"


-- "ALTERAR" UM REGISTRO = CRIAR OUTRO
-- a { etapa = Concluido } cria um atendimento NOVO, igual ao a mas com
-- outra etapa; o a original continua do jeito que era
concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }


-- FILTER COM LAMBDA + map + sum
-- lido de dentro para fora:
--   filter (\a -> etapa a == Concluido) fica só com os concluídos
--   map valor pega o valor de cada um
--   sum soma todos os valores
-- o == só funciona porque Etapa tem deriving (Eq)
-- uma lista vazia soma 0.0
arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))


-- IO E A FUNÇÃO main
main :: IO ()
main = do
  -- três atendimentos, nenhum concluído
  let espiritoFedorento =
        Atendimento { cliente = "Espirito Fedorento"
                    , servico = "Banho de ervas especial"
                    , valor   = 300.0
                    , etapa   = NaFila }
  let semFace =
        Atendimento { cliente = "Sem-Face"
                    , servico = "Banho quente"
                    , valor   = 150.0
                    , etapa   = NoBanho }
  let deusRabanete =
        Atendimento { cliente = "Deus Rabanete"
                    , servico = "Banho de sais"
                    , valor   = 80.0
                    , etapa   = NaFila }
  let atendimentos = [espiritoFedorento, semFace, deusRabanete]

  -- uma lista NOVA: os dois primeiros passam por concluir, o terceiro
  -- não; a lista atendimentos não é alterada
  let depois = [concluir espiritoFedorento, concluir semFace, deusRabanete]

  putStrLn "--- Atendimentos (lista original) ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Atendimentos (lista nova) ---"
  mapM_ putStrLn (map descrever depois)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado depois))

  -- IMUTABILIDADE NA PRÁTICA
  -- exibindo a original de novo: nada mudou
  putStrLn "--- Lista original (continua igual) ---"
  mapM_ putStrLn (map descrever atendimentos)


-- SAÍDA DO PROGRAMA
-- --- Atendimentos (lista original) ---
-- Espirito Fedorento - Banho de ervas especial (NaFila)
-- Sem-Face - Banho quente (NoBanho)
-- Deus Rabanete - Banho de sais (NaFila)
-- Arrecadado: R$ 0.0
-- --- Atendimentos (lista nova) ---
-- Espirito Fedorento - Banho de ervas especial (Concluido)
-- Sem-Face - Banho quente (Concluido)
-- Deus Rabanete - Banho de sais (NaFila)
-- Arrecadado: R$ 450.0
-- --- Lista original (continua igual) ---
-- Espirito Fedorento - Banho de ervas especial (NaFila)
-- Sem-Face - Banho quente (NoBanho)
-- Deus Rabanete - Banho de sais (NaFila)