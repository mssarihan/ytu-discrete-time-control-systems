"""Generate every figure of this homework. Run from this folder: python make_figures.py"""
import pathlib
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

np.random.seed(0)                       # record seeds so results are reproducible
out = pathlib.Path(__file__).parent.parent / "figures" / "generated"
out.mkdir(parents=True, exist_ok=True)

t = np.linspace(0, 5, 200)
plt.figure(figsize=(5, 3))
plt.plot(t, 1 - np.exp(-t))
plt.xlabel("t [s]"); plt.ylabel("y(t)"); plt.grid(True)
plt.tight_layout()
plt.savefig(out / "step-response.pdf")
