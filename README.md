# Metodo Simplificado (INI-R)

Esse repositório refere-se ao código que calcula a classe de eficiência energética para unidades habitacionais residenciais, através do INI-R. Atenção: o uso do código é por sua conta e você assume o risco e suas responsabilidades!

This repository refers to a code which calculates the energy efficiency class of residencial dwellings, through brazilian regulation called INI-R. Caution: use it at your own risk!


Instruções gerais para a utilização do código principal ("metodo.simplificado.r")

O script, com nome de arquivo “metodo.simplificado.r”, foi programado através da linguagem de programação gratuita R e deve ser lido pela mesma. É possível utilizar a plataforma RStudio para facilitar a visualização do código e das variáveis envolvidas no processo.
O script encontra-se dentro da pasta “MetodoSimplificadoR” e não deve ser transferido para outro local de trabalho, pois conta com outros arquivos de dados de entrada que devem estar no mesmo local de trabalho, para, só assim, rodar com perfeição.

A pasta “MetodoSimplificadoR”, onde se encontra o script, deve conter os seguintes arquivos:
1.metodo.simplificado.r – script em R que lê todos os dados de entrada (inputs) e devolve planilhas como dados de saída (outputs);
2.heating_model_mazzaferro.rna – rede neural que calcula a carga térmica para aquecimento;
3.cooling_model_mazzaferro.rna – rede neural que calcula a carga térmica para resfriamento;
4.phoras_model_mazzaferro.rna – rede neural que calcula o percentual de horas em conforto térmico;
5.limites.heating-blocked.csv – planilha com os limites inferiores das classes de eficiência energética dos APPs (Ambientes de Permanência Prolongada) para aquecimento;
6.limites.cooling-blocked.csv – planilha com os limites inferiores das classes de eficiência energética dos APPs para resfriamento;
7.limites.uh-blocked.csv – planilha com os limites inferiores das classes de eficiência energética das UHs (Unidades Habitacionais) para classificação geral;
8.temp.ar.mes.ano-blocked.csv – planilha com as temperaturas médias mensais e anuais de diversas cidades brasileiras.
9.env.inputs.csv – planilha com os dados de entrada do sistema de envoltória para a condição real;
10.aa.inputs.csv – planilha com os dados de entrada do sistema de aquecimento de água para a condição real;
11.extra.inputs.csv – planilha com os dados de entrada necessários para os cálculos de geração local de energia renovável (Anexo D do INI-R);

Observações gerais

- Inicialmente o usuário deve identificar o endereço do diretório onde foi colocada a pasta “MetodoSimplificadoR”, copiá-lo e então implementá-lo no argumento da função setwd(), na linha 8 do código;
- Não se deve alterar o local (diretório) de nenhum dos arquivos listados;
- Não se deve alterar o nome ou o tipo de nenhum dos arquivos;
- O usuário não deve modificar os arquivos de 1 a 8;
- O usuário deve preencher apenas os arquivos com o rótulo inputs, arquivos de 8 a 10;
- Atenção: qualquer alteração diferente do instruído pode comprometer os resultados do método!
- O código serve apenas para as cidades expostas na seção variáveis climáticas, do próprio código; as cidades são: Belém, Belo Horizonte, Cuiabá, Curitiba, Florianópolis, Foz do Iguaçu, Goiânia, Manaus, Niterói, Porto Alegre, Rio de Janeiro, Salvador, Santa Maria, São Paulo, Terasina e Urubici.
- Consideram-se apenas dois tipos de fonte de energia: energia elétrica e energia térmica proveniente do gás natural.
- É proibido o uso de tubulações metálicas de distribuição de água quente.
- Considera-se que a energia perdida pelas tubulações de distribuição de água quente é desprezível.
- É possível utilizar apenas a parte do script referente ao sistema de envoltória ou do sistema de aquecimento de água, nesse caso a classificação obtida se refere ao sistema em análise.
- Para realizar as análises extras do INI-R, que se referem a geração local de energia renovável, uso racional de água e emissão de dióxido de carbono, é preciso preencher os dados de entrada do sistema de envoltória (“env.inputs”), do sistema de aquecimento de água (“aa.inputs”) e, obviamente, a planilha de informações adicionais (“extra.inputs”).
