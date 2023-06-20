create database clinic;

create table patients ( id int primary key not null generated always as identity,
	name varchar(100) not null,
 	date_of_birth date not null
 	);
 
create table medical_histories ( id int primary key not null generated always as identity,
	admitted_at timestamp not null ,
	patient_id references patients(id) ON DELETE CASCADE,
	status varchar(100) 
	);