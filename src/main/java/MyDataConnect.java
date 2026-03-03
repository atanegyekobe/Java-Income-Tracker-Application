import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDataConnect {

    // Database URL, username, and password
    private static final String URL = "jdbc:mysql://localhost:3306/incometrac";
    private static final String USER = "root";
    private static final String PASSWORD = "Hellohi.rappers@1992";

    private Connection connection;

    /**
     * Constructor that establishes the database connection
     */
    public MyDataConnect() {
        try {
            // Load the MySQL JDBC driver (optional for newer versions)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connection established.");
        } catch (ClassNotFoundException e) {
            System.err.println("Database driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error connecting to the database.");
            e.printStackTrace();
        }
    }

    /**
     * Method to get the database connection
     * @return the connection object
     */
    public Connection getConnection() {
        return connection;
    }

    /**
     * Method to close the database connection
     */
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.err.println("Error closing the database connection.");
                e.printStackTrace();
            }
        }
    }

    // Test the database connection
    public static void main(String[] args) {
        MyDataConnect dbConnect = new MyDataConnect();
        // Use dbConnect.getConnection() to interact with the database
        dbConnect.closeConnection();
    }
}
