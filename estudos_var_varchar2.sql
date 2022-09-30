
-- declarando umavariavel tipo number 
SET SERVEROUTPUT ON

DECLARE
    vNumero NUMBER(11,2) := 1200.50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Numero =' || vNumero);
END;

-- declarando variaveis tipo char e varchar2
DECLARE
    vCaracterTamFixo  char(2) := 'RS'; -- controla a quantidade de caracter que pode caber dentro de uma  variavel ou seja esse espaço sempre estara sendo usado
    vCaracterTamVariavel varchar(100) := 'Porto Alegre, RS'; -- já esse só ocupa o espaçoe se estiver sendo usando
BEGIN
    DBMS_OUTPUT.PUT_LINE('String caracteres tam Fixo = ' || vCaracterTamFixo);
    DBMS_OUTPUT.PUT_LINE('String Caracteres tam Fixo = ' || vCaracterTamVariavel);

END;


-- Declarando variaveis TIPO DATE

DECLARE
    vData1  DATE := '29/04/20';
    vData2  DATE := '29/04/2022';
BEGIN 
    DBMS_OUTPUT.PUT_LINE('Data1 = ' || vData1);
    DBMS_OUTPUT.PUT_LINE('Data2 = ' || vData2);
END;