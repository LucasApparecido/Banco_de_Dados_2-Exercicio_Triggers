--drop function sp_clienteAnapolis()
CREATE OR REPLACE FUNCTION sp_clienteAnapolis()
 RETURNS SETOF cliente AS $bloco_marcador$
SELECT * FROM cliente WHERE cidade='Anápolis'
$bloco_marcador$
LANGUAGE 'sql';

--como a procedure foi criado com o tipo de retorno SETOF, ela deve ser tratada como uma tablea,
-- para testar utilizamos o comando abaixo.
select * from sp_clienteAnapolis()