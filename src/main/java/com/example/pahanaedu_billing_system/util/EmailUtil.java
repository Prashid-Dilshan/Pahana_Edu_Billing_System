package com.example.pahanaedu_billing_system.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.io.File;
import java.util.Properties;

public class EmailUtil {

    public static boolean sendEmailWithAttachment(String toEmail, String subject, String messageText, File attachment) {
        final String fromEmail = "prashiddilshan0710@gmail.com";     // ✅ ඔබගේ Gmail එක මෙහි යොදන්න
        final String password = "usct akbi ojes gixh";          // ✅ Gmail App Password

        // SMTP configuration
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // Create email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "Pahana Edu Bookshop"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);

            // Text part
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setText(messageText);

            // Attachment part
            MimeBodyPart attachmentPart = new MimeBodyPart();
            attachmentPart.attachFile(attachment);

            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            multipart.addBodyPart(attachmentPart);

            message.setContent(multipart);

            // Send email
            Transport.send(message);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
