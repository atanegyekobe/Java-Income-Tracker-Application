
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class ActivityLogger {

    public static void logActivity(int userId, String activity, String details) {
        String sql = "INSERT INTO user_activity_logs (user_id, activity, timestamp, details) VALUES (?, ?, ?, ?)";
        
        MyDataConnect dbConnect = new MyDataConnect();
        try (Connection connection = dbConnect.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            pstmt.setString(2, activity);
            pstmt.setTimestamp(3, java.sql.Timestamp.valueOf(LocalDateTime.now()));
            pstmt.setString(4, details);
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
