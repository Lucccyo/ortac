type t

val v : Gospel.Tmodule.namespace list -> t

val translate : t -> Gospel.Tterm.lsymbol -> string option

val get_ls : t -> string list -> Gospel.Tterm.lsymbol
