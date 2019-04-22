-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-04-20 19:40:18.782

-- foreign keys
ALTER TABLE LoanDetailsStaging DROP CONSTRAINT AdminUserValidation_LoanDetailsStaging;

ALTER TABLE LoanDetails DROP CONSTRAINT BankDetails_LoanDetails;

ALTER TABLE ContributorTransactionDetails DROP CONSTRAINT ContributorTransactionDetails_LoanDetails;

ALTER TABLE ContributorTransactionDetails DROP CONSTRAINT ContributorTransactionDetails_TransactionStatus;

ALTER TABLE ContributorUserAmountDetails DROP CONSTRAINT ContributorUserAmountDetails_ContributorUserAccountDetails;

ALTER TABLE LoanAmountDetails DROP CONSTRAINT LoanAmountDetails_LoanDetails;

ALTER TABLE LoanDetailsHistory DROP CONSTRAINT LoanDetailsHistory_LoanDetails;

ALTER TABLE RejectedLoanDetailsStaging DROP CONSTRAINT LoanDetailsStaging_RejectedLoanDetailsStaging;

ALTER TABLE LoanDetails DROP CONSTRAINT LoanDetails_LoanStatus;

ALTER TABLE ContributorUserAccountSessionDetails DROP CONSTRAINT SessionDetails_AccountDetails;

ALTER TABLE ContributorTransactionDetails DROP CONSTRAINT TransactionDetails_UserAccountSessionDetails;

-- tables
DROP TABLE AdminUserValidation;

DROP TABLE BankDetails;

DROP TABLE ContributorTransactionDetails;

DROP TABLE ContributorUserAccountDetails;

DROP TABLE ContributorUserAccountSessionDetails;

DROP TABLE ContributorUserAmountDetails;

DROP TABLE LoanAmountDetails;

DROP TABLE LoanDetails;

DROP TABLE LoanDetailsHistory;

DROP TABLE LoanDetailsStaging;

DROP TABLE LoanStatus;

DROP TABLE RejectedLoanDetailsStaging;

DROP TABLE TransactionStatus;

-- End of file.

