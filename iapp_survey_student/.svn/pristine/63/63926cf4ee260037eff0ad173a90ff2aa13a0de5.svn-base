package com.longtime.common.utils;

import com.longtime.ajy.model.MapSerializable;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang3.ArrayUtils;

public class ExtMapUtils{

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map addIfNotNull(Map target, Object key, Object value) {
		if (value == null) {
			return target;
		}

		if (Collection.class.isInstance(value) || Object[].class.isInstance(value)) {
			return handleSeqValue(target, key, value);
		}

		target.put(key, MapSerializable.class.isInstance(value) ? ((MapSerializable) value).toMap() : value);
		return target;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private static Map handleSeqValue(Map target, Object key, Object value) {
		Object[] arrays = ArrayUtils.EMPTY_OBJECT_ARRAY;
		if (Object[].class.isInstance(value)) {
			arrays = Arrays.copyOf((Object[]) value, ((Object[]) value).length, Object[].class);
		} else if (List.class.isInstance(value)) {
			arrays = ((List) value).toArray();
		} else if (Set.class.isInstance(value)) {
			arrays = ((Set) value).toArray();
		}

		for (int i = 0; i < arrays.length; i++) {
			arrays[i] = MapSerializable.class.isInstance(arrays[i]) ? ((MapSerializable) arrays[i]).toMap() : arrays[i];
		}

		target.put(key, arrays);
		return target;
	}

}