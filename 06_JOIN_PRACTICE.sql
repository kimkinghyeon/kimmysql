-- EMPLOYEE 테이블과 DEPARTMENT 테이블을 조인하여, 각 직원의 이름과 그 직원이 속한 부서명을 조회하시오.

SELECT E.EMP_NAME, D.DEPT_TITLE
FROM EMPLOYEE E
         JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
ORDER BY E.EMP_NAME;

select
    e.emp_name,d.dept_title
from
    employee e
join department d on e.dept_code = d.dept_id
order by
    e.emp_name;

-- EMPLOYEE 테이블과 JOB 테이블을 조인하여, 각 직원의 이름과 그 직원의 직급명을 조회하시오.

SELECT E.EMP_NAME, J.JOB_NAME
FROM EMPLOYEE E
         JOIN JOB J ON E.JOB_CODE = J.JOB_CODE
ORDER BY E.EMP_NAME;

select
    e.emp_name, j.job_name
from
    employee e
join job j on e.job_code = j.job_code
order by e.emp_name;

-- EMPLOYEE 테이블과 DEPARTMENT 테이블을 LEFT JOIN하여, 모든 직원과 그 직원이 속한 부서명을 조회하되, 부서가 없는 직원도 포함하여 조회하시오.

SELECT E.EMP_NAME, D.DEPT_TITLE
FROM EMPLOYEE E
         LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
ORDER BY E.EMP_NAME;

select
    e.emp_name , d.dept_title
from
    employee e
left join department d on e.dept_code = d.dept_id;

-- EMPLOYEE 테이블을 자기 자신과 조인하여, 각 직원과 그 직원의 관리자의 이름을 조회하시오. (자기 자신을 조인하는 SELF JOIN을 사용)

SELECT E.EMP_NAME AS EMPLOYEE, M.EMP_NAME AS MANAGER
FROM EMPLOYEE E
         LEFT JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMP_ID
ORDER BY E.EMP_NAME;

select
    e.emp_name as employee,
    m.emp_name as manager
from
    employee e
left join employee m on e.manager_id = m.emp_id
order by e.emp_name;