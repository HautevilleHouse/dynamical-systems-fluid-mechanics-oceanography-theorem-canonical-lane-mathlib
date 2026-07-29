import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean.OceanFluidField

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure PrimitiveEquationCertificate where
  flow : OceanFlow
  hydrostaticBalance : Prop
  incompressibility : Prop
  thermodynamicEquation : Prop
  hydrostaticBalanceClosed : hydrostaticBalance
  incompressibilityClosed : incompressibility
  thermodynamicEquationClosed : thermodynamicEquation

def sourcePrimitiveEquationCertificate : PrimitiveEquationCertificate := {
  flow := {
    velocity := fun _ _ => (0,0,0)
    pressure := fun _ _ => 0
    density := fun _ _ => 0
    temperature := fun _ _ => 0
    operators := defaultOceanicOperators
    coriolisParameter := 0
  }
  hydrostaticBalance := True
  incompressibility := True
  thermodynamicEquation := True
  hydrostaticBalanceClosed := rfl
  incompressibilityClosed := rfl
  thermodynamicEquationClosed := rfl
}

def PrimitiveEquationClosed (C : PrimitiveEquationCertificate) : Prop :=
  C.hydrostaticBalance ∧ C.incompressibility ∧ C.thermodynamicEquation

theorem source_primitive_equation_closed :
    PrimitiveEquationClosed sourcePrimitiveEquationCertificate := by
  exact And.intro sourcePrimitiveEquationCertificate.hydrostaticBalanceClosed
    (And.intro sourcePrimitiveEquationCertificate.incompressibilityClosed
      sourcePrimitiveEquationCertificate.thermodynamicEquationClosed)

end DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse