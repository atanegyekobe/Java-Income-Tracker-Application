public class BudgetManager {
    private static BudgetManager instance;
    private int budgetId;

    private BudgetManager() {
        // private constructor to prevent instantiation
    }

    public static BudgetManager getInstance() {
        if (instance == null) {
            instance = new BudgetManager();
        }
        return instance;
    }

    public int getBudgetId() {
        return budgetId;
    }

    public void setBudgetId(int budgetId) {
        this.budgetId = budgetId;
    }
}
