
# Introduction

Introducing "Amazon Clone App" - a remarkable mobile application meticulously crafted by leveraging the power of Flutter, Node.js, and MongoDB. This project marks an important milestone in my coding journey as it represents my first comprehensive endeavor in developing a full-fledged mobile app from end to end.

With a total duration of 10 immersive hours, I have documented the entire development process in a captivating YouTube video, offering a step-by-step guide for aspiring developers and curious minds alike. From constructing the back-end infrastructure to seamlessly integrating it with the sleek and intuitive front-end interface, this app clone embodies the general flow of mobile app development.

Immerse yourself in the world of e-commerce as you explore the Amazon Clone App, which embraces the familiar aesthetics and functionalities of the renowned e-commerce platform. Powered by Flutter's cross-platform capabilities, Node.js' robust backend handling, and MongoDB's efficient database management, this app showcases the fusion of cutting-edge technologies in action.

Discover a wealth of features that echo the user experience of Amazon, including effortless product browsing, seamless navigation, secure authentication, personalized user profiles, and much more. Dive into the source code and explore the intricacies of this app, learning valuable insights about architecture, design patterns, and best practices.

Embark on your own mobile app development journey by immersing yourself in the world of "Amazon Clone App." Witness firsthand how an idea transforms into a fully functional application, empowering users and leaving a lasting impression. Join me on this exciting adventure as we embrace innovation and unlock the potential of mobile app development.

# Feature

1. **User**
The Account feature allows users to create and accounts. They can view what products currenly available which posted by the admin. They can either buy the products or add the desired products to their cart. User also allowed to rate products that they see

2. **Admin**
As mentioned before, admin posted their products for the users to see it. They can give an image as an ilustration to the products, the price, and the quantity and update the status of an order.

3. **Address**
The Address feature enables users to manage their delivery addresses. Users can add, edit, and delete their addresses. They can choose the desired address during the checkout process for efficient delivery.

4. **Auth**
The Auth feature handles user authentication and authorization. It ensures secure access to the app's features and resources. Users need to log in or sign up to access personalized features, such as cart management and order history.

5. **Cart**
The Cart feature allows users to add products to their shopping cart and manage the items before proceeding to checkout. Users can add, remove, or update the quantity of items in their cart. It provides a summary of the selected products and their total price.

6. **Home**
The Home feature serves as the main landing page of the app. It showcases featured products, promotions, and categories. Users can browse and explore various products available in the app.

7. **Order details**
The Order Details feature provides users with the ability to view the details of their placed orders. Users can see the order status, shipping details, payment information, and a summary of the purchased products.

8. **Product details**
The Product Details feature displays comprehensive information about a specific product. Users can view product images, descriptions, pricing, and customer reviews. It allows users to make informed decisions before adding products to their cart or making a purchase.

9. **Search**
The Search feature enables users to search for products based on keywords, categories, or other search criteria. It provides a convenient way for users to find specific products they are interested in quickly.


# Technology Stack

This project is developed using the following technologies:

- **Front-end**: The front-end of the application is built with **Flutter**, a popular framework for building cross-platform mobile applications. Flutter allows for a single codebase to create both Android and iOS apps with a rich set of pre-designed UI components and a fast development workflow.

- **Back-end**: The back-end of the application is powered by **Express**, a fast and minimalist web application framework for Node.js. Express provides a robust set of features for building scalable and efficient server-side applications, including routing, middleware support, and easy integration with databases.

- **Database**: The project utilizes **MongoDB** as the database management system. MongoDB is a NoSQL document-oriented database that provides flexibility and scalability for handling complex data structures. It offers seamless integration with Node.js through the use of drivers and libraries.

By leveraging the combination of Flutter, Express, and MongoDB, this project offers a reliable, efficient, and cross-platform solution for building a modern mobile application with a robust back-end and a flexible data storage system.



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

- **Google** - I am grateful for the vast resources and documentation available through Google, which have provided valuable insights and solutions throughout the development process.

- **ChatGPT** - I am indebted to ChatGPT, an AI language model developed by OpenAI. ChatGPT has been an invaluable source of guidance and assistance, answering my questions and providing valuable suggestions throughout the project.

I would also like to express my appreciation to all the developers, contributors, and communities whose open-source projects and discussions have enriched my understanding and enabled me to build this application.

# Future Improvements

In the future, I plan to further enhance this project by focusing on improving the user interface (UI) and user experience (UX). Although the current version provides the core functionality of an Amazon clone, there is always room for refinement and polish.

Some of the areas I intend to explore for future improvements include:

- **UI Enhancements:** I will work on refining the visual appearance of the application, including the layout, color scheme, typography, and overall aesthetics. This will ensure a more visually appealing and engaging user interface.

- **Responsive Design:** I will strive to make the application fully responsive, optimizing it for different screen sizes and devices. This will enable a seamless and enjoyable experience for users accessing the application from various devices, including desktops, tablets, and mobile devices.

- **User Experience Refinements:** I will focus on analyzing user feedback and behavior to identify areas where the user experience can be further improved. This may involve streamlining workflows, simplifying navigation, adding intuitive features, and optimizing performance.

By incorporating these improvements, I aim to create a more polished and user-friendly application that provides an enhanced shopping experience for users.

Please note that this project is a personal portfolio project and will continue to evolve over time as I gain more knowledge and experience. I welcome any feedback, suggestions, or contributions from the community to make this project even better.


