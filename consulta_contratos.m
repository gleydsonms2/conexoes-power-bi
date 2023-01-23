let
      Fonte = Json.Document(
        Web.Contents(
            "https://api.sienge.com.br",
                [
                    RelativePath =  "/statuseng/public/api/v1/sales-contracts?",
                        Query = [
                            limit = Number.ToText(200),
                            offset = Number.ToText(0)
                            
                        ]
                ]
        )
    ),

    #"Requisição" =
        (numeroPagina) => 
            Json.Document(
                Web.Contents("https://api.sienge.com.br",
                    [
                        RelativePath = "/statuseng/public/api/v1/sales-contracts?",
                            Query = [
                                limit = Number.ToText(200),
                                offset = Number.ToText(numeroPagina)
                            ]
                    ]
                )
            ),

    #"Resultado" = Fonte[resultSetMetadata][count],
    
    #"Limit" = Fonte[resultSetMetadata][limit],

    #"Paginas" = Number.RoundUp(#"Resultado" / #"Limit"),    

    #"Tabela" = 
        Table.ExpandRecordColumn(
            Table.ExpandListColumn(
                Table.FromList(
                    List.Generate(
                        ()=> [ Pagina = 0, Consulta = try #"Requisição"(0)[results] otherwise null],
                        each [Pagina] < #"Paginas",
                        each [Consulta = try #"Requisição"([Pagina]+1)[results] otherwise null, Pagina = [Pagina]+1],
                        each [Consulta]
                    ), Splitter.SplitByNothing(), null, null, ExtraValues.Error
                
                ), "Column1"
             
            ), "Column1", 
            
            {"id", "enterpriseId", "receivableBillId", "number", "correctionType", "situation", "discountType", "cancellationReason", "discountPercentage", "value", "totalSellingValue", "contractDate", "issueDate", "cancellationDate", "creationDate", "lastUpdateDate", "proRataIndexer", "interestPercentage", "interestType", "fineRate", "lateInterestCalculationType", "dailyLateInterestValue", "containsRemadeInstallments", "externalId", "keysDeliveredAt", "brokers", "salesContractCustomers", "salesContractUnits", "paymentConditions", "links"}
        )
in
    #"Tabela"
