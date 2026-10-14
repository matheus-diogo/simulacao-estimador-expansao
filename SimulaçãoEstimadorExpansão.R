# Simulação de Monte Carlo para Comparação de Estimadores Expansão com AASCR e com AASSR

## Medir o tempo inicial da execução do script
tempo_inicial <- Sys.time()

## Importar bibliotecas necessárias
library(tibble)
library(dplyr)
library(magrittr)
library(TeachingSampling)

## Garantir reprodutibilidade da simulação
set.seed(2026)

## Simulação ########################################################################################################

### Definir o tamanho da população
N <- 5000

### Gerar população finita com determinada variável de interesse
populacao <- tibble(
  i = 1:N,
  y_i = rgamma(n = N, shape = 5, scale = 4)
)

### Calcular o total populacional da variável de interesse definida
total_populacional <- sum(populacao$y_i)

### Definir os tamanhos amostrais
tamanhos_amostrais <- c(250, 500, 750, 1000, 1250)

### Definir os planos amostrais de AASCR e AASSR
planos_amostrais <- c('AASCR', 'AASSR')

### Definir a quantidade de amostras, com AASCR e AASSR, para cada tamanho amostral
R <- 5000

### Criar a tabela das amostras com a sua estimativa do estimador expansão
amostras_estimativas <- tibble(
  plano_amostral = character(),
  tamanho_amostral = integer(),
  estimativa = numeric()
)

### Gerar as amostras da população definida
for (plano in planos_amostrais) {
  for (tamanho in tamanhos_amostrais) {
    for (r in 1:R) {
      #### Selecionar amostra com determinado plano amostral
      if (plano == 'AASCR') {
        amostra <- populacao[S.WR(N, tamanho), ]
      } else {
        amostra <- populacao[S.SI(N, tamanho), ]
      }

      #### Calcular a estimativa na amostra pelo estimador expansão
      estimativa_expansao <- N * mean(amostra$y_i)

      #### Adicionar a amostra na tabela definida
      amostras_estimativas <- add_row(
        amostras_estimativas,
        plano_amostral = plano,
        tamanho_amostral = tamanho,
        estimativa = estimativa_expansao
      )
    }
  }
}

## Avaliação ########################################################################################################

### Gerar histogramas das estimativas por tamanho amostral, em AASCR

#### Organizar os histogramas em 2 por 3
layout(matrix(c(
  1, 1, 2, 2, 3, 3,
  0, 4, 4, 5, 5, 0
), 2, 6, byrow = TRUE))

for (tamanho in tamanhos_amostrais) {
  #### Filtrar as estimativas obtidas por tamanho amostral e pela AASCR
  amostras_estimativas_filtradas <- amostras_estimativas %>% 
    filter(tamanho_amostral == tamanho ,plano_amostral == 'AASCR')

  #### Criar o histograma das estimativas filtradas
  hist(
        x = amostras_estimativas_filtradas$estimativa,
        main = paste0('De amostras com ', as.character(tamanho), ' observações'),
        col = '#2c82d3',
        xlab = 'Estimativas',
        ylab = 'Frequência',
    )
  
  abline(v = total_populacional, lty = 2)
}

### Gerar histogramas das estimativas por tamanho amostral, em AASSR

#### Organizar os histogramas em 2 por 3
layout(matrix(c(
  1, 1, 2, 2, 3, 3,
  0, 4, 4, 5, 5, 0
), 2, 6, byrow = TRUE))

for (tamanho in tamanhos_amostrais) {
  #### Filtrar as estimativas obtidas por tamanho amostral e pela AASCR
  amostras_estimativas_filtradas <- amostras_estimativas %>% 
    filter(tamanho_amostral == tamanho ,plano_amostral == 'AASSR')

  #### Criar o histograma das estimativas filtradas
  hist(
        x = amostras_estimativas_filtradas$estimativa,
        main = paste0('De amostras com ', as.character(tamanho), ' observações'),
        col = '#2c82d3',
        xlab = 'Estimativas',
        ylab = 'Frequência',
    )
}

### Criar uma tabela com viés RP, EQM e variância de MC das Estimativas para cada plano amostral e tamanho amostral
medidas_desempenho <- amostras_estimativas %>%
  group_by(plano_amostral, tamanho_amostral) %>%
  summarise(
    vies_rp = 100 * (mean(estimativa) - total_populacional) / total_populacional,
    eqm = sum((estimativa - total_populacional) ** 2) / R,
    var_mc = var(estimativa),
    .groups = "drop_last"
  )

### Exportar a tabela de medidas de desempenho para usar no script Python
write.csv(medidas_desempenho, 'medidas-desempenho.csv')

## Calcular o tempo total da execução do script
tempo_total <- Sys.time() - tempo_inicial
