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
	CONSTRAINT PK_Id_Establishment 		PRIMARY KEY (establishment_id),
    CONSTRAINT FK_Id_City_Establishment FOREIGN KEY (city_id) REFERENCES cities (city_id)
);

CREATE TABLE users(
	user_id 			int 			NOT NULL AUTO_INCREMENT,
    preferred_store 	int,
    client_id 			int 			NOT NULL UNIQUE, #Crear trigger para el cliente id
    first_name 			nvarchar(40) 	NOT NULL,
    last_name 			nvarchar(40) 	NOT NULL,
    gender 				varchar(2) 		NOT NULL check(gender="M" or gender="F" or gender="NB" or gender="NA"),
    birthday 			datetime 		NOT NULL,
	suburb  			nvarchar(50) 	NOT NULL,
    street 				nvarchar(50) 	NOT NULL,
    interior_number 	int				NOT NULL,
    outdoor_number 		int 			NOT NULL,
    CONSTRAINT PK_Id_User 				PRIMARY KEY (user_id),
    CONSTRAINT FK_Id_Establishment_User FOREIGN KEY (preferred_store) REFERENCES establishments (establishment_id)
);


CREATE TABLE accounts(
	account_id			int 			NOT NULL AUTO_INCREMENT,
    user_id				int				UNIQUE, #Valor único para que solo haya usuario por cuenta, relación uno a uno
	username 			nvarchar(20) 	NOT NULL UNIQUE,
    email 				nvarchar(50) 	NOT NULL UNIQUE,
    password 			nvarchar(100) 	NOT NULL,
    active				bool			NOT NULL DEFAULT false,
    CONSTRAINT PK_Id_Account PRIMARY KEY (account_id),
    CONSTRAINT FK_Id_User_Account FOREIGN KEY (user_id) REFERENCES users (user_id)
);


CREATE TABLE providers(
	provider_id int 			NOT NULL AUTO_INCREMENT,
    first_name 	nvarchar(40) 	NOT NULL,
    last_name 	nvarchar(40) 	NOT NULL,
    company 	nvarchar(30) 	NOT NULL,
	CONSTRAINT PK_Id_Provider PRIMARY KEY (provider_id)
);

CREATE TABLE provider_phones(
	provider_phone_id 	int NOT NULL AUTO_INCREMENT,
    phone_type_id 		int NOT NULL,
    provider_id 		int NOT NULL,
    CONSTRAINT PK_Id_Provider_Phone PRIMARY KEY (provider_phone_id),
    CONSTRAINT FK_Id_Phone_Type_Provider FOREIGN KEY (phone_type_id) REFERENCES phone_types (phone_type_id),
    CONSTRAINT FK_Id_Provider_Provider_Phone FOREIGN KEY (provider_id) REFERENCES providers (provider_id)
);

CREATE TABLE provider_emails(
	provider_email_id int NOT NULL AUTO_INCREMENT,
    email_type_id int NOT NULL,
    provider_id int NOT NULL,
    CONSTRAINT PK_Id_Provider_Email PRIMARY KEY (provider_email_id),
    CONSTRAINT FK_Id_Email_Type_Provider FOREIGN KEY (email_type_id) REFERENCES email_types (email_type_id),
    CONSTRAINT FK_Id_Provider_Provider_Email FOREIGN KEY(provider_id) REFERENCES providers (provider_id)
);

CREATE TABLE users_phones(
	user_phone_id int NOT NULL AUTO_INCREMENT,
    phone_type_id int NOT NULL,
    user_id int NOT NULL,
    CONSTRAINT PRIMARY KEY PK_Id_User_Phone (user_phone_id),
    CONSTRAINT FK_Id_Phone_Type_User FOREIGN KEY (phone_type_id) REFERENCES phone_types (phone_type_id),
    CONSTRAINT FK_Id_User_User_Phone FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE products(
	product_id	int NOT NULL AUTO_INCREMENT,
    product_name	nvarchar(50) NOT NULL,
    unit 	nvarchar(20) NOT NULL,
    base_price	float NOT NULL,
    
)
