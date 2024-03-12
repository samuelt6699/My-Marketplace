

-- Categories table
CREATE TABLE  Categories (
    CategoryId INT NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(255) NOT NULL,
    CategoryDescription TEXT,
    IsActive BOOLEAN NOT NULL,
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME NOT NULL,
    ParentCategoryId INT,
    SortOrder INT,
    ImageUrl VARCHAR(255),
    MetaTitle VARCHAR(255),
    MetaDescription VARCHAR(255),
    MetaKeywords VARCHAR(255),
    PRIMARY KEY (CategoryId)
);

-- Product Items table
CREATE TABLE ProductItems (
    ProductId INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    Image VARCHAR(255),
    Brand VARCHAR(255),
    Model VARCHAR(255),
    CategoryId INT NOT NULL,
    PRIMARY KEY (ProductId),
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);

-- Reviews On Product And Seller table
CREATE TABLE  Reviews(
    ReviewId INT NOT NULL AUTO_INCREMENT,
    ProductId INT NOT NULL,
    ClientId INT NOT NULL,
    Rating INT NOT NULL,
    Comment TEXT,
    TimeStamp DATETIME NOT NULL,
    PRIMARY KEY (ReviewId),
    FOREIGN KEY (ProductId) REFERENCES ProductItems(ProductId)
    -- Assuming there is also a Clients table with ClientId as primary key
    -- FOREIGN KEY (ClientId) REFERENCES Clients(ClientId)
);

-- Shopping Cart table
CREATE TABLE  ShoppingCart (
    ClientId INT NOT NULL,
    ProductId INT NOT NULL,
    DateEntered DATETIME NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (ClientId, ProductId),
    FOREIGN KEY (ClientId) REFERENCES ClientInfo(ClientId),
    FOREIGN KEY (ProductId) REFERENCES ProductItems(ProductId)
);

-- Client Info table
CREATE TABLE  ClientInfo (
    ClientId INT NOT NULL AUTO_INCREMENT,
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
    UpdatedAt DATETIME,
    PRIMARY KEY (ClientId)
);

-- User Activity table
CREATE TABLE  UserActivity (
    ClientId INT NOT NULL,
    ActivityType VARCHAR(255) NOT NULL,
    ActivityDate DATETIME NOT NULL,
    FOREIGN KEY (ClientId) REFERENCES ClientInfo(ClientId)
);

-- Orders table
CREATE TABLE  Orders (
    OrderId INT NOT NULL AUTO_INCREMENT,
    ClientId INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    PaymentMethod VARCHAR(255) NOT NULL,
    -- Sensitive payment information fields have been omitted for security compliance
    PRIMARY KEY (OrderId),
    FOREIGN KEY (ClientId) REFERENCES ClientInfo(ClientId)
);

-- Assuming there will be an Order Details table
-- CREATE TABLE IF NOT EXISTS OrderDetails (
-- Add your columns for order details here
-- );

-- Additional setup such as indexes and further constraints can be added as necessary
-- Order Details table
CREATE TABLE OrderDetails (
    OrderDetailId INT NOT NULL AUTO_INCREMENT,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderDetailId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES ProductItems(ProductId)
);

-- Shipping Info table
CREATE TABLE  ShippingInfo (
    ShippingId INT NOT NULL AUTO_INCREMENT,
    OrderId INT NOT NULL,
    Status VARCHAR(255) NOT NULL,
    TrackingNumber VARCHAR(255),
    EstimatedDelivery DATE,
    PRIMARY KEY (ShippingId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

-- More Shipping Info table, assuming one-to-one relation with ShippingInfo
CREATE TABLE  MoreShippingInfo (
    ShippingId INT NOT NULL,
    DateDelivered DATE,
    TimeDelivered TIME,
    Signature VARCHAR(255),
    DeliveredPhoto VARCHAR(255),
    PRIMARY KEY (ShippingId),
    FOREIGN KEY (ShippingId) REFERENCES ShippingInfo(ShippingId)
);

-- Vendor Info table
CREATE TABLE  VendorInfo (
    VendorId INT NOT NULL AUTO_INCREMENT,
    VendorName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Phone VARCHAR(255),
    Email VARCHAR(255),
    Address1 VARCHAR(255),
    Address2 VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    PostalCode VARCHAR(255),
    Country VARCHAR(255),
    PRIMARY KEY (VendorId)
);

-- Products From Vendors table
CREATE TABLE ProductsFromVendors (
    ProductId INT NOT NULL,
    VendorId INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    QuantityAvailable INT,
    PRIMARY KEY (ProductId, VendorId),
    FOREIGN KEY (ProductId) REFERENCES ProductItems(ProductId),
    FOREIGN KEY (VendorId) REFERENCES VendorInfo(VendorId)
);

CREATE TABLE PaymentTransactions (
    TransactionId INT NOT NULL AUTO_INCREMENT,
    OrderId INT NOT NULL,
    TransactionAmount DECIMAL(10,2) NOT NULL,
    TransactionDate DATETIME NOT NULL,
    PaymentMethod VARCHAR(255) NOT NULL,
    PRIMARY KEY (TransactionId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);
-- Additional setup like indexes and further constraints can be added as necessary

CREATE TABLE  Advertisers (
    AdvertiserId INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    ContactEmail VARCHAR(255),
    AccountBalance DECIMAL(10,2) DEFAULT 0.00,
    JoinDate DATETIME NOT NULL
);

-- Advertisements table
CREATE TABLE  Advertisements (
    AdId INT PRIMARY KEY AUTO_INCREMENT,
    AdvertiserId INT NOT NULL,
    Content TEXT NOT NULL,
    AdType VARCHAR(50), -- For example: 'banner', 'sidebar', 'video'
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (AdvertiserId) REFERENCES Advertisers(AdvertiserId)
);

-- AdPlacements table, assuming you have predefined placement areas
CREATE TABLE  AdPlacements (
    PlacementId INT PRIMARY KEY AUTO_INCREMENT,
    PageLocation VARCHAR(255) NOT NULL, -- i.e., 'homepage_top', 'sidebar', 'footer'
    AdId INT NOT NULL,
    DisplayStartDate DATETIME NOT NULL,
    DisplayEndDate DATETIME NOT NULL,
    FOREIGN KEY (AdId) REFERENCES Advertisements(AdId)
);

-- AdPerformance table
CREATE TABLE AdPerformance (
    PerformanceId INT PRIMARY KEY AUTO_INCREMENT,
    AdId INT NOT NULL,
    Clicks INT DEFAULT 0,
    Impressions INT DEFAULT 0,
    DateRecorded DATETIME NOT NULL,
    FOREIGN KEY (AdId) REFERENCES Advertisements(AdId)
);