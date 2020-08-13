package model;

import java.io.Serializable;

public class Services {

    private int id;
    private String codeService;
    private String serviceName;
    private double useArea;
    private double numberFloor;
    private double rentalCost;
    private int maximumPerson;
    private String serviceStatus;
    private boolean flag;
    private int idKieuThue;
    private int idLoaiDichVu;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodeService() {
        return codeService;
    }

    public void setCodeService(String codeService) {
        this.codeService = codeService;
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

    public double getNumberFloor() {
        return numberFloor;
    }

    public void setNumberFloor(double numberFloor) {
        this.numberFloor = numberFloor;
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

    public String getServiceStatus() {
        return serviceStatus;
    }

    public void setServiceStatus(String serviceStatus) {
        this.serviceStatus = serviceStatus;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public int getIdKieuThue() {
        return idKieuThue;
    }

    public void setIdKieuThue(int idKieuThue) {
        this.idKieuThue = idKieuThue;
    }

    public int getIdLoaiDichVu() {
        return idLoaiDichVu;
    }

    public void setIdLoaiDichVu(int idLoaiDichVu) {
        this.idLoaiDichVu = idLoaiDichVu;
    }
}
