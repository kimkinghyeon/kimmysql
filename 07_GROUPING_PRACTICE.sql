-- EMPLOYEE 테이블에서 JOB_CODE별 평균 급여를 조회하시오.
select
    job_code,
avg(SALARY)
from
    employee
group by
    job_code;

-- EMPLOYEE 테이블에서 SAL_LEVEL별 최소 급여를 조회하시오.
    select
        sal_level,
        min(salary)
    from
        employee
    group by sal_level;

-- EMPLOYEE 테이블에서 DEPT_CODE별 직원 수를 조회하되, 직원 수가 3명 이상인 부서만 조회하시오.
    select
        dept_code,
     count(dept_code)
    from
        employee
    group by dept_code
    having count(dept_code) >= 3;


-- EMPLOYEE 테이블에서 JOB_CODE별 평균 급여를 조회하되, 평균 급여가 4000000 이상인 직급만 조회하시오.
    select
        job_code,
    avg(salary)
    from
        employee
    group by job_code
    having avg(salary) >= 4000000;

-- EMPLOYEE 테이블에서 DEPT_CODE와 JOB_CODE별 총 급여와 각 DEPT_CODE별 총 급여를 ROLLUP을 사용하여 조회하시오.
select
    dept_code,
    job_code,
    sum(salary)
from
    employee
group by dept_code, job_code
with rollup;