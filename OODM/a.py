from persistent import Persistent
import ZODB, ZODB.FileStorage
import transaction


class Student(Persistent):
    def __init__(self, name, age, gpa):
        self.name = name
        self.age = age
        self.gpa = gpa

# Database setup
storage = ZODB.FileStorage.FileStorage("students.fs")
db = ZODB.DB(storage)
connection = db.open()
root = connection.root()

# Data insert
root["student1"] = Student("Rahim", 20, 3.75)
root["student2"] = Student("Karim", 22, 3.90)

transaction.commit()   # changes save করতে হবে

# Data read
print(root["student1"].name, root["student1"].gpa)
print(root["student2"].name, root["student2"].gpa)

# Close
connection.close()
db.close()
