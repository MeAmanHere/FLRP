-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-04-20 19:40:18.782

-- tables
-- Table: AdminUserValidation
CREATE TABLE AdminUserValidation (
    AdminUserValidationId int  NOT NULL IDENTITY(1, 1),
    AdminUserName varchar(15)  NOT NULL,
    AdminUserPassword varchar(15)  NOT NULL,
    AdminContactEmailId varchar(40)  NOT NULL,
    CurrentYN char(1)  NOT NULL DEFAULT 'Y',
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    UpdatedBy varchar(20)  NULL,
    UpdatedOn datetime2(3)  NULL,
    CONSTRAINT AdminUserValidation_pk PRIMARY KEY  (AdminUserValidationId)
);

-- Table: BankDetails
CREATE TABLE BankDetails (
    BankDetailId bigint  NOT NULL IDENTITY(1, 1),
    BankName varchar(60)  NOT NULL,
    IfscCode varchar(20)  NOT NULL,
    BankBranch varchar(100)  NOT NULL,
    BankAddress varchar(250)  NULL,
    BankCity varchar(60)  NULL,
    BankDistrict varchar(60)  NULL,
    BankState varchar(30)  NULL,
    IsActive char(1)  NOT NULL DEFAULT 'Y',
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    UpdatedBy varchar(20)  NULL,
    UpdatedOn datetime2(3)  NULL,
    CONSTRAINT BankDetails_IfscCode UNIQUE (IfscCode),
    CONSTRAINT BankDetailId  PRIMARY KEY  (BankDetailId)
);

-- Table: ContributorTransactionDetails
CREATE TABLE ContributorTransactionDetails (
    ContributorTransactionDetailId bigint  NOT NULL IDENTITY(1, 1),
    ContributorUserAccountSessionDetailId bigint  NOT NULL,
    LoanDetailId bigint  NOT NULL,
    AmountContributed decimal(20,2)  NOT NULL,
    TransactionNumber varchar(20)  NOT NULL,
    TransactionStatusId int  NOT NULL,
    TransactionDateTime datetime2(5)  NOT NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    CONSTRAINT ContributorTransactionDetails_ak_1 UNIQUE (TransactionNumber),
    CONSTRAINT ContributorTransactionDetails_pk PRIMARY KEY  (ContributorTransactionDetailId)
);

-- Table: ContributorUserAccountDetails
CREATE TABLE ContributorUserAccountDetails (
    ContributorUserAccountDetailID bigint  NOT NULL IDENTITY(1, 1),
    FirstName varchar(20)  NULL,
    LastName varchar(20)  NULL,
    FullName varchar(40)  NULL,
    UserName varchar(30)  NULL,
    Gender varchar(15)  NULL,
    Email varchar(50)  NULL,
    CountryCode char(4)  NULL,
    MobileNumber varchar(10)  NULL,
    Country varchar(20)  NULL,
    IsAccountVerfied char(1)  NOT NULL DEFAULT 'N',
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    UpdatedBy varchar(20)  NULL,
    UpdatedOn datetime2(3)  NULL,
    CONSTRAINT ContributorUserAccountDetails_ak_1 UNIQUE (UserName),
    CONSTRAINT ContributorUserAccountDetails_ak_2 UNIQUE (Email),
    CONSTRAINT ContributorUserAccountDetails_ak_3 UNIQUE (MobileNumber),
    CONSTRAINT ContributorUserAccountDetails_pk PRIMARY KEY  (ContributorUserAccountDetailID)
);

-- Table: ContributorUserAccountSessionDetails
CREATE TABLE ContributorUserAccountSessionDetails (
    ContributorUserAccountSessionDetailId bigint  NOT NULL IDENTITY(1, 1),
    ContributorUserAccountDetailId bigint  NOT NULL,
    SessionStartDateTime datetime2(5)  NOT NULL,
    SessionEndDateTime datetime2(5)  NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    CONSTRAINT ContributorUserAccountSessionDetails_pk PRIMARY KEY  (ContributorUserAccountSessionDetailId)
);

-- Table: ContributorUserAmountDetails
CREATE TABLE ContributorUserAmountDetails (
    ContributorUserAmountDetailId bigint  NOT NULL IDENTITY(1, 1),
    ContributorUserAccountDetailId bigint  NOT NULL,
    TotalAmountContributed decimal(20,2)  NOT NULL,
    LastContributedAmount decimal(20,2)  NOT NULL,
    LastSessionStartDateTime datetime2(5)  NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    UpdatedBy varchar(20)  NULL,
    UpdatedOn datetime2(3)  NULL,
    CONSTRAINT ContributorUserAmountDetails_ak_1 UNIQUE (ContributorUserAccountDetailId),
    CONSTRAINT ContributorUserAmountDetails_pk PRIMARY KEY  (ContributorUserAmountDetailId)
);

-- Table: LoanAmountDetails
CREATE TABLE LoanAmountDetails (
    LoanAmountDetailId bigint  NOT NULL IDENTITY(1, 1),
    LoanDetailId bigint  NOT NULL,
    TotalLoanAmount decimal(24,2)  NOT NULL,
    AmountPaid decimal(24,2)  NOT NULL,
    RemainingAmount decimal(24,2)  NOT NULL,
    IsActive char(1)  NOT NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    UpdatedBy varchar(20)  NULL,
    UpdatedOn datetime2(3)  NULL,
    CONSTRAINT LoanAmountDetails_pk PRIMARY KEY  (LoanAmountDetailId)
);

-- Table: LoanDetails
CREATE TABLE LoanDetails (
    LoanDetailId bigint  NOT NULL IDENTITY(1, 1),
    BankDetailId bigint  NOT NULL,
    LoanAccountNumber numeric(20,0)  NOT NULL,
    BeneficiaryName varchar(35)  NOT NULL,
    LoanOpenDateTime datetime2(0)  NOT NULL,
    LoanStatusId int  NOT NULL,
    LoanClosedDateTime datetime2(0)  NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    UpdatedBy varchar(20)  NULL,
    UpdatedOn datetime2(3)  NULL,
    CONSTRAINT LoanDetails_pk PRIMARY KEY  (LoanDetailId)
);

-- Table: LoanDetailsHistory
CREATE TABLE LoanDetailsHistory (
    LoanDetailHistoryId bigint  NOT NULL IDENTITY(1, 1),
    LoanDetailId bigint  NOT NULL,
    BankDetailId bigint  NOT NULL,
    LoanAccountNumber numeric(20,0)  NOT NULL,
    BeneficiaryName varchar(35)  NOT NULL,
    LoanOpenDateTime datetime2(0)  NOT NULL,
    LoanStatusID int  NOT NULL,
    LoanClosedDateTime datetime2(0)  NOT NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    CONSTRAINT LoanDetailsHistory_LoanDetailId UNIQUE (LoanDetailId),
    CONSTRAINT LoanDetailsHistory_pk PRIMARY KEY  (LoanDetailHistoryId)
);

-- Table: LoanDetailsStaging
CREATE TABLE LoanDetailsStaging (
    LoanDetailsStagngId bigint  NOT NULL IDENTITY(1, 1),
    AdminUserId int  NOT NULL,
    BankName nvarchar(max)  NOT NULL,
    IfscCode nvarchar(max)  NOT NULL,
    LoanAccountNumber nvarchar(max)  NOT NULL,
    BeneficiaryName nvarchar(max)  NOT NULL,
    LoanOpenDateTime nvarchar(max)  NOT NULL,
    TotalLoanAmount nvarchar(max)  NOT NULL,
    AmountPaid nvarchar(max)  NOT NULL,
    RemainingAmount nvarchar(max)  NOT NULL,
    LoanStatus nvarchar(max)  NOT NULL,
    RecordProcessed char(1)  NOT NULL DEFAULT 'N',
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    CONSTRAINT LoanDetailsStaging_pk PRIMARY KEY  (LoanDetailsStagngId)
);

-- Table: LoanStatus
CREATE TABLE LoanStatus (
    LoanStatusId int  NOT NULL IDENTITY(1, 1),
    LoanStatusType varchar(20)  NOT NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    CONSTRAINT LoanStatus_pk PRIMARY KEY  (LoanStatusId)
);

-- Table: RejectedLoanDetailsStaging
CREATE TABLE RejectedLoanDetailsStaging (
    RejectedLoanDetailsStagngId bigint  NOT NULL IDENTITY(1, 1),
    LoanDetailStagingId bigint  NOT NULL,
    AdminUserId int  NOT NULL,
    BankName nvarchar(max)  NOT NULL,
    IfscCode nvarchar(max)  NOT NULL,
    LoanAccountNumber nvarchar(max)  NOT NULL,
    BeneficiaryName nvarchar(max)  NOT NULL,
    LoanOpenDateTime nvarchar(max)  NOT NULL,
    TotalLoanAmount nvarchar(max)  NOT NULL,
    AmountPaid nvarchar(max)  NOT NULL,
    RemainingAmount nvarchar(max)  NOT NULL,
    LoanStatus nvarchar(max)  NOT NULL,
    IsProcessed char(1)  NOT NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    UpdatedBy varchar(20)  NULL,
    UpdatedOn datetime2(3)  NULL,
    CONSTRAINT RejectedLoanDetailsStaging_pk PRIMARY KEY  (RejectedLoanDetailsStagngId)
);

-- Table: TransactionStatus
CREATE TABLE TransactionStatus (
    TransactionStatusId int  NOT NULL IDENTITY(1, 1),
    TransactionStatusType varchar(20)  NOT NULL,
    CreatedBy varchar(20)  NOT NULL,
    CreatedOn datetime2(3)  NOT NULL,
    CONSTRAINT TransactionStatus_pk PRIMARY KEY  (TransactionStatusId)
);

-- foreign keys
-- Reference: AdminUserValidation_LoanDetailsStaging (table: LoanDetailsStaging)
ALTER TABLE LoanDetailsStaging ADD CONSTRAINT AdminUserValidation_LoanDetailsStaging
    FOREIGN KEY (AdminUserId)
    REFERENCES AdminUserValidation (AdminUserValidationId);

-- Reference: BankDetails_LoanDetails (table: LoanDetails)
ALTER TABLE LoanDetails ADD CONSTRAINT BankDetails_LoanDetails
    FOREIGN KEY (BankDetailId)
    REFERENCES BankDetails (BankDetailId);

-- Reference: ContributorTransactionDetails_LoanDetails (table: ContributorTransactionDetails)
ALTER TABLE ContributorTransactionDetails ADD CONSTRAINT ContributorTransactionDetails_LoanDetails
    FOREIGN KEY (LoanDetailId)
    REFERENCES LoanDetails (LoanDetailId);

-- Reference: ContributorTransactionDetails_TransactionStatus (table: ContributorTransactionDetails)
ALTER TABLE ContributorTransactionDetails ADD CONSTRAINT ContributorTransactionDetails_TransactionStatus
    FOREIGN KEY (TransactionStatusId)
    REFERENCES TransactionStatus (TransactionStatusId);

-- Reference: ContributorUserAmountDetails_ContributorUserAccountDetails (table: ContributorUserAmountDetails)
ALTER TABLE ContributorUserAmountDetails ADD CONSTRAINT ContributorUserAmountDetails_ContributorUserAccountDetails
    FOREIGN KEY (ContributorUserAccountDetailId)
    REFERENCES ContributorUserAccountDetails (ContributorUserAccountDetailID);

-- Reference: LoanAmountDetails_LoanDetails (table: LoanAmountDetails)
ALTER TABLE LoanAmountDetails ADD CONSTRAINT LoanAmountDetails_LoanDetails
    FOREIGN KEY (LoanDetailId)
    REFERENCES LoanDetails (LoanDetailId);

-- Reference: LoanDetailsHistory_LoanDetails (table: LoanDetailsHistory)
ALTER TABLE LoanDetailsHistory ADD CONSTRAINT LoanDetailsHistory_LoanDetails
    FOREIGN KEY (LoanDetailId)
    REFERENCES LoanDetails (LoanDetailId);

-- Reference: LoanDetailsStaging_RejectedLoanDetailsStaging (table: RejectedLoanDetailsStaging)
ALTER TABLE RejectedLoanDetailsStaging ADD CONSTRAINT LoanDetailsStaging_RejectedLoanDetailsStaging
    FOREIGN KEY (RejectedLoanDetailsStagngId)
    REFERENCES LoanDetailsStaging (LoanDetailsStagngId);

-- Reference: LoanDetails_LoanStatus (table: LoanDetails)
ALTER TABLE LoanDetails ADD CONSTRAINT LoanDetails_LoanStatus
    FOREIGN KEY (LoanStatusId)
    REFERENCES LoanStatus (LoanStatusId);

-- Reference: SessionDetails_AccountDetails (table: ContributorUserAccountSessionDetails)
ALTER TABLE ContributorUserAccountSessionDetails ADD CONSTRAINT SessionDetails_AccountDetails
    FOREIGN KEY (ContributorUserAccountDetailId)
    REFERENCES ContributorUserAccountDetails (ContributorUserAccountDetailID);

-- Reference: TransactionDetails_UserAccountSessionDetails (table: ContributorTransactionDetails)
ALTER TABLE ContributorTransactionDetails ADD CONSTRAINT TransactionDetails_UserAccountSessionDetails
    FOREIGN KEY (ContributorUserAccountSessionDetailId)
    REFERENCES ContributorUserAccountSessionDetails (ContributorUserAccountSessionDetailId);

-- End of file.

