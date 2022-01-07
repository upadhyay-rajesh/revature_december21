
package bean;

import java.util.Comparator;

import com.entity.SnsUserMessages;

public class comparator implements Comparator {

    @Override
    public int compare(Object a, Object b) {
        SnsUserMessages x=(SnsUserMessages)a;
        SnsUserMessages y=(SnsUserMessages)b;
        int msg_reply_code=x.getMsg_reply_code();
        int msg_reply_code1=y.getMsg_reply_code();
       // if((msg_reply_code).equals(0)&&(msg_reply_code1).equals(0))
       //         {
        int p=x.getMsg_id();
        int q=y.getMsg_id();
        int n;
        if(p>q)
        n=-1;
        else if(p<q)
            n=1;
        else
            n=0;
        return n;
        //        }
        //else
        //        {
        //String p=x.getMsg_id();
        //String q=y.getMsg_id();
        //int n=p.compareTo(q);
        //return n;
        //        }
    }
    
}
