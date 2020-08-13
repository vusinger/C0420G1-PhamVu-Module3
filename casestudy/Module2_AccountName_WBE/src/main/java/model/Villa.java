package model;

public class Villa extends Services {

    private String standardRoom;
    private String otherService;
    private double poolArea;
    private int floorsNumber;

    public Villa() {
    }

    @Override
    public void showInfo() {
        System.out.println("Id:" + this.getId());
        System.out.println("Service Name:" + this.getServiceName());
        System.out.println("Use Area:" + this.getUseArea());
        System.out.println("Rental Cost:" + this.getRentalCost());
        System.out.println("Maximum Person:" + this.getMaximumPerson());
        System.out.println("Rental Type:" + this.getRentType());
        System.out.println("Accompanied Service:" + this.getAccompaniedService().getName());
        System.out.println("Pool Area:" + this.poolArea);
        System.out.println("Floors Number:" + this.floorsNumber);
        System.out.println();
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getOtherService() {
        return otherService;
    }

    public void setOtherService(String otherService) {
        this.otherService = otherService;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getFloorsNumber() {
        return floorsNumber;
    }

    public void setFloorsNumber(int floorsNumber) {
        this.floorsNumber = floorsNumber;
    }
}
