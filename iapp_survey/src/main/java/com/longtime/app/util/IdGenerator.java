package com.longtime.app.util;

import java.io.Serializable;
import java.util.UUID;

public class IdGenerator {
	
	public static Serializable nextId36() {
		String id = UUID.randomUUID().toString();
		return id;
	}
	public static Serializable nextId32() {
		String id = UUID.randomUUID().toString();
		return id.replaceAll("-", "");
	}


}
