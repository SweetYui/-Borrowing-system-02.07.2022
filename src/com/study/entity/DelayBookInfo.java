package com.study.entity;

public class DelayBookInfo {
    public DelayBookInfo(String bookname, int userid, int number) {
        this.bookname = bookname;
        this.userid = userid;
        this.number = number;
    }

    private String bookname;

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public DelayBookInfo(String bookname, int userid, int number, String today, String dueDate) {
        this.bookname = bookname;
        this.userid = userid;
        this.number = number;
        this.today = today;
        this.dueDate = dueDate;
    }

    private int userid;
   private int number;

    public String getToday() {
        return today;
    }

    public void setToday(String today) {
        this.today = today;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    private String today;
   private String dueDate;
}
