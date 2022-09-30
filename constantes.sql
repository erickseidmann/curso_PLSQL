SET SERVEROUTPUT ON
DECLARE
    vPi CONSTANT NUMBER(38,15)  := 3.141592653589793;
BEGIN
    DBMS_OUTPUT.PUT_LINE('PI = ' || vPi);
    --:= é o simbolo de atribuição
    -- || tambem é um simbolo de atribuição de variavel 
END;


-- constantes tipo char e varchar2
-- não precisa usar o set serveroutput on novamente

DECLARE 
    vCaracterTamFixo    CONSTANT CHAR(2) := 'RS';
    vCaracterTamVariavel CONSTANT VARCHAR2(100) := 'PORTO ALEGRE, RS';
BEGIN
    DBMS_OUTPUT.PUT_LINE('COM TAM FIXO: ' ||  vCaracterTamfixo);
    DBMS_OUTPUT.PUT_LINE('COM TAM VARIAVEL: ' || vCaracterTamVariavel);
    
END;


