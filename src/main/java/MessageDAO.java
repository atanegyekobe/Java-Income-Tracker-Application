import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {

    public void sendMessage(Message message) throws SQLException {
        String sql = "INSERT INTO messages (sender_id, recipient_id, subject, content, status) VALUES (?, ?, ?, ?, ?)";
        MyDataConnect dbConnect = new MyDataConnect();
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, message.getSenderId());
            stmt.setInt(2, message.getRecipientId());
            stmt.setString(3, message.getSubject());
            stmt.setString(4, message.getContent());
            stmt.setString(5, message.getStatus());
            stmt.executeUpdate();
        }
    }

    public List<Message> getMessagesForUser(int userId) throws SQLException {
        String sql = "SELECT message_id, sender_id, recipient_id, subject, content, timestamp, status, username AS sender_username " +
                 "FROM messages " +
                 "JOIN users  ON sender_id = user_id " +
                 "WHERE recipient_id = ?";
        List<Message> messages = new ArrayList<>();
        
        MyDataConnect dbConnect = new MyDataConnect();
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message();
                    message.setMessageId(rs.getInt("message_id"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setRecipientId(rs.getInt("recipient_id"));
                    message.setSubject(rs.getString("subject"));
                    message.setContent(rs.getString("content"));
                    message.setTimestamp(rs.getTimestamp("timestamp"));
                    message.setStatus(rs.getString("status"));
                    message.setSenderUsername(rs.getString("sender_username")); // Set sender username
                    messages.add(message);
                }
            }
        }
        return messages;
    }

    // Method to get the username by user ID
    private String getUserNameById(int userId) throws SQLException {
        String sql = "SELECT username FROM users WHERE user_id = ?";
        MyDataConnect dbConnect = new MyDataConnect();
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("username");
                }
            }
        }
        return null;
    }

    // Placeholder method, to be implemented as needed
    public Message getMessageById(int messageId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
