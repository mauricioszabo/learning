import javax.swing.JOptionPane
import scala.swing.event._
import scala.swing._

class WindowScala extends MainFrame {
    contents = new FlowPanel {
        contents += new Label("Press: ")
        contents += new Button(Action("Press me") {
            pressButton()
        })
    }
    title = "Example"
    visible = true

    def pressButton() = JOptionPane.showMessageDialog(null, "I was pressed!")
}

object window extends Application {
    new WindowScala()
}
