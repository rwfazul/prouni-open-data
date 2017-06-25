# prouniOpenData
ELC119 Disciplina de Fundamentos de Banco de Dados | 4° semestre do curso de Sistemas de Informação UFSM
#### Grupo: Isabella Sakis, Rhauani Fazul

## Descrição

O trabalho é dividido nas seguintes etapas:

#### Criação de um banco de dados desnormalizado

* Escolher uma fonte de dados com **dados abertos** disponibilizados na Web
	- **Portal de dados abertos usado:** informacao.mec.gov.br || dados.gov.br 
	- **Planilha escolhida:** Programa Universidade para Todos - ProUni : 2016 - Bolsas concedidas e perfil dos beneficiários do Prouni
	- **Disponível em:** http://dados.gov.br/dataset/mec-prouni
		- Link download direto: http://informacao.mec.gov.br/bilibs/PDA/PROUNI/PDA_PROUNI_2016_CSV.csv
	- **Formato:** .csv
	- **Codificação:** Default ISO 8859-1 (Latin1). Arquivo 'amostra_pda_prouni_2016' modificado para UTF-8.
* Gerar o script SQL para a criação de um banco de dados com uma tabela que contenha todas as colunas existentes.
			
#### Normalização do esquema desnormalizado

- Usar as formas normais para decompor a tabela desnormalizada em várias tabelas;
- Gerar o script SQL para a criação das tabelas normalizadas dentro do mesmo banco de dados criado na etapa anterior.

#### Modelagem conceitual do esquema normalizado

- Gerar uma representação gráfica do modelo relacional;
- Realizar engenharia reversa do esquema de banco de dados normalizado para que seja gerado o modelo ER correspondente;
- Gerar uma representação gráfica do modelo ER.


#### Carga dos dados para o esquema normalizado

- Três tipos de carga são aceitos:
	+ Carga 1 (100% da nota):
		- Usar um extrator que carregue os dados da fonte para a tabela desnormalizada;
		- Usar um script SQL para que os dados da tabela desnormalizada sejam copiados para as respectivas tabelas normalizadas.
	+ Carga 2 (70% da nota):
		- Carregar manualmente os dados da fonte para a tabela desnormalizada;
		- Usar um script SQL para que os dados da tabela desnormalizada sejam copiados para as respectivas tabelas normalizadas.
	+ Carga 3 (40% da nota):
		- Carregar manualmente os dados da fonte diretamente para as tabelas normalizadas, sem passar pela tabela desnormalizada.
- A carga escolhida para o trabalho foi a **Carga 1**.


#### Consultas sobre o esquema normalizado

- Criar consultas SQL sobre as tabelas normalizadas
- Cada consulta deve envolver pelo menos um desses itens:
	+ agregação;
	+ operador de conjunto;
	+ junção externa;
	+ junções entre três ou mais tabelas;
	+ subconsulta.
- As consultas devem possuir resultados significativos.



-----------------------------------------------------------------

## Desenvolvimento:

- Escolha da fonte de dados abertos
	+ [x] Ex. arquivos csv, panilhas excel, ... (**amostra_pda_prouni_2016.csv**)
- Criação do banco
	+ [X] Script de criação da tabela desnormalizada (**prouni_desnormalizado_ddl.sql**)
	+ [X] Script de criação das tabelas normalizadas (**prouni_normalizado_ddl.sql**)
- Alimentação do banco
	+ [X] Scripts sql de alimentação, códigos de extração, ... (**prouni_normalizado_dml.sql**, **importCSV_dml.sql**)
- Esquemas gráficos
	+ [X] Modelo ER (**modelo_er.png**)
	+ [X] Modelo relacional (**modelo_relacional.png**)
- Consultas elaboradas (5)
	+ [X] Scripts SQL (**prouni_normalizado_dql.sql**)
- Apresentação final
	+ [X] Slides onde a solução adotada é relatada (**apresentacao.pdf**)


-----------------------------------------------------------------

## Execução:

a) prouni_desnormalizado_ddl.sql -> Criação tabela desnormalizada <br/>
b) prouni_normalizado_ddl.sql    -> Criação tabelas normalizadas<br/>
c) importCSV_dml.sql             -> Extração dados .csv para tabela desnormalizada ***<br/>
d) prouni_normalizado_dml.sql    -> Alimentação tabelas normalizadas com dados tabela desnormalizada<br/>
e) prouni_normalizado_dql        -> Consultas em cima das tabelas normalizadas<br/>	


*** Necessita do caminho até o arquivo csv 'amostra_pda_prouni_2016.csv'. <br/>
    Por padrão esta com caminho absoluto a partir do usuário do sistema (Ambiente Linux). <br/>
    Windows -> Utilizar 'C:\\file_path...'




