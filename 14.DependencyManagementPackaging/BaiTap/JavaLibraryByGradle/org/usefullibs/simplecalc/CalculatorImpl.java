package org.usefullibs.simplecalc;

public class CalculatorImpl implements Calculator{
    @Override
    public int plus(int arg1, int arg2) {
        return arg1+arg2;
    }

    @Override
    public int subtract(int arg1, int arg2) {
        return arg1-arg2;
    }

    @Override
    public int multiply(int arg1, int arg2) {
        return arg1*arg2;
    }

    @Override
    public double divide(int arg1, int arg2) {
        return arg1/arg2;
    }
}
