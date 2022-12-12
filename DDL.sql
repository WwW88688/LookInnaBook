
-- ============================ Entities =============================================

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
	primary key(OID),
	foreign key(address) references user(address)
);	


create table book (
	ISBN numeric(13,0),
	title varchar(50) not null,
	author varchar(50) not null,
	genre varchar(50) not null,
	price numeric(5,2),
	stock int not null,
	sold_num int not null,
	primary key(ISBN)
);

create table basket (
	BID serial,
	ISBN numeric(13,0) references book(ISBN),
	quantityB numeric(3,0),
	primary key(BID),
	foreign key(ISBN) references book(ISBN)
);

create table report (
	RID serial,
	sales_expenditures varchar(100), 
	sales_genres varchar(100), 
	sales_author varchar(100)
	primary key(RID)
);

-- ============================ relations =============================================

create table publish (
	ISBN numeric(13,0) references book(ISBN),
	PID varchar(8) references publish(PID),
	%sales numeric(3,2)
	primary key(ISBN, PID)
);

create table manageBook (
	ISBN numeric(13,0) references book(ISBN),
	ownerID serial references owner(ownerID),
	quantityO numeric(3,0),
	primary key(ISBN,quantityO)
);

create table store_info_of (
	PID varchar(8) references publish(PID),
	ownerID serial references owner(ownerID),
	primary key(PID)
);

create table view (
	ownerID serial references owner(ownerID),
	RID serial reference report(RID),
	primary key(RID, ownerID)
);

create table contain (
	ISBN numeric(13,0) references book(ISBN),
	BID serial references basket(BID),
	quantityB numeric(3,0),
	primary key(ISBN,BID)
);

create table manageBasket (
	BID serial references basket(BID),
	UID varchar(8) unique references user(UID),
	primary key(BID)
);

create table checkout (
	BID serial references basket(BID),
	OID serial references order(OID),
	primary key(BID)
);

create table ship_to (
	OID serial references order(OID),
	UID varchar(8) unique references user(UID),
	primary key(OID)
);












