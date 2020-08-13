package model;

import java.util.Comparator;

public class CustomerComparator implements Comparator<Customer> {
    @Override
    public int compare(Customer o1, Customer o2) {
        if (o1.getName().equals(o2.getName())) {
            String[] str1 = o1.getBirthDay().split("/");
            String[] str2 = o2.getBirthDay().split("/");
            return str1[2].compareTo(str2[2]);
        }
        return o1.getName().compareTo(o2.getName());
    }
}
