package com.mountech.mycart.helper;

// Takes the description and return 10 words
public class Helper {
    public static String get10Words(String desc) {
        String[] s = desc.split(" ");
        if(s.length > 10) {
            String result = "";
            for(int i = 0; i < 10; i++) {
                result +=" " + s[i];
            }
            return result + "...";
        }
        return desc;
    }
}
