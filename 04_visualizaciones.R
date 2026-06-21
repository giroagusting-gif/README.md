library(tidyverse)
library(readr)
library(scales)

datos <- read_csv("datos/datos_limpios.csv")

top_productos <- datos |>
  group_by(product) |>
  summarise(
    ingresos = sum(ingresos)
  ) |>
  arrange(desc(ingresos))


ventas_ciudad <- datos |>
  group_by(ciudad) |>
  summarise(
    ingresos = sum(ingresos)
  ) |>
  arrange(desc(ingresos))


ventas_mes <- datos |>
  group_by(mes) |>
  summarise(
    ingresos = sum(ingresos)
  ) |>
  arrange(mes)

grafico_mes <- ggplot(ventas_mes, aes(x = mes, y = ingresos)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  scale_y_continuous(labels = dollar_format()) +
  labs(
    title = "Ingresos mensuales",
    x = "Mes",
    y = "Ingresos"
  ) +
  theme_minimal()

ggsave(
  "graficos/ingresos_por_mes.png",
  grafico_mes,
  width = 8,
  height = 5
)


grafico_productos <- top_productos |>
  slice_max(ingresos, n = 10) |>
  ggplot(aes(x = reorder(product, ingresos), y = ingresos)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = dollar_format()) +
  labs(
    title = "Top 10 productos por ingresos",
    x = "Producto",
    y = "Ingresos"
  ) +
  theme_minimal()

ggsave(
  "graficos/top_10_productos.png",
  grafico_productos,
  width = 10,
  height = 6
)


grafico_ciudades <- ggplot(
  ventas_ciudad,
  aes(x = reorder(ciudad, ingresos), y = ingresos)
) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = dollar_format()) +
  labs(
    title = "Ingresos por ciudad",
    x = "Ciudad",
    y = "Ingresos"
  ) +
  theme_minimal()


ggsave(
  "graficos/ingresos_por_ciudad.png",
  grafico_ciudades,
  width = 8,
  height = 5
)






























