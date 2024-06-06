--Buổi 6

create table NGUOI_AN(ten VARCHAR(30) NOT NULL , tuoi int, phai VARCHAR(6));
create table LUI_TOI(ten VARCHAR(30)NOT NULL, quanPizza VARCHAR(30) NOT NULL);
create table AN(ten VARCHAR(30)NOT NULL, pizza VARCHAR(30) NOT NULL);
create table PHUC_VU(quanPizza VARCHAR(30)NOT NULL, pizza VARCHAR(30)NOT NULL, gia numeric (6,3));


insert into NGUOI_AN values('Amy', 16, 'female');
insert into NGUOI_AN values('Ben', 21, 'male');
insert into NGUOI_AN values('Cal', 33, 'male');
insert into NGUOI_AN values('Dan', 13, 'male');
insert into NGUOI_AN values('Eli', 45, 'male');
insert into NGUOI_AN values('Fay', 21, 'female');
insert into NGUOI_AN values('Gus', 24, 'male');
insert into NGUOI_AN values('Hil', 30, 'female');
insert into NGUOI_AN values('Ian', 18, 'male');

insert into LUI_TOI values('Amy', 'Pizza Hut');
insert into LUI_TOI values('Ben', 'Pizza Hut');
insert into LUI_TOI values('Ben', 'Chicago Pizza');
insert into LUI_TOI values('Cal', 'Straw Hat');
insert into LUI_TOI values('Cal', 'New York Pizza');
insert into LUI_TOI values('Dan', 'Straw Hat');
insert into LUI_TOI values('Dan', 'New York Pizza');
insert into LUI_TOI values('Eli', 'Straw Hat');
insert into LUI_TOI values('Eli', 'Chicago Pizza');
insert into LUI_TOI values('Fay', 'Dominos');
insert into LUI_TOI values('Fay', 'Little Caesars');
insert into LUI_TOI values('Gus', 'Chicago Pizza');
insert into LUI_TOI values('Gus', 'Pizza Hut');
insert into LUI_TOI values('Hil', 'Dominos');
insert into LUI_TOI values('Hil', 'Straw Hat');
insert into LUI_TOI values('Hil', 'Pizza Hut');
insert into LUI_TOI values('Ian', 'New York Pizza');
insert into LUI_TOI values('Ian', 'Straw Hat');
insert into LUI_TOI values('Ian', 'Dominos');

insert into AN values('Amy', 'pepperoni');
insert into AN values('Amy', 'mushroom');
insert into AN values('Ben', 'pepperoni');
insert into AN values('Ben', 'cheese');
insert into AN values('Cal', 'supreme');
insert into AN values('Dan', 'pepperoni');
insert into AN values('Dan', 'cheese');
insert into AN values('Dan', 'sausage');
insert into AN values('Dan', 'supreme');
insert into AN values('Dan', 'mushroom');
insert into AN values('Eli', 'supreme');
insert into AN values('Eli', 'cheese');
insert into AN values('Fay', 'mushroom');
insert into AN values('Gus', 'mushroom');
insert into AN values('Gus', 'supreme');
insert into AN values('Gus', 'cheese');
insert into AN values('Hil', 'supreme');
insert into AN values('Hil', 'cheese');
insert into AN values('Ian', 'supreme');
insert into AN values('Ian', 'pepperoni');

insert into PHUC_VU values('Pizza Hut', 'pepperoni', 12);
insert into PHUC_VU values('Pizza Hut', 'sausage', 12);
insert into PHUC_VU values('Pizza Hut', 'cheese', 9);
insert into PHUC_VU values('Pizza Hut', 'supreme', 12);
insert into PHUC_VU values('Little Caesars', 'pepperoni', 9.75);
insert into PHUC_VU values('Little Caesars', 'sausage', 9.5);
insert into PHUC_VU values('Little Caesars', 'cheese', 7);
insert into PHUC_VU values('Little Caesars', 'mushroom', 9.25);
insert into PHUC_VU values('Little Caesars', 'supreme', 9);
insert into PHUC_VU values('Dominos', 'cheese', 9.75);
insert into PHUC_VU values('Dominos', 'mushroom', 11);
insert into PHUC_VU values('Straw Hat', 'pepperoni', 8);
insert into PHUC_VU values('Straw Hat', 'cheese', 9.25);
insert into PHUC_VU values('Straw Hat', 'sausage', 9.75);
insert into PHUC_VU values('New York Pizza', 'pepperoni', 8);
insert into PHUC_VU values('New York Pizza', 'cheese', 7);
insert into PHUC_VU values('New York Pizza', 'supreme', 8.5);
insert into PHUC_VU values('Chicago Pizza', 'cheese', 7.75);
insert into PHUC_VU values('Chicago Pizza', 'supreme', 8.5);

--Cau 1: Thêm khóa chính cho các bảng đã cho
--Đặt thuộc tính "ten" là khóa ngoài của bảng LUI_TOI và AN
--Thêm ràng buộc giá>0 cho cột "gia" của bảng PHUC_VU
alter table NGUOI_AN
add CONSTRAINT nguoi_an_pk primary key (ten);

alter table lui_toi
add CONSTRAINT lui_toi_pk primary key (ten,quanPizza);

alter table AN
add CONSTRAINT an_pk primary key (ten,Pizza);

alter table phuc_vu
add CONSTRAINT phuc_vu_pk primary key (quanpizza,pizza,gia);

alter table an
add CONSTRAINT an_fk FOREIGN key (ten) REFERENCES nguoi_an(ten);

alter table lui_toi
add CONSTRAINT lui_toi_fk FOREIGN key (ten) REFERENCES nguoi_an(ten);

alter table phuc_vu
add constraint gia check(gia>0);

--Cau 2: Cho biết quán ‘Pizza Hut’ đã phục vụ các bánh pizza nào?
select distinct a.pizza
from an a join lui_toi lt on lt.ten = a.ten
where lt.quanpizza='Pizza Hut';

--Cau 3: Danh sách các bánh pizza mà các quán có bán?
select distinct pizza
from phuc_vu;

--Cau 4: Cho biết tên các quán có phục vụ các bánh pizza mà tên gồm chữ ‘m’
select distinct quanpizza
from phuc_vu a join (select distinct pizza from phuc_vu where pizza like '%m%') b on a.pizza=b.pizza;

--Cau 5: Tìm tên và tuổi của người ăn đã đến quán ‘Dominos’, sắp xếp kết quả giảm dần theo tuổi?
select na.ten,na.tuoi
from nguoi_an na join lui_toi lt on na.ten = lt.ten
where lt.quanpizza='Dominos'
order BY na.tuoi DESC;

--Cau 6: Tìm tên quán pizza và số bánh pizza mà mỗi quán phục vụ?
select pv.quanpizza, count(*) as "So pizza da phuc vu"
from phuc_vu pv join lui_toi lt on pv.quanpizza = lt.quanpizza
group by pv.quanpizza;

--Cau 7: Tìm tên những quán pizza phục vụ pizza với giá cao nhất?
select distinct quanpizza
from phuc_vu
where gia=(select max(gia) from phuc_vu);

--Cau 8: Tìm tên các quán có phục vụ ít nhất một bánh pizza mà “Ian” thích ăn?
select distinct lt.quanpizza
from lui_toi lt join phuc_vu pv on pv.quanpizza = lt.quanpizza join nguoi_an na on na.ten = lt.ten join (select pizza from an where ten='Ian') a on a.pizza=pv.pizza;

--Cau 9: Tìm tên các quán có phục vụ ít nhất một bánh mà “Eli” không thích?
select distinct quanpizza
from phuc_vu
where quanpizza not in(
    select pv.quanpizza
    from phuc_vu pv join (
        select pv.quanpizza
        from lui_toi lt join phuc_vu pv on pv.quanpizza = lt.quanpizza join nguoi_an na on na.ten = lt.ten join (select pizza from an where ten='Eli') a on a.pizza=pv.pizza
        group by pv.quanpizza
        having count(distinct pv.pizza)=(select count(pizza) from an where ten='Eli' group by ten)) a on pv.quanpizza=a.quanpizza
    group by pv.quanpizza
    having count(distinct pv.pizza)=(select count(pizza) from an where ten='Eli' group by ten));

--Cau 10: Tìm tên các quán chỉ phục vụ các bánh mà “Eli” thích?
select pv.quanpizza
from phuc_vu pv join (
    select pv.quanpizza
    from lui_toi lt join phuc_vu pv on pv.quanpizza = lt.quanpizza join nguoi_an na on na.ten = lt.ten join (select pizza from an where ten='Eli') a on a.pizza=pv.pizza
    group by pv.quanpizza
    having count(distinct pv.pizza)=(select count(pizza) from an where ten='Eli' group by ten)) a on pv.quanpizza=a.quanpizza
group by pv.quanpizza
having count(distinct pv.pizza)=(select count(pizza) from an where ten='Eli' group by ten);

--Cau 11: Tên quán có phục vụ bánh với giá lớn hơn tất cả bánh phục vụ bởi quán ‘New York Pizza'
select distinct quanpizza
from phuc_vu
where gia>all( select gia from phuc_vu where quanpizza='New York Pizza');

--Cau 12: Tìm tên các quán chỉ phục vụ các bánh có giá nhỏ hơn 10?
select distinct quanpizza
from phuc_vu
where quanpizza not in (
    select quanpizza
    from phuc_vu
    where gia>=10);

--Cau 13: Tìm tên bánh được phục vụ bởi quán ‘New York Pizza’ và quán ‘Dominos’
select pizza
from phuc_vu
where quanpizza='New York Pizza'
intersect (
    select pizza
    from phuc_vu
    where quanpizza='Dominos');
    
--Cau 14: Tìm tên bánh được phục vụ bởi quán ‘Little Caesars’ và không phục vụ bởi quán 'Pizza Hut'
select pizza
from phuc_vu
where quanpizza='Little Caesars'
minus (
    select pizza
    from phuc_vu
    where quanpizza='Pizza Hut');
    
--Cau 15: Tìm tên các quán có phục vụ tất cả các loại bánh pizza?
select quanpizza
from phuc_vu
group by quanpizza
having count(pizza)=(select count(distinct pizza) from phuc_vu);

--Cau 16: Tên quán phục vụ ít nhất 2 bánh pizza mà ‘Gus’ thích?
select pv.quanpizza
from lui_toi lt join phuc_vu pv on pv.quanpizza = lt.quanpizza join nguoi_an na on na.ten = lt.ten join (select pizza from an where ten='Eli') a on a.pizza=pv.pizza
where na.ten='Gus'
group by pv.quanpizza
having count(pv.pizza)>=2;

--Cau 17: Tìm tên các quán có phục vụ tất cả các bánh mà ‘Ian’ thích
select pv.quanpizza
from lui_toi lt join phuc_vu pv on pv.quanpizza = lt.quanpizza join nguoi_an na on na.ten = lt.ten join (select pizza from an where ten='Ian') a on a.pizza=pv.pizza
group by pv.quanpizza
having count(distinct pv.pizza)=(select count(pizza) from an where ten='Ian' group by ten);

--Cau 18: Tên người ăn lui tới ít nhất 3 quán?
select ten
from lui_toi
group by ten
having count(quanpizza)>=3;

--Cau 19: Tính số loại pizza mà mỗi quán có bán?
select quanpizza,count(pizza) as "So loai pizza"
from phuc_vu
group by quanpizza;

--Cau 20: Tìm tên người ăn thích các bánh ít nhất là giống các bánh mà Hil thích?
select distinct ten
from an a join (select pizza from an where ten='Hil') b on a.pizza=b.pizza
where ten!='Hil';