--
-- Seção 5 Bloco Anônimo
--
-- Aula 1 - Bloco Anônimo
-- 

-- Bloco Anônimo - Exemplo

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(11,2) := 2000; -- DECLARAMOS AS VARIAVEIS QUE VAMOS ULTILIZAR 
  vNumero2  NUMBER(11,2) := 5000;
  vMedia    NUMBER(11,2);
BEGIN
  vMedia := (vnumero1 + vnumero2) / 2;       -- COMO SE FOSSE NOSSA FUÇÃO DENTRO DO BANCO DE DADOS 
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);
EXCEPTION
  WHEN OTHERS  -- BASICAMENTE O QUE O BANCO DEVE FAZER CADA VEZ QUER DER ALGUM RESULTADO DIFERENTE DO ANTERIOR 
  THEN 
    DBMS_OUTPUT.PUT_LINE('Erro Oracle: ' || SQLCODE || SQLERRM);
END;