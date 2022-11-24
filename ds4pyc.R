library(ds4psy)
library(lubridate)
library(dplyr)
library(stringr)

# 1. Estudando o pacote ds4pyc. -------------------------------------------

# Pegamos duas datas e calculamos sua diferença em anos, meses e dias.

nasc_mario <- ymd("1959-06-30")
serv_publi_20 <- ymd("2025-01-19")

# Quanto tempo terei quando tiver 20 anos de serviço público ("2025-01-19")?
# R. "65y 6m 20d"
diff_dates(from_date = nasc_mario, to_date = serv_publi_20)


# Quanto tempo tenho hoje ("2022-11-23")?
# R. "63y 4m 24d"
diff_dates(from_date = nasc_mario, cur_date())

# Quantos meses já vivi?
# R. "760m 24d"
diff_dates(from_date = nasc_mario, cur_date(), unit = "month")

# Embelezando o resultado.
# Quanto tempo tenho hoje ("2022-11-23")?
diff_dates(from_date = nasc_mario, today()) |>
  str_replace_all(c("y" = " anos,",
                    "m" = " meses e",
                    "d" = " dias."))

# Criando a função quanto_tempo_ja_vivi
quanto_tempo_ja_vivi <- function(data_de_nascimento) {
  diff_dates(from_date = ymd(data_de_nascimento), today()) |>
    str_replace_all(c("y" = " anos,",
                      "m" = " meses e",
                      "d" = " dias."))
}

quanto_tempo_ja_vivi(data_de_nascimento = "1933-11-30")





















diff_dates(dt_1, dt_2, unit = "month")
#> [1] "263m 30d"
diff_dates(dt_1, dt_2, unit = "day")
#> [1] "8035d"
By default, diff_dates() expects that from_date and to_date are dates (i.e., R objects of type “Date”). If to_date remains unspecified, the function uses the current date as its reference point:

  diff_dates(from_date = dt_1)
#> [1] "22y 3m 7d"
diff_dates(from_date = dt_1, cur_date())
#> [1] "22y 3m 7d"
Actually, we have seen above that cur_date() yields a character string. Thus, the diff_dates() function also works when entering strings that can be interpreted as valid dates:


  diff_dates("2000-01-01", cur_date())
#> [1] "22y 3m 7d"
If both date arguments are reversed, the result is negated:

  diff_dates(cur_date(), "2000-01-01")
#> [1] "-22y 3m 7d"
