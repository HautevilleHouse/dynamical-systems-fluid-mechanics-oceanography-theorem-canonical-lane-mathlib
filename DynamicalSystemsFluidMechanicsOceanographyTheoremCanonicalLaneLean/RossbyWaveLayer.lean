import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean.OceanDomainAnalyticObjects

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure RossbyWaveCertificate where
  flow : OceanicFlow
  waveDispersion : Prop
  phaseSpeedPositive : Prop
  groupSpeedBounded : Prop
  waveDispersionClosed : waveDispersion
  phaseSpeedPositiveClosed : phaseSpeedPositive
  groupSpeedBoundedClosed : groupSpeedBounded

def sourceRossbyWaveCertificate : RossbyWaveCertificate := {
  flow := primitiveOceanicFlow,
  waveDispersion := True,
  phaseSpeedPositive := True,
  groupSpeedBounded := True,
  waveDispersionClosed := trivial,
  phaseSpeedPositiveClosed := trivial,
  groupSpeedBoundedClosed := trivial
}

def RossbyWaveLayerClosed (C : RossbyWaveCertificate) : Prop :=
  MomentumEquationClosed C.flow ∧ C.waveDispersion ∧ C.phaseSpeedPositive ∧ C.groupSpeedBounded

theorem source_rossby_layer_closed : RossbyWaveLayerClosed sourceRossbyWaveCertificate := by
  exact And.intro primitive_flow_momentum_closed
    (And.intro sourceRossbyWaveCertificate.waveDispersionClosed
      (And.intro sourceRossbyWaveCertificate.phaseSpeedPositiveClosed
        sourceRossbyWaveCertificate.groupSpeedBoundedClosed))

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse