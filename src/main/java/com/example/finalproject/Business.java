package com.example.finalproject;

public class Business {
    private String name;
    private String owner;
    private String phone;
    private String description;
    private String website;

    public Business(String name, String owner, String phone, String description, String website) {
        this.name = name;
        this.owner = owner;
        this.phone = phone;
        this.description = description;
        this.website = website;
    }

    public Business() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }
}