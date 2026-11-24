; EXERCÍCIO 3: AS JOIAS DA ALMA
; acompanha o quanto as Joias da Alma das garotas mágicas já escureceram

; COMO RODAR
; no terminal:   sbcl --script exercicio3.lsp
;                (ou, com o CLISP:  clisp exercicio3.lsp)
; sem instalar:  cole o arquivo em tio.run, escolha Common Lisp e rode


; ESTRUTURA DE DADOS COM defstruct
; escuridao vai de 0 (joia limpa) a 100; bruxas = quantas ela derrotou
(defstruct garota-magica
  nome
  escuridao
  bruxas)


; RECURSÃO COM null, car E cdr (sem reduce nem mapcar)
;   (null grupo)  grupo vazio: caso base, vale 0
;   (car grupo)   a primeira garota
;   (cdr grupo)   o resto do grupo
; passo a passo, com escuridões 10, 55 e 30:
;   10 + (55 + (30 + 0)) = 95
(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))


; reduce E mapcar
; mapcar pega as bruxas de cada garota; reduce soma tudo em um valor
; #'garota-magica-bruxas: a função criada pelo defstruct também é valor
(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))


; "ALTERAR" UMA GAROTA = CRIAR OUTRA
; monta uma garota NOVA com make-garota-magica; a original não muda
; if: se a quantidade cobre toda a escuridão, a joia fica limpa (0)
(defun purifica (g quantidade)
  (make-garota-magica
   :nome      (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas    (garota-magica-bruxas g)))


; FUNÇÃO PRINCIPAL E SAÍDA
; let* deixa cada nome usar os de cima: grupo-novo usa grupo
; cons cria uma lista NOVA com a garota na frente; o grupo original não muda
(defun main ()
  (let* ((grupo
           (list
            (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 4)
            (make-garota-magica :nome "Homura" :escuridao 55 :bruxas 30)
            (make-garota-magica :nome "Mami"   :escuridao 30 :bruxas 25)))
         (grupo-novo
           (cons (make-garota-magica :nome "Sayaka" :escuridao 70 :bruxas 6)
                 grupo)))
    (format t "--- Grupo original ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (format t "--- Sayaka faz o contrato (cons) ---~%")
    (format t "Escuridao total do grupo novo: ~a~%" (escuridao-total grupo-novo))
    (format t "Escuridao total do grupo original: ~a~%" (escuridao-total grupo))

    (format t "--- Purificacao com Semente da Aflicao ---~%")
    (let* ((homura    (second grupo))
           (purificada (purifica homura 40)))
      (format t "~a original: escuridao ~a~%"
              (garota-magica-nome homura) (garota-magica-escuridao homura))
      (format t "~a purificada: escuridao ~a~%"
              (garota-magica-nome purificada)
              (garota-magica-escuridao purificada)))))


; chamada da função principal: precisa vir depois de todas as definições
(main)


; SAÍDA DO PROGRAMA
; --- Grupo original ---
; Escuridao total: 95
; Total de bruxas derrotadas: 59
; --- Sayaka faz o contrato (cons) ---
; Escuridao total do grupo novo: 165
; Escuridao total do grupo original: 95
; --- Purificacao com Semente da Aflicao ---
; Homura original: escuridao 55
; Homura purificada: escuridao 15