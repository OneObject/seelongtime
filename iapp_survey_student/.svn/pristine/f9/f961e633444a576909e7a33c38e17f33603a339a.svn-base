/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : dfs-proxy
 * user created : pippo
 * date created : 2012-4-21 - 上午11:14:55
 */
package com.myctu.platform.resource.agent.signature;

import com.longtime.common.utils.encrypt.BlowfishEncryptor;
import com.longtime.common.utils.encrypt.EncryptException;
import com.longtime.common.utils.encrypt.Encryptor;
import java.util.Arrays;
import org.apache.commons.lang3.Validate;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @since 2012-4-21
 * @author pippo
 */
public class ResourceSignatureProcessor extends ResourceSignature {

	private static Logger logger = LoggerFactory.getLogger(ResourceSignature.class);

	private static Encryptor encryptor = new BlowfishEncryptor();

	/* 默认30分钟过期 */
	private static long default_expire = 1000 * 60 * 30;

	public ResourceSignatureProcessor(String domain, String user) {
		super(domain, user);
	}

	public ResourceSignatureProcessor(String domain, String user, String resource_id, long expire) {
		super(domain, user, resource_id, expire);
	}

	public void sign() {
		try {
			Validate.notNull(this.domain, "the user domain can not be null");
			Validate.notNull(this.resource_id, "the resource id can not be null");
			if (this.expire <= 0) {
				this.expire = System.currentTimeMillis() + default_expire;
			}
			this.signature = encryptor.encryptHex(domain,
				String.format("%s@%s@%s", this.user, this.expire, this.resource_id));
			this.valid = true;
		} catch (EncryptException e) {
			logger.error("create file signature due to error", e);
			this.valid = false;
			this.error = ErrorType.sign_fail;
		}
	}

	public void validate() {
		String[] parsed_sign;
		try {
			Validate.notNull(this.domain, "the user domain can not be null");
			Validate.notNull(this.signature, "the resource signature can not be null");
			/* user@expire@file_id */
			parsed_sign = encryptor.decryptHex(this.domain, this.signature).split("\\@");
			Validate.isTrue(parsed_sign != null && parsed_sign.length == 3,
				String.format("the expect sign need four part such as:[user@expire@file_id],but the result is:[%s]",
					Arrays.toString(parsed_sign)));
		} catch (EncryptException e) {
			logger.error("validate resource signature due to error", e);
			this.valid = false;
			this.error = ErrorType.invalid_sign;
			return;
		}

		/* 用户不匹配 */
		String expect_user = parsed_sign[0];
		if (!expect_user.equals(this.user)) {
			this.valid = false;
			this.error = ErrorType.invalid_user;
			return;
		}

		/* 签名已过期 */
		this.expire = NumberUtils.toLong(parsed_sign[1], 0L);
		if (this.expire < System.currentTimeMillis()) {
			this.valid = false;
			this.error = ErrorType.expire;
			return;
		}

		this.valid = true;
		this.resource_id = parsed_sign[2];
	}
}
