

# Cálculo del Desplazamiento Gravitacional (Gravitational Redshift)

Este archivo Jupyter Notebook contiene el código necesario para calcular el desplazamiento gravitacional (gravitational redshift) en el contexto de una tesis. El desplazamiento gravitacional es un fenómeno predicho por la teoría de la relatividad general de Einstein, que describe cómo la luz se desplaza hacia longitudes de onda más largas cuando se aleja de una fuente gravitacionalmente intensa.

## Preparación de los datos

```python
import pandas as pd
import numpy as np

# Importar los datos desde el archivo CSV
df4 = pd.read_csv("./AnalisisDR3.csv")
pd.set_option('display.max_columns', None)

# Transformaciones y cálculos de los datos
pmRA = df4['pmRA'] / 1000
pmDEC = df4['pmDE'] / 1000
pmRA = pmRA * np.pi / 180
pmDEC = pmDEC * np.pi / 180
pmRA = pmRA * 1 / 31540000.001011200249
pmDEC = pmDEC * 1 / 31540000.001011200249
df4['pmRARadSec'] = pmRA
df4['pmDECRadSec'] = pmDEC

VtaRA = df4['dist50'] * df4['pmRARadSec']
VtaDEC = df4['dist50'] * df4['pmDECRadSec']

Vmag = np.sqrt(np.power(VtaRA, 2) + np.power(VtaDEC, 2))
VmagR2 = Vmag / np.square(2)

pmRArs = df4['pmRA'] * (4.8481368E-9) / (3.154e+7)
distPC = df4['dist50'] * 30856778200000
VtanRA = pmRArs * distPC
pmDECrs = df4['pmDE'] * (4.8481368E-9) / (3.154e+7)
VtanDEC = pmDECrs * distPC

VmagRADEC = np.sqrt(np.power(VtanRA, 2) + np.power(VtanDEC, 2))

df4['VtanMag'] = VmagRADEC / np.sqrt(2)
df4['Dist50PC'] = distPC
df4PorPartes = df4

df4['gravedadMs2'] = np.power(10, df4['logg50']) / 100
df4['mass50enKg'] = df4['mass50'] * 1.989e30
df4['MPartidoR'] = np.sqrt((df4['gravedadMs2'] * df4['mass50enKg']) / 6.674e-11)

```

## Cálculo del Desplazamiento Gravitacional

```python
grsolMr = np.sqrt((274.027 * 1.989e30) / 6.674e-11)
df4['GravitationalRedshift'] = ((df4['MPartidoR']) / grsolMr) * 627
```

Con estos cálculos, se obtiene el desplazamiento gravitacional para cada registro en el conjunto de datos.

Este archivo Jupyter Notebook proporciona una forma eficiente de calcular el desplazamiento gravitacional en el contexto de tu tesis. Puedes ejecutar el código y adaptarlo según sea necesario para analizar y visualizar los resultados.

## ¡Explora y disfruta el fascinante mundo del desplazamiento gravitacional!
```

Simplemente copia y pega este texto sin ningún formato adicional en tu archivo README.