/* Copyright © 2010 www.myctu.cn. All rights reserved. */
/**
 * project : ctu-utils
 * user created : pippo
 * date created : 2013-4-17 - 下午12:11:51
 */
package com.myctu.platform;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.GzipDecompressingEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParams;
import org.apache.http.params.SyncBasicHttpParams;
import org.apache.http.protocol.HTTP;
import org.apache.http.protocol.HttpContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @since 2013-4-17
 * @author pippo
 */
public class AbstractHttpHelper {

    private static Logger logger = LoggerFactory.getLogger(AbstractHttpHelper.class);

    public static final String GZIP = "gzip";
    public static final String ACCEPT_ENCODING = "Accept-Encoding";

    protected DefaultHttpClient httpclient;

    protected interface RequestCreator {

        HttpRequestBase create() throws Exception;

    }

    protected void addGzipSupport() {
        httpclient.addRequestInterceptor(new HttpRequestInterceptor() {

            public void process(final HttpRequest request, final HttpContext context) throws HttpException, IOException {
                if (!request.containsHeader(ACCEPT_ENCODING)) {
                    request.addHeader(ACCEPT_ENCODING, GZIP);
                }
            }

        });

        httpclient.addResponseInterceptor(new HttpResponseInterceptor() {

            public void process(final HttpResponse response, final HttpContext context) throws HttpException,
                    IOException {
                HttpEntity entity = response.getEntity();
                if (entity == null) {
                    return;
                }

                Header ceheader = entity.getContentEncoding();
                if (ceheader == null) {
                    return;
                }

                HeaderElement[] codecs = ceheader.getElements();

                for (int i = 0; i < codecs.length; i++) {
                    if (codecs[i].getName().equalsIgnoreCase(GZIP)) {
                        logger.debug("the content encoding is:{}, use gzip decompressing", Arrays.toString(codecs));
                        response.setEntity(new GzipDecompressingEntity(entity));
                        return;
                    }
                }

            }

        });
    }

    protected void setClientParameters() {
        HttpParams clientParams = new SyncBasicHttpParams();
        clientParams.setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 1000);
        clientParams.setParameter(CoreConnectionPNames.SO_TIMEOUT, 60000);
        clientParams.setParameter(CoreConnectionPNames.SOCKET_BUFFER_SIZE, 4096);
        httpclient.setParams(clientParams);
    }

    protected void setKeepAliveStrategy() {
        httpclient.setKeepAliveStrategy(new ConnectionKeepAliveStrategy() {

            public long getKeepAliveDuration(HttpResponse response, HttpContext context) {
                return 120 * 1000;
            }

        });
    }

    public <T> T doPost(final String uri, final byte[] body, final HttpParams configParams, ResponseHandler<T> handler) {

        return executeRequest(new RequestCreator() {

            @Override
            public HttpRequestBase create() throws Exception {
                HttpPost post = new HttpPost(uri);
                setRequestConfigParameters(configParams, post);
                post.setEntity(new ByteArrayEntity(body));
                return post;
            }
        }, handler);
    }

    private static final String parameterValuesDelimiter = ",";

    public <T> T doPost(final String uri,
            final Map<String, ?> parameters,
            final HttpParams configParams,
            ResponseHandler<T> handler) {

        return this.executeRequest(new RequestCreator() {

            @Override
            public HttpRequestBase create() throws Exception {
                HttpPost post = new HttpPost(uri);

                List<NameValuePair> nvps = null;
                if (parameters != null) {
                    nvps = new ArrayList<NameValuePair>();
                    for (String name : parameters.keySet()) {
                        Object value = parameters.get(name);

                        if (value == null) {
                            value = StringUtils.EMPTY;
                        }

                        if (value instanceof String[]) {
                            String[] _values = (String[]) value;
                            value = _values.length > 1 ? StringUtils.join(value, parameterValuesDelimiter) : _values[0];
                        }

                        nvps.add(new BasicNameValuePair(name, (String) value));
                    }
                    post.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
                }

                setRequestConfigParameters(configParams, post);
                return post;
            }
        },
            handler);
    }

    public <T> T doGet(final String uri, final HttpParams configParams, ResponseHandler<T> handler) {

        return executeRequest(new RequestCreator() {

            @Override
            public HttpRequestBase create() throws Exception {
                HttpGet get = new HttpGet(uri);
                setRequestConfigParameters(configParams, get);
                return get;
            }
        }, handler);
    }

    protected <T> T executeRequest(RequestCreator creator, final ResponseHandler<T> handler) {

        HttpRequestBase request = null;
        try {
            request = creator.create();

            T response = (T) httpclient.execute(request, new ResponseHandler<T>() {

                @Override
                public T handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
                    validateResponseStatus(response);
                    return handler.handleResponse(response);
                }
            });

            return (T) response;
        } catch (UnexpectHttpStatusException e) {
            throw e;
        } catch (Exception e) {
            logger.error("execute request:[{}] due to error:[{}]", request.getURI(), ExceptionUtils.getStackTrace(e));
            throw new RuntimeException(e);
        } finally {
            if (request != null) {
                request.abort();
            }
        }
    }

    protected void setRequestConfigParameters(HttpParams configParams, HttpRequestBase request) {
        if (configParams != null) {
            request.setParams(configParams);
        }
    }

    private void validateResponseStatus(HttpResponse response) throws UnexpectHttpStatusException, IOException {
        int status = response.getStatusLine().getStatusCode();
        if (status == 200) {
            return;
        }

        throw new UnexpectHttpStatusException(status,
            String.format("the request failed, the status is:[%s], the response is:[%s]",
                response.getStatusLine(),
                IOUtils.toString(response.getEntity().getContent())));
    }

}