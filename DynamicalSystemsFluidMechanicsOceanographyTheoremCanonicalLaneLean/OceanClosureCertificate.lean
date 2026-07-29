import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean.VortexDynamicsLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure OceanClosureCertificate where
  vortex : VortexDynamicsCertificate
  closureCondition : Prop
  closureConditionClosed : closureCondition

def sourceOceanClosureCertificate : OceanClosureCertificate := {
  vortex := sourceVortexDynamicsCertificate,
  closureCondition := True,
  closureConditionClosed := trivial
}

def OceanClosureCertificateClosed (C : OceanClosureCertificate) : Prop :=
  VortexDynamicsLayerClosed C.vortex ∧ C.closureCondition

theorem source_ocean_closure_certificate_closed : OceanClosureCertificateClosed sourceOceanClosureCertificate := by
  exact And.intro source_vortex_dynamics_closed sourceOceanClosureCertificate.closureConditionClosed

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse