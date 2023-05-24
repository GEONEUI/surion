package com.surion.entity;

import java.io.*;
import java.net.*;
import java.util.*;


public class SocketClient {
	public void client(String id, String chat) {
		try {
			Socket socket = new Socket("127.0.0.1", 6666);
			String name = id;
			String message = chat;
			ClientSender clientSender = new ClientSender(socket, name, message);
			ClientReciver clientReciver = new ClientReciver(socket);
			clientSender.start();
			clientReciver.start();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static class ClientSender extends Thread {
		DataOutputStream out;
		Socket socket;
		String name;
		String message;

		public ClientSender(Socket socket, String name, String message) {
			this.socket = socket;
			this.name = name;
			this.message = message;

			try {
				out = new DataOutputStream(socket.getOutputStream());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void run() {
			try {
				if (out != null) {
					out.writeUTF(name);
				}
				while (out != null) {
					System.out.println("?????");
					out.writeUTF(name + ":" + message);
				}
				out.close();
				socket.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	static class ClientReciver extends Thread {
		DataInputStream in;
		Socket socket;

		public ClientReciver(Socket socket) {
			this.socket = socket;
			try {
				in = new DataInputStream(socket.getInputStream());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void run() {
			while (in != null) {
				try {
					System.out.println(in.readUTF());
				} catch (Exception e) {
					e.printStackTrace();
					break;
				}
			}
			try {
				in.close();
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}
