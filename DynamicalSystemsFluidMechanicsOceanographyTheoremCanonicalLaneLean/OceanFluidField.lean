import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

abbrev Domain3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Domain3 → ℝ
abbrev VectorField := Time → Domain3 → Domain3

structure OceanicOperators where
  gradient : ScalarField → VectorField
  divergence : VectorField → ScalarField
  laplacian : VectorField → VectorField
  coriolis : VectorField → VectorField
  bottomDrag : VectorField → VectorField
  verticalMixing : VectorField → VectorField

def defaultOceanicOperators : OceanicOperators := {
  gradient := fun _ => fun _ _ => (0,0,0)
  divergence := fun _ => fun _ _ => 0
  laplacian := fun u => u
  coriolis := fun u => u
  bottomDrag := fun u => u
  verticalMixing := fun u => u
}

structure OceanFlow where
  velocity : VectorField
  pressure : ScalarField
  density : ScalarField
  temperature : ScalarField
  operators : OceanicOperators
  coriolisParameter : ℝ

end DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse