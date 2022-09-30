-- BOOLEAN
-- O TIPO DE DADO BOOLEAN POSSUI TRES VALORES POSSIVEIS: TRUE, FALSE E NULL

-- LONG E LONG RAW
-- O tipo de dado long armazena um string de caracteres. O tipo de dado LONNG RAW armazena binarios.(imagens, sons, pdf...) 
-- O tipo de dado LONG possui um tamanho de até 32760 byts no PL/SQL
-- O tipo de dado LONG RAW possui um tamanho maximo de até 32760 bytes no PL/SQL
-- obs: O tamanho maximo de um tipo de dado LONG NO SQL é 2G - 1
-- o tamanho maximo de tipo LONG RAW no sql é 2g
-- ex: vTexto LONG := 'car';
-- vvar LONG RAW := HEXTORAW('43'||'41'||'52');

-- ROWID
-- o tipo ROWID mapeia a pseudocoluna ROWID, que é o endereço logico de uma linha de uma tabela.
-- O tipo ROWID é um string de 18 caracteres
-- ex: vrowid ROWID;

-- DATE
-- O tipo date é o tipo de dado base para datas. o intervalo valido é apartir de 1 de janeiro de 4712ac até 31 de dezembro de9999dc
--ex: vdata1 DATE := SYSDATE;
--ex2: vdata2 DATE := '28/01/20';

--TIMESTAMP
-- O SUBTIPO TIMESTAMP extende o tipo de dado DATE base oferendo um tempo com tamanho maximo de 9 digitos de segundos apos o decimal.
--ex1: vdata TIMESTAMP := SYSTIMESTAMP;
--ex2: vdata1 TIMESTAMP(3) := SYSTIMESTAMP;

--TIMESTAMP WITH TIME ZONE
-- O SUBTIPO TIMESTAMP EXTENDE  TIPO DE DADO DATE BASE OFERENDO UM TEMPO COM TAMNHO DE 9 DIGITOS INCLUINDO UTC
--EX: vdata TIMESTAMP WITH TIME ZONE := SYSTIMESTAMP;
--EX: vdata TIMESTAMP WITH LOCAL TIME ZONE := SYSTIMESTAMP;

--NCHAR E NVARCHAR 
-- Caracteres e strings Unicode existem para suportar globalização utilizando conjuntos de caracteres (character sets) universais
-- AL16UTF16 ou UTF8 são conjuntos de caracteres universais fornecidos pelo banco de dados oracle
-- AL16UTF16 armazena todos os caacteres em 2 bytes fisicos
-- UTF8  armazena todos os caracteres em 3 bytes fisicos
-- ex: vEstado NCHAR(2) := 'RS';
-- ex: vNome NVARCHAR2(20) := 'ULTILIZAND CONJUNTO DE CARACTERES UNIVERSAL';

-- BINARY_INTEGER
--É numerico sem decimais
-- armazena numeros inteiros na faixa entre: -2147.483.648 até 2147.483.647 cpp 32 bits ou 4 bytes
-- calculos mais eficientes com numeros inteiros que um tipo de dado number porque consome menos espaço em memoria

-- BINARY_DOUBLE E BINARY_FLOAT
-- PRECISÃO SIMPLES E DUPLA (32 BITS E 64 BTS)

-------------REGRAS DE NOMENCLATURA --------

-- DOIS OBJETOS PODEM POSSUIR O MESMO NOME, DESDE QUE SEJAM DEFINIDOS EM BLOCOS DIFERENTES
-- NÃO ULTILIZE MESMO NOME(IDENTIFICADOR) PARA VARIAVEL QUE NOME DE COLUNAS DE TABELAS ULTILIZADAS NO BLOCO PARA EVITAR AMBIGUIDADE


--ATRIBUINDO VALORES PARA VARIAVEIS 

-- PARA ATRIBUIR UM VALOR PARA UMA VARIVEL, VOCE ESCREVE UM COMANDO DE ATRIBUIÇÃO PL/SQL
-- VOCE DEVE EXPLICITAMENTE NOMEAR A VARIAVEL PARA RECEBER O NOVO VALOR A ESQUERDA DO OPERADOR DE ATRIBUIÇÃO (:=)

-- dECLARANDO VARIAVEIS UTILIZando %TYPE
-- Ao inves de codificar o tipo de dado ea precisão de uma variavel, voce pode utilizar o atributo %TYPE para declarar uma variavel de acordo com uma coluna do banco de dados ou outra variavel 
-- o atributo %TYPE é frequentemente ultilizado quando o valor armazenado em uma variavel é derivado de uma couna de uma tabela d banco de dados.
-- ex: vfirst_name employees.first_name%TYPE
-- ex: vlast_name employees.last_name%TYPE;

--ATRIBUINDO VALORES PARA VARIAVEIS 

-- PARA ATRIBUIR UM VALOR PARA UMA VARIVEL, VOCE ESCREVE UM COMANDO DE ATRIBUIÇÃO PL/SQL
-- VOCE DEVE EXPLICITAMENTE NOMEAR A VARIAVEL PARA RECEBER O NOVO VALOR A ESQUERDA DO OPERADOR DE ATRIBUIÇÃO (:=)

-- dECLARANDO VARIAVEIS UTILIZando %TYPE
-- Ao inves de codificar o tipo de dado ea precisão de uma variavel, voce pode utilizar o atributo %TYPE para declarar uma variavel de acordo com uma coluna do banco de dados ou outra variavel 
-- o atributo %TYPE é frequentemente ultilizado quando o valor armazenado em uma variavel é derivado de uma couna de uma tabela d banco de dados.
-- ex: vfirst_name employees.first_name%TYPE
-- ex: vlast_name employees.last_name%TYPE;

SET SERVEROUTPUT ON
DECLARE
  vNumero              NUMBER(11,2) := 1200.50;
  vCaracterTamFixo     CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
  vCaracterTamVariavel VARCHAR2(100) := 'Texto Tamanho variável de até 32767 bytes';
  vBooleano            BOOLEAN := TRUE;
  vData                DATE := sysdate;
  vLong                LONG := 'Texto Tamanho variável de até 32760 bytes';
  vRowid               ROWID;
  vTimestamp           TIMESTAMP := systimestamp;
  vTimestamptz         TIMESTAMP WITH TIME ZONE := systimestamp;
  vCaracterTamFixoUniversal     NCHAR(100) := 'Texto de Tamanho Fixo Universal de até 32767 bytes';
  vCaracterTamVariavelUniversal NVARCHAR2(100) := 'Texto Tamanho variável Universal de até 32767 bytes';
  vNumeroInteiro       BINARY_INTEGER := 1200;
  vNumeroFloat         BINARY_FLOAT := 15000000;
  vNumeroDouble        BINARY_DOUBLE := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' ||   vNumero);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavel );
  IF  vBooleano = TRUE
  THEN 
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
  DBMS_OUTPUT.PUT_LINE('Long = ' || vLong );
  SELECT rowid
  INTO   vRowid
  FROM   employees
  WHERE  first_name = 'Steven' AND last_name = 'King';
  DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid );
  DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp with time zone= ' || vTimestamptz);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixoUniversal );
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável = ' || vCaracterTamVariavelUniversal );
  DBMS_OUTPUT.PUT_LINE('Numero Inteiro = ' || vNumeroInteiro);
  DBMS_OUTPUT.PUT_LINE('Numero Float = ' || vNumeroFloat);
  DBMS_OUTPUT.PUT_LINE('Numero Double = ' || vNumeroDouble);
END;
