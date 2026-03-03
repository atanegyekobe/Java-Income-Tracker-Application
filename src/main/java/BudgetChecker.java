import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class BudgetChecker {

    private MyDataConnect dbConnect;
     private BudgetManager budgetManager;

    public BudgetChecker() {
        this.dbConnect = new MyDataConnect();
          this.budgetManager = budgetManager;
    }

   
     public int findBudgetId(int userId, Date startDate, Date endDate) throws SQLException {
        try (Connection connection = dbConnect.getConnection()) {
            String sql = "SELECT budget_id FROM budgets WHERE user_id = ? AND start_date = ? AND end_date = ?";
            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                pstmt.setDate(2, new java.sql.Date(startDate.getTime()));
                pstmt.setDate(3, new java.sql.Date(endDate.getTime()));

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt("budget_id");
                    } else {
                        return -1; // No budget found for the given period
                    }
                }
            }
        }
    }
    public BudgetDetails checkBudget(int userId, Date startDate, Date endDate) throws SQLException {
        try (Connection connection = dbConnect.getConnection()) {
            BudgetDetails budgetDetails = fetchBudgetDetails(connection, userId, startDate, endDate);
            if (budgetDetails != null) {
                double totalExpenses = fetchTotalExpenses(connection, userId, startDate, endDate);
                budgetDetails.actualSpending = totalExpenses;
                budgetDetails.remainingBudget = budgetDetails.monthlyIncome - totalExpenses;
                return budgetDetails;
            }
            return null; // No budget found for the given period
        }
    }

    private BudgetDetails fetchBudgetDetails(Connection connection, int userId, Date startDate, Date endDate) throws SQLException {
        String sql = "SELECT monthly_income, monthly_savings FROM budget "
                   + "WHERE user_id = ? AND start_date = ? AND end_date = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setDate(2, new java.sql.Date(startDate.getTime()));
            pstmt.setDate(3, new java.sql.Date(endDate.getTime()));

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    BudgetDetails details = new BudgetDetails();
                    details.monthlyIncome = rs.getDouble("monthly_income");
                  //  details.monthlySpendingLimit = rs.getDouble("monthly_spending_limit");
                    details.monthlySavings = rs.getDouble("monthly_savings");
                    return details;
                } else {
                    return null; // No budget found for the given period
                }
            }
        }
    }

    private double fetchTotalExpenses(Connection connection, int userId, Date startDate, Date endDate) throws SQLException {
        String sql = "SELECT SUM(amount) AS total_expenses FROM expenses "
                   + "WHERE user_id = ? AND date_spent BETWEEN ? AND ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setDate(2, new java.sql.Date(startDate.getTime()));
            pstmt.setDate(3, new java.sql.Date(endDate.getTime()));

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("total_expenses");
                } else {
                    return 0; // No expenses found for the given period
                }
            }
        }
}  
     // Method to get budget details based on budgetId
 
        public static class BudgetDetails {
        public double monthlyIncome;
       // public double monthlySpendingLimit;
        public double monthlySavings;
        public double actualSpending;
        public double remainingBudget;
     //   public String notes;
    }}

