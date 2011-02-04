var swing= JavaImporter();
swing.importPackage(Packages.javax.swing);
swing.importPackage(Packages.java.awt);
swing.importPackage(Packages.java.awt.event);
    
createFrame();

function createFrame() {
    var Frame = function() {};
    var frame;
    var label, button;
    var pressButton;

    Frame.prototype = new swing.JFrame("Example");
    frame = new Frame();

    frame.setLayout(new swing.FlowLayout());
    frame.add(label = new swing.JLabel("Press: "));
    frame.add(button = new swing.JButton("Press me"));

    button.addActionListener(function() {
        pressButton();
    });

    pressButton = function () {
        swing.JOptionPane.showMessageDialog(null, "I was pressed!");
    };

    frame.setSize(300, 200);
    frame.setDefaultCloseOperation(swing.JFrame.EXIT_ON_CLOSE);
    frame.setVisible(true);
    return frame;
};
