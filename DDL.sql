
create table owner (
  ownerID serial,
  oName varchar(50) not null,
	email varchar(50) not null,
  phone int(20) not null,
  PRIMARY KEY (ownerID)
);

create table user (
  UID varchar(8) unique,
	email varchar(50) not null,
	uName varchar(50) not null,
  address varchar(50) not null,
	primary key(UID)
);

create table publisher (
  PID varchar(8),
	email varchar(50) not null,
	pName varchar(50) not null,
  phone int(20) not null,
	bank_acct varchar(50) not null,
	primary key(PID)
);

create table order (
	OID serial,
  tracking_num numeric(10,0) unique,
	date_oplaced timestamp,
  status varchar(50),
  address varchar(50) not null,
  UID varchar(8) unique,
	primary key(OID),
  foreign key(UID) references user(UID)
);	


create table book (
	ISBN numeric(13,0),
	title varchar(50) not null,
	author varchar(50) not null,
	genre varchar(50) not null,
	price numeric(5,2),
  stock int not null,
  sold_num int not null,
  PID varchar(8),
	primary key(ISBN),
  foreign key(PID) references publisher(PID)
);

create table basket (
	ISBN numeric(13,0) references book(ISBN),
	email varchar(75) references users(email),
	num numeric(3,0)
);

create table report (
	RID serial,
  sales_expenditures varchar(100), 
  sales_genres varchar(100), 
  sales_author varchar(100),
);
