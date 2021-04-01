import pandas as pd
from matplotlib import pyplot as plt

# 利用pandas库高效率读取csv格式的数据, 返回的data是一个类似于python字典的对象
data = pd.read_csv('data.csv')
# 取出data里面各个键下的所有值, 返回值是pandas.core.series.Series: 可迭代对象
ages = data['Age']
dev_salaries = data['All_Devs']/10000
py_salaries = data['Python']/10000
js_salaries = data['JavaScript']/10000

#assume that each attribute has the upperbound and lowerbound
devup = dev_salaries + 1
devlow = dev_salaries - 1

pyup = py_salaries + 1
pylow = py_salaries - 1

jsup = js_salaries + 1
jslow = js_salaries - 1

#draw line
plt.plot(ages, dev_salaries, color = 'red', label='All Devs')
plt.plot(ages, py_salaries, color = 'green', label='Python')
plt.plot(ages, js_salaries, color = 'blue', label='JavaScript')



# fill_between: fill_between(x, y1, y2=0, where=None, interpolate=False, step=None, *, data=None, **kwargs)
# alpha is transparency
plt.fill_between(ages, dev_salaries, devlow,
                 where=(dev_salaries > devlow),
                 interpolate=True, color = 'red', alpha=0.2)
plt.fill_between(ages, dev_salaries, devup,
                 where=(dev_salaries < devup),
                 interpolate=True, color = 'red', alpha=0.2)
plt.fill_between(ages, py_salaries, pylow,
                 where=(py_salaries > pylow),
                 interpolate=True, color = 'green', alpha=0.2)
plt.fill_between(ages, py_salaries, pyup,
                 where=(py_salaries < pyup),
                 interpolate=True, color = 'green', alpha=0.2)
plt.fill_between(ages, js_salaries, jslow,
                 where=(js_salaries > jslow),
                 interpolate=True, color='blue', alpha=0.2)
plt.fill_between(ages, js_salaries, jsup,
                 where=(js_salaries < jsup),
                 interpolate=True, color='blue', alpha=0.2)

plt.legend()

plt.xlim((18, 55))
plt.xticks([20, 30, 40, 50], fontsize=20)
plt.yticks(fontsize=20)
plt.xlabel('Ages',fontsize=20)
plt.ylabel('Median Salary (USD) $\\times 10^4$',fontsize=20)

plt.tight_layout()
cfig = plt.gcf() # 'get current figure'
cfig.savefig('curve.pdf', format='pdf', dpi=1000)

plt.show()