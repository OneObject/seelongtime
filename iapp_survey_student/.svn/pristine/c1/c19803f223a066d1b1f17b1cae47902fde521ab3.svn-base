/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : des-rss-fetcher
 * user created : pippo
 * date created : 2009-8-29 - 上午01:00:51
 */
package com.myctu.platform;

import java.io.IOException;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HTTP;

/**
 * @since 2009-8-29
 * @author pippo
 */
public final class HttpHelper extends AbstractHttpHelper {

    protected static HttpHelper instance = new HttpHelper();

    public static HttpHelper get() {
        return instance;
    }

    private HttpHelper() {
        ThreadSafeClientConnManager cm = new ThreadSafeClientConnManager();
        cm.setDefaultMaxPerRoute(Runtime.getRuntime().availableProcessors() * 1024);
        cm.setMaxTotal(Runtime.getRuntime().availableProcessors() * 1024);

        httpclient = new DefaultHttpClient(cm);

        addGzipSupport();
        setKeepAliveStrategy();
        setClientParameters();
    }

    /************* post by parameters and handler ***********/

    public <T> T doPost(final String uri, final Map<String, ?> parameters, ResponseHandler<T> handler) {
        return super.doPost(uri, parameters, null, handler);
    }

    /********* post by patameters only *************/

    public String doPost(String uri, final Map<String, String> parameters, final String charset) {

        return super.doPost(uri, parameters, null, new ResponseHandler<String>() {

            @Override
            public String handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
                return IOUtils.toString(response.getEntity().getContent(), charset);
            }
        });

    }

    public String doPost(String uri, final Map<String, String> parameters) {
        return this.doPost(uri, parameters, HTTP.UTF_8);
    }

    /************** post by body and handler *******************/

    public <T> T doPost(final String uri, final String body, final HttpParams configParams, ResponseHandler<T> handler) {
        return super.doPost(uri, body.getBytes(), configParams, handler);
    }

    public <T> T doPost(final String uri, final String body, ResponseHandler<T> handler) {
        return this.doPost(uri, body, null, handler);
    }

    /**************** post by body only ************************/

    public String doPost(String uri, final String body, final String charset) {

        return this.doPost(uri, body, new ResponseHandler<String>() {

            @Override
            public String handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
                return IOUtils.toString(response.getEntity().getContent(), charset);
            }
        });
    }

    public String doPost(String uri, final String body) {
        return this.doPost(uri, body, HTTP.UTF_8);
    }

    /********* get by uri ********************/

    public <T> T doGet(final String uri, ResponseHandler<T> handler) {
        return super.doGet(uri, null, handler);
    }

    public String doGet(String uri, final String charset) {

        return this.doGet(uri, new ResponseHandler<String>() {

            @Override
            public String handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
                return IOUtils.toString(response.getEntity().getContent(), charset);
            }

        });
    }

    public String doGet(String uri) {
        return this.doGet(uri, HTTP.UTF_8);
    }

}
