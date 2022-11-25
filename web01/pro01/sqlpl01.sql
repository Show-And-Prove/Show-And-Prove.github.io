-- sql/pl을 사용할 때
-- 변수 및 상수가 필요할 때
-- 조건/분기가 필요한 경우
-- 반복실행하고자 하는 경우
-- 커서와 같은 여러 행을 검색하는 경우
-- 함수나 프로시저와 같은 복잡한 sql의 필요할 때 호출만 하면 실행되게 할 경우
-- 예외처리가 필요한 경우
-- PL의 구성
-- 선언부(DECLARE), 실행부(BEGIN), [예외처리부(EXCEPTION)//선택사항], 종료부(END)

-- 프로그램 블록이 종료되면, 반드시 가장 끝에 "/" 를 붙임
-- 대부분은 익명의 블록을 처리하지만,
-- 명령 블록의 저장이 필요한 경우, 프로시저, 함수, 패키지, 트리거와 같은 형태로 저장이 될 수 있음


SET SERVEROUTPUT ON;  -- 콘솔창 출력

-- BEGIN과 END는 생략될 수 없음
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL');
END;
/
-- 가장 끝에 / 

-- 변수의 선언(해당 테이블로 부터의 변수)   //  %ROWTYPE 테이블 전체의 타입을 불러옴
-- 데이터 타입을 변수마다 기입하는 것이 무의미할 경우

DECLARE     
    NAME VARCHAR2(20) := '김기태';
    AGE NUMBER := 38;
    GENDER VARCHAR2(20) DEFAULT '남';
BEGIN       
    DBMS_OUTPUT.PUT_LINE('이름' || ':' || NAME);
    DBMS_OUTPUT.PUT_LINE('나이' || ':' || AGE);
    DBMS_OUTPUT.PUT_LINE('성별' || ':' || GENDER);
END;        
/       


DECLARE
    NAME VARCHAR2(20) := '김기태';
    AGE NUMBER := 38;
    GENDER VARCHAR2(20) DEFAULT '남';
BEGIN
    SELECT * INTO DATA 
    FROM MEMBER 
    WHERE ID='jbj';
    DBMS_OUTPUT.PUT_LINE(DATA.ID ||','|| DATA.PASSWORD);
END;
/

DECLARE
    DATA MEMBER%ROWTYPE;
BEGIN
    SELECT * INTO DATA FROM MEMBER WHERE ID='jbj';
    DBMS_OUTPUT.PUT_LINE(DATA.ID || ',' || DATA.PASSWORD);
END;
/

DECLARE
    V_NAME MEMBER.NAME%TYPE;
    V_ID MEMBER.ID%TYPE;
BEGIN
    SELECT NAME, ID INTO V_NAME, V_ID FROM MEMBER WHERE ID='jbj';
    DBMS_OUTPUT.PUT_LINE(V_NAME || V_ID);
END;
/

-- 반복 실행문(FOR - LOOP)   특정 구간
-- IF LOOP 사용후 END 


BEGIN 
    FOR i IN 1..10 LOOP     -- ~ = ..
        IF MOD(i, 2) = 0 THEN 
            DBMS_OUTPUT.PUT_LINE(i || '는 짝수');
        ELSE
            DBMS_OUTPUT.PUT_LINE(i || '는 홀수');
        END IF;
    END LOOP;
END;
/

-- 반복실행문(LOOP~) 조건

DECLARE
    V_NUM NUMBER := 6;  -- 초기값 부여
    V_CNT NUMBER := 0;   -- 초기화
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 숫자' || V_NUM);
        V_NUM := V_NUM + 1;
        V_CNT := V_CNT + 1;
        EXIT WHEN V_NUM > 10;
    DBMS_OUTPUT.PUT_LINE('출력한 갯수' || V_CNT);    
    END LOOP;
END;
/

-- 반복실행문(WHILE~LOOP)

DECLARE
    V_NUM NUMBER := 6;
    V_CNT NUMBER := 0;
BEGIN
    WHILE V_NUM < 11 LOOP
        DBMS_OUTPUT.PUT_LINE('현재숫자' || V_NUM);
        V_NUM := V_NUM + 1;
        V_CNT := V_CNT + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('출력한 갯수' || V_CNT);
END;
/

-- 조건문(IF~ELSIF~ELSE)   ELSEIF >> ELSIF     IF 조건문 THEN

DECLARE
    V_SCORE NUMBER := 82;
BEGIN
    IF V_SCORE >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('점수' || V_SCORE || '학점' || 'A');
    ELSIF V_SCORE >= 80 THEN
    DBMS_OUTPUT.PUT_LINE('점수' || V_SCORE || '학점' || 'B');
    ELSIF V_SCORE >= 70 THEN
    DBMS_OUTPUT.PUT_LINE('점수' || V_SCORE || '학점' || 'C');
    ELSIF V_SCORE >= 60 THEN
    DBMS_OUTPUT.PUT_LINE('점수' || V_SCORE || '학점' || 'D');
    ELSE
    DBMS_OUTPUT.PUT_LINE('점수' || V_SCORE || '학점' || 'F');
    END IF;
END;
/

-- 선택문(CASE~WHEN)
DECLARE
    V_GRADE CHAR(1) := 'B';
    V_MSG VARCHAR2(40);
BEGIN
    CASE V_GRADE        -- CASE 변수
        WHEN 'A' THEN   -- WHEN  THEN
            V_MSG := 'EXCELLENT';   -- 
        WHEN 'B' THEN
            V_MSG := 'VERY GOOD';
        WHEN 'C' THEN
            V_MSG := 'GOOD';
        ELSE
            V_MSG := 'BAD GRADE';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('GRADE : ' || V_GRADE);
    DBMS_OUTPUT.PUT_LINE('MESSAGE : ' || V_MSG);
END;
/
























create table member(
id varchar2(12) primary key,
password VARCHAR2(12) not null,
name VARCHAR2(20) not null,
address VARCHAR2(100),
tel VARCHAR2(20) not null,
reg_date date default sysdate);    

commit;





INSERT INTO member values('yhk', 'a1234', '유광현', '도내동 13', '010-1111-2222', '2022-09-13');
INSERT INTO member values('lhy', 'a3421', '이하영', '마두동 888', '031-2222-3333', '2022-09-13');
INSERT INTO member values('lhn', 'b1111', '이해나', '백석동 777', '010-3333-4444', '2022-09-14');
INSERT INTO member values('jbj', 'c456', '정병진', '성사동 178', '010-4444-5555', '2022-09-15');
INSERT INTO member values('jjs', 'z675', '정진석', '원흥동 75', '031-4444-2222', '2022-09-11');
INSERT INTO member values('cmj', 'q789', '조민재', '창릉동 1004', '010-5555-6666', '2022-09-15');
INSERT INTO member values('hsy', 'g478', '한시연', '창신동 128', '010-6666-7777', '2022-09-13');
INSERT INTO member values('hth', 'd666', '한태헌', '행신동 67', '010-7777-8888', '2022-09-14');
INSERT INTO member values('kyj', 'e964', '고유진', '화정동 912', '031-5555-2222', '2022-09-05');
INSERT INTO member values('nsy', 'h369', '남송윤', '흥도동 37', '010-8888-9999', '2022-09-16');

commit;