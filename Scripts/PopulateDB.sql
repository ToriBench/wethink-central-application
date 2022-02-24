USE WeThinkDB
GO

<<<<<<< HEAD
INSERT INTO [dbo].[Addresses] ([StreetAddress], [City], [Province], [PostalCode], [Country])
=======
TRUNCATE TABLE [dbo].[Addresses]
GO

INSERT INTO [dbo].[Addresses] (StreetAddress, City, Province, PostalCode, Country)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
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

TRUNCATE TABLE [dbo].[Faculties]
GO

INSERT INTO [dbo].[Faculties] ([Name], [Description])
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

<<<<<<< HEAD
INSERT INTO [dbo].[Institutions] ([Name],[ApplicationLink],[AddressID])
=======
TRUNCATE TABLE [dbo].[Institutions]
GO

INSERT INTO [dbo].[Institutions] ([Name],ApplicationLink,AddressID)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
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

<<<<<<< HEAD
INSERT INTO [dbo].[Qualifications]([Name], [NQFLevel])
=======
TRUNCATE TABLE [dbo].[Qualifications]
GO

INSERT INTO [dbo].[Qualifications]([Name], NQFLevel)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
	VALUES ('Higher Certificate', 5),
		('National Diploma', 6),
		('Bachelor''s Degree', 7),
		('Honours Degree', 8),
		('Master''s Degree', 9)
GO

<<<<<<< HEAD
INSERT INTO [dbo].[Courses]([InstitutionID],[FacultyID],[Name],[MonthDuration],[Description],[ApScore], [QualificationID])
=======
TRUNCATE TABLE [dbo].[Courses]
GO

INSERT INTO [dbo].[Courses](InstitutionID,FacultyID,[Name],MonthDuration,[Description],ApScore, QualificationID)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
	VALUES (2,4,'Bachelor of Commerce (Accounting)',36,'Accounting studies',35,3),
		(3,4,'Bachelor of Commerce (Information Systems)',24,'Information Systems studies',35,3),
		(10,4,'Bachelor of Commerce (Politics, Philosophy and Economics)',48,'Politics Philosophy and Economics studies',35,3),
		(7,6,'Bachelor of Commerce with Law',36,'Law studies',35,3),
		(8,5,'LLB Four-year stream',24,'LLB studies',35,3),
		(6,9,'Bachelor of Accounting Science',48,'Accounting Science studies',45,3),
		(1,10,'Bachelor of Economic Science',36,'Economic Science studies',45,3),
		(9,3,'Architecture',24,'Architecture studies',45,2),
		(6,13,'Urban and Regional Planning',12,'Urban and Regional Planning studies',20,2),
		(6,9,'Construction Studies',48,'Construction studies',40,2),
		(1,6,'Medicine',24,'Medicine studies',50,4),
		(7,5,'Nursing',36,'Nursing studies',40,1),
		(3,5,'Occupational Therapy',48,'Occupational Therapy studies',30,1),
		(6,6,'Pharmacy',48,'Pharmacy studies',25,3),
		(10,13,'Physiotherapy',36,'Physiotherapy studies',30,4),
		(1,6,'Digital Arts',36,'Digital Arts studies',50,2),
		(10,2,'Theatre and Performance',36,'Theatre and Performance studies',25,1),
		(3,2,'Film and Television',36,'Film and Television studies',25,1),
		(3,2,'Fine Arts and Music',12,'Fine Arts and Music studies',25,3),
		(6,12,'Foundation Phase Teaching',12,'Foundation Phase Teaching studies',25,2),
		(10,13,'Intermediate Phase Teaching',24,'Intermediate Phase Teaching studies',30,2),
		(4,3,'Social Work',18,'Social studies',30,2),
		(4,1,'BSC Actuarial Sciences',42,'Actuarial Sciences studies',45,4),
		(7,6,'BSC Computational and Applied Mathematics',18,'Computational and Applied Mathematics studies',45,4),
		(1,5,'BSC Computer Science',30,'Computer Science studies',45,3),
		(2,1,'BSC Mathematics',30,'Mathematics studies',45,3),
		(3,2,'BSC Physical Science: Physical Science',48,'Physical Science studies',45,5),
		(4,3,'BSC Chemistry with Chemical Engineering',48,'Chemistry studies',40,5),
		(5,4,'BSC Material Science',30,'Material Science studies',20,3),
		(6,5,'BSC Astronomy and Astrophysics',36,'Astronomy and Astrophysics studies',35,3),
		(7,6,'Biodiversity',36,'Biodiversity studies',50,5),
		(8,7,'Ecology and Conservation',48,'Ecology and Conservation studies',25,5),
		(8,8,'Organismal Biology',48,'Organismal Biology studies',30,4),
		(9,9,'Applied Bioinformatics',46,'Applied Bioinformatics studies',45,3),
		(10,10,'Biochemistry and Cell Biology',36,'Biochemistry studies',30,5)
GO

<<<<<<< HEAD
INSERT INTO [dbo].[UserRoles] ([UserRole])
=======
TRUNCATE TABLE [dbo].[UserRoles]
GO

INSERT INTO [dbo].[UserRoles] (UserRole)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
	VALUES ('Administrator'),
		('Student')
GO

<<<<<<< HEAD
INSERT INTO [dbo].[Users] ([Email],[PasswordHash],[UserRoleID])
=======
TRUNCATE TABLE [dbo].[Users]
GO

INSERT INTO [dbo].[Users] (Email,[PasswordHash],UserRoleID)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
	VALUES ('chuckie@mintdex.com','fvfdv511vsdv168sv515',2),
	('lance@trudo.com','hrthrthgbdfsb61262',2),
	('mjabu@wowwer.com','dhbshgn631b621b6gn1b',2),
	('vchaka@newbary.com','fgngfvbsfgn5152151d51',2),
	('zuess@mintdex.com','aef3a21e5g16123ag1',2),
	('fkruger@trudo.com','sfjtyitj65h1j65151',2),
	('juneb@zoneone.com','ty3r216ethgre6y5j1312',2),
	('ssolomon@mintra.com','vdf32b1d65165b11h51sd',2),
	('wboyd@mintdex.com','jvnsivhbsivbsivhbvn',2),
	('gmensa@trudo.com','pigfjwkvnfoughegoj',2),
	('ubaloyi@wowwer.com','nsvojvjnefvjnojdvn',2),
	('ambrose@newbary.com','ivjierjgsldmvnso',2),
	('yullar@mintdex.com','owurwofhjofhsfkj',2),
	('kbala@trudo.com','vnkjiurhjvnsojghd',2),
	('jambor@zoneone.com','yujtdffjjedvbghjyu',2),
	('zach@babruce.com','yuk326j52yuk62h62',2),
	('judy@hiber.com','tyuiyuegsderyjdf',2),
	('nlilly@mintra.com','yjfgegtjdfbhg',2),
	('mikez@babruce.com','yuk326j52yuk62h62',1),
	('ymanny@hiber.com','xcv621xz6v12x612xc3v1',1)
GO

<<<<<<< HEAD
INSERT INTO [dbo].[Students]([UserID],[AddressID], [FirstName], [LastName])
=======
TRUNCATE TABLE [dbo].[Students]
GO

INSERT INTO [dbo].[Students](UserID,AddressID, FirstName, LastName)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
	VALUES(1,1,'Chuckies','Pride'),
		(2,2,'Lance','Meadow'),
		(3,2,'Mfana','Jabu'),
		(4,3,'Vusi','Chaka'),
		(5,4,'Zuess','Hercules'),
		(6,5,'Freddie','Kruger'),
		(7,6,'Bianca','June'),
		(8,7,'Sunny','Solomon'),
		(9,15,'Wonder','Boyd'),
		(10,11,'Gregory','Mensa'),
		(11,24,'Ursula','Baloyi'),
		(12,19,'Victor','Ambrose'),
		(13,16,'Mathew','Yullar'),
		(14,17,'Koffi','Bala'),
		(15,15,'Rulani','Jambor'),
		(16,22, 'Zachary', 'Henry'),
		(17,19, 'Judy', 'Moncada'),
		(18,20,'Nicole','Lilly')
GO

<<<<<<< HEAD
INSERT INTO [dbo].[Subjects]([Name],[Code])
=======
TRUNCATE TABLE [dbo].[Subjects]
GO

INSERT INTO [dbo].[Subjects]([Name],Code)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
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

<<<<<<< HEAD
INSERT INTO [dbo].[Requirements] ([CourseID],[SubjectID],[MinimumMark])
=======
TRUNCATE TABLE [dbo].[Requirements]
GO

INSERT INTO [dbo].[Requirements] (CourseID,SubjectID,MinimumMark)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
	VALUES (5,29,57),
(32,17,75),
(31,11,72),
(21,16,71),
(12,15,57),
(11,48,75),
(3,3,75),
(19,25,67),
(6,35,64),
(13,24,55),
(9,43,65),
(2,35,76),
(27,8,57),
(25,1,79),
(29,20,63),
(17,31,65),
(34,4,69),
(30,39,76),
(4,38,65),
(6,16,56)
GO

<<<<<<< HEAD
INSERT INTO [dbo].[Results] ([StudentID],[SubjectID],[Mark])
=======
TRUNCATE TABLE [dbo].[Results]
GO

INSERT INTO [dbo].[Results] (StudentID,SubjectID,Mark)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
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
		(7,27,46),
		(8, 25,67),
		(8, 42,79),
		(8, 26,86),
		(8, 48,65),
		(8, 49,84),
		(8, 2,94),
		(8, 30,84),
		(8, 46,93),
		(9, 7,59),
		(9, 8,35),
		(9, 27,35),
		(9, 35,86),
		(9, 42,77),
		(9, 48,84),
		(9, 12,48),
		(9, 26,70),
		(10, 43,40),
		(10, 9,68),
		(10, 49,37),
		(10, 16,87),
		(10, 22,95),
		(10, 35,60),
		(10, 38,81),
		(10, 27,41),
		(11, 3,91),
		(11, 24,56),
		(11, 49,88),
		(11, 40,30),
		(11, 45,72),
		(11, 48,50),
		(11, 12,68),
		(11, 17,70),
		(12, 20,51),
		(12, 30,50),
		(12, 16,63),
		(12, 38,51),
		(12, 19,71),
		(12, 6,47),
		(12, 33,47),
		(12, 42,80),
		(13, 31,90),
		(13, 48,75),
		(13, 15,74),
		(13, 17,52),
		(13, 36,39),
		(13, 21,88),
		(13, 16,64),
		(13, 12,49),
		(14, 33,33),
		(14, 2,38),
		(14, 41,92),
		(14, 30,35),
		(14, 47,41),
		(14, 44,38),
		(14, 21,83),
		(14, 16,74),
		(15, 29,74),
		(15, 42,79),
		(15, 30,55),
		(15, 45,35),
		(15, 48,69),
		(15, 38,53),
		(15, 20,32),
		(15, 21,33),
		(16, 33,86),
		(16, 34,71),
		(16, 26,74),
		(16, 16,62),
		(16, 7,92),
		(16, 14,48),
		(16, 40,57),
		(16, 5,39),
		(17, 34,58),
		(17, 26,84),
		(17, 8,67),
		(17, 48,36),
		(17, 4,49),
		(17, 2,63),
		(17, 11,56),
		(17, 9,35),
		(18, 11,54),
		(18, 28,76),
		(18, 10,55),
		(18, 42,48),
		(18, 49,82),
		(18, 22,52),
		(18, 48,70),
		(18, 12,40)
GO

<<<<<<< HEAD
INSERT INTO [dbo].[StudentSavedCourses]([StudentID], [CourseID])
=======
TRUNCATE TABLE [dbo].[StudentSavedCourses]
GO

INSERT INTO [dbo].[StudentSavedCourses](StudentID, CourseID)
>>>>>>> 77b942e6398cc4a0cdcf57db5aa30fe70508f4ce
	VALUES (1, 12),
		(9, 2),  
		(18, 28),
		(5, 12), 
		(15, 17),
		(8, 24), 
		(1, 20), 
		(17, 13),
		(8, 6),  
		(10, 2), 
		(12, 16),
		(2, 6),  
		(12, 4), 
		(14, 25),
		(12, 30),
		(3, 6),
		(13, 33),
		(8, 17),
		(4, 14),
		(7, 27)
GO