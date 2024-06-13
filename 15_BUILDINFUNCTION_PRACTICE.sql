-- EMPLOYEE 테이블에서 각 직원의 이메일 주소에서 도메인 부분을 추출하여 출력하시오.
select substring_index(email, '@', -1)
from employee;

-- EMPLOYEE 테이블에서 각 직원의 급여에서 10%를 감한 후, 이를 소수점 둘째 자리에서 반올림하여 출력하시오
select round(salary / 10)
# select salary/10
from employee;


-- EMPLOYEE 테이블에서 각 부서의 평균 급여를 계산하고, 그 값을 '부서별 평균 급여는 X 원입니다' 형식의 문자열로 출력하시오.
select b.dept_title as '부서',
       avg(salary)  as '평균 급여는 x원 입니다.'
from employee a
         join department b on a.dept_code = b.dept_id
group by a.dept_code;

-- EMPLOYEE 테이블에서 각 직원의 입사 연도, 입사 월, 입사 일을 각각 조회하시오.
select date(hire_date),
       emp_name
from employee
order by emp_name;

-- EMPLOYEE 테이블에서 입사일이 2010년 1월 1일 이후인 직원들의 이름과 입사일을 조회하시오.
select emp_name, date(HIRE_DATE)
from employee
order by HIRE_DATE desc
limit 8;