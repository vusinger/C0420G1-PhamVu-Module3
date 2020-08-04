package bo;

import java.util.regex.Pattern;

public class ProductBoImpl implements ProductBo{

    @Override
    public boolean checkValidName(String productName) {
        if (Pattern.matches("[A-Z].+",productName.trim())) {
            return true;
        }
        return false;
    }
}
