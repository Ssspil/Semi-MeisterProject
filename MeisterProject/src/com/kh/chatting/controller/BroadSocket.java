package com.kh.chatting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
 
// WebSocket 호스트 설정
@ServerEndpoint("/broadsocket")
public class BroadSocket {
  private static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList<>());
  private static Pattern pattern = Pattern.compile("^\\{\\{.*?\\}\\}");
  @OnOpen
  public void handleOpen(Session userSession) {
    sessionUsers.add(userSession);
    System.out.println("client is now connected...");
  }
  @OnMessage
  public void handleMessage(String message, Session userSession) throws IOException {
    System.out.println(message);
    String name = "anonymous";
    Matcher matcher = pattern.matcher(message);
    if (matcher.find()) {
      name = matcher.group();
    }
    final String msg = message.replaceAll(pattern.pattern(), "");
    final String username = name.replaceFirst("^\\{\\{", "").replaceFirst("\\}\\}$", "");
    sessionUsers.forEach(session -> {
      if (session == userSession) {
        return;
      }
      try {
        session.getBasicRemote().sendText(username + " => " + msg);
      } catch (IOException e) {
        e.printStackTrace();
      }
    });
  }
  @OnClose
  public void handleClose(Session userSession) {
    sessionUsers.remove(userSession);
    System.out.println("client is now disconnected...");
  }
}
