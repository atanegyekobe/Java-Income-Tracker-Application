public class UserActivityLog {
    private int userId;
    private String activity;
    private String timestamp;

    // Constructor
    public UserActivityLog(int userId, String activity, String timestamp) {
        this.userId = userId;
        this.activity = activity;
        this.timestamp = timestamp;
    }

    // Getters and setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    Object getLogId() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
