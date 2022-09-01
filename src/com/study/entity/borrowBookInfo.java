package com.study.entity;

public class borrowBookInfo {
    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(String borrowDate) {
        this.borrowDate = borrowDate;
    }

    public String getDeadLine() {
        return deadLine;
    }

    public void setDeadLine(String deadLine) {
        this.deadLine = deadLine;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public borrowBookInfo(String bookName, int userId, String borrowDate, String deadLine, int status) {
        this.bookName = bookName;
        this.userId = userId;
        this.borrowDate = borrowDate;
        this.deadLine = deadLine;
        this.status = status;
    }

    public borrowBookInfo() {

    }

    private  String  bookName;private int userId;private String borrowDate;private String deadLine;
            private int status;
}
