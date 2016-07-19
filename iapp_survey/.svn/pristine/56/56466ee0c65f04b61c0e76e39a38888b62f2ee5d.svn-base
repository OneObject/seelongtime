import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;


public class RobamGenderProccess {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static void main(String[] args) throws FileNotFoundException, IOException {
		
		String file = "c:/sqlresult_171434.csv";
		
		List<String> list = IOUtils.readLines(new FileInputStream(file));
		
		List<String> outList = Lists.newArrayList();
		for (String string : list) {
			
			if(StringUtils.isBlank(string)){
				continue;
			}
			string = string.replace("\"", "");
			
			String[] items = string.split(",");
			
			String sql = String.format("update iapp_base_user set gender=%s,synchronousstatus=0,synctype=2  where id='%s';", items[1],items[0]);
			
			System.out.println(sql);
			outList.add(sql);
		}
		
		IOUtils.writeLines(outList, "\n", new FileOutputStream("c:/robam.sql"));
		
		

	}

}
