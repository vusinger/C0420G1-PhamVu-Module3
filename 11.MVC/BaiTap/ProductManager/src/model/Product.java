package model;

public class Product {
    private int productId;
    private String productName;
    private String price;
    private String desc;
    private String maker;

    public Product() {
    }

    public Product(int productId, String productName, String price, String desc, String maker) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.desc = desc;
        this.maker = maker;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getMaker() {
        return maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }
}
