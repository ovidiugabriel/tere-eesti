
;; TODO: Use subjective form as default.

;; Cases:
(struct pronoun (text person number) #:inspector #f)
(struct subjective (form-type root number) #:inspector #f)
(struct possessive (form-type root number) #:inspector #f)

;; Generates a 'genitive' text from given pronoun
(define (possessive-long a)
  (match a
    [(struct* pronoun ([text 'mina] [number 'singular])) 'minu]
    [(struct* pronoun ([text 'sina] [number 'singular])) 'sinu]
    [(struct* pronoun ([text 'tema] [number 'singular])) 'tema]
    
    [(struct* pronoun ([text 'meie] [number 'plural])) 'meie]
    [(struct* pronoun ([text 'teie] [number 'plural])) 'teie]
    [(struct* pronoun ([text 'nemad] [number 'plural])) 'nende] ))
  
(define (possessive-short a)
  (match a
    [(struct* pronoun ([text 'mina] [number 'singular])) 'mu]
    [(struct* pronoun ([text 'sina] [number 'singular])) 'su]
    [(struct* pronoun ([text 'tema] [number 'singular])) 'ta]

    [(struct* pronoun ([text 'meie] [number 'plural])) 'me]
    [(struct* pronoun ([text 'teie] [number 'plural])) 'te]
    [(struct* pronoun ([text 'nemad] [number 'plural])) 'nende] ))

; Analyze and return data
(define (pronoun->case a)
  (match a
    ; singular
    ['minu (possessive 'long mina 'singular)]
    ['sinu (possessive 'long sina 'singular)]
    ['tema '(or (subjective 'long tema 'singular)
                (possessive 'long tema 'singular))]
    ; plural
    ['meie '(or (subjective 'long meie 'singular)
                (possessive 'long meie 'singular))]
    ['teie '(or (subjective 'long teie 'singular)
                (possessive 'long teie 'singular))]
    ['nende (possessive 'long nemad 'singular)] ))

;; Dictionary
(define mina (pronoun 'mina 1 'singular))
(define sina (pronoun 'sina 2 'singular))
(define tema (pronoun 'tema 3 'singular))

(define meie (pronoun 'meie 1 'plural))
(define teie (pronoun 'teie 2 'plural))
(define nemad (pronoun 'nemad 3 'plural))
