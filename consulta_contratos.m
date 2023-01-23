let
   #"empresa" = "Nome da empresa",
   #"modulo" = "sales-contracts",
   #"chave_api" = "iseriar a chave API",

    Fonte = Json.Document(
        Web.Contents(
            "https://api.sienge.com.br",
                [
                    RelativePath =  #"empresa" & "/public/api/v1/" & #"modulo",
                        Query = [
                            limit = Number.ToText(200),
                            offset = Number.ToText(0),
                            apikey = #"chave_api"
                        ]
                ]
        )
    ),

    #"Requisição" =
        (numeroPagina) => 
            Json.Document(
                Web.Contents("https://api.sienge.com.br",
                    [
                        RelativePath = #"empresa" & "/public/api/v1/" & #"modulo",
                            Query = [
                                limit = Number.ToText(200),
                                offset = Number.ToText(numeroPagina),
                                apikey = #"chave_api"
                            ]
                    ]
                )
            ),

    #"Resultado" = Fonte[resultSetMetadata][count],
    
    #"Limit" = Fonte[resultSetMetadata][limit],

    #"Paginas" = Number.RoundUp(#"Resultado" / #"Limit"),    

    #"Lista Dados" = 
        List.Generate(
            ()=> [ Pagina = 0, Consulta = try #"Requisição"(0)[results] otherwise null],
                each [Pagina] < #"Paginas",
                each [Consulta = try #"Requisição"([Pagina]+1)[results] otherwise null, Pagina = [Pagina]+1],
                each [Consulta]
        ),

    #"Tabela" = 
        Table.ExpandRecordColumn(
            Table.ExpandListColumn(
                Table.FromList(#"Lista Dados", Splitter.SplitByNothing(), null, null, ExtraValues.Error), "Column1"
            ), "Column1", 
            
            {"id", "enterpriseId", "receivableBillId", "number", "correctionType", "situation", "discountType", "cancellationReason", "discountPercentage", "value", "totalSellingValue", "contractDate", "issueDate", "cancellationDate", "creationDate", "lastUpdateDate", "proRataIndexer", "interestPercentage", "interestType", "fineRate", "lateInterestCalculationType", "dailyLateInterestValue", "containsRemadeInstallments", "externalId", "keysDeliveredAt", "brokers", "salesContractCustomers", "salesContractUnits", "paymentConditions", "links"}
        )
in
    #"Tabela"
