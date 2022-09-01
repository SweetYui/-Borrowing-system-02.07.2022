package com.study.entity;

public class NewUserRigister {

    public NewUserRigister(String name, String surname, int id, int passwort) {
        Name = name;
        Surname = surname;
        this.id = id;
        this.passwort = passwort;
    }


    public NewUserRigister() {

    }

    private String Name;
    private String Surname;
    private int id;
    private int passwort;

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getSurname() {
        return Surname;
    }

    public void setSurname(String surname) {
        Surname = surname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPasswort() {
        return passwort;
    }

    public void setPasswort(int passwort) {
        this.passwort = passwort;
    }



}
