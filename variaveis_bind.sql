-- BIND ------
/*uma variavel tipo Bind é uma variavel que voce declara em um ambiente externo ao bloco,
e então a utiliza para passar valores em tempo de execução, para um ou mais blocos PL/SQL 
que podem utiliza-la como qualquer outra varivel voce pode referenciar varias BIND declaradas
 em um ambiente externo ao bloco dentro do bloco PL/SQL*/ 
/*no ambiente do Oracle SQL*Plus ou do Oracle SQL Developer, para declara uma varivel bind, voce ultliza o comando Variable.
 para referenciar variaveis BIND, voce deve prefxar a referencia com o caractere(:) para distinguir de variaveis declaradas no bloco PL/SQL;*/

 --EXEMPLO --
 SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declaração de variável para o Primeiro número
  vNumero2  NUMBER(13,2);  -- Declaração de variável para o Segundo número
  vMedia    NUMBER(13,2);  -- Declaração de variável para receber a Media calculada
BEGIN
  /* Cálculo do valor da média entre dois números */
	 
  vNumero1  :=  8000;
  vNumero2  :=  4000;
  vmedia    := (vNumero1 + vNumero2) / 2;           -- Cálculo da Media entre os dois números  
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1);  -- Impressão do Primeiro Número
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);  -- Impressão do Segundo Número
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);     -- Impressão da Média calculada 
END;
