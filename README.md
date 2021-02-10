# CompanyEmployees

This is an ASP.NET 5.0 Web API application. It uses a MySQL database and employs a Repository pattern, generics, LINQ and Entity Framework Core. The architecture uses multiple projects and services to demonstrate good practices, and to make the code more readable and maintainable.

It is deployed on Heroku as a Docker container at https://companyemployeesbyjang.herokuapp.com/swagger

## SUMMARY

* Created database schemas, tables and relations and populated the tables with data using MySQL Workbench.
* Created ASP.NET Core application. Used extension methods to configure CORS, IIS and other services.
* Created an external logging service. Used dependency injection and inversion of control to inject the service via controller constructors.
* Implemented a Repository pattern. Created models and model attributes. Created a context class and database connection. Created a wrapper around individual repository classes.
* Implemented routing, asynchronous GET, POST, PUT and DELETE requests, and Data Transfer Objects (DTOs).
* Implemented global error handling with `UseExceptionHandler` middleware.
* Wrote action filters to provide validation for POST and PUT requests.
* Integrated Swagger for API documentation
