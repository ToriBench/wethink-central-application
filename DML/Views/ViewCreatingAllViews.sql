USE WeThinkDB
GO

CREATE VIEW vCoursesWithRequirements AS
SELECT        dbo.Courses.CourseID, dbo.Requirements.MinimumMark, dbo.Courses.MonthDuration, dbo.Subjects.Code, dbo.Subjects.Name, dbo.Institutions.Name AS Institution, dbo.Faculties.Name AS Faculty, 
                         dbo.Institutions.ApplicationLink
FROM            dbo.Courses INNER JOIN
                         dbo.Requirements ON dbo.Courses.CourseID = dbo.Requirements.CourseID AND dbo.Courses.CourseID = dbo.Requirements.CourseID INNER JOIN
                         dbo.Subjects ON dbo.Requirements.SubjectID = dbo.Subjects.SubjectID AND dbo.Requirements.SubjectID = dbo.Subjects.SubjectID INNER JOIN
                         dbo.Faculties ON dbo.Courses.FacultyID = dbo.Faculties.FacultyID AND dbo.Courses.FacultyID = dbo.Faculties.FacultyID INNER JOIN
                         dbo.Institutions ON dbo.Courses.InstitutionID = dbo.Institutions.InstitutionID AND dbo.Courses.InstitutionID = dbo.Institutions.InstitutionID

						 

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

CREATE VIEW vInstitutionsWithCourses AS
SELECT        dbo.Institutions.Name AS Institution_Name, dbo.Faculties.Name AS Faculty_Name, dbo.Courses.Name AS Qualification_Name, dbo.Courses.APScore, dbo.Courses.Description AS Qualification_Descr, 
                         dbo.Courses.MonthDuration
FROM            dbo.Faculties INNER JOIN
                         dbo.Courses ON dbo.Faculties.FacultyID = dbo.Courses.FacultyID AND dbo.Faculties.FacultyID = dbo.Courses.FacultyID INNER JOIN
                         dbo.Institutions ON dbo.Courses.InstitutionID = dbo.Institutions.InstitutionID AND dbo.Courses.InstitutionID = dbo.Institutions.InstitutionID
