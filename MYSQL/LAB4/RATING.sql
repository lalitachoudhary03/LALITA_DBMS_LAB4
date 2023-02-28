create table rating(
rat_id int not null auto_increment,
ord_id int not null,
rat_ratstars int not null,
primary key(rat_id),
foreign key(order_id) references `order` (ord_id)
);