INSERT INTO Branches (OfficeName, OfficeLocation, PhoneNumber) VALUES
('Downtown Branch', 'Phoenix, AZ', '0987654321'),
('Central Branch', 'Tempe, AZ', '9876543210'),
('East Valley Branch', 'Mesa, AZ', '8765432109'),
('Southside Office', 'Chandler, AZ', '7654321098'),
('North Hills Branch', 'Scottsdale, AZ', '6543210987'),
('Gateway Branch', 'Gilbert, AZ', '5432109876'),
('Midtown Branch', 'Glendale, AZ', '4321098765'),
('Desert Ridge Branch', 'Peoria, AZ', '3210987654'),
('Heritage Branch', 'Avondale, AZ', '2109876543'),
('Riverbank Office', 'Queen Creek, AZ', '1098765432');

INSERT INTO LoanOfficers (FullName, EmailAddress, OfficeID) VALUES
('Arjun Verma', 'arjun.verma@mail.com', 1),
('Sneha Reddy', 'sneha.reddy@mail.com', 2),
('Rahul Mehta', 'rahul.mehta@mail.com', 3),
('Priya Nair', 'priya.nair@mail.com', 4),
('Amit Sharma', 'amit.sharma@mail.com', 5),
('Neha Kapoor', 'neha.kapoor@mail.com', 6),
('Ravi Iyer', 'ravi.iyer@mail.com', 7),
('Kavya Menon', 'kavya.menon@mail.com', 8),
('Anil Joshi', 'anil.joshi@mail.com', 9),
('Tanvi Deshmukh', 'tanvi.deshmukh@mail.com', 10);

INSERT INTO Borrowers (GivenName, Surname, Sex, DOB, MobileNumber, ResidentialAddress) VALUES
('Apaar', 'Saroj', 'M', '1995-04-12', '1234567890', '7125 E Trent Ave'),
('Siva', 'Madheswaran', 'M', '1993-07-25', '2345678901', '4377 E Haskell St'),
('Sameer', 'Kadi', 'M', '1994-09-18', '3456789012', '7126 E Trent Ave'),
('Ananya', 'Hooda', 'F', '1996-12-01', '4567890123', '382 Ogden Ave'),
('Mugdha', 'Saroj', 'F', '1997-03-14', '5678901234', '74 Ryan Ln'),
('Dhruv', 'Rattan', 'M', '1992-08-09', '6789012345', '241 Paterson Ave'),
('Abhishek', 'Sharma', 'M', '1991-11-22', '7890123456', '895 Central Ave'),
('Yash', 'Yadav', 'M', '1993-06-30', '8901234567', '866 Oak Ave'),
('Neha', 'Mishra', 'F', '1994-10-05', '9012345678', '19 Sunset Blvd'),
('Raj', 'Verma', 'M', '1995-02-20', '9123456789', '67 Hillcrest Dr');

INSERT INTO Loans (ClientID, AgentID, OfficeID, PrincipalAmount, RateOfInterest, DisbursementDate, RepaymentPeriod, LoanStatus)
VALUES
(1, 1, 1, 10673.12, 7.28, '2024-07-11', 36, 'Active'),
(2, 2, 2, 11837.65, 14.44, '2024-09-28', 12, 'Active'),
(3, 3, 3, 3357.57, 9.41, '2024-07-22', 12, 'Defaulted'),
(4, 4, 4, 5645.29, 13.48, '2024-12-12', 12, 'Closed'),
(5, 5, 5, 7083.01, 8.71, '2024-10-21', 36, 'Active'),
(6, 6, 6, 4160.60, 16.32, '2025-01-19', 36, 'Active'),
(7, 7, 7, 9434.74, 17.7, '2025-04-22', 60, 'Closed'),
(8, 8, 8, 12952.86, 13.8, '2024-12-04', 36, 'Active'),
(9, 9, 9, 5400.00, 12.5, '2025-01-15', 24, 'Active'),
(10, 10, 10, 6200.00, 11.0, '2025-01-20', 24, 'Active'),
(1, 1, 1, 4600.00, 9.5, '2025-02-10', 12, 'Active'),
(1, 1, 1, 20689.12, 7.28, '2024-11-11', 36, 'Active'),
(3, 3, 3, 8700.00, 11.2, '2025-02-20', 24, 'Active'),
(4, 4, 4, 10200.00, 10.0, '2025-03-15', 36, 'Active'),
(5, 5, 5, 7600.00, 12.3, '2025-01-25', 18, 'Active'),
(6, 6, 6, 13000.00, 14.0, '2024-11-05', 24, 'Active'),
(7, 7, 7, 4700.00, 8.9, '2025-01-10', 12, 'Closed'),
(8, 8, 8, 5900.00, 9.1, '2025-03-01', 12, 'Active'),
(9, 9, 9, 8000.00, 13.5, '2025-02-22', 24, 'Active'),
(2, 2, 2, 5700.00, 10.5, '2025-02-15', 18, 'Active');

INSERT INTO Repayments (CreditID, InstallmentDate, InstallmentAmount, ModeOfPayment, LoggedBy)
VALUES
(1, '2024-08-10', 391.83, 'Cash', 1),
(1, '2024-09-09', 207.5, 'Transfer', 1),
(2, '2024-10-28', 282.51, 'Transfer', 2),
(2, '2024-11-27', 266.96, 'Cash', 2),
(3, '2024-08-21', 420.94, 'Cash', 3),
(3, '2024-09-20', 403.01, 'Transfer', 3),
(3, '2024-10-20', 467.65, 'Cash', 3),
(4, '2025-01-11', 208.94, 'Cash', 4),
(4, '2025-02-10', 265.59, 'Transfer', 4),
(4, '2025-03-12', 351.61, 'Cash', 4),
(5, '2024-11-20', 394.97, 'Transfer', 5),
(5, '2024-12-20', 363.48, 'Cash', 5),
(6, '2025-02-18', 442.83, 'Transfer', 6),
(6, '2025-03-20', 201.95, 'Cash', 6),
(6, '2025-04-19', 441.75, 'Transfer', 6),
(7, '2025-05-22', 302.08, 'Transfer', 7),
(7, '2025-06-21', 246.64, 'Cash', 7),
(7, '2025-07-21', 487.16, 'Transfer', 7),
(8, '2025-01-03', 268.37, 'Cash', 8),
(8, '2025-02-02', 286.82, 'Transfer', 8);

INSERT INTO RepaymentSchedule (CreditID, ScheduledDate, ScheduledAmount)
VALUES
(1, '2024-08-15', 400.00), (1, '2024-09-15', 400.00), (1, '2024-10-15', 400.00),
(2, '2024-10-01', 500.00), (2, '2024-11-01', 500.00), (2, '2024-12-01', 500.00),
(3, '2024-09-10', 300.00), (3, '2024-10-10', 300.00), (3, '2024-11-10', 300.00), (3, '2024-12-10', 300.00),
(4, '2024-12-05', 475.00), (4, '2025-01-05', 475.00), (4, '2025-02-05', 475.00), (4, '2025-03-05', 475.00),
(5, '2024-11-20', 600.00), (5, '2024-12-20', 600.00), (5, '2025-01-20', 600.00), (5, '2025-02-20', 600.00),
(5, '2025-03-20', 600.00), (5, '2025-04-20', 600.00);

INSERT INTO Collateral (CreditID, AssetType, AssetValue, AssetDescription)
VALUES
(1, 'Land Deed', 150000.00, '0.5 acre plot in rural Kansas'),
(2, 'Gold', 80000.00, '22k gold jewelry: bracelet and necklace'),
(3, 'Vehicle', 300000.00, '2018 Ford Escape - clear title'),
(4, 'Fixed Deposit', 100000.00, '3-year CD at Bank of America'),
(5, 'Insurance Policy', 120000.00, 'Whole life insurance from State Farm'),
(6, 'Property', 400000.00, '2-bedroom condo in suburban Denver'),
(7, 'Machinery', 250000.00, 'Commercial sewing machine for tailoring business'),
(8, 'Electronics', 50000.00, 'MacBook Pro and HP LaserJet printer'),
(9, 'Mutual Fund', 90000.00, 'Vanguard Growth Fund - taxable account'),
(10, 'Livestock', 30000.00, 'Two dairy cows on farm near Ohio border'),
(11, 'Jewelry', 75000.00, 'Gold earrings and diamond ring'),
(12, 'Real Estate', 500000.00, '3-bedroom home in Tucson'),
(13, 'Bonds', 60000.00, 'Government savings bonds'),
(14, 'Antique', 45000.00, '19th-century collectible painting'),
(15, 'Savings Account', 55000.00, 'Wells Fargo high-yield account'),
(16, 'Farm Equipment', 120000.00, 'Irrigation system and plow'),
(17, 'Mobile Home', 85000.00, '2-bed mobile home in rural area'),
(18, 'Commercial Vehicle', 90000.00, 'Used delivery van - Ford Transit'),
(19, 'Art', 30000.00, 'Sculpture and sketches by local artist'),
(20, 'Business Inventory', 95000.00, 'Clothing stock for retail store');