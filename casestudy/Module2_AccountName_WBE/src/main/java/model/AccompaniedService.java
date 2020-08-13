package model;

import java.io.Serializable;

public class AccompaniedService implements Serializable {

    private static final long serialVersionUID = 1L;
    private String name;
    private int unit;
    private double price;

    public AccompaniedService() {
    }

    public AccompaniedService(String name, int unit, double price) {
        this.name = name;
        this.unit = unit;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
