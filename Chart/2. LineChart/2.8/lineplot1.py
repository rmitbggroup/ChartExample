import matplotlib
import matplotlib.pyplot as plt
import numpy as np


matplotlib.rcParams['xtick.direction'] = 'in'
matplotlib.rcParams['ytick.direction'] = 'in'


def autolabel(rects, ax):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')


def sim_threshold_porto_dtw(data_file = ''):
    labels = [0.001, 0.002, 0.005, 0.01, 0.02, 0.04, 0.05]
    labels2 = [0.001, 0.002, 0.005, 0.01, 0.02]
    seg = [1750.6, 1822.8, 2052.4, 3222.2, 6215.2, 28887.6, 33543.6]
    dft = [6099.56, 5949.64, 7303.88, 10229.96, 18857.4]
    dita = [535.8, 537, 598.4, 699.2, 970, 2062.6, 2101.8]

    fig, ax = plt.subplots()

    ax.plot(labels, seg, 'ko-', label="Ganos")
    ax.plot(labels2, dft, 'k^-', label="DFT")
    ax.plot(labels, dita, 'ks-', label="DITA")
    ax.set_ylim(0,35000)
    # ax.set_xticks(labels)

    ax.set_xlabel('Threshold (degree)')
    ax.set_ylabel('Querying Time (ms)')
    ax.legend(prop={'size': 9}, loc='upper left')

    pixel = plt.gcf()
    plt.xticks(labels, fontsize=7, rotation=60)
    pixel.savefig('./AIS_exp/sim_threshold_porto_dtw.jpg', format='jpg', dpi=600)


if __name__ == '__main__':
    sim_threshold_porto_dtw()
