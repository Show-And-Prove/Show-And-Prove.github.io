
CREATE TABLE MEMBERA(
    id	VARCHAR2(16)	PRIMARY KEY,    --아이디
    pw	VARCHAR2(20)	NOT NULL,        --비밀번호
    name	VARCHAR2(50)	NOT NULL,    --이름
    email	VARCHAR2(100),	            --이메일
    tel	VARCHAR2(13),	                --전화번호
    regdate	DATE	DEFAULT SYSDATE     --가입일
);















CREATE TABLE BOARDA(
    no	NUMBER	PRIMARY KEY,        --순번,자동발생
    title	VARCHAR2(100)	NOT NULL,    --제목
    content	VARCHAR2(600),	            --내용
    author	VARCHAR2(16)	NOT NULL,    --글쓴이
    resdate	DATE	DEFAULT SYSDATE,    --작성일
    CONSTRAINT fk_id FOREIGN KEY (author) REFERENCES MEMBERA(id)
);    

COMMIT;
