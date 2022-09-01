package com.study.entity;

public class Book {
    public Book(String type, String name, String autor,int number) {
        this.type = type;
        this.name = name;
        this.autor = autor;
        this.number=number;
    }
    public Book(String name) {

        this.name = name;

    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }



    private String type="";
    private String name="";

    public Book(String type, String name, String autor, int number, String variable) {
        this.type = type;
        this.name = name;
        this.autor = autor;
        this.variable = variable;
        this.number = number;
    }

    private String autor="";
    private String variable="";
    private int number=0;

    public String getVariable() {
        return variable;
    }

    public void setVariable(String variable) {
        this.variable = variable;
    }



    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }


}
