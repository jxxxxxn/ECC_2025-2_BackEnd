drop table test;

create table test
(
	ID				varchar(5), 
	name			varchar(20) not null,
	dept_name		varchar(20),
	score 			int
);

insert into test values ( '101', 'mslee', 'cse', 100 );
insert into test values ( '102', 'mslee', 'cse', 100 );
insert into test values ( '103', 'mslee', 'cse', 100 );
insert into test values ( '104', 'mslee', 'cse', 100 );
insert into test values ( '105', 'mslee', 'cse', 100 );

select * from test;

delete from test;

select "======" as result;

select * from test;

--

select distinct dept_name from instructor;
select * from instructor;

select Id, name, salary/12 as monthly_salary from instructor;

select name from instructor where dept_name = 'Comp. Sci.' and salary > 70000;

select name, course_id 
from instructor, teaches 
where instructor.ID = teaches.ID 
and instructor.dept_name = 'Comp. Sci.';

select distinct T.name
from instructor as T, instructor as S
where T.salary > S.salary
and S.dept_name = 'Comp. Sci.';