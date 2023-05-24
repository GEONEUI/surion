package com.surion.entity;

import java.net.*;
import java.util.*;
import java.io.*;

public class SocketServer {
	
	HashMap client;
	
	public SocketServer() {
		client = new HashMap();
		Collections.synchronizedMap(client);
	}
	
		

	
	public void start() {
		ServerSocket ss = null;
		Socket socket = null;
		
		try {
			ss = new ServerSocket(6666);
			while(true) {
				socket = ss.accept();
				System.out.println("서버 start");
				ServerReciver serverReciver = new ServerReciver(socket);
				System.out.println(socket.getInetAddress() + "손님");
				serverReciver.start();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void sendToAll(String msg) { //브로드 캐스팅
		Iterator iter = client.keySet().iterator();
		while(iter.hasNext()) {
			DataOutputStream out = (DataOutputStream) client.get(iter.next());
			try {
				out.writeUTF(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public class ServerReciver extends Thread{
		DataInputStream in;
		DataOutputStream out;
		Socket socket;
		
		
		public ServerReciver(Socket socket) {
			this.socket = socket;
			try {
				in = new DataInputStream(socket.getInputStream());
				out = new DataOutputStream(socket.getOutputStream());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void run() {
			String name = "";
			try {
				name = in.readUTF();
				if(client.get(name) != null) {
					in.close();
					out.close();
					socket.close();
				}else {
					sendToAll(name);
					client.put(name, out);
					while(in != null) {
						sendToAll(in.readUTF());
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
