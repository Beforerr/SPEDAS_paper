#| label: fig-tplot
#| fig-cap: "Time series plots from different data sources"
import HAPIClient
import CDAWeb
using SpacePhysicsMakie, CairoMakie
using MinimumVarianceAnalysis
using DimensionalData

t0 = "2024-01-02"
t1 = "2024-01-03"
# Fetch ACE magnetic field data
dataset = CDAWeb.get_data("AC_H0_MFI", t0, t1)
Magnitude = DimArray(dataset["Magnitude"])
BGSEc = DimArray(dataset["BGSEc"])
V_GSE = DimArray(CDAWeb.get_data("AC_H0_SWE", t0, t1)["V_GSE"])
B_LMN = mva(BGSEc)
# V_LMN = mva(V_GSE, BGSEc)

f = Figure()
tplot(f[1, 1], [Magnitude, V_GSE, BGSEc, B_LMN])
f

using Beforerr

easy_save("fig1_tplot")
