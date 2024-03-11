# Database for the Front End

## Categories

| CategoryId | INT | NO | Primary key and unique identifier for the category |
| CategoryName | VARCHAR(255) | NO | The name of the category |
| CategoryDescription | TEXT | YES | Description of what the category entails |
| IsActive | BOOLEAN | NO | Indicator if the category is currently active and should be    displayed |
| CreatedAt | DATETIME | NO | The timestamp when the category was created |
| UpdatedAt | DATETIME | NO | The timestamp when the category was last updated |
| ParentCategoryId | INT | YES | If applicable, the ID of the parent category |
| SortOrder | INT | YES | Used to determine the order of the categories |
| ImageUrl | VARCHAR(255) | YES | URL to an image representing the category |
| MetaTitle | VARCHAR(255) | YES | SEO meta title for the category page |
| MetaDescription | VARCHAR(255) | YES | SEO meta description for the category |
| MetaKeywords | VARCHAR(255) | YES | Comma-delimited list of SEO keywords |

## Products Items

| ProductId | INT | NO | Primary key and unique identifier for the product |
| Name | VARCHAR(255) | NO | Name of the product |
| Description | TEXT | YES | Detailed description of the product |
| Price |Endpoint request timed out DECIMAL(10, 2) | NO | The price of the product |
| Image | VARCHAR(255) | YES | URL to an image of the product |
| Brand | VARCHAR(255) | YES | The brand name of the product |
| Model | VARCHAR(255) | YES | The model of the product |
| CategoryId | INT | NO | The category ID the product is associated with |

## Reviews On Product And Seller


| ReviewId | INT | NO | Primary key and unique identifier for the review |
| ProductId | INT | NO | The ID of the product being reviewed |
| ClientId | INT | NO | The ID of the client who made the review |
| Rating | INT | NO | Numerical rating given to the product |
| Comment | TEXT | YES | Text comment made by the client about the product |
| TimeStamp | DATETIME | NO | The date and time when the review was made |

## Shopping Cart


| ClientId | INT | NO | The ID of the client to whom the cart belongs |
| ProductId | INT | NO | The ID of the product added to the cart |
| DateEntered | DATETIME | NO | The timestamp when the item was added to the cart |
| Quantity | INT | NO | The quantity of the product added to the cart |

Please note: Each 'NO' in the Null column signifies that the field must have a value upon insertion, whereas 'YES' implies that the field can be left blank (or NULL).


## Shopping Cart

Holds the information about the client's shopping cart contents.

- ClientId (INT)
- ProductId (INT)
- DateEntered (DATETIME)
- Quantity (INT)

## Client Info

Records personal information of each client.

- ClientId (INT)
- FirstName (VARCHAR)
- LastName (VARCHAR)
- Phone (VARCHAR)
- Email (VARCHAR)
- Address1 (VARCHAR)
- Address2 (VARCHAR)
- City (VARCHAR)
- State (VARCHAR)
- PostalCode (VARCHAR)
- Country (VARCHAR)
- Username  VARCHAR(255)                       
- PasswordHash CHAR(60)                  
- CreatedAt DATETIME created
- UpdatedAt DATETIME    

## User Activity

Logs the various activities of users on the website.

- ClientId (INT)
- ActivityType (VARCHAR)
- ActivityDate (DATETIME)

## Orders

Contains details about each order placed by clients.

- OrderId (INT)
- ClientId (INT)
- OrderDate (DATETIME)
- PaymentMethod (VARCHAR)
- CCNumber (VARCHAR)
- ExpDate (DATE)
-Endpoint request timed out CVV (INT)

## Order Details

Covers the specifics of items within an order.

- OrderDetailId (INT)
- OrderId (INT)
- Quantity (INT)

## Shipping Info

Tracks shipping information for orders.

- ShippingId (INT)
- OrderId (INT)
- Status (VARCHAR)
- TrackingNumber (VARCHAR)
- EstimatedDelivery (DATE)

## More Shipping Info

Additional shipping details including delivery confirmation.

- DateDelivered (DATE)
- TimeDelivered (TIME)
- Signature (VARCHAR)
- DeliveredPhoto (VARCHAR)

## Vendor Info

Captures key information about each vendor.

- VendorId (INT)
- VendorName (VARCHAR)
- ContactName (VARCHAR)
- Phone (VARCHAR)
- Email (VARCHAR)
- Address1 (VARCHAR)
- Address2 (VARCHAR)
- City (VARCHAR)
- State (VARCHAR)
- PostalCode (VARCHAR)
- Country (VARCHAR)

## Products From Vendors

Information regarding products that are supplied by vendors.

- ProductId (INT)
- VendorId (INT)
- Price (DECIMAL)
- QuantityAvailable (INT)