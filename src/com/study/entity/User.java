package com.study.entity;

public class User {

    public User(int id, String username, String passwort) {
        this.id = id;
        this.username = username;
        this.passwort = passwort;
    }
    public User(String username) {

        this.username = username;

    }

    private int id;
    private String username;
    private String passwort;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPasswort() {
        return passwort;
    }

    public void setPasswort(String passwort) {
        this.passwort = passwort;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


}
