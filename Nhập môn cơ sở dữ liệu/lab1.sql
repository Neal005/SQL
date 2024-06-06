-- *Buoi 1*
--Bang 1

CREATE TABLE KHOAHOC(
    MAKH varchar(4) primary key,
    TENKH varchar(255) not null,
    NGAYBD date not null,
    NGAYKT date not null
);

--Bang 2

CREATE TABLE CHUONGTRINH(
    MACT varchar(5) primary key,
    TENCT varchar(255) not null
);

--Bang 3

CREATE TABLE LOAILOP(
    MALOAI varchar(5) primary key,
    MACT varchar(5),
    TENLOAI varchar(255) not null
);

--Bang 4

CREATE TABLE LOP(
    MALOP varchar(4) primary key,
    MALOAI varchar(5) not null,
    TENLOP varchar(255) not null,
    SISO INT,
    MAKH varchar(4) not null
);

-- Bang 5

CREATE TABLE HOCVIEN(
    MAHV varchar(6) primary key,
    TENHV varchar(255) not null,
    GIOITINH int,
    NGAYSINH date not null,
    SDT varchar(9),
    DIACHI varchar(255)
);

-- Bang 6

CREATE TABLE PHIEUTHU(
    SOPT varchar(8) primary key,
    MAHV varchar(6) not null,
    MALOP varchar(4) not null,
    NGAYLAPPHIEU date not null,
    THANHTIEN int not null
);

--Bang 7

CREATE TABLE MONHOC(
    MAMH varchar(6) primary key,
    TENMH varchar(255) not null
);

--Bang 8

CREATE TABLE DIEM(
    MAMH varchar(6) not null,
    MAHV varchar(6) not null,
    MALOP varchar(4) not null,
    DIEM int,
    PRIMARY KEY (MAMH,MAHV,MALOP)
);

--Cau 1:
--a

ALTER TABLE  LOAILOP ADD FOREIGN KEY (MACT) REFERENCES  CHUONGTRINH (MACT);
ALTER TABLE  LOP ADD FOREIGN KEY (MALOAI) REFERENCES  LOAILOP (MALOAI);
ALTER TABLE  LOP ADD FOREIGN KEY (MAKH) REFERENCES  KHOAHOC (MAKH);
ALTER TABLE  PHIEUTHU ADD FOREIGN KEY (MAHV) REFERENCES  HOCVIEN (MAHV);
ALTER TABLE  PHIEUTHU ADD FOREIGN KEY (MALOP) REFERENCES  LOP (MALOP);
ALTER TABLE  DIEM ADD FOREIGN KEY (MAMH) REFERENCES  MONHOC (MAMH);
ALTER TABLE  DIEM ADD FOREIGN KEY (MAHV) REFERENCES  HOCVIEN (MAHV);
ALTER TABLE  DIEM ADD FOREIGN KEY (MALOP) REFERENCES  LOP (MALOP);

--b

ALTER TABLE KHOAHOC ADD CONSTRAINT CHECKDATE CHECK (ngaykt>ngaybd);

--c

ALTER TABLE LOP ADD CONSTRAINT CHECKSISO CHECK (siso>12);

--d

ALTER TABLE HOCVIEN ADD CONSTRAINT CHECKGT CHECK (gioitinh in ('0','1'));

--e

ALTER TABLE PHIEUTHU ADD CONSTRAINT CHECKTHANHTIEN CHECK (thanhtien>0);
ALTER TABLE DIEM ADD CONSTRAINT CHECKDIEM CHECK (diem>=0 and diem<=10);

--Cau 2:
--DATA 1

    INSERT INTO "KHOAHOC" VALUES('K001','Khoa 1',TO_DATE('2020/01/10','yyyy/mm/dd'),TO_DATE('2020/03/20','yyyy/mm/dd'));
    INSERT INTO "KHOAHOC" VALUES('K002','Khoa 2',TO_DATE('2020/02/28','yyyy/mm/dd'),TO_DATE('2020/05/28','yyyy/mm/dd'));
    INSERT INTO "KHOAHOC" VALUES('K003','Khoa 3',TO_DATE('2020/04/10','yyyy/mm/dd'),TO_DATE('2020/07/20','yyyy/mm/dd'));
    INSERT INTO "KHOAHOC" VALUES('K004','Khoa 4',TO_DATE('2020/06/15','yyyy/mm/dd'),TO_DATE('2020/09/20','yyyy/mm/dd'));

--DATA 2

INSERT INTO CHUONGTRINH VALUES ('CT007','Chung Chi TIeng Anh 6 Bac(A1,B1,B2,C1)');
INSERT INTO CHUONGTRINH VALUES ('CT006','Chuong trinh CamBridge');
INSERT INTO CHUONGTRINH VALUES ('CT005','Tieng Anh IELTS');
INSERT INTO CHUONGTRINH VALUES ('CT004','Chuong Trinh TOEIC');
INSERT INTO CHUONGTRINH VALUES ('CT003','Tieng Anh Luyen Ky Nang');
INSERT INTO CHUONGTRINH VALUES ('CT002','Tieng Anh Tre EM');
INSERT INTO CHUONGTRINH VALUES ('CT001','Tieng Anh Tong Quat');

--DATA 3

INSERT INTO LOAILOP VALUES ('LL001','CT001','Tieng Anh can ban');
INSERT INTO LOAILOP VALUES ('LL002','CT001','Tieng Anh A1');
INSERT INTO LOAILOP VALUES ('LL003','CT001','Tieng Anh A2');
INSERT INTO LOAILOP VALUES ('LL004','CT001','Tieng Anh B1');
INSERT INTO LOAILOP VALUES ('LL005','CT001','Tieng Anh B2');
INSERT INTO LOAILOP VALUES ('LL006','CT001','Tieng Anh C1');

--DATA 4

INSERT INTO LOP VALUES ('L001','LL001','Lop 1',30,'K001');
INSERT INTO LOP VALUES ('L002','LL002','Lop 2',30,'K001');
INSERT INTO LOP VALUES ('L003','LL002','Lop 3',25,'K001');

--DATA 5

INSERT INTO HOCVIEN VALUES ('HV0001','Do Binh An',1,to_date('2000-11-02','yyyy-mm-dd'),'917217036','Co Do - Can Tho');
INSERT INTO HOCVIEN VALUES ('HV0002','Do Gia Bao',1,to_date('2001-12-02','yyyy-mm-dd'),'917217036','O Mon - Can Tho');
INSERT INTO HOCVIEN VALUES ('HV0003','Do Phuc Vinh',1,to_date('2002-11-02','yyyy-mm-dd'),'917217036','Cu lao Dung - Soc Trang');
INSERT INTO HOCVIEN VALUES ('HV0004','Thach Chi Tam',1,to_date('2000-01-02','yyyy-mm-dd'),'917217036','Chau Thanh-An Giang');
INSERT INTO HOCVIEN VALUES ('HV0005','Le Cam Giao',0,to_date('2000-11-05','yyyy-mm-dd'),'917217036','Phong Dien - Can Tho');
INSERT INTO HOCVIEN VALUES ('HV0006','Huynh Gia Bao',1,to_date('2000-11-02','yyyy-mm-dd'),'917217036','Phong Dien - Can Tho');

--DATA 6

INSERT INTO PHIEUTHU VALUES ('PT000001','HV0001','L001',to_date('2021-06-01','yyyy-mm-dd'),1350000);
INSERT INTO PHIEUTHU VALUES ('PT000002','HV0002','L001',to_date('2021-06-01','yyyy-mm-dd'),1350000);
INSERT INTO PHIEUTHU VALUES ('PT000003','HV0003','L001',to_date('2021-06-01','yyyy-mm-dd'),1350000);
INSERT INTO PHIEUTHU VALUES ('PT000004','HV0004','L001',to_date('2021-06-01','yyyy-mm-dd'),1350000);
INSERT INTO PHIEUTHU VALUES ('PT000005','HV0005','L001',to_date('2021-06-01','yyyy-mm-dd'),1350000);
INSERT INTO PHIEUTHU VALUES ('PT000006','HV0006','L001',to_date('2021-06-01','yyyy-mm-dd'),1350000);

--Cau 3: Dong nay khong them duoc vi khong tim thay khoa cha cua HV0012
INSERT INTO PHIEUTHU VALUES ('PT000008','HV0012','L001',to_date('06-02-2021','dd-mm-yyyy'),1350000);

--Cau 4: Dong nay khong them duoc vao bang "LOP" vi si so nho hon 12
INSERT INTO LOP VALUES ('L004','Lop 4','LL002',10,'K001');

--Cau 5: Khoa hoc nay khong xoa duoc vi ma khoa hoc K001 la khoa ngoai cua quan he Lop
DELETE FROM KHOAHOC
WHERE MAKH='K001';

--Cau 6: Khoa hoc nay xoa duoc vi ma khoa hoc K002 khong la khoa ngoai cua cac quan he khac
delete from KHOAHOC
where MAKH='K002';

--Cau 7: Giam gia tri cua thanh tien cua phieu thu 000001 xuong 10%
UPDATE PHIEUTHU
SET THANHTIEN=THANHTIEN*90/100
WHERE SOPT='PT000001';

--Cau 8:
ALTER TABLE LOP ADD HOCPHI INT;
UPDATE LOP SET hocphi = 1350000 WHERE MALOAI = 'LL001';
UPDATE LOP SET hocphi = 1650000 WHERE MALOAI = 'LL002';

--Cau 9&10:
CREATE TABLE HOCVIEN_NAM AS
    SELECT MAHV,TENHV,SDT,NGAYSINH,DIACHI
    FROM HOCVIEN
    WHERE GIOITINH=1;

--Cau 11: Khong xoa duoc vi khoa chinh la khoa ngoai cua quan he khac
DROP TABLE KHOAHOC;

--Cau 12: Xoa duoc vi khoa chinh khong la khoa ngoai cua quan he khac chi chep du lieu tu HOCVIEN
DROP TABLE HOCVIEN_NAM;

--Cau 13: Doi kieu du lieu cua tenMH trong bang MONHOC thanh VARCHAR(100)
ALTER TABLE MONHOC MODIFY TENMH VARCHAR(100);