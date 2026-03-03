import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Overview {
    // Method to count the number of users excluding admin
    public int countNonAdminUsers() throws SQLException {
        String sql = "SELECT COUNT(*) AS user_count FROM users WHERE role IS NULL OR role != 'admin'";
        int userCount = 0;
 MyDataConnect dbConnect = new MyDataConnect();
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                userCount = rs.getInt("user_count");
            }
        }

        return userCount;
    }
}
