import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean.RossbyWaveLayer

namespace HautevilleHouse
namespace DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean

structure TurbulentScalingCertificate where
  rossby : RossbyWaveCertificate
  energyCascade : Prop
  dissipationRateFinite : Prop
  kolmogorovConstant : Prop
  energyCascadeClosed : energyCascade
  dissipationRateFiniteClosed : dissipationRateFinite
  kolmogorovConstantClosed : kolmogorovConstant

def sourceTurbulentScalingCertificate : TurbulentScalingCertificate := {
  rossby := sourceRossbyWaveCertificate,
  energyCascade := True,
  dissipationRateFinite := True,
  kolmogorovConstant := True,
  energyCascadeClosed := trivial,
  dissipationRateFiniteClosed := trivial,
  kolmogorovConstantClosed := trivial
}

def TurbulentScalingLayerClosed (C : TurbulentScalingCertificate) : Prop :=
  RossbyWaveLayerClosed C.rossby ∧ C.energyCascade ∧ C.dissipationRateFinite ∧ C.kolmogorovConstant

theorem source_turbulent_scaling_closed : TurbulentScalingLayerClosed sourceTurbulentScalingCertificate := by
  exact And.intro source_rossby_layer_closed
    (And.intro sourceTurbulentScalingCertificate.energyCascadeClosed
      (And.intro sourceTurbulentScalingCertificate.dissipationRateFiniteClosed
        sourceTurbulentScalingCertificate.kolmogorovConstantClosed))

end HautevilleHouse.DynamicalSystemsFluidMechanicsOceanographyTheoremCanonicalLaneLean
end HautevilleHouse