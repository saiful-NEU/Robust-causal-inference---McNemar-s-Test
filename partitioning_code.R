
control <- read.csv(file="C:/Users/islam.m/Dropbox/Saiful/McNemar test/Data files for different hospital readmission dataset/ALL_Bef.csv", header=TRUE, sep=",")

treatment <- read.csv(file="C:/Users/islam.m/Dropbox/Saiful/McNemar test/Data files for different hospital readmission dataset/ALL_Aft.csv", header=TRUE, sep=",")

#Read data files 

t_G <- split(treatment, list(treatment$Gender, treatment$Metro, treatment$Diagnosis, treatment$Bed_cat, treatment$age_cat, treatment$H_income_q, treatment$CCI_cat, treatment$Ownership))
#splits the treatment group by gender, metro/urban, diagosis, and bed category

c_G <- split(control, list(control$Gender, control$Metro, control$Diagnosis, control$Bed_cat, control$age_cat, control$H_income_q, control$CCI_cat, control$Ownership))
#splits the control group by gender, metro/urban, diagosis, bed category, age, household income, comorbidity, type of ownership


tr_length=matrix( rep( 0, len=length(t_G)), nrow = 1);
cr_length=matrix( rep( 0, len=length(t_G)), nrow = 1);

# check which partition has how many samples
for (i in 1:length(t_G)) {
  tr_length[i]=length(t_G[[i]]$row)
  # nam_tr = paste("out_tr",i,sep="")
  # assign(nam_tr, t_G[[i]]$change)
  
  cr_length[i]=length(c_G[[i]]$row)  
  # nam_cr = paste("out_cr",i,sep="")
  # assign(nam_cr, c_G[[i]]$change)

}

#creating the matrices to store the outputs
tr_out=matrix( rep( 0), nrow = max(tr_length), ncol = length(t_G));
cr_out=matrix( rep( 0), nrow = max(cr_length), ncol = length(c_G));

#collecting the outputs for each partition in a matrix form
for (i in 1:length(t_G)) {
  if ( tr_length[i] == 0 | cr_length[i] == 0 ){
    next
  } else {
    tr_out[1:tr_length[i],i]=t_G[[i]]$change
    cr_out[1:cr_length[i],i]=c_G[[i]]$change
  }
}

#identifying the columns/partitions wghich has 0 entries/samples
L = c();
i = 1;
for ( i in 1:length(t_G)){
  if ( tr_length[i] == 0 | cr_length[i] == 0 ){
  b = i
  L = c (L,b)
  i = i+1
  }
}

#eliminating the columns/partitions which has 0 entries/samples
tr_length_f = tr_length[, -L]
cr_length_f = cr_length[, -L]

tr_out_f = tr_out[, -L]
cr_out_f = cr_out[, -L]


#writing into text and csv files
write.table(tr_out_f, "tr_data.txt", sep="\t");
write.table(tr_out_f, file="tr_data.csv",sep=",",row.names=F);


write.table(cr_out_f, "cr_data.txt", sep="\t")
write.table(cr_out_f, file="cr_data.csv",sep=",",row.names=F)



write.table(tr_length_f, "tr_col_size.txt", sep="\t");
write.table(tr_length_f, file="tr_col_size.csv",sep=",",row.names=F)

write.table(cr_length_f, "cr_col_size.txt", sep="\t");
write.table(cr_length_f, file="cr_col_size.csv",sep=",",row.names=F)



##################################################################################################

