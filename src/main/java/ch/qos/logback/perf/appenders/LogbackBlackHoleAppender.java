package ch.qos.logback.perf.appenders;

import ch.qos.logback.core.OutputStreamAppender;

import java.io.OutputStream;

public class LogbackBlackHoleAppender extends OutputStreamAppender {

    @Override
    public void start() {
        OutputStream os = OutputStream.nullOutputStream();
        super.setOutputStream(os);
        super.start();
    }
}
