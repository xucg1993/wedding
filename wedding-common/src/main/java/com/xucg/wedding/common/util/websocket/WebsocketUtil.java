package com.xucg.wedding.common.util.websocket;

import org.springframework.web.socket.WebSocketSession;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class WebsocketUtil {

    private final static WebsocketUtil instance = new WebsocketUtil();

    private Map<String, WebSocketSession> sockets = new ConcurrentHashMap<>();

    private WebsocketUtil() {}

    public static WebsocketUtil getInstance() {
        return instance;
    }

    public void put(String key, WebSocketSession session) {
        sockets.put(key, session);
    }

    public void remove(String key) {
        sockets.remove(key);
    }

    public WebSocketSession get(String key) {
        return sockets.get(key);
    }

    public int size() {
        return sockets.size();
    }
}
