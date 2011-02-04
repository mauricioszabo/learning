require "java"

java_import 'java.awt.EventQueue'
java_import 'java.awt.FlowLayout'
java_import 'javax.swing.JButton'
java_import 'javax.swing.JFrame'
java_import 'javax.swing.JLabel'
java_import 'javax.swing.JOptionPane'

class Window < JFrame
  def initialize
    super('Example')
    self.layout = FlowLayout.new
    add @label = JLabel.new("Press: ")
    add @button = JButton.new('Press me')
    @button.add_action_listener do
      press_button
    end
    set_size(300, 200)
    self.default_close_operation = JFrame::DISPOSE_ON_CLOSE
    self.visible = true
  end

  def press_button
    JOptionPane.show_message_dialog(nil, "I was pressed!")
  end
end

Window.new
