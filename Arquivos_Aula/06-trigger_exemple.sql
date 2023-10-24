CREATE TABLE emp (
    empname text,
    salary integer,
    last_date timestamp,
    last_user text
);

CREATE or replace FUNCTION emp_stamp() RETURNS trigger AS $emp_stamp$
    BEGIN
        -- Check that empname and salary are given
        IF NEW.empname IS NULL THEN
            RAISE EXCEPTION 'empname cannot be null';
        END IF;
        IF NEW.salary IS NULL THEN
            RAISE EXCEPTION '% cannot have null salary', NEW.empname;
        END IF;

        -- Who works for us when she must pay for it?
        IF NEW.salary < 0 THEN
            RAISE EXCEPTION '% cannot have a negative salary', NEW.empname;
        END IF;

        -- Remember who changed the payroll when
		NEW.empname := upper(NEW.empname);
        NEW.last_date := current_timestamp;
        NEW.last_user := current_user;		
        RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER emp_stamp BEFORE INSERT OR UPDATE ON emp
    FOR EACH ROW EXECUTE PROCEDURE emp_stamp();
	
	
-- dados para testar a trigger
insert into emp(empname, salary) values(null,10000);
select * from emp;

insert into emp(empname, salary) values('João',null);
select * from emp;

insert into emp(empname, salary) values('nome emp',-100);
select * from emp;

insert into emp(empname, salary) values('nome_emp2',100);
select * from emp;

insert into emp(empname, salary) values('joão da silva',1000);
select * from emp;

update emp
	set empname= null
where empname='TEREZA';

--trocar o usuário e testar.
select * from emp;
update emp
	set salary= 1000
where empname='TEREZA';
