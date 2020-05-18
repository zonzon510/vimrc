#!/usr/bin/python3
import numpy as np
import sys
import matplotlib.pyplot as plt
import matplotlib.animation as animation



class PlotMat():
    def __init__(self, file):
        self.fig, self.ax = plt.subplots()
        self.file=file
        self.mat=np.loadtxt(self.file)

        if np.shape(self.mat)[0] == np.shape(self.mat)[1]:
            self.plot2d()
        else:
            self.plot1d()

    def plot2d(self):
        imdata = self.ax.imshow(self.mat)
        colorbar = self.fig.colorbar(imdata, ax=self.ax)
        self.ax.set_title(self.file)
        def animate(i):
            self.mat=np.loadtxt(self.file)
            # print("setting data")
            imdata.set_data(self.mat)  # update the data
            imdata.set_clim(vmin=np.min(self.mat), vmax=np.max(self.mat))
            return imdata,

        # Init only required for blitting to give a clean slate.
        def init():
            imdata.set_data(self.mat)
            return imdata,

        ani = animation.FuncAnimation(self.fig, animate, np.arange(1, 200), init_func=init,
                                      interval=25, blit=True)
        plt.show()

    def plot1d(self):
        imdata, = self.ax.plot(self.mat[:,0], self.mat[:,1])
        self.ax.set_title(self.file)
        def animate(i):
            self.mat=np.loadtxt(self.file)
            # print("setting data")
            imdata.set_ydata(self.mat[:,1])  # update the data
            imdata.set_xdata(self.mat[:,0])  # update the data
            return imdata,

        # Init only required for blitting to give a clean slate.
        def init():
            imdata.set_ydata(self.mat[:,1])  # update the data
            imdata.set_xdata(self.mat[:,0])  # update the data
            return imdata,

        ani = animation.FuncAnimation(self.fig, animate, np.arange(1, 200), init_func=init,
                                      interval=25, blit=True)
        plt.show()



if __name__ == "__main__":
    plotdata=PlotMat(sys.argv[1])


