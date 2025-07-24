package com.example.pahanaedu_billing_system.util;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SMSSender {
    // Replace with your Twilio credentials
    public static final String ACCOUNT_SID = "YOUR_TWILIO_ACCOUNT_SID";
    public static final String AUTH_TOKEN = "YOUR_TWILIO_AUTH_TOKEN";
    public static final String TWILIO_NUMBER = "+1234567890"; // Your Twilio phone number

    public static boolean sendSMS(String toPhoneNumber, String messageText) {
        try {
            Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

            Message message = Message.creator(
                    new PhoneNumber(toPhoneNumber),
                    new PhoneNumber(TWILIO_NUMBER),
                    messageText
            ).create();

            System.out.println("✅ SMS Sent SID: " + message.getSid());
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
