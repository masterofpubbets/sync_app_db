CREATE PROC sp_addDb
    @dbName NVARCHAR(50),
    @dbDescription NVARCHAR(255),
    @server NVARCHAR(50),
    @tag NVARCHAR(50)

AS
DECLARE @id INT
SELECT @id = dbID
FROM tblDBs
WHERE dbName = @dbName
IF @id IS NULL
    BEGIN
    INSERT INTO tblDBs
        (tagName,dbDescription,serverPath,dbName)
    VALUES(@tag, @dbDescription, @server, @dbName)
END
