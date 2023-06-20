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

create table treatments ( id int primary key not null generated always as identity,
	type varchar(100) not null,
	name varchar (100) not null
	);
	
create table invoices ( id int primary key not null generated always as identity,
	total_amount decimal not null,
	generated_at timestamp not null,
	payed_At timestamp not null,
	medical_history_id int references medical_histories(id) ON DELETE CASCADE,
   );
