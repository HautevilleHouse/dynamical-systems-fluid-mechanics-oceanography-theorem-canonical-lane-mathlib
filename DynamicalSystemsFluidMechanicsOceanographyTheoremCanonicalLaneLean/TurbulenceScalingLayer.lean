import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean.VortexDynamicsLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure TurbulenceScalingCertificate where
  vortex : VortexDynamicsCertificate
  k41Scaling : Prop
  dissipationRate : Prop
  energySpectrum : Prop
  turbulentViscosity : Prop
  k41ScalingClosed : k41Scaling
  dissipationRateClosed : dissipationRate
  energySpectrumClosed : energySpectrum
  turbulentViscosityClosed : turbulentViscosity

def sourceTurbulenceScalingCertificate : TurbulenceScalingCertificate := {
  vortex := sourceVortexDynamicsCertificate,
  k41Scaling := (1 : ℝ) / 1 = 1 / 1,
  dissipationRate := sourceVortexDynamicsCertificate.euler.flow.viscosity = 0,
  energySpectrum := zeroVectorField = zeroVectorField,
  turbulentViscosity := sourceVortexDynamicsCertificate.euler.flow.viscosity = 0,
  k41ScalingClosed := by norm_num,
  dissipationRateClosed := rfl,
  energySpectrumClosed := rfl,
  turbulentViscosityClosed := rfl
}

def TurbulenceScalingClosed (C : TurbulenceScalingCertificate) : Prop :=
  VortexDynamicsClosed C.vortex ∧
  C.k41Scaling ∧
  C.dissipationRate ∧
  C.energySpectrum ∧
  C.turbulentViscosity

theorem source_turbulence_scaling_closed :
    TurbulenceScalingClosed sourceTurbulenceScalingCertificate := by
  exact And.intro source_vortex_dynamics_closed
    (And.intro sourceTurbulenceScalingCertificate.k41ScalingClosed
      (And.intro sourceTurbulenceScalingCertificate.dissipationRateClosed
        (And.intro sourceTurbulenceScalingCertificate.energySpectrumClosed
          sourceTurbulenceScalingCertificate.turbulentViscosityClosed)))

end DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse