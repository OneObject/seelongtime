package com.longtime.common.utils.encrypt;



public interface Encryptor {
    byte[] encrypt(Object key, byte[] data) throws EncryptException;

    byte[] decrypt(Object key, byte[] data) throws EncryptException;

    String encryptHex(Object key, String data) throws EncryptException;

    String decryptHex(Object key, String data) throws EncryptException;

    String encryptBase64(Object key, String data) throws EncryptException;

    String decryptBase64(Object key, String raw) throws EncryptException;

}
