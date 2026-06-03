DECLARE @ClientID INT, @GivenName VARCHAR(50), @CreditCount INT;
DECLARE cur_HighRiskBorrowers CURSOR FOR
SELECT b.ClientID, b.GivenName, COUNT(l.CreditID) AS LoanCount
FROM Borrowers b
JOIN Loans l ON b.ClientID = l.ClientID
GROUP BY b.ClientID, b.GivenName;

OPEN cur_HighRiskBorrowers;
FETCH NEXT FROM cur_HighRiskBorrowers INTO @ClientID, @GivenName, @CreditCount;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF @CreditCount > 2
        PRINT 'Borrower ' + @GivenName + ' (ClientID: ' + CAST(@ClientID AS VARCHAR) + ') has multiple loans and may be high risk.';
    ELSE
        PRINT 'Borrower ' + @GivenName + ' (ClientID: ' + CAST(@ClientID AS VARCHAR) + ') has a normal loan count.';

    FETCH NEXT FROM cur_HighRiskBorrowers INTO @ClientID, @GivenName, @CreditCount;
END

CLOSE cur_HighRiskBorrowers;
DEALLOCATE cur_HighRiskBorrowers;
GO