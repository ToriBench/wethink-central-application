USE WeThinkDB
GO

INSERT INTO dbo.Addresses(StreetAddress, City, [State], Zip, Country)
	VALUES ('897 Gemsbok St','Pietersburg','Limpopo','0760','South Africa'),
('496 Wit Rd','Johannesburg','Gauteng','2018','South Africa'),
('1666 Robertson Ave','Temba','North West','0499','South Africa'),
('2224 Oranje St','Wesselsbron','Free State','9682','South Africa'),
('168 Gray Pl','Durban','KwaZulu-Natal','4061','South Africa'),
('2338 Gemsbok St','Pietersburg','Limpopo','0742','South Africa'),
('226 First Ave','Madikwe','North West','2845','South Africa'),
('2153 Zigzag Rd','Vereeniging','Gauteng','1936','South Africa'),
('883 Dorp St','Nuweland','Western Cape','7708','South Africa'),
('2459 Robertson Ave','Temba','North West','0502','South Africa'),
('426 Kort St','Kagisanong','Free State','9309','South Africa'),
('820 Gemsbok St','Mashashane','Limpopo','0743','South Africa'),
('1157 Bad St','Eerste River','Western Cape','7105','South Africa'),
('449 Cheriton Dr','Mehlomnyama','KwaZulu-Natal','4246','South Africa'),
('166 Prospect St','Pretoria','Gauteng','0011','South Africa'),
('2252 Kort St','Kakamas','Northern Cape','8870','South Africa'),
('977 Plane St','Butterworth','Eastern Cape','4968','South Africa'),
('1444 Kamp St','Kaapstad','Western Cape','7493','South Africa'),
('1045 President St','Johannesburg','Gauteng','2065','South Africa'),
('1566 Doreen St','Thabazimbi','Limpopo','0383','South Africa'),
('877 Oost St','Nelspruit','Mpumalanga','1202','South Africa'),
('1735 Nelson Mandela Drive','Bochum','Limpopo','0790','South Africa'),
('970 St. John Street','Somerset West','Western Cape','7135','South Africa'),
('1979 Bezuidenhout St','Embalenhle','Mpumalanga','2285','South Africa'),
('2298 Church St','Pretoria','Gauteng','0135','South Africa'),
('256 South St','Mabopane','Gauteng','0219','South Africa')
GO


INSERT INTO dbo.Faculties (Name, Description)
	VALUES ('Political Science','Study of politics'),
('Philosophy','Study of philosophy'),
('Natural Sciences','Study of the natural evironment'),
('Management Studies','Management of business activities'),
('Law','Legal studies'),
('Information Technology','Study of Information Technology'),
('Humanities','Study of humanities'),
('Engineering','Study of the built environment'),
('Education','Study of education'),
('Economics','Study of the economy'),
('Commerce','Study of commerce'),
('Classics','Classical studies'),
('Arts','Study of arts')
GO

INSERT INTO dbo.Institutions([Name],ApplicationLink,AddressID)
	VALUES ('University of South Africa','http://www.usaf.ac.za/','7'),
('University of the Witwatersrand Johannesburg','http://www.wits.ac.za/','8'),
('SACAP (The South African College of Applied Psychology) Pretoria','http://www.sacap.edu.za/','9'),
('University of Pretoria','https://www.up.ac.za/','10'),
('St Augustine College of South Africa','http://www.staugustine.ac.za/','11'),
('SAAAC - SA Academy of Applied Competence','http://www.saaac.co.za/','12'),
('Tshwane University of Technology','http://www.tut.ac.za/',13),
('IIE MSA','https://www.iiemsa.co.za/','14'),
('Technicol SA College','http://www.technicolsa.co.za/','15'),
('South African Defence Intelligence College','https://m.facebook.com/pages/SA-Defence-Intelligence-College/303792933062970','16')
GO

INSERT INTO dbo.Qualifications(InstitutionID,FacultyID,[Name],MonthDuration,[Description],AP_Score)
	VALUES (2,4,'Bachelor of Commerce (Accounting)',36,'Accounting studies',35),
(3,4,'Bachelor of Commerce (Information Systems)',24,'Information Systems studies',35),
(10,4,'Bachelor of Commerce (Politics, Philosophy and Economics)',48,'Politics Philosophy and Economics studies',35),
(7,6,'Bachelor of Commerce with Law',36,'Law studies',35),
(8,5,'LLB Four-year stream',24,'LLB studies',35),
(6,9,'Bachelor of Accounting Science',48,'Accounting Science studies',45),
(1,10,'Bachelor of Economic Science',36,'Economic Science studies',45),
(9,3,'Architecture',24,'Architecture studies',45),
(6,13,'Urban and Regional Planning',12,'Urban and Regional Planning studies',20),
(6,9,'Construction Studies',48,'Construction studies',40),
(1,6,'Medicine',24,'Medicine studies',50),
(7,5,'Nursing',36,'Nursing studies',40),
(3,5,'Occupational Therapy',48,'Occupational Therapy studies',30),
(6,6,'Pharmacy',48,'Pharmacy studies',25),
(10,13,'Physiotherapy',36,'Physiotherapy studies',30),
(1,6,'Digital Arts',36,'Digital Arts studies',50),
(10,2,'Theatre and Performance',36,'Theatre and Performance studies',25),
(3,2,'Film and Television',36,'Film and Television studies',25),
(3,2,'Fine Arts and Music',12,'Fine Arts and Music studies',25),
(6,12,'Foundation Phase Teaching',12,'Foundation Phase Teaching studies',25),
(10,13,'Intermediate Phase Teaching',24,'Intermediate Phase Teaching studies',30),
(4,3,'Social Work',18,'Social studies',30),
(4,1,'BSC Actuarial Sciences',42,'Actuarial Sciences studies',45),
(7,6,'BSC Computational and Applied Mathematics',18,'Computational and Applied Mathematics studies',45),
(1,5,'BSC Computer Science',30,'Computer Science studies',45),
(2,1,'BSC Mathematics',30,'Mathematics studies',45),
(3,2,'BSC Physical Science: Physical Science',48,'Physical Science studies',45),
(4,3,'BSC Chemistry with Chemical Engineering',48,'Chemistry studies',40),
(5,4,'BSC Material Science',30,'Material Science studies',20),
(6,5,'BSC Astronomy and Astrophysics',36,'Astronomy and Astrophysics studies',35),
(7,6,'Biodiversity',36,'Biodiversity studies',50),
(8,7,'Ecology and Conservation',48,'Ecology and Conservation studies',25),
(8,8,'Organismal Biology',48,'Organismal Biology studies',30),
(9,9,'Applied Bioinformatics',46,'Applied Bioinformatics studies',45),
(10,10,'Biochemistry and Cell Biology',36,'Biochemistry studies',30)
GO

INSERT INTO dbo.UserRoles(UserRole)
	VALUES ('Administrator'),
		('Student')
GO

INSERT INTO dbo.Users(Email, FirstName, LastName,[PasswordHash],UserRoleID)
	VALUES ('chuckie@mintdex.com','Chuckies','Pride','fvfdv511vsdv168sv515',2),
	('lance@trudo.com','Lance','Meadow','hrthrthgbdfsb61262',2),
	('mjabu@wowwer.com','Mfana','Jabu','dhbshgn631b621b6gn1b',2),
	('vchaka@newbary.com','Vusi','Chaka','fgngfvbsfgn5152151d51',2),
	('zuess@mintdex.com','Zuess','Hercules','aef3a21e5g16123ag1',2),
	('fkruger@trudo.com','Freddie','Kruger','sfjtyitj65h1j65151',2),
	('juneb@zoneone.com','Bianca','June','ty3r216ethgre6y5j1312',2),
	('mikez@babruce.com','Mike','Zono','yuk326j52yuk62h62',2),
	('ymanny@hiber.com','Yadee','Manny','xcv621xz6v12x612xc3v1',1),
	('ssolomon@mintra.com','Sunny','Solomon','vdf32b1d65165b11h51sd',2)
GO

INSERT INTO dbo.Students(UserID,AddressID)
	VALUES(1,1),
		(2,2),
		(3,2),
		(4,3),
		(5,4),
		(6,5),
		(7,6)
GO

INSERT INTO dbo.Subjects([Name],Code)
	VALUES ('Afrikaans Home Language','13301024'),
('Afrikaans First Additional Language','13311054'),
('English Home Language','13301084'),
('English First Additional Language','13311114'), 
('IsiNdebele Home Language','13301144'), 
('IsiNdebele First Additional Language','13311174'), 
('IsiXhosa Home Language','13301204'),
('IsiXhosa First Additional Language','13311234'), 
('IsiZulu Home Language','13301264'),
('IsiZulu First Additional Language','13311294'), 
('Sepedi Home Language','13301324'),
('Sepedi First Additional Language','13311354'), 
('Sesotho Home Language','13301384'),
('Sesotho First Additional Language','13311414'), 
('Setswana Home Language','13301444'),
('Setswana First Additional Language','13311474'), 
('SiSwati Home Language','13301504'),
('SiSwati First Additional Language','13311534'), 
('Tshivenda Home Language','13301574'),
('Tshivenda First Additional Language','13311604'), 
('Xitsonga Home Language','13301634'),
('Xitsonga First Additional Language','13311664'),
('Mathematical Literacy','19321024'),
('Mathematics','19331054'),
('Life Orientation','16341024'),
('Agricultural Management Practices','10351024'), 
('Agricultural Sciences','10351054'),
('Agricultural Technology','10351084'),
('Dance Studies','11351024'),
('Design','11351054'),
('Dramatic Arts','11351084'), 
('Music','11351114'),
('Visual Arts','11351144'), 
('Accounting','12351024'),
('Business Studies','12351054'), 
('Economics','12351084'),
('Civil Technology','15351024'), 
('Electrical Technology','15351054'), 
('Mechanical Technology','15351084'),
('Engineering Graphics and Design','15351114'),
('Geography','16351054'),
('History','16351084'),
('Computer Applications Technology','19351024'), 
('Information Technology','19351054'),
('Life Sciences','19351084'),
('Physical Sciences','19351114'), 
('Consumer Studies','20351024'),
('Hospitality Studies','20351054'), 
('Tourism','20351084')
GO

INSERT INTO dbo.Requirements(QualificationID,SubjectID,MinimumMark)
	VALUES (5,29,57),
(32,17,75),
(6,11,72),
(3,16,71),
(32,15,57),
(11,48,75),
(3,3,75),
(34,25,67),
(6,35,64),
(13,24,55),
(9,43,65),
(1,35,76),
(34,8,57),
(25,1,79),
(29,20,63),
(17,31,65),
(34,4,69),
(30,39,76),
(4,38,65),
(6,16,56)
GO

INSERT INTO dbo.Results(StudentID,SubjectID,Mark)
	VALUES (1,30,46),
(1,49,36),
(1,18,52),
(1,33,40),
(1,20,49),
(1,45,57),
(1,13,51),
(1,34,46),
(2,21,56),
(2,48,20),
(2,24,64),
(2,46,100),
(2,38,97),
(2,35,86),
(2,5,41),
(2,16,99),
(3,15,53),
(3,25,33),
(3,28,71),
(3,2,92),
(3,6,29),
(3,32,21),
(3,24,87),
(3,31,37),
(4,27,36),
(4,28,55),
(4,18,20),
(4,24,56),
(4,25,68),
(4,20,45),
(4,41,24),
(4,38,47),
(5,14,64),
(5,42,71),
(5,11,97),
(5,19,25),
(5,49,68),
(5,36,97),
(5,18,76),
(5,20,40),
(6,28,91),
(6,2,73),
(6,24,51),
(6,4,63),
(6,37,43),
(6,31,99),
(6,36,63),
(6,46,50),
(7,30,62),
(7,21,76),
(7,32,86),
(7,28,84),
(7,47,50),
(7,40,54),
(7,42,24),
(7,27,46)
GO