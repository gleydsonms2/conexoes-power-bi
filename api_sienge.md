# Conexão API Sienge

O Sienge é uma ERP para empresas que atuam na construção civil, onde possuí uma API privada no qual podemos consultar inúmeras informações.

No [site da documentação](https://api.sienge.com.br/docs/#/general-information), encontramos tudo bem explicado sobre como podemos fazer requisições. Nesta seção irei disponibilizar a consulta de algumas tabelas.

#Realizando a Conexão
Por ser tratar de uma API privada é preciso possuí a chave da API para efetuar a conexão e realizar a consulta.

# Consultas

## Contratos de Vendas

Podemos consultar utilizando a url abaixo através da conexão web porém, esse tipo de conexão apenas possibilita consultarmos 200 contratos.

`https://api.sienge.com.br/{subdomain-do-cliente}/public/api/v1/sales-contracts?limit=200&offset=0 `

De forma dinâmica, foi criado um parâmetro que armazena o número de páginas e atribuí-lo dentro da função de invocação criada.

[Consulta_contratos](https://github.com/gleydsonms2/conexoes-power-bi/blob/main/consulta_contratos.m)

##

## Comissões de Vendas

Nesta demonstração podemos utilizar a url abaixo para realizar a consulta na tabela sales-commissions.

`https://api.sienge.com.br/{subdomain-do-cliente}/public/api/v1/sales-commissions?limit=200&offset=0`

Da forma dinâmica foi desenvolvido um parâmetro que armazena o número de páginas e atribuí-lo dentro da função de invocação criada.

##

[Consulta_comissoes](https://github.com/gleydsonms2/conexoes-power-bi/blob/main/consulta_comissoes.m)

## Empreendimentos (Obra)

Neste código é realizado a consulta na API onde estão registrados os Empreendimentos(Obra) e as informações retornam em forma de tabela

`https://api.sienge.com.br/{subdomain-do-cliente}/public/api/v1/enterprises?limit=200&offset=0`

[Consulta_empreendimentos](consulta_empreendimentos.m)

##

## Centro de Custos

Neste código é realizado a consulta na API onde estão registrados os Centros de Custos e as informações retornam em forma de tabela

`https://api.sienge.com.br/{subdomain-do-cliente}/public/api/v1/cost-centers?limit=200&offset=0`

[Consulta_centro_de_custos](consulta_centro_custos.m)

##
