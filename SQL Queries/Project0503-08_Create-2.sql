CREATE TABLE [Studomes.Type](
	tID CHAR(10) NOT NULL,
	tCategory VARCHAR(10), 
	CONSTRAINT pk_Type_tID PRIMARY KEY (tID)); 

CREATE TABLE [Studomes.Owner](
	oID CHAR(10) NOT NULL, 
	oName VARCHAR(30), 
	oOrganization VARCHAR(30), 
	oContact CHAR(10), 
	oEmail VARCHAR(30), 
	oWebsite VARCHAR(30),
	CONSTRAINT pk_Owner_tID PRIMARY KEY (oID));


CREATE TABLE [Studomes.Agent](
	agID CHAR(10) NOT NULL, 
	agName VARCHAR(30), 
	agContact CHAR(10), 
	agEmail VARCHAR(30),
	CONSTRAINT pk_Agent_agID PRIMARY KEY (agID));


CREATE TABLE [Studomes.Amenity](
	amyID CHAR(3) NOT NULL, 
	amyName VARCHAR(20)
	CONSTRAINT pk_Amenity_amyID PRIMARY KEY (amyID));


CREATE TABLE [Studomes.Customer](
	cID CHAR(10) NOT NULL, 
	cName VARCHAR(30), 
	cContact CHAR(10), 
	cEmail VARCHAR(30),
	CONSTRAINT pk_Customer_cID PRIMARY KEY (cID));

CREATE TABLE [Studomes.Property](
	pID CHAR (10) NOT NULL, 
	pName VARCHAR(20),
	pAddress VARCHAR(50),
	pCity VARCHAR (20),
	pState VARCHAR (20),
	pPostalCode CHAR(5),
	pRent INTEGER,
	pNumberOfBedroom INTEGER,
	pNumberOfBathroom INTEGER,
	pAreaSqFt INTEGER,
	oID CHAR(10),
	tID CHAR(10),
	agID CHAR(10),
	CONSTRAINT pk_Property_pID PRIMARY KEY (pID),
	CONSTRAINT fk_Property_oID FOREIGN KEY (oID)
	REFERENCES [Studomes.Owner](oID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Property_agID FOREIGN KEY (agID)
	REFERENCES [Studomes.Agent](agID)
	ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT fk_Property_tID FOREIGN KEY (tID)
	REFERENCES [Studomes.Type](tID)
	ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE TABLE [Studomes.Lease](
	pID CHAR (10) NOT NULL, 
	cID CHAR (10) NOT NULL, 
	oID CHAR (10) NOT NULL, 
	leaseDuration INTEGER,
	leaseSecurityDeposit INTEGER,
	leaseDate DATE,
	leaseReview VARCHAR(70),
	leaseRating INTEGER,
	CONSTRAINT pk_Lease_pID_cID_oID PRIMARY KEY (pID,oID,cID),
	CONSTRAINT fk_Lease_pID FOREIGN KEY (pID)
	REFERENCES [Studomes.Property](pID)
	ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_Lease_cID FOREIGN KEY (cID)
	REFERENCES [Studomes.Customer](cID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Lease_oID FOREIGN KEY (oID)
	REFERENCES [Studomes.Owner](oID)
	ON DELETE NO ACTION ON UPDATE NO ACTION);
 
    

CREATE TABLE [Studomes.Include](
	pID CHAR(10) NOT NULL, 
	amyID CHAR(3) NOT NULL,
	CONSTRAINT pk_Include_pID_amyID PRIMARY KEY (pID,amyID),
	CONSTRAINT fk_Include_pID FOREIGN KEY (pID)
	REFERENCES [Studomes.Property](pID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Include_amyID FOREIGN KEY (amyID)
	REFERENCES [Studomes.amenity](amyID)
	ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE [Studomes.Apply](
	pID CHAR(10) NOT NULL, 
	cID CHAR(10) NOT NULL, 
	appStartDate DATE, 
	appEndDate DATE
	CONSTRAINT pk_Apply_pID_cID PRIMARY KEY (pID,cID),
	CONSTRAINT fk_Apply_pID FOREIGN KEY (pID)
	REFERENCES [Studomes.Property](pID)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Apply_cID FOREIGN KEY (cID)
	REFERENCES [Studomes.Customer](cID)
	ON DELETE CASCADE ON UPDATE CASCADE);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  �! �T  l�`�   �l�`�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   