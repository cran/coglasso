## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----setup--------------------------------------------------------------------
# library(coglasso)

## -----------------------------------------------------------------------------
# help(multi_omics_sd)

## -----------------------------------------------------------------------------
# nlambda_w <- 30
# nlambda_b <- 30
# cs <- c(0.01, 0.05, 0.1, 0.2, 1, 5, 10, 20, 100)

## -----------------------------------------------------------------------------
# cg <- coglasso(multi_omics_sd,
#   p = 162,
#   nlambda_w = nlambda_w,
#   nlambda_b = nlambda_b,
#   c = cs
# )

## -----------------------------------------------------------------------------
# set.seed(42)
# sel_cg <- select_coglasso(cg, method = "xstars")

## -----------------------------------------------------------------------------
# plot(sel_cg)

## -----------------------------------------------------------------------------
# igraph::V(sel_graph)$label<-colnames(sel_cg$data)
# cirbp_index <- which(colnames(sel_cg$data) == "Cirbp")
# subnetwork <- igraph::subgraph(
#   sel_graph,
#   c(cirbp_index, igraph::neighbors(sel_graph, cirbp_index))
# )
# plot(subnetwork)

## -----------------------------------------------------------------------------
# communities <- igraph::cluster_fast_greedy(sel_graph)
# community2 <- communities[[2]]
# community2_graph<-igraph::subgraph(sel_graph, community2)
# 
# # Focusing on nodes of interest
# fosjun_erg_AA <- c("Fos", "Fosb", "Junb", "Fosl2", "Egr1", "Egr2", "Egr3", "Ala", "Arg", "Asn","His","Ile","Leu","Lys","Met","Orn","Phe","Ser","Thr","Tyr","Val")
# igraph::V(community2_igraph)[!(label %in% fosjun_erg_AA)]$color<-c(rep("#3bd8ff", 29), rep("#ffadad", 5))
# igraph::V(community2_igraph)[!(label %in% fosjun_erg_AA)]$frame.color<-NA
# igraph::V(community2_igraph)[!(label %in% fosjun_erg_AA)]$label<-NA
# 
# lo_community2 <- igraph::layout_with_fr(community2_graph)
# plot(community2_graph, layout=lo_community2)

