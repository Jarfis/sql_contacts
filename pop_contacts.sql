CREATE TABLE contacts (id serial not null primary key, firstname varchar(40) not null, lastname varchar(40) not null, email varchar(40) not null, homephone text[], cellphone text[], address text);

insert into contacts (firstname, lastname, email, homephone, cellphone, address) values('Bob','Bobson','bob@bob.bob','{"123-456-7890"}',null, '123 bob street');
insert into contacts (firstname, lastname, email, homephone, cellphone, address) values('Jim','Jimson','jim@jim.jim',null,'{"123-456-7890"}', '123 jim street');
insert into contacts (firstname, lastname, email, homephone, cellphone, address) values('steve','steveson','steve@steve.steve','{"123-456-7890"}',null, '123 steve street');
insert into contacts (firstname, lastname, email, homephone, cellphone, address) values('Bob','jimson','bob@jim.bob','{"123-456-7890"}',null, '123 jim street');
insert into contacts (firstname, lastname, email, homephone, cellphone, address) values('jim','steveson','steve@jim.steve','{"123-456-7890"}',null, '123 steve street');
insert into contacts (firstname, lastname, email, homephone, cellphone, address) values('steve','Bobson','bob@steve.bob','{"123-456-7890"}',null, '123 bob street');
insert into contacts (firstname, lastname, email, homephone, cellphone, address) values('Bubba','lotsaphones','bubba@bubba.bubba','{"123-456-7890", "098-765-4321","102-938-4756"}','{"564-738-2910","657-483-9201"}', '123 bubba street');
