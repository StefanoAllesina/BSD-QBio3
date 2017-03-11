####### Two Strains with Competition ############################################################
## Two-strain model with optional sinusoidal forcing
## Implemented with deSolve (lsoda) in R
## August 2015
## Authors: Igor Vasiljevic and Sarah Cobey, 
## with R implementation by Sylvia Ranjeva 
##################################################################################################

# load package to solve ODEs from R
require(deSolve);

## Function to output system of ODE's at each time point #########################################
diff_eqs <- function(t,y,p){
  beta = p[[1]]
  gamma = p[[2]]
  mu = p[[3]]
  alpha = p[[4]]
  epsilon = p[[5]]
  omega = p[[6]]
  forcing = p[[7]]
  
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

#### Run the simulation ##############################################################################
# specify initial conditions
NSS = 0.2
NIS = 1e-3
NRS = 0.02
NRI = 0.0
NSI = 1e-3
NSR = 0.02
NIR = 0.0

# specify model parameters
beta = c(5,5)/7
gamma = c(1,1)/7
mu = 1/(10*365)
alpha = c(1,1)
epsilon = .1
omega = 2*(pi/365)
# optional observation noise
obs_sd = 0

# turn on/off forcing
forcing = 1

#specify simulation times
t_start = 0
t_end = 100*365
delta_t = .1

#specify output sampling for plotting
output_interval = 1

#parameters
params = list(beta = beta,
gamma = gamma,
mu = mu,
alpha = alpha,
epsilon = epsilon,
omega = omega,
forcing = forcing)

#time sequence
t = seq(from=t_start,to=t_end,by=delta_t)

#initial conditions
N = c(NSS, NIS, NRS, NSI, NRI, NSR, NIR)

#simulate #####################################################
out = ode(y=N,times=t,func=diff_eqs,parms=params)


time = out[,1]
I1 = out[,3] + out[,8]
I2 = out[,5] + out[,6]

# add optional observation noise
if(obs_sd > 0){
  errors <- rnorm(length(I1), mean = 1, sd = obs_sd)
  I1 <- I1*errors
  I2 <- I2*errors
}

NSS = out[,2]
NIS = out[,3]
NRS = out[,4]
NSI = out[,5]
NRI = out[,6]
NSR = out[,7]
NIR = out[,8]
NRR = 1-rowSums(out[,2:8],)

output <- data.frame(time = time,
                     NSS = NSS,
                     NIS = NIS,
                     NRS = NRS,
                     NSI = NSI,
                     NRI = NRI,
                     NSR = NSR,
                     NIR = NIR,
                     NRR = NRR,
                     I1 = I1,
                     I2 = I2)

# Plotting #############################################################

## plot time-series #####################################################
filename = "time_series.png"
png(filename, res = 100)

# plotting parameters
par(mfrow = c(3, 1),     # 3x1 layout
    oma = c(2, 2, 0, 0), # two rows of text at the outer left and bottom margin
    mar = c(1, 1, 1, 1), # space for one row of text at ticks and to separate plots
    mgp = c(2, 1, 0),    # axis label at 2 rows distance, tick labels at 1 row
    xpd = NA)            # allow content to protrude into outer margin (and beyond)

plot(time,NSS,ylim=c(0,.8),type="l", col = "blue", lwd=1,xlab = "", ylab="Fraction Uninfected")
  lines(time, NSR, col="red")
  lines(time, NRS, col = "green")
  lines(time, NRR, col = "cyan")
  legend('topright', legend = c(expression('N'["SS"]), expression('N'["SR"]), expression('N'["RS"]),expression('N'["RR"]) ), lwd = 2, col = c("blue","red","green", "cyan"), cex = .6 )
plot(time, I1, ylim = c(0,.005), type = 'l', col = "red", lwd =1 ,xlab = "", ylab= "Prevalence Strain 1")
  lines(time, NIS, col = "blue")
  lines(time, NIR, col = "green")
  legend('topright', legend = c(expression('I'[1]), expression('N'["IS"]), expression('N'["IR"])) , lwd = 2, col = c("red","blue","green") , cex = .7)
plot(time, I2, ylim = c(0,.005), type = 'l', col = "red", lwd =1 , xlab = "Time", ylab= "Prevalence Strain 2")
  lines(time, NSI, col = "blue")
  lines(time, NRI, col = "green")
  legend('topright', legend = c(expression('I'[2]), expression('N'["SI"]), expression('N'["RI"])) , lwd = 2, col = c("red","blue","green"), cex = .7 )
dev.off()

## plot I1 vs I2 #####################################################
filename = "I1_vs_I2.png"
png(filename, res = 72)
par(mfrow=c(1,1))
plot(I1, I2, type = 'l', col = "red", lwd =1 , xlab = expression('I'[1]), ylab= expression('I'[2]), main = "Prevalence Strain 2 vs. Prevalence Strain 1")
dev.off()