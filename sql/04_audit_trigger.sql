IF OBJECT_ID('trg_BranchesAudit', 'TR') IS NOT NULL
    DROP TRIGGER trg_BranchesAudit;
GO

IF OBJECT_ID('Audit_Branches', 'U') IS NOT NULL
    DROP TABLE Audit_Branches;
GO

CREATE TABLE Audit_Branches (
    LogID INT PRIMARY KEY IDENTITY,
    OfficeID INT NOT NULL,
    EventType VARCHAR(10) NOT NULL,
    EventTimestamp DATETIME DEFAULT GETDATE(),
    PreviousOfficeName VARCHAR(100),
    UpdatedOfficeName VARCHAR(100),
    ActionPerformedBy VARCHAR(50)
);
GO

CREATE TRIGGER trg_BranchesAudit
ON Branches
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Audit_Branches (OfficeID, EventType, PreviousOfficeName, UpdatedOfficeName, ActionPerformedBy)
        SELECT d.OfficeID, 'UPDATE', d.OfficeName, i.OfficeName, SYSTEM_USER
        FROM inserted i
        JOIN deleted d ON i.OfficeID = d.OfficeID;
    END
    ELSE IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO Audit_Branches (OfficeID, EventType, UpdatedOfficeName, ActionPerformedBy)
        SELECT OfficeID, 'INSERT', OfficeName, SYSTEM_USER FROM inserted;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO Audit_Branches (OfficeID, EventType, PreviousOfficeName, ActionPerformedBy)
        SELECT OfficeID, 'DELETE', OfficeName, SYSTEM_USER FROM deleted;
    END
END;
GO

INSERT INTO Branches (OfficeName, OfficeLocation, PhoneNumber) VALUES ('Test Branch', 'Test City', '9999999999');
UPDATE Branches SET OfficeName = 'Updated Test Branch' WHERE OfficeName = 'Test Branch';
DELETE FROM Branches WHERE OfficeName = 'Updated Test Branch';
SELECT * FROM Audit_Branches;