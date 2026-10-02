/-!
Compatibility shim added when building with Lean 4.33.1 (not part of the original project):
the sources use `ite_eq_left` / `ite_eq_right`, which this toolchain does not provide.
-/

theorem ite_eq_left {α : Sort u} {c : Prop} [Decidable c] {a b : α} (h : c) :
    (if c then a else b) = a := if_pos h

theorem ite_eq_right {α : Sort u} {c : Prop} [Decidable c] {a b : α} (h : ¬ c) :
    (if c then a else b) = b := if_neg h
