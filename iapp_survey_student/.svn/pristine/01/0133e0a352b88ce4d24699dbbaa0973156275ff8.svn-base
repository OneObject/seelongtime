package com.longtime.common.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * 使用星号遮挡email地址
 */
public class MaskUtils {
	/**
	 * @param email
	 * @return
	 */
	public static String maskEmail(String email) {
		int index = email.indexOf('@');
		String prefix = email.substring(0, index);
		String suffix = email.substring(index);

		int length = prefix.length();
		char[] array = prefix.toCharArray();
		int before_size = 3;
		int after_size = 1;
		switch (length) {
			case 1:
				return email;
			case 2:
			case 3:
				before_size = 1;
				break;
			case 4:
				before_size = 2;
				break;
			default:
				before_size = 3;
				break;
		}

		return String.format("%s***%s%s",
			String.valueOf(array, 0, before_size),
			String.valueOf(array, length - after_size, after_size),
			suffix);
	}
	
	
	private static String regex = "(\\w{3})(\\w+)(\\w{4})(@\\w+)";
	public static String maskMobile(String mobile){
		  return mobile.replaceAll(regex, "$1***$3$4");
	}
	
	private final static char MASK_CHAR = '*';
	public static String mask(String text,int frontSize,int lastSize){
		if(StringUtils.isBlank(text)){
			return String.valueOf(MASK_CHAR);
		}
		
		frontSize = (frontSize<0)?0:frontSize;
		lastSize = (lastSize<0)?0:lastSize;
				
		int length = text.length();
		
		if(length<=frontSize +lastSize){
			return text;
		}
		
		StringBuilder sb = new StringBuilder(text);
        for (int i = frontSize; i < length-lastSize ; i++) {
            sb.setCharAt(i, MASK_CHAR);
        }
        return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(MaskUtils.maskEmail("1@gmail.com"));
		System.out.println(MaskUtils.maskEmail("12@gmail.com"));
		System.out.println(MaskUtils.maskEmail("123@gmail.com"));
		System.out.println(MaskUtils.maskEmail("1234@gmail.com"));
		System.out.println(MaskUtils.maskEmail("12345@gmail.com"));
		System.out.println(MaskUtils.maskEmail("12456@gmail.com"));
		System.out.println(MaskUtils.maskEmail("124567@gmail.com"));
		System.out.println(MaskUtils.maskEmail("1245678@gmail.com"));
		System.out.println(MaskUtils.maskEmail("12456789@gmail.com"));

		//		1@gmail.com
		//		1***2@gmail.com
		//		1***3@gmail.com
		//		12***4@gmail.com
		//		123***5@gmail.com
		//		124***6@gmail.com
		//		124***7@gmail.com
		//		124***8@gmail.com
		//		124***9@gmail.com
		
		System.out.println(MaskUtils.mask("12", 2, 2));
		System.out.println(MaskUtils.mask("123", 2, 2));
		System.out.println(MaskUtils.mask("1234", 2, 2));
		System.out.println(MaskUtils.mask("12345", 2, 2));
		System.out.println(MaskUtils.mask("123456", 2, 2));
		System.out.println(MaskUtils.mask("1234567", 2, 2));
		System.out.println(MaskUtils.mask("12345678", 2, 2));
		System.out.println(MaskUtils.mask("123456789", 2, 2));
		System.out.println(MaskUtils.mask("1234567890", 2, 2));
		System.out.println(MaskUtils.mask("1234567890@gmai.com", 3,3));
		//		12
		//		123
		//		1234
		//		12*45
		//		12**56
		//		12***67
		//		12****78
		//		12*****89
		//		12******90
		
		
	}

}

