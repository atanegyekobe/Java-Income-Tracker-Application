
💰 Java Income Tracker Application

A Java-based Income Tracker built with Spring Boot and connected to a MySQL database via MySQL Connector/J.  
This application helps users manage and track their income records efficiently with a structured backend and database integration.

---

🚀 Features
- Java backend powered by **Spring Boot**
- Persistent data storage with **MySQL**
- Predefined schema (`incometrac.sql`) for quick setup
- Modular design for scalability and maintainability

---

🛠️ Tech Stack
| Component        | Technology |
|------------------|------------|
| Language         | Java       |
| Framework        | Spring Boot |
| Database         | MySQL      |
| Connector        | MySQL Connector/J |

---

⚙️ Setup Instructions

Follow these steps to set up and run the project locally:

1. Clone the repository
   ```bash
   git clone https://github.com/your-username/Java-Income-Tracker-Application.git
   cd Java-Income-Tracker-Application
   ```

2. Open in your IDE 
   Import the project into your preferred IDE (IntelliJ IDEA, Eclipse, or VS Code with Java extensions).

3. Import required libraries
   Ensure **Spring Boot** and **MySQL Connector/J** dependencies are included.  
   If using Maven, verify your `pom.xml` contains:
   ```xml
   <dependency>
       <groupId>mysql</groupId>
       <artifactId>mysql-connector-java</artifactId>
       <scope>runtime</scope>
   </dependency>
   ```

4. **Create the database**  
   In MySQL, create a new database:
   ```sql
   CREATE DATABASE incometracker;
   ```

5. **Import the schema**  
   Load the provided `incometrac.sql` file into your database:
   ```bash
   mysql -u your_username -p incometracker < incometrac.sql
   ```

6. Configure application properties
   Update `src/main/resources/application.properties` with your database credentials:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/incometracker
   spring.datasource.username=your_username
   spring.datasource.password=your_password
   spring.jpa.hibernate.ddl-auto=update
   ```

7. Run the application
   Start the Spring Boot application:
   ```bash
   mvn spring-boot:run
   ```
   or run directly from your IDE.

---

📂 Project Structure
```
Java-Income-Tracker-Application/
 ├── src/
 │   ├── main/
 │   │   ├── java/        # Java source code
 │   │   └── resources/   # Configuration files
 │   └── test/            # Unit tests
 ├── incometrac.sql       # Database schema
 ├── pom.xml              # Maven dependencies
 └── README.md            # Project documentation
```

---

Would you like me to also include a **sample ER diagram** (Entity-Relationship) for the income tracker database so contributors can quickly understand the schema?
