import java.net.URLEncoder;

import java.net.URL;
import com.longtime.common.utils.DateUtils;
import com.longtime.app.ixin.utils.DateUtil;
import org.apache.commons.lang3.RandomStringUtils;
import com.longtime.ajy.support.PasswordEncoder;


public class PwdDecode {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println(Integer.parseInt("101", 2));;

		System.out.println(PasswordEncoder.decode("58dc1583de87eaa2", "-1"));
	
		System.out.println(RandomStringUtils.randomAlphanumeric(100));
		
		
		System.out.println(DateUtils.parseStringToLong("2015-03-14 00:00"));
		System.out.println(DateUtils.parseStringToLong("2015-03-15 00:00"));
		
		
		System.out.println("a:b:c".split(":",2)[1]);
		
		long start = DateUtils.parseStringToLong("2015-03-19 00:00");
		long end = DateUtils.parseStringToLong("2015-03-20 00:00");
		
		System.out.println("select  DISTINCT u.id as id , u.username as 用户名 ,u.name  as 姓名,o.name as 组织名称 ,o.id  as 组织id, j.`name` as 岗位名称 ,j.id  as 岗位id from iapp_base_user u left join trace t on t.uid = u.id  left join iapp_base_organization o on o.id = u.oid  left join iapp_base_user_joblevel  uj on uj.userid = u.id  left join  iapp_base_joblevel j  on j.id =  uj.joblevelid where t.id is not  null and t.time>="+ start +" and t.time<" + end + "  order by o.id");
		
	
		System.out.println(URLEncoder.encode("http://www.aijiayou.com/iapp/protal/rank/credit.xhtml?fdomain=syngenta"));
		
	}

}
