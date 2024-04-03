## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(coglasso)

## -----------------------------------------------------------------------------
colnames(multi_omics_sd_small)
nrow(multi_omics_sd_small)

## -----------------------------------------------------------------------------
cg <- coglasso(multi_omics_sd_small,
  pX = 14,
  nlambda_w = 15,
  nlambda_b = 15,
  nc = 3,
  lambda_w_max = 0.85,
  lambda_b_max = 0.85,
  lambda_w_min_ratio = 0.6,
  lambda_b_min_ratio = 0.4,
  verbose = FALSE
)

# To see the explored paramaters:
cg$lambda_w
cg$lambda_b
cg$c

## -----------------------------------------------------------------------------
sel_cg <- stars_coglasso(cg, verbose = FALSE)

# To see the selected parameters:
sel_cg$sel_lambda_w
sel_cg$sel_lambda_b
sel_cg$sel_c

## -----------------------------------------------------------------------------
# To create the igraph object from the selected adjacency matrix:
sel_graph <- igraph::graph.adjacency(sel_cg$sel_adj, mode = "undirected")

# Setting some graphical parameters and removing disconnected nodes from the graph
igraph::V(sel_graph)$label <- colnames(multi_omics_sd_small)
igraph::V(sel_graph)$color <- c(rep("#00ccff", 14), rep("#ff9999", 5))
igraph::V(sel_graph)$frame.color <- c(rep("#002060", 14), rep("#800000", 5))
igraph::V(sel_graph)$frame.width <- 2
igraph::V(sel_graph)$size <- c(30)
igraph::E(sel_graph)$width <- 2

lo <- igraph::layout_with_fr(sel_graph)
diconnected <- which(igraph::degree(sel_graph) == 0)
sel_graph2 <- igraph::delete.vertices(sel_graph, diconnected)
lo2 <- lo[-diconnected, ]

# Plotting
plot(sel_graph2, layout = lo2)

