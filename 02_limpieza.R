datos <- read.csv(file.choose())

library(tidyverse)
library(janitor)
library(lubridate)

datos <- clean_names(datos)

datos <- datos |>
  filter(
    order_id != "",
    order_id != "Order ID"
  ) |>
  mutate(
    quantity_ordered = as.numeric(quantity_ordered),
    price_each = as.numeric(price_each),
    order_date = parse_date_time(
      order_date,
      orders = "mdy HM"
    )
  )

datos <- datos |>
  mutate(
    ingresos = quantity_ordered * price_each,
    mes = floor_date(order_date, "month"),
    ciudad = str_split_fixed(purchase_address, ", ", 3)[, 2]
  )

write_csv(datos, "datos/datos_limpios.csv")
