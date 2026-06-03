# Bank Loan Management System

A SQL-based loan management and analytics platform designed to manage borrowers, loans, repayments, collateral tracking, and risk monitoring. The system demonstrates database design, transactional processing, audit logging, and business analytics using Microsoft SQL Server.

---

## Overview

Financial institutions require reliable systems to manage loans, track repayments, monitor overdue accounts, and maintain audit trails for compliance. This project implements a relational database solution that supports:

* Borrower and loan management
* Repayment tracking
* Collateral management
* Audit logging and compliance monitoring
* Loan performance analytics
* Risk assessment reporting

Developed as part of Advanced Database Management Systems coursework at Arizona State University, this project demonstrates practical database engineering concepts commonly used in banking and financial services.

---

## Entity Relationship Diagram

![ERD](screenshots/erd.png)

---

## Key Features

### Loan Management

* Manage borrower and loan records
* Track active, closed, and defaulted loans
* Associate loans with branches and loan officers

### Repayment Tracking

* Record and monitor repayments
* Maintain repayment schedules
* Analyze repayment performance

### Collateral Management

* Store collateral details
* Track collateral value and type
* Link collateral to loans

### Audit Logging

Database trigger automatically tracks:

* INSERT operations
* UPDATE operations
* DELETE operations

Audit logs capture:

* Event type
* Timestamp
* Previous values
* Updated values
* User information

### Analytics & Reporting

Provides analytical views for:

#### Active Loans by Borrower

Tracks all currently active loans and associated borrowers.

#### Repayment Summary

Aggregates repayment activity to support financial analysis.

#### Overdue Installments

Identifies overdue payments to support proactive risk management.

---

## Advanced SQL Components

### Stored Procedure

`sp_InsertRepayment`

Automates insertion of repayment transactions.

### User Defined Function

`fn_CalculateEMI`

Calculates Equated Monthly Installments (EMI) based on principal amount, interest rate, and repayment period.

### Audit Trigger

`trg_BranchesAudit`

Maintains a complete audit trail of branch table modifications.

### Cursor-Based Risk Analysis

Demonstrates borrower risk identification by detecting customers with multiple loans.

---

## Technologies Used

* Microsoft SQL Server 2022
* T-SQL
* Stored Procedures
* User Defined Functions (UDFs)
* Triggers
* Views
* Cursors

---

## Project Structure

```text
bank-loan-management-system/
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_seed_data.sql
│   ├── 03_views.sql
│   ├── 04_audit_trigger.sql
│   ├── 05_procedure_function.sql
│   └── 06_cursor_demo.sql
│
├── screenshots/
│   └── erd.png
│
├── docs/
│   └── project_report.pdf
│
├── bank_loan_management_system.sql
└── README.md
```

### SQL Modules

| File                      | Purpose                        |
| ------------------------- | ------------------------------ |
| 01_schema.sql             | Database and table definitions |
| 02_seed_data.sql          | Sample data population         |
| 03_views.sql              | Reporting and analytics views  |
| 04_audit_trigger.sql      | Audit logging implementation   |
| 05_procedure_function.sql | Stored procedure and UDF       |
| 06_cursor_demo.sql        | Risk analysis cursor example   |

---

## Sample Business Questions Answered

* Which borrowers currently have active loans?
* Which customers are overdue on repayments?
* How much has each borrower repaid?
* Which borrowers may represent elevated lending risk?
* What is the expected EMI for a specific loan?

---

## Learning Outcomes

This project strengthened practical experience in:

* Relational database design
* SQL query optimization
* Financial data modeling
* Data integrity enforcement
* Audit and compliance mechanisms
* Analytical reporting
* Stored procedures and triggers
* Database programming with T-SQL

---

## Author

**Siva Madheswaran**

M.S. Data Science, Analytics and Engineering
Arizona State University

GitHub: https://github.com/siva-madheswaran
LinkedIn: https://linkedin.com/in/siva-madheswaran-55478a20b
