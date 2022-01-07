package com.entity;

public class SnsUserMessages {
	
	private String  msg_sender, msg_receiver, msg_date,msg_content,msg_type,msg_status,msg_image,msg_file;
    int msg_id,msg_reply_code;

    public String getMsg_image() {
        return msg_image;
    }

    public void setMsg_image(String msg_image) {
        this.msg_image = msg_image;
    }

    public String getMsg_file() {
        return msg_file;
    }

    public void setMsg_file(String msg_file) {
        this.msg_file = msg_file;
    }

    public int getMsg_id() {
        return msg_id;
    }

    public int getMsg_reply_code() {
        return msg_reply_code;
    }

    public void setMsg_reply_code(int msg_reply_code) {
        this.msg_reply_code = msg_reply_code;
    }

    public void setMsg_id(int msg_id) {
        this.msg_id = msg_id;
    }

    public String getMsg_sender() {
        return msg_sender;
    }

    public void setMsg_sender(String msg_sender) {
        this.msg_sender = msg_sender;
    }

    public String getMsg_receiver() {
        return msg_receiver;
    }

    public void setMsg_receiver(String msg_receiver) {
        this.msg_receiver = msg_receiver;
    }

    public String getMsg_date() {
        return msg_date;
    }

    public void setMsg_date(String msg_date) {
        this.msg_date = msg_date;
    }

    public String getMsg_content() {
        return msg_content;
    }

    public void setMsg_content(String msg_content) {
        this.msg_content = msg_content;
    }

    public String getMsg_type() {
        return msg_type;
    }

    public void setMsg_type(String msg_type) {
        this.msg_type = msg_type;
    }

    public String getMsg_status() {
        return msg_status;
    }

    public void setMsg_status(String msg_status) {
        this.msg_status = msg_status;
    }

}
