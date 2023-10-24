-- primeiro, executamos o sql abaixo, para criar nossa função
CREATE OR REPLACE FUNCTION tira_acento(text)
RETURNS text AS
$BODY$
	select
	translate($1,'áàâãäéèêëíìïóòôõöúùûüÁÀÂÃÄÉÈÊËÍÌÏÓÒÔÕÖÚÙÛÜçÇ',
	             'aaaaaeeeeiiiooooouuuuAAAAAEEEEIIIOOOOOUUUUcC');
$BODY$
LANGUAGE 'sql'; 

-- teste
select tira_acento('anápolis')
select nome_cliente,tira_acento(nome_cliente),* 
from cliente
-- texto que será utilizado, o que está sendo procurado, o que será substituido.
select replace('aabbccdd  xxxxx yyyy', 'xxxxx','zzz')
