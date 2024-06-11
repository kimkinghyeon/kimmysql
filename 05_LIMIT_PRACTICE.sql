-- EMPLOYEE 테이블에서 SALARY가 높은 순서대로 EMP_NAME과 SALARY를 포함하여 상위 5명의 데이터를 조회하시오.
    select
        emp_name,
        salary
    from
        employee
    order by
        salary
    limit 5;

-- EMPLOYEE 테이블에서 HIRE_DATE가 가장 최근인 순서대로 EMP_NAME과 HIRE_DATE를 포함하여 상위 10명의 데이터를 조회하시오.
select
    hire_date,
    emp_name
from
    employee
order by
    hire_date desc
limit 10;