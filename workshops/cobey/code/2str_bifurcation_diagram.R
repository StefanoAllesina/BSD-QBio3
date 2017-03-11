####### Bifurcation Diagram: Two Strains with Competition ####################
## Two-strain model with optional sinusoidal forcing
## Implemented with deSolve (lsoda) in R
#########################################################
## Function to output system of ODE's at each time point #########################################
diff_eqs <- function(t,y,p){
  beta = p[[1]]
  gamma = p[[2]]
  mu = p[[3]]
  alpha = p[[4]]
  epsilon = p[[5]]
  omega = p[[6]]
  forcing =1
  
  if(forcing == 1){
    force = 1 + epsilon*cos(omega*t) # seasonal forcing
  }
  if(forcing == 0){
    force = 1 # no forcing
  }
  
  N = y
  
  with(as.list(p),{
    NSS = N[1]
    NIS = N[2]
    NRS = N[3]
    NSI = N[4]
    NRI = N[5]
    NSR = N[6]
    NIR = N[7]
    I1 = NIS + NIR
    I2 = NSI + NRI
    
    #adjust transmission rate according to forcing
    beta = beta*force
    
    #differential equations
    dNSS.dt = mu - NSS*(beta[1]*I1 + beta[2]*I2) - mu*NSS
    dNIS.dt = NSS*(beta[1]*I1) - gamma[1]*NIS - mu*NIS
    dNRS.dt = gamma[1]*NIS - alpha[2]*beta[2]*I2*NRS - mu*NRS
    dNSI.dt = beta[2]*NSS*I2 - gamma[2]*NSI - mu*NSI
    dNRI.dt = alpha[2]*beta[2]*I2*NRS - gamma[2]*NRI - mu*NRI
    dNSR.dt = gamma[2]*NSI - alpha[1]*beta[1]*I1*NSR - mu*NSR
    dNIR.dt = alpha[1]*beta[1]*I1*NSR - gamma[1]*NIR - mu*NIR
    return(list(c(dNSS.dt,dNIS.dt,dNRS.dt, dNSI.dt, dNRI.dt, dNSR.dt, dNIR.dt)))
  })
}

###########################################################################
# Run parameters
run_num = 1  
end_time = 1000*365 # run simulation for 1000 years
output_interval = 365.0  # annual strobing
t_start = 0
t_end = 1000*365
delta_t = 1
sweep_par = "beta1"  # change this to label the varying parameter 
par_min = 1.0/7.0
par_max = 7.0/7.0
n_points = 40  # number of points in parameter range
n_strobes = 50  # number of years to sample

# initial conditions
NSS = 0.2
NIS = 1e-3
NRS = 0.02
NRI = 0.0
NSI = 1e-3
NSR = 0.02
NIR = 0.0

# organize and run simulations
param_range <- seq(par_min,par_max, length.out = n_points )
bif_vals <- matrix(0,length(param_range),n_strobes)
#time sequence
t = seq(from=t_start,to=t_end,by=delta_t);
# times for strobing
sample_times <- seq(min(t),max(t), by = output_interval)
#initial conditions
N = c(NSS, NIS, NRS, NSI, NRI, NSR, NIR)


for( i in 1:length(param_range)){
  cat("Running value",i, " of", length(param_range), "\n")
  beta1 = param_range[i] # assign param_range[i] to the varying parameter
  beta2 = 5/7
  epsilon = 0.1
  gamma1 = 1/7
  gamma2 = 1/7
  mu = 1/(10*365)
  alpha1 = 1
  alpha2 = 1
  omega = 2*(pi/365)
  #obs_sd = 0.01
  beta = c(beta1,beta2)
  alpha = c(alpha1,alpha2)
  gamma = c(gamma1,gamma2)
  params = list(beta = beta,
                gamma = gamma,
                mu = mu,
                alpha = alpha, 
                epsilon = epsilon, 
                omega = omega)  
  
  output = ode(y=N,times=t,func=diff_eqs,parms=params) 
  time <- output[,1]
  # full output over time sequence
  I1 <-  output[,3] + output[,8] # NIS + NIR = I1
  # strobing annually: output at sample times 
  sample_indices <- which(time %in% sample_times)
  I1_samples <- I1[sample_indices]
  bif_vals[i,] <- tail(I1_samples,n_strobes)
}

## plotting:
output <- data.frame(param_range = param_range,
                     bif_vals)
filename <- paste("bifurcation_diagram_", sweep_par, ".jpg" , sep = "")
jpeg(filename)
plot(param_range,output[,2],cex=0.1,ylim=c(0,.035),xlab="beta_1",ylab="NIS + NIR")
for(i in 3:ncol(output)){
  points(param_range,output[,i],cex=0.1)
}
dev.off()