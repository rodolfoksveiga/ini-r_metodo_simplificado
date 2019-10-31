#C?LCULO DO N?VEL DE EFICI?NCIA ENERG?TICA ATRAV?S DO M?TODO SIMPLIFICADO DO INI-R ####

#LOAD DAS LIBRARYS ####
library(caret)
library(dplyr)

#DEFINI??O DO DIRET?RIO PARA LEITURA DO DATA FRAME (df) E DO DATA FRAME PARA A CONDI??O REAL ####
setwd('C:/Users/Rodolfo/Google Drive/01.LabEEE/MetodoSimplificadoR') #AQUI O USU?RIO DEVE COLOCAR O ENDERE?O DA PASTA MetodoSimplificadoR NO SEU PR?PRIO COMPUTADOR.
#df PARA A CONDI??O REAL
df.env_real = read.csv('env.inputs.csv')

#VARI?VEIS CLIM?TICAS ####
#BEL?M
df.env_real$TMA[df.env_real$local=='belem_pa'] = 28.71
df.env_real$dpT[df.env_real$local=='belem_pa'] = 0.32
df.env_real$AMA[df.env_real$local=='belem_pa'] = 7.05
df.env_real$dpA[df.env_real$local=='belem_pa'] = 0.26
#BELO HORIZONTE
df.env_real$TMA[df.env_real$local=='belo.horizonte_mg'] = 23.27
df.env_real$dpT[df.env_real$local=='belo.horizonte_mg'] = 1.54
df.env_real$AMA[df.env_real$local=='belo.horizonte_mg'] = 7.10
df.env_real$dpA[df.env_real$local=='belo.horizonte_mg'] = 0.62
#CUIAB?
df.env_real$TMA[df.env_real$local=='cuiaba_mt'] = 27.92
df.env_real$dpT[df.env_real$local=='cuiaba_mt'] = 1.56
df.env_real$AMA[df.env_real$local=='cuiaba_mt'] = 8.73
df.env_real$dpA[df.env_real$local=='cuiaba_mt'] = 1.18
#CURITIBA
df.env_real$TMA[df.env_real$local=='curitiba_pr'] = 18.28
df.env_real$dpT[df.env_real$local=='curitiba_pr'] = 2.80
df.env_real$AMA[df.env_real$local=='curitiba_pr'] = 5.75
df.env_real$dpA[df.env_real$local=='curitiba_pr'] = 1.78
#FLORIAN?POLIS
df.env_real$TMA[df.env_real$local=='florianopolis_sc'] = 21.47
df.env_real$dpT[df.env_real$local=='florianopolis_sc'] = 3.01
df.env_real$AMA[df.env_real$local=='florianopolis_sc'] = 5.09
df.env_real$dpA[df.env_real$local=='florianopolis_sc'] = 1.07
#FOZ DO IGUA?U
df.env_real$TMA[df.env_real$local=='foz.do.iguacu_pr'] = 22.73
df.env_real$dpT[df.env_real$local=='foz.do.iguacu_pr'] = 4.86
df.env_real$AMA[df.env_real$local=='foz.do.iguacu_pr'] = 6.73
df.env_real$dpA[df.env_real$local=='foz.do.iguacu_pr'] = 2.48
#GOIANIA
df.env_real$TMA[df.env_real$local=='goiania_go'] = 24.76
df.env_real$dpT[df.env_real$local=='goiania_go'] = 2.14
df.env_real$AMA[df.env_real$local=='goiania_go'] = 9.37
df.env_real$dpA[df.env_real$local=='goiania_go'] = 0.99
#MANAUS
df.env_real$TMA[df.env_real$local=='manaus_am'] = 28.47
df.env_real$dpT[df.env_real$local=='manaus_am'] = 0.81
df.env_real$AMA[df.env_real$local=='manaus_am'] = 5.60
df.env_real$dpA[df.env_real$local=='manaus_am'] = 0.82
#NITER?I
df.env_real$TMA[df.env_real$local=='niteroi_rj'] = 23.03
df.env_real$dpT[df.env_real$local=='niteroi_rj'] = 1.73
df.env_real$AMA[df.env_real$local=='niteroi_rj'] = 4.15
df.env_real$dpA[df.env_real$local=='niteroi_rj'] = 0.69
#PORTO ALEGRE
df.env_real$TMA[df.env_real$local=='porto.alegre_rs'] = 21.07
df.env_real$dpT[df.env_real$local=='porto.alegre_rs'] = 4.10
df.env_real$AMA[df.env_real$local=='porto.alegre_rs'] = 5.90
df.env_real$dpA[df.env_real$local=='porto.alegre_rs'] = 1.94
#RIO DE JANEIRO
df.env_real$TMA[df.env_real$local=='rio.de.janeiro_rj'] = 24.54
df.env_real$dpT[df.env_real$local=='rio.de.janeiro_rj'] = 1.97
df.env_real$AMA[df.env_real$local=='rio.de.janeiro_rj'] = 7.32
df.env_real$dpA[df.env_real$local=='rio.de.janeiro_rj'] = 1.25
#SALVADOR
df.env_real$TMA[df.env_real$local=='salvador_ba'] = 26.89
df.env_real$dpT[df.env_real$local=='salvador_ba'] = 1.28
df.env_real$AMA[df.env_real$local=='salvador_ba'] = 4.43
df.env_real$dpA[df.env_real$local=='salvador_ba'] = 0.99
#SANTA MARIA
df.env_real$TMA[df.env_real$local=='santa.maria_rs'] = 19.80
df.env_real$dpT[df.env_real$local=='santa.maria_rs'] = 4.51
df.env_real$AMA[df.env_real$local=='santa.maria_rs'] = 5.58
df.env_real$dpA[df.env_real$local=='santa.maria_rs'] = 2.10
#S?O PAULO
df.env_real$TMA[df.env_real$local=='sao.paulo_sp'] = 21.13
df.env_real$dpT[df.env_real$local=='sao.paulo_sp'] = 1.84
df.env_real$AMA[df.env_real$local=='sao.paulo_sp'] = 6.56
df.env_real$dpA[df.env_real$local=='sao.paulo_sp'] = 0.65
#TERESINA
df.env_real$TMA[df.env_real$local=='teresina_pi'] = 29.27
df.env_real$dpT[df.env_real$local=='teresina_pi'] = 0.95
df.env_real$AMA[df.env_real$local=='teresina_pi'] = 9.58
df.env_real$dpA[df.env_real$local=='teresina_pi'] = 1.98
#URUBICI
df.env_real$TMA[df.env_real$local=='urubici_sc'] = 10.88
df.env_real$dpT[df.env_real$local=='urubici_sc'] = 1.88
df.env_real$AMA[df.env_real$local=='urubici_sc'] = 2.49
df.env_real$dpA[df.env_real$local=='urubici_sc'] = 0.74


#1. ENVOLT?RIA (ANEXO B.1 DO INI-R) ####

#CONVERS?O DOS CARACTERES CLIM?TICOS PARA VALORES INTEIROS (-1 <- 1A; -2 <- 1B; -3 <- 1C) ####
df.env_ref = df.env_real
gcl_real = as.character(df.env_real$gcl)
gcl_real[gcl_real=='1a'] = -1
gcl_real[gcl_real=='1b'] = -2
gcl_real = as.numeric(gcl_real)
df.env_real$gcl = gcl_real
gcl_ref = as.character(df.env_ref$gcl)
gcl_ref[gcl_ref=='1a'] = -1
gcl_ref[gcl_ref=='1b'] = -2
gcl_ref = as.numeric(gcl_ref)
df.env_ref$gcl = gcl_ref
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(gcl_real,gcl_ref)

#ALTERA??O DOS VALORES PARA A CONDI??O DE REFER?NCIA ####
df.env_ref$u_par_ext = 3.65
df.env_ref$abspar = 0.6
df.env_ref$ct_par_ext = 2
df.env_ref$u_cob = ifelse(df.env_ref$exp_cob==1,2.02,df.env_real$u_cob)
df.env_ref$abscob = ifelse(df.env_ref$exp_cob==1,ifelse(df.env_ref$gcl>8,0.4,0.6),df.env_real$abscob)
df.env_ref$ct_cob = ifelse(df.env_ref$exp_cob==1,1,df.env_real$ct_cob)
df.env_ref$openfac = 0.5
df.env_ref$hjan = 1/df.env_real$pedireito
df.env_ref$fs_vid = 0.87
df.env_ref$u_vid = 5.7
df.env_ref$veneziana = 0
df.env_ref$tamanhoprojecao = 0
#?REAS M?NIMAS DE ABERTURA PARA A CONDI??O DE REFER?NCIA
area.vid.norte = df.env_real$wwr_norte*df.env_real$area_par_exp_norte
area.vid.leste = df.env_real$wwr_leste*df.env_real$area_par_exp_leste
area.vid.sul = df.env_real$wwr_sul*df.env_real$area_par_exp_sul
area.vid.oeste = df.env_real$wwr_oeste*df.env_real$area_par_exp_oeste
area.vid.total = area.vid.norte+area.vid.leste+area.vid.sul+area.vid.oeste
#WWR NORTE
df.env_ref$wwr_norte = area.vid.norte/area.vid.total*df.env_real$area_zona*ifelse((df.env_real$regiao=='centro-oeste')|(df.env_real$regiao=='sul'),
          ifelse(df.env_real$wwr_norte!=0,0.14/df.env_real$area_par_exp_norte,0),ifelse((df.env_real$regiao=='nordeste')|(df.env_real$regiao=='sudeste'),
                    ifelse(df.env_real$wwr_norte!=0,0.16/df.env_real$area_par_exp_norte,0),ifelse(df.env_real$wwr_norte!=0,0.24/df.env_real$area_par_exp_norte,0)))
#WWR LESTE
df.env_ref$wwr_leste = area.vid.leste/area.vid.total*df.env_real$area_zona*ifelse((df.env_real$regiao=='centro-oeste')|(df.env_real$regiao=='sul'),
          ifelse(df.env_real$wwr_leste!=0,0.14/df.env_real$area_par_exp_leste,0),ifelse((df.env_real$regiao=='nordeste')|(df.env_real$regiao=='sudeste'),
                    ifelse(df.env_real$wwr_leste!=0,0.16/df.env_real$area_par_exp_leste,0),ifelse(df.env_real$wwr_leste!=0,0.24/df.env_real$area_par_exp_leste,0)))
#WWR SUL
df.env_ref$wwr_sul = area.vid.sul/area.vid.total*df.env_real$area_zona*ifelse((df.env_real$regiao=='centro-oeste')|(df.env_real$regiao=='sul'),
          ifelse(df.env_real$wwr_sul!=0,0.14/df.env_real$area_par_exp_sul,0),ifelse((df.env_real$regiao=='nordeste')|(df.env_real$regiao=='sudeste'),
                    ifelse(df.env_real$wwr_sul!=0,0.16/df.env_real$area_par_exp_sul,0),ifelse(df.env_real$wwr_sul!=0,0.24/df.env_real$area_par_exp_sul,0)))
#WWR OESTE
df.env_ref$wwr_oeste = area.vid.oeste/area.vid.total*df.env_real$area_zona*ifelse((df.env_real$regiao=='centro-oeste')|(df.env_real$regiao=='sul'),
          ifelse(df.env_real$wwr_oeste!=0,0.14/df.env_real$area_par_exp_oeste,0),ifelse((df.env_real$regiao=='nordeste')|(df.env_real$regiao=='sudeste'),
                    ifelse(df.env_real$wwr_oeste!=0,0.16/df.env_real$area_par_exp_oeste,0),ifelse(df.env_real$wwr_oeste!=0,0.24/df.env_real$area_par_exp_oeste,0)))
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(area.vid.norte,area.vid.leste,area.vid.sul,area.vid.oeste,area.vid.total)

#REDE NEURAL ####
#C?LCULO DO HEATING, COOLING E PHOCT (PERCENTUAL DE HORAS EM CONFORTO T?RMICO) ATRAV?S DE REDES NEURAIS
#HEATING
load('heating_model_mazzaferro.rna')
#CONDI??O REAL
heating_real = c(heating=(predict(nnetFit,df.env_real)))
#CONDI??O DE REFER?NCIA
heating_ref = c(heating=(predict(nnetFit,df.env_ref)))

#COOLING
load('cooling_model_mazzaferro.rna')
#CONDI??O REAL
cooling_real = c(cooling=(predict(nnetFit,df.env_real)))
#CONDI??O DE REFER?NCIA
cooling_ref = c(cooling=(predict(nnetFit,df.env_ref)))

#PHORAS
load('phoras_model_rsquared_ 09402195.rna')
#CONDI??O REAL
phoras_real = c(phoras=(predict(nnetFit,df.env_real)))
#CONDI??O DE REFER?NCIA
phoras_ref = c(phoras=(predict(nnetFit,df.env_ref)))

#CRIA??O DO DATA FRAME DE AQUECIMENTO DE ?GUA (POR APP) ####
df.env_real = cbind(df.env_real,'heating'=heating_real,'cooling'=cooling_real,'phoct'=phoras_real)
df.env_ref = cbind(df.env_ref,'heating'=heating_ref,'cooling'=cooling_ref,'phoct'=phoras_ref)
#TRANSFORMA??ES NECESS?RIAS PARA O FUNCIONAMENTO DA REDE NEURAL
df.env_real$heating = (df.env_real$heating)^3
df.env_real$cooling = (df.env_real$cooling)^3
df.env_ref$heating = (df.env_ref$heating)^3
df.env_ref$cooling = (df.env_ref$cooling)^3
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(heating_real,heating_ref,cooling_real,cooling_ref,phoras_real,phoras_ref,nnetFit)

#CARGAS T?RMICAS MENORES QUE 1 TEM O VALOR APROXIMADO PARA 1.00 ####
df.env.bruto_real = df.env_real
df.env.bruto_ref = df.env_ref
df.env_real$heating = ifelse(df.env_real$heating<=1,1,df.env_real$heating)
df.env_real$cooling = ifelse(df.env_real$cooling<=1,1,df.env_real$cooling)
df.env_ref$heating = ifelse(df.env_ref$heating<=1,1,df.env_ref$heating)
df.env_ref$cooling = ifelse(df.env_ref$cooling<=1,1,df.env_ref$cooling)

#PERCENTUAL DE REDU??O DE CARGA T?RMICA (POR APP) ####
red.heating = ((df.env_ref$heating-df.env_real$heating)/df.env_ref$heating)*100
red.cooling = ((df.env_ref$cooling-df.env_real$cooling)/df.env_ref$cooling)*100

#LIMITES INFERIORES A, B E C PARA HEATING E COOLING DA ENVOLT?RIA (POR APP) ####
#OS LIMITES INFERIORES DE AQUECIMENTO E RESFRIAMENTO EST?O NO DATA FRAME EXTERNO, LIDO DO DIRET?RIO WORKING DIRECTORY (PASTA ATRELADA AO SCRIPT)
#O DATA FRAME PARA HEATING (limites.heating.csv) E O DATA FRAME PARA COOLING (limites.cooling.csv)
limites.heating = read.csv('limites.heating-blocked.csv')
limites.cooling = read.csv('limites.cooling-blocked.csv')
lim.heating = subset(limites.heating,limites.heating$gcl==df.env_real$gcl[1])
lim.cooling = subset(limites.cooling,limites.cooling$gcl==df.env_real$gcl[1])
for(i in 2:length(df.env_real$gcl)){
  single.lim.heating = subset(limites.heating,limites.heating$gcl==df.env_real$gcl[i])
  single.lim.cooling = subset(limites.cooling,limites.cooling$gcl==df.env_real$gcl[i])
  lim.heating = rbind(lim.heating,single.lim.heating)
  lim.cooling = rbind(lim.cooling,single.lim.cooling)
}

env_app = data.frame('n.uh'=df.env_real$n_uh,'zona'=df.env_real$zona,'local'=df.env_real$local,'gcl'=df.env_real$gcl,'area'=df.env_real$area_zona,
                'heating_real'=df.env_real$heating,'cooling_real'=df.env_real$cooling,'phoct_real'=df.env_real$phoct,'heating_ref'=df.env_ref$heating,
                  'cooling_ref'=df.env_ref$cooling,'phoct_ref'=df.env_ref$phoct,'red.heating'=red.heating,
                    'red.cooling'=red.cooling)
#REMO??O DOS DATA FRAMES QUE N?O SER?O MAIS UTILIZADOS
rm(df.env_real,df.env_ref,limites.heating,limites.cooling,single.lim.heating,single.lim.cooling,i)

env_app$lim.inf.a.heating = ifelse(env_app$gcl>8,NA,ifelse(env_app$area<25,ifelse(env_app$zona==0,lim.heating$a_menor_25_0,
                                lim.heating$a_menor_25_1),ifelse(env_app$zona==0,lim.heating$a_maior_igual_25_0,lim.heating$a_maior_igual_25_1)))
env_app$lim.inf.b.heating = ifelse(env_app$gcl>8,NA,ifelse(env_app$area<25,ifelse(env_app$zona==0,lim.heating$b_menor_25_0,
                                lim.heating$b_menor_25_1),ifelse(env_app$zona==0,lim.heating$b_maior_igual_25_0,lim.heating$b_maior_igual_25_1)))
env_app$lim.inf.a.cooling = ifelse(env_app$area<25,ifelse(env_app$zona==0,lim.cooling$a_menor_25_0,lim.cooling$a_menor_25_1),
                                ifelse(env_app$zona==0,lim.cooling$a_maior_igual_25_0,lim.cooling$a_maior_igual_25_1))
env_app$lim.inf.b.cooling = ifelse(env_app$area<25,ifelse(env_app$zona==0,lim.cooling$b_menor_25_0,lim.cooling$b_menor_25_1),
                                ifelse(env_app$zona==0,lim.cooling$b_maior_igual_25_0,lim.cooling$b_maior_igual_25_1))
env_app$lim.inf.c = rep(0,length(env_app$n.uh))

#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(lim.heating,lim.cooling,red.heating,red.cooling)

#EQUIVALENTE NUM?RICO E CARGA T?RMICA (POR APP) ####
#EQUIVALENTE NUM?RICO PARA HEATING E COOLING E EQUIVALENTE NUM?RICO MULTIPLICADO PELA ?REA DA ZONA (POR APP)
eq.num.heating_1 = 3+(env_app$red.heating-env_app$lim.inf.a.heating)/(100-env_app$lim.inf.a.heating)
eq.num.heating_2 = 2+(env_app$lim.inf.a.heating-env_app$red.heating)/(env_app$lim.inf.a.heating-env_app$lim.inf.b.heating)
eq.num.heating_3 = 1+(env_app$red.heating/env_app$lim.inf.b.heating)
env_app$eq.num.heating = ifelse(env_app$red.heating>=env_app$lim.inf.a.heating,eq.num.heating_1,
                                ifelse(env_app$red.heating>=env_app$lim.inf.b.heating,eq.num.heating_2,
                                       ifelse(env_app$red.heating>=env_app$lim.inf.c,eq.num.heating_3,0)))
eq.num.cooling_1 = 3+(env_app$red.cooling-env_app$lim.inf.a.cooling)/(100-env_app$lim.inf.a.cooling)
eq.num.cooling_2 = 2+(env_app$lim.inf.a.cooling-env_app$red.cooling)/(env_app$lim.inf.a.cooling-env_app$lim.inf.b.cooling)
eq.num.cooling_3 = 1+(env_app$red.cooling/env_app$lim.inf.b.cooling)
env_app$eq.num.cooling = ifelse(env_app$red.cooling>=env_app$lim.inf.a.cooling,eq.num.cooling_1,
                                ifelse(env_app$red.cooling>=env_app$lim.inf.b.cooling,eq.num.cooling_2,
                                       ifelse(env_app$red.cooling>=env_app$lim.inf.c,eq.num.cooling_3,0)))

#PARA EQUIVALENTE NUM?RICO DE APP MENOR QUE 1, UTILIZA-SE O VALOR 1
#PARA EQUIVALENTE NUM?RICO DE APP COM CARGA T?RMICA MENOR QUE 1, UTILIZA-SE O VALOR 3
env_app$eq.num.heating = ifelse(env_app$eq.num.heating<1,0,env_app$eq.num.heating)
env_app$eq.num.heating = ifelse(env_app$gcl>8,NA,ifelse(df.env.bruto_real$heating<1,3,ifelse(df.env.bruto_ref$heating<1,3,env_app$eq.num.heating)))
env_app$eq.num.cooling = ifelse(env_app$eq.num.cooling<1,0,env_app$eq.num.cooling)
env_app$eq.num.cooling = ifelse(df.env.bruto_real$cooling<1,3,ifelse(df.env.bruto_ref$cooling<1,3,env_app$eq.num.cooling))

#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(df.env.bruto_real,df.env.bruto_ref,eq.num.heating_1,eq.num.heating_2,eq.num.heating_3,eq.num.cooling_1,eq.num.cooling_2,eq.num.cooling_3)

#EQUIVALENTE NUM?RICO MULTIPLICADO PELA ?REA DA ZONA (POR APP)
env_app$eq.num.heating.area = env_app$eq.num.heating*env_app$area
env_app$eq.num.cooling.area = env_app$eq.num.cooling*env_app$area

#CARGA T?RMICA MULTIPLICADA PELA ?REA DA ZONA - kWh/ano
env_app$heating.area_real = env_app$heating_real*env_app$area
env_app$cooling.area_real = env_app$cooling_real*env_app$area
env_app$heating.area_ref = env_app$heating_ref*env_app$area
env_app$cooling.area_ref = env_app$cooling_ref*env_app$area
#TRANSFERIR AS COLUNAS DE HEATING.AREA E COOLING.AREA PARA O LADO DAS COLUNAS E HEATING E COOLING
env_app = env_app %>%
  select('n.uh','zona','local','gcl','area','heating_real','heating.area_real','heating_ref','heating.area_ref','red.heating','cooling_real',
         'cooling.area_real','cooling_ref','cooling.area_ref','red.cooling',everything())

#EQUIVALENTE NUM?RICO E CARGA T?RMICA (POR UH) ####
area_uh = rep(NA,length(unique(env_app$n.uh)))
eq.num.heating_uh = rep(NA,length(unique(env_app$n.uh)))
eq.num.cooling_uh = rep(NA,length(unique(env_app$n.uh)))
eq.num_uh = rep(NA,length(unique(env_app$n.uh)))
heating.area_uh.real = rep(NA,length(unique(env_app$n.uh)))
heating.area_uh.ref = rep(NA,length(unique(env_app$n.uh)))
cooling.area_uh.real = rep(NA,length(unique(env_app$n.uh)))
cooling.area_uh.ref = rep(NA,length(unique(env_app$n.uh)))
for(i in 1:length(unique(env_app$n.uh))){
  single.env_uh = subset(env_app,n.uh==i)
  eq.num.heating_uh[i] = sum(single.env_uh$eq.num.heating.area)/sum(single.env_uh$area)
  eq.num.cooling_uh[i] = sum(single.env_uh$eq.num.cooling.area)/sum(single.env_uh$area)
  if(unique(single.env_uh$gcl<=8)){
    eq.num_uh[i] = ((eq.num.heating_uh[i]*sum(single.env_uh$heating.area_ref))+(eq.num.cooling_uh[i]*sum(single.env_uh$cooling.area_ref)))/
      (sum(single.env_uh$heating.area_ref)+sum(single.env_uh$cooling.area_ref))
  }
  if(unique(single.env_uh$gcl>8)){
    eq.num_uh[i] = (eq.num.cooling_uh[i]*sum(single.env_uh$cooling.area_ref))/sum(single.env_uh$cooling.area_ref)
  }
  area_uh[i] = sum(single.env_uh$area)
  heating.area_uh.real[i] = sum(single.env_uh$heating.area_real)
  cooling.area_uh.real[i] = sum(single.env_uh$cooling.area_real)
  heating.area_uh.ref[i] = sum(single.env_uh$heating.area_ref)
  cooling.area_uh.ref[i] = sum(single.env_uh$cooling.area_ref)
}
heating_uh.real = heating.area_uh.real/area_uh
heating_uh.ref = heating.area_uh.ref/area_uh
red.heating_uh = ((heating_uh.ref-heating_uh.real)/heating_uh.ref)*100
cooling_uh.real = cooling.area_uh.real/area_uh
cooling_uh.ref = cooling.area_uh.ref/area_uh
red.cooling_uh = ((cooling_uh.ref-cooling_uh.real)/cooling_uh.ref)*100

#DATA FRAME CORRESPONDENTE AOS DADOS DA UH (POR UH)
env_uh = cbind('n.uh'=unique(env_app$n.uh),'area'=area_uh,'heating_real'=heating_uh.real,'heating.area_real'=heating.area_uh.real,
            'heating_ref'=heating_uh.ref,'heating.area_ref'=heating.area_uh.ref,'red.heating'=red.heating_uh,'cooling_real'=cooling_uh.real,
            'cooling.area_real'=cooling.area_uh.real,'cooling_ref'=cooling_uh.ref,'cooling.area_ref'=cooling.area_uh.ref,'red.cooling'=red.cooling_uh,
            'eq.num.heating'=eq.num.heating_uh,'eq.num.cooling'=eq.num.cooling_uh,'eq.num'=eq.num_uh)
env_uh = data.frame(env_uh)
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(area_uh,eq.num.heating_uh,eq.num.cooling_uh,eq.num_uh,heating_uh.real,heating.area_uh.real,cooling_uh.real,cooling.area_uh.real,heating_uh.ref,heating.area_uh.ref,
   cooling_uh.ref,cooling.area_uh.ref,red.heating_uh,red.cooling_uh,single.env_uh,i)

#CONSUMO DE ENERGIA (POR UH) ####
#CONSUMO DE ENERGIA EL?TRICA COM HEATING E COOLING (POR UH)
env_uh$cee.heating_real = env_uh$heating.area_real/3.24
env_uh$cee.cooling_real = env_uh$cooling.area_real/3.24
env_uh$cee.total_real = env_uh$cee.heating_real+env_uh$cee.cooling_real
env_uh$cee.heating_ref = env_uh$heating.area_ref/3.24
env_uh$cee.cooling_ref = env_uh$cooling.area_ref/3.24
env_uh$cee.total_ref = env_uh$cee.heating_ref+env_uh$cee.cooling_ref

#CONSUMO DE ENERGIA PRIM?RIA (POR UH)
env_uh$cep.heating_real = env_uh$cee.heating_real*1.6
env_uh$cep.cooling_real = env_uh$cee.cooling_real*1.6
env_uh$cep.total_real = env_uh$cee.total_real*1.6
env_uh$cep.heating_ref = env_uh$cee.heating_ref*1.6
env_uh$cep.cooling_ref = env_uh$cee.cooling_ref*1.6
env_uh$cep.total_ref = env_uh$cee.total_ref*1.6

#CONVERS?O DOS VALORES INTEIROS CLIM?TICOS PARA CARACTERES (1A <- -1; 1B <- -2; 1C <- -3) ####
local_uh = rep(NA,length(env_uh$n.uh))
gcl_uh = rep(NA,length(env_uh$n.uh))
for(i in 1:length(env_uh$n.uh)){
  single.env_app = subset(env_app,n.uh==i)
  local_uh[i] = as.character(unique(single.env_app$local))
  gcl_uh[i] = unique(single.env_app$gcl)
}
gcl_uh = ifelse(gcl_uh==-1,'1a',ifelse(gcl_uh==-2,'1b',gcl_uh))
env_uh = cbind(env_uh,'local'=local_uh,'gcl'=gcl_uh)
env_uh = env_uh %>%
  select('n.uh','local','gcl',everything())
env_app$gcl = ifelse(env_app$gcl==-1,'1a',ifelse(env_app$gcl==-2,'1b',env_app$gcl))
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(local_uh,gcl_uh,single.env_app,i)

#ARREDONDAMENTO DOS DATA FRAMES DE SA?DA PARA 2 CASAS DECIMAIS ####
env.round_app_1 = round(env_app[5:17],2)
env.round_app_2 = round(env_app[23:26],2)
env_app = cbind(env_app[1:4],env.round_app_1,env_app[18:22],env.round_app_2)
env.round_uh = round(env_uh[4:29],2)
env_uh = cbind(env_uh[1:3],env.round_uh)
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(env.round_app_1,env.round_app_2,env.round_uh)

#CLASSIFICA??O DA EFICI?NCIA ENERG?TICA DA ENVOLT?RIA (POR UH) ####
env_uh$classe = ifelse(env_uh$eq.num>=3,'A',ifelse(env_uh$eq.num>=2,'B',ifelse(env_uh$eq.num>=1,'C','D')))

#CRIA??O DOS ARQUIVOS .csv CONTENDO OS OUTPUTS ####
write.csv(env_app,'env_app.csv')
write.csv(env_uh,'env_uh.csv')

#2. AQUECIMENTO DE ?GUA (ANEXO B.2 DO INI-R) ####

#DEFINI??O DO DATA FRAME PARA A CONDI??O REAL ####
#df PARA A CONDI??O REAL
df.aa_real = read.csv('aa.inputs.csv')
#AS TEMPERATURAS DO AR MENSAIS E ANUAIS PARA CIDADES BRASILEIRAS EST?O NO DATA FRAME EXTERNO, LIDO DO DIRET?RIO WORKING DIRECTORY (PASTA ATRELADA AO SCRIPT)
#O DATA FRAME (temp.ar.mes.ano-blocked) CONT?M AS S NA PRIMEIRA COLUNA, LATITUDE, ALTITUDE E AS TEMPERATURAS MENSAIS E ANUAIS NAS PR?XIMAS COLUNAS
temp.ar = read.csv('temp.ar.mes.ano-blocked.csv')

#CRIA??O DO DATA FRAME DE AQUECIMENTO DE ?GUA (POR UH) ####
aa_uh = df.aa_real[1:15]
aa_uh = aa_uh %>%
  select('n.uh','local','gcl','regiao','individ','reserv','recirc','aut.recirc','iso.term.recirc','contr.mult.aq','rec.solar','eaa.rec','tipo.aq','r.aq','n.dorms')

#VOLUME DI?RIO DE CONSUMO DE ?GUA QUENTE (POR UH) ####
aa_uh$n.pessoas = 2*df.aa_real$n.dorms
aa_uh$vol.dia = 50/1000*aa_uh$n.pessoas

#ENERGIA CONSUMIDA NO ATENDIMENTO DA DEMANDA DI?RIA DE ?GUA QUENTE (POR UH) ####
temp.ar.anual = rep(NA,length(df.aa_real$n.uh))
for(i in 1:length(df.aa_real$n.uh)){
  temp.ar.anual[i] = temp.ar$anual[as.character(temp.ar$cidade_estado)==df.aa_real$local[i]]
}
t.u = ifelse(df.aa_real$regiao=='sul'|df.aa_real$regiao=='sudeste'|df.aa_real$regiao=='centro-oeste',40,38)
eaa_1 = 1.162*aa_uh$vol.dia*(t.u-(temp.ar.anual-2))
eaa_2 = 1.162*aa_uh$vol.dia*(60-(temp.ar.anual-2))
aa_uh$eaa = ifelse(df.aa_real$reserv==0,eaa_1,eaa_2)
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(temp.ar.anual,t.u,eaa_1,eaa_2,i)

#DESENVOLVIMENTO DO df PARA A CONDI??O DE REFER?NCIA ####
df.aa_ref = df.aa_real
df.aa_ref$tipo.aq = 1
df.aa_ref$r.aq = ifelse(df.aa_real$reserv==1,0.85,0.95)
df.aa_ref$recirc = 0
df.aa_ref$aut.recirc = df.aa_ref$iso.term.recirc = df.aa_ref$contr.mult.aq = 1
df.aa_ref$eaa.rec = df.aa_ref$rad.incid.dia = df.aa_ref$sup.abs.c = df.aa_ref$fat.ef.optica.c = df.aa_ref$mod.ang.incid = df.aa_ref$coef.glob.c =
  df.aa_ref$fat.cor.ct = df.aa_ref$vol.acum.s = df.aa_ref$fat.per.recirc = df.aa_ref$rec.solar = df.aa_ref$l.recirc = NULL

#ENERGIA PARA AQUECIMENTO DE ?GUA PROVENIENTE DE SISTEMAS QUE RECUPERAM CALOR OU DE ENERGIA SOLAR T?RMICA (POR UH) ####
#PROVENIENTE DE SISTEMAS QUE RECUPERAM CALOR
aa_uh$eaa.rec_real = df.aa_real$eaa.rec
#PROVENIENTE DE ENERGIA SOLAR T?RMICA
t.u = as.numeric(rep(NA,length(df.aa_real$n.uh)))
fat.adim = as.numeric(rep(NA,length(df.aa_real$n.uh)))
fat = as.numeric(rep(NA,length(df.aa_real$n.uh)))
k_1 = as.numeric(rep(NA,length(df.aa_real$n.uh)))
es.incid.mes = as.numeric(rep(NA,12))
es.abs.mes = as.numeric(rep(NA,12))
eaa.sol = as.numeric(rep(NA,12))
k_2 = as.numeric(rep(NA,12))
es.per.mes = as.numeric(rep(NA,12))
d_1 = as.numeric(rep(NA,12))
d_2 = as.numeric(rep(NA,12))
frac.s.mes = as.numeric(rep(NA,12))
aa_uh$eaa.sol_real = rep(NA,length(df.aa_real$n.uh))
for(i in 1:length(df.aa_real$n.uh)){
  if(df.aa_real$rec.solar[i]==1){
    n.dias.mes = c(31,28,31,30,31,30,31,31,30,31,30,31)
    t.u[i] = ifelse(df.aa_real$regiao[i]=='sul'|df.aa_real$regiao[i]=='sudeste'|df.aa_real$regiao[i]=='centro-oeste',40,38)
    single.temp.ar = subset(temp.ar,as.character(temp.ar$cidade_estado)==df.aa_real$local[i])
    fat.adim[i] = as.numeric(df.aa_real$fat.ef.optica.c[i]*df.aa_real$mod.ang.incid[i]*df.aa_real$fat.cor.ct[i])
    fat[i] = df.aa_real$coef.glob.c[i]*df.aa_real$fat.cor.ct[i]/1000
    k_1[i] = (df.aa_real$vol.acum.s[i]/(75*df.aa_real$sup.abs.c[i]))^(-0.25)
    for(j in 1:12){
      es.incid.mes[j] = df.aa_real$rad.incid.dia[i]*n.dias.mes[j]
      es.abs.mes[j] = df.aa_real$sup.abs.c[i]*fat.adim*es.incid.mes[j]
      k_2[j] = (11.6+1.18*t.u[i]+3.86*(as.numeric(single.temp.ar[j+3])-2)-2.32*as.numeric(single.temp.ar[j+3]))/(100-as.numeric(single.temp.ar[j+3]))
      es.per.mes[j] = df.aa_real$sup.abs.c[i]*fat*(100-as.numeric(single.temp.ar[j+3]))*n.dias.mes[j]*24*k_1[i]*k_2[j]
      d_1[j] = es.abs.mes[j]/(aa_uh$eaa[i]*n.dias.mes[j])
      d_2[j] = es.per.mes[j]/(aa_uh$eaa[i]*n.dias.mes[j])
      frac.s.mes[j] = 1.029*d_1[j]-0.065*d_2[j]-0.245*(d_1[j]^2)+0.0018*(d_2[j]^2)+0.0215*(d_1[j]^3)
      eaa.sol[j] = frac.s.mes[j]*aa_uh$eaa[i]*n.dias.mes[j]/365
    }
    aa_uh$eaa.sol_real[1] = sum(eaa.sol)
  }
  aa_uh$eaa.sol_real[df.aa_real$rec.solar==0] = 0
  #REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
  rm(es.incid.mes,es.abs.mes,k_2,es.per.mes,d_1,d_2,frac.s.mes,eaa.sol)
}
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(n.dias.mes,t.u,single.temp.ar,fat.adim,fat,k_1,i,j)
#TOTAL: SOMA DA PARCELA PROVENIENTE DE SISTEMAS QUE RECUPERAM CALOR DA ENERGIA SOLAR T?RMICA
aa_uh$eaa.rec.sol_real = aa_uh$eaa.rec_real+aa_uh$eaa.sol_real
aa_uh$eaa.rec.sol_ref = 0

#PERDAS T?RMICAS NA TUBULA??O DO SISTEMA DE DISTRIBUI??O (POR UH) ####
aa_uh$eaa.per.dist_real[df.aa_real$individ==0] = 2.083*aa_uh$vol.dia*df.aa_real$fat.per.dist*df.aa_real$l.dist
aa_uh$eaa.per.dist_real[df.aa_real$individ==1] = 0
aa_uh$eaa.per.dist_ref = aa_uh$eaa.per.dist_real

#PERDAS T?RMICAS NA TUBULA??O DO SISTEMA DE RECIRCULA??O (POR UH) ####
aa_uh$eaa.per.recirc_real[df.aa_real$recirc==1] = 24*df.aa_real$fat.per.recirc*df.aa_real$l.recirc
aa_uh$eaa.per.recirc_real[df.aa_real$recirc==0] = 0
aa_uh$eaa.per.recirc_ref = 0

#PERDAS T?RMICAS NO RESERVAT?RIO DE ?GUA QUENTE (POR UH) ####
aa_uh$eaa.per.res_real[df.aa_real$reserv==1] = (df.aa_real$t.m.res-temp.ar$anual[as.character(temp.ar$cidade_estado)==df.aa_real$local])*df.aa_real$eaa.res.sby/29
aa_uh$eaa.per.res_real[df.aa_real$reserv==0] = 0
aa_uh$eaa.per.res_ref = aa_uh$eaa.per.res_real

#CONSUMO DE ENERGIA (POR UH) ####
#CONSUMO ANUAL DE ENERGIA EL?TRICA E DE ENERGIA T?RMICA PARA A CONDI??O REAL (POR UH)
aa_uh$caat_real = 365*(aa_uh$eaa-aa_uh$eaa.rec.sol_real+aa_uh$eaa.per.dist_real+aa_uh$eaa.per.recirc_real+aa_uh$eaa.per.res_real)/df.aa_real$r.aq
aa_uh$caae_real = 365*(aa_uh$eaa-aa_uh$eaa.rec.sol_real+aa_uh$eaa.per.dist_real+aa_uh$eaa.per.recirc_real+aa_uh$eaa.per.res_real)/df.aa_real$r.aq
aa_uh$caat_real = ifelse(df.aa_real$tipo.aq==0,aa_uh$caat_real,0)
aa_uh$caae_real = ifelse(df.aa_real$tipo.aq==1,aa_uh$caae_real,0)
aa_uh$caap_real = 1.1*aa_uh$caat_real+1.6*aa_uh$caae_real
#CONSUMO ANUAL DE ENERGIA EL?TRICA E DE ENERGIA T?RMICA PARA A CONDI??O DE REFER?NCIA (POR UH)
aa_uh$caat_ref = 365*(aa_uh$eaa-aa_uh$eaa.rec.sol_ref+aa_uh$eaa.per.dist_ref+aa_uh$eaa.per.recirc_ref+aa_uh$eaa.per.res_ref)/df.aa_ref$r.aq
aa_uh$caae_ref = 365*(aa_uh$eaa-aa_uh$eaa.rec.sol_ref+aa_uh$eaa.per.dist_ref+aa_uh$eaa.per.recirc_ref+aa_uh$eaa.per.res_ref)/df.aa_ref$r.aq
aa_uh$caat_ref = ifelse(df.aa_ref$tipo.aq==0,aa_uh$caat_ref,0)
aa_uh$caae_ref = ifelse(df.aa_ref$tipo.aq==1,aa_uh$caae_ref,0)
aa_uh$caap_ref = 1.1*aa_uh$caat_ref+1.6*aa_uh$caae_ref
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(df.aa_real,df.aa_ref,temp.ar)

#CLASSIFICA??O DA EFICI?NCIA ENERG?TICA DO SISTEMA DE AQUECIMENTO DE ?GUA (POR UH) ####
aa_uh$red.aa = ((aa_uh$caap_ref-aa_uh$caap_real)/aa_uh$caap_ref)*100
aa_uh$classe[aa_uh$reserv==1] = ifelse(aa_uh$red.aa>=30,'A',ifelse(aa_uh$red.aa>=20,'B',ifelse(aa_uh$red.aa>=10,'C',ifelse(aa_uh$red.aa>=0,'D','E'))))
aa_uh$classe[aa_uh$reserv==0] = ifelse(aa_uh$red.aa>=21,'A',ifelse(aa_uh$red.aa>=14,'B',ifelse(aa_uh$red.aa>=7,'C',ifelse(aa_uh$red.aa>=0,'D','E'))))
#AN?LISE DOS PR?-REQUISITOS, CASO QUALQUER PR?-REQUISITO SEJA DESRESPEITADO A CLASSE M?XIMA DE EFICI?NCIA POSS?VEL DE ALCAN?AR ? A CLASSE "B"
aa_uh$classe[(aa_uh$aut.recirc==0)|(aa_uh$iso.term.recirc==0)|(aa_uh$contr.mult.aq==0)] = ifelse(aa_uh$classe=='A','B',aa_uh$classe)

#ARREDONDAMENTO DOS DATA FRAMES DE SA?DA PARA 2 CASAS DECIMAIS ####
aa.round_uh = round(aa_uh[5:35],2)
aa_uh = cbind(aa_uh[1:4],aa.round_uh,aa_uh[36])
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(aa.round_uh)

#CRIA??O DOS ARQUIVOS .csv CONTENDO OS OUTPUTS ####
write.csv(aa_uh,'aa_uh.csv')


#3. GERA??O LOCAL DE ENERGIA RENOV?VEL, USO RACIONAL DE ?GUA E EMISS?O DE DI?XIDO DE CARBONO (ANEXO D, E E F DO INI-R, RESPECTIVAMENTE) ####

#DEFINI??O O DIRET?RIO PARA LEITURA DO DATA FRAME (df) E DO DATA FRAME PARA A CONDI??O REAL ####
df.extra_real = read.csv('extra.inputs.csv')
#df PARA A CONDI??O REAL
geral_uh = df.extra_real
geral_uh = geral_uh[1:6]

#GERA??O LOCAL DE ENERGIA RENOV?VEL (ANEXO D DO INI-R) ####
ceq = aa_uh$n.pessoas*28.37*12
cee.sem.ger.ren_real = env_uh$cee.total_real+aa_uh$caae_real+ceq
geral_uh$pge = (df.extra_real$gee*100)/cee.sem.ger.ren_real
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(cee.sem.ger.ren_real,ceq)

#USO RACIONAL DE ?GUA (ANEXO E DO INI-R) ####
geral_uh$cagua_real = 365*aa_uh$n.pessoas*(df.extra_real$vaz.bs*5+df.extra_real$vaz.lav*1*5*df.extra_real$vaz.bs*8*1+df.extra_real$vaz.pia*1*4)
geral_uh$cagua_ref = 365*aa_uh$n.pessoas*(6*5+9*1*5*6*8*1+15*1*4)
geral_uh$econ.agua = ((geral_uh$cagua_ref-(geral_uh$cagua_real-df.extra_real$o.a.n.pot))/geral_uh$cagua_ref)*100

#EMISS?O DE DI?XIDO DE CARBONO (ANEXO F DO INI-R) ####
ceq = aa_uh$n.pessoas*28.37*12
cee = env_uh$cee.total_real+aa_uh$caae_real+ceq-geral_uh$gee
cet = aa_uh$caat_real
geral_uh$emis.co2 = (cee*0.09+cet*0.202)/1000


#CONSUMOS FINAIS (INTEM 7 DO INI-R) ####
geral_uh$cee_real = cee
geral_uh$cet_real = cet
geral_uh$cep_real = geral_uh$cee_real*1.6+geral_uh$cet_real*1.1
geral_uh$cee_ref = env_uh$cee.total_ref+aa_uh$caae_ref+ceq
geral_uh$cet_ref = aa_uh$caat_ref
geral_uh$cep_ref = geral_uh$cee_ref*1.6+geral_uh$cet_ref*1.1
geral_uh$red.cep = ((geral_uh$cep_ref-geral_uh$cep_real)/geral_uh$cep_ref)*100
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(ceq,cee,cet,df.extra_real)

#CONVERS?O DOS CARACTERES CLIM?TICOS PARA VALORES INTEIROS (-1 <- 1A; -2 <- 1B; -3 <- 1C) ####
gcl = as.character(geral_uh$gcl)
gcl[gcl=='1a'] = -1
gcl[gcl=='1b'] = -2
gcl = as.numeric(gcl)
geral_uh$gcl = gcl
#REMO??O DAS VARI?VEIS QUE N?O SER?O MAIS UTILIZADAS
rm(gcl)

#LIMITES INFERIORES A, B E C PARA CLASSIFICA??O GERAL DO N?VEL DE EIFIC?NCIA ENERG?TICA (POR UH) ####
#OS LIMITES INFERIORES GERAIS EST?O NO DATA FRAME EXTERNO (limites.uh-blocked.csv), LIDO DO DIRET?RIO WORKING DIRECTORY (PASTA ATRELADA AO SCRIPT)
limites.uh = read.csv('limites.uh-blocked.csv')

lim.uh = subset(limites.uh,limites.uh$gcl==geral_uh$gcl[1])
for (i in 2:length(geral_uh$n.uh)){
  single.lim.uh = subset(limites.uh,limites.uh$gcl==geral_uh$gcl[i])
  lim.uh = rbind(lim.uh,single.lim.uh)
}
#REMO??O DOS DATA FRAMES QUE N?O SER?O MAIS UTILIZADOS
rm(limites.uh,single.lim.uh,i)

geral_uh$lim.inf.a = ifelse(geral_uh$n.dorms==1,lim.uh$a_1_dorm,ifelse(geral_uh$n.dorms==2,lim.uh$a_2_dorm,ifelse(geral_uh$n.dorms==3,lim.uh$a_3_dorm,lim.uh$a_4_dorm)))
geral_uh$lim.inf.b = ifelse(geral_uh$n.dorms==1,lim.uh$b_1_dorm,ifelse(geral_uh$n.dorms==2,lim.uh$b_2_dorm,ifelse(geral_uh$n.dorms==3,lim.uh$b_3_dorm,lim.uh$b_4_dorm)))
geral_uh$lim.inf.c = rep(0,length(geral_uh$n.uh))
#REMO??O DOS DATA FRAMES QUE N?O SER?O MAIS UTILIZADOS
rm(lim.uh)

#CONVERS?O DOS VALORES INTEIROS CLIM?TICOS PARA CARACTERES (1A <- -1; 1B <- -2; 1C <- -3) ####
geral_uh$gcl = ifelse(geral_uh$gcl==-1,'1a',ifelse(geral_uh$gcl==-2,'1b',geral_uh$gcl))

#ARREDONDAMENTO DOS DATA FRAMES DE SA?DA PARA 2 CASAS DECIMAIS ####
geral.round_uh = round(geral_uh[6:18],2)
geral_uh = cbind(geral_uh[1:5],geral.round_uh,geral_uh[19:21])
#REMO??O DOS DATA FRAMES QUE N?O SER?O MAIS UTILIZADOS
rm(geral.round_uh)

#CLASSIFICA??O DA EFICI?NCIA ENERG?TICA GERAL (POR UH) ####
geral_uh$classe = ifelse(geral_uh$red.cep>=geral_uh$lim.inf.a,'A',ifelse(geral_uh$red.cep>=geral_uh$lim.inf.b,'B',ifelse(geral_uh$red.cep>=geral_uh$lim.inf.c,'C','D')))

#CRIA??O DOS ARQUIVOS .csv CONTENDO OS OUTPUTS ####
write.csv(geral_uh,'geral_uh.csv')