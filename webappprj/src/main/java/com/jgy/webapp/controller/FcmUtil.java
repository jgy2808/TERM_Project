package com.jgy.webapp.controller;

import java.io.FileInputStream;

import org.springframework.stereotype.Component;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.AndroidConfig;
import com.google.firebase.messaging.AndroidNotification;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;

@Component
public class FcmUtil {
	public void send_FCM(String tokenId, String title, String content) {
		try {
			FileInputStream refreshToken = new FileInputStream(
					"C:\\Users\\niceg\\Documents\\GitHub\\TERM_Project\\webappprj\\src\\main\\webapp\\resource\\google\\json\\term-push-ef11d-firebase-adminsdk-gt50s-c6cd34c916.json");

			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(refreshToken))
					.setDatabaseUrl("https://oauth2.googleapis.com/token").build();

			if (FirebaseApp.getApps().isEmpty()) {
				FirebaseApp.initializeApp(options);
			}
			String registrationToken = tokenId;

			Message msg = Message.builder()
					.setAndroidConfig(
							AndroidConfig.builder().setTtl(3600 * 1000).setPriority(AndroidConfig.Priority.NORMAL)
									.setNotification(AndroidNotification.builder().setTitle(title).setBody(content)
											.setIcon("stock_ticker_update").setColor("#f45342").build())
									.build())
					.putData("time", "14:00")
					.setToken(registrationToken).build();

			String response = FirebaseMessaging.getInstance().send(msg);
			System.out.println("Successfully sent massage: " + response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
