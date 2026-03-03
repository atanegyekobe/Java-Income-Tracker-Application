import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserProfilePanel extends JPanel {
    private JButton closeButton;
    private JButton updateButton;
    private JTextField usernameField;
    private JTextField emailField;
    private JTextField fullNameField;
    private JTextField phoneNumberField;
    private MyDataConnect dbConnect;
    private int userId;

    public UserProfilePanel() {
        // Initialize components
        dbConnect = new MyDataConnect();
        closeButton = new JButton("Close");
        updateButton = new JButton("Update");
        usernameField = new JTextField(20);
        emailField = new JTextField(20);
        fullNameField = new JTextField(20);
        phoneNumberField = new JTextField(20);

        // Retrieve user ID from SessionManager
        userId = SessionManager.getInstance().getUserId();

        // Fetch and display user details
        fetchAndDisplayUserDetails();

        // Set layout and add components
        setLayout(new BorderLayout());
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(updateButton);
        buttonPanel.add(closeButton);

        add(buttonPanel, BorderLayout.SOUTH);

        // Add action listener to close button
        closeButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Window window = SwingUtilities.getWindowAncestor(UserProfilePanel.this);
                if (window != null) {
                    window.dispose();
                }
            }
        });

        // Add action listener to update button
        updateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                updateUserDetails();
            }
        });

        // Create a panel for user details
        JPanel userDetailsPanel = new JPanel();
        userDetailsPanel.setLayout(new GridLayout(4, 2));
        userDetailsPanel.add(new JLabel("Username:"));
        userDetailsPanel.add(usernameField);
        userDetailsPanel.add(new JLabel("Email:"));
        userDetailsPanel.add(emailField);
        userDetailsPanel.add(new JLabel("Full Name:"));
        userDetailsPanel.add(fullNameField);
        userDetailsPanel.add(new JLabel("Phone Number:"));
        userDetailsPanel.add(phoneNumberField);

        add(userDetailsPanel, BorderLayout.CENTER);
    }

    private void fetchAndDisplayUserDetails() {
        String sql = "SELECT username, email, full_name, phone_number FROM users WHERE user_id = ?";

        try (Connection connection = dbConnect.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                usernameField.setText(rs.getString("username"));
                emailField.setText(rs.getString("email"));
                fullNameField.setText(rs.getString("full_name"));
                phoneNumberField.setText(rs.getString("phone_number"));
            } else {
                JOptionPane.showMessageDialog(this, "User not found.");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Database error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void updateUserDetails() {
        String sql = "UPDATE users SET username = ?, email = ?, full_name = ?, phone_number = ? WHERE user_id = ?";

        try (Connection connection = dbConnect.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, usernameField.getText());
            pstmt.setString(2, emailField.getText());
            pstmt.setString(3, fullNameField.getText());
            pstmt.setString(4, phoneNumberField.getText());
            pstmt.setInt(5, userId);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                JOptionPane.showMessageDialog(this, "User details updated successfully.");
            } else {
                JOptionPane.showMessageDialog(this, "Failed to update user details.");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Database error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
}
