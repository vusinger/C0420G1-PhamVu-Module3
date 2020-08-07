package org.usefullibs.simplecalc;

public class Main {
    public static void main(String[] args) {
        Calculator cal = new CalculatorImpl();
        System.out.println(cal.plus(2,3));
    }
}
