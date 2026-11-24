; EXERCÍCIO 4: OS DOMÍNIOS DE TEYVAT
; monta a rota de domínios que o Viajante consegue enfrentar e soma a mora

; COMO RODAR
; no terminal:   sbcl --script exercicio4.lsp
;                (ou, com o CLISP:  clisp exercicio4.lsp)
; sem instalar:  cole o arquivo em tio.run, escolha Common Lisp e rode


; ESTRUTURA DE DADOS COM defstruct
; elemento é uma keyword (:pyro, :hydro, :cryo, :electro, :anemo)
; dificuldade vai de 1 a 5; mora é a recompensa base
(defstruct dominio
  nome
  elemento
  dificuldade
  mora)


; CONDIÇÕES COM case
; devolve o multiplicador da recompensa para cada elemento
(defun bonus-elemental (elemento)
  (case elemento
    (:electro  1.5)
    (:hydro    1.2)
    (otherwise 1)))


; FUNÇÃO PURA COM defun
; mora do domínio multiplicada pelo bônus do elemento
; exemplo: 1000 de mora em :electro -> 1500.0
(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))


; PASSOS EM SEQUÊNCIA COM let*
; 1. remove-if-not com lambda filtra os domínios com dificuldade <= máxima
; 2. mapcar transforma os que sobraram em textos (usa o nome de cima)
; ~,1f escreve a recompensa com uma casa decimal
(defun rota (lista dificuldade-maxima)
  (let* ((possiveis (remove-if-not
                     (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                     lista))
         (textos    (mapcar (lambda (d)
                              (format nil "~a - ~,1f de mora"
                                      (dominio-nome d) (recompensa-final d)))
                            possiveis)))
    textos))


; FUNÇÃO PRINCIPAL E SAÍDA
(defun main ()
  (let ((dominios
          (list
           (make-dominio :nome "Cecilia Garden" :elemento :anemo
                         :dificuldade 2 :mora 800)
           (make-dominio :nome "Taishan Mansion" :elemento :pyro
                         :dificuldade 3 :mora 1200)
           (make-dominio :nome "Violet Court" :elemento :electro
                         :dificuldade 4 :mora 1600)
           (make-dominio :nome "Domain of Guyun" :elemento :hydro
                         :dificuldade 1 :mora 500)
           (make-dominio :nome "Peak of Vindagnyr" :elemento :cryo
                         :dificuldade 5 :mora 2000))))
    ; dolist imprime cada texto da rota
    (format t "--- Rota ate dificuldade 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))

    ; reduce soma as recompensas finais que o mapcar calculou
    (format t "--- Total de mora ---~%")
    (format t "Mora da lista inteira: ~,1f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    ; CONTRASTE: O LISP PERMITE ALTERAR
    ; setf muda um campo NO LUGAR (estilo imperativo); a alteração é feita
    ; numa cópia (copy-dominio) para o domínio original continuar igual
    (format t "--- O Lisp permite alterar (setf) ---~%")
    (let ((copia (copy-dominio (car dominios))))
      (setf (dominio-mora copia) 5000)
      (format t "Mora da copia alterada com setf: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (car dominios))))))


; chamada da função principal: precisa vir depois de todas as definições
(main)


; SAÍDA DO PROGRAMA
; --- Rota ate dificuldade 3 ---
; Cecilia Garden - 800.0 de mora
; Taishan Mansion - 1200.0 de mora
; Domain of Guyun - 600.0 de mora
; --- Total de mora ---
; Mora da lista inteira: 7000.0
; --- O Lisp permite alterar (setf) ---
; Mora da copia alterada com setf: 5000
; Mora do original: 800