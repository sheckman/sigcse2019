#lang racket

(require csv-reading)

#|
This comes out as
'(*TOP*
  (row
   (col-0 ...)
   (col-1 ...)
|#

;; The Whova CSV file has a byte order mark from Excel.
;; (col-0 "\uFEFF*Date")
;; This has to be pulled out. It wreaks havoc with Jekyll.

#|
  (row
   (col-0 "\uFEFF*Date")
   (col-1 "*Time Start")
   (col-2 "*Time End")
   (col-3 "Tracks")
   (col-4 "*Session Title")
   (col-5 "Room/Location")
   (col-6 "Description")
   (col-7 "Speakers")
   (col-8 "Authors")
   (col-9 "Session or \rSub-session(Sub)")
|#

(define (parse sxml)
  (match sxml
    [(list '*TOP* rows ...)
     (map parse rows)]
    [(list 'row cols ...)
     `(row ,@(filter string? (map parse cols)))]
    [`(col-0 ,date)
     (~a (regexp-replace "\uFEFF" date ""))]
    [(list col val)
     (if (not (equal? val ""))
         val false)]
    [else
     false]))

(define (csv-quote str)
  (format "\"~a\"" (regexp-replace* "\"" str "\"\"")))

(define (remove-cr str)
  (regexp-replace* "\r" str " "))

(define (rewrite parsed outfile)
  (for ([row parsed])
    (define printable (apply string-append (add-between
                                            (map remove-cr (map csv-quote (rest row))) ",")))
    (fprintf outfile "~a~n" printable))
  (close-output-port outfile))


(define whova-presymposium
  (csv->sxml (open-input-file "whova-presymposium.csv")))

(rewrite (parse whova-presymposium)
         (open-output-file
          "clean-presymposium.csv"
          #:exists 'replace))

