-- sql/pl�� ����� ��
-- ���� �� ����� �ʿ��� ��
-- ����/�бⰡ �ʿ��� ���
-- �ݺ������ϰ��� �ϴ� ���
-- Ŀ���� ���� ���� ���� �˻��ϴ� ���
-- �Լ��� ���ν����� ���� ������ sql�� �ʿ��� �� ȣ�⸸ �ϸ� ����ǰ� �� ���
-- ����ó���� �ʿ��� ���
-- PL�� ����
-- �����(DECLARE), �����(BEGIN), [����ó����(EXCEPTION)//���û���], �����(END)

-- ���α׷� ����� ����Ǹ�, �ݵ�� ���� ���� "/" �� ����
-- ��κ��� �͸��� ����� ó��������,
-- ��� ����� ������ �ʿ��� ���, ���ν���, �Լ�, ��Ű��, Ʈ���ſ� ���� ���·� ������ �� �� ����


SET SERVEROUTPUT ON;  -- �ܼ�â ���

-- BEGIN�� END�� ������ �� ����
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello PL');
END;
/
-- ���� ���� / 

-- ������ ����(�ش� ���̺�� ������ ����)   //  %ROWTYPE ���̺� ��ü�� Ÿ���� �ҷ���
-- ������ Ÿ���� �������� �����ϴ� ���� ���ǹ��� ���

DECLARE     
    NAME VARCHAR2(20) := '�����';
    AGE NUMBER := 38;
    GENDER VARCHAR2(20) DEFAULT '��';
BEGIN       
    DBMS_OUTPUT.PUT_LINE('�̸�' || ':' || NAME);
    DBMS_OUTPUT.PUT_LINE('����' || ':' || AGE);
    DBMS_OUTPUT.PUT_LINE('����' || ':' || GENDER);
END;        
/       


DECLARE
    NAME VARCHAR2(20) := '�����';
    AGE NUMBER := 38;
    GENDER VARCHAR2(20) DEFAULT '��';
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

-- �ݺ� ���๮(FOR - LOOP)   Ư�� ����
-- IF LOOP ����� END 


BEGIN 
    FOR i IN 1..10 LOOP     -- ~ = ..
        IF MOD(i, 2) = 0 THEN 
            DBMS_OUTPUT.PUT_LINE(i || '�� ¦��');
        ELSE
            DBMS_OUTPUT.PUT_LINE(i || '�� Ȧ��');
        END IF;
    END LOOP;
END;
/

-- �ݺ����๮(LOOP~) ����

DECLARE
    V_NUM NUMBER := 6;  -- �ʱⰪ �ο�
    V_CNT NUMBER := 0;   -- �ʱ�ȭ
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� ����' || V_NUM);
        V_NUM := V_NUM + 1;
        V_CNT := V_CNT + 1;
        EXIT WHEN V_NUM > 10;
    DBMS_OUTPUT.PUT_LINE('����� ����' || V_CNT);    
    END LOOP;
END;
/

-- �ݺ����๮(WHILE~LOOP)

DECLARE
    V_NUM NUMBER := 6;
    V_CNT NUMBER := 0;
BEGIN
    WHILE V_NUM < 11 LOOP
        DBMS_OUTPUT.PUT_LINE('�������' || V_NUM);
        V_NUM := V_NUM + 1;
        V_CNT := V_CNT + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('����� ����' || V_CNT);
END;
/

-- ���ǹ�(IF~ELSIF~ELSE)   ELSEIF >> ELSIF     IF ���ǹ� THEN

DECLARE
    V_SCORE NUMBER := 82;
BEGIN
    IF V_SCORE >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('����' || V_SCORE || '����' || 'A');
    ELSIF V_SCORE >= 80 THEN
    DBMS_OUTPUT.PUT_LINE('����' || V_SCORE || '����' || 'B');
    ELSIF V_SCORE >= 70 THEN
    DBMS_OUTPUT.PUT_LINE('����' || V_SCORE || '����' || 'C');
    ELSIF V_SCORE >= 60 THEN
    DBMS_OUTPUT.PUT_LINE('����' || V_SCORE || '����' || 'D');
    ELSE
    DBMS_OUTPUT.PUT_LINE('����' || V_SCORE || '����' || 'F');
    END IF;
END;
/

-- ���ù�(CASE~WHEN)
DECLARE
    V_GRADE CHAR(1) := 'B';
    V_MSG VARCHAR2(40);
BEGIN
    CASE V_GRADE        -- CASE ����
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





INSERT INTO member values('yhk', 'a1234', '������', '������ 13', '010-1111-2222', '2022-09-13');
INSERT INTO member values('lhy', 'a3421', '���Ͽ�', '���ε� 888', '031-2222-3333', '2022-09-13');
INSERT INTO member values('lhn', 'b1111', '���س�', '�鼮�� 777', '010-3333-4444', '2022-09-14');
INSERT INTO member values('jbj', 'c456', '������', '���絿 178', '010-4444-5555', '2022-09-15');
INSERT INTO member values('jjs', 'z675', '������', '���ﵿ 75', '031-4444-2222', '2022-09-11');
INSERT INTO member values('cmj', 'q789', '������', 'â���� 1004', '010-5555-6666', '2022-09-15');
INSERT INTO member values('hsy', 'g478', '�ѽÿ�', 'â�ŵ� 128', '010-6666-7777', '2022-09-13');
INSERT INTO member values('hth', 'd666', '������', '��ŵ� 67', '010-7777-8888', '2022-09-14');
INSERT INTO member values('kyj', 'e964', '������', 'ȭ���� 912', '031-5555-2222', '2022-09-05');
INSERT INTO member values('nsy', 'h369', '������', '�ﵵ�� 37', '010-8888-9999', '2022-09-16');

commit;