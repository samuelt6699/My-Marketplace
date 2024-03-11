### DataBase for the Front End


## Categories
   CategoryId
   CategoryName
   CategoryDescription
   Category IsActive
   Category CreatedAt
   Category UpdatedAt
   ParentCategoryId 
   SortOrder 
   ImageUrl  
   MetaTitle 
   MetaDescription 
   MetaKeywords

## Prouducts Items
  ProuductId
  Name
  Description
  Price
  Image
  Brand Name of Product
  Moudle 
  CategoryId


## Reviews On Prouduct And seller
   ReviewId
   ProductId
   ClientId
   Rating
   Comment TEXT
   Time Stamp Date And Time

## Shooping Cart 

 ClientId 
 ProductId Int
 DateEntered DATETIME
 Quantity Items Int


## Client Info
  ClientId
  First Name
  Last Name
  Phone
  Email
  Address 1
  Address 2
  City
  State
  Postal Code
  Contry


## User Activity

ClientId
ActivityType
 ActivityDate
 


## Orders
 OrderId
 ClientId
 OrderDate
 PaymentMathod
CCNumber
ExpDate
CVV


## OrderDetais
OrderDetailId
OrderId
quantity


## shipping Info

  ShippingId
  OrderId
  Status
  TrackingNumber
  EstimatedDelivery

 ## More Shhipping Info
  DateDeliverd
  TimeDeliverd
  Signiture
  Deliverd Photo
--------------------------------

#### Vendor Info

   VendorId
   Vandor Name
   ContactName
   Phone
   Email
   Address 1
   Address 2
   City
   State
   PostalCode
   Country

  ## Products From Vandors

   ProductId
   VendorId
   Price
   Quantity Available
