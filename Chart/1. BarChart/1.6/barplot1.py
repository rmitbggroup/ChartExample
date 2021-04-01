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


def storage_size(data_file = ''):
    labels = ['25', '50', '75', '100']
    seg_data = [490.865, 994.822, 1466, 1940]
    seg_index = [17.005, 33.963, 53.698, 71.878]
    point_data = [1760, 2159, 3302, 4332]
    point_index = [852.798, 1171.943, 1817.317, 2401.379]

    x = np.arange(len(labels))  # the label locations
    width = 0.35  # the width of the bars

    fig, ax = plt.subplots()
    rects1 = ax.bar(x - width/2, seg_data, width, label='GANOS-T Data', alpha=0.8, color="w", edgecolor="k", hatch="xxxxx")
    ax.bar(x - width/2, seg_index, width, label='GANOS-T Index', bottom=seg_data, alpha=0.8, color="w", edgecolor="k")
    rects2 = ax.bar(x + width/2, point_data, width, label='GANOS-P Data', alpha=0.8, color="w", edgecolor="k", hatch="///")
    ax.bar(x + width/2, point_index, width, label='GANOS-P Index', bottom=point_data, alpha=0.8, color="w", edgecolor="k", hatch="...")

    # Add some text for labels, title and custom x-axis tick labels, etc.
    ax.set_ylabel('Storage Size (MB)')
    ax.set_xlabel('Trajectory Data Size (%)')
    # ax.set_title('Trajectory Data Size (%)')
    ax.set_xticks(x)
    ax.set_xticklabels(labels)
    ax.legend(prop={'size': 9}, loc='upper left')

    # autolabel(rects1)
    # autolabel(rects2)

    fig.tight_layout()

    pixel = plt.gcf()
    pixel.savefig('./AIS_exp/storage-size.pdf', format='pdf', dpi=300)


if __name__ == '__main__':
    storage_size()
