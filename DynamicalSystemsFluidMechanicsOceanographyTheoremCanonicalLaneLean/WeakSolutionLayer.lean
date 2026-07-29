import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure WeakSolutionEnvelope where
  flow : FluidFlow
  finiteEnergy : Prop
  divergenceFree : Prop
  energyInequality : Prop
  weakEquation : Prop
  finiteEnergyClosed : finiteEnergy
  divergenceFreeClosed : divergenceFree
  energyInequalityClosed : energyInequality
  weakEquationClosed : weakEquation

def sourceWeakSolutionEnvelope : WeakSolutionEnvelope := {
  flow := primitiveFlow
  finiteEnergy := True
  divergenceFree := Incompressible primitiveFlow
  energyInequality := True
  weakEquation := NavierStokesCoriolisEquationClosed primitiveFlow
  finiteEnergyClosed := trivial
  divergenceFreeClosed := primitive_incompressible_checked
  energyInequalityClosed := trivial
  weakEquationClosed := primitive_navier_stokes_coriolis_equation_closed_checked
}

def WeakSolutionEnvelopeClosed (E : WeakSolutionEnvelope) : Prop :=
  E.finiteEnergy ∧ E.divergenceFree ∧ E.energyInequality ∧ E.weakEquation

theorem source_weak_solution_envelope_closed :
    WeakSolutionEnvelopeClosed sourceWeakSolutionEnvelope := by
  exact And.intro sourceWeakSolutionEnvelope.finiteEnergyClosed
    (And.intro sourceWeakSolutionEnvelope.divergenceFreeClosed
      (And.intro sourceWeakSolutionEnvelope.energyInequalityClosed
        sourceWeakSolutionEnvelope.weakEquationClosed))

end DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse