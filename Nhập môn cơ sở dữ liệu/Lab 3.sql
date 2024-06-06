--Buoi 3
--Cau 1: Xem dữ liệu của tất cả các bảng
CREATE TABLE TACPHAM(
	NT 		smallint primary key ,
	tua 		varchar(150),
	tacgia 		varchar(100)
) ;

CREATE TABLE DOCGIA (
	ND		smallint PRIMARY KEY ,
	ho		VARCHAR(30),
	ten		VARCHAR(30),
	dchi	VARCHAR(100),
	tel		CHAR(10)
) ;

CREATE TABLE SACH (
	NS		smallint primary key ,
	nxb		varchar(50),
	NT		smallint not null, 
 	foreign key(NT) references TACPHAM(NT)
);

CREATE TABLE MUON (
	NS		smallint not NULL, 
	foreign key(NS) references SACH(NS),
	ngaymuon	date not NULL,
	hantra	date not null,
	ngaytra 	date,
	ND		smallint not null, 
	foreign key(ND) references DOCGIA(ND),
	primary key 	(NS, ngaymuon)
) ;

alter session set nls_date_format='MM-DD-YYYY';

INSERT INTO TACPHAM VALUES (1,'Les miserables','Victor Hugo');
INSERT INTO TACPHAM VALUES (2,'Germinal ','Emile Zola');
INSERT INTO TACPHAM VALUES (3,'Madame Bovary','Gustave Flaubert');
INSERT INTO TACPHAM VALUES (4,'Les Fleurs du mal','Charles Baudelaire');
INSERT INTO TACPHAM VALUES (5,'La Bete Humaine','Emile Zola');
INSERT INTO TACPHAM VALUES (6,'Le Pere Goriot ','Honore de Balzac');
INSERT INTO TACPHAM VALUES (7,'Le Rouge et le Noir','Stendhal');
INSERT INTO TACPHAM VALUES (8,'Une vie','Guy de Maupassant');
INSERT INTO TACPHAM VALUES (9,'Ubu Roi','Alfred Jarry');
INSERT INTO TACPHAM VALUES (10,'Po�e','Arthur Rimbaud');
INSERT INTO TACPHAM VALUES (11,'La Mare au Diable','George Sand');
INSERT INTO TACPHAM VALUES (12,'Carmen','Prosper Merimee');
INSERT INTO TACPHAM VALUES (13,'Lettres de mon moulin','Alphonse Daudet');
INSERT INTO TACPHAM VALUES (14,'Les contes du chat perché', 'Marcel Ayme');
INSERT INTO TACPHAM VALUES (15,'La Peste','Albert Camus');
INSERT INTO TACPHAM VALUES (16,'Le petit prince','Antoine de St Exupery');


INSERT INTO DOCGIA VALUES (1,'Lecoeur','Jeanette','16 rue de la R blique, 75010 Paris','0145279274');
INSERT INTO DOCGIA VALUES (2,'Lecoeur','Philippe','16 rue de la R blique, 75010 Paris','0145279274');
INSERT INTO DOCGIA VALUES (3,'Dupont','Yvan','73 rue Lamarck, 75018 Paris','0163538294');
INSERT INTO DOCGIA VALUES (4,'Mercier','Claude','155 avenue Parmentier, 75011 Paris','0136482736');
INSERT INTO DOCGIA VALUES (5,'L r','Marc','90 avenue du Maine, 75014 Paris','0164832947');
INSERT INTO DOCGIA VALUES (6,'Martin','Laure','51 boulevard Diderot, 75012 Paris','0174693277');
INSERT INTO DOCGIA VALUES (7,'Crozier','Martine','88 rue des Portes Blanches, 75018 Paris','0146829384');
INSERT INTO DOCGIA VALUES (8,'Lebon','Cl nt','196 boulevard de Sebastopol, 75001 Paris','0132884739');
INSERT INTO DOCGIA VALUES (9,'Dufour','Jacques','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (10,'Dufour','Antoine','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (11,'Dufour','St anie','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (12,'Raymond','Carole','35 rue Oberkampf, 75011 Paris','0153829402');
INSERT INTO DOCGIA VALUES (13,'Durand','Albert','4 rue Mandar, 75002 Paris','0642374021');
INSERT INTO DOCGIA VALUES (14,'Wilson','Paul','12 rue Paul Vaillant Couturier, 92400 Montrouge','0642327407');
INSERT INTO DOCGIA VALUES (15,'Grecault','Philippe','15 rue de la Roquette, 75012 Paris','0132762983');
INSERT INTO DOCGIA VALUES (16,'Carre','St ane','51 boulevard Diderot, 75012 Paris','0174693277');
INSERT INTO DOCGIA VALUES (17,'Johnson','Astrid','3 rue L  Blum, 75002 Paris','0143762947');
INSERT INTO DOCGIA VALUES (18,'Mirou','Caroline','2 square Mirabeau, 75011 Paris','0163827399');
INSERT INTO DOCGIA VALUES (19,'Espelette','Jean-Jacques','141 avenue de France, 75019 Paris','0134887264');
INSERT INTO DOCGIA VALUES (20,'Despentes','Anthony','56 boulevard de la Villette, 75019 Paris','0133889463');
INSERT INTO DOCGIA VALUES (21,'Terlu','V nique','45 rue des Batignolles, 75020 Paris','0165998372');
INSERT INTO DOCGIA VALUES (22,'Rihour','C le','7 rue Montorgueil, 75002 Paris','0166894754');
INSERT INTO DOCGIA VALUES (23,'Franchet','Pierre','160 rue Montmartre, 75009 Paris','0633628549');
INSERT INTO DOCGIA VALUES (24,'Trochet','Ernest','34 rue de l''Esperance, 75008 Paris','0638295563');
INSERT INTO DOCGIA VALUES (25,'Gainard','Simon','55 rue Desnouettes, 75015 Paris','0174928934');
INSERT INTO DOCGIA VALUES (26,'Touche','Johanna','14 rue du Bac, 75006 Paris','0619384065');
INSERT INTO DOCGIA VALUES (27,'Cornu','Sylvain','22 rue Mouffetard, 75005 Paris','0184927489');
INSERT INTO DOCGIA VALUES (28,'Frederic','Cyril','15 rue du Simplon, 75018 Paris','0173625492');
INSERT INTO DOCGIA VALUES (29,'Crestard','Cedric','5 rue Doudeauville, 75018 Paris','0629485700');
INSERT INTO DOCGIA VALUES (30,'Le Bihan','Karine','170 bis rue Ordener, 75018 Paris','0638995221');


INSERT INTO SACH VALUES (1,'GF',1);
INSERT INTO SACH VALUES (2,'FOLIO',2);
INSERT INTO SACH VALUES (3,'HACHETTE',3);
INSERT INTO SACH VALUES (4,'GF',4);
INSERT INTO SACH VALUES (5,'FOLIO',5);
INSERT INTO SACH VALUES (6,'FOLIO',6);
INSERT INTO SACH VALUES (7,'GF',7);
INSERT INTO SACH VALUES (8,'FOLIO',8);
INSERT INTO SACH VALUES (9,'HACHETTE',9);
INSERT INTO SACH VALUES (10,'GF',10);
INSERT INTO SACH VALUES (11,'HACHETTE',11);
INSERT INTO SACH VALUES (12,'FOLIO',12);
INSERT INTO SACH VALUES (13,'GF',13);
INSERT INTO SACH VALUES (14,'FOLIO',14);
INSERT INTO SACH VALUES (15,'HACHETTE',15);
INSERT INTO SACH VALUES (16,'HACHETTE',16);
INSERT INTO SACH VALUES (17,'GF',1);
INSERT INTO SACH VALUES (18,'FOLIO',2);
INSERT INTO SACH VALUES (19,'HACHETTE',2);
INSERT INTO SACH VALUES (20,'FOLIO',4);
INSERT INTO SACH VALUES (21,'GF',5);
INSERT INTO SACH VALUES (22,'HACHETTE',4);
INSERT INTO SACH VALUES (23,'HACHETTE',7);
INSERT INTO SACH VALUES (24,'FOLIO',8);
INSERT INTO SACH VALUES (25,'GF',1);
INSERT INTO SACH VALUES (26,'HACHETTE',10);
INSERT INTO SACH VALUES (27,'FOLIO',11);
INSERT INTO SACH VALUES (28,'FOLIO',12);
INSERT INTO SACH VALUES (29,'GF',1);
INSERT INTO SACH VALUES (30,'HACHETTE',14);

INSERT INTO MUON VALUES (1,'9-2-2007','9-16-2007','9-7-2007',1);
INSERT INTO MUON VALUES (1,'10-1-2006','10-15-2006','10-11-2006',26);
INSERT INTO MUON VALUES (1,'6-14-2007','6-28-2007','6-19-2007',2);

INSERT INTO MUON VALUES (1,'4-27-2007','5-11-2007','5-8-2007',3);
INSERT INTO MUON VALUES (2,'8-23-2007','9-6-2007','9-2-2007',4);
INSERT INTO MUON VALUES (2,'10-6-2007','10-20-2007', NULL,28);

INSERT INTO MUON VALUES (9,'10-6-2007','10-20-2007', NULL,28);
INSERT INTO MUON VALUES (3,'9-9-2007','9-23-2007','9-13-2007',3);
INSERT INTO MUON VALUES (4,'2-8-2007','2-22-2007','2-12-2007',12);
INSERT INTO MUON VALUES (4,'2-7-2006','2-21-2006','2-20-2006',4);

INSERT INTO MUON VALUES (4,'6-17-2007','7-1-2007','6-27-2007',5);
INSERT INTO MUON VALUES (5,'10-4-2007','10-19-2007', NULL,16);
INSERT INTO MUON VALUES (6,'3-11-2007','3-25-2007','3-16-2007',3);

INSERT INTO MUON VALUES (8,'7-14-2007','7-28-2007','7-20-2007',18);
INSERT INTO MUON VALUES (8,'3-9-2007','3-23-2007','3-27-2007',13);

INSERT INTO MUON VALUES (10,'4-11-2007','4-25-2007','4-23-2007',8);
INSERT INTO MUON VALUES (10,'1-27-2006','2-10-2006','1-31-2006',7);
INSERT INTO MUON VALUES (11,'10-1-2007','10-15-2007', NULL,22);

INSERT INTO MUON VALUES (12,'3-3-2003','3-17-2003','3-13-2003',7);
INSERT INTO MUON VALUES (14,'10-2-2007','10-16-2007', NULL,1);
INSERT INTO MUON VALUES (15,'5-4-2007','5-18-2007','5-12-2007',10);

INSERT INTO MUON VALUES (16,'10-5-2007','10-19-2007', NULL,2);
INSERT INTO MUON VALUES (18,'7-4-2007','7-18-2007','7-11-2007',3);
INSERT INTO MUON VALUES (20,'12-17-2006','12-31-2006','12-17-2006',27);

INSERT INTO MUON VALUES (20,'9-6-2007','9-20-2007','9-22-2007',9);
INSERT INTO MUON VALUES (21,'9-7-2007','9-21-2007','9-19-2007',14);
INSERT INTO MUON VALUES (24,'2-14-2007','2-28-2007','2-20-2007',26);
INSERT INTO MUON VALUES (25,'8-19-2006','9-2-2006','9-3-2006',1);
INSERT INTO MUON VALUES (26,'11-15-2006','11-29-2006','11-22-2006',9);
INSERT INTO MUON VALUES (29,'9-20-2007','10-4-2007', NULL,27);

--Cau 2: Vẽ sơ đồ liên thông


--Cau 3: Các tác phẩm (NT, tựa) của tác giả 'Guy de Maupassant'

select nt,tua
from tacpham
where tacgia='Guy de Maupassant';

--Cau 4: Các độc giả sống ở địa chỉ '32 rue des Alouettes, 75003 Paris'

select ho,ten
from docgia
where dchi='32 rue des Alouettes, 75003 Paris';

--Cau 5: Tìm tên nhà xuất bản các tác phẩm bao gồm từ 'Fleur'

select s.nxb
from sach s join tacpham tp on s.nt=tp.nt
where tp.tua like '%Fleur%';

--Cau 6: Tìm tên các tác phẩm bắt đầu bằng 'Le'

select *
from tacpham
where tua like 'Le%';

--Cau 7: Tìm tên các độc giả có mượn sách trong trong khoảng thời gian từ ngày 15/9/2007 đến 20/09/2007

select dg.ho,dg.ten
from docgia dg join muon m on m.nd=dg.nd
where m.ngaymuon between to_date('9/15/2007','MM-DD-YYYY') and to_date('9/20/2007','MM-DD-YYYY');

--Cau 8: Nhà xuất bản của tác phẩm tiêu đề 'Germinal'

select s.nxb
from sach s join tacpham tp on s.nt=tp.nt
where tp.tua like '%Germinal%';

--Cau 9: Tên độc giả đã mượn tác phẩm 'Poésie'

select dg.ho,dg.ten
from docgia dg, muon m, tacpham tp, sach s
where dg.nd=m.nd
and s.ns=m.ns
and tp.nt=s.nt
and tp.tua like '%Po�e%';

--Cau 10:  Những độc giả nào đã mượn tác phẩm Les 'Fleurs du mal'

select dg.ho,dg.ten
from docgia dg, muon m, tacpham tp, sach s
where dg.nd=m.nd
and s.ns=m.ns
and tp.nt=s.nt
and tp.tua like '%Fleurs du mal%';

--Cau 11: Tìm các tựa sách, tên độc giả của các độc giả trả sách quá thời hạn cho phép

select tp.tua,dg.ten
from docgia dg join muon m on dg.nd=m.nd join sach s on s.ns=m.ns join tacpham tp on tp.nt=s.nt
where m.ngaytra>m.hantra;

--Cau 12: Tìm các tựa sách, tên độc giả của các độc giả trả sách trước thời hạn

select tp.tua,dg.ten
from docgia dg join muon m on dg.nd=m.nd join sach s on s.ns=m.ns join tacpham tp on tp.nt=s.nt
where m.ngaytra<=m.hantra;

--Cau 13: Tên độc giả đã mượn tác phẩm của 'Victor Hugo'

select tp.tua,dg.ten
from docgia dg join muon m on dg.nd=m.nd join sach s on s.ns=m.ns join tacpham tp on tp.nt=s.nt
where tp.tacgia='Victor Hugo';

--Cau 14: Tên độc giả và các tác phẩm đã được mượn năm 2007

select dg.ten
from docgia dg join muon m on m.nd=dg.nd
where extract(year from m.ngaymuon)='2007';

--Cau 15: Tính số tác phẩm có trong thư viện

select count(*) as "So tac pham"
from tacpham;

--Cau 16: Tựa của tác phẩm mà có ít nhất hai quyển sách

select tp.tua
from tacpham tp join sach s on tp.nt=s.nt
group by tp.tua
having count(s.ns)>=2;

--Cau 17: Tính Số tác phẩm của mỗi tác giả

select tacgia,count(nt) as "So tac pham" 
from tacpham
group by tacgia;

--Cau 18: Tính Số sách của mỗi tác phẩm

select tp.tua, count(s.ns) as "So sach"
from sach s join tacpham tp on tp.nt = s.nt
group by tp.tua;

--Cau 19: Tìm số lần mượn sách của mỗi độc giả theo năm

select dg.nd as "Ma doc gia", extract(year from m.ngaymuon) as "Nam", count(*) as "So lan Muon"
from docgia dg join muon m on dg.nd=m.nd
group by extract(year from m.ngaymuon),dg.nd;

-- Cau 20: Tìm tên tác phẩm có ít nhất 3 sách

select tp.tua as "Tac Pham co it nhat 3 sach"
from tacpham tp join sach s on tp.nt=s.nt
group by tp.tua
having count(s.ns)>=3;

--Cau 21: Tìm tên tác phẩm có nhiều sách nhất

select tp.tua as "Tac Pham co nhieu sach nhat"
from tacpham tp join sach s on tp.nt=s.nt
group by tp.tua
having count(s.ns)=(select max(count(s.ns)) as "Tac Pham co nhieu sach nhat" 
from tacpham tp join sach s on tp.nt=s.nt 
group by tp.tua);

--Cau 22: Tên nhà xuất bản xuất bản nhiều sách nhất

select nxb as "NXB xuat ban nhieu sach nhat"
from sach
group by nxb
having count(ns)=(select max(count(ns))
from sach
group by nxb);

--Cau 23: Tính Số tác giả có ít nhất hai tác phẩm

select count(tacgia) as "So tac gia co it nhat 2 tac pham"
from (select tacgia
from tacpham
group by tacgia
having count(nt)>=2);

--Cau 24: Tìm tựa tác phẩm có nhiều người mượn nhất

select tp.tua as "Tac pham co nhieu nguoi muon nhat"
from tacpham tp join sach s on tp.nt=s.nt join muon m on s.ns=m.ns join docgia dg on dg.nd=m.nd
group by tp.tua
having count(m.ns)=(select max(count(m.ns))
from tacpham tp join sach s on tp.nt=s.nt join muon m on s.ns=m.ns join docgia dg on dg.nd=m.nd
group by tp.tua);

--Cau 25: Tìm tựa tác phẩm có ít người mượn nhất

select tp.tua as "Tac pham co it nguoi muon nhat"
from tacpham tp join sach s on tp.nt=s.nt join muon m on s.ns=m.ns join docgia dg on dg.nd=m.nd
group by tp.tua
having count(m.ns)=(select min(count(m.ns))
from tacpham tp join sach s on tp.nt=s.nt join muon m on s.ns=m.ns join docgia dg on dg.nd=m.nd
group by tp.tua);

--Cau 26: Tìm độc giả mượn nhiều tác phẩm nhất

select ho,ten
from docgia natural join 
(SELECT ND
FROM MUON
GROUP BY ND
HAVING COUNT(*) = (
SELECT max(COUNT(*))
FROM MUON
GROUP BY ND));

--Cau 27: Tìm tên độc giả mượn ít tác phẩm nhất

select ho,ten
from docgia natural join 
(SELECT ND
FROM MUON
GROUP BY ND
HAVING COUNT(*) = (
SELECT min(COUNT(*))
FROM MUON
GROUP BY ND));

--Cau 28: Tìm tên tác phẩm có ít nhất một quyển sách không ai mượn

select distinct tp.tua as "Ten tac pham co it nhat mot quyen sach khong ai muon"
from tacpham tp join sach s on tp.nt=s.nt left join muon m on s.ns=m.ns
where m.ns is null;

-- Cau 29: Tìm tên tác phẩm có tất cả các quyển sách đều được mượn

select distinct tp.tua as "Ten tac pham co tat ca cac quyen sach deu duoc muon"
from tacpham tp join sach s on tp.nt=s.nt left join muon m on s.ns=m.ns
where m.ns is not null;

--Cau 30: Tìm họ tên độc giả chưa mượn quyển sách nào

select dg.ho,dg.ten
from docgia dg left join muon m on dg.nd=m.nd
where m.ns is null;

--Cau 31: Tìm thông tin về nhà suất bản của quyển sách mà chưa được ai mượn

select s.nxb as "Nha xuat ban cua quyen sach ma chua duoc ai muon"
from sach s left join muon m on s.ns=m.ns
where m.ns is null;