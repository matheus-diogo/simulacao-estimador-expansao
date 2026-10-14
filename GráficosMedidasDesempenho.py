# Gráficos a partir das Medidas de Desempenho

## Importar os módulos necessários
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

## Importar a tabela de medidas de desempenho
medidas_desempenho = pd.read_csv("medidas-desempenho.csv")

### Criar o gráfico do viés relativo percentual das estimativas por plano e tamanho amostral
sns.lineplot(
    data=medidas_desempenho,
    x="tamanho_amostral",
    y="vies_rp",
    hue="plano_amostral",
    palette="Blues",
    marker="o",
    zorder=2,
)
plt.title("Viés RP das Estimativas por Plano e Tamanho Amostral")
plt.xlabel("Tamanho Amostral")
plt.ylabel("Viés Relativo Percentual")
plt.grid(True, alpha=0.4)
plt.legend(title="Plano Amostral", loc="best")
plt.xticks(ticks=[250, 500, 750, 1000, 1250])
plt.show()

### Criar o gráfico do EQM das estimativas por plano e tamanho amostral
sns.lineplot(
    data=medidas_desempenho,
    x="tamanho_amostral",
    y="eqm",
    hue="plano_amostral",
    palette="Blues",
    marker="o",
    zorder=2,
)
plt.title("EQM das Estimativas por Plano e Tamanho Amostral")
plt.xlabel("Tamanho Amostral")
plt.ylabel("EQM")
plt.grid(True, alpha=0.4)
plt.legend(title="Plano Amostral", loc="best")
plt.xticks(ticks=[250, 500, 750, 1000, 1250])
plt.show()

### Criar o gráfico da Variância de MC das estimativas por plano e tamanho amostral
sns.lineplot(
    data=medidas_desempenho,
    x="tamanho_amostral",
    y="var_mc",
    hue="plano_amostral",
    palette="Blues",
    marker="o",
    zorder=2,
)
plt.title("Variância de MC das Estimativas por Plano e Tamanho Amostral")
plt.xlabel("Tamanho Amostral")
plt.ylabel("Variância de MC")
plt.grid(True, alpha=0.4)
plt.legend(title="Plano Amostral", loc="best")
plt.xticks(ticks=[250, 500, 750, 1000, 1250])
plt.show()
