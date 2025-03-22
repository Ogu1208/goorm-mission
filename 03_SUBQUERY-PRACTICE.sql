-- 1. 부서코드가 노옹철 사원과 같은 소속의 직원 명단 조회하세요.
select emp_name
	from employee
    where dept_code = (select dept_code 
						from employee 
                        where emp_name = '노옹철');

-- 2. 전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의 사번, 이름, 직급코드, 급여를 조회하세요.

select emp_no, emp_name, job_code, salary
	from employee
    where salary > (select avg(salary) from employee);

-- 3. 노옹철 사원의 급여보다 많이 받는 직원의 사번, 이름, 부서코드, 직급코드, 급여를 조회하세요.
select emp_no, emp_name, dept_code, job_code, salary
	from employee
    where salary > (select salary from employee where emp_name = '노옹철');

-- 4. 가장 적은 급여를 받는 직원의 사번, 이름, 부서코드, 직급코드, 급여, 입사일을 조회하세요.
select emp_no, emp_name, dept_code, job_code, salary, hire_date
	from employee
    order by salary limit 1;
    
select emp_no, emp_name, dept_code, job_code, salary, hire_date
  FROM employee
 WHERE salary = (select MIN(salary) from employee);

select emp_no, emp_name, dept_code, job_code, salary, hire_date
	from employee
    where emp_no = (select emp_no from employee order by salary limit 1);

-- *** 서브쿼리는 SELECT, FROM, WHERE, HAVING, ORDER BY절에도 사용할 수 있다.

-- 5. 부서별 최고 급여를 받는 직원의 이름, 직급코드, 부서코드, 급여 조회하세요.
    
SELECT emp_name, job_code, dept_code, salary
  FROM employee e
 WHERE (dept_code, salary) IN (
       SELECT dept_code, MAX(salary)
         FROM employee
        GROUP BY dept_code
 );

SELECT dept_code, MAX(salary)
    FROM employee
    GROUP BY dept_code;

-- *** 여기서부터 난이도 극상

-- 6. 관리자에 해당하는 직원에 대한 정보와 관리자가 아닌 직원의 정보를 추출하여 조회하세요.
-- 사번, 이름, 부서명, 직급, '관리자' AS 구분 / '직원' AS 구분
-- HINT!! is not null, union(혹은 then, else), distinct
-- 관리자 정보
select distinct e.emp_id '사번', e.emp_name '이름', d.dept_title'부서명', j.job_name '직급', '관리자' AS 구분
  from employee e
  join employee sub on e.emp_id = sub.manager_id
  left join department d on e.dept_code = d.dept_id
  left join job j on e.job_code = j.job_code

union

-- 직원 정보
select e.emp_id, e.emp_name, d.dept_title, j.job_name, '직원' AS 구분
  from employee e
  left join department d on e.DEPT_CODE = d.DEPT_ID
  left join job j ON e.job_code = j.job_code
 where e.emp_id not in (select distinct manager_id FROM employee where manager_id is not null);

-- 7. 자기 직급의 평균 급여를 받고 있는 직원의 사번, 이름, 직급코드, 급여를 조회하세요.
-- 단, 급여와 급여 평균은 만원단위로 계산하세요.
-- HINT!! round(컬럼명, -5) -> 만원단위 반올림
select emp_id '사번', emp_name '이름', dept_code '직급 코드', round(salary, -5) '급여'
  from employee
  where salary in (
	select round(avg(salary), -5)
    from employee
    group by job_code);

-- 8. 퇴사한 여직원과 같은 부서, 같은 직급에 해당하는 직원의 이름, 직급코드, 부서코드, 입사일을 조회하세요.
select emp_name, job_code, dept_code, hire_date
	from employee
    where (dept_code, job_code) in (
		select distinct dept_code, job_code
        from employee
        where ent_yn = 'Y' 
			and emp_no like '_______2%'
            or emp_no like '_______4%')
		and ent_yn = 'N';

-- 9. 급여 평균 3위 안에 드는 부서의 부서 코드와 부서명, 평균급여를 조회하세요.
-- HINT!! limit
select e.dept_code, d.dept_title, avg(e.salary) as '평균 급여'
			from employee e 
            join department d on e.dept_code = d.dept_id
            group by dept_code
            order by '평균 급여' desc
		limit 3;
        
-- 10. 부서별 급여 합계가 전체 급여의 총 합의 20%보다 많은 부서의 부서명과, 부서별 급여 합계를 조회하세요.
select d.dept_title, sum(e.salary) '부서별 급여 합계'
	from employee e
    join department d on e.dept_code = d.dept_id
    group by e.dept_code
		having sum(e.salary) > (
			select sum(salary) * 0.2 from employee
		);