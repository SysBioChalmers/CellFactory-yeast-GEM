% Construct pathways of other chemicals in ecYeast Model

% L-lactate
cd ../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=7.0146*3600;
MW1=36.598;
Kcat2=15.7*3600;
MW2=49.022;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1399','s_1203','s_0794','prot_P19858','s_0063','s_1198'},'stoichCoeffList',[-1 -1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0359','s_0529','s_1198','prot_P77445','s_0373','s_1203','s_0794'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'prot_pool','prot_P19858'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_P77445'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_0063','s_0064'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_0064'},'stoichCoeffList',[-1],'reversible',false);
model = removeGenes(model,'YDL022W');
model = removeGenes(model,'YML054C');
model = removeGenes(model,'YLR044C');
model = removeGenes(model,'YOL086C');
model = removeGenes(model,'YPL061W');
model=changeGeneAssociation(model,'newRxn1','LDHA');
model=changeGeneAssociation(model,'newRxn2','EutE');
model.geneShortNames(1123)={'LDHA'};
model.geneShortNames(1124)={'EutE'};
model.enzymes(964)={'P19858'};
model.enzymes(965)={'P77445'};
model.enzGenes(964)={'LDHA'};
model.enzGenes(965)={'EutE'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.29,'l');
model=changeObjective(model,'newRxn6');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecLactate.mat model

% Malate
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.52*3600;
Kcat2=20.7047*3600;
MW1=40.7305;
model = addReaction(model,'r_0958No1','metaboliteList',{'pmet_r_0958','prot_P32327','s_0394','s_0794','s_1271','s_1322'},'stoichCoeffList',[-1 -1/Kcat1 1 1 1 1],'reversible',false);
model = addReaction(model,'r_0958No2','metaboliteList',{'pmet_r_0958','prot_P11154','s_0394','s_0794','s_1271','s_1322'},'stoichCoeffList',[-1 -1/Kcat1 1 1 1 1],'reversible',false);
model = addReaction(model,'r_0714_REVNo1','metaboliteList',{'s_0794','s_1203','s_1271','prot_P22133','s_0066','s_1198'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_1901_REV','metaboliteList',{'s_0066','prot_P50537','s_0067'},'stoichCoeffList',[-1 -1 1],'reversible',false);
model = addReaction(model,'newRxn1','metaboliteList',{'prot_pool','prot_P50537'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = removeGenes(model,'YLR044C');
model = removeGenes(model,'YLR134W');
model = removeGenes(model,'YGR087C');
model = removeGenes(model,'YDL078C');
model=changeGeneAssociation(model,'newRxn1','mae1');
model.geneShortNames(1124)={'mae1'};
model.enzymes(964)={'P50537'};
model.enzGenes(964)={'mae1'};
model.metComps(4147)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'r_1552');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecMalate.mat model

% cis,cis-muconic acid
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=121.44*3600;
MW1=40.48;
Kcat2=90*3600;
MW2=53.541;
Kcat3=157.73*3600;
MW3=33.8;
Kcat4=0.0828*3600;
MW4=39.7487;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0211','prot_3DSD','s_4211','s_0803'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4211','s_0794','prot_A0A0H3CJN8','s_0456','s_4212'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4212','s_1275','prot_P86029','s_0794','s_4213'},'stoichCoeffList',[-1 -1 -1/Kcat3 2 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_0551','s_0803','s_1360','prot_P32449ly','s_0349','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'prot_pool','prot_3DSD'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_A0A0H3CJN8'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'prot_pool','prot_P86029'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_P32449ly'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'s_4213','s_4214'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'s_4214'},'stoichCoeffList',[-1],'reversible',false);
model = removeGenes(model,'YDR035W');
model = removeGenes(model,'YBR249C');
model = removeGenes(model,'YNL241C');
model=changeGeneAssociation(model,'newRxn1','Pa_5_5120');
model=changeGeneAssociation(model,'newRxn2','ECL_01944');
model=changeGeneAssociation(model,'newRxn3','HQD2');
model=changeGeneAssociation(model,'newRxn4','ARO4K229L');
model.geneShortNames(1125)={'Pa_5_5120'};
model.geneShortNames(1126)={'ECL_01944'};
model.geneShortNames(1127)={'HQD2'};
model.geneShortNames(1128)={'ARO4K229L'};
model.enzymes(964)={'3DSD'};
model.enzymes(965)={'A0A0H3CJN8'};
model.enzymes(966)={'P86029'};
model.enzymes(967)={'P32449ly'};
model.enzGenes(964)={'Pa_5_5120'};
model.enzGenes(965)={'ECL_01944'};
model.enzGenes(966)={'HQD2'};
model.enzGenes(967)={'ARO4K229L'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn10');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save eccis_Muconate.mat model

% Resveratrol
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.076*3600;
MW1=56.397;
Kcat2=12.71938*3600;
MW2=61.053;
Kcat3=0.003*3600;
MW3=42.84;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1051','prot_A9B0P2','s_0419','s_4215'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4215','s_0434','s_0529','prot_Q42524','s_0423','s_0633','s_4216'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0794','s_4216','s_1101','prot_P28343','s_0529','s_0456','s_4217'},'stoichCoeffList',[-3 -1 -3 -1/Kcat3 4 4 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_A9B0P2'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'prot_pool','prot_Q42524'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_P28343'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_4217','s_4218'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'s_4218'},'stoichCoeffList',[-1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','Haur_4629');
model=changeGeneAssociation(model,'newRxn2','4CL1');
model=changeGeneAssociation(model,'newRxn3','VST1');
model.geneShortNames(1128)={'Haur_4629'};
model.geneShortNames(1129)={'4CL1'};
model.geneShortNames(1130)={'VST1'};
model.enzymes(964)={'A9B0P2'};
model.enzymes(965)={'Q42524'};
model.enzymes(966)={'P28343'};
model.enzGenes(964)={'Haur_4629'};
model.enzGenes(965)={'4CL1'};
model.enzGenes(966)={'VST1'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.15,'l');
model=changeObjective(model,'newRxn8');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecResveratrol.mat model

% Flavonoids (genistein, kaempferol, quercetin)
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=22*3600;
MW1=77.919;
Kcat2=161.8*3600;
MW2=58.011;
Kcat3=0.10166*3600;
MW3=60.994;
Kcat4=0.006*3600;
MW4=42.488;
Kcat5=139.8477*3600;
MW5=24.679;
Kcat6=12.5*3600;
MW6=56.982;
Kcat7=6.6*3600;
MW7=40.041;
Kcat8=3.9*3600;
MW8=58.93;
MW9=42.673;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1032','prot_P45730','s_0419','s_4219'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0794','s_1275','s_4219','s_1212','prot_C0LUU6','s_0803','s_1207','s_4215'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4215','s_0434','s_0529','prot_C0LUU7','s_0633','s_0423','s_4216'},'stoichCoeffList',[-1 -1 -1 -1/Kcat3 1 1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_4221','prot_Q9M6D6','s_0794','s_4222'},'stoichCoeffList',[-1 -1 3 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_0794','s_4216','s_1101','prot_Q6X0M9','s_0529','s_0456','s_4223'},'stoichCoeffList',[-2 -1 -3 -1/Kcat4 4 3 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_0794','s_4223','prot_C0LUV0','s_4221'},'stoichCoeffList',[-1 -1 -1/Kcat5 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_4221','s_1275','s_0180','prot_Q53B69','s_0456','s_1458','s_4224'},'stoichCoeffList',[-1 -1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'s_0794','s_1275','s_1212','s_4224','prot_Q8W3Y5','s_4225','s_0803','s_1207'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat6 1 1 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'s_4224','s_0180','s_1275','prot_C0LUV3','s_0794','s_0456','s_0803','s_1458','s_4226'},'stoichCoeffList',[-1 -1 -1 -1/Kcat7 1 1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'s_4225','s_0180','s_1275','prot_C0LUV3','s_0794','s_0456','s_0803','s_1458','s_4227'},'stoichCoeffList',[-1 -1 -1 -1/Kcat8 1 1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn11','metaboliteList',{'prot_pool','prot_P45730'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'prot_pool','prot_C0LUU6'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn13','metaboliteList',{'prot_pool','prot_C0LUU7'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn14','metaboliteList',{'prot_pool','prot_Q9M6D6'},'stoichCoeffList',[-MW8 1],'reversible',false);
model = addReaction(model,'newRxn15','metaboliteList',{'prot_pool','prot_Q6X0M9'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn16','metaboliteList',{'prot_pool','prot_C0LUV0'},'stoichCoeffList',[-MW5 1],'reversible',false);
model = addReaction(model,'newRxn17','metaboliteList',{'prot_pool','prot_Q53B69'},'stoichCoeffList',[-MW9 1],'reversible',false);
model = addReaction(model,'newRxn18','metaboliteList',{'prot_pool','prot_Q8W3Y5'},'stoichCoeffList',[-MW6 1],'reversible',false);
model = addReaction(model,'newRxn19','metaboliteList',{'prot_pool','prot_C0LUV3'},'stoichCoeffList',[-MW7 1],'reversible',false);
model = addReaction(model,'newRxn20','metaboliteList',{'s_4227','s_4228'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn21','metaboliteList',{'s_4228'},'stoichCoeffList',[-1],'reversible',false);
model = addReaction(model,'newRxn22','metaboliteList',{'s_4226','s_4229'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn23','metaboliteList',{'s_4229'},'stoichCoeffList',[-1],'reversible',false);
model = addReaction(model,'newRxn24','metaboliteList',{'s_4222','s_4230'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn25','metaboliteList',{'s_4230'},'stoichCoeffList',[-1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','PAL');
model=changeGeneAssociation(model,'newRxn2','C4H');
model=changeGeneAssociation(model,'newRxn3','4CL');
model=changeGeneAssociation(model,'newRxn4','IFS');
model=changeGeneAssociation(model,'newRxn5','CHS');
model=changeGeneAssociation(model,'newRxn6','CHI');
model=changeGeneAssociation(model,'newRxn7','F3H');
model=changeGeneAssociation(model,'newRxn8','F3"H');
model=changeGeneAssociation(model,'newRxn9','FLS');
model=changeGeneAssociation(model,'newRxn10','FLS');
model.geneShortNames(1128)={'PAL'};
model.geneShortNames(1129)={'C4H'};
model.geneShortNames(1130)={'4CL'};
model.geneShortNames(1131)={'IFS'};
model.geneShortNames(1132)={'CHS'};
model.geneShortNames(1133)={'CHI'};
model.geneShortNames(1134)={'F3H'};
model.geneShortNames(1135)={'F3"H'};
model.geneShortNames(1136)={'FLS'};
model.enzymes(964)={'P45730'};
model.enzymes(965)={'C0LUU6'};
model.enzymes(966)={'C0LUU7'};
model.enzymes(967)={'Q9M6D6'};
model.enzymes(968)={'Q6X0M9'};
model.enzymes(969)={'C0LUV0'};
model.enzymes(970)={'Q53B69'};
model.enzymes(971)={'Q8W3Y5'};
model.enzymes(972)={'C0LUV3'};
model.enzGenes(964)={'PAL'};
model.enzGenes(965)={'C4H'};
model.enzGenes(966)={'4CL'};
model.enzGenes(967)={'IFS'};
model.enzGenes(968)={'CHS'};
model.enzGenes(969)={'CHI'};
model.enzGenes(970)={'F3H'};
model.enzGenes(971)={'F3"H'};
model.enzGenes(972)={'FLS'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=1;
model.metComps(4155)=1;
model.metComps(4156)=1;
model.metComps(4157)=1;
model.metComps(4158)=1;
model.metComps(4159)=1;
model.metComps(4160)=1;
model.metComps(4161)=1;
model.metComps(4162)=1;
model.metComps(4163)=1;
model.metComps(4164)=1;
model.metComps(4165)=1;
model.metComps(4166)=3;
model.metComps(4167)=3;
model.metComps(4168)=3;
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn21'); % For ecQuercetin
model=changeRxnBounds(model,'newRxn4',0,'u');
model=changeRxnBounds(model,'newRxn9',0,'u');
model=changeRxnBounds(model,'newRxn14',0,'u');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecQuercetin.mat model
model=changeObjective(model,'newRxn23'); % For ecKaempferol
model=changeRxnBounds(model,'newRxn4',0,'u');
model=changeRxnBounds(model,'newRxn9',Inf,'u');
model=changeRxnBounds(model,'newRxn10',0,'u');
model=changeRxnBounds(model,'newRxn14',0,'u');
FBAsolution=optimizeCbModel(model)
save ecKaempferol.mat model
model=changeObjective(model,'newRxn25'); % For ecGenistein
model=changeRxnBounds(model,'newRxn4',Inf,'u');
model=changeRxnBounds(model,'newRxn14',Inf,'u');
model=changeRxnBounds(model,'newRxn9',0,'u');
model=changeRxnBounds(model,'newRxn10',0,'u');
model=changeRxnBounds(model,'newRxn19',0,'u');
model=changeRxnBounds(model,'newRxn7',0,'u');
model=changeRxnBounds(model,'newRxn8',0,'u');
model=changeRxnBounds(model,'newRxn17',0,'u');
model=changeRxnBounds(model,'newRxn18',0,'u');
FBAsolution=optimizeCbModel(model)
save ecGenistein.mat model

% Trans-cinnamate
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=25.7*3600;
MW1=76.88;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1032','prot_P11544','s_0419','s_4219'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'prot_pool','prot_P11544'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4219','s_4220'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_4220'},'stoichCoeffList',[-1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','PAL');
model.geneShortNames(1128)={'PAL'};
model.enzymes(964)={'P11544'};
model.enzGenes(964)={'PAL'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn4');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecCinnamate.mat model

% p-coumaric acid
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.023*3600;
MW1=56.649;
Kcat2=0.2153*3600;
MW2=39.7487;
Kcat3=0.1339*3600;
MW3=29.7468;
Kcat4=31.9183*3600;
MW4=19.151;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1051','prot_A5FKY3','s_0419','s_4231'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0551','s_0803','s_1360','prot_P32449ly','s_0349','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0515','prot_P32178ly','s_1377'},'stoichCoeffList',[-1 -1/Kcat3 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_0434','s_1429','prot_P0A6E1','s_0261','s_0394','s_0794'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'prot_pool','prot_A5FKY3'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_P32449ly'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'prot_pool','prot_P32178ly'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_P0A6E1'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'s_4231','s_4232'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'s_4232'},'stoichCoeffList',[-1],'reversible',false);
model = removeGenes(model,'YDR380W'); % delete ARO10
model = removeGenes(model,'YLR134W'); % delete PDC5
model=changeGeneAssociation(model,'newRxn1','TAL');
model=changeGeneAssociation(model,'newRxn2','ARO4K229L');
model=changeGeneAssociation(model,'newRxn3','ARO7G141S');
model=changeGeneAssociation(model,'newRxn4','aroL');
model.geneShortNames(1126)={'TAL'};
model.geneShortNames(1127)={'ARO4K229L'};
model.geneShortNames(1128)={'ARO7G141S'};
model.geneShortNames(1129)={'aroL'};
model.enzymes(964)={'A5FKY3'};
model.enzymes(965)={'P32449ly'};
model.enzymes(966)={'P32178ly'};
model.enzymes(967)={'P0A6E1'};
model.enzGenes(964)={'TAL'};
model.enzGenes(965)={'ARO4K229L'};
model.enzGenes(966)={'ARO7G141S'};
model.enzGenes(967)={'aroL'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn10');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecCoumaric_acid.mat model

% Artemisinic acid
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.186*3600;
MW1=63.933;
Kcat2=7.74*3600;
MW2=55.725;
Kcat3=92.5526*3600;
Kcat4=92.4996*3600;
Kcat5=0.825*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0190','prot_Q9AR04','s_0633','s_4233'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0794','s_4233','s_1275','s_1212','prot_Q1PS23','s_0803','s_1207','s_4234'},'stoichCoeffList',[-2 -1 -3 -3 -1/Kcat2 4 3 1],'reversible',false);
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat3 1 1 2],'reversible',false);
model = addReaction(model,'r_0558No2','metaboliteList',{'pmet_r_0558','prot_P12683','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat4 1 1 2],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat5 2 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'prot_pool','prot_Q9AR04'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_Q1PS23'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4234','s_4235'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_4235'},'stoichCoeffList',[-1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','ADS');
model=changeGeneAssociation(model,'newRxn2','CYP71AV1');
model.geneShortNames(1128)={'ADS'};
model.geneShortNames(1129)={'CYP71AV1'};
model.enzymes(964)={'Q9AR04'};
model.enzymes(965)={'Q1PS23'};
model.enzGenes(964)={'ADS'};
model.enzGenes(965)={'CYP71AV1'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn6');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecArtemisinic_acid.mat model

% ��-Carotene
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=8.4*3600;
MW1=42.153;
Kcat2=0.08346*3600;
MW2=74.736;
Kcat3=0.0003*3600;
MW3=65.066;
Kcat4=0.4434*3600;
Kcat5=92.5526*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0190','s_0943','prot_Q1L6K3','s_0633','s_0189'},'stoichCoeffList',[-1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0189','prot_Q7Z859','s_0633','s_4236'},'stoichCoeffList',[-2 -1/Kcat2 2 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4236','prot_Q7Z858','s_4237'},'stoichCoeffList',[-1 -1/Kcat3 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_4237','s_1275','prot_Q7Z858','s_0803','s_4238'},'stoichCoeffList',[-1 -1 -1/Kcat3 2 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4238','prot_Q7Z859','s_4239'},'stoichCoeffList',[-1 -1/Kcat4 1],'reversible',false);
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat5 1 1 2],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_Q1L6K3'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'prot_pool','prot_Q7Z859'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_Q7Z858'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'s_4239','s_4240'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'s_4240'},'stoichCoeffList',[-1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','crtE');
model=changeGeneAssociation(model,'newRxn2','crtYB');
model=changeGeneAssociation(model,'newRxn3','crtI');
model=changeGeneAssociation(model,'newRxn4','crtI');
model=changeGeneAssociation(model,'newRxn5','crtYB');
model.geneShortNames(1128)={'crtE'};
model.geneShortNames(1129)={'crtYB'};
model.geneShortNames(1130)={'crtI'};
model.enzymes(964)={'Q1L6K3'};
model.enzymes(965)={'Q7Z859'};
model.enzymes(966)={'Q7Z858'};
model.enzGenes(964)={'crtE'};
model.enzGenes(965)={'crtYB'};
model.enzGenes(966)={'crtI'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn10');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecbeta_Carotene.mat model

% Linalool + Limonene
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.55*3600;
Kcat2=0.044*3600;
MW2=65.381;
Kcat3=0.186*3600;
MW3=70.348;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0745','s_0803','prot_H9M5U5','s_0633','s_4241'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0745','prot_Q8L5K3','s_0633','s_4243'},'stoichCoeffList',[-1 -1/Kcat3 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'prot_pool','prot_H9M5U5'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_Q8L5K3'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4241','s_4242'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_4242'},'stoichCoeffList',[-1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_4243','s_4244'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'s_4244'},'stoichCoeffList',[-1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','NES1');
model=changeGeneAssociation(model,'newRxn2','ClLIS1');
model.geneShortNames(1128)={'NES1'};
model.geneShortNames(1129)={'ClLIS1'};
model.enzymes(964)={'H9M5U5'};
model.enzymes(965)={'Q8L5K3'};
model.enzGenes(964)={'NES1'};
model.enzGenes(965)={'ClLIS1'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=3;
model.metComps(4152)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.09,'l');
model=changeObjective(model,'newRxn6');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecLinalool.mat model
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn8');
FBAsolution=optimizeCbModel(model)
save ecLimonene.mat model

% 4-hydroxymandelic acid + mandelic acid
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=3.7*3600;
MW1=36.597
Kcat2=0.88*3600;
Kcat3=120*3600;
Kcat4=0.2153*3600;
MW2=39.7487;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0204','s_1275','prot_Q5J1Q8','s_0456','s_4245'},'stoichCoeffList',[-1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0951','s_1275','prot_Q5J1Q8','s_0456','s_4246','s_0794'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'r_0997No1','metaboliteList',{'s_0434','s_1429','prot_P08566','s_0261','s_0394','s_0794'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0551','s_0803','s_1360','prot_P32449ly','s_0349','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_4245','s_4247'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4247'},'stoichCoeffList',[-1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_4246','s_4248'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_4248'},'stoichCoeffList',[-1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_Q5J1Q8'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'prot_pool','prot_P32449ly'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'s_4249','s_0427'},'stoichCoeffList',[-1 1],'reversible',false); % add anthranilate
model = addReaction(model,'newRxn11','metaboliteList',{'s_4249'},'stoichCoeffList',[1],'reversible',false); % add anthranilate
model = removeGenes(model,'YER090W'); % delete TRP2
model = removeGenes(model,'YGL202W'); % delete ARO8
model = removeGenes(model,'YDR380W'); % delete ARO10
model = removeGenes(model,'YLR134W'); % delete PDC5
model=changeGeneAssociation(model,'newRxn1','hmaS');
model=changeGeneAssociation(model,'newRxn2','hmaS');
model=changeGeneAssociation(model,'newRxn3','ARO4K229L');
model.geneShortNames(1124)={'hmaS'};
model.geneShortNames(1125)={'ARO4K229L'};
model.enzymes(964)={'Q5J1Q8'};
model.enzymes(965)={'P32449ly'};
model.enzGenes(964)={'hmaS'};
model.enzGenes(965)={'ARO4K229L'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=3;
model.metComps(4152)=3;
model.metComps(4153)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn5');
model=changeRxnBounds(model,'newRxn11',1,'u'); % add anthranilate
model=changeRxnBounds(model,'r_1903_REV',1,'u'); % add phenylalanine
model=changeRxnBounds(model,'r_0938No1',0,'u'); % for 4-hydroxymandelic acid production
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ec4-hydroxymandelic_acid.mat model
model=changeObjective(model,'newRxn7');
model=changeRxnBounds(model,'r_1903_REV',0,'u'); 
model=changeRxnBounds(model,'r_0938No1',Inf,'u'); 
model=changeRxnBounds(model,'r_0939No1',0,'u'); % for mandelic acid production
model=changeRxnBounds(model,'r_1913_REV',1,'u'); % add tyrosine
FBAsolution=optimizeCbModel(model)
save ecmandelic_acid.mat model

% Oleanolic acid
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.77*3600;
MW1=87.516;
MW2=54.713;
Kcat2=92.4996*3600;
Kcat3=0.152*3600;
Kcat4=3.3*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0037','prot_Q9MB42','s_4250'},'stoichCoeffList',[-1 -1/Kcat1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0794','s_4250','s_1275','s_1212','prot_Q2MJ20','s_0803','s_4251','s_1207'},'stoichCoeffList',[-2 -1 -3 -3 -1 4 1 3],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'prot_pool','prot_Q9MB42'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_Q2MJ20'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4251','s_4252'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn6','metaboliteList',{'s_4252'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_0558No2','metaboliteList',{'pmet_r_0558','prot_P12683','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat2 1 1 2],'reversible',false);
model = addReaction(model,'r_1010No1','metaboliteList',{'s_0795','s_1204','s_1276','s_1448','prot_P32476','s_0038','s_0804','s_1199'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat3 1 1 1],'reversible',false);
model = addReaction(model,'r_1011No1','metaboliteList',{'s_0795','s_1213','s_1276','s_1448','prot_P32476','s_0038','s_0804','s_1208'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat3 1 1 1],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat4 2 1 1],'reversible',false);
model = removeGenes(model,'YBR020W'); % delete GAL1
model=changeGeneAssociation(model,'newRxn1','GgbAS1');
model=changeGeneAssociation(model,'newRxn2','CYP716A12');
model.geneShortNames(1127)={'GgbAS1'};
model.geneShortNames(1128)={'CYP716A12'};
model.enzymes(964)={'Q9MB42'};
model.enzymes(965)={'Q2MJ20'};
model.enzGenes(964)={'GgbAS1'};
model.enzGenes(965)={'CYP716A12'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn6');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecOleanolate.mat model

% Fumaric acid
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=24.0266*3600;
MW1=35.595;
Kcat2=72.4806*3600;
Kcat3=72.4804*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0794','s_1203','s_1271','prot_D6R7B7','s_0066','s_1198'},'stoichCoeffList',[-1 -1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'r_0958No1','metaboliteList',{'pmet_r_0958','prot_P32327','s_0394','s_0794','s_1271','s_1322'},'stoichCoeffList',[-1 -1/Kcat2 1 1 1 1],'reversible',false);
model = addReaction(model,'r_0958No2','metaboliteList',{'pmet_r_0958','prot_P11154','s_0394','s_0794','s_1271','s_1322'},'stoichCoeffList',[-1 -1/Kcat3 1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'prot_pool','prot_D6R7B7'},'stoichCoeffList',[-MW1 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','RoMDH');
model.geneShortNames(1128)={'RoMDH'};
model.enzymes(964)={'D6R7B7'};
model.enzGenes(964)={'RoMDH'};
model.metComps(4147)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'r_1798');
model=changeRxnBounds(model,'r_0714_REVNo1',0,'u'); % block r_0714_REVNo1 (Mdh2p is known to be subject to glucose catabolite inactivation)
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecFumaric_acid.mat model

% Pyruvate
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=57.4246*3600;
MW1=48.872;
Kcat2=167.9*3600;
MW2=51.56;
Kcat3=9.1304*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1275','s_0794','s_1203','prot_A2RIB7','s_0803','s_1198'},'stoichCoeffList',[-1 -3 -1 -1/Kcat1 2 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_1207','s_1203','prot_P27306','s_1212','s_1198'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn2_REV','metaboliteList',{'s_1212','s_1198','prot_P27306','s_1207','s_1203'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'prot_pool','prot_A2RIB7'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_P27306'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = removeGenes(model,'YLR044C');
model = removeGenes(model,'YLR134W');
model = removeGenes(model,'YGR087C');
model=changeGeneAssociation(model,'newRxn1','noxE');
model=changeGeneAssociation(model,'newRxn2','udhA');
model=changeGeneAssociation(model,'newRxn2_REV','udhA');
model.geneShortNames(1125)={'noxE'};
model.geneShortNames(1126)={'udhA'};
model.enzymes(964)={'A2RIB7'};
model.enzymes(965)={'P27306'};
model.enzGenes(964)={'noxE'};
model.enzGenes(965)={'udhA'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.2,'l');
model=changeObjective(model,'r_2033');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecPyruvate.mat model

% Adipic acid
load('eccis_Muconate.mat');
Kcat1=8.376*3600;
MW1=72.835;
model = addReaction(model,'newRxn11','metaboliteList',{'s_4213','s_1203','s_0794','prot_G2TQU6','s_4253','s_1198'},'stoichCoeffList',[-1 -1 -3 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'prot_pool','prot_G2TQU6'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn13','metaboliteList',{'s_4253','s_4254'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn14','metaboliteList',{'s_4254'},'stoichCoeffList',[-1],'reversible',false); 
model=changeGeneAssociation(model,'newRxn11','ERBC');
model.geneShortNames(1129)={'ERBC'};
model.enzymes(968)={'G2TQU6'};
model.enzGenes(968)={'ERBC'};
model.metComps(4155)=1;
model.metComps(4156)=1;
model.metComps(4157)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn14');
model=changeRxnBounds(model,'r_2189_REV',1,'u'); % add oleic acid
model=changeRxnBounds(model,'r_1757_REV',1,'u'); % add ergosterol
model=changeRxnBounds(model,'r_2038_REV',1,'u'); % add riboflavin
model=changeRxnBounds(model,'r_1807_REV',1,'u'); % add glutathione
FBAsolution=optimizeCbModel(model)
save ecAdipic_acid.mat model

% Isobutanol + 3-Methyl-1-Butanol
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=32.2*3600;
Kcat2=16.1*3600;
Kcat3=50*3600;
Kcat4=36.6*3600;
Kcat5=1.96*3600;
Kcat6=1140*3600;
Kcat7=286*3600;
model = addReaction(model,'r_0016No1','metaboliteList',{'pmet_r_0016','prot_P25605','prot_P07342','s_0039','s_0460'},'stoichCoeffList',[-1 -1/57960 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'r_0016No2','metaboliteList',{'pmet_r_0016','prot_P07342','s_0039','s_0460'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'r_0097No1','metaboliteList',{'prot_P25605','prot_P07342','pmet_r_0097','s_0146','s_0460'},'stoichCoeffList',[-1/28980 -1/Kcat2 -1 1 1],'reversible',false);
model = addReaction(model,'r_0097No2','metaboliteList',{'prot_P07342','pmet_r_0097','s_0146','s_0460'},'stoichCoeffList',[-1/Kcat2 -1 1 1],'reversible',false);
model = addReaction(model,'r_0352No1','metaboliteList',{'s_0016','prot_P39522','s_0233','s_0807'},'stoichCoeffList',[-1 -1/Kcat3 1 1],'reversible',false);
model = addReaction(model,'r_0353No1','metaboliteList',{'s_0008','prot_P39522','s_0060','s_0807'},'stoichCoeffList',[-1 -1/Kcat3 1 1],'reversible',false);
model = addReaction(model,'r_0096No1','metaboliteList',{'s_0146','s_0799','s_1214','prot_P06168','s_0016','s_1210'},'stoichCoeffList',[-1 -1 -1 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'r_0669No1','metaboliteList',{'s_0039','s_0799','s_1214','prot_P06168','s_0008','s_1210'},'stoichCoeffList',[-1 -1 -1 -1/Kcat5 1 1],'reversible',false);
model = addReaction(model,'r_0854No1','metaboliteList',{'s_0794','s_0951','prot_Q06408','s_0456','s_1318'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1],'reversible',false);
model = addReaction(model,'r_0163No1','metaboliteList',{'s_0680','s_1198','prot_P00331','s_0359','s_0794','s_1203'},'stoichCoeffList',[-1 -1 -1/Kcat7 1 1 1],'reversible',false);
model = removeGenes(model,'YPL061W'); % delete ALD6
model = removeGenes(model,'YHR208W'); % delete BAT1
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'r_1866');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecIsobutanol.mat model
Kcat8=27.58*3600
model = addReaction(model,'r_0024No1','metaboliteList',{'pmet_r_0024','prot_P06208','s_0162','s_0529','s_0794'},'stoichCoeffList',[-1 -1/Kcat8 1 1 1],'reversible',false);
model = addReaction(model,'r_0025No1','metaboliteList',{'s_0233','s_0376','s_0807','prot_P06208','s_0164','s_0532','s_0799'},'stoichCoeffList',[-1 -1 -1 -1/Kcat8 1 1 1],'reversible',false);
model=changeObjective(model,'r_1598');
FBAsolution=optimizeCbModel(model)
save ec3-methylbutanol.mat model

% Naringenin
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=1.8*3600;
MW1=78.726;
Kcat2=1.72*3600;
MW2=57.792;
MW3=23.332;
Kcat4=0.001*3600;
MW4=43.116;
Kcat5=0.84*3600;
MW5=61.311;
Kcat6=27.7*3600;
MW6=55.539;
Kcat7=7.9*3600;
MW7=39.7487;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1032','prot_P35510','s_0419','s_4219'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0794','s_1275','s_4219','s_1212','prot_P92994','s_0803','s_1207','s_4215'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0794','s_4223','prot_Q8VZW3','s_4221'},'stoichCoeffList',[-1 -1 -1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_0794','s_4216','s_1101','prot_P13114','s_0529','s_0456','s_4223'},'stoichCoeffList',[-2 -1 -3 -1/Kcat4 4 3 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4215','s_0434','s_0529','prot_Q9S777','s_0633','s_0423','s_4216'},'stoichCoeffList',[-1 -1 -1 -1/Kcat5 1 1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_1051','prot_A0A1M4NET9','s_0419','s_4215'},'stoichCoeffList',[-1 -1/Kcat6 1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_0551','s_0803','s_1360','prot_P32449ly','s_0349','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat7 1 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_P35510'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'prot_pool','prot_P92994'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'prot_pool','prot_Q8VZW3'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn11','metaboliteList',{'prot_pool','prot_P13114'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'prot_pool','prot_Q9S777'},'stoichCoeffList',[-MW5 1],'reversible',false);
model = addReaction(model,'newRxn13','metaboliteList',{'prot_pool','prot_A0A1M4NET9'},'stoichCoeffList',[-MW6 1],'reversible',false);
model = addReaction(model,'newRxn14','metaboliteList',{'prot_pool','prot_P32449ly'},'stoichCoeffList',[-MW7 1],'reversible',false);
model = addReaction(model,'newRxn15','metaboliteList',{'s_4221','s_4255'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn16','metaboliteList',{'s_4255'},'stoichCoeffList',[-1],'reversible',false); 
model = removeGenes(model,'YDR035W'); % delete ARO3
model = removeGenes(model,'YBR249C'); % delete ARO4
model = removeGenes(model,'YDR380W'); % delete ARO10
model = removeGenes(model,'YLR134W'); % delete PDC5
model = removeGenes(model,'YGR087C'); % delete PDC5
model=changeGeneAssociation(model,'newRxn1','PAL1');
model=changeGeneAssociation(model,'newRxn2','C4H');
model=changeGeneAssociation(model,'newRxn3','CHI1');
model=changeGeneAssociation(model,'newRxn4','CHS3');
model=changeGeneAssociation(model,'newRxn5','4CL3');
model=changeGeneAssociation(model,'newRxn6','TAL');
model=changeGeneAssociation(model,'newRxn7','ARO4G226S');
model.geneShortNames(1123)={'PAL1'};
model.geneShortNames(1124)={'C4H'};
model.geneShortNames(1125)={'CHI1'};
model.geneShortNames(1126)={'CHS3'};
model.geneShortNames(1127)={'4CL3'};
model.geneShortNames(1128)={'TAL'};
model.geneShortNames(1129)={'ARO4G226S'};
model.enzymes(964)={'P35510'};
model.enzymes(965)={'P92994'};
model.enzymes(966)={'Q8VZW3'};
model.enzymes(967)={'P13114'};
model.enzymes(968)={'Q9S777'};
model.enzymes(969)={'A0A1M4NET9'};
model.enzymes(970)={'P32449ly'};
model.enzGenes(964)={'PAL1'};
model.enzGenes(965)={'C4H'};
model.enzGenes(966)={'CHI1'};
model.enzGenes(967)={'CHS3'};
model.enzGenes(968)={'4CL3'};
model.enzGenes(969)={'TAL'};
model.enzGenes(970)={'ARO4G226S'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=1;
model.metComps(4155)=1;
model.metComps(4156)=1;
model.metComps(4157)=1;
model.metComps(4158)=1;
model.metComps(4159)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.2,'l');
model=changeObjective(model,'newRxn16');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecNarinrenin.mat model

% Catechin
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=3.2*3600;
MW1=77.86;
Kcat2=1.72*3600;
MW2=57.937;
Kcat3=671000*3600;
MW3=23.826;
Kcat4=0.042*3600;
MW4=42.713;
Kcat5=3*3600;
MW5=60.842;
Kcat6=17*3600;
MW6=56.936;
MW7=40.771;
Kcat8=27.6053*3600;
MW8=38.699;
Kcat9=0.065*3600;
MW9=38.019;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1032','prot_P45724','s_0419','s_4219'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0794','s_1275','s_4219','s_1212','prot_Q84TQ4','s_0803','s_1207','s_4215'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0794','s_4223','prot_P28012','s_4221'},'stoichCoeffList',[-1 -1 -1/Kcat3 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_0794','s_4216','s_1101','prot_Q9FUB7','s_0529','s_0456','s_4223'},'stoichCoeffList',[-2 -1 -3 -1/Kcat4 4 3 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4215','s_0434','s_0529','prot_Q9S725','s_0633','s_0423','s_4216'},'stoichCoeffList',[-1 -1 -1 -1/Kcat5 1 1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_0794','s_1275','s_4221','s_1212','prot_Q9SBQ9','s_4256','s_0803','s_1207'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat6 1 1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_4256','s_0180','s_1275','prot_Q06942','s_4257','s_1458','s_0456'},'stoichCoeffList',[-1 -1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'s_4257','s_1212','s_0794','prot_B9GRL5','s_4258','s_1207'},'stoichCoeffList',[-1 -1 -1 -1/Kcat8 1 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'s_4258','s_1212','s_0794','prot_Q4W2K4','s_4259','s_1207','s_0803'},'stoichCoeffList',[-1 -1 -1 -1/Kcat9 1 1 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'prot_pool','prot_P45724'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn11','metaboliteList',{'prot_pool','prot_Q84TQ4'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'prot_pool','prot_P28012'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn13','metaboliteList',{'prot_pool','prot_Q9FUB7'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn14','metaboliteList',{'prot_pool','prot_Q9S725'},'stoichCoeffList',[-MW5 1],'reversible',false);
model = addReaction(model,'newRxn15','metaboliteList',{'prot_pool','prot_Q9SBQ9'},'stoichCoeffList',[-MW6 1],'reversible',false);
model = addReaction(model,'newRxn16','metaboliteList',{'prot_pool','prot_Q06942'},'stoichCoeffList',[-MW7 1],'reversible',false);
model = addReaction(model,'newRxn17','metaboliteList',{'prot_pool','prot_B9GRL5'},'stoichCoeffList',[-MW8 1],'reversible',false);
model = addReaction(model,'newRxn18','metaboliteList',{'prot_pool','prot_Q4W2K4'},'stoichCoeffList',[-MW9 1],'reversible',false);
model = addReaction(model,'newRxn19','metaboliteList',{'s_4259','s_4260'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn20','metaboliteList',{'s_4260'},'stoichCoeffList',[-1],'reversible',false); 
model=changeGeneAssociation(model,'newRxn1','PAL2');
model=changeGeneAssociation(model,'newRxn2','C4H');
model=changeGeneAssociation(model,'newRxn3','CHI');
model=changeGeneAssociation(model,'newRxn4','CHS');
model=changeGeneAssociation(model,'newRxn5','4CL2');
model=changeGeneAssociation(model,'newRxn6','F3��H');
model=changeGeneAssociation(model,'newRxn7','F3H');
model=changeGeneAssociation(model,'newRxn8','DFR');
model=changeGeneAssociation(model,'newRxn9','LAR');
model.geneShortNames(1128)={'PAL2'};
model.geneShortNames(1129)={'C4H'};
model.geneShortNames(1130)={'CHI'};
model.geneShortNames(1131)={'CHS'};
model.geneShortNames(1132)={'4CL2'};
model.geneShortNames(1133)={'F3��H'};
model.geneShortNames(1134)={'F3H'};
model.geneShortNames(1135)={'DFR'};
model.geneShortNames(1136)={'LAR'};
model.enzymes(964)={'P45724'}; 
model.enzymes(965)={'Q84TQ4'};
model.enzymes(966)={'P28012'};
model.enzymes(967)={'Q9FUB7'};
model.enzymes(968)={'Q9S725'};
model.enzymes(969)={'Q9SBQ9'};
model.enzymes(970)={'Q06942'};
model.enzymes(971)={'B9GRL5'};
model.enzymes(972)={'Q4W2K4'};
model.enzGenes(964)={'PAL2'};
model.enzGenes(965)={'C4H'};
model.enzGenes(966)={'CHI'};
model.enzGenes(967)={'CHS'};
model.enzGenes(968)={'4CL2'};
model.enzGenes(969)={'F3��H'};
model.enzGenes(970)={'F3H'};
model.enzGenes(971)={'DFR'};
model.enzGenes(972)={'LAR'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=1;
model.metComps(4155)=1;
model.metComps(4156)=1;
model.metComps(4157)=1;
model.metComps(4158)=1;
model.metComps(4159)=1;
model.metComps(4160)=1;
model.metComps(4161)=1;
model.metComps(4162)=1;
model.metComps(4163)=1;
model.metComps(4164)=1;
model.metComps(4165)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn20');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecCatechin.mat model

% Amorphadiene
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.518*3600;
MW1=63.933;
Kcat2=92.5526*3600;
Kcat3=6.8*3600;
Kcat4=1800*3600;
Kcat5=10000000*3600;
Kcat6=43.8001*3600;
Kcat7=0.83*3600;
Kcat8=9.8*3600;
Kcat9=2.2*3600;
Kcat10=59800*3600;
Kcat11=0.1212*3600;
Kcat12=0.825*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0190','prot_Q9AR04','s_4261','s_0633'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat2 1 1 2],'reversible',false);
model = addReaction(model,'r_0904No1','metaboliteList',{'s_0019','s_0434','prot_P24521','s_0018','s_0394'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1],'reversible',false);
model = addReaction(model,'r_0103No1','metaboliteList',{'s_0373','prot_P41338','s_0367','s_0529'},'stoichCoeffList',[-2 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'r_0104No1','metaboliteList',{'s_0376','prot_P41338','s_0370','s_0532'},'stoichCoeffList',[-2 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'r_0103_REVNo1','metaboliteList',{'s_0367','s_0529','prot_P41338','s_0373'},'stoichCoeffList',[-1 -1 -1/Kcat5 2],'reversible',false);
model = addReaction(model,'r_0104_REVNo1','metaboliteList',{'s_0370','s_0532','prot_P41338','s_0376'},'stoichCoeffList',[-1 -1 -1/Kcat5 2],'reversible',false);
model = addReaction(model,'r_0735No1','metaboliteList',{'s_0028','s_0434','prot_P07277','s_0019','s_0394','s_0794'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1 1],'reversible',false);
model = addReaction(model,'r_0736No1','metaboliteList',{'s_0028','s_0539','prot_P07277','s_0019','s_0467','s_0794'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1 1],'reversible',false);
model = addReaction(model,'r_0737No1','metaboliteList',{'s_0028','s_0785','prot_P07277','s_0019','s_0739','s_0794'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1 1],'reversible',false);
model = addReaction(model,'r_0738No1','metaboliteList',{'s_0028','s_1559','prot_P07277','s_0019','s_1538','s_0794'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1 1],'reversible',false);
model = addReaction(model,'r_0559No1','metaboliteList',{'s_0367','s_0373','s_0803','prot_P54839','s_0218','s_0529','s_0794'},'stoichCoeffList',[-1 -1 -1 -1/Kcat7 1 1 1],'reversible',false);
model = addReaction(model,'r_0560No1','metaboliteList',{'s_0370','s_0376','s_0807','prot_P54839','s_0221','s_0532','s_0799'},'stoichCoeffList',[-1 -1 -1 -1/Kcat7 1 1 1],'reversible',false);
model = addReaction(model,'r_0739No1','metaboliteList',{'s_0018','s_0434','prot_P32377','s_0394','s_0456','s_0943','s_1322'},'stoichCoeffList',[-1 -1 -1/Kcat8 1 1 1 1],'reversible',false);
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat9 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat9 1 1],'reversible',false);
model = addReaction(model,'r_0667No1','metaboliteList',{'s_0943','prot_P15496','s_1376'},'stoichCoeffList',[-1 -1/Kcat10 1],'reversible',false);
model = addReaction(model,'r_0667_REVNo1','metaboliteList',{'s_1376','prot_P15496','s_0943'},'stoichCoeffList',[-1 -1/Kcat11 1],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat12 2 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'prot_pool','prot_Q9AR04'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4261','s_4262'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4262'},'stoichCoeffList',[-1],'reversible',false); 
model = removeGenes(model,'YBR020W'); % delete GAL1
model = removeGenes(model,'YBR018C'); % delete GAL7
model = removeGenes(model,'YBR019C'); % delete GAL10
model=changeGeneAssociation(model,'newRxn1','ADS');
model.geneShortNames(1125)={'ADS'};
model.enzymes(964)={'Q9AR04'};
model.enzGenes(964)={'ADS'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn4');
model=changeRxnBounds(model,'r_1710_REV',1,'u'); % add galactose
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecAmorphadiene.mat model

% Ginsenosides (protopanaxadiol)
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
MW1=88.343;
MW2=55.356;
Kcat1=92.5526*3600;
Kcat2=0.152*3600;
Kcat3=3.3*3600;
Kcat4=2.2*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0037','s_0803','prot_Q08IT1','s_4263'},'stoichCoeffList',[-1 -1 -1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0794','s_1275','s_4263','s_1212','prot_H2DH16','s_4264','s_0803','s_1207'},'stoichCoeffList',[-1 -1 -1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'prot_pool','prot_Q08IT1'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_H2DH16'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4264','s_4265'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn6','metaboliteList',{'s_4265'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat1 1 1 2],'reversible',false);
model = addReaction(model,'r_1010No1','metaboliteList',{'s_0795','s_1204','s_1276','s_1448','prot_P32476','s_0038','s_0804','s_1199'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'r_1011No1','metaboliteList',{'s_0795','s_1213','s_1276','s_1448','prot_P32476','s_0038','s_0804','s_1208'},'stoichCoeffList',[-1 -1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat3 2 1 1],'reversible',false);
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','DDS');
model=changeGeneAssociation(model,'newRxn2','PPDS');
model.geneShortNames(1128)={'DDS'};
model.geneShortNames(1129)={'PPDS'};
model.enzymes(964)={'Q08IT1'};
model.enzymes(965)={'H2DH16'};
model.enzGenes(964)={'DDS'};
model.enzGenes(965)={'PPDS'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn6');
model=changeRxnBounds(model,'r_1900_REV',1,'u'); % add lysine
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecProtopanaxadiol.mat model

% Monoterpenoids (geraniol)
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=1*3600;
MW1=67.728;
Kcat2=92.5526*3600;
Kcat3=59800*3600;
Kcat4=0.1212*3600;
Kcat5=2.2*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0745','s_0803','prot_J9PZR5','s_4266','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'prot_pool','prot_J9PZR5'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4266','s_4267'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4267'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat2 1 1 2],'reversible',false);
model = addReaction(model,'r_0667No1','metaboliteList',{'s_0943','prot_P15496','s_1376'},'stoichCoeffList',[-1 -1/Kcat3 1],'reversible',false);
model = addReaction(model,'r_0667_REVNo1','metaboliteList',{'s_1376','prot_P15496','s_0943'},'stoichCoeffList',[-1 -1/Kcat4 1],'reversible',false);
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','GES');
model.geneShortNames(1128)={'GES'};
model.enzymes(964)={'J9PZR5'};
model.enzGenes(964)={'GES'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.31,'l');
model=changeObjective(model,'newRxn4');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecGeraniol.mat model 

% Sesquiterpenoids (patchoulol)
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.00043*3600;
MW1=64.199;
Kcat2=92.5526*3600;
Kcat3=59800*3600;
Kcat4=0.1212*3600;
Kcat5=2.2*3600;
Kcat6=0.825*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0190','s_0803','prot_Q49SP3','s_4268','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'prot_pool','prot_Q49SP3'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4268','s_4269'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4269'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat2 1 1 2],'reversible',false);
model = addReaction(model,'r_0667No1','metaboliteList',{'s_0943','prot_P15496','s_1376'},'stoichCoeffList',[-1 -1/Kcat3 1],'reversible',false);
model = addReaction(model,'r_0667_REVNo1','metaboliteList',{'s_1376','prot_P15496','s_0943'},'stoichCoeffList',[-1 -1/Kcat4 1],'reversible',false);
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat6 2 1 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','PTS');
model.geneShortNames(1128)={'PTS'};
model.enzymes(964)={'Q49SP3'};
model.enzGenes(964)={'PTS'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn4');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecPatchoulol.mat model 

% Triterpenoids (lupeol)
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
MW1=86.705;
Kcat1=92.5526*3600;
Kcat2=0.83*3600;
Kcat3=2.0382*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0037','prot_A0A3B1EU92','s_4270'},'stoichCoeffList',[-1 -1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'prot_pool','prot_A0A3B1EU92'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4270','s_4271'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4271'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat1 1 1 2],'reversible',false);
model = addReaction(model,'r_0559No1','metaboliteList',{'s_0367','s_0373','s_0803','prot_P54839','s_0218','s_0529','s_0794'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'r_0560No1','metaboliteList',{'s_0370','s_0376','s_0807','prot_P54839','s_0221','s_0532','s_0799'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'r_0698No1','metaboliteList',{'s_0037','prot_P38604','s_1059'},'stoichCoeffList',[-1 -1/Kcat3 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','LUP');
model.geneShortNames(1128)={'LUP'};
model.enzymes(964)={'A0A3B1EU92'};
model.enzGenes(964)={'LUP'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn4');
model=changeRxnBounds(model,'r_1710_REV',1,'u'); % add galactose
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecLupeol.mat model

% ��-Amyrin
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
MW1=87.516;
MW2=55.298;
MW3=20.508;
Kcat1=0.77*3600;
Kcat2=3.3*3600;
Kcat3=2.2*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0037','prot_Q9MB42','s_4272'},'stoichCoeffList',[-1 -1/Kcat1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0795','s_1204','s_1276','s_1448','prot_Q92206','s_0038','s_0804','s_1199'},'stoichCoeffList',[-1 -1 -1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0795','s_1213','s_1276','s_1448','prot_Q92206','s_0038','s_0804','s_1208'},'stoichCoeffList',[-1 -1 -1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_0943','prot_Q46822','s_1376'},'stoichCoeffList',[-1 -1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_1376','prot_Q46822','s_0943'},'stoichCoeffList',[-1 -1 1],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat2 2 1 1],'reversible',false);
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_Q9MB42'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'prot_pool','prot_Q92206'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_Q46822'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'s_4272','s_4273'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn10','metaboliteList',{'s_4273'},'stoichCoeffList',[-1],'reversible',false); 
model=changeGeneAssociation(model,'newRxn1','bAS');
model=changeGeneAssociation(model,'newRxn2','CaERG1');
model=changeGeneAssociation(model,'newRxn3','CaERG1');
model=changeGeneAssociation(model,'newRxn4','EcIDI');
model=changeGeneAssociation(model,'newRxn5','EcIDI');
model.geneShortNames(1128)={'bAS'};
model.geneShortNames(1129)={'CaERG1'};
model.geneShortNames(1130)={'EcIDI'};
model.enzymes(964)={'Q9MB42'};
model.enzymes(965)={'Q92206'};
model.enzymes(966)={'Q46822'};
model.enzGenes(964)={'bAS'};
model.enzGenes(965)={'CaERG1'};
model.enzGenes(966)={'EcIDI'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn10');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecbeta_Amyrin.mat model 

% Carotenoids (astaxanthin)
load('ecbeta_Carotene.mat');
MW1=35.989;
MW2=32.017;
model = addReaction(model,'newRxn11','metaboliteList',{'s_4239','s_1275','prot_Q39982','s_4276','s_0803'},'stoichCoeffList',[-1 -1 -1 1 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'s_4276','s_1275','prot_Q39982','s_4277','s_0803'},'stoichCoeffList',[-1 -1 -1 1 1],'reversible',false);
model = addReaction(model,'newRxn13','metaboliteList',{'s_0794','s_1203','s_4277','s_1275','prot_A0A0K0P8J8','s_0803','s_4278','s_1198'},'stoichCoeffList',[-1 -1 -1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn14','metaboliteList',{'s_0794','s_1203','s_4278','s_1275','prot_A0A0K0P8J8','s_0803','s_4279','s_1198'},'stoichCoeffList',[-1 -1 -1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn15','metaboliteList',{'prot_pool','prot_Q39982'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn16','metaboliteList',{'prot_pool','prot_A0A0K0P8J8'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn17','metaboliteList',{'s_4279','s_4280'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn18','metaboliteList',{'s_4280'},'stoichCoeffList',[-1],'reversible',false); 
model=changeGeneAssociation(model,'newRxn11','bkt');
model=changeGeneAssociation(model,'newRxn12','bkt');
model=changeGeneAssociation(model,'newRxn13','crtZ');
model=changeGeneAssociation(model,'newRxn14','crtZ');
model.geneShortNames(1131)={'bkt'};
model.geneShortNames(1132)={'crtZ'};
model.enzymes(967)={'Q39982'};
model.enzymes(968)={'A0A0K0P8J8'};
model.enzGenes(967)={'bkt'};
model.enzGenes(968)={'crtZ'};
model.metComps(4155)=1;
model.metComps(4156)=1;
model.metComps(4157)=1;
model.metComps(4158)=1;
model.metComps(4159)=1;
model.metComps(4160)=1;
model.metComps(4161)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn18');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecAstaxanthin.mat model 

% Farnesene + Santalene
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
MW1=66.183;
Kcat1=0.0613*3600;
MW2=63.937;
Kcat2=0.075*3600;
Kcat3=92.5526*3600;
Kcat4=2.2*3600;
Kcat5=0.825*3600;
Kcat6=47.9999*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0190','prot_Q84LB2','s_4281','s_0633'},'stoichCoeffList',[-1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'prot_pool','prot_Q84LB2'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4281','s_4282'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4282'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn5','metaboliteList',{'s_0190','prot_E5LLI1','s_4283','s_0633'},'stoichCoeffList',[-1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_E5LLI1'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_4283','s_4284'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn8','metaboliteList',{'s_4284'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat3 1 1 2],'reversible',false);
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat5 2 1 1],'reversible',false);
model = addReaction(model,'r_0470No1','metaboliteList',{'s_0803','s_0991','s_1198','prot_P33327','s_0180','s_0419','s_0794','s_1203'},'stoichCoeffList',[-1 -1 -1 -1/Kcat6 1 1 1 1],'reversible',false);
model = removeGenes(model,'YDR503C'); % delete LPP1
model = removeGenes(model,'YDR284C'); % delete DPP1
model = removeGenes(model,'YOR375C'); % delete GDH1
model=changeGeneAssociation(model,'newRxn1','AFS');
model=changeGeneAssociation(model,'newRxn5','SAS');
model.geneShortNames(1125)={'AFS'};
model.geneShortNames(1126)={'SAS'};
model.enzymes(964)={'Q84LB2'};
model.enzymes(965)={'E5LLI1'};
model.enzGenes(964)={'AFS'};
model.enzGenes(965)={'SAS'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.043,'l');
model=changeObjective(model,'newRxn4'); % for farnesene production
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecFarnesene.mat model
model=changeObjective(model,'newRxn8'); % for santalene production
model=changeRxnBounds(model,'r_2111',0.05,'l');
FBAsolution=optimizeCbModel(model)
save ecSantalene.mat model

% Lactase
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat2=0.6516; 
Kcat3=0.2643; 
Kcat4=0.5013; 
Kcat5=0.4921; 
Kcat6=0.0547; 
Kcat7=0.4375; 
Kcat8=0.2552; 
Kcat9=0.9114; 
Kcat10=0.1276; 
Kcat11=0.4466; 
Kcat12=0.8567; 
Kcat13=0.4192; 
Kcat14=0.0638; 
Kcat15=0.3645; 
Kcat16=0.4921; 
Kcat17=0.8567; 
Kcat18=0.7109; 
Kcat19=0.1823; 
Kcat20=0.5377; 
Kcat21=0.5559; 
model = addReaction(model,'newRxn2','metaboliteList',{'s_4285','s_4286'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4286'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn1','metaboliteList',{'s_0955','s_0965','s_0969','s_0973','s_0981','s_0991','s_0999','s_1003','s_1006','s_1016','s_1021','s_1025',...
    's_1029','s_1032','s_1035','s_1039','s_1045','s_1048','s_1051','s_1056','s_0785','s_4285','s_0739','s_1322'},'stoichCoeffList',[-Kcat2 -Kcat3 -Kcat4 -Kcat5 -Kcat6...
    -Kcat7 -Kcat8 -Kcat9 -Kcat10 -Kcat11 -Kcat12 -Kcat13 -Kcat14 -Kcat15 -Kcat16 -Kcat17 -Kcat18 -Kcat19 -Kcat20 -Kcat21 -2.01 1 2.01 2.01],'reversible',false);
model.metComps(4147)=1;
model.metComps(4148)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.18,'l');
model=changeObjective(model,'newRxn3');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecLactase.mat model 

% L-ornithine 
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=109.0489*3600;
MW1=49.195;
Kcat2=0.24444*3600;
MW2=27.16;
MW3=35.888;
MW4=41.206;
Kcat5=0.0099285*3600;
MW5=39.714;
Kcat6=0.1816*3600;
MW6=31.52;
Kcat7=0.01318*3600;
MW7=104.304;
Kcat8=106.66*3600;
Kcat9=41*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0373','s_0991','prot_P0A6C5','s_0529','s_4173'},'stoichCoeffList',[-1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0434','s_4173','prot_P0A6C8','s_0394','s_4288'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4288','s_1212','s_0794','prot_Q59279','s_1207','s_1322','s_4289'},'stoichCoeffList',[-1 -1 -1 -1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4289','s_0991','prot_Q59282','s_4290','s_0180'},'stoichCoeffList',[-1 -1 -1 1 1],'reversible',false); 
model = addReaction(model,'newRxn5','metaboliteList',{'s_4290','s_0991','prot_Q59280','s_1266','s_4173'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false); 
model = addReaction(model,'r_1237','metaboliteList',{'s_0794','s_1268','prot_Q12375','s_0799','s_1266'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1],'reversible',false); 
model = addReaction(model,'r_1118','metaboliteList',{'s_0975','s_0991','prot_Q12482','s_0973','s_0993'},'stoichCoeffList',[-1 -1 -1/Kcat7 1 1],'reversible',false); 
model = addReaction(model,'r_0471No2','metaboliteList',{'pmet_r_0471','prot_P07262','s_0803','s_0991','s_1207'},'stoichCoeffList',[-1 -1/Kcat8 1 1 1],'reversible',false); 
model = addReaction(model,'r_0816No1','metaboliteList',{'s_0455','s_1266','prot_P05150','s_0794','s_0979','s_1322'},'stoichCoeffList',[-1 -1 -1/Kcat9 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_P0A6C5'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'prot_pool','prot_P0A6C8'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_Q59279'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'prot_pool','prot_Q59282'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'prot_pool','prot_Q59280'},'stoichCoeffList',[-MW5 1],'reversible',false);
model = addReaction(model,'newRxn11','metaboliteList',{'prot_pool','prot_Q12375'},'stoichCoeffList',[-MW6 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'prot_pool','prot_Q12482'},'stoichCoeffList',[-MW7 1],'reversible',false);
model = removeGenes(model,'YLR438W'); % delete CAR2
model=changeGeneAssociation(model,'newRxn1','argA');
model=changeGeneAssociation(model,'newRxn2','argB');
model=changeGeneAssociation(model,'newRxn3','argC');
model=changeGeneAssociation(model,'newRxn4','argD');
model=changeGeneAssociation(model,'newRxn5','argJ');
model=changeGeneAssociation(model,'r_1237','ORT1');
model=changeGeneAssociation(model,'r_1118','AGC1');
model.geneShortNames(1127)={'argA'};
model.geneShortNames(1128)={'argB'};
model.geneShortNames(1129)={'argC'};
model.geneShortNames(1130)={'argD'};
model.geneShortNames(1131)={'argJ'};
model.geneShortNames(1132)={'ORT1'};
model.geneShortNames(1133)={'AGC1'};
model.enzymes(964)={'P0A6C5'};
model.enzymes(965)={'P0A6C8'};
model.enzymes(966)={'Q59279'};
model.enzymes(967)={'Q59282'};
model.enzymes(968)={'Q59280'};
model.enzymes(969)={'Q12375'};
model.enzymes(970)={'Q12482'};
model.enzGenes(964)={'argA'};
model.enzGenes(965)={'argB'};
model.enzGenes(966)={'argC'};
model.enzGenes(967)={'argD'};
model.enzGenes(968)={'argJ'};
model.enzGenes(969)={'ORT1'};
model.enzGenes(970)={'AGC1'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=1;
model.metComps(4155)=1;
model.metComps(4156)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'r_1987');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecOrnithine.mat model

% (S)-reticuline
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
MW1=56.212;
Kcat2=1.8*3600;
MW2=51.444;
Kcat3=11*3600;
MW3=71.384;
Kcat4=5.8*3600;
MW4=26.001;
Kcat5=0.08*3600;
MW5=38.511;
Kcat6=0.00048*3600;
MW6=41.032;
MW7=54.644;
Kcat8=0.07187*3600;
MW8=39.402;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1275','s_1051','prot_I3PFJ5','s_4291'},'stoichCoeffList',[-1 -2 -1 2],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4291','s_0794','prot_Q88JU5','s_0456','s_4292'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0204','s_0794','prot_Q06408','s_0456','s_4293'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4292','s_4293','prot_B6E2Z2','s_0803','s_4294'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1],'reversible',false); 
model = addReaction(model,'newRxn5','metaboliteList',{'s_4294','s_1416','prot_Q6WUC1','s_1413','s_4295'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false); 
model = addReaction(model,'newRxn6','metaboliteList',{'s_4295','s_1416','prot_Q7XB08','s_1413','s_0794','s_4296'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn7','metaboliteList',{'s_4296','s_0794','s_1275','s_1212','prot_O64899','s_0803','s_1207','s_4297'},'stoichCoeffList',[-1 -1 -1 -1 -1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn8','metaboliteList',{'s_4297','s_1416','prot_Q7XB11','s_1413','s_0794','s_4298'},'stoichCoeffList',[-1 -1 -1/Kcat8 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn9','metaboliteList',{'prot_pool','prot_I3PFJ5'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'prot_pool','prot_Q88JU5'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn11','metaboliteList',{'prot_pool','prot_Q06408'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'prot_pool','prot_B6E2Z2'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn13','metaboliteList',{'prot_pool','prot_Q6WUC1'},'stoichCoeffList',[-MW5 1],'reversible',false);
model = addReaction(model,'newRxn14','metaboliteList',{'prot_pool','prot_Q7XB08'},'stoichCoeffList',[-MW6 1],'reversible',false);
model = addReaction(model,'newRxn15','metaboliteList',{'prot_pool','prot_O64899'},'stoichCoeffList',[-MW7 1],'reversible',false);
model = addReaction(model,'newRxn16','metaboliteList',{'prot_pool','prot_Q7XB11'},'stoichCoeffList',[-MW8 1],'reversible',false);
model = addReaction(model,'newRxn17','metaboliteList',{'s_4298','s_4299'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn18','metaboliteList',{'s_4299'},'stoichCoeffList',[-1],'reversible',false); 
model=changeGeneAssociation(model,'newRxn1','CYP76AD1');
model=changeGeneAssociation(model,'newRxn2','DODC');
model=changeGeneAssociation(model,'newRxn3','YDR380W');
model=changeGeneAssociation(model,'newRxn4','NCS');
model=changeGeneAssociation(model,'newRxn5','6OMT');
model=changeGeneAssociation(model,'newRxn6','CNMT');
model=changeGeneAssociation(model,'newRxn7','CYP80B1');
model=changeGeneAssociation(model,'newRxn8','4"OMT');
model.geneShortNames(1128)={'CYP76AD1'};
model.geneShortNames(1129)={'DODC'};
model.geneShortNames(1130)={'NCS'};
model.geneShortNames(1131)={'6OMT'};
model.geneShortNames(1132)={'CNMT'};
model.geneShortNames(1133)={'CYP80B1'};
model.geneShortNames(1134)={'4"OMT'};
model.enzymes(964)={'I3PFJ5'};
model.enzymes(965)={'Q88JU5'};
model.enzymes(966)={'B6E2Z2'};
model.enzymes(967)={'Q6WUC1'};
model.enzymes(968)={'Q7XB08'};
model.enzymes(969)={'O64899'};
model.enzymes(970)={'Q7XB11'};
model.enzGenes(964)={'CYP76AD1'};
model.enzGenes(965)={'DODC'};
model.enzGenes(966)={'NCS'};
model.enzGenes(967)={'6OMT'};
model.enzGenes(968)={'CNMT'};
model.enzGenes(969)={'CYP80B1'};
model.enzGenes(970)={'4"OMT'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=1;
model.metComps(4155)=1;
model.metComps(4156)=1;
model.metComps(4157)=1;
model.metComps(4158)=1;
model.metComps(4159)=1;
model.metComps(4160)=1;
model.metComps(4161)=1;
model.metComps(4162)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn18');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ec(S)-reticuline.mat model 

% ��-ionone
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.08346*3600;
MW1=74.736;
Kcat2=0.0003*3600;
MW2=65.066;
Kcat4=0.4434*3600;
MW5=61.311;
Kcat6=2.2*3600; 
Kcat7=0.825*3600;
Kcat8=92.5526*3600;
Kcat9=6.6*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0189','prot_Q7Z859','s_0633','s_4236'},'stoichCoeffList',[-2 -1/Kcat1 2 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4236','prot_Q7Z858','s_4237'},'stoichCoeffList',[-1 -1/Kcat2 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4237','s_1275','prot_Q7Z858','s_0803','s_4238'},'stoichCoeffList',[-1 -1 -1/Kcat2 2 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_4238','prot_Q7Z859','s_4239'},'stoichCoeffList',[-1 -1/Kcat4 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_4239','s_1275','prot_Q6E4P3','s_4300','s_4301'},'stoichCoeffList',[-1 -2 -1 1 2],'reversible',false); 
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1],'reversible',false);
model = addReaction(model,'r_1012No1','metaboliteList',{'s_0190','s_0794','s_1212','prot_P29704','s_0633','s_1207','s_1447'},'stoichCoeffList',[-2 -1 -1 -1/Kcat7 2 1 1],'reversible',false);
model = addReaction(model,'r_0558No1','metaboliteList',{'pmet_r_0558','prot_P12684','s_0028','s_0529','s_1207'},'stoichCoeffList',[-1 -1/Kcat8 1 1 2],'reversible',false);
model = addReaction(model,'r_0373No1','metaboliteList',{'s_0190','s_0943','prot_Q12051','s_0633','s_0189'},'stoichCoeffList',[-1 -1 -1/Kcat9 1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_Q7Z859'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'prot_pool','prot_Q7Z858'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_Q6E4P3'},'stoichCoeffList',[-MW5 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'s_4301','s_4302'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn10','metaboliteList',{'s_4302'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn11','metaboliteList',{'s_4300','s_4303'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn12','metaboliteList',{'s_4303'},'stoichCoeffList',[-1],'reversible',false); 
model = removeGenes(model,'YDR503C'); % delete LPP1
model = removeGenes(model,'YDR284C'); % delete DPP1
model=changeGeneAssociation(model,'newRxn1','crtYB');
model=changeGeneAssociation(model,'newRxn2','crtI');
model=changeGeneAssociation(model,'newRxn3','crtI');
model=changeGeneAssociation(model,'newRxn4','crtYB');
model=changeGeneAssociation(model,'newRxn5','CCD1');
model.geneShortNames(1126)={'crtYB'};
model.geneShortNames(1127)={'crtI'};
model.geneShortNames(1128)={'CCD1'};
model.enzymes(964)={'Q7Z859'};
model.enzymes(965)={'Q7Z858'};
model.enzymes(966)={'Q6E4P3'};
model.enzGenes(964)={'crtYB'};
model.enzGenes(965)={'crtI'};
model.enzGenes(966)={'CCD1'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=1;
model.metComps(4155)=1;
model.metComps(4156)=3;
model.metComps(4157)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.106,'l');
model=changeObjective(model,'newRxn10');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecbeta_Ionone.mat model 

% Xanthone
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=8*3600;
MW1=58.93;
Kcat2=0.055*3600;
MW2=43.039;
MW3=57.849;
Kcat4=0.55*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_4304'},'stoichCoeffList',[1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4304','s_4305'},'stoichCoeffList',[-1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4305','s_0529','s_0434','prot_Q53005','s_0633','s_0423','s_4306'},'stoichCoeffList',[-1 -1 -1 -1/Kcat1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_1101','s_4306','prot_A4ZYX5','s_0529','s_0456','s_4307'},'stoichCoeffList',[-3 -1 -1/Kcat2 4 3 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_0794','s_4307','s_1275','s_1212','prot_A0A161I263','s_0803','s_1207','s_4308'},'stoichCoeffList',[-2 -1 -2 -2 -1 2 2 1],'reversible',false); 
model = addReaction(model,'newRxn6','metaboliteList',{'s_4308','s_4309'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn7','metaboliteList',{'s_4309'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn8','metaboliteList',{'prot_pool','prot_Q53005'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn9','metaboliteList',{'prot_pool','prot_A4ZYX5'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn10','metaboliteList',{'prot_pool','prot_A0A161I263'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'r_0355No1','metaboliteList',{'s_0943','s_1376','prot_P08524','s_0633','s_0745'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1],'reversible',false);
model = addReaction(model,'r_0462No1','metaboliteList',{'s_0745','s_0943','prot_P08524','s_0190','s_0633'},'stoichCoeffList',[-1 -1 -1/Kcat4 1 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','BZL');
model=changeGeneAssociation(model,'newRxn2','BPS');
model=changeGeneAssociation(model,'newRxn3','TXS');
model.geneShortNames(1128)={'BZL'};
model.geneShortNames(1129)={'BPS'};
model.geneShortNames(1130)={'TXS'};
model.enzymes(964)={'Q53005'};
model.enzymes(965)={'A4ZYX5'};
model.enzymes(966)={'A0A161I263'};
model.enzGenes(964)={'BZL'};
model.enzGenes(965)={'BPS'};
model.enzGenes(966)={'TXS'};
model.metComps(4147)=3;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=1;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=1;
model.metComps(4155)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn7');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecXanthone.mat model 

% tyrosine
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.0828*3600;
MW1=39.7487;
Kcat2=0.9*3600;
MW2=54.914;
MW3=32.051;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0551','s_0803','s_1360','prot_P32449ly','s_0349','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_1051','prot_Q3IWB0','s_0419','s_4215'},'stoichCoeffList',[-1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_1377','s_1198','prot_Q04983','s_0204','s_0456','s_1203'},'stoichCoeffList',[-1 -1 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_P32449ly'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'prot_pool','prot_Q3IWB0'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_Q04983'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = removeGenes(model,'YDR035W'); % delete ARO3
model = removeGenes(model,'YBR249C'); % delete ARO4
model = removeGenes(model,'YDR380W'); % delete ARO10
model = removeGenes(model,'YNL241C'); % delete Zwf1
model=changeGeneAssociation(model,'newRxn1','P32449ly');
model=changeGeneAssociation(model,'newRxn2','Q3IWB0');
model=changeGeneAssociation(model,'newRxn3','Q04983');
model.geneShortNames(1124)={'ARO4K229L'};
model.geneShortNames(1125)={'TAL'};
model.geneShortNames(1126)={'TyrC'};
model.enzymes(964)={'P32449ly'};
model.enzymes(965)={'Q3IWB0'};
model.enzymes(966)={'Q04983'};
model.enzGenes(964)={'ARO4K229L'};
model.enzGenes(965)={'TAL'};
model.enzGenes(966)={'TyrC'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.089,'l');
model=changeObjective(model,'r_1913');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecTyrosine.mat model 

% triacylglycerols
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=65.3426*3600;
Kcat2=23.1467*3600;
model = addReaction(model,'r_0109No1','metaboliteList',{'s_0373','s_0434','s_0445','prot_P48445','prot_Q00955','s_0394','s_0794','s_1101','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/450000/3600 -1/Kcat1 1 1 1 1],'reversible',false);
model = addReaction(model,'r_2344No1','metaboliteList',{'s_2808','s_2954','prot_P32567','s_2966','s_2967'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_2345No1','metaboliteList',{'s_2808','s_2955','prot_P32567','s_2966','s_2968'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_2346No1','metaboliteList',{'s_2808','s_2956','prot_P32567','s_2966','s_2969'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_2347No1','metaboliteList',{'s_2808','s_2957','prot_P32567','s_2966','s_2970'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_2348No1','metaboliteList',{'s_2808','s_2958','prot_P32567','s_2966','s_2971'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_2349No1','metaboliteList',{'s_2808','s_2959','prot_P32567','s_2966','s_2972'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_2350No1','metaboliteList',{'s_2808','s_2960','prot_P32567','s_2966','s_2973'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'r_2351No1','metaboliteList',{'s_2808','s_2961','prot_P32567','s_2966','s_2974'},'stoichCoeffList',[-1 -1 -1/Kcat2 1 1],'reversible',false);
model = addReaction(model,'newRxn1','metaboliteList',{'s_1524','s_4310'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn2','metaboliteList',{'s_4310'},'stoichCoeffList',[-1],'reversible',false); 
model = removeGenes(model,'YMR313C'); % delete TGL3
model = removeGenes(model,'YKR089C'); % delete TGL4
model = removeGenes(model,'YOR081C'); % delete TGL5
model = removeGenes(model,'YPL147W'); % delete PXA1
model.metComps(4147)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn2');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ectriacylglycerol.mat model

% very-long-chain polyunsaturated fatty acids (VLC-PUFAs)(ARA, EPA, DHA)
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
MW1=50.809;
MW2=46.001;
MW3=47.718;
MW4=51.674;
MW5=36.746;
MW6=59.89;
model = addReaction(model,'newRxn1','metaboliteList',{'s_2783','s_2791','s_2817','s_2818','prot_D5KSD1','s_2808','s_2820','s_2821'},'stoichCoeffList',[-1 -1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn2','metaboliteList',{'s_2783','s_2821','s_2817','s_2818','prot_Q9Y8H5','s_2808','s_2820','s_4311'},'stoichCoeffList',[-1 -1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4311','s_2821','s_2817','s_2818','prot_D5KSD6','s_2808','s_2820','s_4312'},'stoichCoeffList',[-1 -1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4311','s_2821','s_2817','s_2818','prot_A0A1Y5I9G7','s_2808','s_2820','s_4313'},'stoichCoeffList',[-1 -1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn5','metaboliteList',{'s_4312','s_2821','s_2817','s_2818','prot_A0A1Y5I9G7','s_2808','s_2820','s_4314'},'stoichCoeffList',[-1 -1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn6','metaboliteList',{'s_4313','s_2799','s_2782','s_2783','prot_D5KSD4','s_2785','s_2784','s_2808','s_2800','s_4315'},'stoichCoeffList',[-1 -2 -1 -3 -1 1 1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn7','metaboliteList',{'s_4314','s_2799','s_2782','s_2783','prot_D5KSD4','s_2785','s_2784','s_2808','s_2800','s_4316'},'stoichCoeffList',[-1 -2 -1 -3 -1 1 1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn8','metaboliteList',{'s_4315','s_2821','s_2817','s_2818','prot_HQ678517','s_2808','s_2820','s_4317'},'stoichCoeffList',[-1 -1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn9','metaboliteList',{'s_4316','s_2821','s_2817','s_2818','prot_HQ678517','s_2808','s_2820','s_4318'},'stoichCoeffList',[-1 -1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn10','metaboliteList',{'s_4317','s_4319'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn11','metaboliteList',{'s_4319','s_0809','prot_P41903','s_0801','s_0534','s_4320'},'stoichCoeffList',[-1 -1 -1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn12','metaboliteList',{'s_4320','s_4321'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn13','metaboliteList',{'s_4321'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn14','metaboliteList',{'s_4318','s_4322'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn15','metaboliteList',{'s_4322','s_0809','prot_P41903','s_0801','s_0534','s_4323'},'stoichCoeffList',[-1 -1 -1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn16','metaboliteList',{'s_4323','s_4324'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn17','metaboliteList',{'s_4324'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn18','metaboliteList',{'prot_pool','prot_D5KSD1'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn19','metaboliteList',{'prot_pool','prot_Q9Y8H5'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn20','metaboliteList',{'prot_pool','prot_D5KSD6'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn21','metaboliteList',{'prot_pool','prot_A0A1Y5I9G7'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn22','metaboliteList',{'prot_pool','prot_D5KSD4'},'stoichCoeffList',[-MW5 1],'reversible',false);
model = addReaction(model,'newRxn23','metaboliteList',{'prot_pool','prot_HQ678517'},'stoichCoeffList',[-MW6 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','D9D');
model=changeGeneAssociation(model,'newRxn2','D12D');
model=changeGeneAssociation(model,'newRxn3','FAD3');
model=changeGeneAssociation(model,'newRxn4','D6D');
model=changeGeneAssociation(model,'newRxn5','D6D');
model=changeGeneAssociation(model,'newRxn6','D6E');
model=changeGeneAssociation(model,'newRxn7','D6E');
model=changeGeneAssociation(model,'newRxn8','D5D');
model=changeGeneAssociation(model,'newRxn9','D5D');
model.geneShortNames(1128)={'D9D'};
model.geneShortNames(1129)={'D12D'};
model.geneShortNames(1130)={'FAD3'};
model.geneShortNames(1131)={'D6D'};
model.geneShortNames(1132)={'D6E'};
model.geneShortNames(1133)={'D5D'};
model.enzymes(964)={'D5KSD1'};
model.enzymes(965)={'Q9Y8H5'};
model.enzymes(966)={'D5KSD6'};
model.enzymes(967)={'A0A1Y5I9G7'};
model.enzymes(968)={'D5KSD4'};
model.enzymes(969)={'HQ678517'};
model.enzGenes(964)={'D9D'};
model.enzGenes(965)={'D12D'};
model.enzGenes(966)={'FAD3'};
model.enzGenes(967)={'D6D'};
model.enzGenes(968)={'D6E'};
model.enzGenes(969)={'D5D'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=5;
model.metComps(4150)=1;
model.metComps(4151)=5;
model.metComps(4152)=1;
model.metComps(4153)=5;
model.metComps(4154)=5;
model.metComps(4155)=1;
model.metComps(4156)=5;
model.metComps(4157)=5;
model.metComps(4158)=1;
model.metComps(4159)=5;
model.metComps(4160)=5;
model.metComps(4161)=12;
model.metComps(4162)=12;
model.metComps(4163)=3;
model.metComps(4164)=12;
model.metComps(4165)=12;
model.metComps(4166)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn13'); % For ARA production
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecARA.mat model
model=changeObjective(model,'newRxn17'); % For EPA production
FBAsolution=optimizeCbModel(model)
save ecEPA.mat model
model = addReaction(model,'newRxn24','metaboliteList',{'s_4318','s_2799','s_2782','s_2783','s_2785','s_2784','s_2808','s_2800','s_4325'},'stoichCoeffList',[-1 -2 -1 -3 1 1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn25','metaboliteList',{'s_4325','s_2821','s_2817','s_2818','s_2808','s_2820','s_4326'},'stoichCoeffList',[-1 -1 -1 -1 2 1 1],'reversible',false); 
model = addReaction(model,'newRxn26','metaboliteList',{'s_4326','s_4327'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn27','metaboliteList',{'s_4327','s_0809','prot_P41903','s_0801','s_0534','s_4328'},'stoichCoeffList',[-1 -1 -1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn28','metaboliteList',{'s_4328','s_4329'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn29','metaboliteList',{'s_4329'},'stoichCoeffList',[-1],'reversible',false); 
model.metComps(4167)=5;
model.metComps(4168)=5;
model.metComps(4169)=12;
model.metComps(4170)=12;
model.metComps(4171)=3;
model=changeObjective(model,'newRxn29'); % For DHA production
FBAsolution=optimizeCbModel(model)
save ecDHA.mat model

% n-Butanol
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=18.6*3600;
MW1=47.186;
Kcat2=18.54*3600;
MW2=85.794;
Kcat3=18.1*3600;
MW3=38.953;
Kcat4=27.58*3600;
MW4=68.409;
Kcat5=10.4*3600;
Kcat6=8.3156*3600;
MW7=40.825;
Kcat8=1.74*3600;
Kcat9=274.1995*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_1401','s_0376','prot_A0FDH8','s_4333'},'stoichCoeffList',[-1 -1 -1/Kcat1 1],'reversible',false); 
model = addReaction(model,'newRxn2','metaboliteList',{'s_4333','s_0807','prot_P07264ly','s_4334'},'stoichCoeffList',[-1 -1 -1/Kcat2 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4334','s_0807','prot_P07264ly','s_4335'},'stoichCoeffList',[-1 -1 -1/Kcat2 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4335','s_1200','prot_P04173ly','s_0179','s_1205','s_0799','s_0460'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn5','metaboliteList',{'s_0179','s_0807','s_0376','prot_P06208ly','s_0532','s_4336'},'stoichCoeffList',[-1 -1 -1 -1/Kcat4 1 1],'reversible',false); 
model = addReaction(model,'newRxn6','metaboliteList',{'s_4336','prot_P07264ly','s_4337'},'stoichCoeffList',[-1 -1/Kcat2 1],'reversible',false); 
model = addReaction(model,'newRxn7','metaboliteList',{'s_4337','s_1200','prot_P04173ly','s_1205','s_0799','s_4338'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn8','metaboliteList',{'s_4338','s_0799','prot_P04173ly','s_0460','s_4339'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1],'reversible',false); 
model = addReaction(model,'newRxn9','metaboliteList',{'s_4336','s_4340'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn10','metaboliteList',{'s_4339','s_4341'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn11','metaboliteList',{'s_4340','prot_P07264','s_4342'},'stoichCoeffList',[-1 -1/Kcat2 1],'reversible',false); 
model = addReaction(model,'newRxn12','metaboliteList',{'s_4342','s_1198','prot_P04173','s_1203','s_0794','s_4343'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn13','metaboliteList',{'s_4343','s_0794','prot_P04173','s_0456','s_4341'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1],'reversible',false); 
model = addReaction(model,'newRxn14','metaboliteList',{'s_4341','prot_Q06408','s_4344','s_0456'},'stoichCoeffList',[-1 -1/Kcat5 1 1],'reversible',false); 
model = addReaction(model,'newRxn15','metaboliteList',{'s_4344','s_1203','s_0794','prot_P25377','s_1198','s_4345'},'stoichCoeffList',[-1 -1 -1 -1/Kcat6 1 1],'reversible',false); 
model = addReaction(model,'newRxn16','metaboliteList',{'s_4345','s_4346'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn17','metaboliteList',{'s_4346'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_1129','metaboliteList',{'s_0529','prot_P38702','s_0532'},'stoichCoeffList',[-1 -1 1],'reversible',false); 
model = addReaction(model,'r_4173No1','metaboliteList',{'s_3784','s_3785','prot_P25374','s_0957','s_3786'},'stoichCoeffList',[-1 -1 -1/Kcat8 1 1],'reversible',false); 
model = addReaction(model,'r_4173_REVNo1','metaboliteList',{'s_0957','s_3786','prot_P25374','s_3785','s_3784'},'stoichCoeffList',[-1 -1 -1/Kcat9 1 1],'reversible',false); 
model = addReaction(model,'newRxn18','metaboliteList',{'prot_pool','prot_A0FDH8'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn19','metaboliteList',{'prot_pool','prot_P07264ly'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn20','metaboliteList',{'prot_pool','prot_P04173ly'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn21','metaboliteList',{'prot_pool','prot_P06208ly'},'stoichCoeffList',[-MW4 1],'reversible',false);
model = addReaction(model,'newRxn22','metaboliteList',{'prot_pool','prot_P38702'},'stoichCoeffList',[-MW7 1],'reversible',false);
model = removeGenes(model,'YOL086C'); % delete ADH1
model=changeGeneAssociation(model,'newRxn1','cimA');
model=changeGeneAssociation(model,'newRxn2','LEU1m');
model=changeGeneAssociation(model,'newRxn3','LEU1m');
model=changeGeneAssociation(model,'newRxn4','LEU2m');
model=changeGeneAssociation(model,'newRxn5','LEU4m');
model=changeGeneAssociation(model,'newRxn6','LEU1m');
model=changeGeneAssociation(model,'newRxn7','LEU2m');
model=changeGeneAssociation(model,'newRxn8','LEU2m');
model=changeGeneAssociation(model,'r_1129','LEU5');
model.geneShortNames(1127)={'cimA'};
model.geneShortNames(1128)={'LEU1m'};
model.geneShortNames(1129)={'LEU2m'};
model.geneShortNames(1130)={'LEU4m'};
model.geneShortNames(1131)={'LEU5'};
model.enzymes(964)={'A0FDH8'};
model.enzymes(965)={'P07264ly'};
model.enzymes(966)={'P04173ly'};
model.enzymes(967)={'P06208ly'};
model.enzymes(968)={'P38702'};
model.enzGenes(964)={'cimA'};
model.enzGenes(965)={'LEU1m'};
model.enzGenes(966)={'LEU2m'};
model.enzGenes(967)={'LEU4m'};
model.enzGenes(968)={'LEU5'};
model.metComps(4147)=1;
model.metComps(4148)=9;
model.metComps(4149)=1;
model.metComps(4150)=9;
model.metComps(4151)=9;
model.metComps(4152)=1;
model.metComps(4153)=1;
model.metComps(4154)=9;
model.metComps(4155)=9;
model.metComps(4156)=9;
model.metComps(4157)=9;
model.metComps(4158)=1;
model.metComps(4159)=1;
model.metComps(4160)=1;
model.metComps(4161)=1;
model.metComps(4162)=1;
model.metComps(4163)=1;
model.metComps(4164)=3;
model.metComps(4165)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn17');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecn-Butanol.mat model

% ergosterol
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'r_1757'); 
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecErgosterol.mat model

% 2-phenylethanol
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.2153*3600;
MW1=39.7487;
Kcat2=0.062*3600;
MW2=29.7468;
Kcat3=130.8652*3600;
MW3=19.151;
Kcat4=1.74*3600;
Kcat5=3080*3600;
Kcat6=2400*3600;
Kcat7=699.9998*3600;
Kcat8=999.9992*3600;
Kcat9=3864*3600;
Kcat10=138.0002*3600;
Kcat11=115.9998*3600;
Kcat12=2280*3600;
Kcat13=13.15*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0551','s_0803','s_1360','prot_P32449ly','s_0349','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0515','prot_P32178ly','s_1377'},'stoichCoeffList',[-1 -1/Kcat2 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_1429','s_0434','prot_P0A6E1','s_0261','s_0794','s_0394'},'stoichCoeffList',[-1 -1 -1/Kcat3 1 1 1],'reversible',false); 
model = addReaction(model,'r_0279No1','metaboliteList',{'s_0324','prot_P28777','s_0515','s_1322'},'stoichCoeffList',[-1 -1/Kcat4 1 1],'reversible',false); 
model = addReaction(model,'r_0026No4','metaboliteList',{'pmet_r_0026','prot_P38840','s_0180','s_1029'},'stoichCoeffList',[-1 -1/Kcat5 1 1],'reversible',false); 
model = addReaction(model,'r_2117No1','metaboliteList',{'s_1032','s_1399','prot_P38840','s_0951','s_0955'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1],'reversible',false); 
model = addReaction(model,'r_2118No1','metaboliteList',{'s_0951','s_1048','prot_P38840','s_0855','s_1032'},'stoichCoeffList',[-1 -1 -1/Kcat7 1 1],'reversible',false); 
model = addReaction(model,'r_2119No1','metaboliteList',{'s_0204','s_0955','prot_P38840','s_1051','s_1399'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false); 
model = addReaction(model,'r_2117_REVNo1','metaboliteList',{'s_0951','s_0955','prot_P38840','s_1032','s_1399'},'stoichCoeffList',[-1 -1 -1/Kcat5 1 1],'reversible',false); 
model = addReaction(model,'r_2119_REVNo1','metaboliteList',{'s_1051','s_1399','prot_P38840','s_0204','s_0955'},'stoichCoeffList',[-1 -1 -1/Kcat8 1 1],'reversible',false); 
model = addReaction(model,'r_0938No1','metaboliteList',{'s_0794','s_1377','prot_P32452','s_0456','s_0803','s_0951'},'stoichCoeffList',[-1 -1 -1/Kcat9 1 1 1],'reversible',false); 
model = addReaction(model,'r_1049No2','metaboliteList',{'pmet_r_1049','prot_P23254','s_0764','s_1427'},'stoichCoeffList',[-1 -1/Kcat10 1 1],'reversible',false); 
model = addReaction(model,'r_1050No2','metaboliteList',{'prot_P23254','pmet_r_1050','s_0557','s_0764'},'stoichCoeffList',[-1/Kcat10 -1 1 1],'reversible',false); 
model = addReaction(model,'r_1049_REVNo2','metaboliteList',{'prot_P23254','pmet_r_1049_REV','s_0581','s_1408'},'stoichCoeffList',[-1/Kcat10 -1 1 1],'reversible',false); 
model = addReaction(model,'r_1050_REVNo2','metaboliteList',{'prot_P23254','pmet_r_1050_REV','s_0551','s_0581'},'stoichCoeffList',[-1/Kcat10 -1 1 1],'reversible',false); 
model = addReaction(model,'r_0962No1','metaboliteList',{'pmet_r_0962','prot_P00549','s_0434','s_1399'},'stoichCoeffList',[-1 -1/Kcat11 1 1],'reversible',false); 
model = addReaction(model,'r_0854No1','metaboliteList',{'s_0794','s_0951','prot_Q06408','s_0456','s_1318'},'stoichCoeffList',[-1 -1 -1/Kcat12 1 1],'reversible',false); 
model = addReaction(model,'r_0939No1','metaboliteList',{'s_1207','s_1377','prot_P20049','s_0204','s_0456','s_1212'},'stoichCoeffList',[-1 -1 -1/Kcat13 1 1 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_P32449ly'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'prot_pool','prot_P32178ly'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'prot_pool','prot_P0A6E1'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = removeGenes(model,'YDR035W'); % delete ARO3
model = removeGenes(model,'YBR249C'); % delete ARO4
model = removeGenes(model,'YPR060C'); % delete ARO7
model = removeGenes(model,'YGL202W'); % delete ARO8
model=changeGeneAssociation(model,'newRxn1','ARO4K229L');
model=changeGeneAssociation(model,'newRxn2','ARO7T226I');
model=changeGeneAssociation(model,'newRxn3','aroL');
model.geneShortNames(1124)={'ARO4K229L'};
model.geneShortNames(1125)={'ARO7T226I'};
model.geneShortNames(1126)={'aroL'};
model.enzymes(964)={'P32449ly'};
model.enzymes(965)={'P32178ly'};
model.enzymes(966)={'P0A6E1'};
model.enzGenes(964)={'ARO4K229L'};
model.enzGenes(965)={'ARO7T226I'};
model.enzGenes(966)={'aroL'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'r_1589'); 
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ec2-phenylethanol.mat model

% docosanol
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
MW1=55.481;
Kcat2=2.044*3600;
MW2=327.047;
MW3=14.161;
Kcat4=5.4*3600;
Kcat5=27.6*3600;
Kcat6=65.3426*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_2880','s_0794','s_1212','prot_Q39152','s_4347','s_0529','s_1207'},'stoichCoeffList',[-1 -2 -2 -1 1 1 2],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0373','s_0794','s_1101','s_1212','prot_K0V149','s_0456','s_0529','s_0803','s_1207','s_1302'},'stoichCoeffList',[-1 -21 -7 -14 -1/Kcat2 7 7 7 14 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0373','s_0794','s_1101','s_1212','prot_K0V149','s_0456','s_0529','s_0803','s_1207','s_1454'},'stoichCoeffList',[-1 -24 -8 -16 -1/Kcat2 8 8 8 16 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'s_0529','s_0803','prot_K0V045','s_0390','s_0794','s_1307'},'stoichCoeffList',[-1 -1 -1 1 2 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'s_1101','s_1302','s_0794','prot_K0V149','s_0529','s_1454','s_0456'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_1101','s_1454','s_0794','prot_K0V149','s_0529','s_2878','s_0456'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn7','metaboliteList',{'s_1101','s_2878','s_0794','prot_K0V149','s_0529','s_2880','s_0456'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1],'reversible',false);
model = addReaction(model,'newRxn8','metaboliteList',{'s_4347','s_4348'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn9','metaboliteList',{'s_4348'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn10','metaboliteList',{'prot_pool','prot_Q39152'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn11','metaboliteList',{'prot_pool','prot_K0V149'},'stoichCoeffList',[-MW2 1],'reversible',false);
model = addReaction(model,'newRxn12','metaboliteList',{'prot_pool','prot_K0V045'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'r_2154No1','metaboliteList',{'s_2781','s_2782','s_2783','prot_P39540','s_2784','s_2785','s_2786'},'stoichCoeffList',[-1 -1 -1 -1/Kcat4 1 1 1],'reversible',false); 
model = addReaction(model,'r_2155No1','metaboliteList',{'s_2782','s_2783','s_2787','prot_P39540','s_2784','s_2785','s_2788'},'stoichCoeffList',[-1 -1 -1 -1/Kcat5 1 1 1],'reversible',false); 
model = addReaction(model,'r_2156No1','metaboliteList',{'s_2782','s_2783','s_2789','prot_P25358','s_2784','s_2785','s_2790'},'stoichCoeffList',[-1 -1 -1 -1/Kcat4 1 1 1],'reversible',false); 
model = addReaction(model,'r_2157No1','metaboliteList',{'prot_P25358','pmet_r_2157','s_2784','s_2785','s_2792'},'stoichCoeffList',[-1/Kcat4 -1 1 1 1],'reversible',false); 
model = addReaction(model,'r_2158No1','metaboliteList',{'prot_P25358','pmet_r_2158','s_2784','s_2785','s_2794'},'stoichCoeffList',[-1/Kcat4 -1 1 1 1],'reversible',false); 
model = addReaction(model,'r_2159No1','metaboliteList',{'prot_P25358','pmet_r_2159','s_2784','s_2785','s_2796'},'stoichCoeffList',[-1/Kcat4 -1 1 1 1],'reversible',false); 
model = addReaction(model,'r_0109No1','metaboliteList',{'s_0373','s_0434','s_0445','prot_P48445','prot_Q00955','s_0394','s_0794','s_1101','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/450000/3600 -1/Kcat6 1 1 1 1],'reversible',false);
model = removeGenes(model,'YCR048W'); % delete ARE1
model = removeGenes(model,'YOR245C'); % delete dga1
model = removeGenes(model,'YNR008W'); % delete Lro1
model = removeGenes(model,'YGL205W'); % delete pox1
model = removeGenes(model,'YLR372W'); % delete ELO3
model = removeGenes(model,'YBR020W'); % delete GAL1
model = removeGenes(model,'YNR019W'); % delete ARE2
model=changeGeneAssociation(model,'newRxn1','FAR1');
model=changeGeneAssociation(model,'newRxn2','FAS');
model=changeGeneAssociation(model,'newRxn3','FAS');
model=changeGeneAssociation(model,'newRxn4','Acps');
model=changeGeneAssociation(model,'newRxn5','FAS');
model=changeGeneAssociation(model,'newRxn6','FAS');
model=changeGeneAssociation(model,'newRxn7','FAS');
model.geneShortNames(1122)={'FAR1'};
model.geneShortNames(1123)={'FAS'};
model.geneShortNames(1124)={'Acps'};
model.enzymes(964)={'Q39152'};
model.enzymes(965)={'K0V149'};
model.enzymes(966)={'K0V045'};
model.enzGenes(964)={'FAR1'};
model.enzGenes(965)={'RAS'};
model.enzGenes(966)={'Acps'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=1;
model.metComps(4151)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn9'); 
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecDocosanol.mat model

% Itaconic acid
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.2428*3600;
MW1=52.754;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0516','s_0794','prot_B3IUN8','s_0456','s_4349'},'stoichCoeffList',[-1 -1 -1/Kcat1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4349','s_4350'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4350'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_B3IUN8'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = removeGenes(model,'YJR078W'); % delete bna2
model = removeGenes(model,'YJR019C'); % delete tes1
model=changeGeneAssociation(model,'newRxn1','CAD');
model.geneShortNames(1126)={'CAD'};
model.enzymes(964)={'B3IUN8'};
model.enzGenes(964)={'CAD'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn3');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecItaconic_acid.mat model

% Glutathione
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=1167.65*3600;
MW1=85.438;
Kcat2=1103.57*3600;
Kcat3=151*3600;
MW3=35.561;
Kcat4=20380*3600;
Kcat5=26*3600;
Kcat6=23.03*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0434','s_0981','s_0991','prot_D4N892','s_0394','s_0794','s_0988','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat1 1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_0434','s_0988','s_1003','prot_D4N892','s_0394','s_0750','s_0794','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat2 1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_0434','s_0988','s_1003','prot_P04425','s_0394','s_0750','s_0794','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat3 1 1 1 1],'reversible',false);
model = addReaction(model,'r_0460No1','metaboliteList',{'s_0434','s_0981','s_0991','prot_P32477','s_0394','s_0794','s_0988','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat4 1 1 1 1],'reversible',false);
model = addReaction(model,'r_0485No1','metaboliteList',{'s_0434','s_0988','s_1003','prot_Q08220','s_0394','s_0750','s_0794','s_1322'},'stoichCoeffList',[-1 -1 -1 -1/Kcat5 1 1 1 1],'reversible',false);
model = addReaction(model,'r_0468No1','metaboliteList',{'s_0434','s_0991','prot_P32264','s_0394','s_0986'},'stoichCoeffList',[-1 -1 -1/Kcat6 1 1],'reversible',false);
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_D4N892'},'stoichCoeffList',[-MW1 1],'reversible',false);
model = addReaction(model,'newRxn5','metaboliteList',{'prot_pool','prot_P04425'},'stoichCoeffList',[-MW3 1],'reversible',false);
model = addReaction(model,'newRxn6','metaboliteList',{'s_0750','s_0751'},'stoichCoeffList',[-1 1],'reversible',false); 
model=changeGeneAssociation(model,'newRxn1','GshF');
model=changeGeneAssociation(model,'newRxn2','GshF');
model=changeGeneAssociation(model,'newRxn3','gshb');
model.geneShortNames(1128)={'GshF'};
model.geneShortNames(1129)={'gshb'};
model.enzymes(964)={'D4N892'};
model.enzymes(965)={'P04425'};
model.enzGenes(964)={'GshF'};
model.enzGenes(965)={'gshb'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'r_1807');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecGlutathione.mat model
             
% Ethylene
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.5*3600;
MW1=38.064;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0180','s_0794','s_1275','prot_Q9Z3T0','s_0803','s_0456','s_4351'},'stoichCoeffList',[-1 -2 -1 -1/Kcat1 1 3 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4351','s_4352'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4352'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'prot_pool','prot_Q9Z3T0'},'stoichCoeffList',[-MW1 1],'reversible',false);
model=changeGeneAssociation(model,'newRxn1','efe');
model.geneShortNames(1128)={'efe'};
model.enzymes(964)={'Q9Z3T0'};
model.enzGenes(964)={'efe'};
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.24,'l');
model=changeObjective(model,'newRxn3');
model=changeRxnBounds(model,'r_1889_REV',1,'u'); % add glutamate
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecEthylene.mat model

% Human Serum Albumin
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.8928;
Kcat2=0.4032;
Kcat3=0.2448;
Kcat4=0.5184;
Kcat5=0.504;
Kcat6=0.288;
Kcat7=0.8928;
Kcat8=0.1872;
Kcat9=0.2304;
Kcat10=0.1296;
Kcat11=0.9216;
Kcat12=0.864;
Kcat13=0.1008;
Kcat14=0.504;
Kcat15=0.3456;
Kcat16=0.4032;
Kcat17=0.4176;
Kcat18=0.0288;
Kcat19=0.2736;
Kcat20=0.6192;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0955','s_0965','s_0969','s_0973','s_0981','s_0991','s_0999','s_1003','s_1006','s_1016','s_1021','s_1025',...
    's_1029','s_1032','s_1035','s_1039','s_1045','s_1048','s_1051','s_1056','s_0785','s_4353','s_0739','s_1322'},'stoichCoeffList',[-Kcat1 -Kcat2 -Kcat3 -Kcat4 -Kcat5...
    -Kcat6 -Kcat7 -Kcat8 -Kcat9 -Kcat10 -Kcat11 -Kcat12 -Kcat13 -Kcat14 -Kcat15 -Kcat16 -Kcat17 -Kcat18 -Kcat19 -Kcat20 -1.22 1 1.22 1.22],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4353','s_4354'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4354'},'stoichCoeffList',[-1],'reversible',false); 
model.metComps(4147)=1;
model.metComps(4148)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.22,'l');
model=changeRxnBounds(model,'r_1992_REV',4.6,'u');
model=changeObjective(model,'newRxn3');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecHSA.mat model

% ��-Amylase
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.7663; 
Kcat2=0.1825; 
Kcat3=0.4744; 
Kcat4=0.7663; 
Kcat5=0.1642; 
Kcat6=0.2189; 
Kcat7=0.3649; 
Kcat8=0.7846; 
Kcat9=0.1277; 
Kcat10=0.5109; 
Kcat11=0.6751; 
Kcat12=0.3649; 
Kcat13=0.2007; 
Kcat14=0.2737; 
Kcat15=0.4014; 
Kcat16=0.6751; 
Kcat17=0.7298; 
Kcat18=0.2189; 
Kcat19=0.6386; 
Kcat20=0.5656; 
model = addReaction(model,'newRxn1','metaboliteList',{'s_0955','s_0965','s_0969','s_0973','s_0981','s_0991','s_0999','s_1003','s_1006','s_1016','s_1021','s_1025',...
    's_1029','s_1032','s_1035','s_1039','s_1045','s_1048','s_1051','s_1056','s_0785','s_4287','s_0739','s_1322'},'stoichCoeffList',[-Kcat1 -Kcat2 -Kcat3 -Kcat4 -Kcat5...
    -Kcat6 -Kcat7 -Kcat8 -Kcat9 -Kcat10 -Kcat11 -Kcat12 -Kcat13 -Kcat14 -Kcat15 -Kcat16 -Kcat17 -Kcat18 -Kcat19 -Kcat20 -1 1 1 1],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4287','s_4355'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4355'},'stoichCoeffList',[-1],'reversible',false); 
model.metComps(4147)=1;
model.metComps(4148)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.2,'l');
model=changeObjective(model,'newRxn3');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecalpha_Amylase.mat model

% Hemoglobin
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=1.1532; 
Kcat2=0.1922; 
Kcat3=0.3203; 
Kcat4=0.4805; 
Kcat5=0.0961; 
Kcat6=0.3844; 
Kcat7=0.1281; 
Kcat8=0.6407; 
Kcat9=0.6087; 
Kcat10=1.1532; 
Kcat11=0.7048; 
Kcat12=0.1602; 
Kcat13=0.4805; 
Kcat14=0.4485; 
Kcat15=0.5125; 
Kcat16=0.5125; 
Kcat17=0.0961; 
Kcat18=0.1922; 
Kcat19=0.9931; 
Kcat20=0.125*3600;
model = addReaction(model,'newRxn1','metaboliteList',{'s_0812','s_4356'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn2','metaboliteList',{'s_0955','s_0965','s_0969','s_0973','s_0981','s_0991','s_0999','s_1003','s_1006','s_1021','s_1025',...
    's_1029','s_1032','s_1035','s_1039','s_1045','s_1048','s_1051','s_1056','s_0785','s_4357','s_0739','s_1322'},'stoichCoeffList',[-Kcat1 -Kcat2 -Kcat3 -Kcat4 -Kcat5...
    -Kcat6 -Kcat7 -Kcat8 -Kcat9 -Kcat10 -Kcat11 -Kcat12 -Kcat13 -Kcat14 -Kcat15 -Kcat16 -Kcat17 -Kcat18 -Kcat19 -1.16 1 1.16 1.16],'reversible',false);
model = addReaction(model,'newRxn3','metaboliteList',{'s_4357','s_4356','s_4358'},'stoichCoeffList',[-1 -4 1],'reversible',false); 
model = addReaction(model,'newRxn4','metaboliteList',{'s_4358','s_4359'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn5','metaboliteList',{'s_4359'},'stoichCoeffList',[-1],'reversible',false); 
model = addReaction(model,'r_0557No1','metaboliteList',{'s_0803','s_1372','prot_P28789','s_0419','s_1378'},'stoichCoeffList',[-1 -4 -1/Kcat20 4 1],'reversible',false); 
model.metComps(4147)=1;
model.metComps(4148)=1;
model.metComps(4149)=1;
model.metComps(4150)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.25,'l');
model=changeObjective(model,'newRxn5');
FBAsolution=optimizeCbModel(model)
cd ../../result_ecYeast/Others/Models
save ecHemoglobin.mat model

% Glucagon
cd ../../../ModelFiles/mat
load('ecYeastGEM_batch.mat');
model = ecModel_batch;
Kcat1=0.6223; 
Kcat2=0.7659; 
Kcat3=0.3829; 
Kcat4=0.7659;
Kcat5=0.6223; 
Kcat6=0.4787; 
Kcat7=0.4308; 
Kcat8=0.1915; 
Kcat9=0.3829; 
Kcat10=0.5744; 
Kcat11=0.4787; 
Kcat12=0.2393; 
Kcat13=0.5265; 
Kcat14=0.1436; 
Kcat15=0.8137; 
Kcat16=0.4308; 
Kcat17=0.1915; 
Kcat18=0.1915; 
Kcat19=0.3829; 
model = addReaction(model,'newRxn1','metaboliteList',{'s_0955','s_0965','s_0969','s_0973','s_0991','s_0999','s_1003','s_1006','s_1016','s_1021','s_1025',...
    's_1029','s_1032','s_1035','s_1039','s_1045','s_1048','s_1051','s_1056','s_0785','s_4360','s_0739','s_1322'},'stoichCoeffList',[-Kcat1 -Kcat2 -Kcat3 -Kcat4 -Kcat5...
    -Kcat6 -Kcat7 -Kcat8 -Kcat9 -Kcat10 -Kcat11 -Kcat12 -Kcat13 -Kcat14 -Kcat15 -Kcat16 -Kcat17 -Kcat18 -Kcat19 -0.36 1 0.36 0.36],'reversible',false);
model = addReaction(model,'newRxn2','metaboliteList',{'s_4360','s_4361'},'stoichCoeffList',[-1 1],'reversible',false); 
model = addReaction(model,'newRxn3','metaboliteList',{'s_4361'},'stoichCoeffList',[-1],'reversible',false); 
model.metComps(4147)=1;
model.metComps(4148)=3;
model=changeRxnBounds(model,'r_1714_REV',1000,'u');
model=changeRxnBounds(model,'r_2111',0.1,'l');
model=changeObjective(model,'newRxn3');
cd ../../strain_design_ecYeast
c_sourceID = 'D-glucose exchange (reversible)';
model = lychangeMedia_batch(model,c_sourceID,'YEP');
FBAsolution=optimizeCbModel(model)
cd ../result_ecYeast/Others/Models
save ecGlucagon.mat model 





