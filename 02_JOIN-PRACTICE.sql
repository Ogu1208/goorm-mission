-- JOIN을 이용하여 여러 테이블을 조회 시에는 모든 컬럼에 테이블 별칭을 사용하는 것이 좋다.

-- 1. 직급이 대리이면서 아시아 지역에 근무하는 직원의 사번, 이름, 직급명, 부서명, 지역명, 급여를 조회하세요
select E.emp_id, E.emp_name, j.job_name, D.dept_title, L.local_code, E.salary
		from employee E
		inner join job J on E.job_code = J.job_code
        inner join department D on E.dept_code = D.dept_id
		inner join location L on D.location_id = L.local_code
	where J.job_name = '대리' and L.LOCAL_NAME like 'ASIA%';
	

-- 2. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 전씨인 직원의 이름, 주민등록번호, 부서명, 직급명을 조회하세요.
select E.emp_name, E.emp_no, D.dept_title, J.job_name
		from employee E
		inner join department D on E.dept_code = D.dept_id
		inner join job J on E.job_code = J.job_code
	where e.emp_no like '7_____-2%' and emp_name like '전%';


-- 3. 이름에 '형'자가 들어가는 직원의 사번, 이름, 직급명을 조회하세요.
select E.emp_id,  E.emp_name, J.job_name
		from employee E
		inner join job J on E.job_code = J.job_code
	where E.emp_name like '%형%';

-- 4. 해외영업팀에 근무하는 직원의 이름, 직급명, 부서코드, 부서명을 조회하세요.
select E.emp_name, J.job_name, E.dept_code, D.dept_title
		from employee E
		inner join job J on E.job_code = J.job_code
		inner join department D on E.dept_code = D.dept_id
	where D.dept_title like '해외영업%';
    

-- 5. 보너스포인트를 받는 직원의 이름, 보너스, 부서명, 지역명을 조회하세요.
select E.emp_name, E.salary * E.bonus '보너스', D.dept_title, L.local_name
		from employee E
		inner join department D on E.dept_code = D.dept_id
		inner join location L on D.location_id = L.local_code
	where E.bonus is not null;

-- 6. 부서코드가 D2인 직원의 이름, 직급명, 부서명, 지역명을 조회하세오.
select E.emp_name, J.job_name, D.dept_title, L.local_name
		from employee E
        inner join job J on E.job_code = J.job_code
        inner join department D on E.dept_code = D.dept_id
        inner join location L on D.location_id = L.local_code
	where E.dept_code = 'D2';

-- 7. 한국(KO)과 일본(JP)에 근무하는 직원의 이름, 부서명, 지역명, 국가명을 조회하세요.
select E.emp_name, D.dept_title, L.local_name, N.national_name
	from employee E
    inner join department D on E.dept_code = D.dept_id
    inner join location L on D.location_id = L.local_code
    inner join nation N on L.national_code = N.national_code
    where L.national_code in ('KO', 'JP');