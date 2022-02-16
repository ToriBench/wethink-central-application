-- User Login: Gets User Details if Email and Password are matched
USE WeThinkDB
GO

IF OBJECT_ID('ProcUserLogin', 'P') IS NOT NULL
	DROP PROCEDURE ProcUserLogin
GO

CREATE PROCEDURE ProcUserLogin(@email varchar(255), @password varchar(255))
	AS
		SELECT UserID AS 'User ID',
			   FirstName AS 'First Name',
			   LastName AS 'Last Name',
			   UserRoleID AS 'Role ID'
		FROM Users
		WHERE Email = @email AND PasswordHash = @password
GO