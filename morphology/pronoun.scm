
;; TODO: add 'subjective' root and number (sg/pl)
(define (possessive-long pronoun)
   (cond 
        ((eq? pronoun 'mina ) 'minu)
        ((eq? pronoun 'sina ) 'sinu)
        ((eq? pronoun 'tema) 'tema)
        ((eq? pronoun 'meie) 'meie)
        ((eq? pronoun 'teie) 'teie)
        ((eq? pronoun 'nemad) 'nende) ) )

(define (possessive-short pronoun)
    (cond 
        ((eq? pronoun 'mina ) 'mu)
        ((eq? pronoun 'sina ) 'su)
        ((eq? pronoun 'tema) 'ta)
        ((eq? pronoun 'meie) 'me)
        ((eq? pronoun 'teie) 'te)
        ((eq? pronoun 'nemad) 'nende) ) )
