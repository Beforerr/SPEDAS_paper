using SunPy, PythonCall
using SunPy: Map
@py import sunpy.data.sample: AIA_193_IMAGE
@py import astropy.units as u

aiamap = Map(AIA_193_IMAGE)

contours = SunPy.find_contours_py(aiamap, 50000.0)
contours_py = aiamap.find_contours(50000 * u.DN)

@py import matplotlib.pyplot as plt

let fig = plt.figure(figsize = (12, 5))
    ax = fig.add_subplot(1, 2, 1, projection = aiamap)
    ax.set_title("Julia find_contours")
    ax.plot_coord.(contours)

    ax2 = fig.add_subplot(1, 2, 2, projection = aiamap)
    ax2.set_title("Python find_contours")
    ax2.plot_coord.(PyList(contours_py))

    fig.savefig("fig2_sunpy_contours.png")
    fig
end
