; EXERCÍCIO 1: A FARMÁCIA DA MAOMAO
; classifica as ervas do estoque pela toxicidade e calcula o preço das doses

; COMO RODAR
; no terminal:   sbcl --script exercicio1.lsp
;                (ou, com o CLISP:  clisp exercicio1.lsp)
; sem instalar:  cole o arquivo em tio.run, escolha Common Lisp e rode


; ESTRUTURA DE DADOS COM defstruct
; gera make-erva, erva-nome, erva-preco-por-grama, erva-toxicidade...
; toxicidade vai de 0 (inofensiva) a 10 (veneno mortal)
(defstruct erva
  nome
  preco-por-grama
  toxicidade)


; CONDIÇÕES COM cond
; as cláusulas são testadas de cima para baixo: se a toxicidade não é
; 7 ou mais, mas é 4 ou mais, então está entre 4 e 6
; o t no fim é o "senão"
(defun classifica-erva (erva)
  (let ((tox (erva-toxicidade erva)))
    (cond ((>= tox 7) "veneno")
          ((>= tox 4) "use com cuidado")
          (t "segura"))))


; FUNÇÃO PURA COM defun
; preço por grama multiplicado pela quantidade de gramas
; exemplo: erva de 2.5 por grama, 10 gramas -> 25.0
(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))


; TEXTO COM format nil
; format nil não imprime: DEVOLVE o texto, por isso a função é pura
; ~a insere um valor e ~,2f escreve o número com duas casas decimais
(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))


; CONDIÇÃO COM if
; (if teste valor-se-verdadeiro valor-se-falso): o if vale um dos textos
(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      (format nil "Aviso: Maomao vai testar ~a em si mesma antes!"
              (erva-nome erva))
      (format nil "~a esta liberada para o paciente."
              (erva-nome erva))))


; FUNÇÃO PRINCIPAL E SAÍDA
; let cria a lista de ervas, uma de cada classificação
; dolist repete a impressão para cada erva; format t IMPRIME, ~% quebra a linha
(defun main ()
  (let ((estoque
          (list
           (make-erva :nome "Ginseng" :preco-por-grama 2.5 :toxicidade 1)
           (make-erva :nome "Artemisia" :preco-por-grama 4 :toxicidade 5)
           (make-erva :nome "Aconito" :preco-por-grama 12.75 :toxicidade 9))))
    (format t "--- Estoque da Maomao ---~%")
    (dolist (e estoque)
      (format t "~a~%" (descreve-erva e))
      (format t "  ~a~%" (aviso e)))

    (format t "--- Preco de uma dose ---~%")
    (let ((ginseng (car estoque)))
      (format t "10 gramas de ~a: R$~,2f~%"
              (erva-nome ginseng) (preco-da-dose ginseng 10)))))


; chamada da função principal: precisa vir depois de todas as definições
(main)


; SAÍDA DO PROGRAMA
; --- Estoque da Maomao ---
; Ginseng - R$2.50 por grama - segura
;   Ginseng esta liberada para o paciente.
; Artemisia - R$4.00 por grama - use com cuidado
;   Artemisia esta liberada para o paciente.
; Aconito - R$12.75 por grama - veneno
;   Aviso: Maomao vai testar Aconito em si mesma antes!
; --- Preco de uma dose ---
; 10 gramas de Ginseng: R$25.00