import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.math.NumberUtils;


public class TlzbTest {
	
	public static void main(String[] args) throws FileNotFoundException, IOException {
		
		String file= "/Users/longtime/Downloads/sqlresult_129466.csv";
		
		List<String> list = IOUtils.readLines(new FileInputStream(file));
		
		
		for(int i=1;i<list.size();i++){
			
			String str = list.get(i);
			
			String[] items = str.split(",");
			String uname = items[0].replaceAll("\"", "");
			String name = items[1].replaceAll("\"", "");
			String cname = items[2].replaceAll("\"", "");
			String total = items[3].replaceAll("\"", "");
			String lastTime = items[4].replaceAll("\"", "");
			String len = items[5].replaceAll("\"", "");
			
			String showTotal = formatSecToTimeStr(NumberUtils.toLong(total));
			
			long longLen = ( (Float)(NumberUtils.toFloat(len))).longValue();
			
			long total_m = NumberUtils.toLong(total);
			
			String precent = getPercent(total_m, longLen*60 );
			//System.out.println(String.format("%s %s %s", total_m, longLen*60, precent));
			
			
			System.out.println(String.format("insert into test values(null,'%s','%s','%s','%s','%s','%s','%s');", uname,name,cname,longLen,showTotal,lastTime,precent));
			
		}
		
	}
	
	public static String formatSecToTimeStr(long timeSec) {
		int hour = 0;
		int minute = 0;
		int second = (int)timeSec;
		if (second > 60) {
			minute = second / 60;
			second = second % 60;
		}
		if (minute > 60) {
			hour = minute / 60;
			minute = minute % 60;
		}
		return (hour < 10 ? ("0" + hour) : hour) + ":" + (minute < 10 ? ("0" + minute) : minute) + ":"
				+ (second < 10 ? ("0" + second) : second);
	}
	
	public static String getPercent(long y, long z) {  
		if(y>=z){
			return "100%";
		}
        String baifenbi = "";// 接受百分比的值  
        double baiy = y * 1.0;  
        double baiz = z * 1.0;  
        double fen = baiy / baiz;  
        // NumberFormat nf = NumberFormat.getPercentInstance(); 注释掉的也是一种方法  
        // nf.setMinimumFractionDigits( 2 ); 保留到小数点后几位  
        DecimalFormat df1 = new DecimalFormat("#0.0%"); // ##.00%  
                                                            // 百分比格式，后面不足2位的用0补齐  
        // baifenbi=nf.format(fen);  
        baifenbi = df1.format(fen);  
        return baifenbi;  
    } 

}
