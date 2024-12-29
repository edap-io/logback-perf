package ch.qos.logback.perf.appenders;

import io.edap.log.appenders.OutputStremAppender;
import io.edap.log.io.BaseLogOutputStream;

import java.io.OutputStream;

public class EdapBlackHoleAppender extends OutputStremAppender {

    @Override
    public void start() {
        OutputStream os = OutputStream.nullOutputStream();
        super.setOutputStream(new BaseLogOutputStream(os));
        super.start();
    }
}
