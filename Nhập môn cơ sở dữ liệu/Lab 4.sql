--Buoi 4
CREATE TABLE  CGTRINH (
	STT_CTR int NOT NULL ,
	TEN_CTR varchar (20)  NULL ,
	DIACHI_CTR varchar (20)  NULL ,
	TINH_THANH varchar (15)  NULL ,
	KINH_PHI int NULL ,
	TEN_CHU varchar (20)  NULL ,
	TEN_THAU varchar (20)  NULL ,
	NGAY_BD date NULL 
) ;


CREATE TABLE  CHUNHAN (
	TEN_CHU varchar (20)  NOT NULL ,
	DCHI_CHU varchar (20)  NULL 
) ;


CREATE TABLE  CHUTHAU (
	TEN_THAU varchar (20)  NOT NULL ,
	TEL char (7)  NULL ,
	DCHI_THAU varchar (20)  NULL 
) ;


CREATE TABLE  CONGNHAN (
	HOTEN_CN varchar (20)  NOT NULL ,
	NAMS_CN int NULL ,
	NAM_VAO_N int NULL ,
	CH_MON varchar (10)  NULL 
) ;


CREATE TABLE  KTRUCSU (
	HOTEN_KTS varchar (20)  NOT NULL ,
	NAMS_KTS int NULL ,
	PHAI char (2)  NULL ,
	NOI_TN varchar (15)  NULL ,
	DCHI_LL_KTS varchar (30)  NULL 
) ;


CREATE TABLE  THAMGIA (
	HOTEN_CN varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	NGAY_TGIA date NULL ,
	SO_NGAY int NULL 
) ;


CREATE TABLE  THIETKE (
	HOTEN_KTS varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	THU_LAO int NULL 
) ;

ALTER TABLE  CGTRINH ADD 
	CONSTRAINT PK_CGTRINH PRIMARY KEY  	(STT_CTR	)  ; 


ALTER TABLE  CHUNHAN ADD 
	CONSTRAINT PK_CHUNHAN PRIMARY KEY  (	TEN_CHU	)  ; 


ALTER TABLE  CHUTHAU ADD 
	CONSTRAINT PK_CHUTHAU PRIMARY KEY  (	TEN_THAU	)  ; 


ALTER TABLE  CONGNHAN ADD 
	CONSTRAINT PK_CONGNHAN PRIMARY KEY  (	HOTEN_CN	)  ; 


ALTER TABLE  KTRUCSU ADD 
	CONSTRAINT PK_KTRUCSU PRIMARY KEY  	(	HOTEN_KTS	)  ; 


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT PK_THAMGIA PRIMARY KEY  	(	HOTEN_CN,	STT_CTR	)  ; 


ALTER TABLE  THIETKE ADD 
	CONSTRAINT PK_THIETKE PRIMARY KEY  	(	HOTEN_KTS,	STT_CTR	)  ; 


ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUNHAN FOREIGN KEY 	(	TEN_CHU	) REFERENCES  CHUNHAN (	TEN_CHU	);

ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUTHAU FOREIGN KEY 
	(	TEN_THAU	) REFERENCES  CHUTHAU (	TEN_THAU	);


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CGTRINH FOREIGN KEY 
	(		STT_CTR	) REFERENCES  CGTRINH (		STT_CTR	);

ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CONGNHAN FOREIGN KEY 
	(		HOTEN_CN	) REFERENCES  CONGNHAN (		HOTEN_CN	);


ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_CGTRINH FOREIGN KEY 	(STT_CTR) REFERENCES  CGTRINH (	STT_CTR	);

ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_KTRUCSU FOREIGN KEY 
	(	HOTEN_KTS	) REFERENCES  KTRUCSU (	HOTEN_KTS );

alter session set nls_date_format='MON-DD-YYYY';

insert into  chunhan values ('so t mai du lich','54 xo viet nghe tinh');
insert into  chunhan values ('so van hoa thong tin','101 hai ba trung');
insert into  chunhan values ('so giao duc','29 duong 3/2');
insert into  chunhan values ('dai hoc can tho','56 duong 30/4');
insert into  chunhan values ('cty bitis','29 phan dinh phung');
insert into  chunhan values ('nguyen thanh ha','45 de tham');
insert into  chunhan values ('phan thanh liem','48/6 huynh thuc khan');


insert into  chuthau values ('cty xd so 6','567456','5 phan chu trinh');
insert into  chuthau values ('phong dich vu so xd','206481','2 le van sy');
insert into  chuthau values ('le van son','028374','12 tran nhan ton');
insert into  chuthau values ('tran khai hoan','658432','20 nguyen thai hoc');

insert into  congnhan values ('nguyen thi suu',   45 ,    60  ,'ho');
insert into  congnhan values ('vi chi a',   66  ,    87  ,'han');
insert into  congnhan values ('le manh quoc',   56  ,    71 ,'moc');
insert into  congnhan values ('vo van chin',   40 ,    52  ,'son');
insert into  congnhan values ('le quyet thang',   54  ,    74 ,'son');
insert into  congnhan values ('nguyen hong van',   50  ,    70   ,'dien');
insert into  congnhan values ('dang van son',   48,    65 ,'dien');


insert into  ktrucsu values ('le thanh tung',   1956          ,'1','tp hcm','25 duong 3/2 tp bien hoa');
insert into  ktrucsu values ('le kim dung',   1952          ,'0','ha noi','18/5 phan van tri tp can tho');
insert into  ktrucsu values ('nguyen anh thu',   1970          ,'0','new york usa','khu i dhct tp can tho');
insert into  ktrucsu values ('nguyen song do quyen',   1970          ,'0','tp hcm','73 tran hung dao tp hcm');
insert into  ktrucsu values ('truong minh thai',   1950          ,'1','paris france','12/2/5 tran phu tp hanoi');

insert into  cgtrinh values 
( 1       ,'khach san quoc te','5 nguyen an ninh','can tho',450 ,'so t mai du lich','cty xd so 6','dec-13-1994'); 
insert into  cgtrinh values 
( 2       ,'cong vien thieu nhi','100 nguyen thai hoc','can tho',   200         ,'so van hoa thong tin','cty xd so 6','may-08-1994'); 
insert into  cgtrinh values 
( 3       ,'hoi cho nong nghiep','bai cat','vinh long',   1000        ,'so t mai du lich','phong dich vu so xd','jun-10-1994'); 
insert into  cgtrinh values 
( 4       ,'truong mg mang non','48 cm thang 8','can tho',   30          ,'so giao duc','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 5       ,'khoa trong trot dhct','khu ii dhct','can tho',   3000        ,'dai hoc can tho','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 6       ,'van phong bitis','25 phan dinh phung','ha noi',   40          ,'cty bitis','le van son','oct-05-1994'); 
insert into  cgtrinh values 
( 7       ,'nha rieng 1','124/5 nguyen trai','tp hcm',   65          ,'nguyen thanh ha','phong dich vu so xd','nov-15-1994'); 
insert into  cgtrinh values 
( 8       ,'nha rieng 2','76 chau van liem','ha noi',   100         ,'phan thanh liem','tran khai hoan','sep-06-1994'); 

insert into  thamgia values ('nguyen thi suu',   2       ,'may-08-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   4       ,'sep-07-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   1       ,'dec-15-1994',   5           );
insert into  thamgia values ('le manh quoc',   1       ,'dec-18-1994',   6           );
insert into  thamgia values ('vo van chin',   2       ,'may-10-1994',   10          );
insert into  thamgia values ('le quyet thang',   2       ,'may-12-1994',   5           );
insert into  thamgia values ('nguyen hong van',   1       ,'dec-16-1994',   7           );
insert into  thamgia values ('nguyen hong van',   4       ,'sep-14-1994',   7           );
insert into  thamgia values ('dang van son',   3       ,'jun-10-1994',   18          );
insert into  thamgia values ('vo van chin',   3       ,'jun-10-1994',   10          );



insert into  thietke values ('le thanh tung',   1       ,    25          );
insert into  thietke values ('le kim dung',   5       ,    30          );
insert into  thietke values ('truong minh thai',   8       ,    18          );
insert into  thietke values ('le kim dung',   6       ,    40          );
insert into  thietke values ('nguyen anh thu',   3       ,    12          );
insert into  thietke values ('le thanh tung',   7       ,    10          );
insert into  thietke values ('nguyen song do quyen',   2       ,    6           );
insert into  thietke values ('truong minh thai',   6       ,    27          );
insert into  thietke values ('le kim dung',   4       ,    20          );
insert into  thietke values ('truong minh thai',   1       ,    12          );

--Cau 1: Tìm sự thông thương giữa các bảng trong CSDL

--Cau2: Mở các bảng dữ liệu để xem kiểu dữ liệu của từng trường và quan sát dữ liệu của từng bảng
select* from cgtrinh;
select* from chunhan;
select* from chuthau;
select* from congnhan;
select* from ktrucsu;
select* from thamgia;
select* from thietke;

--Cau 3: Hãy cho biết thông tin về các kiến trúc sư có họ là Lê và sinh năm 1956
select *
from ktrucsu
where hoten_kts like 'le%'
and nams_kts='1956';

--Cau 4: Hãy cho biết tên các công trình bắt đầu trong khoảng 1/9/1994 đến 20/10/1994
select ten_ctr
from cgtrinh
where ngay_bd between to_date('1-9-1994','dd-mm-yyyy') and to_date('20-10-1994','dd-mm-yyyy');

--Cau 5: Hãy cho biết tên và địa chỉ các công trình do chủ thầu ‘công ty xây dựng số 6’ thi công (chú ý: xem dữ liệu để lấy đúng tên công ty xây dựng số 6)
select ten_ctr,diachi_ctr
from cgtrinh
where ten_thau='cty xd so 6';
--Cau 6: Tìm tên và địa chỉ liên lạc của các chủ thầu thi công công trình ở Cần Thơ do kiến trúc sư Lê Kim Dung thiết kế
select distinct ct.*
from cgtrinh ctr join thietke tk on ctr.stt_ctr=tk.stt_ctr join chuthau ct on ct.ten_thau=ctr.ten_thau
where tk.hoten_kts='le kim dung'
and ctr.tinh_thanh='can tho';

--Cau 7: Hãy cho biết nơi tốt nghiệp của các kiến trúc sư đã thiết kế công trình Khách sạn quốc tế ở Cần Thơ
select kts.noi_tn
from ktrucsu kts join thietke tk on kts.hoten_kts=tk.hoten_kts join cgtrinh ctr on ctr.stt_ctr=tk.stt_ctr
where ctr.ten_ctr='khach san quoc te';

--Cau 8: Cho biết họ tên, năm sinh và năm vào nghề của các công nhân có chuyên môn hàn hoặc điện đã tham gia các công trình mà chủ thầu Lê Văn Sơn đã trúng thầu
select cn.hoten_cn,cn.nams_cn,cn.nam_vao_n
from congnhan cn join thamgia tg on cn.hoten_cn=tg.hoten_cn join cgtrinh ctr on tg.stt_ctr=ctr.stt_ctr
where ch_mon='han'
or ch_mon='dien'
and ctr.ten_thau='le van son';

--Cau 9: Những công nhân nào đã bắt đầu tham gia công trình Khách sạn Quốc tế ở Cần Thơ trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994
select cn.hoten_cn
from congnhan cn join thamgia tg on cn.hoten_cn=tg.hoten_cn join cgtrinh ctr on tg.stt_ctr=ctr.stt_ctr
where ctr.ten_ctr='khach san quoc te'
and ctr.tinh_thanh='can tho'
and tg.ngay_tgia between to_date('15-12-1994','dd-mm-yyyy') and to_date('31-12-1994','dd-mm-yyyy');

--Cau 10: Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP HCM và đã thiết kế ít nhất một công trình có kinh phí đầu tư trên 400 triệu đồng
select kts.hoten_kts,kts.nams_kts
from ktrucsu kts join thietke tk on kts.hoten_kts=tk.hoten_kts join cgtrinh ctr on tk.stt_ctr=ctr.stt_ctr
where kts.noi_tn='tp hcm'
and ctr.kinh_phi>='400';

--Cau 11: Tìm họ tên và chuyên môn của các công nhân tham gia các công trình do kiến trúc sư Lê Thanh Tùng thiết kế
select cn.hoten_cn,cn.ch_mon
from thietke tk join thamgia tg on tk.stt_ctr=tg.stt_ctr join congnhan cn on cn.hoten_cn=tg.hoten_cn
where tk.hoten_kts='le thanh tung';

--Cau 12: Cho biết tên công trình có kinh phí cao nhất
select max(kinh_phi) as "Kinh phi cao nhat"
from cgtrinh;

--Cau 13: Cho biết họ tên kiến trúc sư trẻ tuổi nhất
select hoten_kts
from ktrucsu
where nams_kts=(select min(nams_kts) from ktrucsu);

--Cau 14: Tìm tổng kinh phí của các công trình theo từng chủ thầu
select sum(kinh_phi) as "Tong kinh phi"
from cgtrinh
group by ten_chu;

--Cau 15: Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất
select ct.ten_thau,ct.dchi_thau
from chuthau ct join cgtrinh ctr on ct.ten_thau=ctr.ten_thau
where ctr.kinh_phi=(select min(ctr.kinh_phi)
from chuthau ct join cgtrinh ctr on ct.ten_thau=ctr.ten_thau);

--Cau 16: Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
select hoten_kts
from thietke
group by hoten_kts
having sum(thu_lao)>'25';

--Cau 17:  Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
select count(*) as "So luong kien truc su"
from (select hoten_kts
from thietke
group by hoten_kts
having sum(thu_lao)>'25');

--Cau 18: Tính số công trình mà mỗi kiến trúc sư đã thiết kế
select hoten_kts,count(stt_ctr) as "Tong so cong trinh da thiet ke"
from thietke
group by hoten_kts;

--Cau 19: Tính tổng số công nhân đã tham gia mỗi công trình
select count(hoten_cn) as "So cong nhan"
from thamgia
group by stt_ctr;

--Cau 20: Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất
select ctr.ten_ctr,ctr.diachi_ctr
from thamgia tg join cgtrinh ctr on tg.stt_ctr=ctr.stt_ctr
group by ctr.ten_ctr,ctr.diachi_ctr
having count(tg.hoten_cn)=(select max(count(tg.hoten_cn))
from thamgia tg join cgtrinh ctr on tg.stt_ctr=ctr.stt_ctr
group by ctr.ten_ctr,ctr.diachi_ctr);

--Cau 21: Cho biết tên các thành phố và kinh phí trung bình của các công trình của từng thành phố tương ứng
select tinh_thanh, avg(kinh_phi) as "Kinh phi trung binh"
from cgtrinh
group by tinh_thanh;

--Cau 22: Cho biết tên và địa chỉ của các công trình mà công nhân Nguyễn Hồng Vân đang tham gia vào ngày 18/12/1994
select ctr.ten_ctr, ctr.diachi_ctr
from cgtrinh ctr join thamgia tg on ctr.stt_ctr=tg.stt_ctr
where tg.hoten_cn='nguyen hong van'
and to_date('18/12/1994','dd/mm/yyyy') between tg.ngay_tgia and tg.ngay_tgia+tg.so_ngay;

--Cau 23: Cho biết họ tên kiến trúc sư vừa thiết kế các công trình do Phòng dịch vụ Sở Xây dựng thi công, vừa thiết kế các công trình do chủ thầu Công ty xd số 6 thi công
select tk.hoten_kts
from cgtrinh ctr join thietke tk on ctr.stt_ctr=tk.stt_ctr
where ten_thau='phong dich vu so xd'
intersect
select tk.hoten_kts
from cgtrinh ctr join thietke tk on ctr.stt_ctr=tk.stt_ctr
where ctr.ten_thau='cty xd so 6'
;

--Cau 24: Cho biết họ tên các công nhân có tham gia các công trình ở Cần Thơ nhưng không tham gia công trình ở Vĩnh Long
select tg.hoten_cn
from cgtrinh ctr join thamgia tg on ctr.stt_ctr=tg.stt_ctr
where ctr.tinh_thanh='can tho'
minus
select tg.hoten_cn
from cgtrinh ctr join thamgia tg on ctr.stt_ctr=tg.stt_ctr
where ctr.tinh_thanh='vinh long';

--Cau 25: Cho biết tên của các chủ thầu đã thi công các công trình có kinh phí lớn hơn tất cả các công trình do chủ thầu Phòng dịch vụ sở xây dựng thi công
select ten_thau
from cgtrinh
where kinh_phi>all(select kinh_phi from cgtrinh where ten_thau='phong dich vu so xd');

--Cau 26: Cho biết họ tên các kiến trúc sư có thù lao thiết kế cho một công trình nào đó dưới giá trị trung bình thù lao thiết kế của các KTS.
select tk.hoten_kts
from cgtrinh ctr join thietke tk on ctr.stt_ctr=tk.stt_ctr
where tk.thu_lao<(
    select avg(thu_lao)
    from thietke
);

--Cau 27: Cho biết họ tên các công nhân có tổng số ngày tham gia vào các công trình lớn hơn tổng số ngày tham gia của công nhân Nguyễn Hồng Vân
select tg.hoten_cn
from thamgia tg join cgtrinh ctr on tg.stt_ctr=ctr.stt_ctr
group by tg.hoten_cn
having sum(tg.so_ngay)>(
    select sum(tg.so_ngay)
    from thamgia tg join cgtrinh ctr on tg.stt_ctr=ctr.stt_ctr
    group by tg.hoten_cn
    having tg.hoten_cn='nguyen hong van'
);

--Cau 28: Cho biết họ tên công nhân có tham gia tất cả các công trình
select tg.hoten_cn
from thamgia tg join cgtrinh ctr on tg.stt_ctr=ctr.stt_ctr
group by tg.hoten_cn
having count(tg.stt_ctr)=(
    select count(*)
    from cgtrinh
);

--Cau 29: Tìm các cặp tên của chủ thầu có trúng thầu các công trình tại cùng một thành phố
select distinct A.ten_thau as "Chu thau 1", B.ten_thau as "Chu thau 2", A.tinh_thanh
from cgtrinh A, cgtrinh B
where A.ten_thau < B.ten_thau
and A.tinh_thanh = B.tinh_thanh;

--Cau 30: Tìm các cặp tên của các công nhân có làm việc chung với nhau trong ít nhất là hai công trình
select A.hoten_cn as "Cong nhan 1",B.hoten_cn as "Cong nhan 2"
from thamgia A, thamgia B, Cgtrinh ctr
where A.stt_ctr=ctr.stt_ctr and B.stt_ctr=ctr.stt_ctr
and A.hoten_cn<B.hoten_cn
group by A.hoten_cn,B.hoten_cn
having count(ctr.stt_ctr)>=2;