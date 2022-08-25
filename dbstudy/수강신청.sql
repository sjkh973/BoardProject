
DROP TABLE LECTURE;
DROP TABLE ENROLL;
DROP TABLE STUDENT;
DROP TABLE COURSE;
DROP TABLE PROFESSOR;

-- 교수
CREATE TABLE PROFESSOR(
    PRO_NO   NUMBER             NOT NULL, -- PK
    PRO_NAME VARCHAR2 (20 BYTE) NOT NULL,
    PRO_SUB  VARCHAR2 (20 BYTE) NOT NULL
);    
-- 과목
CREATE TABLE COURSE(
    COUR_NO    NUMBER             NOT NULL, --PK
    COUR_NAME  VARCHAR2 (20 BYTE) NOT NULL,
    COUR_SCORE NUMBER             NOT NULL
);
-- 학생
CREATE TABLE STUDENT(
    STU_NO    NUMBER             NOT NULL, --PK
    STU_NAME  VARCHAR2 (20 BYTE) NOT NULL,
    STU_ADDR  VARCHAR2 (40 BYTE)     NULL,
    STU_GRADE NUMBER                 NULL,
    PRO_NO    VARCHAR2 (10 BYTE)     NULL -- FK
);
--수강신청 FK : STUDENT, COURSE
CREATE TABLE ENROLL(
    ENRO_NO NUMBER , --PK
    STU_NO  NUMBER , --FK
    COUR_NO NUMBER , -- FK
    ENRO_DATE DATE NULL
);    

CREATE TABLE LECTURE(
    LEC_NO   NUMBER              NOT NULL, -- PK
    PRO_NO   NUMBER              NOT NULL, -- FK
    ENRO_NO  NUMBER              NOT NULL, -- FK
    LEC_NAME VARCHAR2 (20 BYTE)  NOT NULL, 
    LEC_ROOM VARCHAR2 (10 BYTE)  NOT NULL
);

--기본키
ALTER TABLE PROFESSOR
    ADD CONSTRAINT PK_PROFESSOR PRIMARY KEY(PRO_NO);
ALTER TABLE COURSE
    ADD CONSTRAINT PK_COURSE PRIMARY KEY(COUR_NO);       
ALTER TABLE STUDENT
    ADD CONSTRAINT PK_STUDENT PRIMARY KEY(STU_NO);
ALTER TABLE ENROLL
    ADD CONSTRAINT PK_ENROLL PRIMARY KEY(ENRO_NO);  
ALTER TABLE LECTURE
    ADD CONSTRAINT PK_LECTURE PRIMARY KEY(LEC_NO);
    


--외래키
ALTER TABLE STUDENT    
    ADD CONSTRAINT FK_STUDENT_PROFESSOR FOREIGN KEY(PRO_NO) REFERENCES PROFESSOR(PRO_NO) ON DELETE SET NULL;
ALTER TABLE ENROLL
    ADD CONSTRAINT FK_ENROLL_STUDENT FOREIGN KEY(STU_NO) REFERENCES STUDENT(STU_NO) ON DELETE SET NULL;
ALTER TABLE ENROLL
    ADD CONSTRAINT FK_ENROLL_COURSE FOREIGN KEY(COUR_NO) REFERENCES COURSE(COUR_NO) ON DELETE SET NULL;
ALTER TABLE LECTURE
    ADD CONSTRAINT FK_LECTURE_PROFESSOR FOREIGN KEY(PRO_NO) REFERENCES PROFESSOR(PRO_NO) ON DELETE SET NULL;
ALTER TABLE LECTURE
    ADD CONSTRAINT FK_LECTURE_ENROLL FOREIGN KEY(ENRO_NO) REFERENCES ENROLL(ENRO_NO) ON DELETE SET NULL;


-- INSERT 

INSERT INTO PROFESSOR
    (PRO_NO,PRO_NAME,PRO_SUB)
VALUES(1001,'김주성','물리');


-- UPDATE
UPDATE PROFESSOR    
   SET PRO_SUB = '개발'
 WHERE PRO_NO = 1001;
 
-- DELETE
 DELETE 
   FROM PROFESSOR
  WHERE PRO_NO = 1001;  
    



    
