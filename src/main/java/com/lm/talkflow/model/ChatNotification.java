package com.lm.talkflow.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatNotification {

    private String id;
    private String senderId;
    private String recipientId;
    private String content;
}
