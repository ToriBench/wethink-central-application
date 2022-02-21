/*	USER-ROLES TABLE*/
USE WeThinkDB
GO

CREATE PROCEDURE uspUpdateUserRole
@UserRoleId int,
@UserRole varchar(255)

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[UserRoles]
set UserRole = @UserRole
where UserRoleID = @UserRoleId

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* USERS TABLE*/
CREATE PROCEDURE uspUpdateUser
@UserId int,
@Email varchar(255),
@FirstName varchar(255),
@LastName varchar(255),
@PasswordHash varchar(255),
@UserRoleId int

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Users]
set Email = @Email,
FirstName = @FirstName,
LastName = @LastName,
PasswordHash = @PasswordHash,
UserRoleID = @UserRoleId
where UserID = @UserId

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* SUBJECTS TABLE*/
CREATE PROCEDURE uspUpdateSubject
@SubjectId int,
@Code varchar(255),
@Name varchar(255)

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Subjects]
set Code = @Code,
[Name] = @Name
where SubjectID = @SubjectId

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* STUDENTS TABLE*/

CREATE PROCEDURE uspUpdateStudent
@StudentId int,
@UserId int,
@AddressId int

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Students]
set UserID = @UserId,
AddressID = @AddressId
where StudentID = @StudentId

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* RESULTS TABLE*/

CREATE PROCEDURE uspUpdateResult
@StudentId int,
@SubjectId int,
@Mark int

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Results]
set Mark = @Mark
where StudentID = @StudentId 
AND 
SubjectID = @SubjectId

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* REQUIREMENTS TABLE*/

CREATE PROCEDURE uspUpdateRequirement
@QualificationId int,
@SubjectId int,
@MinimumMark int

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Requirements]
set MinimumMark = @MinimumMark
where QualificationID = @QualificationId 
AND 
SubjectID = @SubjectId

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* Qualifications TABLE */
CREATE PROCEDURE uspUpdateQualification
@QualificationId int,
@InstitutionId int,
@FacultyId int,
@MonthDuration int,
@Name varchar(255),
@Descr varchar(255),
@APScorer int

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Qualifications]
set InstitutionID = @InstitutionId,
FacultyID = @FacultyId,
MonthDuration = @MonthDuration,
[Name] = @Name,
[Description] = @Descr,
AP_Score = @APScorer
where QualificationID = @QualificationId 

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* INSTITUTIONS TABLE */ 
CREATE PROCEDURE uspUpdateInstitution
@InstitutionId int,
@Name varchar(255),
@AddressId int,
@ApplicationLink varchar(255)

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Institutions]
set
[Name] = @Name,
AddressID = @AddressId,
ApplicationLink = @ApplicationLink
where InstitutionID = @InstitutionId 

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* FACULITIES TABLE*/
CREATE PROCEDURE uspUpdateFaculty
@FacultyId int,
@Name varchar(255),
@Descr varchar(255)

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Faculties]
set [Name] = @Name,
[Description] = @Descr
where FacultyID = @FacultyId 

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO

/* ADDRESSES TABLE*/

CREATE PROCEDURE uspUpdateAddress
@AddressID int,
@StreetAddress varchar(255),
@City varchar(255),
@State varchar(255),
@Zip int,
@Country varchar(255)

AS
BEGIN

BEGIN TRANSACTION

update [dbo].[Addresses]
set 
StreetAddress = @StreetAddress,
City = @City,
[State] = @State,
Zip  = @Zip,
Country = @Country
where AddressID = @AddressID 

if @@Error <> 0
begin
ROLLBACK TRANSACTION
return
end
COMMIT TRANSACTION
END
GO
