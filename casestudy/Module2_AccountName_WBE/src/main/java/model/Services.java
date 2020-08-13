package model;

import java.io.Serializable;

public abstract class Services implements Serializable {
    private static final long serialVersionUID =
            1L;
    private int id;
    private String codeService;
    private String serviceName;
    private double useArea;
    private double rentalCost;
    private int maximumPerson;
    private int inputRentType;
    private final String[] rentTypeArray = {"HourlyRent", "DailyRent", "MonthlyRent", "YearlyRent"};
    private String rentType;
    private AccompaniedService accompaniedService;

    public String getCodeService() {
        return codeService;
    }

    public void setCodeService(String codeService) {
        this.codeService = codeService;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getUseArea() {
        return useArea;
    }

    public void setUseArea(double useArea) {
        this.useArea = useArea;
    }

    public double getRentalCost() {
        return rentalCost;
    }

    public void setRentalCost(double rentalCost) {
        this.rentalCost = rentalCost;
    }

    public int getMaximumPerson() {
        return maximumPerson;
    }

    public void setMaximumPerson(int maximumPerson) {
        this.maximumPerson = maximumPerson;
    }

    public String getRentType() {
        return rentType;
    }

    public void setInputRentType(int inputRentType) {
        this.inputRentType = inputRentType;
        if (this.inputRentType > 0 && this.inputRentType < 4) {
            this.rentType = this.rentTypeArray[this.inputRentType - 1];
        } else this.rentType = "";
    }

    public AccompaniedService getAccompaniedService() {
        return accompaniedService;
    }

    public void setAccompaniedService(AccompaniedService accompaniedService) {
        this.accompaniedService = accompaniedService;
    }

    public Services() {
    }
    public abstract void showInfo();
}
