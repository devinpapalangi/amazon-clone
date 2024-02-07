# Introduction

Introducing "Amazon Clone App" - a remarkable mobile application meticulously crafted by leveraging the power of Flutter, Node.js, and MongoDB. This project marks an important milestone in my coding journey as it represents my first comprehensive endeavor in developing a full-fledged mobile app from end to end. With a total duration of 10 immersive hours, I have documented the entire development process in a captivating YouTube video.

# Feature

1. Shop (User & Admin): Users can view available products posted by the admin, purchase items, add products to their cart, rate products, and manage their delivery addresses for efficient shipping.
Admins can upload product images, set prices and quantities, update order statuses, and manage product listings.
2. Personalization (User): Users need to log in or sign up to access personalized features such as managing their cart, viewing order history, and updating their delivery addresses. This ensures secure access and tailored experiences for users.

# Technology Stack

[![My Skills](https://skillicons.dev/icons?i=flutter,express,mongodb)](https://skillicons.dev)

## API Reference

#### Authentication
To access the admin API, authentication is required. Include an authorization header in your requests with the admin token.

```
'Content-Type': 'application/json; charset=UTF-8',
'x-auth-token': userProvider.user.token,
```

#### *Admin*

| Endpoint                       | Method | Description                                    | Parameters                                                                                                       | Response                                                                                      |
|--------------------------------|--------|------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| `/admin/add-product`           | POST   | Add a new product to the inventory              | `name` (string), `description` (string), `quantity` (number), `images` (array), `category` (string), `price` (number) | `200 OK` with the created product object                                                     |
| `/admin/get-products`          | GET    | Retrieve all products from the inventory        | None                                                                                                            | `200 OK` with an array of product objects                                                      |
| `/admin/delete-product`        | POST   | Delete a product from the inventory             | `id` (string)                                                                                                   | `200 OK` with the deleted product object                                                       |
| `/admin/get-orders`            | GET    | Retrieve all orders                             | None                                                                                                            | `200 OK` with an array of order objects                                                         |
| `/admin/change-order-status`   | POST   | Change the status of an order                    | `id` (string), `status` (string)                                                                                | `200 OK` with the updated order object                                                         |
| `/admin/analytics`             | GET    | Retrieve analytics data related to orders        | None                                                                                                            | `200 OK` with an object containing various earnings data                                      |


#### *Authentication*

| Endpoint                   | Method | Description                                          | Parameters                                        | Response                                                                                      |
|----------------------------|--------|------------------------------------------------------|--------------------------------------------------|-----------------------------------------------------------------------------------------------|
| `/api/signup`              | POST   | Create a new user                                    | `name` (string), `email` (string), `password` (string) | `200 OK` with the created user object                                                        |
| `/api/signin`              | POST   | Authenticate and log in a user                       | `email` (string), `password` (string)             | `200 OK` with a JSON object containing the authentication token and user details              |
| `/tokenIsValid`            | POST   | Check if the authentication token is valid            | None                                             | `200 OK` with a JSON boolean indicating the validity of the token                           |
| `/`                        | GET    | Retrieve the authenticated user's profile information | None                                             | `200 OK` with a JSON object containing the user details and authentication token             |

#### *Product*

| Endpoint                             | Method | Description                                           | Parameters                              | Response                                                                                       |
|--------------------------------------|--------|-------------------------------------------------------|------------------------------------------|------------------------------------------------------------------------------------------------|
| `/api/products`                      | GET    | Get products by category                              | `category` (string)                      | `200 OK` with a JSON array of products                                                        |
| `/api/products/search/:name`         | GET    | Search products by name                               | `name` (string)                          | `200 OK` with a JSON array of products matching the search criteria                           |
| `/api/rate-product`                   | POST   | Rate a product                                        | `id` (string), `rating` (number)         | `200 OK` with the updated product object                                                      |
| `/api/deal-of-day`                    | GET    | Get the deal of the day (highest rated product)        | None                                     | `200 OK` with a JSON object representing the deal of the day product                          |

#### *User*

| Endpoint                               | Method | Description                                                     | Parameters                              | Response                                                                                  |
|----------------------------------------|--------|-----------------------------------------------------------------|------------------------------------------|-------------------------------------------------------------------------------------------|
| `/api/add-to-cart`                     | POST   | Add a product to the user's cart                                | `id` (string)                            | `200 OK` with the updated user object                                                     |
| `/api/remove-from-cart/:id`            | DELETE | Remove a product from the user's cart                           | `id` (string)                            | `200 OK` with the updated user object                                                     |
| `/api/save-user-address`               | POST   | Save user's address                                             | `address` (string)                       | `200 OK` with the updated user object                                                     |
| `/api/order`                           | POST   | Place an order for the user's cart                              | `cart` (array), `totalPrice` (number), `address` (string) | `200 OK` with the created order object                                                     |
| `/api/orders/me`                       | GET    | Get all orders for the authenticated user                       | None                                     | `200 OK` with a JSON array of orders associated with the authenticated user               |


# Acknowledgements

I would like to express my sincere gratitude to the following sources that have been instrumental in the development of this project:

- **Rivaan Ranawat** - I would like to acknowledge Rivaan Ranawat for his contribution to the freeCodeCamp.org tutorials. His GitHub profile (available [here](https://github.com/RivaanRanawat)) contains additional resources and examples that have been beneficial in building this application.

- **freeCodeCamp.org** - I would like to thank freeCodeCamp.org for their comprehensive tutorials and educational content. Their YouTube tutorial on building this application (available at [this link](https://www.youtube.com/watch?v=ylJz7N-dv1E&t=37473s)) has been immensely helpful in guiding me through the development process.

I would also like to express my appreciation to all the developers, contributors, and communities whose open-source projects and discussions have enriched my understanding and enabled me to build this application.




