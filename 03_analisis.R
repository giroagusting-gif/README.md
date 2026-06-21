datos <- read_csv("datos/datos_limpios.csv")

#¿cuales son los productos que mas facturan?
top_productos <- datos |>
  group_by(product) |>
  summarise(
    ingresos = sum(ingresos)
  ) |>
  arrange(desc(ingresos))


#¿que ciudades generan mas ingresos?
ventas_ciudad <- datos |>
  group_by(ciudad) |>
  summarise(
    ingresos = sum(ingresos)
  ) |>
  arrange(desc(ingresos))


#¿que mes tienen mas ventas?
ventas_mes <- datos |>
  group_by(mes) |>
  summarise(
    ingresos = sum(ingresos)
  ) |>
  arrange(mes)

