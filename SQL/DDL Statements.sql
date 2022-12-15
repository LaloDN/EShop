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
    CONSTRAINT PK_Id_City PRIMARY KEY (city_id),
    CONSTRAINT FK_Id_State_City FOREIGN KEY (state_id) REFERENCES states (state_id)
);


CREATE TABLE phone_types(
	phone_type_id 	int 			NOT NULL AUTO_INCREMENT,
    description 	nvarchar(20) 	NOT NULL,
    CONSTRAINT PK_Id_Phone_Type PRIMARY KEY (phone_type_id)
);

CREATE TABLE email_types(
	email_type_id int NOT NULL AUTO_INCREMENT,
    description nvarchar(20) NOT NULL,
    CONSTRAINT PK_Id_Email_Type PRIMARY KEY (email_type_id)
);

CREATE TABLE establishments (
	establishment_id 	int 			NOT NULL AUTO_INCREMENT,
	city_id 			int 			NOT NULL,
    shop_name 			nvarchar(40) 	NOT NULL,
    suburb  			nvarchar(50) 	NOT NULL,
    street 				nvarchar(50) 	NOT NULL,
    interior_number 	int				NOT NULL,
    outdoor_number 		int 			NOT NULL,
    phone_number 		varchar(20)		NOT NULL,
    email 				nvarchar(30) 	NOT NULL,
	CONSTRAINT PK_Id_Establishment PRIMARY KEY (establishment_id),
    CONSTRAINT FK_Id_City_Establishment FOREIGN KEY (city_id) REFERENCES cities (city_id)
);

CREATE TABLE users(
	user_id 			int 			NOT NULL AUTO_INCREMENT,
    preferred_store 	int,
    client_id 			int 			NOT NULL UNIQUE,
    first_name 			nvarchar(40) 	NOT NULL,
    last_name 			nvarchar(40) 	NOT NULL,
    gender 				varchar(2) 		NOT NULL check(gender="M" or gender="F" or gender="NB" or gender="NA"),
    birthday 			datetime 		NOT NULL,
	suburb  			nvarchar(50) 	NOT NULL,
    street 				nvarchar(50) 	NOT NULL,
    interior_number 	int				NOT NULL,
    outdoor_number 		int 			NOT NULL,
    CONSTRAINT PK_Id_User PRIMARY KEY (user_id),
    CONSTRAINT FK_Id_Establishment_User FOREIGN KEY (preferred_store) REFERENCES establishments (establishment_id)
);