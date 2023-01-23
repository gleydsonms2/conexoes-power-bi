# Conexão API Sienge

O Sienge é uma ERP para empresas que atuam na construção civil, onde possuí uma API privada no qual podemos consultar inúmeras informações.

No [site da documentação](https://api.sienge.com.br/docs/#/general-information), encontramos tudo bem explicado sobre como podemos fazer requisições, mas nesta seção irei disponibilizar a consulta de Contratos de Vendas.

#Realizando a Conexão
Por ser tratar de uma API privada é preciso possuí a chave da API para efetuar a conexão e realizar a consulta.

# Consultas

* Contratos de Vendas

Podemos consultar utilizando a url abaixo através da conexão web porém, esse tipo de conexão apenas possibilita consultarmos 200 contratos.

`https://api.sienge.com.br/{subdomain-do-cliente}/public/api/v1/sales-contracts?limit=200&offset=0 `

De forma dinâmica, foi criado um parâmetro que armazena o número de páginas e atribuí-lo dentro da função de invocação criada.

Consulta_contratos
