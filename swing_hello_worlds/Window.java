import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class Window extends JFrame {
    public Window() {
        super("Example");
        setLayout(new FlowLayout());
        JLabel label = new JLabel("Press: ");
        JButton button = new JButton("Press me");
        add(label);
        add(button);

        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                pressButton();
            }
        });

        setSize(300, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }
    
    public void pressButton() {
        JOptionPane.showMessageDialog(null, "I was pressed!");
    }

    public static void main (String [] args) {
        new Window();
    }
}

