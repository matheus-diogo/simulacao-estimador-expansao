# Simulação de Monte Carlo para Comparação do Estimador Expansão
Trabalho acadêmico para avaliar os planos amostrais de amostragem aleatória simples com reposição (AASCR) e sem reposição (AASSR), buscando encontrar o melhor plano a partir de uma comparação do estimador expansão sob AASCR e AASSR, que será avaliado a sua distribuição e suas medidas de desempenho.

## Objetivos
- Criar uma população-alvo que possui tamanho populacional N = 5000 e variável de interesse dada por uma distribuição Gama.
- Gerar amostras sob AASCR e AASSR, com tamanhos amostrais n = 250, 500, 750, 1000 e 1250.
- Repetir 5000 amostras para cada combinação de plano e tamanho amostral.
- Calcular as estimativas das respectivas amostras geradas pelo estimador expansão.
- Obter histogramas e medidas de desempenho pelas estimativas calculadas dado plano e tamanho amostral.

## Tecnologias
| Linguagem |      Pacote      |    Versão |
|:---------:|:----------------:|:---------:|
|     R     |       base       |   4.5.0   |
|     R     |     datasets     |   4.5.0   |
|     R     |       dplyr      |   1.2.1   |
|     R     |     graphics     |   4.5.0   |
|     R     |     grDevices    |   4.5.0   |
|     R     |     magrittr     |   2.0.5   |
|     R     |      methods     |   4.5.0   |
|     R     |       stats      |   4.5.0   |
|     R     | TeachingSampling |   4.1.1   |
|     R     |      tibble      |   3.3.1   |
|     R     |       utils      |   4.5.0   |
|   Python  |    matplotlib    |   3.10.1  |
|   Python  |      pandas      |   2.2.3   |
|   Python  |      seaborn     |   0.13.2  |

Ademais, a apresentação foi estruturada pelo LaTeX.

## Resultados
Em ambos os planos amostrais, tem-se que o estimador expansão é centrado no total populacional, conforme o viés, mas ocorre uma distinção quando observado o erro quadrático médio e a variância de Monte Carlo, havendo valores menores dessas medidas na AASSR, o que remete esse plano amostral forcener um estimador mais exato e preciso do que na AASCR. Então a AASSR demonstrou ser, de fato, um melhor plano amostral do que a AASCR.

Além disso, o script R teve tempo de execução de aproximadamente 15 minutos.

## Licença
Este projeto está sob a licença MIT.
