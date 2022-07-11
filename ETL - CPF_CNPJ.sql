/* Table CPF */
SELECT  ClientePrincipalCodigo, "%ClientePrincipalChave", ClientePrincipalDescricao,
        ClientePrincipal_Counter, ClientePrincipalDist, ClientePrincipalCPFCNPJStatus,ClientePrincipalCPFCNPJ,
        SUBSTRING(ClientePrincipalCPFCNPJ,1,3) AS CPF_PARTE1,
        SUBSTRING(ClientePrincipalCPFCNPJ,5,3) AS CPF_PARTE2,
        SUBSTRING(ClientePrincipalCPFCNPJ,9,3) AS CPF_PARTE3,
        SUBSTRING(ClientePrincipalCPFCNPJ,13,2) AS CPF_PARTE4,
        CPF_PARTE1||CPF_PARTE2||CPF_PARTE3||CPF_PARTE4 AS ClientePrincipalCPFCNPJ
FROM    ClientePrincipal
WHERE   ClientePrincipalCPFCNPJStatus <> 'NAO IDENTIFICADO'
AND     ClientePrincipalCPFCNPJ
LIKE    '%.%';

/* Table CNPJ */
SELECT  ClientePrincipalCodigo, "%ClientePrincipalChave", ClientePrincipalDescricao,
        ClientePrincipal_Counter, ClientePrincipalDist, ClientePrincipalCPFCNPJStatus,ClientePrincipalCPFCNPJ,
        SUBSTRING(ClientePrincipalCPFCNPJ,1,2) AS CNPJ_PARTE1,
        SUBSTRING(ClientePrincipalCPFCNPJ,4,3) AS CNPJ_PARTE2,
        SUBSTRING(ClientePrincipalCPFCNPJ,8,3) AS CNPJ_PARTE3,
        SUBSTRING(ClientePrincipalCPFCNPJ,12,4) AS CNPJ_PARTE4,
        SUBSTRING(ClientePrincipalCPFCNPJ,17,2) AS CNPJ_PARTE5,
        CNPJ_PARTE1||CNPJ_PARTE2||CNPJ_PARTE3||CNPJ_PARTE4||CNPJ_PARTE5 AS ClientePrincipalCPFCNPJ
FROM    ClientePrincipal
WHERE   ClientePrincipalCPFCNPJStatus <> 'NAO IDENTIFICADO'
AND     ClientePrincipalCPFCNPJ
LIKE    '%.%';

/* Convert Table CPF */
SELECT      ClientePrincipalCodigo, ClientePrincipalDescricao,ClientePrincipal_Counter,ClientePrincipalDist
            ClientePrincipalCPFCNPJStatus, "%ClientePrincipalChave",Concat_ClientePrincipalCPFCNPJ AS ClientePrincipalCPFCNPJ 
FROM        CPF
WHERE       Concat_ClientePrincipalCPFCNPJ  NOT LIKE    '%.%';

/* Convert Table CNPJ */
SELECT      ClientePrincipalCodigo, ClientePrincipalDescricao,ClientePrincipal_Counter,ClientePrincipalDist
            ClientePrincipalCPFCNPJStatus, "%ClientePrincipalChave",Concat_ClientePrincipalCPFCNPJ AS ClientePrincipalCPFCNPJ 
FROM        CNPJ 
WHERE       Concat_ClientePrincipalCPFCNPJ  NOT LIKE    '%.%';

/* UNION CPF - CNPJ */
SELECT      ClientePrincipalCodigo, ClientePrincipalDescricao,ClientePrincipalCPFCNPJStatus, 
            "%ClientePrincipalChave",Concat_ClientePrincipalCPFCNPJ AS ClientePrincipalCPFCNPJ 
FROM        CPF
WHERE       Concat_ClientePrincipalCPFCNPJ  NOT LIKE    '%.%'
UNION
SELECT      ClientePrincipalCodigo, ClientePrincipalDescricao,ClientePrincipalCPFCNPJStatus, 
            "%ClientePrincipalChave",Concat_ClientePrincipalCPFCNPJ AS ClientePrincipalCPFCNPJ
FROM        CNPJ
WHERE       Concat_ClientePrincipalCPFCNPJ  NOT LIKE    '%.%'