(* This file is generated by ortac qcheck-stm,
   edit how you run the tool instead *)
[@@@ocaml.warning "-26-27-69-32-38"]
open Lwt_dllist_spec
module Ortac_runtime = Ortac_runtime_qcheck_stm
module SUT =
  (Ortac_runtime.SUT.Make)(struct type sut = int t
                                  let init () = create () end)
module ModelElt =
  struct
    type nonrec elt = {
      contents: int Ortac_runtime.Gospelstdlib.sequence }
    let init =
      let () = () in
      {
        contents =
          (try Ortac_runtime.Gospelstdlib.Sequence.empty
           with
           | e ->
               raise
                 (Ortac_runtime.Partial_function
                    (e,
                      {
                        Ortac_runtime.start =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 46;
                            pos_bol = 1807;
                            pos_cnum = 1834
                          };
                        Ortac_runtime.stop =
                          {
                            pos_fname = "lwt_dllist_spec.mli";
                            pos_lnum = 46;
                            pos_bol = 1807;
                            pos_cnum = 1848
                          }
                      })))
      }
  end
module Model = (Ortac_runtime.Model.Make)(ModelElt)
module Spec =
  struct
    open STM
    type _ ty +=  
      | Node: 'a ty -> 'a node ty 
    let node spec =
      let (ty, show) = spec in
      ((Node ty), (fun n -> Printf.sprintf "Node %s" (show (get n))))
    type _ ty +=  
      | Integer: Ortac_runtime.integer ty 
    let integer = (Integer, Ortac_runtime.string_of_integer)
    type _ ty +=  
      | SUT: SUT.elt ty 
    let sut = (SUT, (fun _ -> "<sut>"))
    type sut = SUT.t
    let init_sut = SUT.create 1
    type state = Model.t
    let init_state = Model.create 1 ()
    type cmd =
      | Create of unit 
      | Is_empty 
      | Length 
      | Add_l of int 
      | Add_r of int 
      | Take_l 
      | Take_r 
      | Take_opt_l 
      | Take_opt_r 
    let show_cmd cmd__001_ =
      match cmd__001_ with
      | Create () ->
          Format.asprintf "%s %a" "create" (Util.Pp.pp_unit true) ()
      | Is_empty -> Format.asprintf "%s <sut>" "is_empty"
      | Length -> Format.asprintf "%s <sut>" "length"
      | Add_l a_1 ->
          Format.asprintf "%s %a <sut>" "add_l" (Util.Pp.pp_int true) a_1
      | Add_r a_2 ->
          Format.asprintf "%s %a <sut>" "add_r" (Util.Pp.pp_int true) a_2
      | Take_l -> Format.asprintf "protect (fun () -> %s <sut>)" "take_l"
      | Take_r -> Format.asprintf "protect (fun () -> %s <sut>)" "take_r"
      | Take_opt_l -> Format.asprintf "%s <sut>" "take_opt_l"
      | Take_opt_r -> Format.asprintf "%s <sut>" "take_opt_r"
    let cleanup _ = ()
    let arb_cmd _ =
      let open QCheck in
        make ~print:show_cmd
          (let open Gen in
             oneof
               [(pure (fun () -> Create ())) <*> unit;
               pure Is_empty;
               pure Length;
               (pure (fun a_1 -> Add_l a_1)) <*> int;
               (pure (fun a_2 -> Add_r a_2)) <*> int;
               pure Take_l;
               pure Take_r;
               pure Take_opt_l;
               pure Take_opt_r])
    let next_state cmd__002_ state__003_ =
      match cmd__002_ with
      | Create () ->
          let s__005_ =
            let open ModelElt in
              {
                contents =
                  (try Ortac_runtime.Gospelstdlib.Sequence.empty
                   with
                   | e ->
                       raise
                         (Ortac_runtime.Partial_function
                            (e,
                              {
                                Ortac_runtime.start =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 46;
                                    pos_bol = 1807;
                                    pos_cnum = 1834
                                  };
                                Ortac_runtime.stop =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 46;
                                    pos_bol = 1807;
                                    pos_cnum = 1848
                                  }
                              })))
              } in
          Model.push (Model.drop_n state__003_ 0) s__005_
      | Is_empty ->
          let s_1__006_ = Model.get state__003_ 0 in
          let s_1__007_ = s_1__006_ in
          Model.push (Model.drop_n state__003_ 1) s_1__007_
      | Length ->
          let s_2__008_ = Model.get state__003_ 0 in
          let s_2__009_ = s_2__008_ in
          Model.push (Model.drop_n state__003_ 1) s_2__009_
      | Add_l a_1 ->
          let s_3__010_ = Model.get state__003_ 0 in
          let s_3__011_ =
            let open ModelElt in
              {
                contents =
                  (try
                     Ortac_runtime.Gospelstdlib.Sequence.cons a_1
                       s_3__010_.contents
                   with
                   | e ->
                       raise
                         (Ortac_runtime.Partial_function
                            (e,
                              {
                                Ortac_runtime.start =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 64;
                                    pos_bol = 3085;
                                    pos_cnum = 3112
                                  };
                                Ortac_runtime.stop =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 64;
                                    pos_bol = 3085;
                                    pos_cnum = 3144
                                  }
                              })))
              } in
          Model.push (Model.drop_n state__003_ 1) s_3__011_
      | Add_r a_2 ->
          let s_4__012_ = Model.get state__003_ 0 in
          let s_4__013_ =
            let open ModelElt in
              {
                contents =
                  (try
                     Ortac_runtime.Gospelstdlib.Sequence.snoc
                       s_4__012_.contents a_2
                   with
                   | e ->
                       raise
                         (Ortac_runtime.Partial_function
                            (e,
                              {
                                Ortac_runtime.start =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 70;
                                    pos_bol = 3553;
                                    pos_cnum = 3580
                                  };
                                Ortac_runtime.stop =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 70;
                                    pos_bol = 3553;
                                    pos_cnum = 3612
                                  }
                              })))
              } in
          Model.push (Model.drop_n state__003_ 1) s_4__013_
      | Take_l ->
          let s_5__014_ = Model.get state__003_ 0 in
          let s_5__015_ =
            let open ModelElt in
              {
                contents =
                  (try
                     if
                       s_5__014_.contents =
                         Ortac_runtime.Gospelstdlib.Sequence.empty
                     then Ortac_runtime.Gospelstdlib.Sequence.empty
                     else
                       Ortac_runtime.Gospelstdlib.Sequence.tl
                         s_5__014_.contents
                   with
                   | e ->
                       raise
                         (Ortac_runtime.Partial_function
                            (e,
                              {
                                Ortac_runtime.start =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 82;
                                    pos_bol = 4150;
                                    pos_cnum = 4177
                                  };
                                Ortac_runtime.stop =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 84;
                                    pos_bol = 4259;
                                    pos_cnum = 4319
                                  }
                              })))
              } in
          Model.push (Model.drop_n state__003_ 1) s_5__015_
      | Take_r ->
          let s_6__016_ = Model.get state__003_ 0 in
          let s_6__017_ =
            let open ModelElt in
              {
                contents =
                  (try
                     if
                       s_6__016_.contents =
                         Ortac_runtime.Gospelstdlib.Sequence.empty
                     then Ortac_runtime.Gospelstdlib.Sequence.empty
                     else
                       Ortac_runtime.Gospelstdlib.__mix_Bddub
                         s_6__016_.contents
                         (Ortac_runtime.Gospelstdlib.(-)
                            (Ortac_runtime.Gospelstdlib.Sequence.length
                               s_6__016_.contents)
                            (Ortac_runtime.Gospelstdlib.integer_of_int 2))
                   with
                   | e ->
                       raise
                         (Ortac_runtime.Partial_function
                            (e,
                              {
                                Ortac_runtime.start =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 96;
                                    pos_bol = 4953;
                                    pos_cnum = 4980
                                  };
                                Ortac_runtime.stop =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 98;
                                    pos_bol = 5062;
                                    pos_cnum = 5152
                                  }
                              })))
              } in
          Model.push (Model.drop_n state__003_ 1) s_6__017_
      | Take_opt_l ->
          let s_7__018_ = Model.get state__003_ 0 in
          let s_7__019_ =
            let open ModelElt in
              {
                contents =
                  (try
                     if
                       (Ortac_runtime.Gospelstdlib.Sequence.length
                          s_7__018_.contents)
                         = (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                     then Ortac_runtime.Gospelstdlib.Sequence.empty
                     else
                       Ortac_runtime.Gospelstdlib.Sequence.tl
                         s_7__018_.contents
                   with
                   | e ->
                       raise
                         (Ortac_runtime.Partial_function
                            (e,
                              {
                                Ortac_runtime.start =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 109;
                                    pos_bol = 5855;
                                    pos_cnum = 5882
                                  };
                                Ortac_runtime.stop =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 111;
                                    pos_bol = 5969;
                                    pos_cnum = 6029
                                  }
                              })))
              } in
          Model.push (Model.drop_n state__003_ 1) s_7__019_
      | Take_opt_r ->
          let s_8__020_ = Model.get state__003_ 0 in
          let s_8__022_ =
            let open ModelElt in
              {
                contents =
                  (try
                     match Ortac_runtime.Gospelstdlib.Sequence.length
                             s_8__020_.contents
                     with
                     | __x__021_ when
                         (=) __x__021_
                           (Ortac_runtime.Gospelstdlib.integer_of_int 0)
                         -> Ortac_runtime.Gospelstdlib.Sequence.empty
                     | l ->
                         Ortac_runtime.Gospelstdlib.__mix_Bddub
                           s_8__020_.contents
                           (Ortac_runtime.Gospelstdlib.(-) l
                              (Ortac_runtime.Gospelstdlib.integer_of_int 2))
                   with
                   | e ->
                       raise
                         (Ortac_runtime.Partial_function
                            (e,
                              {
                                Ortac_runtime.start =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 121;
                                    pos_bol = 6691;
                                    pos_cnum = 6718
                                  };
                                Ortac_runtime.stop =
                                  {
                                    pos_fname = "lwt_dllist_spec.mli";
                                    pos_lnum = 123;
                                    pos_bol = 6810;
                                    pos_cnum = 6868
                                  }
                              })))
              } in
          Model.push (Model.drop_n state__003_ 1) s_8__022_
    let precond cmd__057_ state__058_ =
      match cmd__057_ with
      | Create () -> true
      | Is_empty -> true
      | Length -> true
      | Add_l a_1 -> true
      | Add_r a_2 -> true
      | Take_l -> true
      | Take_r -> true
      | Take_opt_l -> true
      | Take_opt_r -> true
    let postcond _ _ _ = true
    let run cmd__059_ sut__060_ =
      match cmd__059_ with
      | Create () ->
          Res
            (sut,
              (let res__061_ = create () in
               (SUT.push sut__060_ res__061_; res__061_)))
      | Is_empty ->
          Res
            (bool,
              (let s_1__062_ = SUT.pop sut__060_ in
               let res__063_ = is_empty s_1__062_ in
               (SUT.push sut__060_ s_1__062_; res__063_)))
      | Length ->
          Res
            (int,
              (let s_2__064_ = SUT.pop sut__060_ in
               let res__065_ = length s_2__064_ in
               (SUT.push sut__060_ s_2__064_; res__065_)))
      | Add_l a_1 ->
          Res
            ((node int),
              (let s_3__066_ = SUT.pop sut__060_ in
               let res__067_ = add_l a_1 s_3__066_ in
               (SUT.push sut__060_ s_3__066_; res__067_)))
      | Add_r a_2 ->
          Res
            ((node int),
              (let s_4__068_ = SUT.pop sut__060_ in
               let res__069_ = add_r a_2 s_4__068_ in
               (SUT.push sut__060_ s_4__068_; res__069_)))
      | Take_l ->
          Res
            ((result int exn),
              (let s_5__070_ = SUT.pop sut__060_ in
               let res__071_ = protect (fun () -> take_l s_5__070_) () in
               (SUT.push sut__060_ s_5__070_; res__071_)))
      | Take_r ->
          Res
            ((result int exn),
              (let s_6__072_ = SUT.pop sut__060_ in
               let res__073_ = protect (fun () -> take_r s_6__072_) () in
               (SUT.push sut__060_ s_6__072_; res__073_)))
      | Take_opt_l ->
          Res
            ((option int),
              (let s_7__074_ = SUT.pop sut__060_ in
               let res__075_ = take_opt_l s_7__074_ in
               (SUT.push sut__060_ s_7__074_; res__075_)))
      | Take_opt_r ->
          Res
            ((option int),
              (let s_8__076_ = SUT.pop sut__060_ in
               let res__077_ = take_opt_r s_8__076_ in
               (SUT.push sut__060_ s_8__076_; res__077_)))
  end
module STMTests = (Ortac_runtime.Make)(Spec)
let check_init_state () = ()
let ortac_show_cmd cmd__079_ state__080_ last__082_ res__081_ =
  let open Spec in
    let open STM in
      match (cmd__079_, res__081_) with
      | (Create (), Res ((SUT, _), s)) ->
          let lhs = if last__082_ then "r" else SUT.get_name state__080_ 0
          and shift = 1 in
          Format.asprintf "let %s = %s %a" lhs "create"
            (Util.Pp.pp_unit true) ()
      | (Is_empty, Res ((Bool, _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = %s %s" lhs "is_empty"
            (SUT.get_name state__080_ (0 + shift))
      | (Length, Res ((Int, _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = %s %s" lhs "length"
            (SUT.get_name state__080_ (0 + shift))
      | (Add_l a_1, Res ((Node (Int), _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = %s %a %s" lhs "add_l"
            (Util.Pp.pp_int true) a_1 (SUT.get_name state__080_ (0 + shift))
      | (Add_r a_2, Res ((Node (Int), _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = %s %a %s" lhs "add_r"
            (Util.Pp.pp_int true) a_2 (SUT.get_name state__080_ (0 + shift))
      | (Take_l, Res ((Result (Int, Exn), _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = protect (fun () -> %s %s)" lhs "take_l"
            (SUT.get_name state__080_ (0 + shift))
      | (Take_r, Res ((Result (Int, Exn), _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = protect (fun () -> %s %s)" lhs "take_r"
            (SUT.get_name state__080_ (0 + shift))
      | (Take_opt_l, Res ((Option (Int), _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = %s %s" lhs "take_opt_l"
            (SUT.get_name state__080_ (0 + shift))
      | (Take_opt_r, Res ((Option (Int), _), _)) ->
          let lhs = if last__082_ then "r" else "_"
          and shift = 0 in
          Format.asprintf "let %s = %s %s" lhs "take_opt_r"
            (SUT.get_name state__080_ (0 + shift))
      | _ -> assert false
let ortac_postcond cmd__023_ state__024_ res__025_ =
  let open Spec in
    let open STM in
      let new_state__026_ = lazy (next_state cmd__023_ state__024_) in
      match (cmd__023_, res__025_) with
      | (Create (), Res ((SUT, _), s)) -> None
      | (Is_empty, Res ((Bool, _), b)) ->
          if
            let s_old__027_ = Model.get state__024_ 0
            and s_new__028_ = lazy (Model.get (Lazy.force new_state__026_) 0) in
            (try
               (b = true) =
                 ((Lazy.force s_new__028_).contents =
                    Ortac_runtime.Gospelstdlib.Sequence.empty)
             with | e -> false)
          then None
          else
            Some
              (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                 (try Ortac_runtime.Value (Res (Ortac_runtime.dummy, ()))
                  with | e -> Ortac_runtime.Out_of_domain) "is_empty"
                 [("b <-> s.contents = Sequence.empty",
                    {
                      Ortac_runtime.start =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 51;
                          pos_bol = 2194;
                          pos_cnum = 2208
                        };
                      Ortac_runtime.stop =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 51;
                          pos_bol = 2194;
                          pos_cnum = 2241
                        }
                    })])
      | (Length, Res ((Int, _), l_1)) ->
          if
            let s_old__032_ = Model.get state__024_ 0
            and s_new__033_ = lazy (Model.get (Lazy.force new_state__026_) 0) in
            (try
               (Ortac_runtime.Gospelstdlib.integer_of_int l_1) =
                 (Ortac_runtime.Gospelstdlib.Sequence.length
                    (Lazy.force s_new__033_).contents)
             with | e -> false)
          then None
          else
            Some
              (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                 (try
                    Ortac_runtime.Value
                      (Res
                         (integer,
                           (let s_old__030_ = Model.get state__024_ 0
                            and s_new__031_ =
                              lazy (Model.get (Lazy.force new_state__026_) 0) in
                            Ortac_runtime.Gospelstdlib.Sequence.length
                              (Lazy.force s_new__031_).contents)))
                  with | e -> Ortac_runtime.Out_of_domain) "length"
                 [("l = Sequence.length s.contents",
                    {
                      Ortac_runtime.start =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 58;
                          pos_bol = 2649;
                          pos_cnum = 2663
                        };
                      Ortac_runtime.stop =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 58;
                          pos_bol = 2649;
                          pos_cnum = 2693
                        }
                    })])
      | (Add_l a_1, Res ((Node (Int), _), n)) -> None
      | (Add_r a_2, Res ((Node (Int), _), n_1)) -> None
      | (Take_l, Res ((Result (Int, Exn), _), a_3)) ->
          (match a_3 with
           | Ok a_3 ->
               if
                 let s_old__037_ = Model.get state__024_ 0
                 and s_new__038_ =
                   lazy (Model.get (Lazy.force new_state__026_) 0) in
                 (try
                    if
                      s_old__037_.contents =
                        Ortac_runtime.Gospelstdlib.Sequence.empty
                    then false
                    else
                      a_3 =
                        (Ortac_runtime.Gospelstdlib.Sequence.hd
                           s_old__037_.contents)
                  with | e -> false)
               then None
               else
                 Some
                   (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                      (try
                         Ortac_runtime.Protected_value
                           (Res (Ortac_runtime.dummy, ()))
                       with | e -> Ortac_runtime.Out_of_domain) "take_l"
                      [("if old s.contents = Sequence.empty\n              then false\n              else a = Sequence.hd (old s.contents)",
                         {
                           Ortac_runtime.start =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 85;
                               pos_bol = 4320;
                               pos_cnum = 4334
                             };
                           Ortac_runtime.stop =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 87;
                               pos_bol = 4394;
                               pos_cnum = 4445
                             }
                         })])
           | Error (Empty) ->
               if
                 let s_old__039_ = Model.get state__024_ 0
                 and s_new__040_ =
                   lazy (Model.get (Lazy.force new_state__026_) 0) in
                 (try
                    let __t1__041_ =
                      s_old__039_.contents =
                        Ortac_runtime.Gospelstdlib.Sequence.empty in
                    let __t2__042_ =
                      Ortac_runtime.Gospelstdlib.Sequence.empty =
                        (Lazy.force s_new__040_).contents in
                    __t1__041_ && __t2__042_
                  with | e -> false)
               then None
               else
                 Some
                   (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                      (try Ortac_runtime.Exception "Empty"
                       with | e -> Ortac_runtime.Out_of_domain) "take_l"
                      [("old s.contents = Sequence.empty = s.contents",
                         {
                           Ortac_runtime.start =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 88;
                               pos_bol = 4446;
                               pos_cnum = 4468
                             };
                           Ortac_runtime.stop =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 88;
                               pos_bol = 4446;
                               pos_cnum = 4512
                             }
                         })])
           | _ -> None)
      | (Take_r, Res ((Result (Int, Exn), _), a_4)) ->
          (match a_4 with
           | Ok a_4 ->
               if
                 let s_old__044_ = Model.get state__024_ 0
                 and s_new__045_ =
                   lazy (Model.get (Lazy.force new_state__026_) 0) in
                 (try
                    if
                      s_old__044_.contents =
                        Ortac_runtime.Gospelstdlib.Sequence.empty
                    then false
                    else
                      a_4 =
                        (Ortac_runtime.Gospelstdlib.__mix_Bub
                           s_old__044_.contents
                           (Ortac_runtime.Gospelstdlib.(-)
                              (Ortac_runtime.Gospelstdlib.Sequence.length
                                 s_old__044_.contents)
                              (Ortac_runtime.Gospelstdlib.integer_of_int 1)))
                  with | e -> false)
               then None
               else
                 Some
                   (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                      (try
                         Ortac_runtime.Protected_value
                           (Res (Ortac_runtime.dummy, ()))
                       with | e -> Ortac_runtime.Out_of_domain) "take_r"
                      [("if old s.contents = Sequence.empty\n              then false\n              else a = (old s.contents)[Sequence.length (old s.contents) - 1]",
                         {
                           Ortac_runtime.start =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 99;
                               pos_bol = 5153;
                               pos_cnum = 5167
                             };
                           Ortac_runtime.stop =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 101;
                               pos_bol = 5227;
                               pos_cnum = 5304
                             }
                         })])
           | Error (Empty) ->
               if
                 let s_old__046_ = Model.get state__024_ 0
                 and s_new__047_ =
                   lazy (Model.get (Lazy.force new_state__026_) 0) in
                 (try
                    let __t1__048_ =
                      s_old__046_.contents =
                        Ortac_runtime.Gospelstdlib.Sequence.empty in
                    let __t2__049_ =
                      Ortac_runtime.Gospelstdlib.Sequence.empty =
                        (Lazy.force s_new__047_).contents in
                    __t1__048_ && __t2__049_
                  with | e -> false)
               then None
               else
                 Some
                   (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                      (try Ortac_runtime.Exception "Empty"
                       with | e -> Ortac_runtime.Out_of_domain) "take_r"
                      [("old s.contents = Sequence.empty = s.contents",
                         {
                           Ortac_runtime.start =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 102;
                               pos_bol = 5305;
                               pos_cnum = 5327
                             };
                           Ortac_runtime.stop =
                             {
                               pos_fname = "lwt_dllist_spec.mli";
                               pos_lnum = 102;
                               pos_bol = 5305;
                               pos_cnum = 5371
                             }
                         })])
           | _ -> None)
      | (Take_opt_l, Res ((Option (Int), _), o)) ->
          if
            let s_old__051_ = Model.get state__024_ 0
            and s_new__052_ = lazy (Model.get (Lazy.force new_state__026_) 0) in
            (try
               s_old__051_.contents =
                 (match o with
                  | None -> Ortac_runtime.Gospelstdlib.Sequence.empty
                  | Some a_5 ->
                      Ortac_runtime.Gospelstdlib.Sequence.cons a_5
                        (Lazy.force s_new__052_).contents)
             with | e -> false)
          then None
          else
            Some
              (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                 (try Ortac_runtime.Value (Res (Ortac_runtime.dummy, ()))
                  with | e -> Ortac_runtime.Out_of_domain) "take_opt_l"
                 [("old s.contents = match o with\n                                | None -> Sequence.empty\n                                | Some a -> Sequence.cons a s.contents",
                    {
                      Ortac_runtime.start =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 112;
                          pos_bol = 6030;
                          pos_cnum = 6044
                        };
                      Ortac_runtime.stop =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 114;
                          pos_bol = 6131;
                          pos_cnum = 6201
                        }
                    })])
      | (Take_opt_r, Res ((Option (Int), _), o_1)) ->
          if
            let s_old__054_ = Model.get state__024_ 0
            and s_new__055_ = lazy (Model.get (Lazy.force new_state__026_) 0) in
            (try
               s_old__054_.contents =
                 (match o_1 with
                  | None -> Ortac_runtime.Gospelstdlib.Sequence.empty
                  | Some a_6 ->
                      Ortac_runtime.Gospelstdlib.Sequence.snoc
                        (Lazy.force s_new__055_).contents a_6)
             with | e -> false)
          then None
          else
            Some
              (Ortac_runtime.report "Lwt_dllist_spec" "create ()"
                 (try Ortac_runtime.Value (Res (Ortac_runtime.dummy, ()))
                  with | e -> Ortac_runtime.Out_of_domain) "take_opt_r"
                 [("old s.contents = match o with\n                                | None -> Sequence.empty\n                                | Some a -> Sequence.snoc s.contents a",
                    {
                      Ortac_runtime.start =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 124;
                          pos_bol = 6869;
                          pos_cnum = 6883
                        };
                      Ortac_runtime.stop =
                        {
                          pos_fname = "lwt_dllist_spec.mli";
                          pos_lnum = 126;
                          pos_bol = 6970;
                          pos_cnum = 7040
                        }
                    })])
      | _ -> None
let _ =
  QCheck_base_runner.run_tests_main
    (let count = 1000 in
     [STMTests.agree_test ~count ~name:"Lwt_dllist_spec STM tests" 1
        check_init_state ortac_show_cmd ortac_postcond])
