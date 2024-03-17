CREATE TABLE Categories (
    CategoryId BIGINT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL,
    CategoryDescription TEXT,
    IsActive BIT NOT NULL, -- SQL Server uses BIT instead of BOOLEAN
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME NOT NULL,
    ParentCategoryId BIGINT, -- This should match the data type of CategoryId if it's a foreign key
    SortOrder INT,
    ImageUrl VARCHAR(255),
    MetaTitle VARCHAR(255),
    MetaDescription VARCHAR(255),
    MetaKeywords VARCHAR(255),
    FOREIGN KEY (ParentCategoryId) REFERENCES Categories(CategoryId) -- Optional, only if implementing subcategories
);

CREATE TABLE ProductItems (
    ProductId BIGINT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Image VARCHAR(255),
    Brand VARCHAR(255),
    Model VARCHAR(255),
    CategoryId BIGINT NOT NULL,
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

-- ShippingInfo table
CREATE TABLE ShippingInfo (
    ShippingId BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    Status VARCHAR(255) NOT NULL,
    TrackingNumber VARCHAR(255),
    EstimatedDelivery DATE,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);


-- MoreShippingInfo table
CREATE TABLE MoreShippingInfo (
    ShippingId BIGINT PRIMARY KEY,
    DateDelivered DATE,
    TimeDelivered TIME,
    Signature VARCHAR(255),
    DeliveredPhoto VARCHAR(255),
    FOREIGN KEY (ShippingId) REFERENCES ShippingInfo(ShippingId)
);

-- Orders table
CREATE TABLE Orders (
    OrderId BIGINT IDENTITY(1,1) PRIMARY KEY,
    ClientId BIGINT NOT NULL,
    OrderDate DATETIME NOT NULL,
    PaymentMethod VARCHAR(255) NOT NULL,
    FOREIGN KEY (ClientId) REFERENCES ClientInfo(ClientId)
);

CREATE TABLE OrderDetails (
    OrderDetailId BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    ProductId BIGINT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES ProductItems(ProductId)
);


 -- Client Info
CREATE TABLE ClientInfo (
    ClientId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Phone VARCHAR(255),
    Email VARCHAR(255) NOT NULL UNIQUE,
    Address1 VARCHAR(255),
    Address2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    PostalCode VARCHAR(255),
    Country VARCHAR(255) DEFAULT 'USA',
    Username VARCHAR(255) NOT NULL UNIQUE,
    PasswordHash CHAR(60) NOT NULL,
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME
);
CREATE TABLE Reviews (
    ReviewId BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ProductId BIGINT NOT NULL,
    ClientId BIGINT NOT NULL,
    Rating INT NOT NULL,
    Comment TEXT,
    TimeStamp DATETIME NOT NULL,
    FOREIGN KEY (ProductId) REFERENCES ProductItems(ProductId),
    FOREIGN KEY (ClientId) REFERENCES ClientInfo(ClientId)
);
-- VendorInfo table
CREATE TABLE VendorInfo (
    VendorId BIGINT IDENTITY(1,1) PRIMARY KEY,
    VendorName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Phone VARCHAR(255),
    Email VARCHAR(255),
    Address1 VARCHAR(255),
    Address2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    PostalCode VARCHAR(255),
    Country VARCHAR(255)
);

-- Products From Vendors table
CREATE TABLE ProductsFromVendors (
    ProductId BIGINT NOT NULL,
    VendorId BIGINT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    QuantityAvailable INT,
    PRIMARY KEY (ProductId, VendorId),
    FOREIGN KEY (ProductId) REFERENCES ProductItems(ProductId),
    FOREIGN KEY (VendorId) REFERENCES VendorInfo(VendorId)
);
-- PaymentTransactions table

CREATE TABLE PaymentTransactions (
    TransactionId BIGINT IDENTITY(1,1) PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    TransactionAmount DECIMAL(10,2) NOT NULL,
    StateTax DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FederalTax DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    LocalTax DECIMAL(10,2) NOT NULL DEFAULT 0.00;
    TransactionDate DATETIME NOT NULL,
    PaymentMethod VARCHAR(255) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);
-- User Activity
CREATE TABLE UserActivity (
    ClientId BIGINT NOT NULL,
    ActivityType VARCHAR(255) NOT NULL,
    ActivityDate DATETIME NOT NULL,
    FOREIGN KEY (ClientId) REFERENCES ClientInfo(ClientId)
);


CREATE TABLE Advertisers (
    AdvertiserId BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    ContactEmail VARCHAR(255),
    AccountBalance DECIMAL(10,2) DEFAULT 0.00,
    JoinDate DATETIME NOT NULL
);

-- Advertisements table
CREATE TABLE Advertisements (
    AdId BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    AdvertiserId BIGINT NOT NULL,
    Content TEXT NOT NULL,
    AdType VARCHAR(50),
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    IsActive BIT DEFAULT 1, -- SQL Server uses BIT for BOOLEAN
    FOREIGN KEY (AdvertiserId) REFERENCES Advertisers(AdvertiserId)
);

-- AdPlacements table
CREATE TABLE AdPlacements (
    PlacementId BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PageLocation VARCHAR(255) NOT NULL, -- i.e., 'homepage_top', 'sidebar', 'footer'
    AdId BIGINT NOT NULL,
    DisplayStartDate DATETIME NOT NULL,
    DisplayEndDate DATETIME NOT NULL,
    FOREIGN KEY (AdId) REFERENCES Advertisements(AdId)
);

-- AdPerformance table
CREATE TABLE AdPerformance (
    PerformanceId BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    AdId BIGINT NOT NULL,
    Clicks INT DEFAULT 0,
    Impressions INT DEFAULT 0,
    DateRecorded DATETIME NOT NULL,
    FOREIGN KEY (AdId) REFERENCES Advertisements(AdId)
);