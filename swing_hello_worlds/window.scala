import java.awt.{EventQueue, FlowLayout}
import javax.swing._
import java.awt.event._

class Window extends JFrame("Example") {
    setLayout(new FlowLayout())
    val label = new JLabel("Press: ")
    val button = new JButton("Press me")
    add(label)
    add(button)
    button.addActionListener(new ActionListener() {
        def actionPerformed(e: ActionEvent) {
            pressButton()
        }
    })
    setSize(300, 200)
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)
    setVisible(true)

    def pressButton() = JOptionPane.showMessageDialog(null, "I was pressed!")
}

object window extends Application {
    new Window()
}

