param num_part;
#param Rows;
#param columns;
set I := 1..1822;
#maximum length of treatment group partition
set J := 1..672;
#maximum length ofcontrol group partition
set K := 1..925;
param matrix1{I, J};
#matrix containing control group data
param matrix2{I, K};

#param n default 1500;
param P_T{1..num_part};
param C_T{1..num_part};
param T{i in 1..num_part, j in 1..P_T[i]} := matrix1[i,j];
param C{i in 1..num_part, j in 1..C_T[i]} := matrix2[i,j];
#param T{I, J};
#param C{I, K};
#number of partitions
param n default 21800;
#matrix containing treatment group data

var a{i in 1..num_part,j in 1..P_T[i],k in 1..C_T[i]} binary;

#var b{i in 1..num_part,j in 1..P_T[i],k in 1..C_T[i]} binary;

#var c{i in 1..num_part,j in 1..P_T[i],k in 1..C_T[i]} binary;

var P;
var Q;

maximize obj2: (P-Q-1)/sqrt(n);


subject to def1:sum{i in 1..num_part,j in 1..P_T[i],k in 1..C_T[i]}a[i,j,k]*C[i,k]*(1-T[i,j])=P;

subject to def2:sum{i in 1..num_part,j in 1..P_T[i],k in 1..C_T[i]}a[i,j,k]*T[i,j]*(1-C[i,k])=Q;

subject to def3{i in 1..num_part,k in 1..C_T[i]}:sum{j in 1..P_T[i]}a[i,j,k]<=1;

subject to def4{i in 1..num_part,j in 1..P_T[i]}:sum{k in 1..C_T[i]}a[i,j,k]<=1;

subject to def5:P+Q=n;