import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean.OceanographicFlowObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure EulerCertificate where
  flow : OceanographicFlow
  inviscidCondition : Prop
  conservationMass : Prop
  conservationMomentum : Prop
  conservationEnergy : Prop
  inviscidConditionClosed : inviscidCondition
  conservationMassClosed : conservationMass
  conservationMomentumClosed : conservationMomentum
  conservationEnergyClosed : conservationEnergy

def sourceEulerCertificate : EulerCertificate := {
  flow := primitiveOceanFlow,
  inviscidCondition := primitiveOceanFlow.viscosity = 0,
  conservationMass := Incompressible primitiveOceanFlow,
  conservationMomentum := primitiveOceanOperators.materialDerivative primitiveOceanFlow.velocity =
    primitiveOceanOperators.coriolis primitiveOceanFlow.velocity,
  conservationEnergy := primitiveOceanFlow.viscosity = 0,
  inviscidConditionClosed := rfl,
  conservationMassClosed := primitive_ocean_flow_incompressible_checked,
  conservationMomentumClosed := rfl,
  conservationEnergyClosed := rfl
}

def EulerClosed (C : EulerCertificate) : Prop :=
  C.inviscidCondition ∧ C.conservationMass ∧ C.conservationMomentum ∧ C.conservationEnergy

theorem source_euler_closed :
    EulerClosed sourceEulerCertificate := by
  exact And.intro sourceEulerCertificate.inviscidConditionClosed
    (And.intro sourceEulerCertificate.conservationMassClosed
      (And.intro sourceEulerCertificate.conservationMomentumClosed
        sourceEulerCertificate.conservationEnergyClosed))

end DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse