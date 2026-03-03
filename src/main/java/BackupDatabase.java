import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BackupDatabase {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Database Backup");
        JButton backupButton = new JButton("Backup Database");

        backupButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                backupDatabase();
            }
        });

        frame.add(backupButton);
        frame.setSize(300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }

    private static void backupDatabase() {
        try {
            String dbUser = "root";
            String dbPass = "Hellohi.rappers@1992";
            String dbName = "incometrac";
            String backupPath = "C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin/mysqldump";

            // Create backup folder if it doesn't exist
            File backupDir = new File("C:\\backup");
            if (!backupDir.exists()) {
                backupDir.mkdirs();
            }

            // Generate backup file name
            String date = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss").format(new Date());
            String backupFile = backupPath + dbName + "_backup_" + date + ".sql";

            // Command to execute mysqldump
            String executeCmd = "mysqldump -u" + dbUser + " -p" + dbPass + " --database " + dbName + " -r " + backupFile;

            // Execute the command
            Process runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();

            if (processComplete == 0) {
                JOptionPane.showMessageDialog(null, "Backup Complete!");
            } else {
                JOptionPane.showMessageDialog(null, "Backup Failed!");
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
    }
}
