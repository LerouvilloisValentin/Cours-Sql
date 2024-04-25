drop table article;
create table article (
id integer(10) auto_increment primary key,
ref varchar (10) not null,
designation varchar(225) not null,
prix decimal (8,2) not null,
id_fou int(10) not null
);

drop table bon;
create table bon(
id integer(10) auto_increment primary key,
numero varchar(225) not null,
date_cmde datetime not null,
delai int(5),
id_fou int(10) not null
);

drop table fournisseur;
create table fournisseur(
id integer(10) auto_increment primary key,
nom varchar (225) not null
);

drop table compo;
CREATE TABLE `compta`.`compo` (
  `id` INT(10) NULL,
  `qte` INT(45) NOT NULL,
  `id_art` INT(10) NOT NULL,
  `id_bon` INT(10) NOT NULL,
  PRIMARY KEY (`id`));

-- création clé étrangère
ALTER TABLE article ADD CONSTRAINT fk_articles_fournisseur FOREIGN KEY (id_fou) REFERENCES fournisseur(id);
ALTER TABLE bon ADD CONSTRAINT fk_bon_fournisseur FOREIGN KEY (id_fou) REFERENCES fournisseur(id);
ALTER TABLE compo ADD CONSTRAINT fk_fournisseur FOREIGN KEY (id_bon) REFERENCES fournisseur(id);
ALTER TABLE compo ADD CONSTRAINT fk_art FOREIGN KEY (id_art) REFERENCES article(id);

insert into fournisseur (id, nom) values(1,'Française d''imports');
insert into fournisseur (id, nom) values(2,'FDM SA');
insert into fournisseur (id, nom) values(3,'Dubois & fils');
select * from fournisseur;

insert into article (id, ref, designation, prix, id_fou) values(1,'A01','Perceuse P1', 74.99,1);
insert into article (id, ref, designation, prix, id_fou) values(2,'F01','Boulon laiton 4 x 40 mm (sachet de 10) ', 2.25,2);
insert into article (id, ref, designation, prix, id_fou) values(3,'F02','Boulon laiton 5 x 40 mm (sachet de 10)', 4.45,2);
insert into article (id, ref, designation, prix, id_fou) values(4,'D01','Boulon laiton 5 x 40 mm (sachet de 10) ', 4.40,3);
insert into article (id, ref, designation, prix, id_fou) values(5,'A02','Meuleuse 125mm+', 37.85,1);
insert into article (id, ref, designation, prix, id_fou) values(6,'D03','Boulon acier zingué 4 x 40mm (sachet de 10) ', 1.8,2);
insert into article (id, ref, designation, prix, id_fou) values(7,'A03','Perceuse à colonne', 185.25,1);
insert into article (id, ref, designation, prix, id_fou) values(8,'D04','Coffret mêches à bois', 12.25,1);
insert into article (id, ref, designation, prix, id_fou) values(9,'F03',' Coffret mêches plates', 6.25,1);
insert into article (id, ref, designation, prix, id_fou) values(10,'F04','Fraises d’encastrement', 8.14,1);

Truncate table bon;
Truncate table compo;
insert into bon (id,numero,date_cmde,delai,id_fou) value(1,'4582','2024-04-25',3,1);
insert into compo (id, qte,id_art, id_bon) value(1,3, 1,1);
insert into compo (id, qte,id_art,id_bon) value(2,4,5,1);
insert into compo (id, qte,id_art,id_bon) value(3,1,7,1);

select * from bon;
select * from compo;

