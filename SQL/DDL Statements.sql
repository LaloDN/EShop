drop table cities;
drop table states;

CREATE TABLE states (
	state_id 	int 			NOT NULL AUTO_INCREMENT,
    state_name 	nvarchar(30) 	NOT NULL,
    CONSTRAINT PK_Id_State PRIMARY KEY (state_id)
);

CREATE TABLE cities (
	city_id 	int 			NOT NULL AUTO_INCREMENT,
	state_id 	int 			NOT NULL,
    city_name 	nvarchar(90) 	NOT NULL,
    CONSTRAINT PK_Id_Cities PRIMARY KEY (city_id),
    CONSTRAINT FK_Id_State 	FOREIGN KEY (state_id) REFERENCES states (state_id)
);

CREATE TABLE phone_types(
	phone_type_id int NOT NULL AUTO_INCREMENT,
    description nvarchar(20) NOT NULL,
    CONSTRAINT PK_Id_Phone_Type PRIMARY KEY (phone_type_id)
);

CREATE TABLE email_types(
	email_type_id int NOT NULL AUTO_INCREMENT,
    description nvarchar(20) NOT NULL,
    CONSTRAINT PK_Id_Email_Type PRIMARY KEY (email_type_id)
);

