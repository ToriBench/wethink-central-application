-- User Login: Gets User Details if Email and Password are matched
USE WeThinkDB
GO

IF OBJECT_ID('[dbo].[uspUserLogin]') IS NOT NULL
	DROP PROCEDURE [dbo].[uspUserLogin]
GO

CREATE PROCEDURE uspUserLogin(@Email varchar(255), @Email varchar(255))
	AS
		SELECT [UserID] AS 'User ID',
			   [UserRoleID] AS 'Role ID'
		FROM [dbo].[Users]
		WHERE [Email] = @Email AND [PasswordHash] = @Email
GO