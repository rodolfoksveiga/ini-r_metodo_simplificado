# Metodo Simplificado (INI-R)

Esse repositório refere-se ao código que calcula a classe de eficiência energética para unidades habitacionais residenciais, através do INI-R. Atenção: o uso do código é por sua conta e você assume o risco e suas responsabilidades!

This repository refers to a code which calculates the energy efficiency class of residencial dwellings, through brazilian regulation called INI-R. Caution: use it at your own risk!


Instruções gerais para a utilização do código principal ("metodo.simplificado.r")

O script, com nome de arquivo “metodo.simplificado.r”, foi programado através da linguagem de programação gratuita R e deve ser lido pela mesma. É possível utilizar a plataforma RStudio para facilitar a visualização do código e das variáveis envolvidas no processo.
O script encontra-se dentro da pasta “MetodoSimplificadoR” e não deve ser transferido para outro local de trabalho, pois conta com outros arquivos de dados de entrada que devem estar no mesmo local de trabalho, para, só assim, rodar com perfeição.

A pasta “MetodoSimplificadoR”, onde se encontra o script, deve conter os seguintes arquivos:
1. metodo.simplificado.r – script em R que lê todos os dados de entrada (inputs) e devolve planilhas como dados de saída (outputs);
2. heating_model_mazzaferro.rna – rede neural que calcula a carga térmica para aquecimento;
3. cooling_model_mazzaferro.rna – rede neural que calcula a carga térmica para resfriamento;
4. phoras_model_mazzaferro.rna – rede neural que calcula o percentual de horas em conforto térmico;
5. limites.heating-blocked.csv – planilha com os limites inferiores das classes de eficiência energética dos APPs (Ambientes de Permanência Prolongada) para aquecimento;
6. limites.cooling-blocked.csv – planilha com os limites inferiores das classes de eficiência energética dos APPs para resfriamento;
7. limites.uh-blocked.csv – planilha com os limites inferiores das classes de eficiência energética das UHs (Unidades Habitacionais) para classificação geral;
8. temp.ar.mes.ano-blocked.csv – planilha com as temperaturas médias mensais e anuais de diversas cidades brasileiras.
9. env.inputs.csv – planilha com os dados de entrada do sistema de envoltória para a condição real;
10. aa.inputs.csv – planilha com os dados de entrada do sistema de aquecimento de água para a condição real;
11. extra.inputs.csv – planilha com os dados de entrada necessários para os cálculos de geração local de energia renovável (Anexo D do INI-R);

Observações gerais

- Inicialmente o usuário deve identificar o endereço do diretório onde foi colocada a pasta “MetodoSimplificadoR”, copiá-lo e então implementá-lo no argumento da função setwd(), na linha 8 do código;
- Não se deve alterar o local (diretório) de nenhum dos arquivos listados;
- Não se deve alterar o nome ou o tipo de nenhum dos arquivos;
- O usuário não deve modificar os arquivos de 1 a 8;
- O usuário deve preencher apenas os arquivos com o rótulo inputs, arquivos de 8 a 10;
- Atenção: qualquer alteração diferente do instruído pode comprometer os resultados do método!
- O código serve apenas para as cidades expostas na seção variáveis climáticas, do próprio código; as cidades são: Belém, Belo Horizonte, Cuiabá, Curitiba, Florianópolis, Foz do Iguaçu, Goiânia, Manaus, Niterói, Porto Alegre, Rio de Janeiro, Salvador, Santa Maria, São Paulo, Terasina e Urubici;
- Consideram-se apenas dois tipos de fonte de energia: energia elétrica e energia térmica proveniente do gás natural;
- É proibido o uso de tubulações metálicas de distribuição de água quente;
- Considera-se que a energia perdida pelas tubulações de distribuição de água quente é desprezível;
- É possível utilizar apenas a parte do script referente ao sistema de envoltória ou do sistema de aquecimento de água, nesse caso a classificação obtida se refere ao sistema em análise;
- Para realizar as análises extras do INI-R, que se referem a geração local de energia renovável, uso racional de água e emissão de dióxido de carbono, é preciso preencher os dados de entrada do sistema de envoltória (“env.inputs”), do sistema de aquecimento de água (“aa.inputs”) e, obviamente, a planilha de informações adicionais (“extra.inputs”).

Inputs da envoltória

Os dados de entrada (inputs) do sistema da envoltória devem ser preenchidos na planilha com o nome “env.inputs”, referente a edificação real – a condição de referência é criada pelo próprio script a partir dos dados inseridos na planilha da condição real. O usuário não deve mudar o título das colunas (primeira linha) da planilha, apenas os valores abaixo do título. Todos os dados devem ser preenchidos com precisão, de acordo com o INI-R, para que o script devolva dados de saída coerentes. Nos inputs a separação dos algarismos inteiros e decimais é feita por pontos, como no sistema norte-americano, por exemplo: 50% = 0.50.

Lista de inputs

- n_uh: enumeração da Unidade Habitacional (UH) na qual está inserido o APP, começando pelo número 1.
- local: cidade e o estado onde o APP se encontra – APPs pertencentes a uma mesma UH devem estar no mesmo local.
  - tudo deve ser escrito em minúsculo;
  - ponto deve substituir espaço;
  - não se deve utilizar acento;
  - cedilha deve ser substituída pela letra “c”;
  - hífen se mantem;
  - o nome da cidade é separado do nome do estado por um underline (“_”).
- Exemplo 1: rio.de.janeiro_rj;
- Exemplo 2: vitoria.da.conquista-figueiredo_ba.
- gcl: grupo climático onde se encontra o APP, de acordo com o Anexo G do INI-R – APPs pertencentes a uma mesma UH devem estar no mesmo grupo climático.
- regiao: região geográfica brasileira onde se encontra a UH (sul, sudeste, centro-oeste, nordeste, norte) – escrever com letras minúsculas e com hífen – APPs pertencentes a uma mesma UH devem estar no mesmo grupo climático.
- zona: função do cômodo – Ambiente de Permanência Prolongada (APP)
  - 0  se o APP corresponder a uma sala;
  - 1  se o APP corresponder a um quarto;
- wwr_norte: porcentagem de vidro nas paredes externas da direção norte do APP (utilizar o valor decimal, por exemplo: 50% = 0.50).
- wwr_leste: porcentagem de vidro nas paredes externas da direção leste do APP (utilizar o valor decimal, por exemplo: 50% = 0.50).
- wwr_sul: porcentagem de vidro nas paredes externas da direção sul do APP (utilizar o valor decimal, por exemplo: 50% = 0.50).
- wwr_oeste: porcentagem de vidro nas paredes externas da direção oeste do APP (utilizar o valor decimal, por exemplo: 50% = 0.50).
- area_par_exp_norte: área da parede externa na direção norte do APP – m².
- area_par_exp_leste: área da parede externa na direção leste do APP – m².
- area_par_exp_sul: área da parede externa na direção sul do APP – m².
- area_par_exp_oeste: área da parede externa na direção oeste do APP – m².
- area_zona: área do piso do APP – m².
- ct_par_ext: capacidade térmica das paredes externas do APP – kJ/(m².K).
  - 1  Leve – Ct <= 50 kJ/(m².K);
  - 2  Média – 50 <= Ct <= 200 kJ/(m².K);
  - 3  Pesada – Ct >= 200 kJ/(m².K).
- u_par_ext: transmitância térmica das paredes externas do APP – W/(m².K).
- ct_cob: capacidade térmica da cobertura.
  - 1  Leve – Ct <= 50 kJ/(m².K);
  - 2  Média – 50 <= Ct <= 200 kJ/(m².K);
  - 3  Pesada – Ct >= 200 kJ/(m².K).
- u_cob: transmitância térmica da cobertura do APP – W/(m².K).
- u_vid: transmitância térmica dos vidros das aberturas do APP – W/(m².K).
- fs_vid: fator solar dos vidros das aberturas do APP - adimensional.
- tipo_pav: condição do piso do APP.
  - 0  pisos de baixa inércia térmica (por exemplo: pisos de madeira);
  - 1  pisos de alta inércia térmica (por exemplo: pisos de cerâmica).
- pedireito: alturo do pé-direito do APP – m.
- abspar: absortância das paredes do APP – adimensional.
- abscob: absortância da cobertura do APP – adimensional.
- tamanhoprojecao: projeção horizontal da sacada ou marquise – m.
- hpav: altura do pavimento (por exemplo: o pavimento térreo tem altura zero) – m.
- veneziana: se as aberturas do APP possuem veneziana.
  - 0  as aberturas não possuem veneziana.
  - 1  as aberturas possuem veneziana.
- hjan: fator de altura da abertura (razão entre a altura vertical da base ao topo da janela pelo pé-direito do APP) – adimensional.
- openfac: fator de abertura para ventilação, de acordo com o Anexo H do INI-R – adimensional.
- pilotis: se o APP está sobre pilotis.
  - 0  o APP não está sobre pilotis.
  - 1  o APP está sobre pilotis.
- exp_pis: condição de exposição do piso do APP.
  - 0  se não houver contato com o solo.
  - 1  se houver contato com o solo. 
- exp_cob: condição de exposição da cobertura do APP.
  - 0  se a cobertura não estiver exposta ao ambiente externo.
  - 1  se a cobertura estiver exposta ao ambiente externo.

- Obs.1: Nenhum campo deve ser deixado em branco!
- Obs.2: Quaisquer dúvidas sobre os inputs devem ser esclarecidas pelo INI-R.

Outputs da envoltória

Os dados de saída (outputs) do sistema da envoltória são apresentados em dois arquivos – “env_app.csv”, que devolve dados relativos aos APPs, e “env_uh”, que devolve arquivos relativos a UH) calculados pelo script. Os arquivos encontram-se na mesma pasta que o script e o restante dos arquivos (“MetodoSimplificadoR”) necessários para o funcionamento do programa.

Lista de outputs

Outputs do arquivo “env_app.csv”:
- heating_real: carga térmica para aquecimento do APP na condição real – kWh/(m².ano).
- heating.area_real: carga térmica para aquecimento do APP na condição real multiplicada pela área do APP – kWh/ano.
- heating_ref: carga térmica para aquecimento do APP na condição de referência – kWh/(m².ano).
- heating.area_ref: carga térmica para aquecimento do APP na condição de referência multiplicada pela área do APP – kWh/ano.
- red.heating: percentual de redução da carga térmica para aquecimento do APP – %.
- cooling_real: carga térmica para resfriamento do APP na condição real – kWh/(m².ano).
- cooling.area_real: carga térmica para resfriamento do APP na condição real multiplicada pela área do APP – kWh/ano.
- cooling_ref: carga térmica para resfriamento do APP na condição de referência – kWh/(m².ano).
- cooling.area_ref: carga térmica para resfriamento do APP na condição de referência multiplicada pela área do APP – kWh/ano.
- red.cooling: percentual de redução da carga térmica para resfriamento do APP – %.
- lim.inf.a.heating: limite inferior da classe de eficiência energética “A” do APP para aquecimento – %.
- lim.inf.b.heating: limite inferior da classe de eficiência energética “B” do APP para aquecimento – %.
- lim.inf.a.cooling: limite inferior da classe de eficiência energética “A” do APP para resfriamento – %.
- lim.inf.b.cooling: limite inferior da classe de eficiência energética “B” do APP para resfriamento – %.
- lim.inf.c: limite inferior da classe de eficiência energética “C” do APP para aquecimento e resfriamento – %.
- eq.num.heating: equivalente numérico de eficiência energética do APP para aquecimento – adimensional.
- eq.num.cooling: equivalente numérico de eficiência energética do APP para resfriamento – adimensional.
- eq.num.heating.area: equivalente numérico de eficiência energética do APP para aquecimento – adimensional.
- eq.num.cooling.area: equivalente numérico de eficiência energética do APP para resfriamento – adimensional.

Outputs do arquivo “env_uh.csv”:
- heating_real: carga térmica para aquecimento da UH na condição real – kWh/(m².ano).
- heating.area_real: carga térmica para aquecimento da UH na condição real multiplicada pela área da UH – kWh/ano.
- heating_ref: carga térmica para aquecimento da UH na condição de referência – kWh/(m².ano).
- heating.area_ref: carga térmica para aquecimento da UH na condição de referência multiplicada pela área da UH – kWh/ano.
- red.heating: percentual de redução da carga térmica para aquecimento da UH – %.
- cooling_real: carga térmica para resfriamento da UH na condição real – kWh/(m².ano).
- cooling.area_real: carga térmica para resfriamento da UH na condição real multiplicada pela área da UH – kWh/ano.
- cooling_ref: carga térmica para resfriamento da UH na condição de referência – kWh/(m².ano).
- cooling.area_ref: carga térmica para resfriamento da UH na condição de referência multiplicada pela área da UH – kWh/ano.
- red.cooling: percentual de redução da carga térmica para resfriamento da UH – %.
- eq.num.heating: equivalente numérico de eficiência energética da UH para aquecimento – adimensional.
- eq.num.cooling: equivalente numérico de eficiência energética da UH para resfriamento – adimensional.
- eq.num: equivalente numérico de eficiência energética da UH – adimensional.
- cee.heating_real: consumo de energia elétrica com aquecimento da UH para a condição real – kWh/ano.
- cee.cooling_real: consumo de energia elétrica com resfriamento da UH para a condição real – kWh/ano.
- cee_total_real: consumo de energia elétrica com aquecimento e resfriamento da UH para a condição real – kWh/ano.
- cee.heating_ref: consumo de energia elétrica com aquecimento da UH para a condição de referência – kWh/ano.
- cee.cooling_ref: consumo de energia elétrica com resfriamento da UH para a condição de referência – kWh/ano.
- cee_total_ref: consumo de energia elétrica com aquecimento e resfriamento da UH para a condição de referência – kWh/ano.
- cep.heating_real: consumo de energia primária com aquecimento da UH para a condição real – kWh/ano.
- cep.cooling_real: consumo de energia primária com resfriamento da UH para a condição real – kWh/ano.
- cep.total_real: consumo de energia primária com aquecimento e resfriamento da UH para a condição real – kWh/ano.
- cep.heating_ref: consumo de energia primária com aquecimento da UH para a condição de referência – kWh/ano.
- cep.cooling_ref: consumo de energia primária com resfriamento da UH para a condição de referência – kWh/ano.
- cep.total_ref: consumo de energia primária com aquecimento e resfriamento da UH para a condição de referência – kWh/ano.
- classe: classe de eficiência energética da envoltória da UH – varia de “A” (mais eficiente) a “D” (menos eficiente).

Inputs do aquecimento de água

Os dados de entrada (inputs) do sistema de aquecimento de água devem ser preenchidos na planilha com o nome “aa.inputs”, referente a edificação real – a condição de referência é criada pelo próprio script a partir dos dados inseridos na planilha da condição real. O usuário não deve mudar o título das colunas (primeira linha) da planilha, apenas os valores abaixo do título. Todos os dados devem ser preenchidos com precisão, de acordo com o INI-R, para que o script devolva dados de saída coerentes. Nos inputs a separação dos algarismos inteiros e decimais é feita por pontos, como no sistema norte-americano, por exemplo: 50% = 0.50.

Lista de inputs

- n.uh: enumeração da UH (Unidade Habitacional), começando pelo número 1.
- n.dorms: número de dormitórios pertencentes à UH.
- local: cidade e o estado onde o APP se encontra – APPs pertencentes a uma mesma UH devem estar no mesmo local.
otudo deve ser escrito em minúsculo;
oponto deve substituir espaço;
onão se deve utilizar acento;
ocedilha deve ser substituída pela letra “c”;
ohífen se mantem;
oo nome da cidade é separado do nome do estado por um underline (“_”).
- Exemplo 1: rio.de.janeiro_rj;
- Exemplo 2: vitoria.da.conquista-figueiredo_ba.
- gcl: grupo climático onde se encontra o APP, de acordo com o Anexo G do INI-R – APPs pertencentes a uma mesma UH devem estar no mesmo grupo climático.
- regiao: região geográfica brasileira onde se encontra a UH (sul, sudeste, centro-oeste, nordeste, norte) – escrever com letras minúsculas e com hífen – APPs pertencentes a uma mesma UH devem estar no mesmo grupo climático.
- tipo.aq: fonte energética de aquecimento de água da UH.
  - 0  aquecedor a gás;
  - 1  aquecedor elétrico.
- r.aq: rendimento do sitema aquecedor de água; em sistemas com apenas um aquecedor, o rendimento do sistema é igual ao rendimento do aquecedor, em sistemas com mais de um aquecedor deve ser calculada a média ponderada da eficiência dos aquecedores pelas potências nominais de cada aquecedor, como define o item B.2.2.5 do INI-R  – utilizar o valor decimal, por exemplo: 85% = 0.85.
- reserv:
  - 0  se a UH não possuir reservatório de água quente;
  - 1  se a UH possuir reservatório de água quente.
- recirc:
  - 0  se a UH não possuir sistema de recirculação de água quente;
  - 1  se a UH possuir sistema de recirculação de água quente.
- aut.recirc:
  - 0  se a UH possuir sistema de recirculação de água quente sem automação;
  - 1  se a UH possuir automação do sistema de recirculação de água quente, como estipulado no item B.2.1.1, do INI-R ou se a uh não possuir sistema de recirculação de água quente.
- iso.term.recirc:
  - 0  se a UH possuir sistema de recirculação de água quente e a tubulação não respeitar os limites estipulados no item B.2.1.2 do INI-R;
  - 1  se a UH possuir tubulação para recirculação de água quente com condutividade térmica e espessura como estipulado no item B.2.1.2 e ou se a UH não possuir sistema de recirculação de água quente.
- contr.mult.aquec:
  - 0  se a UH possuir sistema de múltiplos aquecedores sem controle de acionamento;
  - 1  se a UH possuir sistema de múltiplos aquecedores com controle de acionamento ou se a UH não possuir sistema de múltiplos aquecedores.
- eaa.rec: parcela de energia proveniente de sistemas que recuperam calor para o aquecimento de água – kWh/dia.
- rec.solar:
  - 0  se a UH não possuir sistema para aquecimento de água por energia solar;
  - 1  se a UH possuir sistema para aquecimento de água por energia solar.
- rad.incid.dia: radiação solar incidente sobre os coletores – kWh/(m².dia).
- sup.abs.c: superfície de absorção do coletor – m².
- fat.ef.optica.c: fator de eficiência óptica do coletor (Tabelas do PBE para coletores solares) – admensional.
- mod.ang.incid: modificador do ângulo de incidência (na ausência da informação, adotar 0.96 para coletores de vidro) – adimensional.
- coef.glob.c: coeficiente global de perdas do coletor (Tabelas PBE para coletores solares) – W/(m².K).
- fat.cor.ct: fator de correção do conjunto coletor/trocador (na ausência da informação, adotar 0.95) – adimensional.
- vol.acum.s: volume de acumulação solar (recomenda-se obedecer a seguinte condição: 50 < (vol.acum.s/ sup.abs.c) <100) – litros.
- fat.per.dist: fator de perdas térmicas por metro da tubulação de distribuição (de acordo com a Tabela B.6 do INI-R) – kWh/(dia.m).
- l.dist: comprimento da tubulação de distribuição – m.
- fat.per.recirc: fator de perdas térmicas por metro da tubulação de recirculação (Tabela B.6 do INI-R) – kWh/dia.m.
- l.recirc: comprimento da tubulação de recirculação – m.
- eaa.res.sby: perda térmica específica do reservatório de água quente em standby (Tabela B.5 do INI-R); para reservatórios térmicos de sistemas solares de aquecimento de água etiquetados pelo INMETRO, deve-se consultar as Tabelas do PBE.
- t.m.res: temperatura média do reservatório de água quente - °C.

- Obs.1: Caso não haja sistema para aquecimento de água por energia solar (rec.solar = 0), os campos rad.incid.dia, sup.abs.c, fat.ef.optica.c, mod.ang.incid, coef.glob.c, fat.cor.ct e 	vol.acum.s podem ser deixados em branco.
- Obs.2: Caso o sistema de aquecimento de água seja individual (individ = 1), os campos fat.per.dist e l.dist podem ser deixados em branco.
- Obs.3: Caso não haja sistema de recirculação (recirc = 0), os campos fat.per.recirc e l.recirc podem ser deixados em branco.
- Obs.4: Caso não haja reservatório/armazenamento (reserv = 0), os campos eaa.res.sby e t.m.res podem ser deixados em branco.
- Obs.5: Quaisquer dúvidas sobre os inputs devem ser esclarecidas pelo INI-R.



OUPUTS DO SISTEMA DE AQUECIMENTO DE ÁGUA

Os dados de saída (outputs) do sistema de aquecimento de água são apresentados no arquivo “aa_uh.csv”, que devolve dados relativos às UHs calculados pelo script. Os arquivos encontram-se na mesma pasta que o script e o restante dos arquivos (“MetodoSimplificadoR”) necessários para o funcionamento do programa.

Lista de outputs

Outputs do arquivo “aa_uh.csv”:
- n.pessoas: número de pessoas na UH (considera-se 2 pessoas por dormitório).
- vol.dia: volume diário de consumo de água quente da UH – m³.
- eaa: energia consumida para o atendimento da demanda diária de água quente da UH – kWh/dia.
- eaa.rec_real: parcela de energia proveniente de sistemas que recuperam calor para o aquecimento de água da UH na condição real – kWh/dia.
- eaa.sol_real: parcela de energia proveniente de sistemas de aquecimento de água solar térmico da UH na condição real – kWh/dia.
- eaa.rec.sol_real: energia para aquecimento de água da UH proveniente de sistemas que recuperam calor ou energia solar térmica, na condição real – kWh/dia.
- eaa.rec.sol_ref: energia para aquecimento de água da UH proveniente de sistemas que recuperam calor ou energia solar térmica, na condição de referência – kWh/dia.
- eaa.per.dist_real: perda térmica na tubulação do sistema de distribuição de água quente da UH na condição real – kWh/dia.
- eaa.per.dist_ref: perda térmica na tubulação do sistema de distribuição de água quente da UH na condição de referência – kWh/dia.
- eaa.per.recirc_real: perda térmica no sistema de recirculação de água quente da UH na condição real – kWh/dia.
- eaa.per.recirc_ref: perda térmica no sistema de recirculação de água quente da UH na condição de referência – kWh/dia.
- eaa.per.res_real: perda térmica no reservatório da UH na condição real – kWh/dia.
- eaa.per.res_ref: perda térmica no reservatório da UH na condição de referência – kWh/dia.
- caat_real: consumo anual de energia térmica para aquecimento de água da condição real da UH – kWh/ano.
- caae_real: consumo anual de energia elétrica para aquecimento de água da condição real da UH – kWh/ano.
- caap_real: consumo anual de energia primária para aquecimento de água da condição real da UH – kWh/ano.
- caat_ref: consumo anual de energia térmica para aquecimento de água da condição de referência da UH – kWh/ano.
- caae_ref: consumo anual de energia elétrica para aquecimento de água da condição de referência da UH – kWh/ano.
- caap_ref: consumo anual de energia primária para aquecimento de água da condição de referência da UH – kWh/ano.
- red.aa: percentual de redução do consumo de energia primária para aquecimento de água da UH – %.
- classe: classe de eficiência energética do sistema de aquecimento de água da UH – varia de “A” (mais eficiente) a “E” (menos eficiente).

Inputs extras

Os dados de entrada (inputs) para as avaliações adicionais presentes no INI-R devem ser preenchidos na planilha com o nome “extra.inputs”. O usuário não deve mudar o título das colunas (primeira linha) da planilha, apenas os valores abaixo do título. Todos os dados devem ser preenchidos com precisão, de acordo com o INI-R, para que o script devolva dados de saída coerentes. Nos inputs a separação dos algarismos inteiros e decimais é feita por pontos, como no sistema norte-americano, por exemplo: 50% = 0.50.

Lista de inputs

- n.uh: enumeração da UH (Unidade Habitacional), começando pelo número 1.
- n.dorms: número de dormitórios pertencentes à UH.
- local: cidade e o estado onde o APP se encontra – APPs pertencentes a uma mesma UH devem estar no mesmo local.
  - tudo deve ser escrito em minúsculo;
  - ponto deve substituir espaço;
  - não se deve utilizar acento;
  - cedilha deve ser substituída pela letra “c”;
  - hífen se mantem;
  - o nome da cidade é separado do nome do estado por um underline (“_”).
- Exemplo 1: rio.de.janeiro_rj;
- Exemplo 2: vitoria.da.conquista-figueiredo_ba.
- gcl: grupo climático onde se encontra o APP, de acordo com o Anexo G do INI-R – APPs pertencentes a uma mesma UH devem estar no mesmo grupo climático.
- regiao: região geográfica brasileira onde se encontra a UH (sul, sudeste, centro-oeste, nordeste, norte) – escrever com letras minúsculas e com hífen – APPs pertencentes a uma mesma UH devem estar no mesmo grupo climático.
- gee: energia gerada por fontes locais de energia renovável – kWh/ano.
- o.a.pluv: oferta de água não potável – L/ano.
- vaz.bs: vazão da bacia sanitária (Tabela E.1 do INI-R) – L/descarga.
- vaz.lav: vazão da torneira de lavatório (Tabela E.1 do INI-R) – L/min.
- vaz.chuv: vazão do chuveiro (Tabela E.1 do INI-R) – L/min.
- vaz.pia: vazão da torneira da pia da cozinha (Tabela E.1 do INI-R) – L/min.

Outputs extras

Os dados de saída (outputs) adicionais, ou condições gerais da UH, são apresentados no arquivo “geral_uh.csv”, que devolve dados relativos às UHs calculados pelo script. Os arquivos encontram-se na mesma pasta que o script e o restante dos arquivos (“MetodoSimplificadoR”) necessários para o funcionamento do programa.

Lista de outputs

Outputs do arquivo “geral_uh.csv”:
- n.pessoas: número de pessoas na UH (considera-se 2 pessoas por dormitório).
- pge: potencial de geração de energia (percentual de energia consumida pela UH atendido pela energia gerada por fontes locais de energia renovável – %.
- cagua_real: consumo anual de água para a condição real – L/ano.
- cagua_ref: consumo anual de água para a condição de referência – L/ano.
- econ.agua: estimativa da economia anual de água potável – %.
- emis.co2: emissão anual de dióxido de carbono – tCO2/ano.
- cee_real: consumo de energia elétrica para a condição real – kWh/ano.
- cet_real: consumo de energia térmica para a condição real – kWh/ano.
- cep_real: consumo de energia primária para a condição real – kWh/ano.
- cee_ref: consumo de energia elétrica para a condição de referência – kWh/ano.
- cet_ref: consumo de energia térmica para a condição de referência – kWh/ano.
- cep_ref: cnsumo de energia primária para a condição de referência – kWh/ano.
- red.cep: redução do consumo de energia primária – %.
- lim.inf.a: limite inferior da classe de eficiência energética “A” para o consumo de energia primária da UH – %.
- lim.inf.b: limite inferior da classe de eficiência energética “B” para o consumo de energia primária da UH – %.
- lim.inf.c: limite inferior da classe de eficiência energética “C” para o consumo de energia primária da UH – %.
- classe: classe de eficiência energética da UH (envolvendo os sistemas de envoltória e aquecimento de água, além de informações adicionais como a geração local de energia renovável) – varia de “A” (mais eficiente) a “D” (menos eficiente).
