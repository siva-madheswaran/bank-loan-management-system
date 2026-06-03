CREATE VIEW vw_LoanStatusByBorrower AS
SELECT b.GivenName + ' ' + b.Surname AS BorrowerName, l.CreditID, l.PrincipalAmount, l.LoanStatus
FROM Loans l
JOIN Borrowers b ON l.ClientID = b.ClientID
WHERE l.LoanStatus = 'Active';
GO

CREATE VIEW vw_RepaymentSummary AS
SELECT b.GivenName + ' ' + b.Surname AS BorrowerName, SUM(r.InstallmentAmount) AS TotalRepaid
FROM Repayments r
JOIN Loans l ON r.CreditID = l.CreditID
JOIN Borrowers b ON l.ClientID = b.ClientID
WHERE r.ModeOfPayment = 'Cash'
GROUP BY b.GivenName, b.Surname;
GO

CREATE VIEW vw_OverdueInstallments AS
SELECT rs.CreditID, rs.ScheduledDate, rs.ScheduledAmount, b.GivenName + ' ' + b.Surname AS BorrowerName
FROM RepaymentSchedule rs
JOIN Loans l ON rs.CreditID = l.CreditID
JOIN Borrowers b ON l.ClientID = b.ClientID
WHERE rs.ScheduledDate < GETDATE();
GO

PRINT 'View: vw_LoanStatusByBorrower:'
SELECT * FROM vw_LoanStatusByBorrower;

PRINT 'View: vw_RepaymentSummary:'
SELECT * FROM vw_RepaymentSummary;

PRINT 'View: vw_OverdueInstallments:'
SELECT * FROM vw_OverdueInstallments;