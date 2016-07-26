package com.longtime.app.document;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.commons.lang3.Validate;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.artofsolving.jodconverter.OfficeDocumentConverter;
import org.artofsolving.jodconverter.office.DefaultOfficeManagerConfiguration;
import org.artofsolving.jodconverter.office.OfficeManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component("openOfficeProxy")
public class OpenOfficeProxy {

    private static final Logger logger = LoggerFactory.getLogger(OpenOfficeProxy.class);

    private OfficeManager officeManager = null;
    
    @PostConstruct
    public void init() {
        officeManager = getOfficeManager();
    }

    @PreDestroy
    public void destory() {
        if (officeManager != null) {
            officeManager.stop();
        }
    }

    private synchronized OfficeManager getOfficeManager() {
        try {
            if (officeManager != null) {
                return officeManager;
            }
            OfficeManager officeManager = new DefaultOfficeManagerConfiguration().setTaskExecutionTimeout(
                    1000 * 60 * 10)
                    .buildOfficeManager();
            officeManager.start();
            return officeManager;
        } catch (Exception e) {
            logger.error("get office manager due to error", e);
            destory();
            throw new RuntimeException(e);
        }
    }

    public synchronized void convert(File sourceFile, File targetFile) {
        Validate.isTrue(sourceFile != null && sourceFile.exists() && sourceFile.isFile(), "invalid source file:[%s]",
                        sourceFile);

        try {
            OfficeDocumentConverter converter = new OfficeDocumentConverter(getOfficeManager());
            converter.convert(sourceFile, targetFile);
        } catch (Throwable e) {
            logger.debug("convert file:[{}] due to error", sourceFile, ExceptionUtils.getStackTrace(e));
            throw new RuntimeException(e);
        }

        Validate.isTrue(targetFile != null && targetFile.exists() && targetFile.isFile(), "invalid target file:[%s]",
                        sourceFile);
    }
}
