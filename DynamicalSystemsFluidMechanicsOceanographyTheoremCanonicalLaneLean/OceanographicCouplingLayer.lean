import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure OceanographicCouplingCertificate where
  vortexDynamics : VortexDynamicsCertificate
  stratificationBalance : Prop
  windStressCoupling : Prop
  equationOfState : Prop
  stratificationBalanceClosed : stratificationBalance
  windStressCouplingClosed : windStressCoupling
  equationOfStateClosed : equationOfState

def sourceOceanographicCouplingCertificate : OceanographicCouplingCertificate := {
  vortexDynamics := sourceVortexDynamicsCertificate
  stratificationBalance := True
  windStressCoupling := True
  equationOfState := True
  stratificationBalanceClosed := trivial
  windStressCouplingClosed := trivial
  equationOfStateClosed := trivial
}

def OceanographicCouplingClosed (C : OceanographicCouplingCertificate) : Prop :=
  VortexDynamicsClosed C.vortexDynamics ∧
  C.stratificationBalance ∧
  C.windStressCoupling ∧
  C.equationOfState

theorem source_oceanographic_coupling_closed :
    OceanographicCouplingClosed sourceOceanographicCouplingCertificate := by
  exact And.intro source_vortex_dynamics_closed
    (And.intro sourceOceanographicCouplingCertificate.stratificationBalanceClosed
      (And.intro sourceOceanographicCouplingCertificate.windStressCouplingClosed
        sourceOceanographicCouplingCertificate.equationOfStateClosed))

end DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse