require "java"

(import
    '(java.awt EventQueue FlowLayout)
    '(java.awt.event ActionListener)
    '(javax.swing JButton JFrame JLabel JOptionPane)
)
  
(defn show-window []
    (let 
        [window (JFrame. "Example")
            label (JLabel. "Press: ")
            button (JButton. "Press me")
        ]
        (.addActionListener button
            (proxy [ActionListener] []
                (actionPerformed [evt]
                    (JOptionPane/showMessageDialog nil "I was pressed!")
                )
            )
        )
        (doto window
            (.setLayout (FlowLayout.))
            (.add label)
            (.add button)
            (.setSize 300 200)
            (.setDefaultCloseOperation JFrame/DISPOSE_ON_CLOSE)
            (.setVisible true)
        )
    )
)

(show-window)
