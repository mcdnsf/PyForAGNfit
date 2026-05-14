# PyForAGNfit

**A Python GUI for Bayesian spectroscopic fitting of Active Galactic Nuclei (AGN) spectra.**

PyForAGNfit combines a user-friendly PyQt5 interface with a high-performance Fortran backend to run Markov Chain Monte Carlo (MCMC) fitting over AGN spectra — supporting both individual objects and batch processing of large samples.

---

## Features

- **MCMC fitting via Metropolis-Hastings algorithm** — implemented in Fortran for fast numerical performance
- **Two spectral coverage modes:** UV (1700–2200 Å) and UV-Optical (2300–7900 Å)
- **50+ spectral emission lines** supported, including H Balmer series, He, Fe, Mg, O, N, Si, Ar, Ni and more
- **Batch processing** — load a CSV list of AGN spectra and fit them all consecutively
- **Interactive parameter tables** — modify flux, width, shift, and step values directly in the GUI
- **Multi-component continuum modeling** — power law (single and broken), FeII templates, Balmer continuum, stellar continuum, and High-Order Balmer Lines
- **Error visualization** — each output plot includes a residual subplot showing over/underestimated lines
- **CSV output** — fitting results exported automatically for downstream analysis

---

## How It Works

PyForAGNfit implements spectroscopic fitting using the **Metropolis-Hastings MCMC algorithm**. The user provides initial parameter estimates (flux, line width, velocity shift) for each emission line. The algorithm then explores the parameter space over a configurable number of iterations, converging on the best-fit model. The Fortran backend handles the computational load, making it feasible to process large AGN samples.

The GUI has three tabs:
1. **Spectroscopic Fit Parameters** — set emission line parameters, load spectrum files, configure templates and continuum models
2. **Console** — run the fitting pipeline directly from the interface
3. **Plot** — visualize the output fits overlaid on the observed spectrum

---

## Requirements

| Dependency | Version |
|---|---|
| OS | Linux (Ubuntu ≤ 20.04, Linux Mint, or Ubuntu-based distros) |
| Python | ≥ 3.6.9 |
| Fortran (gfortran) | == 7.5 *(other versions may cause errors)* |
| PyQt5 | latest |
| seaborn | latest |
| xfce4-terminal | — |
| xdotool | — |

> **Note:** Windows and macOS support is not yet officially tested. Community feedback on these platforms is welcome.

### Python Standard Library modules used
`os`, `subprocess`, `sys`, `shutil`, `json`, `csv` — all included with Python by default.

---

## Installation

```bash
# Clone the repository
git clone https://github.com/mcdnsf/PyForAGNfit.git
cd PyForAGNfit

# Install Python dependencies
pip install -r requirements.txt

# Install system dependencies (Ubuntu/Debian)
sudo apt install gfortran-7 xfce4-terminal xdotool

# Run the GUI
python3 PyForAGNfitFull.py
```

> Make sure you are using **gfortran 7.5 specifically**. You can check with `gfortran --version`.

### Stellar Templates

Decompress `Stellar Templates.rar` into a folder named `Stellar Templates/` in the root directory before running the program. The folder must be present for the fitting to work correctly.

---

## Usage

### Single object

1. Open the **Spectroscopic Fit Parameters** tab
2. Fill in the emission line parameters (Flux, Step Flux, Width, Step Width, Shift, Step Shift)
3. Load your spectrum file (`.dat` format), FeII templates, Balmer continuum, and stellar continuum files in the **Input Files** table
4. Set MCMC parameters: number of iterations (`Iteration Max MCMC`), accuracy loop, and line profile (`0` = Gaussian, `1` = Lorentzian)
5. Go to the **Console** tab and run:
   ```
   python3 1run.py
   ```
6. View results in the **Plot** tab

### Batch processing (multiple AGN)

1. Prepare a `.csv` file with two columns: spectrum filename and redshift
2. Place all spectrum `.dat` files in the `Objects File/` folder
3. Click **Load CSV** → select your list → click **Create CSV**
4. Run the fitting as usual — PyForAGNfit will process all objects sequentially using your parameter configuration

---

## Output files

| File | Description |
|---|---|
| `fitting_results_*.dat` | Best-fit model parameters |
| `fitting_data_*.dat` | All model outputs |
| `fitting_err_*.dat` | Residuals between fit and observed spectrum |
| `fitting_data_*.csv` | Full results in CSV format |
| `plot_fit_full.png` | Complete spectral fit |
| `plot_fit_full5nocont.png` | Fit without continuum components |
| `plot_fit_fullhb.png` | Zoomed view around Hβ emission line |

---

## Supported Emission Lines

<details>
<summary>UV-Optical range (2300–7900 Å) — click to expand</summary>

CII λ2326, NIV λ2424, OII λ2471, AlIII λ2669, OIII λ2672, MgII λ2798, OIII λ3134, HeI λ3189, NV λ3347, NV λ3427, FeII λ3587, HeI λ3588, OII λ3728, FeVII λ3760, NeIII λ3870, HeI λ3890, H8, NeIII λ3969, Hε, FeV λ4072, SiII λ4074, Hδ, Hγ, OIII NC λ4363, HeI λ4472, HeII λ4685, Hβ, OIII λ4959, OIII λ5007, FeVII λ5160, FeVI λ5177, NI NC λ5200, HeII λ5875, FeVII NC λ6086, OI NC λ6300, OI NC λ6365, NII NC λ6548, NII NC λ6583, Hα, SII λ6717, SII λ6731, HeI λ7067, ArIII λ7138, OII λ7321, NiIII λ7892, FeXI λ7894

</details>

<details>
<summary>UV blend range (1700–2200 Å) — click to expand</summary>

NIII λ1750, AlIII doublet λ1855/1863, SiIII, CIII, FeIII, SiII, FeII λ2080

</details>

---

## Repository Structure

```
PyForAGNfit/
│
├── PyForAGNfitFull.py       ← Main GUI application
├── 1run.py                  ← Fitting pipeline runner
├── convertion.py            ← Spectrum format conversion (single object)
├── convbigindividual.py     ← Spectrum format conversion (batch mode)
├── input2.dat               ← MCMC parameter input file (~300 parameters)
├── data.json                ← GUI state and parameter storage
├── datacsv.json             ← Batch mode parameter storage
├── Spectra data.csv         ← Example batch input file
├── Stellar Templates.rar    ← Stellar continuum templates (decompress before use)
├── requirements.txt
├── README.md
│
├── Objects File/            ← Place AGN spectrum .dat files here
└── Run/                     ← Fortran fitting code
```

---

## Background

This tool was developed as part of research at the **Millennium Nucleus TITANS** (Universidad de Concepción, Chile), focused on spectral analysis of AGN populations. The MCMC fitting routine is based on an existing Fortran implementation, adapted and wrapped into a Python GUI to make it accessible for day-to-day spectroscopic analysis.

---

## Contact

Questions, bugs, or ideas for improvement? Feel free to reach out:

📧 mcarantfer@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/marco-c-54074a137/)

> Custom FeII/FeIII templates can be integrated — contact me directly if you'd like to use your own.

---

## License

This project is open for academic and research use. Please cite appropriately if used in published work.
