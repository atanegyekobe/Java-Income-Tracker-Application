import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.swing.table.DefaultTableModel;

public class ExpenseTracker {
    private MyDataConnect dbConnect;

    public ExpenseTracker() {
        this.dbConnect = new MyDataConnect();
    }

    public DefaultTableModel getExpensesForUser(int userId) {
        String sql = "SELECT amount, category, date_spent, account_spent_from FROM expenses WHERE user_id = ?";
        DefaultTableModel model = new DefaultTableModel(new String[]{"Amount", "Category", "Date Spent", "Account Spent From"}, 0);
        
         MyDataConnect dbConnect = new MyDataConnect();
//    Connection connection = dbConnect.getConnection();
    
        try (Connection connection = dbConnect.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    double amount = rs.getDouble("amount");
                    String category = rs.getString("category");
                    Date dateSpent = rs.getDate("date_spent");
                    String accountSpentFrom = rs.getString("account_spent_from");

                    model.addRow(new Object[]{amount, category, dateSpent, accountSpentFrom});
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return model;
    
}
   public Map<String, Double> getExpensesByCategory(int userId, Date startDate, Date endDate) {
        String sql = "SELECT category, SUM(amount) AS total_amount FROM expenses "
                   + "WHERE user_id = ? AND date_spent BETWEEN ? AND ? "
                   + "GROUP BY category";
        Map<String, Double> expensesByCategory = new HashMap<>();

        try (Connection connection = dbConnect.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setDate(2, new java.sql.Date(startDate.getTime()));
            pstmt.setDate(3, new java.sql.Date(endDate.getTime()));

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String category = rs.getString("category");
                    double totalAmount = rs.getDouble("total_amount");
                    expensesByCategory.put(category, totalAmount);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expensesByCategory;
    }
}
