Alter PROC sp_addJob
    @jobName NVARCHAR(50),
    @jobDescription NVARCHAR(255),
    @startTime TIME,
    @active BIT,
    @targetDbID INT

AS
DECLARE @id INT
SELECT @id = jobID
FROM tblJobs
WHERE jobName = @jobName
IF @id IS NULL
    BEGIN
        INSERT INTO tblJobs (jobName,jobDescription,startTime,active)
        VALUES(@jobName,@jobDescription,@startTime,@active)
    END
