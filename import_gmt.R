library(GSEABase)

# Chemin vers ton fichier GMT
gmt_file <- "h.all.v2024.1.Hs.symbols.gmt"

# Charger le fichier GMT
gmt_data <- getGmt(gmt_file)

# Afficher un résumé de la signature GMT
gmt_data

# Voir les noms des ensembles de gènes dans le fichier GMT
names(gmt_data)

# Extraire un ensemble de gènes particulier
geneset <- gmt_data[[25]]  # inflammation response


# Extraire les gènes de cet ensemble
gene_ids <- geneIds(geneset)
print(gene_ids)
