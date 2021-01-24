ptm <- proc.time()
cr_col_sz<- read.csv(file="C:/Users/islam.m/Dropbox/Saiful/Discretization algorithm/cr_col_size.csv", header=TRUE, sep=",")

cr_oc<- read.csv(file="C:/Users/islam.m/Dropbox/Saiful/Discretization algorithm/cr_data.csv", header=TRUE, sep=",")

tr_col_sz<- read.csv(file="C:/Users/islam.m/Dropbox/Saiful/Discretization algorithm/tr_col_size.csv", header=TRUE, sep=",")

tr_oc<- read.csv(file="C:/Users/islam.m/Dropbox/Saiful/Discretization algorithm/tr_data.csv", header=TRUE, sep=",")

#input of McNemar test algorithm:
#1. Number of elements in each partition given in a partition x 1 column matrix (for both treatment and control group)
#2. vectors of outcomes of each partition given in outcomes of #of elements x 1 vector, there will be #partition of such vectors



p1 = dim(tr_col_sz)
p = p1[1] #gets the number of partitions

#create 0 matrices to store values
T_1 = matrix( rep( 0, len=p), nrow = p);
T_0 = matrix( rep( 0, len=p), nrow = p);

C_1 = matrix( rep( 0, len=p), nrow = p);
C_0 = matrix( rep( 0, len=p), nrow = p);

B_max = matrix( rep( 0, len=p), nrow = p);
C_max = matrix( rep( 0, len=p), nrow = p);

#main loop to calculate B_max and C_max
for (i in 1:p) {
  T_1[i] = sum(tr_oc[1:tr_col_sz[i,1],i])
  T_0[i] = tr_col_sz[i,1] - T_1[i]
  
  C_1[i] = sum(cr_oc[1:cr_col_sz[i,1],i])
  C_0[i] = cr_col_sz[i,1] - C_1[i]
  
  B_max[i] = min(T_0[i], C_1[i])
  C_max[i] = min(T_1[i], C_0[i])
}


B =sum(B_max)
C=sum(C_max)

#Z score, objective function of robust McNemar's test
z=(B-C-1)/sqrt(B+C)

#p-value
pnorm(z,mean=0, sd=1, lower.tail=FALSE)


proc.time() - ptm
