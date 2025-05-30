#load packages
library(tidyverse)
library(reshape)
library(VennDiagram)

#read in data
nlr <- read.delim("nlr.out.txt", header = FALSE, sep = '\t')

#filter nlrs by motifs
cnlspecific <- nlr %>% filter(grepl('motif_2,|motif_2$|motif_6|motif_16|motif_17', V7))
tnlspecific <- nlr %>% filter(grepl('motif_13|motif_15|motif_18', V7))
general <- nlr %>% filter(grepl('motif_1,|motif_1$|motif_3|motif_4|motif_5|motif_7|motif_8|motif_9|motif_10|motif_11|motif_12|motif_19', V7))

#venn diagram
cnlloci <- as.list(cnlspecific$V2)
tnlloci <- as.list(tnlspecific$V2)
genloci <- as.list(general$V2)

myCol <- c("mediumpurple3", "firebrick3", "lightsteelblue2")
motifs <- venn.diagram(
  x = list(cnlloci, tnlloci, genloci),
  category.names = c("CNL-specific" , "TNL-specific" , "General"),
  filename = NULL,
  output=TRUE,
  imagetype="svg",
  height = 500, 
  width = 700, 
  resolution = 300,
  compression = "lzw",
  lwd = 2,
  lty = 'blank',
  fill = myCol,
  cex = .8,
  fontface = "bold",
  fontfamily = "sans",
  cat.default.pos = "outer",
  cat.dist = c(-0.1, -0.1, -0.1),
  cat.cex = 0.7,
  cat.fontface = "bold",
  cat.fontfamily = "sans",
  rotation = 1
)

ggsave(motifs, file = "motif_venn_diagram.svg", device = "svg")
