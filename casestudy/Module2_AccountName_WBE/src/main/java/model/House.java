package model;

public class House extends Services {

    private String standardRoom;
    private String otherService;
    private int floorsNumber;

    public House() {
    }

    @Override
    public void showInfo() {
        System.out.println("Id:" + this.getId());
        System.out.println("Service Name:" + this.getServiceName());
        System.out.println("Use Area:" + this.getUseArea());
        System.out.println("Rental Cost:" + this.getRentalCost());
        System.out.println("Maximum Person:" + this.getMaximumPerson());
        System.out.println("Accompanied Service:" + this.getAccompaniedService().getName());
        System.out.println();
    }
}
