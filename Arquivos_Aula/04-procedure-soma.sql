create or replace function soma(numeric(10,2), numeric(10,2)) 
returns numeric(10,2) as
$codigo$

         select  $1 + $2;

$codigo$

language 'sql';

--

select valor_unitario,soma(20,valor_unitario),* from produto
update produto
	set valor_unitario = soma(20,valor_unitario)

