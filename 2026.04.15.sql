--  오라클 예제 테이블 중 EMP 만 생성
DROP TABLE EMP purge;

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) ,
 CONSTRAINT EMP_PRIMARY_KEY PRIMARY KEY (EMPNO));

INSERT INTO EMP VALUES (7369,'SMITH', 'CLERK',    7902,to_date('80-12-17'), 800, NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN', 'SALESMAN', 7698,to_date('81-02-20'),1600, 300, 30);
INSERT INTO EMP VALUES (7521,'WARD',  'SALESMAN', 7698,to_date('81-02-22'),1250, 500, 30);
INSERT INTO EMP VALUES (7566,'JONES', 'MANAGER',  7839,to_date('81-04-02'),2975, NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN', 7698,to_date('81-09-28'),1250, 1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE', 'MANAGER',  7839,to_date('81-05-01'),2850, NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK', 'MANAGER',  7839,to_date('81-06-09'),2450, NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT', 'ANALYST',  7566,to_date('87-04-19'),3000, NULL,20);
INSERT INTO EMP VALUES (7839,'KING',  'PRESIDENT',NULL,to_date('81-11-17'),5000, NULL,10);
INSERT INTO EMP VALUES (7876,'ADAMS', 'CLERK',    7788,to_date('87-05-23'),1100, NULL,20);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN', 7698,to_date('81-09-08'),1500, 0,   30);
INSERT INTO EMP VALUES (7900,'JAMES', 'CLERK',    7698,to_date('81-12-03'), 950, NULL,30);
INSERT INTO EMP VALUES (7902,'FORD',  'ANALYST',  7566,to_date('81-04-02'),3000, NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',    7782,to_date('82-01-23'),1300, NULL,10);

COMMIT;

-- 1. 사원테이블에서 모든 데이터를 출력하라
SELECT * FROM EMP;

-- 2. 사원테이블에서 사원번호, 사원이름, 월급을 출력하라
SELECT empno, ename, sal FROM EMP;

-- 3. 사원테이블에서 월급을 뽑는데 중복된 데이터가 없게 출력하라
SELECT DISTINCT sal FROM EMP;

-- 4. 사원테이블에서 사원이름과 월급을 출력하는데 각각의 컬럼명을
SELECT ename as "이 름", sal as "월 급" FROM EMP;

-- 5. 사원테이블에서 'SMITH'이라는 사원의 사원번호, 이름, 월급을 출력하라
SELECT empno, ename, sal FROM EMP WHERE ename = 'SMITH';

-- 6. 커미션이 NULL인 사람의 정보를 출력하라.
SELECT * FROM EMP WHERE comm IS NULL;

-- 7. 사원테이블에서 사원이름, 월급을 뽑고, 월급과 커미션을  더한 값을 출력하는데 컬럼명을 '실급여'이라고 해서 출력하라. (단, 커미션이 0이거나  NULL 인 사람 제외)
SELECT ename, sal, sal+comm AS "실급여" FROM EMP WHERE comm != 0 AND comm IS NOT NULL;

-- 8. 사원테이블에서 월급이 1500에서 3000사이인 사원의 사원번호, 이름, 월급을 출력하라.
SELECT empno, ename, sal FROM EMP WHERE sal >= 1500 AND sal <= 3000;
SELECT empno, ename, sal FROM EMP WHERE between 1500 and 3000;

-- 9. 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라.
SELECT * FROM EMP WHERE ename LIKE '%S%';

-- 10. 사원테이블에서 월급이 많은 순으로 모든 정보를 출력하라
SELECT * FROM EMP ORDER BY sal DESC;

-- 11. 30번 부서의 사원들의 연봉을 계산하여 이름, 부서번호, 월급, 연봉을 출력하라. 단, 연말에 월급의 150%를 보너스로 지급한다. (단, sal 는 월급)
SELECT ename, deptno, sal, sal*12+sal*1.5 as "연봉" FROM EMP WHERE deptno = 30;

