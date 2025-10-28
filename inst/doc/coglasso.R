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
sel_cg <- bs(
  multi_omics_sd_small,
  p = c(14, 5),
  nlambda_w = 15,
  nlambda_b = 15,
  nc = 3,
  lambda_w_min_ratio = 0.6,
  verbose = FALSE
)

# To see information on the network estimation and selection:
print(sel_cg)

## -----------------------------------------------------------------------------
plot(sel_cg)

