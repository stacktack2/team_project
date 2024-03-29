SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS attendcheck_reply;
DROP TABLE IF EXISTS attendcheck;
DROP TABLE IF EXISTS free_file;
DROP TABLE IF EXISTS free_reply;
DROP TABLE IF EXISTS free;
DROP TABLE IF EXISTS gear_file;
DROP TABLE IF EXISTS gear_reply;
DROP TABLE IF EXISTS gear;
DROP TABLE IF EXISTS notice_reply;
DROP TABLE IF EXISTS notice_uploadfile;
DROP TABLE IF EXISTS notice;
DROP TABLE IF EXISTS QnA_file;
DROP TABLE IF EXISTS QnA_reply;
DROP TABLE IF EXISTS QnA;
DROP TABLE IF EXISTS zone_reply;
DROP TABLE IF EXISTS zone_uploadfile;
DROP TABLE IF EXISTS zone;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE attendcheck
(
	chno int unsigned NOT NULL AUTO_INCREMENT,
	chtitle varchar(50) NOT NULL,
	chcontent text NOT NULL,
	chrdate timestamp DEFAULT now(),
	chhit int unsigned DEFAULT 0 NOT NULL,
	mno int NOT NULL,
	PRIMARY KEY (chno)
);


CREATE TABLE attendcheck_reply
(
	chrno int unsigned NOT NULL AUTO_INCREMENT,
	chrcontent text NOT NULL,
	chrdate timestamp DEFAULT now() NOT NULL,
	chno int unsigned NOT NULL,
	mno int NOT NULL,
	PRIMARY KEY (chrno)
);


CREATE TABLE free
(
	frno int unsigned NOT NULL AUTO_INCREMENT,
	frtitle varchar(50) NOT NULL,
	frcontent text NOT NULL,
	frdate timestamp DEFAULT now() NOT NULL,
	frhit int DEFAULT 0 NOT NULL,
	mno int NOT NULL,
	PRIMARY KEY (frno)
);


CREATE TABLE free_file
(
	frfno int unsigned NOT NULL AUTO_INCREMENT,
	frfrealNm varchar(255) NOT NULL,
	frforignNm varchar(255) NOT NULL,
	frfrdate timestamp NOT NULL,
	frno int unsigned NOT NULL,
	PRIMARY KEY (frfno)
);


CREATE TABLE free_reply
(
	frrno int unsigned NOT NULL AUTO_INCREMENT,
	frrcontent text NOT NULL,
	frrdate timestamp DEFAULT now() NOT NULL,
	mno int NOT NULL,
	frno int unsigned NOT NULL,
	PRIMARY KEY (frrno)
);


CREATE TABLE gear
(
	grno int unsigned NOT NULL AUTO_INCREMENT,
	grtitle varchar(50) NOT NULL,
	grcontent text NOT NULL,
	grrdate timestamp DEFAULT now() NOT NULL,
	grhit int unsigned DEFAULT 0 NOT NULL,
	grtype varchar(20) NOT NULL,
	mno int NOT NULL,
	PRIMARY KEY (grno)
);


CREATE TABLE gear_file
(
	grfno int unsigned NOT NULL AUTO_INCREMENT,
	grfrealNm varchar(255) NOT NULL,
	grforiginNm varchar(255) NOT NULL,
	grrdate timestamp DEFAULT now(),
	grno int unsigned NOT NULL,
	PRIMARY KEY (grfno)
);


CREATE TABLE gear_reply
(
	grrno int unsigned NOT NULL AUTO_INCREMENT,
	grcontent text NOT NULL,
	grrdate timestamp DEFAULT now() NOT NULL,
	mno int NOT NULL,
	grno int unsigned NOT NULL,
	PRIMARY KEY (grrno)
);


CREATE TABLE member
(
	mno int NOT NULL,
	mid varchar(50) NOT NULL,
	mpw varchar(50) NOT NULL,
	mnickNm varchar(20) NOT NULL,
	mname varchar(20) NOT NULL,
	mbirth int(8) NOT NULL,
	mphone varchar(13) NOT NULL,
	mgender char(1) NOT NULL,
	memail varchar(50) NOT NULL,
	mrdate timestamp NOT NULL,
	PRIMARY KEY (mno)
);


CREATE TABLE notice
(
	nono int unsigned NOT NULL AUTO_INCREMENT,
	notitle varchar(50) NOT NULL,
	nocontent text NOT NULL,
	nordate timestamp DEFAULT now() NOT NULL,
	nohit int unsigned DEFAULT () NOT NULL,
	mno int NOT NULL,
	PRIMARY KEY (nono)
);


CREATE TABLE notice_reply
(
	norno int unsigned NOT NULL AUTO_INCREMENT,
	norcontent text NOT NULL,
	nordate timestamp DEFAULT now() NOT NULL,
	mno int NOT NULL,
	nono int unsigned NOT NULL,
	PRIMARY KEY (norno)
);


CREATE TABLE notice_uploadfile
(
	nofno int unsigned NOT NULL AUTO_INCREMENT,
	nofrealNm varchar(255) NOT NULL,
	noforiginNm varchar(255) NOT NULL,
	nofrdate timestamp DEFAULT now() NOT NULL,
	nono int unsigned NOT NULL,
	PRIMARY KEY (nofno)
);


CREATE TABLE QnA
(
	quno int unsigned NOT NULL AUTO_INCREMENT,
	qutitle varchar(50) NOT NULL,
	qucontent text NOT NULL,
	qurdate timestamp DEFAULT now() NOT NULL,
	quhit int unsigned DEFAULT 0 NOT NULL,
	mno int NOT NULL,
	PRIMARY KEY (quno)
);


CREATE TABLE QnA_file
(
	qufno int unsigned NOT NULL AUTO_INCREMENT,
	qufrealNm varchar(255) NOT NULL,
	quforiginNm varchar(255) NOT NULL,
	qufrdate timestamp DEFAULT now() NOT NULL,
	quno int unsigned NOT NULL,
	PRIMARY KEY (qufno)
);


CREATE TABLE QnA_reply
(
	qurno int unsigned NOT NULL AUTO_INCREMENT,
	qurcontent text NOT NULL,
	qurdate timestamp DEFAULT now() NOT NULL,
	mno int NOT NULL,
	quno int unsigned NOT NULL,
	PRIMARY KEY (qurno)
);


CREATE TABLE zone
(
	znno int unsigned NOT NULL AUTO_INCREMENT,
	zntitle varchar(50) NOT NULL,
	zncontent text NOT NULL,
	znrdate timestamp DEFAULT now() NOT NULL,
	znhit int unsigned DEFAULT () NOT NULL,
	zntype varchar(20) NOT NULL,
	mno int NOT NULL,
	PRIMARY KEY (znno)
);


CREATE TABLE zone_reply
(
	znrno int unsigned NOT NULL AUTO_INCREMENT,
	znrcontent text NOT NULL,
	znrdate timestamp DEFAULT now() NOT NULL,
	mno int NOT NULL,
	znno int unsigned NOT NULL,
	PRIMARY KEY (znrno)
);


CREATE TABLE zone_uploadfile
(
	znfno int unsigned NOT NULL AUTO_INCREMENT,
	znfrealNm varchar(255) NOT NULL,
	znforiginNm varchar(255) NOT NULL,
	znfrdate timestamp DEFAULT now() NOT NULL,
	znno int unsigned NOT NULL,
	PRIMARY KEY (znfno)
);



/* Create Foreign Keys */

ALTER TABLE attendcheck_reply
	ADD FOREIGN KEY (chno)
	REFERENCES attendcheck (chno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE free_file
	ADD FOREIGN KEY (frno)
	REFERENCES free (frno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE free_reply
	ADD FOREIGN KEY (frno)
	REFERENCES free (frno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE gear_file
	ADD FOREIGN KEY (grno)
	REFERENCES gear (grno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE gear_reply
	ADD FOREIGN KEY (grno)
	REFERENCES gear (grno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE attendcheck
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE attendcheck_reply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE free
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE free_reply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE gear
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE gear_reply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice_reply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE QnA
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE QnA_reply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE zone
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE zone_reply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice_reply
	ADD FOREIGN KEY (nono)
	REFERENCES notice (nono)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE notice_uploadfile
	ADD FOREIGN KEY (nono)
	REFERENCES notice (nono)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE QnA_file
	ADD FOREIGN KEY (quno)
	REFERENCES QnA (quno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE QnA_reply
	ADD FOREIGN KEY (quno)
	REFERENCES QnA (quno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE zone_reply
	ADD FOREIGN KEY (znno)
	REFERENCES zone (znno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE zone_uploadfile
	ADD FOREIGN KEY (znno)
	REFERENCES zone (znno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



