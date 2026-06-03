USE master;
GO
IF DB_ID('GROUP_83') IS NOT NULL
BEGIN
    ALTER DATABASE GROUP_83 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE GROUP_83;
END
GO
CREATE DATABASE GROUP_83;
GO
USE GROUP_83;
GO

IF OBJECT_ID('vw_LoanStatusByBorrower', 'V') IS NOT NULL DROP VIEW vw_LoanStatusByBorrower;
IF OBJECT_ID('vw_RepaymentSummary', 'V') IS NOT NULL DROP VIEW vw_RepaymentSummary;
IF OBJECT_ID('vw_OverdueInstallments', 'V') IS NOT NULL DROP VIEW vw_OverdueInstallments;
IF OBJECT_ID('trg_BranchesAudit', 'TR') IS NOT NULL DROP TRIGGER trg_BranchesAudit;
IF OBJECT_ID('sp_InsertRepayment', 'P') IS NOT NULL DROP PROCEDURE sp_InsertRepayment;
IF OBJECT_ID('fn_CalculateEMI', 'FN') IS NOT NULL DROP FUNCTION fn_CalculateEMI;
IF OBJECT_ID('Audit_Branches', 'U') IS NOT NULL DROP TABLE Audit_Branches;
IF OBJECT_ID('Collateral', 'U') IS NOT NULL DROP TABLE Collateral;
IF OBJECT_ID('RepaymentSchedule', 'U') IS NOT NULL DROP TABLE RepaymentSchedule;
IF OBJECT_ID('Repayments', 'U') IS NOT NULL DROP TABLE Repayments;
IF OBJECT_ID('Loans', 'U') IS NOT NULL DROP TABLE Loans;
IF OBJECT_ID('Borrowers', 'U') IS NOT NULL DROP TABLE Borrowers;
IF OBJECT_ID('LoanOfficers', 'U') IS NOT NULL DROP TABLE LoanOfficers;
IF OBJECT_ID('Branches', 'U') IS NOT NULL DROP TABLE Branches;
GO

CREATE TABLE Branches (
    OfficeID INT PRIMARY KEY IDENTITY,
    OfficeName VARCHAR(100) NOT NULL,
    OfficeLocation VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(20) NULL
);

CREATE TABLE LoanOfficers (
    AgentID INT PRIMARY KEY IDENTITY,
    FullName VARCHAR(100) NOT NULL,
    EmailAddress VARCHAR(100) NULL UNIQUE,
    OfficeID INT NOT NULL FOREIGN KEY REFERENCES Branches(OfficeID)
);

CREATE TABLE Borrowers (
    ClientID INT PRIMARY KEY IDENTITY,
    GivenName VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    Sex CHAR(1) NOT NULL CHECK (Sex IN ('M', 'F')),
    DOB DATE NOT NULL,
    MobileNumber VARCHAR(15),
    ResidentialAddress TEXT
);

CREATE TABLE Loans (
    CreditID INT PRIMARY KEY IDENTITY,
    ClientID INT NOT NULL FOREIGN KEY REFERENCES Borrowers(ClientID),
    AgentID INT NOT NULL FOREIGN KEY REFERENCES LoanOfficers(AgentID),
    OfficeID INT NOT NULL FOREIGN KEY REFERENCES Branches(OfficeID),
    PrincipalAmount DECIMAL(18,2) NOT NULL,
    RateOfInterest FLOAT NOT NULL,
    DisbursementDate DATE NOT NULL,
    RepaymentPeriod INT NOT NULL,
    LoanStatus VARCHAR(20) NOT NULL CHECK (LoanStatus IN ('Active', 'Closed', 'Defaulted'))
);

CREATE TABLE Repayments (
    PaymentID INT PRIMARY KEY IDENTITY,
    CreditID INT NOT NULL FOREIGN KEY REFERENCES Loans(CreditID),
    InstallmentDate DATE NOT NULL,
    InstallmentAmount DECIMAL(18,2) NOT NULL,
    ModeOfPayment VARCHAR(20) NOT NULL,
    LoggedBy INT NOT NULL FOREIGN KEY REFERENCES LoanOfficers(AgentID)
);

CREATE TABLE RepaymentSchedule (
    ScheduleID INT PRIMARY KEY IDENTITY,
    CreditID INT NOT NULL FOREIGN KEY REFERENCES Loans(CreditID),
    ScheduledDate DATE NOT NULL,
    ScheduledAmount DECIMAL(18,2) NOT NULL
);

CREATE TABLE Collateral (
    AssetID INT PRIMARY KEY IDENTITY,
    CreditID INT NOT NULL FOREIGN KEY REFERENCES Loans(CreditID),
    AssetType VARCHAR(50) NOT NULL,
    AssetValue DECIMAL(12,2) NOT NULL,
    AssetDescription TEXT NULL
);

PRINT 'Tables created successfully';
GO