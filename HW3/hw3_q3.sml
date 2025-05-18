datatype Atom = NIL | SYMBOL of string
datatype SExp = ATOM of Atom | CONS of (SExp * SExp)

local
fun parseOne ("(" :: ts) = parseL ts
  | parseOne (s   :: ts) = (ATOM (SYMBOL s), ts)
  | parseOne _ = raise Fail "immposible"

and parseL (")" :: ts) = (ATOM NIL, ts)
  | parseL ts =
      let
        val (hd, ts1) = parseOne ts
        val (tl, ts2) = parseL ts1
      in
        (CONS (hd, tl), ts2)
      end;
in
  fun parse ts =
    let
      val (sexp, rest) = parseOne ts
    in
     sexp
    end
end
