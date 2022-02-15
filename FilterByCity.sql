CREATE PROCEDURE FilterByCity
@CityName varchar
AS
SELECT Institutions.[Name] AS 'Institution Name', Qualifications.[Name] AS 'Qualification Name'
FROM Institutions, Qualifications, [Addresses]
WHERE Institutions.AddressID = Addresses.AddressID AND Addresses.City = @CityName;