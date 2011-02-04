from javax.swing import *
from java.awt import *

class Window(JFrame):
    def __init__(self):
        JFrame.__init__(self, "Example")
        self.layout = FlowLayout()
        self.label = JLabel("Press: ")
        self.button = JButton('Press me', actionPerformed=self.press_button)
        self.add(self.label)
        self.add(self.button)
        self.setSize(300, 200)
        self.defaultCloseOperation = JFrame.DISPOSE_ON_CLOSE
        self.visible = True
  
    def press_button(self, e):
        JOptionPane.showMessageDialog(None, "I was pressed!")

Window()
