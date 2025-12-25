if (!exists("data_bersih")) source("01_data_preparation.R")

kolom_analisis <- "Pendapatan_Tahunan_Miliar_IDR"

# Statistik Deskriptif
summary_stats <- data_bersih %>%
  summarise(
    Mean = mean(get(kolom_analisis)),
    Median = median(get(kolom_analisis)),
    SD = sd(get(kolom_analisis)),
    Min = min(get(kolom_analisis)),
    Max = max(get(kolom_analisis))
  )
print("--- HASIL STATISTIK DESKRIPTIF ---")
print(summary_stats)

# Membuat Histogram
ggplot(data_bersih, aes(x = Pendapatan_Tahunan_Miliar_IDR)) +
  geom_histogram(fill = "steelblue", color = "white", bins = 30) +
  labs(title = "Distribusi Pendapatan Tahunan Startup", x = "Pendapatan (Miliar IDR)", y = "Frekuensi") +
  theme_minimal()

# Simpan ke folder results
ggsave("../results/histogram_pendapatan.png")