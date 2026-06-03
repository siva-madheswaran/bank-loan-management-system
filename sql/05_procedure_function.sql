IF OBJECT_ID('sp_InsertRepayment', 'P') IS NOT NULL DROP PROCEDURE sp_InsertRepayment;
IF OBJECT_ID('fn_CalculateEMI', 'FN') IS NOT NULL DROP FUNCTION fn_CalculateEMI;
GO

CREATE PROCEDURE sp_InsertRepayment
    @CreditID INT,
    @InstallmentDate DATE,
    @InstallmentAmount DECIMAL(18,2),
    @ModeOfPayment VARCHAR(20),
    @LoggedBy INT
AS
BEGIN
    INSERT INTO Repayments (CreditID, InstallmentDate, InstallmentAmount, ModeOfPayment, LoggedBy)
    VALUES (@CreditID, @InstallmentDate, @InstallmentAmount, @ModeOfPayment, @LoggedBy);
END;
GO

CREATE FUNCTION fn_CalculateEMI (
    @Principal DECIMAL(18,2),
    @AnnualRate FLOAT,
    @Months INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @MonthlyRate FLOAT = @AnnualRate / 1200.0;
    DECLARE @EMI DECIMAL(18,2);
    SET @EMI = @Principal * @MonthlyRate / (1 - POWER(1 + @MonthlyRate, -@Months));
    RETURN @EMI;
END;
GO

EXEC sp_InsertRepayment 1, '2025-05-01', 450.00, 'Cash', 1;
SELECT * FROM Repayments WHERE CreditID = 1;
SELECT dbo.fn_CalculateEMI(10000, 12.5, 24) AS CalculatedEMI;