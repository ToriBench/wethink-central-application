
CREATE VIEW Qualification_with_Requirements AS
SELECT        dbo.Qualification.QualificationID, dbo.Requirements.MinimumMark, dbo.Qualification.MonthDuration, dbo.Subjects.Code, dbo.Subjects.Name, dbo.Institutions.Name AS Institution, dbo.Faculty.Name AS Faculty, 
                         dbo.Institutions.ApplicationLink
FROM            dbo.Qualification INNER JOIN
                         dbo.Requirements ON dbo.Qualification.QualificationID = dbo.Requirements.QualificationID AND dbo.Qualification.QualificationID = dbo.Requirements.QualificationID INNER JOIN
                         dbo.Subjects ON dbo.Requirements.SubjectID = dbo.Subjects.SubjectID AND dbo.Requirements.SubjectID = dbo.Subjects.SubjectID INNER JOIN
                         dbo.Faculty ON dbo.Qualification.FacultyID = dbo.Faculty.FacultyID AND dbo.Qualification.FacultyID = dbo.Faculty.FacultyID INNER JOIN
                         dbo.Institutions ON dbo.Qualification.InstitutionID = dbo.Institutions.InstitutionID AND dbo.Qualification.InstitutionID = dbo.Institutions.InstitutionID

						 

GO
CREATE VIEW Student_with_Results AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.Email, dbo.Subjects.Code AS Subject_Code, dbo.Subjects.Name AS Subject_Name, dbo.Results.Mark
FROM            dbo.Results INNER JOIN
                         dbo.Students ON dbo.Results.StudentID = dbo.Students.StudentID AND dbo.Results.StudentID = dbo.Students.StudentID INNER JOIN
                         dbo.Subjects ON dbo.Results.SubjectID = dbo.Subjects.SubjectID AND dbo.Results.SubjectID = dbo.Subjects.SubjectID INNER JOIN
                         dbo.Users ON dbo.Students.UserID = dbo.Users.UserID

GO
CREATE VIEW Users_with_Roles AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.Email, dbo.UserRoles.UserRole
FROM            dbo.UserRoles INNER JOIN
                         dbo.Users ON dbo.UserRoles.UserRoleID = dbo.Users.UserRoleID AND dbo.UserRoles.UserRoleID = dbo.Users.UserRoleID

GO
CREATE VIEW Institution_with_Qualifications AS
SELECT        dbo.Institutions.Name AS Institution_Name, dbo.Faculty.Name AS Faculty_Name, dbo.Qualification.Name AS Qualification_Name, dbo.Qualification.AP_Score, dbo.Qualification.Description AS Qualification_Descr, 
                         dbo.Qualification.MonthDuration
FROM            dbo.Faculty INNER JOIN
                         dbo.Qualification ON dbo.Faculty.FacultyID = dbo.Qualification.FacultyID AND dbo.Faculty.FacultyID = dbo.Qualification.FacultyID INNER JOIN
                         dbo.Institutions ON dbo.Qualification.InstitutionID = dbo.Institutions.InstitutionID AND dbo.Qualification.InstitutionID = dbo.Institutions.InstitutionID
