#include<bits/stdc++.h>
using namespace std;

class Persion{
public:
    string name;
    int age;

    Persion(string name, int age){
        this->name = name;
        this->age = age;
    }
};

class Student: Persion{
public:
    string major;
    Student(string name, int age, string major): Persion(name, age){
        this->major = major;
    }

    void displayInfo(){
        cout << "Name: " << name << endl;
        cout << "Age: " << age << endl;
        cout << "Major: " << major << endl;
    }
};

int main(){
    Student st("Sultan",20,"CSE");
    st.displayInfo();
}