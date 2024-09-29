# Practica 3 / Ejercicio 2
Mostrar que cualquier fórmula de la lógica proposicional que utilice los conectivos ¬ (negación), ∧ (conjunción), ∨ (disyunción), ⇒ (implicación) puede reescribirse a otra fórmula equivalente que usa sólo los conectivos ¬ y ∨. Sugerencia: hacer inducción en la estructura de la fórmula.
```
Demostración mediante inducción estructural sobre una fórmula cualquiera.
Sea P(φ) := Existe φ' ∈ FORM tal que φ' ≡ φ, donde φ' usa sólo los conectivos ¬ y ∨.
```
**Caso base:** P(PROP)
```
Sea φ una fórmula tal que φ ∈ PROP, entonces φ no contiene conectivos y por lo tanto trivialmente P(φ)
```
**Caso Inductivo:** P(¬ψ) tal que por H.I. sabemos que P(ψ)  
Sea φ = ¬ψ, como P(ψ) existe ψ' ≡ ψ tal que ψ' usa sólo los conectivos ¬ y ∨.
```
Sea τ una valuación
τ ⊨ φ         ("La interpretacion τ satisface la formula φ")
⇐⇒ τ ⊨ ¬ψ    Ya que φ = ¬ψ.
⇐⇒ τ ⊭ ψ     Por definición de consecuencia semántica (¬).
⇐⇒ τ ⊭ ψ'    Ya que ψ ≡ ψ'
⇐⇒ τ ⊨ ¬ψ'   Por definición de consecuencia semántica (¬).
```
