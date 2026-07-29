import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Calculus.Deriv

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

abbrev SpatialCoord := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → SpatialCoord → ℝ
abbrev VectorField := Time → SpatialCoord → SpatialCoord

structure OceanicOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  coriolis : VectorField → VectorField
  stratification : ScalarField → ScalarField
  dissipation : VectorField → VectorField

structure OceanicFlow where
  velocity : VectorField
  buoyancy : ScalarField
  pressure : ScalarField
  viscosity : ℝ
  operators : OceanicOperators

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

def primitiveOceanicOperators : OceanicOperators := {
  divergence := fun _ => zeroScalarField,
  gradient := fun _ => zeroVectorField,
  laplacian := fun u => u,
  coriolis := fun u => u,
  stratification := fun b => b,
  dissipation := fun u => u
}

def primitiveOceanicFlow : OceanicFlow := {
  velocity := zeroVectorField,
  buoyancy := zeroScalarField,
  pressure := zeroScalarField,
  viscosity := 1.0,
  operators := primitiveOceanicOperators
}

def Incompressible (F : OceanicFlow) : Prop :=
  F.operators.divergence F.velocity = zeroScalarField

def CoriolisBalanced (F : OceanicFlow) : Prop :=
  F.operators.coriolis F.velocity = F.operators.dissipation F.velocity

def MomentumEquationClosed (F : OceanicFlow) : Prop :=
  Incompressible F ∧ CoriolisBalanced F

theorem primitive_flow_incompressible : Incompressible primitiveOceanicFlow := by
  unfold Incompressible
  simp [primitiveOceanicFlow, primitiveOceanicOperators, zeroScalarField]

theorem primitive_flow_coriolis_balanced : CoriolisBalanced primitiveOceanicFlow := by
  unfold CoriolisBalanced
  simp [primitiveOceanicFlow, primitiveOceanicOperators]

theorem primitive_flow_momentum_closed : MomentumEquationClosed primitiveOceanicFlow := by
  unfold MomentumEquationClosed
  exact And.intro primitive_flow_incompressible primitive_flow_coriolis_balanced

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse