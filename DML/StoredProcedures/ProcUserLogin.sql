-- User Login: Gets User Details if Email and Password are matched
USE WeThinkDB
GO

IF OBJECT_ID('uspUserLogin', 'P') IS NOT NULL
	DROP PROCEDURE uspUserLogin
GO

CREATE PROCEDURE uspUserLogin(@email varchar(255), @password varchar(255))
	AS
		SELECT [UserID] AS 'User ID',
			   [UserRoleID] AS 'Role ID'
		FROM [dbo].[Users]
		WHERE [Email] = @email AND [PasswordHash] = @password
GO