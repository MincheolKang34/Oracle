-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-12 11:44:39 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE chart (
    chart_id   CHAR(8 BYTE) NOT NULL,
    treat_no   NUMBER(7) NOT NULL,
    doc_id     CHAR(7 BYTE) NOT NULL,
    pat_id     CHAR(7 BYTE) NOT NULL,
    chart_desc VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE chart ADD CONSTRAINT chart_pk PRIMARY KEY ( chart_id );

ALTER TABLE chart
    ADD CONSTRAINT chart__un UNIQUE ( treat_no,
                                      doc_id,
                                      pat_id );

CREATE TABLE department (
    dep_no      CHAR(3 BYTE) NOT NULL,
    dep_name    VARCHAR2(20 BYTE) NOT NULL,
    dep_manager VARCHAR2(20 BYTE) NOT NULL,
    dep_tel     VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( dep_no );

CREATE TABLE doctor (
    doc_id    CHAR(7 BYTE) NOT NULL,
    doc_name  VARCHAR2(45 BYTE) NOT NULL,
    doc_birth CHAR(10 BYTE) NOT NULL,
    doc_gen   CHAR(1 BYTE) NOT NULL,
    dep_no    CHAR(3 BYTE),
    doc_pos   VARCHAR2(45 BYTE) NOT NULL,
    doc_phone VARCHAR2(20 BYTE) NOT NULL,
    doc_email VARCHAR2(45 BYTE) NOT NULL
);

ALTER TABLE doctor ADD CONSTRAINT doctor_pk PRIMARY KEY ( doc_id );

ALTER TABLE doctor ADD CONSTRAINT doctor__un UNIQUE ( doc_phone,
                                                      doc_email );

CREATE TABLE nurse (
    nur_id     CHAR(7 BYTE) NOT NULL,
    nur_name   VARCHAR2(50 BYTE) NOT NULL,
    nur_birth  CHAR(10 BYTE) NOT NULL,
    nur_gender CHAR(1 BYTE) NOT NULL,
    dep_no     CHAR(3 BYTE),
    nur_pos    VARCHAR2(50 BYTE) NOT NULL,
    nur_phone  CHAR(13 BYTE) NOT NULL,
    nur_email  VARCHAR2(50 BYTE)
);

ALTER TABLE nurse ADD CONSTRAINT nurse_pk PRIMARY KEY ( nur_id );

ALTER TABLE nurse ADD CONSTRAINT nurse__un UNIQUE ( nur_phone,
                                                    nur_email );

CREATE TABLE patient (
    pat_id    CHAR(7 BYTE) NOT NULL,
    doc_id    CHAR(7 BYTE),
    nur_id    CHAR(7 BYTE),
    pat_name  VARCHAR2(45 BYTE) NOT NULL,
    pat_jumin CHAR(14 BYTE) NOT NULL,
    pat_gen   CHAR(1 BYTE) NOT NULL,
    pat_addr  VARCHAR2(100 BYTE) NOT NULL,
    pat_phone VARCHAR2(45 BYTE) NOT NULL,
    pat_email VARCHAR2(45 BYTE),
    pat_job   VARCHAR2(45 BYTE)
);

ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( pat_id );

ALTER TABLE patient
    ADD CONSTRAINT patient__un UNIQUE ( pat_jumin,
                                        pat_phone,
                                        pat_email );

CREATE TABLE treatment (
    treat_no       NUMBER(7) NOT NULL,
    doc_id         CHAR(7 BYTE) NOT NULL,
    pat_id         CHAR(7 BYTE) NOT NULL,
    treat_desc     VARCHAR2(100 BYTE) NOT NULL,
    treat_datetime DATE NOT NULL
);

ALTER TABLE treatment ADD CONSTRAINT treatment_pk PRIMARY KEY ( treat_no );

ALTER TABLE treatment
    ADD CONSTRAINT treatment__unv2 UNIQUE ( treat_no,
                                            doc_id,
                                            pat_id );

ALTER TABLE chart
    ADD CONSTRAINT chart_treatment_fk
        FOREIGN KEY ( treat_no,
                      doc_id,
                      pat_id )
            REFERENCES treatment ( treat_no,
                                   doc_id,
                                   pat_id );

ALTER TABLE doctor
    ADD CONSTRAINT doctor_department_fk FOREIGN KEY ( dep_no )
        REFERENCES department ( dep_no );

ALTER TABLE nurse
    ADD CONSTRAINT nurse_department_fk FOREIGN KEY ( dep_no )
        REFERENCES department ( dep_no );

ALTER TABLE patient
    ADD CONSTRAINT patient_doctor_fk FOREIGN KEY ( doc_id )
        REFERENCES doctor ( doc_id );

ALTER TABLE patient
    ADD CONSTRAINT patient_nurse_fk FOREIGN KEY ( nur_id )
        REFERENCES nurse ( nur_id );

ALTER TABLE treatment
    ADD CONSTRAINT treatment_doctor_fk FOREIGN KEY ( doc_id )
        REFERENCES doctor ( doc_id );

ALTER TABLE treatment
    ADD CONSTRAINT treatment_patient_fk FOREIGN KEY ( pat_id )
        REFERENCES patient ( pat_id );
