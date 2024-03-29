SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS uploadfile;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE board
(
	bno int unsigned NOT NULL AUTO_INCREMENT,
	btitle varchar(50) NOT NULL,
	bcontent text NOT NULL,
	brdate timestamp DEFAULT now() NOT NULL,
	bhit int unsigned DEFAULT 0 NOT NULL,
	btype varchar(20) NOT NULL,
	mno int unsigned NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE member
(
	mno int unsigned NOT NULL AUTO_INCREMENT,
	mid varchar(50) NOT NULL,
	mpw varchar(50) NOT NULL,
	mnickNm varchar(20) NOT NULL,
	mname varchar(20) NOT NULL,
	mbirth int(8) unsigned NOT NULL,
	mphone varchar(13) NOT NULL,
	mgender char(1) NOT NULL,
	memail varchar(50) NOT NULL,
	mrdate timestamp NOT NULL,
	PRIMARY KEY (mno)
);


CREATE TABLE reply
(
	rno int unsigned NOT NULL AUTO_INCREMENT,
	rcontent text NOT NULL,
	rrdate timestamp DEFAULT now() NOT NULL,
	mno int unsigned NOT NULL,
	bno int unsigned NOT NULL,
	PRIMARY KEY (rno)
);


CREATE TABLE uploadfile
(
	fno int unsigned NOT NULL AUTO_INCREMENT,
	frealNm varchar(255) NOT NULL,
	foriginNm varchar(255) NOT NULL,
	frdate timestamp DEFAULT now() NOT NULL,
	bno int unsigned NOT NULL,
	PRIMARY KEY (fno)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE uploadfile
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (mno)
	REFERENCES member (mno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



