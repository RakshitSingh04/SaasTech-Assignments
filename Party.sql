use learningdatamodel;
-- 1. Delete child table records first to avoid foreign key errors

create table PartyType( partyTypeId varchar(25)  primary key , _description varchar(50) );

create table Party( partyId varchar(10)  primary key  , partyTypeId  varchar(25) not null , 
statusId enum('PARTY_DISABLED' , 'PARTY_ENABLED') , createdDate timestamp DEFAULT current_timestamp  , foreign key (partyTypeId) references PartyType(partyTypeId));

create table Person(partyId varchar(10) primary key  , salutation varchar(5) , firstName varchar(25) not null  , lastName varchar(25) , gender enum('male' , 'female') , birthDate date ,
 foreign key (partyId) references  Party (partyId));

create table PartyGroup(partyId varchar(10)  primary key , groupName varchar(35) , numEmployee Int  , foreign key (partyId) references Party(partyId));

create table partyRoleType (roleTypeId varchar(10)   primary key ,  has_table char(1) , _description varchar(50) )  ;

create table partyRole( partyId varchar(10)  not null , roleTypeId varchar(10)  not null  , 
primary key (partyId , roletypeId ) , foreign key (partyId) references Party(partyId)
 , foreign key (roleTypeId) references partyRoleType(roleTypeId));

 create table PartyRelationshipType( partyRelationshipId varchar(10) primary key , parentTypeId varchar(10) , hasTable char(1) , _description varchar(50));

 create table PartyRelationship(partyIdTo varchar(15) not null , partyIdFrom varchar(15)not null, roleTypeIdFrom varchar(15) not null ,
 roleTypeIdTo varchar(15) not null , fromDate datetime not null , thruDate datetime, partyRelationshiptypeId varchar(10) ,
 foreign key (partyRelationshiptypeId) references PartyRelationshipType(partyRelationshipId),
 primary key (partyIdTo , partyIdFrom , roleTypeIdFrom , roleTypeIdTo , fromDate) );

 alter table PartyRelationship add constraint foreign key (partyIdfrom, roleTypeIdFrom)  references PartyRole(partyId , roleTypeId);

  --  Now the Data entry data -----

  insert into  PartyType (partytypeId , _description ) values( "Party_Group" , "Party Group") , ("Person" , "Person") ;  -- Inserting the partyTypeId

  -- Here First two letter is representing the PG for PartyGroup and PP for PartyPerson
  -- Entry in the Party Table 
  insert into Party(partyId , partyTypeId , statusId ) values("PP101" , "PT102" , 'PARTY_ENABLED') , 
  ("PP102" , "PT102" , 'PARTY_ENABLED') ,
  ("PP103" , "PT102" , 'PARTY_ENABLED') ,
  ("PP104" , "PT102" , 'PARTY_ENABLED') ,
  ("PP105" , "PT102" , 'PARTY_ENABLED') ,
  ("PP106" , "PT102" , 'PARTY_ENABLED') ,
  ("PP107" , "PT102" , 'PARTY_ENABLED') ,
  ("PP108" , "PT102" , 'PARTY_ENABLED') ,
  ("PP109" , "PT102" , 'PARTY_ENABLED') ,
  ("PP110" , "PT102" , 'PARTY_ENABLED') ,
  ("PG101" , "PT101" , 'PARTY_ENABLED') ;

  -- Entry in the Person Table 
  insert into Person(partyId , salutation , firstName , lastName , gender , birthDate ) values("PP101" , 'Mr.' , 'Nikunj ' ,'Bisani' ,'M' , '2002-12-14' ),
  ("PP102" , 'Mr.' , 'NandKishore' ,'Mufadale' ,'M' , '2003-09-01' ),
  ("PP103" , 'Ms.' , 'Radhika ' ,'Kumari' ,'F' , '1996-05-12' ),
  ("PP104" , 'Ms.' , 'Sanjana' ,'Patel' ,'F' , '2003-05-15' ),
  ("PP105" , 'Mrs.' , 'Simran' ,'kandoriya' ,'F' , '2004-11-18' ),
  ("PP106" , Null , 'Virat' ,'Kohli' ,'M' , '2002-12-14' ),
  ("PP107" , 'Mr.' , 'Nikunj ' ,'Maheshwari' ,'M' , '2002-12-14' ),
  ("PP108" , Null , 'Prateek' ,'Jaat' ,'M' , '2002-12-20' ),
  ("PP109" , 'Mr.' , 'Ronak' ,'jaat' ,'M' , '2003-12-29' ),
  ("PP110" , 'Dr.' , 'Tanay' ,'Surjan' ,'M' , '1190-01-22' );

  -- lets make the Partygroup Ranina Group inside the party 
insert into PartyGroup(partyId , groupName , numEmployee) values("PG101" , "Ranina Group" ,10 );  

-- Now we will make the RoleType  in the RoleType
insert into partyRoleType(roleTypeId , has_table , _description) values("_NA_" , "N" ,"Not Applicable"),
("EMPLOYEE" , "N" ,"Employee"),
("MANAGER" , "N" ,"Manager"),
("ORG_ROLE" , "N" ,"organization Role");

  -- Now Nikunj Define the Role of Each Party present in the Part Entity , what are their Role in the Enterprise level ??? 

  insert into  partyRole(partyId , roleTypeId ) values('PP101', 'EMPLOYEE'), 
  ('PP102', 'EMPLOYEE'),
  ('PP103', 'EMPLOYEE'),
  ('PP104', 'EMPLOYEE'),
  ('PP105', 'EMPLOYEE'),
  ('PP106', 'EMPLOYEE'),
  ('PP107', 'EMPLOYEE'),
  ('PP108', 'EMPLOYEE'),
  ('PP109', 'EMPLOYEE'),
  ('PP110', 'EMPLOYEE'),
  ('PP101', 'MANAGER'),
  ('PP102', 'MANAGER'),
  ('PP103', 'MANAGER'),
  ('PG101', 'ORG_ROLE');

-- NOW nikunj you have to define the Party RelationShip type , what Realation in your Enterprise can Exists  we have to Define ?? 

   -- create table PartyRelationshipType( partyRelationshipId varchar(10) primary key , parentTypeId varchar(10) , hasTable char(1) , _description varchar(50));

   -- IMPORTANT QUESTION WE HAVE TO ENTER THE  GROUP ITSELF OR NOT ?? 

   insert into PartyRelationshipType(partyRelationshipId ,  hasTable , _description) values('EMPLOYMENT','N' , 'Employee'),
   ('MANAGER','N' , 'Manager'),
   ('GROUP_ROLL','N' , 'Group Member'),
   ('REPORTS_TO','N' , 'Reports To');

   -- Now we need to Establish the Relation ship b/w all these  VERY IMORTANT 

--  to type of relationship can be there as of now , Employee to manager and employee to organization 

insert into PartyRelationship(partyIdFrom , partyIdTo , roleTypeIdFrom , roletypeIdTo ,  partyRelationshiptypeId, fromDate ) values
('PP101' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT' ,NOW()),
('PP102' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP103' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP104' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP105' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP106' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP107' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP108' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP109' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP110' , 'PG101' , 'EMPLOYEE' , 'ORG_ROLE','EMPLOYMENT',NOW()),
('PP104' , 'PP101' , 'EMPLOYEE' , 'MANAGER','REPORTS_TO',NOW()),
('PP105' , 'PP101' , 'EMPLOYEE' , 'MANAGER','REPORTS_TO',NOW()),
('PP106' , 'PP102' , 'EMPLOYEE' , 'MANAGER','REPORTS_TO',NOW()),
('PP107' , 'PP102' , 'EMPLOYEE' , 'MANAGER','REPORTS_TO',NOW()),
('PP108' , 'PP102' , 'EMPLOYEE' , 'MANAGER','REPORTS_TO',NOW()),
('PP109' , 'PP103' , 'EMPLOYEE' , 'MANAGER','REPORTS_TO',NOW()),
('PP110' , 'PP103' , 'EMPLOYEE' , 'MANAGER','REPORTS_TO',NOW());

-- here Person to Enterprise (if this is party_Group)  Employeement ??
-- here person to Organization  Group Member can be also exist this??

-- PARTY CONTACT MECH 

USE learningdatamodel ;

CREATE TABLE Contact_Mech_Type(contact_Mech_Type_Id VARCHAR(50)  PRIMARY KEY , parent_Type_ID VARCHAR(50) , has_Table CHAR(1),  _description VARCHAR(50));

CREATE TABLE Contact_Mech(contact_Mech_Id VARCHAR(50) PRIMARY KEY , contact_Mech_Type_Id  VARCHAR(50) , info_String VARCHAR(50) ,
FOREIGN KEY (contact_Mech_Type_Id) REFERENCES contact_Mech_Type(contact_Mech_Type_Id)) ;

CREATE TABLE contact_Mech_Purpose_Type(contact_Mech_Purpose_Type_Id VARCHAR(50)  PRIMARY KEY , _description VARCHAR(50) );

CREATE TABLE contact_Mech_Type_Purpose(contact_Mech_Type_Id  VARCHAR(50), contact_Mech_Purpose_Type_Id VARCHAR(50)  , 
PRIMARY KEY (contact_Mech_Type_Id,Contact_Mech_Purpose_Type_Id) , 
FOREIGN KEY(contact_Mech_type_Id) REFERENCES Contact_Mech_Type(contact_Mech_Type_Id) , 
FOREIGN KEY (Contact_Mech_Purpose_Type_Id) REFERENCES Contact_Mech_Purpose_Type(Contact_Mech_Purpose_Type_Id) );

CREATE TABLE Party_Contact_Mech(party_Id  VARCHAR(50) , contact_Mech_Id VARCHAR(50) , from_Date TIMESTAMP , 
thruDate TIMESTAMP , role_Type VARCHAR(50),  allow_Solicitation VARCHAR(60) , verified VARCHAR(25) ,
PRIMARY KEY(party_Id , contact_Mech_Id , from_Date) ,
 FOREIGN KEY (party_Id) REFERENCES Party(party_Id) , FOREIGN KEY(contact_Mech_Id) REFERENCES Contact_Mech(contact_Mech_Id));

CREATE TABLE Party_Contact_Mech_Purpose(Party_Id varchar(50) , contact_Mech_Id varchar(50) , contact_Mech_Purpose_Type_Id varchar(50), from_Date timestamp, thru_Date timestamp, 
PRIMARY KEY (Party_Id , contact_Mech_Id , contact_Mech_Purpose_Type_Id , from_Date),
FOREIGN KEY (party_Id) REFERENCES Party(party_Id) , 
FOREIGN KEY (contact_Mech_Purpose_Type_Id) REFERENCES contact_Mech_Purpose_Type(contact_Mech_Purpose_Type_Id ) , 
FOREIGN KEY (contact_Mech_Id) REFERENCES contact_Mech(contact_Mech_Id));


-- First Insert into the  contact_mech_type 1

-- INSERT INTO Contact_Mech_Type (contact_Mech_Type_Id, has_Table, _description) VALUES ('DOMAIN_NAME', 'N', 'Internet Domain Name'),
-- ('ELECTRONIC_ADDRESS', 'N', 'Electronic Address'),
-- ('EMAIL_ADDRESS', 'N', 'Email Address'),
-- ('IP_ADDRESS', 'N', 'Internet IP Address'),
-- ('POSTAL_ADDRESS', 'N', 'Postal Address'),
-- ('TELECOM_NUMBER', 'N', 'Phone Number'),
-- ('WEB_ADDRESS', 'N', 'Web URL Address');
--

-- INSERT INTO Contact_Mech(contact_Mech_Id , contact_Mech_Type_Id , info_String) VALUES ("CM001" , "EMAIL_ADDRESS","nikunjbisani@gmail.com"),
-- ("CM023" , "EMAIL_ADDRESS","nikunj14bisani@gmail.com"),
-- ("CM011" , "TELECOM_NUMBER","6232426158"),
-- ("CM002" , "EMAIL_ADDRESS","nandkishoremufadale@gmail.com") ,
-- ("CM012" , "TELECOM_NUMBER","8103006948"),
-- ("CM003" , "EMAIL_ADDRESS","radhikabisani@gmail.com") ,
-- ("CM013" , "TELECOM_NUMBER","798994487"),
-- ("CM004" , "EMAIL_ADDRESS","sanajanpatel@gmail.com") ,
-- ("CM014" , "TELECOM_NUMBER","1234567899"),
-- ("CM005" , "EMAIL_ADDRESS","simrankandoriya@gmail.com") ,
-- ("CM015" , "TELECOM_NUMBER","9987654321"),
-- ("CM006" , "EMAIL_ADDRESS","viratkohli@gmail.com") ,
-- ("CM016" , "TELECOM_NUMBER","889974561"),
-- ("CM007" , "EMAIL_ADDRESS","nikunjmaheshwari@gmail.com") ,
-- ("CM017" , "TELECOM_NUMBER","9752906875"),
-- ("CM008" , "EMAIL_ADDRESS","prateekjaat@gmail.com") ,
-- ("CM024" , "EMAIL_ADDRESS","prateek12jaat@gmail.com"),
-- ("CM018" , "TELECOM_NUMBER","9752608991"),
-- ("CM009" , "EMAIL_ADDRESS","ronakjaat@gmail.com") ,
-- ("CM019" , "TELECOM_NUMBER","7000623756"),
-- ("CM010" , "EMAIL_ADDRESS","tanaysurjan@gmail.com"),
-- ("CM020" , "TELECOM_NUMBER","9893360663"),
-- ("CM021" , "EMAIL_ADDRESS","ranina@gmail.com"),
-- ("CM022" , "TELECOM_NUMBER","07576-228769"),
-- ("CM025" , "EMAIL_ADDRESS","raninainfo@gmail.com"),
-- ("CM026" , "TELECOM_NUMBER","9981076420");

--   -- iNSERT DONE BELOW 
-- INSERT INTO Contact_Mech_Purpose_Type (Contact_Mech_Purpose_Type_Id, _description) VALUES('BILLING_EMAIL', 'Billing (AP) Email'),
-- ('BILLING_LOCATION', 'Billing Address'),
-- ('FAX_NUMBER', 'Main Fax Number'),
-- ('ORDER_EMAIL', 'Order Notification Email'),
-- ('OTHER_EMAIL', 'Other Email Address'),
-- ('PAYMENT_EMAIL', 'Payment (AR) Email'),
-- ('PHONE_DID', 'Direct Inward Dialing'),
-- ('PHONE_WORK', 'Main Work Phone'),
-- ('PHONE_HOME', 'Home Phone Number'),
-- ('PHONE_SHIPPING', 'Shipping Phone Number'),
-- ('SHIPPING_LOCATION', 'Shipping Address'),
-- ('PRIMARY_LOCATION', 'Primary Address'),
-- ('PRIMARY_PHONE', 'Primary Phone Number'),
-- ('PHONE_PAYMENT', 'Payment Phone Number'),
-- ('PREVIOUS_LOCATION', 'Previous Address');

--   -- iNSERT DONE ABOVE
--   

-- INSERT INTO Contact_Mech_Type_Purpose(contact_Mech_Type_Id, Contact_Mech_Purpose_Type_Id) VALUES ('EMAIL_ADDRESS', 'BILLING_EMAIL'),
-- ('EMAIL_ADDRESS', 'ORDER_EMAIL'),
-- ('EMAIL_ADDRESS', 'OTHER_EMAIL'),
-- ('EMAIL_ADDRESS', 'PAYMENT_EMAIL'),
-- ('POSTAL_ADDRESS', 'BILLING_LOCATION'),
-- ('POSTAL_ADDRESS', 'SHIPPING_LOCATION'),
-- ('POSTAL_ADDRESS', 'PRIMARY_LOCATION'),
-- ('POSTAL_ADDRESS', 'PREVIOUS_LOCATION'),
-- ('TELECOM_NUMBER', 'PRIMARY_PHONE'),
-- ('TELECOM_NUMBER', 'PHONE_WORK'),
-- ('TELECOM_NUMBER', 'PHONE_HOME'),
-- ('TELECOM_NUMBER', 'PHONE_DID'),
-- ('TELECOM_NUMBER', 'PHONE_PAYMENT'),
-- ('TELECOM_NUMBER', 'PHONE_SHIPPING'),
-- ('WEB_ADDRESS', 'OTHER_EMAIL');


-- INSERT INTO party_Contact_Mech(party_Id , contact_Mech_Id , from_Date ) VALUES("PP101" , "CM001" , NOW()),
-- ("PP101" , "CM011" , NOW()),
-- ("PP101" , "CM023" , NOW()),
-- ("PP102" , "CM002" , NOW()),
-- ("PP102" , "CM012" , NOW()),
-- ("PP103" , "CM003" , NOW()),
-- ("PP103" , "CM013" , NOW()),
-- ("PP104" , "CM004" , NOW()),
-- ("PP104" , "CM014" , NOW()),
-- ("PP105" , "CM005" , NOW()),
-- ("PP105" , "CM015" , NOW()),
-- ("PP106" , "CM006" , NOW()),
-- ("PP106" , "CM016" , NOW()),
-- ("PP107" , "CM007" , NOW()),
-- ("PP107" , "CM017" , NOW()),
-- ("PP108" , "CM024" , NOW()),
-- ("PP108" , "CM008" , NOW()),
-- ("PP108" , "CM018" , NOW()),
-- ("PP109" , "CM009" , NOW()),
-- ("PP109" , "CM019" , NOW()),
-- ("PP110" , "CM010" , NOW()),
-- ("PP110" , "CM020" , NOW()),
-- ("PG101" , "CM021" , NOW()),
-- ("PG101" , "CM022" , NOW()),
-- ("PG101" , "CM025" , NOW()),
-- ("PG101" , "CM026" , NOW());
-- ;

-- INSERT INTO Contact_Mech(contact_Mech_Id , contact_Mech_Type_Id , info_String) VALUES ("CM001" , "EMAIL_ADDRESS","nikunjbisani@gmail.com"),
-- ("CM023" , "EMAIL_ADDRESS","nikunj14bisani@gmail.com"),
-- ("CM011" , "TELECOM_NUMBER","6232426158"),
-- ("CM002" , "EMAIL_ADDRESS","nandkishoremufadale@gmail.com") ,
-- ("CM012" , "TELECOM_NUMBER","8103006948"),
-- ("CM003" , "EMAIL_ADDRESS","radhikabisani@gmail.com") ,
-- ("CM013" , "TELECOM_NUMBER","798994487"),
-- ("CM004" , "EMAIL_ADDRESS","sanajanpatel@gmail.com") ,
-- ("CM014" , "TELECOM_NUMBER","1234567899"),
-- ("CM005" , "EMAIL_ADDRESS","simrankandoriya@gmail.com") ,

-- ("CM015" , "TELECOM_NUMBER","9987654321"),
-- ("CM006" , "EMAIL_ADDRESS","viratkohli@gmail.com") ,
-- ("CM016" , "TELECOM_NUMBER","889974561"),
-- ("CM007" , "EMAIL_ADDRESS","nikunjmaheshwari@gmail.com") ,
-- ("CM017" , "TELECOM_NUMBER","9752906875"),
-- ("CM008" , "EMAIL_ADDRESS","prateekjaat@gmail.com") ,
-- ("CM024" , "EMAIL_ADDRESS","prateek12jaat@gmail.com"),
-- ("CM018" , "TELECOM_NUMBER","9752608991"),
-- ("CM009" , "EMAIL_ADDRESS","ronakjaat@gmail.com") ,
-- ("CM019" , "TELECOM_NUMBER","7000623756"),
-- ("CM010" , "EMAIL_ADDRESS","tanaysurjan@gmail.com"),
-- ("CM020" , "TELECOM_NUMBER","9893360663"),
-- ("CM021" , "EMAIL_ADDRESS","ranina@gmail.com"),
-- ("CM022" , "TELECOM_NUMBER","07576-228769"),
-- ("CM025" , "EMAIL_ADDRESS","raninainfo@gmail.com"),
-- ("CM026" , "TELECOM_NUMBER","9981076420");

--   -- iNSERT DONE BELOW 
-- INSERT INTO Contact_Mech_Purpose_Type (Contact_Mech_Purpose_Type_Id, _description) VALUES('BILLING_EMAIL', 'Billing (AP) Email'),
-- ('BILLING_LOCATION', 'Billing Address'),
-- ('FAX_NUMBER', 'Main Fax Number'),
-- ('ORDER_EMAIL', 'Order Notification Email'),
-- ('OTHER_EMAIL', 'Other Email Address'),
-- ('PAYMENT_EMAIL', 'Payment (AR) Email'),
-- ('PHONE_DID', 'Direct Inward Dialing'),
-- ('PHONE_WORK', 'Main Work Phone'),
-- ('PHONE_HOME', 'Home Phone Number'),
-- ('PHONE_SHIPPING', 'Shipping Phone Number'),
-- ('SHIPPING_LOCATION', 'Shipping Address'),
-- ('PRIMARY_LOCATION', 'Primary Address'),
-- ('PRIMARY_PHONE', 'Primary Phone Number'),
-- ('PHONE_PAYMENT', 'Payment Phone Number'),
-- ('PREVIOUS_LOCATION', 'Previous Address');


-- INSERT INTO party_Contact_Mech_Purpose(Party_Id  , contact_Mech_Id , contact_Mech_Purpose_Type_Id , from_Date) VALUES("PP101" , "CM001" ,"BILLING_EMAIL" ,NOW()),
-- ("PP101" , "CM011" ,"PHONE_WORK" ,NOW()),
-- ("PP101" , "CM023" ,"OTHER_EMAIL" ,NOW()),
-- ("PP102" , "CM002" ,"PAYMENT_EMAIL" ,NOW()),
-- ("PP102" , "CM012" ,"PHONE_WORK" ,NOW()),
-- ("PP103" , "CM003" ,"ORDER_EMAIL" ,NOW()),
-- ("PP103" , "CM013" ,"PHONE_WORK" ,NOW()),
-- ("PP104" , "CM004" ,"BILLING_EMAIL" ,NOW()),
-- ("PP104" , "CM014" ,"PHONE_WORK" ,NOW()),
-- ("PP105" , "CM005" ,"OTHER_EMAIL" ,NOW()),
-- ("PP105" , "CM015" ,"PHONE_WORK" ,NOW()),
-- ("PP106" , "CM006" ,"PAYMENT_EMAIL" ,NOW()),
-- ("PP106" , "CM016" ,"PHONE_WORK" ,NOW()),
-- ("PP107" , "CM017" ,"PHONE_WORK" ,NOW()),
-- ("PP107" , "CM007" ,"OTHER_EMAIL" ,NOW()),
-- ("PP108" , "CM008" ,"PAYMENT_EMAIL" ,NOW()),
-- ("PP108" , "CM024" ,"BILLING_EMAIL" ,NOW()),
-- ("PP108" , "CM018" ,"PHONE_WORK" ,NOW()),
-- ("PP109" , "CM019" ,"PHONE_WORK" ,NOW()),
-- ("PP109" , "CM009" ,"BILLING_EMAIL" ,NOW()),
-- ("PP110" , "CM010" ,"PAYMENT_EMAIL" ,NOW()),
-- ("PP110" , "CM020" ,"PHONE_WORK" ,NOW()),
-- ("PG101" , "CM021" ,"PAYMENT_EMAIL" ,NOW()),
-- ("PG101" , "CM022" ,"PHONE_DID" ,NOW()),
-- ("PG101" , "CM025" ,"BILLING_EMAIL" ,NOW()),
-- ("PG101" , "CM026" ,"PHONE_WORK" ,NOW());

-- SELECT p.party_id ,
--        p.partytypeid ,
--        pc.contact_mech_id ,
--        cm.info_string,
--        pcm.contact_Mech_Purpose_Type_Id
-- FROM party p
-- JOIN party_contact_mech pc 
--      ON p.party_id = pc.party_id
-- JOIN party_contact_mech_purpose pcm 
--      ON pc.party_id = pcm.party_id
--     AND pc.contact_mech_id = pcm.contact_mech_id
-- JOIN contact_mech cm 
--      ON pc.contact_mech_id = cm.contact_mech_id where contact_Mech_Type_Id="EMAIL_ADDRESS" ;

