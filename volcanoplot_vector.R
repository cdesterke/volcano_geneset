

## input vector from hallmarks with import_gmt.R script
vector<-gene_ids

## input vector from ferroviz
library(ferroviz)
head(ferrdbhs)
head(resulths)
vector<-as.vector(unique(ferrdbhs$hs.gene))
data<-resulths
data$gene<-row.names(data)

# Chargement des librairies nécessaires
library(ggplot2)
library(dplyr)
library(dplyr)
library(ggrepel)

# Transformation des p-values en -log10(pvalue)
data <- data %>%
  mutate(logP = -log10(P.Value),
         is_inside = ifelse(gene %in% vector, "Yes", "No"))

# Volcanoplot avec ggplot2
ggplot(data, aes(x = logFC, y = logP)) +
  geom_point(data = data %>% filter(is_inside == "No"),
             aes(x = logFC, y = logP),
             color = "grey80") +
  geom_point(data = data %>% filter(is_inside == "Yes"),
             aes(x = logFC, y = logP),
             color = "coral",size=3) +
  ggrepel::geom_text_repel(
    data = data %>% filter(is_inside == "Yes"),  
    aes(label = gene, color = is_inside),  
    box.padding = 0.2, point.padding = 0.2)+
  theme_minimal() +
  theme(
    legend.position = "none", 
    plot.title = element_text(size = 20, face = "bold"), 
    axis.title = element_text(size = 16),  
    axis.text = element_text(size = 14),   
    strip.text = element_text(size = 16),  
    text = element_text(size = 14))+
  labs(title = "",
       x = "Log2 Fold Change",
       y = "-log10(P-value)",
       color = "geneset")
