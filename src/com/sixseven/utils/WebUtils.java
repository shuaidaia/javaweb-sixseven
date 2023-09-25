package com.sixseven.utils;

import java.time.LocalDateTime;

/**
 * @author Belly
 * @version 1.1.0
 */
public class WebUtils {
    public final static String FURN_IMG_PATH = "assets/images/product-image/";
    public static String getYearMothDay(){
        LocalDateTime ldt = LocalDateTime.now();
        int year = ldt.getYear();
        int monthValue = ldt.getMonthValue();
        int dayOfMonth = ldt.getDayOfMonth();
        return year + "/" + monthValue + "/" + dayOfMonth;
    }
    public static int parseInteger(String str, int defaultVal){
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return defaultVal;
        }
    }
}
