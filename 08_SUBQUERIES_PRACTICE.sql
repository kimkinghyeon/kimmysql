-- EMPLOYEE 테이블에서 '해외영업1부'에 속한 모든 직원의 이름, 직급, 급여를 조회하시오.
select dept_code,
       emp_name,
       salary
from employee
where dept_code in
      (select dept_code
       from employee
       where dept_code = 'D5');

select
    emp_name,job_code,salary
from employee
where dept_code = (
    select dept_id
    from
        department
        where dept_title = '해외영업1부'
    );

-- EMPLOYEE 테이블에서 모든 직원의 평균 급여보다 높은 급여를 받는 직원의 이름과 급여를 조회하시오

select
    emp_name,
    salary
from
    employee
where salary >= all (select avg(salary) from employee);

-- EMPLOYEE 테이블에서 각 부서의 평균 급여보다 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.
select
    dept_title,
    emp_name,
    salary
from
    employee
        join department on dept_code = dept_id
where salary >= all (select avg(salary) from employee);

SELECT E.EMP_NAME, D.DEPT_TITLE, E.SALARY
FROM EMPLOYEE E
         JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
WHERE E.SALARY > (
    SELECT AVG(SALARY)
    FROM EMPLOYEE
    WHERE DEPT_CODE = E.DEPT_CODE
);

-- 상관서브쿼리문제
-- EMPLOYEE 테이블에서 각 부서별로 가장 높은 급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.

select
    d.dept_title,
    a.salary,
    a.emp_name
from
    employee a
join department d on a.dept_code = d.dept_id
where salary = (select
                    max(salary)
                from employee
                where dept_code = a.dept_code);

SELECT E.EMP_NAME, D.DEPT_TITLE, E.SALARY
FROM EMPLOYEE E
         JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
WHERE E.SALARY = (
    SELECT MAX(SALARY)
    FROM EMPLOYEE
    WHERE DEPT_CODE = E.DEPT_CODE
);

-- EMPLOYEE 테이블에서 각 직급별 평균 급여보다 높은 급여를 받는 직원의 이름, 직급, 급여를 조회하시오.

select
    j.job_name,
    e.salary,
    e.emp_name
from
    employee e
join job j on e.job_code = j.job_code
where e.salary = (select
                    max(salary)
                from employee
                where job_code = e.job_code);

SELECT E.EMP_NAME, J.JOB_NAME, E.SALARY
FROM EMPLOYEE E
         JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
WHERE E.SALARY > (
    SELECT AVG(SALARY)
    FROM EMPLOYEE
    WHERE JOB_CODE = E.JOB_CODE
);

-- EXISTS 절 문제
-- DEPARTMENT 테이블에서 직원이 있는 부서의 부서명을 조회하시오.

    select
        a.dept_id,
        a.dept_title
    from
        department a
    where exists(select dept_id
                 from department b
                 where b.dept_id = a.dept_id);

SELECT D.DEPT_TITLE
FROM DEPARTMENT D
WHERE EXISTS (
    SELECT 1
    FROM EMPLOYEE E
    WHERE E.DEPT_CODE = D.DEPT_ID
);

-- EMPLOYEE 테이블에서 급여가 가장 높은 직원의 이름과 급여를 조회하시오. (NOT EXISTS 사용)

select
    a.job_code,
    a.salary
from
    employee a
where not exists(select dept_code
             from employee b
             where b.dept_code = a.dept_code);

select e.emp_name, e.salary
from
    employee e
where not exists(
    select 1
    from employee e2
    where e2.salary > e.salary
);

-- CTE 문제
-- EMPLOYEE 테이블에서 각 부서별 평균 급여를 계산하고,
-- 평균 급여가 4000000 이상인 부서의 부서명과 평균 급여를 조회하시오.
with DeptAvgSalary as(
    select dept_code,avg(salary) as AvgSalary
    from employee
    group by dept_code
)
select d.dept_title,das.AvgSalary
from DeptAvgSalary das
join department d on das.dept_code = d.dept_id
where das.AvgSalary >= 4000000;



