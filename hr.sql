SELECT*FROM EMPLOYEES;

SELECT*FROM DEPARTMENTS d;

select employee_id, first_name, last_name from employees;

select e.first_name,
e.phone_number,
e.hire_date,
e.salary
from employees e ;


--����� �̸�(first_name)�� ��(last_name), �޿�, ��ȭ��ȣ, �̸���, �Ի����� ���
SELECT e.FIRST_NAME "�̸�",
        e.LAST_NAME "��",
        e.SALARY "�޿�",
        e.PHONE_NUMBER "��ȭ��ȣ",
        e.EMAIL "�̸���",
        e.HIRE_DATE "�Ի���"
FROM EMPLOYEES e ;

select first_name ||' '|| last_name "name"
from employees;

select first_name || ' hire date is ' || hire_date
from employees;

select first_name, salary, salary*12, (salary+300)*12
from employees;

SELECT e.FIRST_NAME||'-'||e.LAST_NAME,
        e.SALARY,
        e.SALARY*12,
        (e.SALARY*12)+5000,
        e.PHONE_NUMBER
FROM EMPLOYEES e ;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;

SELECT 
e.FIRST_NAME,
e.SALARY,
e.SALARY*12
FROM EMPLOYEES e
WHERE SALARY>15000;

--07/01/01 �� ���Ŀ� �Ի��� ������� �̸��� �Ի����� ����ϼ���
SELECT*
FROM EMPLOYEES e
WHERE e.HIRE_DATE>='07/01/01';

SELECT TO_CHAR(e.HIRE_DATE,'yy/mm/dd')
FROM EMPLOYEES e;

--�̸��� Lex�� ������ ������ ����ϼ���
SELECT e.SALARY*12
FROM EMPLOYEES e
WHERE e.FIRST_NAME = 'Lex';

select first_name, salary*12
from employees
where salary <= 14000 
or salary >= 17000;

SELECT*
FROM EMPLOYEES e
WHERE e.HIRE_DATE>='04/01/01'
AND e.HIRE_DATE<='05/12/31';

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME IN('Neena','Lex','John');

select first_name, last_name, salary
from employees
where first_name like 'L%';

select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name, salary, commission_pct
from employees
where commission_pct is not null;

--���Ŵ����� ���� Ŀ�̼Ǻ����� ���� ������ �̸��� ����ϼ���

SELECT*FROM EMPLOYEES e;
SELECT*
FROM EMPLOYEES e
WHERE e.MANAGER_ID IS NULL
AND e.COMMISSION_PCT IS NULL;

select first_name, salary
from employees
order by salary desc;

SELECT e.DEPARTMENT_ID,
e.SALARY,
e.FIRST_NAME
FROM EMPLOYEES e
ORDER BY 1 asc;

SELECT e.FIRST_NAME,
e.SALARY
FROM EMPLOYEES e
WHERE SALARY>=5000
ORDER BY 2 ASC;

SELECT e.DEPARTMENT_ID,
e.SALARY,
e.FIRST_NAME
FROM EMPLOYEES e
ORDER BY 1 asc,2 desc;

SELECT INITCAP('apple')FROM dual;
SELECT LOWER('apple')FROM dual;
SELECT UPPER('apple')FROM dual;

SELECT FIRST_NAME,
LPAD(FIRST_NAME,10,'*'),
RPAD(FIRST_NAME,10,'*')
FROM employees;

SELECT FIRST_NAME,
REPLACE(FIRST_NAME,'e','*')
FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;

select round(123.346, 2) "r2",
round(123.456, 0) "r0",
round(123.456, -1) "r-1"
from dual;

select trunc(123.346, 2) "r2",
trunc(123.456, 0) "r0",
trunc(123.456, -1) "r-1"
from dual;

SELECT sysdate FROM dual;

SELECT ROUND(SYSDATE,'MONTH')
FROM DUAL;

SELECT SYSDATE FROM EMPLOYEES e;

select months_between(sysdate, hire_date)
from employees
where department_id=110;

select months_between(sysdate, '2022/01/01')FROM dual;

select first_name, to_char(salary*12, '$999,999.99') "SAL"
from employees
where department_id =110;

select sysdate, 
to_char(sysdate, 'YYYY"��"MM"��"DD"��" HH24"��"MI"��"SS"��"')
from dual;

SELECT e.FIRST_NAME||' '||e.LAST_NAME,
e.SALARY,
e.PHONE_NUMBER,
e.HIRE_DATE
FROM EMPLOYEES e
ORDER BY 4 ASC;

SELECT e.JOB_ID,
e.SALARY
FROM EMPLOYEES e
ORDER BY 2 DESC;

SELECT e.FIRST_NAME,
e.MANAGER_ID,
e.COMMISSION_PCT,
e.SALARY
FROM EMPLOYEES e
WHERE e.MANAGER_ID is not null
AND e.COMMISSION_PCT IS NULL
AND e.SALARY>3000;


-- �ְ����(max_salary)�� 10000 �̻��� ������ 
--�̸�(job_title)�� �ְ����(max_salary)�� 
--�ְ������(max_salary) ��������(DESC)�� �����Ͽ� ����ϼ���

SELECT j.JOB_TITLE, j.MAX_SALARY
FROM JOBS j
WHERE j.MAX_SALARY>=10000
ORDER BY 2 desc;

SELECT e.FIRST_NAME,
e.SALARY,
NVL(COMMISSION_PCT,0)
FROM EMPLOYEES e
WHERE SALARY <14000 AND SALARY>=10000
ORDER BY 2 desc;

SELECT e.FIRST_NAME,
e.SALARY,
TO_CHAR(e.HIRE_DATE,'YYYY-mm'),
e.DEPARTMENT_ID
FROM EMPLOYEES e
WHERE DEPARTMENT_ID = 10
OR DEPARTMENT_ID = 90
OR DEPARTMENT_ID = 100;

SELECT e.FIRST_NAME,
e.SALARY
FROM EMPLOYEES e
WHERE UPPER(e.FIRST_NAME) LIKE '%S%';

SELECT *
FROM DEPARTMENTS d
ORDER BY LENGTH(DEPARTMENT_NAME) desc;

--��Ȯ���� ������, ���簡 ���� ������ ����Ǵ� ������� �����̸���
--�빮�ڷ� ����ϰ� ��������(ASC)���� ������ ������.

SELECT DISTINCT d.LOCATION_ID
FROM DEPARTMENTS d;

SELECT*
FROM LOCATIONS l;

SELECT*FROM COUNTRIES c;

SELECT e.FIRST_NAME,
e.SALARY,
REPLACE(e.PHONE_NUMBER,'.','-'),
e.HIRE_DATE
FROM EMPLOYEES e
WHERE HIRE_DATE<='2003/12/31';

SELECT COUNT(*), COUNT(COMMISSION_PCT) FROM EMPLOYEES;

SELECT COUNT(*)
FROM EMPLOYEES
WHERE SALARY >16000;

SELECT COUNT(*), SUM(SALARY)
FROM EMPLOYEES;

SELECT COUNT(*), SUM(SALARY), AVG(NVL(SALARY,0))
FROM EMPLOYEES;

SELECT COUNT(*), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES;

SELECT DEPARTMENT_ID, avg(e.SALARY)
FROM EMPLOYEES e
GROUP BY DEPARTMENT_ID 
ORDER BY 1;

SELECT DEPARTMENT_ID, COUNT(*), SUM(salary)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 1;

SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID;


SELECT DEPARTMENT_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY)>20000;

SELECT DEPARTMENT_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY)>20000
AND DEPARTMENT_ID=100;

-- ����1
SELECT MAX(e.SALARY) "�ְ��ӱ�",
        MIN(e.SALARY) "�����ӱ�",
        MAX(e.SALARY)-MIN(e.SALARY) "�ְ��ӱ� ? �����ӱ�"
FROM EMPLOYEES e;

-- ����2
SELECT TO_CHAR(MAX(e.HIRE_DATE), 'YYYY"��" MM"��" DD"��"')
FROM EMPLOYEES e;

-- ����3
SELECT 
    e.DEPARTMENT_ID,
    AVG(e.SALARY),
    MAX(e.SALARY),
    MIN(e.SALARY)
FROM 
    EMPLOYEES e
GROUP BY 
    DEPARTMENT_ID
ORDER BY 
    DEPARTMENT_ID desc;

--����4
SELECT 
    e.JOB_ID,
    AVG(e.SALARY),
    MAX(e.SALARY),
    MIN(e.SALARY)
FROM
    EMPLOYEES e
GROUP BY 
    JOB_ID
ORDER BY 
    JOB_ID desc;



    
--����6

SELECT
    e.DEPARTMENT_ID,
    AVG(NVL(e.SALARY,0)),
    MIN(e.SALARY),
    AVG(e.SALARY)-MIN(e.SALARY)
FROM 
    EMPLOYEES e
GROUP BY 
    e.DEPARTMENT_ID
HAVING 
    AVG(e.SALARY)-MIN(e.SALARY) < 2000
ORDER BY 
    AVG(e.SALARY)-MIN(e.SALARY) desc;


-- CASE~END ��

SELECT
    employee_id,
    salary,
    job_id,
    CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary*0.1
        WHEN job_id = 'AC_MGR' THEN salary+salary*0.2
        ELSE salary
    END SALARY
FROM EMPLOYEES;

-- CASE~END ��

SELECT
    e.FIRST_NAME,
    e.DEPARTMENT_ID,
    CASE WHEN e.DEPARTMENT_ID BETWEEN 10 AND 50 THEN 'A-TEAM'
         WHEN e.DEPARTMENT_ID BETWEEN 60 AND 100 THEN 'B-TEAM'
         WHEN e.DEPARTMENT_ID BETWEEN 110 AND 150 THEN 'C-TEAM'
    ELSE '������'
    END "��"
FROM EMPLOYEES e;

SELECT 
    FIRST_NAME,
    em.DEPARTMENT_ID,
    DEPARTMENT_NAME,
    de.DEPARTMENT_ID    
FROM EMPLOYEES em, DEPARTMENTS de
WHERE em.DEPARTMENT_ID=de.DEPARTMENT_ID;



SELECT
    FIRST_NAME,
    JOB_TITLE
FROM
    EMPLOYEES e, JOBS j
WHERE
    e.JOB_ID=j.JOB_ID;
    


--�׸�� �����̸�, �μ��̸�, ������ �� ����ϼ���

SELECT
    FIRST_NAME,
    DEPARTMENT_NAME,
    JOB_TITLE
    
FROM
    EMPLOYEES e, DEPARTMENTS d, JOBS j
    
WHERE
    e.DEPARTMENT_ID=d.DEPARTMENT_ID
AND e.JOB_ID=j.JOB_ID;

SELECT emp.first_name, mgr.first_name
FROM employees emp, employees mgr
WHERE emp.manager_id=mgr.employee_id;

SELECT *
FROM DEPARTMENTS d;

--RIGHT OUTER JOIN

SELECT e.DEPARTMENT_ID, e.FIRST_NAME, d.DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID(+)=d.DEPARTMENT_ID;

SELECT e.DEPARTMENT_ID, e.FIRST_NAME, d.DEPARTMENT_NAME
FROM EMPLOYEES e FULL OUTER JOIN DEPARTMENTS d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

-- ����1
SELECT
    emp.EMPLOYEE_ID,
    emp.FIRST_NAME,
    d.DEPARTMENT_NAME,
    mgr.FIRST_NAME
FROM 
    EMPLOYEES emp, EMPLOYEES mgr, DEPARTMENTS d
WHERE 
    emp.MANAGER_ID=mgr.EMPLOYEE_ID
AND emp.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- ����2
SELECT
    re.REGION_NAME,
    co.COUNTRY_NAME
FROM 
    REGIONS re, COUNTRIES co
WHERE co.REGION_ID=re.REGION_ID
ORDER BY 
    1 desc, 2 desc ;
    
-- ����3

SELECT
    dep.DEPARTMENT_ID,
    dep.DEPARTMENT_NAME,
    emp.FIRST_NAME,
    loc.CITY,
    co.COUNTRY_NAME,
    re.REGION_NAME
FROM 
    DEPARTMENTS dep,
    EMPLOYEES emp,
    LOCATIONS loc,
    COUNTRIES co,
    REGIONS re
WHERE dep.MANAGER_ID = emp.EMPLOYEE_ID 
AND   dep.LOCATION_ID = loc.LOCATION_ID 
AND   loc.COUNTRY_ID = co.COUNTRY_ID 
AND   co.REGION_ID = re.REGION_ID ;


-- ���� 4

SELECT*FROM JOB_HISTORY jh;

SELECT emp.EMPLOYEE_ID, emp.FIRST_NAME
FROM EMPLOYEES emp, JOBS j, JOB_HISTORY jh
WHERE jh.JOB_ID=j.JOB_ID
AND j.JOB_TITLE = 'Public Accountant'
AND jh.EMPLOYEE_ID=emp.EMPLOYEE_ID;

-- ���� 5

SELECT 
FROM EMPLOYEES e, DEPARTMENTS d;

-- ���� 6

SELECT emp.EMPLOYEE_ID, emp.LAST_NAME, emp.HIRE_DATE, mgr.HIRE_DATE
FROM EMPLOYEES emp, EMPLOYEES mgr
WHERE emp.MANAGER_ID=mgr.EMPLOYEE_ID
AND emp.HIRE_DATE<mgr.HIRE_DATE;