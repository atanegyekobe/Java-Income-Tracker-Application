import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public int getAdminId() throws SQLException {
        String sql = "SELECT user_id FROM users WHERE role = 'admin' LIMIT 1";
         MyDataConnect dbConnect = new MyDataConnect();
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("user_id");
            }
        }
        throw new SQLException("Admin user not found");
    }
}
