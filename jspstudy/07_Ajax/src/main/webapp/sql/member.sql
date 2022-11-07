DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ NOCACHE;

DROP TABLE MEMBER;
CREATE TABLE MEMBER ()
	MEMBER_NO NUMBER NOT NULL,
	ID		  VARCHAR2(20 BYTE) NOT NULL UNIQUE,
	NAME	  VARCHAR2(20 BYTE),
	GENDER    VARCHAR2(2 BYTE),
	GRADE     VARCHAR2(10 BYTE),
	ADDRESS   VARCHAR2(100 BYTE),
	CONSTRAINT PK_MEMBER PRIMARY KEY(MEMBER_NO)
;

INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 'user1', '회원1', 'M', 'gold', 'jeju');
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 'user1', '회원2', 'F', 'silver', 'jeju');
INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL, 'user1', '회원3', 'M', 'gold', 'jeju');
COMMIT;
