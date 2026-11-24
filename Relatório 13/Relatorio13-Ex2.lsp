; EXERCÍCIO 2: O SCANNER DE 4546B
; registra as criaturas marinhas de Subnautica e filtra pela profundidade

; COMO RODAR
; no terminal:   sbcl --script exercicio2.lsp
;                (ou, com o CLISP:  clisp exercicio2.lsp)
; sem instalar:  cole o arquivo em tio.run, escolha Common Lisp e rode


; ESTRUTURA DE DADOS COM defstruct
; perigo é sempre uma keyword: :inofensiva, :agressiva ou :leviata
(defstruct criatura
  nome
  bioma
  profundidade    ; em metros
  perigo)


; CONDIÇÕES COM case
; case compara a keyword com opções fixas, como o pattern matching
; otherwise pega qualquer keyword que não apareceu acima
(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviata: mantenha distancia")
    (otherwise   "Desconhecido")))


; TEXTO COM format nil
; devolve o texto montado sem imprimir nada
(defun descreve-criatura (c)
  (format nil "~a - ~a - ~am - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))


; FUNÇÃO SEM NOME (lambda) E FILTRO COM remove-if-not
; devolve uma lista NOVA só com as criaturas mais fundas que metros;
; o catálogo recebido não é alterado
(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))


; VARIÁVEL GLOBAL COM defparameter
; o catálogo fica fora da main, com pelo menos uma criatura de cada perigo
(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Recifes Rasos"
                  :profundidade 10 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de Kelp"
                  :profundidade 40 :perigo :agressiva)
   (make-criatura :nome "Crabsquid" :bioma "Ilha Flutuante Submersa"
                  :profundidade 300 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Dunas"
                  :profundidade 200 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Vazio"
                  :profundidade 900 :perigo :leviata)))


; FUNÇÃO PRINCIPAL E SAÍDA
; mapcar transforma cada criatura em texto (é o map do Haskell);
; #'descreve-criatura passa a função como argumento
; dolist só imprime cada texto; length conta os elementos da lista
(defun main ()
  (format t "--- Catalogo do Scanner ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (let ((fundas (abaixo-de 100 *catalogo*)))
    (format t "--- Criaturas abaixo de 100m ---~%")
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Quantidade abaixo de 100m: ~a~%" (length fundas))))


; chamada da função principal: precisa vir depois de todas as definições
(main)


; SAÍDA DO PROGRAMA
; --- Catalogo do Scanner ---
; Peeper - Recifes Rasos - 10m - Inofensiva
; Stalker - Floresta de Kelp - 40m - Agressiva
; Crabsquid - Ilha Flutuante Submersa - 300m - Agressiva
; Reaper Leviathan - Dunas - 200m - Leviata: mantenha distancia
; Ghost Leviathan - Vazio - 900m - Leviata: mantenha distancia
; --- Criaturas abaixo de 100m ---
; Crabsquid - Ilha Flutuante Submersa - 300m - Agressiva
; Reaper Leviathan - Dunas - 200m - Leviata: mantenha distancia
; Ghost Leviathan - Vazio - 900m - Leviata: mantenha distancia
; Quantidade abaixo de 100m: 3