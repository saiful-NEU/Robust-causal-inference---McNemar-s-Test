
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


tr_col_size = matrix( rep( 0, len=147), nrow = 1);
j=1;
for (i in 1:length(t_G)) {
  if (tr_length[i] > 0 &  cr_length[i] > 0){
    tr_col_size[j] = tr_length[i]
    j=j+1
  } 
  else {
    
  }
}

write.table(tr_col_size, "tr_col_size.txt", sep="\t");


cr_col_size = matrix( rep( 0, len=147), nrow = 1);
k=1;
for (i in 1:length(t_G)) {
  if (tr_length[i] > 0 &  cr_length[i] > 0) {
    cr_col_size[k] = cr_length[i]
    k=k+1
  } 
  else {
    
  }
}


write.table(cr_col_size, "cr_col_size.txt", sep="\t");






tr_out = cbind(out_tr9, out_tr10, out_tr16, out_tr20, out_tr23, out_tr24, out_tr27, out_tr28, out_tr31, out_tr32,
               out_tr35, out_tr36, out_tr39, out_tr40, out_tr45, out_tr47, out_tr48, out_tr51, out_tr52, 
               out_tr55, out_tr56, out_tr59, out_tr60, out_tr63, out_tr64, out_tr67, out_tr68, out_tr71, out_tr72, 
               out_tr73, out_tr75, out_tr76, out_tr79, out_tr81, out_tr82, out_tr83, out_tr84, out_tr85, out_tr87, 
               out_tr88, out_tr89, out_tr90, out_tr91, out_tr92, out_tr93, out_tr95, out_tr96, out_tr99, out_tr100,
               out_tr103, out_tr104, out_tr107, out_tr108, out_tr109, out_tr110, out_tr111, out_tr112, out_tr116, 
               out_tr117, out_tr118, out_tr119, out_tr120, out_tr121, out_tr122, out_tr123, out_tr124, out_tr126,
               out_tr127, out_tr128, out_tr130, out_tr131, out_tr132, out_tr135, out_tr136, out_tr139, out_tr140, 
               out_tr143, out_tr144, out_tr145, out_tr146, out_tr147, out_tr148, out_tr150, out_tr151, out_tr152, 
               out_tr153, out_tr154, out_tr155, out_tr156, out_tr157, out_tr158, out_tr159, out_tr160, out_tr161, 
               out_tr162, out_tr163, out_tr164, out_tr165, out_tr166, out_tr167, out_tr168, out_tr169, out_tr170, out_tr171, 
               out_tr172, out_tr174, out_tr175, out_tr176, out_tr177, out_tr178, out_tr179, out_tr180, out_tr181, 
               out_tr182, out_tr183, out_tr184, out_tr185, out_tr186, out_tr187, out_tr188, out_tr189, out_tr190, 
               out_tr191, out_tr192, out_tr193, out_tr194, out_tr195, out_tr196, out_tr197, out_tr198, out_tr199, 
               out_tr200, out_tr201, out_tr202, out_tr203, out_tr204, out_tr205, out_tr206, out_tr207, out_tr208, 
               out_tr209, out_tr210, out_tr211, out_tr212, out_tr214, out_tr215, out_tr216);


cr_out = cbind(out_cr9, out_cr10, out_cr16, out_cr20, out_cr23, out_cr24, out_cr27, out_cr28, out_cr31, out_cr32,
               out_cr35, out_cr36, out_cr39, out_cr40, out_cr45, out_cr47, out_cr48, out_cr51, out_cr52, 
               out_cr55, out_cr56, out_cr59, out_cr60, out_cr63, out_cr64, out_cr67, out_cr68, out_cr71, out_cr72, 
               out_cr73, out_cr75, out_cr76, out_cr79, out_cr81, out_cr82, out_cr83, out_cr84, out_cr85, out_cr87, 
               out_cr88, out_cr89, out_cr90, out_cr91, out_cr92, out_cr93, out_cr95, out_cr96, out_cr99, out_cr100,
               out_cr103, out_cr104, out_cr107, out_cr108, out_cr109, out_cr110, out_cr111, out_cr112, out_cr116, 
               out_cr117, out_cr118, out_cr119, out_cr120, out_cr121, out_cr122, out_cr123, out_cr124, out_cr126,
               out_cr127, out_cr128, out_cr130, out_cr131, out_cr132, out_cr135, out_cr136, out_cr139, out_cr140, 
               out_cr143, out_cr144, out_cr145, out_cr146, out_cr147, out_cr148, out_cr150, out_cr151, out_cr152, 
               out_cr153, out_cr154, out_cr155, out_cr156, out_cr157, out_cr158, out_cr159, out_cr160, out_cr161, 
               out_cr162, out_cr163, out_cr164, out_cr165, out_cr166, out_cr167, out_cr168, out_cr169, out_cr170, out_cr171, 
               out_cr172, out_cr174, out_cr175, out_cr176, out_cr177, out_cr178, out_cr179, out_cr180, out_cr181, 
               out_cr182, out_cr183, out_cr184, out_cr185, out_cr186, out_cr187, out_cr188, out_cr189, out_cr190, 
               out_cr191, out_cr192, out_cr193, out_cr194, out_cr195, out_cr196, out_cr197, out_cr198, out_cr199, 
               out_cr200, out_cr201, out_cr202, out_cr203, out_cr204, out_cr205, out_cr206, out_cr207, out_cr208, 
               out_cr209, out_cr210, out_cr211, out_cr212, out_cr214, out_cr215, out_cr216);



##Treatment group partitions
P_t_1 <- t_G$`1.1.1.1.1` #Male, Metro, CHF, Small_bed
P_t_2 <- t_G$`1.1.1.2.1` #Male, Metro, CHF, Med_bed
P_t_3 <- t_G$`1.1.1.3.1` #Male, Metro, CHF, Larg_bed

P_t_4 <- t_G$`1.1.2.1.1` #Male, Metro, AMI, Small_bed
P_t_5 <- t_G$`1.1.2.2.1` #Male, Metro, AMI, Med_bed
P_t_6 <- t_G$`1.1.2.3.1` #Male, Metro, AMI, Larg_bed

P_t_7 <- t_G$`1.1.3.1.1` #Male, Metro, PNE, Small_bed
P_t_8 <- t_G$`1.1.3.2.1` #Male, Metro, PNE, Med_bed
P_t_9 <- t_G$`1.1.3.3.1` #Male, Metro, PNE, Larg_bed

P_t_10 <- t_G$`1.0.1.1` #Male, Rural, CHF, Small_bed
P_t_11 <- t_G$`1.0.1.2` #Male, Rural, CHF, Med_bed
P_t_12 <- t_G$`1.0.1.3` #Male, Rural, CHF, Larg_bed

P_t_13 <- t_G$`1.0.2.1` #Male, Rural, AMI, Small_bed
P_t_14 <- t_G$`1.0.2.2` #Male, Rural, AMI, Med_bed
P_t_15 <- t_G$`1.0.2.3` #Male, Rural, AMI, Larg_bed

P_t_16 <- t_G$`1.0.3.1` #Male, Rural, PNE, Small_bed
P_t_17 <- t_G$`1.0.3.2` #Male, Rural, PNE, Med_bed
P_t_18 <- t_G$`1.0.3.3` #Male, Rural, PNE, Larg_bed

P_t_19 <- t_G$`0.1.1.1` #Female, Metro, CHF, Small_bed
P_t_20 <- t_G$`0.1.1.2` #Female, Metro, CHF, Med_bed
P_t_21 <- t_G$`0.1.1.3` #Female, Metro, CHF, Larg_bed

P_t_22 <- t_G$`0.1.2.1` #Female, Metro, AMI, Small_bed
P_t_23 <- t_G$`0.1.2.2` #Female, Metro, AMI, Med_bed
P_t_24 <- t_G$`0.1.2.3` #Female, Metro, AMI, Larg_bed

P_t_25 <- t_G$`0.1.3.1` #Male, Metro, PNE, Small_bed
P_t_26 <- t_G$`0.1.3.2` #Male, Metro, PNE, Med_bed
P_t_27 <- t_G$`0.1.3.3` #Male, Metro, PNE, Larg_bed

P_t_28 <- t_G$`0.0.1.1` #Female, Rural, CHF, Small_bed
P_t_29 <- t_G$`0.0.1.2` #Female, Rural, CHF, Med_bed
P_t_30 <- t_G$`0.0.1.3` #Female, Rural, CHF, Larg_bed

P_t_31 <- t_G$`0.0.2.1` #Female, Rural, AMI, Small_bed
P_t_32 <- t_G$`0.0.2.2` #Female, Rural, AMI, Med_bed
P_t_33 <- t_G$`0.0.2.3` #Female, Rural, AMI, Larg_bed

P_t_34 <- t_G$`0.0.3.1` #Female, Rural, PNE, Small_bed
P_t_35 <- t_G$`0.0.3.2` #Female, Rural, PNE, Med_bed
P_t_36 <- t_G$`0.0.3.3` #Female, Rural, PNE, Larg_bed

##Control group partitions
P_c_1 <- t_G$`1.1.1.1` #Male, Metro, CHF, Small_bed
P_c_2 <- t_G$`1.1.1.2` #Male, Metro, CHF, Med_bed
P_c_3 <- t_G$`1.1.1.3` #Male, Metro, CHF, Larg_bed

P_c_4 <- t_G$`1.1.2.1` #Male, Metro, AMI, Small_bed
P_c_5 <- t_G$`1.1.2.2` #Male, Metro, AMI, Med_bed
P_c_6 <- t_G$`1.1.2.3` #Male, Metro, AMI, Larg_bed

P_c_7 <- t_G$`1.1.3.1` #Male, Metro, PNE, Small_bed
P_c_8 <- t_G$`1.1.3.2` #Male, Metro, PNE, Med_bed
P_c_9 <- t_G$`1.1.3.3` #Male, Metro, PNE, Larg_bed

P_c_10 <- t_G$`1.0.1.1` #Male, Rural, CHF, Small_bed
P_c_11 <- t_G$`1.0.1.2` #Male, Rural, CHF, Med_bed
P_c_12 <- t_G$`1.0.1.3` #Male, Rural, CHF, Larg_bed

P_c_13 <- t_G$`1.0.2.1` #Male, Rural, AMI, Small_bed
P_c_14 <- t_G$`1.0.2.2` #Male, Rural, AMI, Med_bed
P_c_15 <- t_G$`1.0.2.3` #Male, Rural, AMI, Larg_bed

P_c_16 <- t_G$`1.0.3.1` #Male, Rural, PNE, Small_bed
P_c_17 <- t_G$`1.0.3.2` #Male, Rural, PNE, Med_bed
P_c_18 <- t_G$`1.0.3.3` #Male, Rural, PNE, Larg_bed

P_c_19 <- t_G$`0.1.1.1` #Female, Metro, CHF, Small_bed
P_c_20 <- t_G$`0.1.1.2` #Female, Metro, CHF, Med_bed
P_c_21 <- t_G$`0.1.1.3` #Female, Metro, CHF, Larg_bed

P_c_22 <- t_G$`0.1.2.1` #Female, Metro, AMI, Small_bed
P_c_23 <- t_G$`0.1.2.2` #Female, Metro, AMI, Med_bed
P_c_24 <- t_G$`0.1.2.3` #Female, Metro, AMI, Larg_bed

P_c_25 <- t_G$`0.1.3.1` #Male, Metro, PNE, Small_bed
P_c_26 <- t_G$`0.1.3.2` #Male, Metro, PNE, Med_bed
P_c_27 <- t_G$`0.1.3.3` #Male, Metro, PNE, Larg_bed

P_c_28 <- t_G$`0.0.1.1` #Female, Rural, CHF, Small_bed
P_c_29 <- t_G$`0.0.1.2` #Female, Rural, CHF, Med_bed
P_c_30 <- t_G$`0.0.1.3` #Female, Rural, CHF, Larg_bed

P_c_31 <- t_G$`0.0.2.1` #Female, Rural, AMI, Small_bed
P_c_32 <- t_G$`0.0.2.2` #Female, Rural, AMI, Med_bed
P_c_33 <- t_G$`0.0.2.3` #Female, Rural, AMI, Larg_bed

P_c_34 <- t_G$`0.0.3.1` #Female, Rural, PNE, Small_bed
P_c_35 <- t_G$`0.0.3.2` #Female, Rural, PNE, Med_bed
P_c_36 <- t_G$`0.0.3.3` #Female, Rural, PNE, Larg_bed