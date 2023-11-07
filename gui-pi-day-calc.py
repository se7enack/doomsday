#!/usr/bin/env python3


# # Stephen Burke 10/06/2023 - Gregorian calendar doomsday day-of-the-week calculator


import sys
from PyQt6.QtWidgets import QApplication, QWidget, QDateEdit, QLabel, QFormLayout


class MainWindow(QWidget):
        
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.setWindowTitle('Enter Year')
        self.setMinimumWidth(295)

        layout = QFormLayout()
        self.setLayout(layout)

        self.date_edit = QDateEdit(self)
        self.date_edit.setDisplayFormat("yyyy")
        self.date_edit.editingFinished.connect(self.update)

        self.result_label = QLabel('', self)

        layout.addRow('Date:', self.date_edit)
        layout.addRow(self.result_label)

        self.show()
        

    def century(self, y):
        startdays = [0, 5, 3, 2]
        centurycounter = 0
        for i in range(17, 21):
            if y == i:
                return startdays[centurycounter]
            centurycounter = centurycounter + 1
            
                    
    def day(self, x):
        days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        return days[x]
        
        
    def gotime(self, year):
        try: 
            cen, dec = int(year[:len(year)//2]), int(year[len(year)//2:])
            if int(cen) <=  20:
                c = self.century(cen)
                dotw = int(dec / 4 + dec + c) % 7
                weekday = self.day(dotw)
                self.result_label.setText("For " + str(year) + " Pi-Day (3/14) is on a " + weekday + ".")
            else:
                self.result_label.setText("Only years between 1759 & 2099")
        except:
            self.result_label.setText("An unknown error occurred!")

    def update(self):
        value = self.date_edit.date()
        self.result_label.setText(str(value.toPyDate()))
        x = str(value.toPyDate()).split("-")
        year = x[0]
        self.gotime(year)


if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = MainWindow()
    sys.exit(app.exec())
 
