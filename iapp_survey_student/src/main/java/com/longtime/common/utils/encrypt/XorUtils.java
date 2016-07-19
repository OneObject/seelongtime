/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : app-rss
 * user created : pippo
 * date created : 2009-12-29 - 下午02:22:47
 */
package com.longtime.common.utils.encrypt;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

/**
 * @since 2009-12-29
 * @author pippo
 */
public final class XorUtils {

	public static String encrypt(int key, char separate, String message) throws XorException {
		try {
			return new Encrypt(key, separate, message).call();
		} catch (Exception e) {
			throw new XorException(e);
		}
	}

	public static String decrypt(int key, char separate, String message) {
		try {
			return new Decrypt(key, separate, message).call();
		} catch (Exception e) {
			throw new XorException(e);
		}
	}

	public static String decrypt(int key, Integer[] codes) {
		StringBuilder sb = new StringBuilder();
		for (Integer code : codes) {
			if (code == null) {
				continue;
			}
			sb.append((char) (code ^ key));
		}
		return sb.toString();
	}

	public static class Encrypt implements Callable<String> {

		public Encrypt(int key, char separate, String message) {
			this.key = key;
			this.separate = separate;
			this.message = message;
		}

		private int key;

		private char separate;

		private String message;

		@Override
		public String call() throws Exception {
			StringBuilder sb = new StringBuilder();
			for (char c : this.message.toCharArray()) {
				int i = c ^ this.key;
				sb.append(i).append(this.separate);
			}
			return sb.toString();
		}

	}

	public static class Decrypt implements Callable<String> {

		public Decrypt(int key, char separate, String message) {
			this.key = key;
			this.separate = separate;
			this.message = message;
		}

		private int key;

		private char separate;

		private String message;

		@Override
		public String call() throws Exception {
			String[] codeStr = this.message.split("\\" + this.separate);
			List<Integer> codes = new ArrayList<Integer>();
			for (String c : codeStr) {
				int code = toInt(c, 0);
				if (code == 0) {
					continue;
				}
				codes.add(code);
			}
			return decrypt(this.key, codes.toArray(new Integer[0]));
		}

	}

	public static int toInt(String str, int defaultValue) {
		if (str == null) {
			return defaultValue;
		}
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException nfe) {
			return defaultValue;
		}
	}
}
