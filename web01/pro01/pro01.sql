
CREATE TABLE MEMBERA(
    id	VARCHAR2(16)	PRIMARY KEY,    --���̵�
    pw	VARCHAR2(20)	NOT NULL,        --��й�ȣ
    name	VARCHAR2(50)	NOT NULL,    --�̸�
    email	VARCHAR2(100),	            --�̸���
    tel	VARCHAR2(13),	                --��ȭ��ȣ
    regdate	DATE	DEFAULT SYSDATE     --������
);















CREATE TABLE BOARDA(
    no	NUMBER	PRIMARY KEY,        --����,�ڵ��߻�
    title	VARCHAR2(100)	NOT NULL,    --����
    content	VARCHAR2(600),	            --����
    author	VARCHAR2(16)	NOT NULL,    --�۾���
    resdate	DATE	DEFAULT SYSDATE,    --�ۼ���
    CONSTRAINT fk_id FOREIGN KEY (author) REFERENCES MEMBERA(id)
);    

COMMIT;
