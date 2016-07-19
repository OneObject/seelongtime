/**
 * 文 件 名：ConvertString.java
 * 作    者: $Author: maoxiang $
 * 当前版本：$Revision: 1.2 $
 * 最后修改：$Author: maoxiang $
 */

package org.adl.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.sql.Blob;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 用来转化字符串的类,目前有以下功能
 * 1.将字符串由GB2312编码转化为ISO编码
 * 2.将字符串由ISO编码转化为GB编码
 * <p/>
 * 注意使用场合
 * 1. Tomcat 的默认编码为ISO
 * 2. Mysql存储为ISO编码
 * 3. 在bean中的编码和平台相关
 *
 * @author 啊赶(maoxiang@qq.com)
 */
public class ConvertUtil {

    protected static Log log = LogFactory.getLog(ConvertUtil.class);

    /**
     * 将ISO8859_1字符串转化为gb2312编码
     * Tomcat 的默认编码为ISO8859_1
     *
     * @param pStr
     * @return String
     */
    public static String toGB(String pStr) {
        if (pStr == null) {
            return null;
        }

        try {
            return new String(pStr.getBytes("ISO-8859-1"), "GB2312");
        } catch (UnsupportedEncodingException e) {
            log.error("转换ISO字符串编码为GB2312时出错" + e.getMessage());

            return pStr;
        }
    }

    /**
     * 将GB2312字符串转化为ISO8859_1编码
     *
     * @param pStr
     * @return String
     */
    public static String toISO(String pStr) {
        if (pStr == null) {
            return null;
        }

        try {
            return new String(pStr.getBytes("GB2312"), "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            log.error("转换字符串编码为ISO8859_1时出错" + e.getMessage());

            return pStr;
        }
    }

    /**
     * 将字符型转换成int
     *
     * @param arg
     * @return
     */
    public static int toInt(String arg) {
        return Integer.valueOf(arg).intValue();
    }

    /**
     * 转换成 float型
     *
     * @param arg
     * @return
     */
    public static float toFloat(String arg) {
        return Float.valueOf(arg).floatValue();
    }

    /**
     * 转换成long
     *
     * @param arg
     * @return
     */
    public static long toLong(String arg) {
        return Long.valueOf(arg).longValue();
    }

    /**
     * 转换成timestamp
     *
     * @param arg 格式可以是
     * @return
     */
    public static Timestamp toDateTime(String arg) {
        Locale locale = Locale.ENGLISH;
        if (arg == null || "".equals(arg)) {
            return null;
        }
        Timestamp ret;
        try {
            //格式为 yyyy-MM-dd
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",
                                                        locale);
            ret = new Timestamp(sdf.parse(arg).getTime());
            return ret;
        } catch (ParseException e) {
            try {
                //格式  yyyy-MM-dd HH:mm:ss
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm",
                                                            locale);
                ret = new Timestamp(sdf.parse(arg).getTime());
                return ret;
            } catch (ParseException e1) {
                try {
                    //格式  yyyy-MM-dd HH:mm
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",
                                                                locale);
                    ret = new Timestamp(sdf.parse(arg).getTime());
                    return ret;
                } catch (ParseException e2) {
                    try {
                        //格式  yyyy-MM
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM",
                                                                    locale);
                        ret = new Timestamp(sdf.parse(arg).getTime());
                        return ret;
                    } catch (ParseException e3) {
                        try {
                            // 默认的Date 输入格式
                            SimpleDateFormat sdf = new SimpleDateFormat(
                                    "EEE MMM dd HH:mm:ss z yyyy", locale);
                            return new Timestamp(sdf.parse(arg).getTime());
                        } catch (Exception e4) {
                            throw new IllegalArgumentException("参数非法:" + arg);
                        }
                    }

                }
            }
        }
    }

    /**
     * 转换成timestamp
     *
     * @param arg 格式可以是
     * @return
     */
    public static Timestamp toDateTime(String arg, boolean defaultValue) {
        if (!defaultValue)
            return toDateTime(arg);
        if (arg == null || "".equals(arg)) {
            return new Timestamp(System.currentTimeMillis());
        }
        Timestamp ret;
        try {
            //格式为 yyyy-MM-dd
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ret = new Timestamp(sdf.parse(arg).getTime());
            return ret;
        } catch (ParseException e) {
            try {
                //格式  yyyy-MM-dd HH:mm:ss
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                ret = new Timestamp(sdf.parse(arg).getTime());
                return ret;
            } catch (ParseException e1) {
                try {
                    //格式  yyyy-MM-dd HH:mm
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    ret = new Timestamp(sdf.parse(arg).getTime());
                    return ret;
                } catch (ParseException e2) {
                    return new Timestamp(System.currentTimeMillis()); //返回默认当前日期
                }
            }
        }
    }

    public static Date toDate(String arg) {
        try {
            //格式为 yyyy-MM-dd
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return sdf.parse(arg);
        } catch (ParseException e) {
            try {
                //格式  yyyy-MM-dd HH:mm:ss
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                return sdf.parse(arg);
            } catch (ParseException e1) {
                try {
                    //格式  yyyy-MM-dd HH:mm
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    return sdf.parse(arg);
                } catch (ParseException e2) {
                    return new Date(); //返回默认当前日期
                }
            }
        }
    }

    /**
     * 将字符串转换成固定长度的字符串
     * otFixString(3,5) 返回 00003
     *
     * @return
     */
    public static String toFixString(String number, int size) {
        String ret = "";
        String temp = number;
        if (temp.length() > size) {
            return temp;
        }
        for (int i = 0; i < (size - temp.length()); i++) {
            ret += "0";
        }

        return ret + temp;

    }

    /**
     * 将数字转换成固定长度的字符串
     * otFixString(3,5) 返回 00003
     *
     * @return
     */
    public static String toFixString(int number, int size) {
        String ret = "";
        String temp = String.valueOf(number);
        if (temp.length() > size) {
            return temp;
        }
        for (int i = 0; i < (size - temp.length()); i++) {
            ret += "0";
        }

        return ret + temp;

    }

    /**
     * 将数字转换成固定长度的字符串
     * otFixString(3,5) 返回 00003
     *
     * @return
     */
    public static String toFixString(long number, int size) {
        String ret = "";
        String temp = String.valueOf(number);
        if (temp.length() > size) {
            return temp;
        }
        for (int i = 0; i < (size - temp.length()); i++) {
            ret += "0";
        }
        return ret + temp;

    }

    /**
     * 将字符串参数转换成Unicode编码
     * native2ascii Convert text to Unicode Latin-1.
     * native2ascii [options] [inputfile [outputfile]]
     *
     * @param theString 传入的参数
     * @return
     */
    public static String toUnicode(String theString) {
        int len = theString.length();
        boolean escapeSpace = false;
        int bufLen = len * 2;
        if (bufLen < 0) {
            bufLen = Integer.MAX_VALUE;
        }
        StringBuffer outBuffer = new StringBuffer(bufLen);

        for (int x = 0; x < len; x++) {
            char aChar = theString.charAt(x);
            // Handle common case first, selecting largest block that
            // avoids the specials below
            if ((aChar > 61) && (aChar < 127)) {
                if (aChar == '\\') {
                    outBuffer.append('\\');
                    outBuffer.append('\\');
                    continue;
                }
                outBuffer.append(aChar);
                continue;
            }
            switch (aChar) {
                case' ':
                    if (x == 0 || escapeSpace)
                        outBuffer.append('\\');
                    outBuffer.append(' ');
                    break;
                case'\t':
                    outBuffer.append('\\');
                    outBuffer.append('t');
                    break;
                case'\n':
                    outBuffer.append('\\');
                    outBuffer.append('n');
                    break;
                case'\r':
                    outBuffer.append('\\');
                    outBuffer.append('r');
                    break;
                case'\f':
                    outBuffer.append('\\');
                    outBuffer.append('f');
                    break;
                case'=':
                    // Fall through
                case':':
                    // Fall through
                case'#':
                    // Fall through
                case'!':
                    outBuffer.append('\\');
                    outBuffer.append(aChar);
                    break;
                default:
                    if ((aChar < 0x0020) || (aChar > 0x007e)) {
                        outBuffer.append('\\');
                        outBuffer.append('u');
                        outBuffer.append(toHex((aChar >> 12) & 0xF));
                        outBuffer.append(toHex((aChar >> 8) & 0xF));
                        outBuffer.append(toHex((aChar >> 4) & 0xF));
                        outBuffer.append(toHex(aChar & 0xF));
                    } else {
                        outBuffer.append(aChar);
                    }
            }
        }
        return outBuffer.toString();
    }

    /**
     * 将Unicode 字符串 转换成本地字符串
     *
     * @param unicode
     * @return
     */
    public static String Unicode2String(String unicode) {

        if (unicode == null)
            return null;

        char[] in = new char[unicode.length()];

        unicode.getChars(0, unicode.length(), in, 0);

        int off = 0;
        int len = in.length;
        char[] convtBuf = new char[200]; //默认为200个字符

        if (convtBuf.length < len) {
            int newLen = len * 2;
            if (newLen < 0) {
                newLen = Integer.MAX_VALUE;
            }
            convtBuf = new char[newLen];
        }
        char aChar;
        char[] out = convtBuf;
        int outLen = 0;
        int end = off + len;

        while (off < end) {
            aChar = in[off++];
            if (aChar == '\\') {
                aChar = in[off++];
                if (aChar == 'u') {
                    // Read the xxxx
                    int value = 0;
                    for (int i = 0; i < 4; i++) {
                        aChar = in[off++];
                        switch (aChar) {
                            case'0':
                            case'1':
                            case'2':
                            case'3':
                            case'4':
                            case'5':
                            case'6':
                            case'7':
                            case'8':
                            case'9':
                                value = (value << 4) + aChar - '0';
                                break;
                            case'a':
                            case'b':
                            case'c':
                            case'd':
                            case'e':
                            case'f':
                                value = (value << 4) + 10 + aChar - 'a';
                                break;
                            case'A':
                            case'B':
                            case'C':
                            case'D':
                            case'E':
                            case'F':
                                value = (value << 4) + 10 + aChar - 'A';
                                break;
                            default:
                                throw new IllegalArgumentException(
                                        "Malformed \\uxxxx encoding.");
                        }
                    }
                    out[outLen++] = (char) value;
                } else {
                    if (aChar == 't')
                        aChar = '\t';
                    else if (aChar == 'r')
                        aChar = '\r';
                    else if (aChar == 'n')
                        aChar = '\n';
                    else if (aChar == 'f')
                        aChar = '\f';
                    out[outLen++] = aChar;
                }
            } else {
                out[outLen++] = (char) aChar;
            }
        }
        return new String(out, 0, outLen);
    }

    /**
     * 将字符转换成UTF8
     *
     * @param arg
     * @return
     */
    public static String toUTF8(String arg) {

        byte[] b = arg.getBytes();
        char[] c = new char[b.length];
        for (int x = 0; x < b.length; x++)
            c[x] = (char) (b[x] & 0x00FF);

        return new String(c);

    }

    public static String toDateFormat(Timestamp datetime) {

        return toDateFormat(datetime, null);
    }

    public static String toDateFormat(Date datetime) {

        return toDateFormat(datetime, null);
    }

    public static String toDateFormat(Timestamp datetime, String pattern) {
        SimpleDateFormat sdf;
        if (datetime == null)
            return null;
        try {
            if (pattern == null) {
                pattern = "yyyy-MM-dd HH:ss";
            }
            sdf = new SimpleDateFormat(pattern);

        } catch (Exception e) {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:ss");
        }
        return sdf.format(datetime);
    }

    public static String toDateFormat(Date datetime, String pattern) {
        SimpleDateFormat sdf;
        if (datetime == null)
            return null;
        try {
            if (pattern == null) {
                pattern = "yyyy-MM-dd HH:ss";
            }
            sdf = new SimpleDateFormat(pattern);

        } catch (Exception e) {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:ss");
        }
        return sdf.format(datetime);
    }

    /**
     * 转换成SHA编码,主要用于加密运算
     *
     * @param password
     * @return
     */
    public static String encodeSHA(String password) {
        String ret = password;
        try {

            MessageDigest digest = MessageDigest.getInstance("SHA");

            byte encodes[] = digest.digest(password.getBytes());

            // Render the result as a String of hexadecimal digits
            StringBuffer result = new StringBuffer();
            for (int i = 0; i < encodes.length; i++) {
                byte b1 = (byte) ((encodes[i] & 0xf0) >> 4);
                byte b2 = (byte) (encodes[i] & 0x0f);
                if (b1 < 10)
                    result.append((char) ('0' + b1));
                else
                    result.append((char) ('A' + (b1 - 10)));
                if (b2 < 10)
                    result.append((char) ('0' + b2));
                else
                    result.append((char) ('A' + (b2 - 10)));
            }
            ret = result.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

    /**
     * 将文本转换成标准的html，便于显示
     *
     * @param html
     * @return
     */
    public static String toPlainText(String html) {
        return toPlainText(html, false);
    }

    public static String toPlainText(String html, boolean convertBr) {
        //标准得html字符
        html = html.replaceAll("&", "&amp;");
        html = html.replaceAll("<", "&lt;");
        html = html.replaceAll(">", "&gt;");
        html = html.replaceAll("\"", "&quot;");
        if (convertBr) {
            html = html.replaceAll("\r", "");
            html = html.replaceAll("\n", "<br>");
            html = html.replaceAll("\r\n", "<br>");
        } else {
            html = html.replaceAll("\r\n", "");
        }
        //特殊字符,会引起JavaScript错误
        html = html.replaceAll("\t", ""); //转义字符
        html = html.replaceAll("'", "‘"); //'
        return html;
        //以下方法会导致汉字变成UTF－8编码
//        String temp = StringEscapeUtils.escapeJavaScript(StringEscapeUtils
//                .escapeHtml(html));
//        if (convertBr) {
//            temp = temp.replaceAll("\\\\r", "");
//            temp = temp.replaceAll("\\\\n", "<br>");
//        } else {
//            temp = StringEscapeUtils.escapeJava(temp);
//        }
//        return temp;
    }

    /**
     * 将回车转换成<br>
     *
     * @param html
     * @return
     */
    public static String toBr(String html) {

        if (html != null && html.length() > 0) {
            String temp = html;
            temp = temp.replaceAll("\n", "<br>");
            temp = temp.replaceAll("\r", "");
            temp = temp.replaceAll("\r\n", "<br>");
            return temp;
        }
        return "";
    }

    /**
     * 将blob类型转换成String类型
     *
     * @param blob
     * @return
     */
    public static String blob2String(Blob blob) {
        try {
            InputStream inStream = blob.getBinaryStream();
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            int bytesRead;
            byte[] buffer = new byte[8192];
            //long length = 0;

            while ((bytesRead = inStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
                //length += bytesRead;
            }

            inStream.close();
            outStream.close();

            return outStream.toString();
        } catch (Exception e) {
            log.error(e);
            return "读取发生错误!";
        }
    }

    /**
     * 获得16进制编码
     *
     * @param nibble
     * @return
     */
    private static char toHex(int nibble) {
        return hexDigit[(nibble & 0xF)];
    }

    /**
     * A table of hex digits
     */
    private static final char[] hexDigit = {'0', '1', '2', '3', '4', '5', '6',
            '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    /**
     * 隐藏Ip
     * 202.101.303.202 => 202.*.*.202
     *
     * @param ip
     * @return
     */
    public static String toMaskIp(String ip) {
        if (ValidateUtil.isNull(ip))
            return "";
        return ip.replaceAll("(\\.\\d{1,}+\\.\\d{1,}+\\.)", ".*.*.");
    }

    
}