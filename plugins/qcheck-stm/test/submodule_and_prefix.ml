module M = struct
  type 'a t = 'a ref

  let make a = ref a
end
