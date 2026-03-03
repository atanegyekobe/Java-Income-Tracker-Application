
import java.sql.Timestamp;

public class Message {
    private int messageId;
    private int senderId;
    private int recipientId;
    private String subject;
    private String content;
    private Timestamp timestamp;
    private String status;
    private String senderUsername; // Added field for sender's username

    // Constructor
    public Message() {
        // Default constructor
    }

    // Getter and setter methods
    public int getMessageId() { return messageId; }
    public void setMessageId(int messageId) { this.messageId = messageId; }
    public int getSenderId() { return senderId; }
    public void setSenderId(int senderId) { this.senderId = senderId; }
    public int getRecipientId() { return recipientId; }
    public void setRecipientId(int recipientId) { this.recipientId = recipientId; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Timestamp getTimestamp() { return timestamp; }
    public void setTimestamp(Timestamp timestamp) { this.timestamp = timestamp; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getSenderUsername() { return senderUsername; } // Getter for sender's username
    public void setSenderUsername(String senderUsername) { this.senderUsername = senderUsername; } // Setter for sender's username
}
