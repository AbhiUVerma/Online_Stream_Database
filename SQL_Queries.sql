use entertainmentnownew;


create table Subscriptiondetails
(	
		SubscriptionID INT not null,
		CustomerID varchar(20) not null,
		SubscriptionStartDate Date not null,
		Total_Used_Days varchar(20),
		SubscriptionType varchar(20), 
		SubscriptionStatus varchar(20),
		Price int not null,
		constraint pk_SubsinfoChildTable primary key (SubscriptionID),
		 constraint fk_userinformation11 foreign key (CustomerID) references userinformation (CustomerID) 
);


CREATE TABLE userinformation 
(
		  Customerid int  NOT NULL,
		  Name varchar(255) default NULL,
		  UserPhoneNumber varchar(100) default NULL,
		  UserAddress varchar(255) default NULL,
		  UserEmail varchar(255) default NULL,
		  City varchar(255),
		  constraint pk_userinfo primary key (Customerid)
		 
)	;



create table Subscriptiondet
(	
		CustomerID varchar(20) not null,
		SubscriptionStartDate Date not null,
		Total_Used_Days varchar(20),
		SubscriptionType varchar(20), 
		SubscriptionStatus varchar(20),
		Price int not null,
		constraint pk_SubsinfoParentTable primary key (CustomerID)
);


create table MoviesDATA
(	
		MovieID varchar(10) not null,
		SubscriptionID INT NOT NULL,
		MovieName varchar(50) not null,
		ReleaseDate Date not null,
		Releaseday varchar(20),
		Genre1 varchar(20), 
		Genre2 varchar(20),
		Productionhouse varchar(50),
		Budget int,
		Likes INT,
		Dislikes INT,
		IMDBRating decimal(5,2),
		Cat_IMDBRating varchar(20),
		constraint pk_MovieInfo primary key (MovieID),
		constraint fk_Subscriptiondetails1 foreign key (SubscriptionID) references Subscriptiondetails (SubscriptionID) 

);


create table PlayInformation
(	 
			MovieID varchar(20) not null,
			Customerid int not null,
			PlayedDate Date not null,
			PlayedTIme Time not null,
			constraint pk_PlayInfo primary key (MovieID),
			constraint fk_userinformation foreign key (Customerid) references userinformation (Customerid) 

);


/* Create procedure to calculate Total_Used_Days, SubscriptionType, SubscriptionStatus, */

DROP PROCEDURE IF EXISTS SubscriptionProcedure ;
DELIMITER //
CREATE PROCEDURE SubscriptionProcedure()

BEGIN

		DECLARE Row_Count INT;
		DECLARE SubscriptionID_1 INT; 
		Declare Customerid_v varchar(20);
		Declare SubscriptionStartDate_v Date;
		DECLARE Total_Used_Days_v varchar(20);
		Declare SubscriptionType_v varchar(20); 
		Declare SubscriptionStatus_v varchar(20);
		DECLARE Price_v int;

			DECLARE cur1 Cursor for SELECT 
			Customerid,
			SubscriptionStartDate,
			Total_Used_Days,
			SubscriptionType, 
			SubscriptionStatus,
			Price 
			   
			
			FROM Subscriptiondet;
			
	
				OPEN cur1;
				SET SubscriptionID_1=0;

				SELECT FOUND_ROWS() INTO Row_Count;

				loop1: LOOP
					FETCH cur1 INTO Customerid_v,SubscriptionStartDate_v,Total_Used_Days_v,SubscriptionType_v,SubscriptionStatus_v,Price_v;
					
			
					SET Total_Used_Days_v=0;
					SET SubscriptionType_v=0;
					SET SubscriptionStatus_v=0;

				
					SET Total_Used_Days_v = DATEDIFF(CURDATE(),SubscriptionStartDate_v);
					

					IF Total_Used_Days_v > 14 THEN 
					set SubscriptionType_v = "Deactivate" ;
					ELSE set SubscriptionType_v = "Activate";
					END IF;

					IF SubscriptionType_v  = "Deactivate" THEN 
					set SubscriptionStatus_v = "Payment Reqired"; 
					ELSE set SubscriptionStatus_v = "Free Trail";
					END IF;
					

					SET SubscriptionID_1 = SubscriptionID_1+1;

					INSERT INTO Subscriptiondetails(SubscriptionID, Customerid, SubscriptionStartDate,Total_Used_Days, SubscriptionType, SubscriptionStatus, Price)
					VALUES (SubscriptionID_1,Customerid_v,SubscriptionStartDate_v, Total_Used_Days_v,SubscriptionType_v,SubscriptionStatus_v,Price_v);

					IF Row_Count = SubscriptionID_1 THEN
						LEAVE loop1;
					END IF;

				END LOOP;

				CLOSE cur1 ;

				SELECT * FROM Subscriptiondetails;
			END //
DELIMITER ;



-- Task 1: 


select userinformation.CustomerID, 
		MoviesDATA.Genre1,
		userinformation.Name,
		userinformation.UserPhoneNumber from  userinformation 
JOIN  Subscriptiondetails on Subscriptiondetails.Customerid = userinformation.Customerid
JOIN MoviesDATA on MoviesDATA.SubscriptionID = Subscriptiondetails.SubscriptionID
where Name = "Scotty";


-- Task 2: 

select userinformation.CustomerID, 
		userinformation.Name,
		MoviesDATA.MovieID,
		MoviesDATA.Genre1,
		MoviesDATA.MovieName,
		MoviesDATA.Cat_IMDBRating
		 from  userinformation 
JOIN  Subscriptiondetails on Subscriptiondetails.Customerid = userinformation.Customerid
JOIN MoviesDATA on MoviesDATA.SubscriptionID = Subscriptiondetails.SubscriptionID
where MoviesDATA.Cat_IMDBRating = "Below Average";


select userinformation.CustomerID, 
		userinformation.Name,
		MoviesDATA.MovieID,
		MoviesDATA.Genre1,
		MoviesDATA.MovieName,
		MoviesDATA.Cat_IMDBRating
		 from  userinformation 

JOIN  Subscriptiondetails on Subscriptiondetails.Customerid = userinformation.Customerid
JOIN MoviesDATA on MoviesDATA.SubscriptionID = Subscriptiondetails.SubscriptionID
where MoviesDATA.Cat_IMDBRating = "Good";


-- Task 3: 


select userinformation.CustomerID, 
		userinformation.Name,
		MoviesDATA.MovieID,
		MoviesDATA.Genre1,
		MoviesDATA.MovieName,
		PlayInformation.PlayedDate,
		PlayInformation.PlayedTIme
		 from  userinformation 
JOIN  Subscriptiondetails on Subscriptiondetails.Customerid = userinformation.Customerid
JOIN MoviesDATA on MoviesDATA.SubscriptionID = Subscriptiondetails.SubscriptionID
JOIN PlayInformation on PlayInformation.Customerid = userinformation.Customerid
where Name = "Scotty" and PlayInformation.PlayedDate between "2017-10-02" and "2017-10-10";



-- Task 4:

select Customerid,Name,City from userinformation;

-- Task 5: 

select userinformation.CustomerID, 
		userinformation.Name,
		Subscriptiondetails.SubscriptionStartDate,
		Subscriptiondetails.Total_Used_Days,
		Subscriptiondetails.SubscriptionType,
Subscriptiondetails.SubscriptionStatus
	 	from  userinformation 
JOIN  Subscriptiondetails on Subscriptiondetails.Customerid = userinformation.Customerid
where Subscriptiondetails.SubscriptionType = "Deactivate";


select userinformation.CustomerID, 
		userinformation.Name,
		Subscriptiondetails.SubscriptionStartDate,
		Subscriptiondetails.Total_Used_Days,
		Subscriptiondetails.SubscriptionType,
Subscriptiondetails.SubscriptionStatus
	 	from  userinformation 
JOIN  Subscriptiondetails on Subscriptiondetails.Customerid = userinformation.Customerid
where Subscriptiondetails.SubscriptionType = "Activate";



-- Task 6: 


select * from userinformation where City = "Newyork City";


-- Task 7:

select * from userinformation;



-- Task 8:

-- Create above mentioned store procedure


