<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.longtime.ajy.mweb.MwebHelper"%>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.google.common.collect.Lists" %>
<%@ page import="java.util.List" %>
<%@ page import="com.longtime.ajy.model.User" %>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<%!
    static class EnnUserGroup {
        String uid;
        String uname;
        String group;
        public EnnUserGroup(){}
        public EnnUserGroup(String uid, String uname, String group){
            this.uname = uname;
            this.uid = uid;
            this.group = group;
        }
        public boolean isMe(String uid,String uname){
            if(uid.equals(this.uid) || this.uname.equals(uname)){
                return true;
            }
            return false;
        }

        public boolean isSameGroup(EnnUserGroup userGroup){
            if(null==userGroup){
                return false;
            }
            if(this.group.equals(userGroup.group)){
                return true;
            }
            return false;
        }
    }

    public static EnnUserGroup find(List<EnnUserGroup> userGroups,String uid,String uname){
        uname = StringUtils.trimToEmpty(uname);
        uid = StringUtils.trimToEmpty(uid);
        for (EnnUserGroup item:userGroups){
            if(item.isMe(uid,uname)){
                return item;
            }
        }
        return null;

    }

    public static List<EnnUserGroup> findSameGroup(List<EnnUserGroup> all, EnnUserGroup userGroup){
        List<EnnUserGroup> same = Lists.newArrayList();

        if(null==userGroup){
            return same;
        }

        for (EnnUserGroup item:all){
            if(item.isSameGroup(userGroup) && !item.isMe(userGroup.uid,userGroup.uname)){

                same.add(item);
            }
        }
        return same;
    }

    public void  addData(List<EnnUserGroup> all,String uid,String uname,String group){
        all.add(new EnnUserGroup(uid,uname,group));
    }

%>
<%

    List<EnnUserGroup> list = Lists.newArrayList();

    addData(list,"ajy", "爱加油1", "第二组");
    addData(list,"ajy2", "爱加油2", "第二组");
    addData(list,"ajy3", "爱加油3", "第二组");

    addData(list,"10031637", "黄丽珍", "第1组");
    addData(list,"10067000", "朱志林", "第1组");
    addData(list,"11402520", "许梓扬", "第1组");
    addData(list,"10001022", "宋新", "第1组");
    addData(list,"16000336", "王跃", "第1组");
    addData(list,"10036730", "王玉亮", "第1组");
    addData(list,"12000046", "檀国民", "第1组");
    addData(list,"10039995", "蔡圣华", "第2组");
    addData(list,"17000016", "秦玲", "第2组");
    addData(list,"10103134", "吴圣明", "第2组");
    addData(list,"10065000", "张文会", "第2组");
    addData(list,"10027011", "董加秋", "第2组");
    addData(list,"14000729", "马元彤", "第2组");
    addData(list,"10011018", "杨玉明", "第2组");
    addData(list,"10006689", "何靖", "第2组");
    addData(list,"10000233", "梁宏玉", "第2组");
    addData(list,"10022964", "王子峥", "第3组");
    addData(list,"10000005", "郭幼娟", "第3组");
    addData(list,"10055016", "陈勇博", "第3组");
    addData(list,"10042004", "董克春", "第3组");
    addData(list,"10025003", "刘建军", "第3组");
    addData(list,"10043601", "马介武", "第3组");
    addData(list,"10001192", "贾建刚", "第3组");
    addData(list,"10000155", "洪艳辉", "第3组");
    addData(list,"10000047", "葛玉良", "第4组");
    addData(list,"10001006", "韩继深", "第4组");
    addData(list,"10104945", "周群", "第4组");
    addData(list,"10052000", "苏莉", "第4组");
    addData(list,"14000128", "何建辉", "第4组");
    addData(list,"11000232", "张军", "第4组");
    addData(list,"16000065", "徐文忠", "第4组");
    addData(list,"50000063", "常空", "第5组");
    addData(list,"10000088", "姜域", "第5组");
    addData(list,"10055002", "何蕾", "第5组");
    addData(list,"14000011", "张国忠", "第5组");
    addData(list,"11403337", "蒋建林", "第5组");
    addData(list,"12001018", "范保军", "第5组");
    addData(list,"10043600", "甘明福", "第5组");
    addData(list,"L000006", "徐敏俊", "第5组");
    addData(list,"10037000", "葛华", "第5组");
    addData(list,"10044156", "王文涛", "第6组");
    addData(list,"10001032", "张晓春", "第6组");
    addData(list,"11400832", "周立勇", "第6组");
    addData(list,"10002684", "马文义", "第6组");
    addData(list,"10000176", "钱为强", "第6组");
    addData(list,"50000425", "刘胜", "第6组");
    addData(list,"10058099", "陆泽", "第6组");
    addData(list,"10000046", "蔡福英", "第7组");
    addData(list,"50000120", "邹立群", "第7组");
    addData(list,"10063003", "吴晓菁", "第7组");
    addData(list,"10024485", "陈向前", "第7组");
    addData(list,"10102005", "覃远浩", "第7组");
    addData(list,"10112000", "夏广军", "第7组");
    addData(list,"10001158", "于槐林", "第7组");
    addData(list,"10039791", "王兴银", "第7组");
    addData(list,"15000615", "付海涛", "第7组");
    addData(list,"10001193", "丁桂环", "第8组");
    addData(list,"12000002", "赵小文", "第8组");
    addData(list,"10020018", "宋立志", "第8组");
    addData(list,"10041000", "谷洪万", "第8组");
    addData(list,"10017886", "路敬新", "第8组");
    addData(list,"10006181", "程乐明", "第8组");
    addData(list,"10074000", "周金华", "第8组");
    addData(list,"15000012", "张建", "第8组");
    addData(list,"15006525", "迟兴民", "第8组");
    addData(list,"10031992", "马深远", "第9组");
    addData(list,"10001102", "李会玲", "第9组");
    addData(list,"10001021", "宋伟", "第9组");
    addData(list,"10108022", "陈锡曾", "第9组");
    addData(list,"10008005", "蔡志鹏", "第9组");
    addData(list,"17001874", "朱振旗", "第9组");
    addData(list,"10001391", "朱磊", "第9组");
    addData(list,"10105008", "石岱辉", "第9组");
    addData(list,"10050002", "汪达汉", "第9组");
    addData(list,"14000018", "王金峰", "第10组");
    addData(list,"10000006", "张利娜", "第10组");
    addData(list,"10112189", "季军", "第10组");
    addData(list,"16000017", "李培立", "第10组");
    addData(list,"11407836", "余峻", "第10组");
    addData(list,"10042280", "张涛", "第10组");
    addData(list,"10030790", "张建奎", "第10组");
    addData(list,"10001007", "鞠喜林", "第11组");
    addData(list,"10020794", "李晓峰", "第11组");
    addData(list,"15000000", "吴杰", "第11组");
    addData(list,"10010308", "陈泓予", "第11组");
    addData(list,"10010394", "牟妮妮", "第11组");
    addData(list,"10000069", "邢景放", "第11组");
    addData(list,"10001017", "任宝华", "第11组");
    addData(list,"18000078", "吕军震", "第12组");
    addData(list,"11402182", "史豪", "第11组");
    addData(list,"10038418", "徐丹", "第12组");
    addData(list,"11400026", "宫罗建", "第12组");
    addData(list,"10002000", "杨钧", "第12组");
    addData(list,"10038335", "杜忠文", "第12组");
    addData(list,"10000040", "杨宇", "第13组");
    addData(list,"10030562", "吴永建", "第13组");
    addData(list,"10000002", "李晓菲", "第13组");
    addData(list,"10001108", "陈胜利", "第13组");
    addData(list,"13006002", "董国强", "第13组");
    addData(list,"10057001", "李日森", "第13组");
    addData(list,"10011017", "高继华", "第13组");
    addData(list,"18000084", "胥洪锋", "第13组");
    addData(list,"10001010", "梁志伟", "第14组");
    addData(list,"10001004", "赵金峰", "第14组");
    addData(list,"10001638", "张杏兰", "第14组");
    addData(list,"10000021", "庞涛", "第19组");
    addData(list,"10008182", "魏兴元", "第14组");
    addData(list,"10116003", "裴兵", "第14组");
    addData(list,"10010802", "乔林基", "第14组");
    addData(list,"10001103", "郭树青", "第14组");
    addData(list,"15000456", "赵秀军", "第14组");
    addData(list,"10020000", "王渭东", "第15组");
    addData(list,"10000003", "李晓佳", "第15组");
    addData(list,"10100003", "王文峰", "第15组");
    addData(list,"10033001", "房继红", "第15组");
    addData(list,"10000195", "王春波", "第15组");
    addData(list,"10002014", "刘德军", "第15组");
    addData(list,"15000064", "吴建军", "第15组");
    addData(list,"10009902", "朱晋宏", "第15组");
    addData(list,"14006097", "张德玖", "第15组");
    addData(list,"10024428", "史玉江", "第16组");
    addData(list,"10002898", "魏涛", "第16组");
    addData(list,"10021211", "饶晓芸", "第16组");
    addData(list,"10009000", "欧阳肃", "第16组");
    addData(list,"15000002", "何晓群", "第16组");
    addData(list,"17000084", "常俊石", "第16组");
    addData(list,"10001013", "许金彪", "第16组");
    addData(list,"10038852", "王子轩", "第16组");
    addData(list,"10036345", "叶东升", "第17组");
    addData(list,"10018919", "郭露", "第17组");
    addData(list,"10001008", "尹学信", "第17组");
    addData(list,"11405647", "林燕", "第17组");
    addData(list,"10002011", "蒋大龙", "第17组");
    addData(list,"17001202", "吴洪", "第17组");
    addData(list,"15006468", "张江涛", "第17组");
    addData(list,"10032109", "张斌", "第17组");
    addData(list,"10008499", "张云鹏", "第17组");
    addData(list,"10001005", "张叶生", "第18组");
    addData(list,"10020813", "王世宏", "第18组");
    addData(list,"10002023", "王东宽", "第18组");
    addData(list,"10050000", "周新华", "第18组");
    addData(list,"10106002", "梁雪", "第18组");
    addData(list,"10002160", "王法齐", "第18组");
    addData(list,"11407977", "孙绍强", "第18组");
    addData(list,"10000013", "任志清", "第18组");
    addData(list,"10000000", "王玉锁", "第19组");
    addData(list,"10100167", "王永", "第19组");
    addData(list,"10013003", "王丽茜", "第19组");
    addData(list,"10009001", "孙伟鸿", "第19组");
    addData(list,"10075000", "张爱东", "第19组");
    addData(list,"10116002", "李大育", "第19组");
    addData(list,"17000118", "李伟", "第19组");
    addData(list,"10019067", "陆志军", "第14组");
    addData(list,"12000001", "金永生", "第20组");
    addData(list,"10031783", "刘家江", "第20组");
    addData(list,"10107000", "王丰胜", "第20组");
    addData(list,"10102032", "罗波", "第20组");
    addData(list,"10013002", "鲁玉芳", "第20组");
    addData(list,"10004002", "褚明辉", "第20组");
    addData(list,"10038314", "李徽", "第20组");
    addData(list,"10063252", "金楠", "第20组");
    addData(list,"10045451", "王健", "第4组");
    addData(list,"10000075", "倪屹", "第21组");
    addData(list,"10000045", "于建潮", "第21组");
    addData(list,"10038010", "孙国宝", "第21组");
    addData(list,"10001100", "张宇迎", "第21组");
    addData(list,"10103000", "赵俊秋", "第21组");
    addData(list,"10001501", "张晓阳", "第21组");
    addData(list,"10116004", "张雁", "第21组");
    addData(list,"L000012", "宋顺来", "第21组");
    addData(list,"11401027", "邹晓俊", "第21组");
    addData(list,"10010986", "刘敏", "第22组");
    addData(list,"11400157", "于俊辉", "第22组");
    addData(list,"11400703", "甘银龙", "第22组");
    addData(list,"50000048", "李树旺", "第22组");
    addData(list,"10019000", "王嘉", "第22组");
    addData(list,"13000003", "张庆", "第22组");
    addData(list,"17000622", "刘涛", "第22组");
    addData(list,"10000052", "张睿", "第22组");
    addData(list,"10042799", "常维玲", "第22组");
    addData(list,"10000027", "王曦", "第23组");
    addData(list,"11404067", "卫清", "第23组");
    addData(list,"10100008", "王剑友", "第23组");
    addData(list,"10035000", "李桂芝", "第23组");
    addData(list,"10013006", "田忠民", "第23组");
    addData(list,"10024000", "庞旭林", "第23组");
    addData(list,"10030358", "谢志勇", "第23组");
    addData(list,"18000021", "成保明", "第23组");
    addData(list,"10031507", "刘智", "第24组");
    addData(list,"50000141", "于国江", "第24组");
    addData(list,"10013001", "王秀桥", "第24组");
    addData(list,"10027286", "李海笑", "第24组");
    addData(list,"10107001", "董雪梅", "第24组");
    addData(list,"13000002", "范朝辉", "第24组");
    addData(list,"13000007", "苟正平", "第24组");
    addData(list,"10027004", "胡文喆", "第24组");
    addData(list,"10032513", "邵忱", "第24组");
    addData(list,"14000731", "曲波", "第25组");
    addData(list,"10031374", "贾德贤", "第25组");
    addData(list,"10028000", "宁振俊", "第25组");
    addData(list,"10054004", "李晨生", "第25组");
    addData(list,"10000028", "赵海池", "第25组");
    addData(list,"10110000", "朱旭东", "第25组");
    addData(list,"17000686", "刘敏胜", "第25组");
    addData(list,"10034710", "杨立超", "第25组");
    addData(list,"10028825", "马东", "第3组");
    addData(list,"17002934", "龙力", "第26组");
    addData(list,"50000123", "刘风", "第26组");
    addData(list,"10101104", "查陆军", "第26组");
    addData(list,"10107994", "高峰", "第26组");
    addData(list,"10001101", "王丹", "第26组");
    addData(list,"16000012", "李世红", "第26组");
    addData(list,"10043699", "王轶", "第26组");
    addData(list,"10042557", "罗文杰", "第26组");
    addData(list,"10020001", "盛俊祥", "第27组");
    addData(list,"14000003", "赵义峰", "第27组");
    addData(list,"10013107", "罗光波", "第27组");
    addData(list,"10100103", "辜曼", "第27组");
    addData(list,"15006026", "李涛", "第27组");
    addData(list,"14007157", "王利民", "第27组");
    addData(list,"17000083", "李金来", "第28组");
    addData(list,"L000013", "张滔", "第28组");
    addData(list,"10021304", "刘必然", "第28组");
    addData(list,"10108000", "胡启立", "第28组");
    addData(list,"11400484", "李光", "第28组");
    addData(list,"11403154", "刘亚平", "第28组");
    addData(list,"10000862", "安刚龙", "第28组");
    addData(list,"10008463", "段浩", "第28组");
    addData(list,"10001093", "姜波", "第28组");
    addData(list,"50000117", "赵胜利", "第29组");
    addData(list,"10063005", "王伟晓", "第29组");
    addData(list,"10001033", "刘增兵", "第29组");
    addData(list,"10027933", "赵淑霞", "第29组");
    addData(list,"11401440", "杨帆", "第29组");
    addData(list,"12001002", "何振勇", "第29组");
    addData(list,"10007518", "陈军", "第29组");
    addData(list,"10000174", "王景启", "第29组");
    addData(list,"14000009", "郜志新", "第30组");
    addData(list,"10025012", "兰志华", "第30组");
    addData(list,"10031000", "吕志明", "第30组");
    addData(list,"15000256", "郝广立", "第30组");
    addData(list,"10083001", "马青喜", "第30组");
    addData(list,"14006008", "薛建保", "第30组");
    addData(list,"16000028", "刘丽梅", "第30组");
    addData(list,"11405670", "胡博智", "第30组");
    addData(list,"10000058", "袁生育", "第31组");
    addData(list,"10047000", "冯伟程", "第31组");
    addData(list,"10029950", "姚卫东", "第31组");
    addData(list,"10046000", "徐东", "第31组");
    addData(list,"10001137", "牛云峰", "第31组");
    addData(list,"16000056", "刘德智", "第31组");
    addData(list,"10000507", "闫俊敏", "第31组");
    addData(list,"18000101", "汤青", "第31组");
    addData(list,"12003002", "刘春雨", "第32组");
    addData(list,"10001907", "尹翔泰", "第32组");
    addData(list,"10049000", "张发龙", "第32组");
    addData(list,"10042001", "徐瑞彪", "第32组");
    addData(list,"10007591", "王书华", "第32组");
    addData(list,"10106000", "李士林", "第32组");
    addData(list,"15000009", "郭占军", "第32组");
    addData(list,"10002022", "王建辉", "第32组");
    addData(list,"10001085", "宗波", "第33组");
    addData(list,"10002167", "尹明", "第33组");
    addData(list,"10036000", "张金玉", "第33组");
    addData(list,"10070000", "聂永朝", "第33组");
    addData(list,"14000642", "郭敬波", "第33组");
    addData(list,"17000621", "陈峰", "第33组");
    addData(list,"19200325", "李宝库", "第33组");
    addData(list,"10002043", "张萍", "第33组");
    addData(list,"10002683", "高光", "第33组");
    addData(list,"10024248", "胡泊", "第34组");
    addData(list,"10042123", "方辉", "第34组");
    addData(list,"10003619", "张春林", "第34组");
    addData(list,"10074038", "郭东明", "第34组");
    addData(list,"14006198", "王红军", "第34组");
    addData(list,"10028943", "白雪梅", "第34组");
    addData(list,"10036544", "许福才", "第34组");
    addData(list,"10043024", "王跃进", "第34组");
    addData(list,"L000014", "杨继跃", "第34组");
    addData(list,"10001196", "毛红", "第35组");
    addData(list,"10014627", "张晓明", "第35组");
    addData(list,"10011051", "陶汝康", "第35组");
    addData(list,"14000139", "刘杰", "第35组");
    addData(list,"16000020", "鲍国英", "第35组");
    addData(list,"10013064", "李二生", "第35组");
    addData(list,"10039509", "王德惠", "第35组");
    addData(list,"10000083", "李玉军", "第35组");
    addData(list,"10031509", "王鹏", "第36组");
    addData(list,"10001202", "毛永明", "第36组");
    addData(list,"10063113", "张景涛", "第36组");
    addData(list,"10058001", "顾斌明", "第36组");
    addData(list,"14000012", "张景菲", "第36组");
    addData(list,"11406828", "王月华", "第36组");
    addData(list,"16000021", "陈増瑜", "第36组");
    addData(list,"10018106", "陈绍利", "第36组");
    addData(list,"10011161", "罗练鹰", "第36组");
    addData(list,"L000015", "杨瑞", "第37组");
    addData(list,"10063130", "王卫华", "第37组");
    addData(list,"10071005", "张越", "第37组");
    addData(list,"10010016", "高东宁", "第37组");
    addData(list,"10043764", "苏家鹏", "第37组");
    addData(list,"17002922", "李克忠", "第37组");
    addData(list,"10011850", "刘小东", "第37组");
    addData(list,"10041574", "赵华", "第37组");
    addData(list,"10038300", "孙含会", "第38组");
    addData(list,"17000082", "王庭华", "第38组");
    addData(list,"10011106", "张翠芬", "第38组");
    addData(list,"10001185", "崔占海", "第38组");
    addData(list,"12000003", "王凤林", "第38组");
    addData(list,"14000185", "侯祥生", "第38组");
    addData(list,"10000076", "张启峰", "第38组");
    addData(list,"15000857", "周科威", "第38组");
    addData(list,"10043700", "王晓更", "第38组");
    addData(list,"10054000", "王洪海", "第39组");
    addData(list,"10039113", "梅治新", "第39组");
    addData(list,"11000091", "王贵歧", "第39组");
    addData(list,"10015003", "刘兵", "第39组");
    addData(list,"10040733", "李延新", "第39组");
    addData(list,"15006531", "韩丹", "第39组");
    addData(list,"10033248", "王亮", "第39组");
    addData(list,"50000168", "于延", "第40组");
    addData(list,"11000047", "王桂华", "第40组");
    addData(list,"10022170", "李巍山", "第40组");
    addData(list,"10002076", "黄昌伟", "第40组");
    addData(list,"10038174", "孙宁", "第40组");
    addData(list,"10005148", "国杰", "第40组");
    addData(list,"50000565", "马冰", "第40组");
    addData(list,"L000016", "郄少杰", "第40组");
    addData(list,"10040022", "王颖", "第41组");
    addData(list,"10029002", "张龙", "第41组");
    addData(list,"10071093", "沈肖阳", "第41组");
    addData(list,"11402112", "曾正文", "第41组");
    addData(list,"10002225", "徐健", "第41组");
    addData(list,"10038415", "武海滨", "第41组");
    addData(list,"10059000", "郭斌", "第41组");
    addData(list,"10045007", "刘增强", "第41组");
    addData(list,"10034122", "李晶", "第41组");
    addData(list,"10008006", "冯志强", "第40组");
    addData(list,"10037001", "杨锦春", "第37组");
    addData(list,"10058007", "邹新民", "第31组");
    addData(list,"10056005", "程建平", "第39组");
    addData(list,"14000117", "周涛", "第35组");
    addData(list,"17002944", "汪国庆", "第30组");
    addData(list,"10036731", "王模富", "第29组");
    addData(list,"18000079", "赵凯", "第27组");
    addData(list,"10042279", "张瑛", "第27组");
    addData(list,"10116040", "余友林", "第26组");
    addData(list,"18000083", "于国方", "第23组");
    addData(list,"10002168", "张浩", "第16组");
    addData(list,"11000169", "刘云峰", "第12组");
    addData(list,"10116000", "付吉国", "第12组");
    addData(list,"10016430", "汪瑞洪", "第10组");
    addData(list,"11405110", "张开翼", "第10组");
    addData(list,"17002203", "董玉新", "第12组");
    addData(list,"10040879", "韩学义", "第6组");
    addData(list,"10065009", "张宏远", "第4组");
    addData(list,"10045511", "钱大群", "第11组");
    addData(list,"L000018", "文三忠", "第12组");
    addData(list,"L000019", "虞正华", "第20组");
    addData(list,"10001205", "谢滔", "第25组");
    addData(list,"10040589", "李群", "第27组");
    addData(list,"L000021", "曹蕾", "第37组");
    addData(list,"10000119", "郁庆东", "第39组");
    addData(list,"10043435", "文永福", "第1组");
    addData(list,"10022894", "张瑞", "第1组");
    addData(list,"11405017", "李建国", "第6组");
    addData(list,"L000017", "赵朋", "第32组");
    addData(list,"10029597", "薛守宁", "第50组");
    addData(list,"10034534", "范孜轶", "第50组");
    addData(list,"10039865", "王朋", "第50组");

    String uid = StringUtils.EMPTY;
    String uname = StringUtils.EMPTY;
    User user = MwebHelper.getCurrentUser(request);
    if(null!=user){
        uid = user.getUsername();
        uname = user.getName();
    }

    EnnUserGroup userGroup = find(list,uid,uname);
    List<EnnUserGroup> sameGroup = findSameGroup(list,userGroup);


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
    <title>我的分组</title>
    <link rel="stylesheet" type="text/css" href="${basepath }/static/m_h5/enn/nianhui2016/css/style.css">
</head>
<body class="bg-f1">
<%
    if(null!=userGroup){
%>
<!-- 找到分组 -->
<section class="user-index-box">
    <div class="user-name">
        <strong><%=userGroup.uname%></strong> 您好，您在【<span class="color-green"><%=userGroup.group%></span>】
    </div>
    <span class="tip-text">与您同组人员</span>
    <div class="user-public">
        <%
            for(EnnUserGroup item:sameGroup){
        %>
            <span><%=item.uname%></span>
        <%
            }
        %>
    </div>
    <span class="tip-text">各组所在位置</span>
    <img class="user-index-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/user_index2.jpg" alt="">
</section>
<!-- 找到分组 end -->

<%
}else{
%>
<!-- 没有找到分组--->
<section class="user-index-box news-index-box">
    <!--
    <div class="title-link" onclick="window.location='group_index.xhtml'">
        点击进入人员分组索引
    </div>
    -->
    <div style="width: 85%;height:39px; color:#000b9b;  text-align:center; font-size:15px; margin:20px auto; border-radius:10px;font-weight:bold;">
        非常抱歉，没有找到您的分组信息，请联系现场工作人员
    </div>
    <div class="user-show-tip">各组所在位置请参照下方图片</div>
    <img style="border:none;" class="user-index-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/user_index2.jpg" alt="">
</section>
<!-- 没有找到分组 end--->
<%
    }
%>


</body>
</html>






