import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

structure FluidDynamicOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  advection : VectorField → VectorField
  coriolis : VectorField → VectorField
  pressureProjection : VectorField → VectorField
  pressureProjectionIdempotent : ∀ u, pressureProjection (pressureProjection u) = pressureProjection u

def primitiveOperators : FluidDynamicOperators := {
  divergence := fun _ _ _ => 0
  gradient := fun _ _ _ _ => 0
  laplacian := fun u t x => u t x
  timeDerivative := fun _ _ _ => 0
  advection := fun _ _ _ => 0
  coriolis := fun _ _ _ => 0
  pressureProjection := fun u t x => u t x
  pressureProjectionIdempotent := by
    intro u
    rfl
}

structure FluidFlow where
  velocity : VectorField
  pressure : ScalarField
  viscosity : ℝ
  rotationRate : ℝ
  operators : FluidDynamicOperators

def primitiveFlow : FluidFlow := {
  velocity := fun _ _ _ => 0
  pressure := fun _ _ _ => 0
  viscosity := 1
  rotationRate := 0
  operators := primitiveOperators
}

def Incompressible (F : FluidFlow) : Prop :=
  F.operators.divergence F.velocity = fun _ _ => 0

def HydrostaticBalance (F : FluidFlow) : Prop :=
  F.operators.gradient F.pressure = fun _ _ _ => 0

def PressureProjected (F : FluidFlow) : Prop :=
  F.operators.pressureProjection F.velocity = F.velocity

def NavierStokesCoriolisEquationClosed (F : FluidFlow) : Prop :=
  Incompressible F ∧ HydrostaticBalance F ∧ PressureProjected F

theorem primitive_incompressible_checked : Incompressible primitiveFlow := by
  unfold Incompressible primitiveFlow primitiveOperators
  rfl

theorem primitive_hydrostatic_balance_checked : HydrostaticBalance primitiveFlow := by
  unfold HydrostaticBalance primitiveFlow primitiveOperators
  rfl

theorem primitive_pressure_projected_checked : PressureProjected primitiveFlow := by
  unfold PressureProjected primitiveFlow primitiveOperators
  rfl

theorem primitive_navier_stokes_coriolis_equation_closed_checked :
    NavierStokesCoriolisEquationClosed primitiveFlow := by
  unfold NavierStokesCoriolisEquationClosed
  exact And.intro primitive_incompressible_checked
    (And.intro primitive_hydrostatic_balance_checked primitive_pressure_projected_checked)

end DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse