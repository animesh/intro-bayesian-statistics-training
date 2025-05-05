#https://sib-swiss.github.io/intro-bayesian-statistics-training/website/installation_instructions.html
install.packages("rstan", repos = c('https://stan-dev.r-universe.dev', getOption("repos")))
install.packages("rmarkdown")
install.packages("shiny")
install.packages("tidyverse")
install.packages("brms")
update.packages(checkBuilt = TRUE, ask = FALSE)
packageVersion("rstan")
options(mc.cores = parallel::detectCores())
rstan::rstan_options(auto_write = TRUE)
#test####
library(rstan)

# Simple model code
stan_code <- "
data {
    int<lower=0> N;
    vector[N] y;
}
parameters {
    real mu;
    real<lower=0> sigma;
}
model {
    y ~ normal(mu, sigma);
}
"

# Data
data <- list(N = 10, y = rnorm(10))

# Run with verbose output to see where it fails
fit <- stan(model_code = stan_code, data = data, verbose = TRUE)


sm <- stan_model(model_code = stan_code)

getwd()

tempdir()  # Should point to a valid directory
file.exists(tempdir())

Sys.getenv("TEMP")
Sys.getenv("TMP")


Sys.which("g++")

nchar(tempdir())
install.packages("pkgbuild")
pkgbuild::has_build_tools(debug = TRUE)

options(mc.cores = 1)  # Force single core to avoid parallelization issues
Sys.setenv(R_TESTS = "")  # Fix for potential test environment issues

# Clear connections before running Stan
closeAllConnections()

#https://paulbuerkner.com/brms/
library(brms)
fit1 <- brm(count ~ zAge + zBase * Trt + (1|patient),data = epilepsy, family = poisson())
plot(epilepsy)
data<-epilepsy
fit0<-brm(count ~ zAge,data=data)
#rstan
#https://gist.github.com/rasmusab/744410db9cf85ecb85e1
set.seed(123)
y <- rbinom(30, size = 1, prob = 0.2016)
# Fitting a simple binomial model using Stan
library(rstan)
model_string <- "
data {
  int n;
  array[n] int y;
}
parameters {
  real<lower=0, upper=1> theta;
}
model {
  y ~ bernoulli(theta);
}"
https://stackoverflow.com/questions/56256884/error-on-the-stan-file-compilation-using-r-3-6-0-and-win-10/56328910#56328910

CXX14 = "C:\Rtools\mingw_64\bin\g++.exe"
stan_samples <- stan(model_code = model_string, data = list(y = y, n = length(y)) )
stan_samples
traceplot(stan_samples)
plot(stan_samples)


# Add to your .Rprofile
cat('
Sys.setenv(USE_CXX14 = 1)
options(mc.cores = 4)
rstan::rstan_options(auto_write = TRUE)
', file = "~/.Rprofile", append = TRUE)


R.version  # Should show your R version

# For R 4.5.0, you should be using rtools45
# Make sure it's properly installed and on your PATH

# Check if C++ toolset is properly configured
pkgbuild::has_build_tools(debug = TRUE)


dir.create("temp_dir", showWarnings = FALSE)
Sys.setenv(TMPDIR = "temp_dir")
Sys.setenv(TEMP = "temp_dir")
