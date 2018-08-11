#lang scribble/manual
@require[@for-label[logger
                    racket/base]]

@require[racket/sandbox scribble/example]

@(define evaluator (parameterize ([sandbox-output 'string]
                                  [sandbox-error-output 'string]
                                  [sandbox-memory-limit 500])
                     (make-evaluator 'racket '(require logger))))

@title{logger}
@author{Kevin Robert Stravers}

@defmodule[logger]

Provides simple colored logging functionality of various log levels.

@defproc[(logger-color [state (or/c 'automatic #t #f)]) void?]{
  Sets the logger color.
}

@section{Basic Loggers}

@defform[(trce expr ...)]{
  Prints the expression in its code-form as well as the result of evaluating the expression.
}

@examples[#:eval evaluator
  (logger-color #f)
  (trce (+ 1 2))
]


A logger can be suffixed by a symbol. What follows is a list of applicable symbols:
@itemize[
         @item{No suffix prints the expression as well as its result}
         @item{@racket[*] suffix prints the result, and _ instead of the expression. Can only handle one argument}
         @item{@racket[^] suffix is similar to @racket[*] but also prints the date and source location}
         @item{@racket[+] prints the date, source location, expression, and result. It is the most verbose suffix.}
]

All loggers return their last input.

Besides @racket[trce], the following loggers are implemented: @racket[dbug] @racket[info] @racket[warn] @racket[erro] @racket[crit] @racket[ftal]. Accompanying suffixes apply.

@defform[(dbug expr ...)]{
@defform[(info expr ...)]
@defform[(warn expr ...)]
@defform[(erro expr ...)]
@defform[(crit expr ...)]
@defform[(ftal expr ...)]
  Forms of the default logger. Prints both syntax and the result of an evaluation.
  Logs a separate line for each expression.
}

@section{No-expression Loggers}
@defform[(trce* expr)]{
@defform[(dbug* expr)]
@defform[(info* expr)]
@defform[(warn* expr)]
@defform[(erro* expr)]
@defform[(crit* expr)]
@defform[(ftal* expr)]
  Forms of the succinct logger. Prints only the result of an evaluation.
  Logs a separate line for each expression.
}

@section{No-expression + Time/Source Loggers}
@defform[(trce^ expr)]{
@defform[(dbug^ expr)]
@defform[(info^ expr)]
@defform[(warn^ expr)]
@defform[(erro^ expr)]
@defform[(crit^ expr)]
@defform[(ftal^ expr)]
  Forms of the source-succinct logger. Prints the time, source file, line, and the result of an evaluation.
}

@section{Fully Verbose Loggers}
@defform[(trce+ expr ...)]{
@defform[(dbug+ expr ...)]
@defform[(info+ expr ...)]
@defform[(warn+ expr ...)]
@defform[(erro+ expr ...)]
@defform[(crit+ expr ...)]
@defform[(ftal+ expr ...)]
  Forms of the source-verbose logger. Prints the time, source file, line, expression, and the result of an evaluation.
}

@section{Examples}
Here are some examples of the loggers.
@examples[#:eval evaluator
  (dbug  (+ 1 (sqr 2)))
  (trce* (+ 1 2))
  (crit^ (number->string (+ 1 2)))
  (info+ `(connection-established ,8000))
]
