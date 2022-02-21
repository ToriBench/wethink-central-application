USE WeThinkDB
GO

CREATE VIEW vQualificationsWithRequirements AS
SELECT        dbo.Qualifications.QualificationID, dbo.Requirements.MinimumMark, dbo.Qualifications.MonthDuration, dbo.Subjects.Code, dbo.Subjects.Name, dbo.Institutions.Name AS Institution, dbo.Faculties.Name AS Faculty, 
                         dbo.Institutions.ApplicationLink
FROM            dbo.Qualifications INNER JOIN
                         dbo.Requirements ON dbo.Qualifications.QualificationID = dbo.Requirements.QualificationID AND dbo.Qualifications.QualificationID = dbo.Requirements.QualificationID INNER JOIN
                         dbo.Subjects ON dbo.Requirements.SubjectID = dbo.Subjects.SubjectID AND dbo.Requirements.SubjectID = dbo.Subjects.SubjectID INNER JOIN
                         dbo.Faculties ON dbo.Qualifications.FacultyID = dbo.Faculties.FacultyID AND dbo.Qualifications.FacultyID = dbo.Faculties.FacultyID INNER JOIN
                         dbo.Institutions ON dbo.Qualifications.InstitutionID = dbo.Institutions.InstitutionID AND dbo.Qualifications.InstitutionID = dbo.Institutions.InstitutionID

						 

GO

CREATE VIEW vStudentsWithResults AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.Email, dbo.Subjects.Code AS Subject_Code, dbo.Subjects.Name AS Subject_Name, dbo.Results.Mark
FROM            dbo.Results INNER JOIN
                         dbo.Students ON dbo.Results.StudentID = dbo.Students.StudentID AND dbo.Results.StudentID = dbo.Students.StudentID INNER JOIN
                         dbo.Subjects ON dbo.Results.SubjectID = dbo.Subjects.SubjectID AND dbo.Results.SubjectID = dbo.Subjects.SubjectID INNER JOIN
                         dbo.Users ON dbo.Students.UserID = dbo.Users.UserID

GO

CREATE VIEW vUsersWithRoles AS
SELECT        dbo.Users.FirstName, dbo.Users.LastName, dbo.Users.Email, dbo.UserRoles.UserRole
FROM            dbo.UserRoles INNER JOIN
                         dbo.Users ON dbo.UserRoles.UserRoleID = dbo.Users.UserRoleID AND dbo.UserRoles.UserRoleID = dbo.Users.UserRoleID

GO

CREATE VIEW vInstitutionsWithQualifications AS
SELECT        dbo.Institutions.Name AS Institution_Name, dbo.Faculties.Name AS Faculty_Name, dbo.Qualifications.Name AS Qualification_Name, dbo.Qualifications.AP_Score, dbo.Qualifications.Description AS Qualification_Descr, 
                         dbo.Qualifications.MonthDuration
FROM            dbo.Faculties INNER JOIN
                         dbo.Qualifications ON dbo.Faculties.FacultyID = dbo.Qualifications.FacultyID AND dbo.Faculties.FacultyID = dbo.Qualifications.FacultyID INNER JOIN
                         dbo.Institutions ON dbo.Qualifications.InstitutionID = dbo.Institutions.InstitutionID AND dbo.Qualifications.InstitutionID = dbo.Institutions.InstitutionID
