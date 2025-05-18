datatype Atom = NIL | SYMBOL of string
datatype SExp = ATOM of Atom | CONS of (SExp * SExp)

fun tokenize x =
  String.tokens (fn c => c = #" ")
     (String.translate (fn #"(" => "( " | #")" => " )" | c => str c) x);



fun parseOne ("(" :: ts) = parseList ts
  | parseOne (s   :: ts) = (ATOM (SYMBOL s), ts)

and parseList (")" :: ts) = (ATOM NIL, ts)
  | parseList ts =
      let
        val (hd, ts1) = parseOne ts
        val (tl, ts2) = parseList ts1
      in
        (CONS (hd, tl), ts2)
      end;
