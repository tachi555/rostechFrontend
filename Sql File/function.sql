
DELIMITER //
DROP function IF EXISTS checkLogin//

CREATE function checkLogin(var1 varchar(25), var2 varchar(32))
returns varchar(15)

BEGIN
	return (select a.role FROM ilogin a where a.pass like var2 and UPPER(a.nama) like UPPER(var1) and a.status LIKE 'aktif');
END//
DELIMITER ;

DELIMITER //
DROP function IF EXISTS latestStock//

CREATE function latestStock(in_mid int)
returns int 
BEGIN

return (select s.total as i from stock s where s.mid = in_mid order by s.tanggal desc limit 1);

END//
DELIMITER ;

DELIMITER //
DROP function IF EXISTS inputPembelian//

CREATE function inputPembelian(in_mid int, in_tid int, in_persatuan int, in_jumlah int,  in_total int, in_tanggal VARCHAR(25), in_ket VARCHAR(55))
returns int 
BEGIN
declare t int;
declare inS int;

insert into stock(mid, perubahan, total, tanggal, ket)  values(in_mid, in_jumlah, (in_jumlah+(select COALESCE(latestStock(in_mid),0))), now(), in_ket);
insert into harga(mid, tid, tanggal, persatuan, jumlah, total, ket) values(in_mid, in_tid, in_tanggal, in_persatuan, in_jumlah, in_total, in_ket);

return 1;

END//
DELIMITER ;