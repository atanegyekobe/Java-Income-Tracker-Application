import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class BudgetEditor {
    private JTextField emailField;
    private JTable budgetTable;
    private JButton fetchButton;
    private JButton saveButton;
    private Connection connection;
    private MyDataConnect dbConnect;

    public BudgetEditor() {
        dbConnect = new MyDataConnect();

        // Open the connection once
        connection = dbConnect.getConnection();

        JFrame frame = new JFrame("Budget Editor");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);

        emailField = new JTextField(20);
        fetchButton = new JButton("Fetch Budget");
        saveButton = new JButton("Save Changes");

        budgetTable = new JTable();
        JScrollPane scrollPane = new JScrollPane(budgetTable);

        JPanel panel = new JPanel();
        panel.add(new JLabel("Email:"));
        panel.add(emailField);
        panel.add(fetchButton);
        panel.add(saveButton);

        frame.add(panel, BorderLayout.NORTH);
        frame.add(scrollPane, BorderLayout.CENTER);

        fetchButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                fetchBudget();
            }
        });

        saveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                saveChanges();
            }
        });

        frame.setVisible(true);
    }

    private void fetchBudget() {
        String email = emailField.getText().trim();
        if (email.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Please enter an email.");
            return;
        }

        String userQuery = "SELECT user_id FROM users WHERE email = ?";
        String budgetQuery = "SELECT * FROM budget WHERE user_id = ?";

        try (PreparedStatement userStmt = connection.prepareStatement(userQuery);
             PreparedStatement budgetStmt = connection.prepareStatement(budgetQuery)) {

            userStmt.setString(1, email);
            ResultSet userRs = userStmt.executeQuery();

            if (userRs.next()) {
                int userId = userRs.getInt("user_id");

                budgetStmt.setInt(1, userId);
                ResultSet budgetRs = budgetStmt.executeQuery();

                ResultSetMetaData rsmd = budgetRs.getMetaData();
                int columnCount = rsmd.getColumnCount();
                DefaultTableModel tableModel = new DefaultTableModel();

                for (int i = 1; i <= columnCount; i++) {
                    tableModel.addColumn(rsmd.getColumnName(i));
                }

                while (budgetRs.next()) {
                    Object[] rowData = new Object[columnCount];
                    for (int i = 1; i <= columnCount; i++) {
                        rowData[i - 1] = budgetRs.getObject(i);
                    }
                    tableModel.addRow(rowData);
                }

                budgetTable.setModel(tableModel);

            } else {
                JOptionPane.showMessageDialog(null, "No user found with the provided email.");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Database error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void saveChanges() {
    DefaultTableModel model = (DefaultTableModel) budgetTable.getModel();
    int rowCount = model.getRowCount();
    int columnCount = model.getColumnCount();

    // Check if budget_id column exists in the table model
    int budgetIdColumnIndex = -1;
    for (int i = 0; i < columnCount; i++) {
        if (model.getColumnName(i).equals("budget_id")) {
            budgetIdColumnIndex = i;
            break;
        }
    }

    if (budgetIdColumnIndex == -1) {
        JOptionPane.showMessageDialog(null, "budget_id column is missing from the table model.");
        return;
    }

    // Build update query
    StringBuilder updateQuery = new StringBuilder("UPDATE budget SET ");
    for (int i = 1; i < columnCount; i++) {
        if (i != budgetIdColumnIndex) {
            updateQuery.append(model.getColumnName(i)).append(" = ?");
            if (i < columnCount - 1) {
                updateQuery.append(", ");
            }
        }
    }
    updateQuery.append(" WHERE budget_id = ?");

    try (PreparedStatement updateStmt = connection.prepareStatement(updateQuery.toString())) {

        // Update each row
        for (int row = 0; row < rowCount; row++) {
            for (int col = 1; col < columnCount; col++) {
                if (col != budgetIdColumnIndex) {
                    updateStmt.setObject(col, model.getValueAt(row, col));
                }
            }
            // Set the budget_id for WHERE clause
            updateStmt.setObject(columnCount, model.getValueAt(row, budgetIdColumnIndex)); 
            updateStmt.addBatch();

            // Debugging: Print the update statement
            System.out.println("Executing update: " + updateStmt.toString());
        }
        updateStmt.executeBatch();
        JOptionPane.showMessageDialog(null, "Changes saved successfully.");

    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Database error: " + ex.getMessage());
        ex.printStackTrace();
    }
}


    public static void main(String[] args) {
        // Directly instantiate and run the GUI
        SwingUtilities.invokeLater(() -> new BudgetEditor());
    }
}
