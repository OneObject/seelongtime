package im.delight.java.emoji;

/**
 * Copyright 2014 www.delight.im <info@delight.im>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import org.apache.commons.lang3.StringUtils;

import java.util.Map;
import java.util.regex.Pattern;
import java.util.HashMap;

/**
 * Lets you replace all emoticons in a text with their corresponding Unicode Emoji
 * <p>
 * Usage: String myEmojiString = Emoji.replaceInText(myString);
 */
public class Emoji {

    /** Characters that may not occur immediately before or after an emoticon */
    private static final String REGEX_SURROUNDING_CHARS_DISALLOWED = "[-_a-zA-Z0-9)(;:*<>=/]";
    /** A negative look-behind ensuring that the match is not preceded by one of the characters above */
    private static final String REGEX_NEGATIVE_LOOKBEHIND = "(?<!"+REGEX_SURROUNDING_CHARS_DISALLOWED+")";
    /** A negative look-ahead ensuring that the match is not followed by one of the characters above */
    private static final String REGEX_NEGATIVE_LOOKAHEAD = "(?!"+REGEX_SURROUNDING_CHARS_DISALLOWED+")";

    private static class ReplacementsMap extends HashMap<String,Integer> {

        private static final long serialVersionUID = 4948071414363715959L;
        private static ReplacementsMap mInstance;

        private ReplacementsMap() {
            super();
//            put(":-)", 0x1F60A);
//            put(":)", 0x1F60A);
//            put(":-(", 0x1F61E);
//            put(":(", 0x1F61E);
//            put(":-D", 0x1F603);
//            put(":D", 0x1F603);
//            put(";-)", 0x1F609);
//            put(";)", 0x1F609);
//            put(":-P", 0x1F61C);
//            put(":P", 0x1F61C);
//            put(":-p", 0x1F61C);
//            put(":p", 0x1F61C);
//            put(":-*", 0x1F618);
//            put(":*", 0x1F618);
//            put("<3", 0x2764);
//            put(":3", 0x2764);
//            put(">:[", 0x1F621);
//            put(":'|", 0x1F625);
//            put(":-[", 0x1F629);
//            put(":'(", 0x1F62D);
//            put("=O", 0x1F631);
//            put("xD", 0x1F601);
//            put(":')", 0x1F602);
//            put(":-/", 0x1F612);
//            put(":/", 0x1F612);
//            put(":-|", 0x1F614);
//            put(":|", 0x1F614);
//            put("*_*", 0x1F60D);
            
           
          
            put("[生气]", 0x1F629);
            put("[疲倦]", 0x1F632);
            put("[吃惊]", 0x1F61E);
            put("[沮丧]", 0x1F635);
            put("[我晕]", 0x1F630);
            put("[吓尿了]", 0x1F612);
            put("[别逗我]", 0x1F60D);
            put("[色色的]", 0x1F624);
            put("[高冷]", 0x1F61C);
            put("[调皮]", 0x1F61D);
            put("[鬼脸]", 0x1F60B);
            put("[心满意足]", 0x1F618);
            put("[飞吻]", 0x1F61A);
            put("[亲吻]", 0x1F637);
            put("[生病]", 0x1F633);
            put("[红脸]", 0x1F603);
            put("[高兴]", 0x1F605);
            put("[笑死了]", 0x1F606);
            put("[可爱]", 0x1F601);
            put("[微笑]", 0x1F602);
            put("[咧嘴笑]", 0x1F60A);
            put("[哭泣]", 0x1263A);
     
            put("[憨笑]", 0x1F604);
            put("[流泪]", 0x1F622);
            put("[大哭]", 0x1F62D);
            put("[害怕]", 0x1F628);
            put("[执着]", 0x1F623);
            put("[撅嘴]", 0x1F621);
            put("[叹气]", 0x1F60C);
            put("[羞愧]", 0x1F616);
            put("[忧郁]", 0x1F614);
            put("[惊恐]", 0x1F631);
            put("[困倦]", 0x1F62A);
            put("[傻笑]", 0x1F60F);
            put("[冷汗]", 0x1F613);
            put("[失望]", 0x1F625);
            put("[困]", 0x1F62B);
            put("[眨眼]", 0x1F609);
            
            put("[太阳]", 0x2600 );
            put("[云]", 0x2601);
            put("[打伞]", 0x2614);
            put("[雪人]", 0x26C4);
            put("[闪电]", 0x26A1);
            put("[漩涡]", 0x1F300);
            put("[大雾]", 0x1F301);
            put("[伞]", 0x1F302);
            put("[流星]", 0x1F303);
            put("[朝阳]", 0x1F304);
            put("[夕阳]", 0x1F305);
            put("[城市的黄昏]", 0x1F306);
            put("[城市的清晨]", 0x1F307);
            put("[彩虹]", 0x1F308);
            put("[雪花]", 0x2744);
            put("[多云]", 0x26C5);
            put("[夜晚的桥]", 0x1F309);
            put("[浪花]", 0x1F30A);
            put("[火山]", 0x1F30B);
            put("[银河]", 0x1F30C);
            put("[地球]", 0x1F30F);
            put("[新月符号]", 0x1F311);
            put("[凸月]", 0x1F314);
            put("[半月]", 0x1F313);
            put("[新月]", 0x1F319);
            put("[满月]", 0x1F315);
            put("[月]", 0x1F31B); 
            put("[星星]", 0x1F31F);
            put("[问号]",0x1F320);
            put("[一点钟]",0x1F550);
            put("[二点钟]",0x1F551);
            put("[三点钟]",0x1F552);
            put("[四点钟]",0x1F553);
            put("[五点钟]",0x1F554);
            put("[六点钟]",0x1F555);
            put("[七点钟]",0x1F556);
            put("[八点钟]",0x1F557);
            put("[九点钟]",0x1F558);
            put("[十点钟]",0x1F559);
            put("[十一点钟]",0x1F55A);
            put("[十二点钟]",0x1F55B);
            put("[手表]",0x231A);
            put("[沙漏]",0x231B);
            put("[闹钟]",0x23F0);
            put("[沙漏]",0x23F3);

            put("[白羊座]",0xE646);
            put("[金牛座]",0x2649);
            put("[双子座]",0x264A);
            put("[巨蟹座]",0x264B);
            put("[狮子座]",0x264C);
            put("[处女座]",0x264D);
            put("[天秤座]",0x264E);
            put("[天蝎]",0x264F);
            put("[射手座]",0x2650);
            put("[摩羯座]",0x2651);
            put("[水瓶座]",0x2652);
            put("[双鱼座]",0x2653);
            put("[蛇夫座]",0x26CE);
            
            put("[四叶草]",0xE741);
            put("[郁金香]",0x1F337);
            put("[树苗]",0x1F331);
            put("[红叶]",0x1F341);
            put("[樱花]",0x1F338);
            put("[玫瑰]",0x1F339);
            put("[落叶]",0x1F342);
            put("[飘叶]",0x1F343);
            put("[芙蓉]",0x1F33A);
            put("[向日葵]",0x1F33B);
            put("[椰子]",0x1F334);
            put("[仙人掌]",0x1F335);
            put("[稻穗]",0x1F33E);
            put("[玉米]",0x1F33D);
            put("[蘑菇]",0x1F344);
            put("[例子]",0x1F330);
            put("[喇叭花]",0x1F33C);
            put("[草]",0x1F33F);
            put("[樱桃香蕉]",0x1F352);
            put("[红苹果]",0x1F34C);
            put("[橙子]",0x1F34E);
            put("[草莓]",0x1F34A);
            put("[西瓜]",0x1F353);
            put("[西红柿]",0x1F349);
            put("[茄子]",0x1F345);
            put("[梨]",0x1F346);
            put("[梨子]",0x1F348);
            put("[菠萝]",0x1F34D);
            put("[葡萄]",0x1F347);
            put("[桃子]",0x1F351);
            put("[青苹果]",0x1F34F);
            
           put("[举拳]",0xE693);
           put("[击掌]",0x270B);
           put("[胜利]",0x270C);
           put("[碰拳]",0x1F44A);
           put("[赞]",0x1F44D);
           put("[no]",0x261D);
           put("[往上]",0x1F446);
           put("[往下]",0x1F447);
           put("[往左]",0x1F448);
           put("[往右]",0x1F449);
           put("[击掌]",0x1F44B);
           put("[鼓掌]",0x1F44F);
           put("[ok]",0x1F44C);
           put("[踩]",0x1F44E);
           put("[飞翔]",0x1F450);

           
           put("[眼睛]",0x1F440);
           put("[耳朵]",0x1F442);
           put("[鼻子]",0x1F443);
           put("[嘴]",0x1F444);
           put("[舌头]",0x1F445);
           put("[口红]",0x1F484);
           put("[指甲油]",0x1F485);
           put("[洗脸]",0x1F486);
           put("[理发]",0x1F487);
           put("[理发店]",0x1F488);
           put("[联系人]",0x1F464);
           put("[男孩]",0x1F466);
           put("[女孩]",0x1F467);
           put("[男人]",0x1F468);
           put("[女人]",0x1F469);
           put("[家庭]",0x1F46A);
           put("[牵手]",0x1F46B);
           put("[警察]",0x1F46E);
           put("[跳舞]",0x1F46F);
           put("[新娘]",0x1F470);
           put("[金发男]",0x1F471);
           put("[地主]",0x1F472);
           put("[农民]",0x1F473);
           put("[老人]",0x1F474);
           put("[老太太]",0x1F475);
           put("[baby]",0x1F476);
           put("[建筑工人]",0x1F477);
           put("[美女]",0x1F478);
           put("[食人魔]",0x1F479);
           put("[怪物]",0x1F47A);
           put("[幽灵]",0x1F47B);
           put("[天使]",0x1F47C);
           put("[外星人]",0x1F47D);
           put("[怪物]",0x1F47E);
           put("[恶魔]",0x1F47F);
           put("[骷髅]",0x1F480);
           put("[服务员]",0x1F481);
           put("[士兵]",0x1F482);
           put("[舞者]",0x1F483);

           
           put("[蜗牛]",0x1F40C);
           put("[蛇]",0x1F40D);
           put("[马]",0x1F40E);
           put("[鸡]",0x1F414);
           put("[野猪]",0x1F417);
           put("[骆驼]",0x1F42B);
           put("[大象]",0x1F418);
           put("[熊]",0x1F428);
           put("[猫]",0x1F412);
           put("[绵羊]",0x1F411);
           put("[章鱼]",0x1F419);
           put("[海螺]",0x1F41A);
           put("[毛毛虫]",0x1F41B);
           put("[蚂蚁]",0x1F41C);
           put("[蜜蜂]",0x1F41D);
           put("[瓢虫]",0x1F41E);
           put("[金鱼]",0x1F420);
           put("[鱼]",0x1F421);
           put("[乌龟]",0x1F422);
           put("[小鸡]",0x1F424);
           put("[小鸡]",0x1F425);
           put("[小鸟]",0x1F426);
           put("[洗澡的小鸡]",0x1F423);
           put("[企鹅]",0x1F427);
           put("[贵宾犬]",0x1F429);
           put("[鱼]",0x1F41F);
           put("[海豚]",0x1F42C);
           put("[老鼠脸]",0x1F42D);
           put("[老虎脸]",0x1F42F);
           put("[猫脸]",0x1F431);
           put("[鲸鱼]",0x1F433);
           put("[马脸]",0x1F434);
           put("[猴子脸]",0x1F435);
           put("[狗脸]",0x1F436);
           put("[猪脸]",0x1F437);
           put("[熊脸]",0x1F43B);
           put("[仓鼠脸]",0x1F439);
           put("[狐狸]",0x1F43A);
           put("[母牛]",0x1F42E);
           put("[兔子]",0x1F430);
           put("[青蛙]",0x1F438);
           put("[爪子印]",0x1F43E);
           put("[龙]",0x1F432);
           put("[熊猫]",0x1F43C);
           put("[猪鼻子]",0x1F43D);

           
           put("[笑脸猫]",0x1F63A);
           put("[笑脸猫]",0x1F638);
           put("[笑哭了]",0x1F639);
           put("[亲亲]",0x1F63D);
           put("[色色的]",0x1F63B);
           put("[哭泣]",0x1F63F);
           put("[扭头]",0x1F63E);
           put("[微笑]",0x1F63C);
           put("[惊讶]",0x1F640);
           put("[绝不]",0x1F645);
           put("[ok]",0x1F646);
           put("[深鞠躬]",0x1F647);
           put("[不忍直视]",0x1F648);
           put("[萌萌的]",0x1F64A);
           put("[听不到]",0x1F649);
           put("[我我我]",0x1F64B);
           put("[举起双手]",0x1F64C);
           put("[皱眉]",0x1F64D);
           put("[撅嘴]",0x1F64E);
           put("[保佑]",0x1F64F);
           
           
           put("[房子]",0x1F3E0);
           put("[别墅]",0x1F3E1);
           put("[写字楼]",0x1F3E2);
           put("[日式邮局]",0x1F3E3);
           put("[医院]",0x1F3E5);
           put("[银行]",0x1F3E6);
           put("[ATM]",0x1F3E7);
           put("[酒店]",0x1F3E8);
           put("[情人酒店]",0x1F3E9);
           put("[24小时酒店]",0x1F3EA);
           put("[学校]",0x1F3EB);
           put("[教堂]",0x26EA);
           put("[喷泉]",0x26F2);
           put("[百货商场]",0x1F3EC);
           put("[日式城堡]",0x1F3EF);
           put("[欧式城堡]",0x1F3F0);
           put("[工厂]",0x1F3ED);
           put("[锚]",0x2693);
           put("[灯笼]",0x1F3EE);
           put("[富士山]",0x1F5FB);
           put("[东京塔]",0x1F5FC);
           put("[自由女神像]",0x1F5FD);
           put("[日本]",0x1F5FE);
           put("[玛雅]",0x1F5FF);
       
       
          put("[皮鞋]",0x1F45E);
          put("[运动鞋]",0x1F45F);
          put("[高跟鞋]",0x1F460);
          put("[女士凉鞋]",0x1F461);
          put("[长筒靴]",0x1F462);
          put("[脚印]",0x1F463);
          put("[眼镜]",0x1F453);
          put("[体恤衫]",0x1F455);
          put("[西裤]",0x1F456);
          put("[皇冠]",0x1F451);
          put("[衬衫]",0x1F454);
          put("[女式帽子]",0x1F452);
          put("[裙子]",0x1F457);
          put("[和服]",0x1F458);
          put("[女式内衣]",0x1F459);
          put("[女士短袖]",0x1F45A);
          put("[包包]",0x1F45B);
          put("[公文包]",0x1F45C);
          put("[钱包]",0x1F45D);
          put("[钱]",0x1F4B0);
          put("[货币兑换]",0x1F4B1);
          put("[日元]",0x1F4B9);
          put("[美元]",0x1F4B2);
          put("[银行卡]",0x1F4B3);
          put("[RMB]",0x1F4B4);
          put("[美元]",0x1F4B5);
          put("[花钱]",0x1F4B8);
          put("[火]",0x1F525);
          put("[手电筒]",0x1F526);
          put("[扳手]",0x1F527);
          put("[锤子]",0x1F528);
          put("[螺丝]",0x1F529);
          put("[刀]",0x1F52A);
          put("[手枪]",0x1F52B);
          put("[水晶球]",0x1F52E);
          put("[六芒星]",0x1F52F);
          put("[日语初学者]",0x1F530);
          put("[三叉戟]",0x1F531);
          put("[注射器]",0x1F489);
          put("[药]",0x1F48A);
          put("[A]",0x1F170);
          put("[B]",0x1F171);
          put("[AB]",0x1F18E);
          put("[O]",0x1F17E);
          put("[丝带]",0x1F380);
          put("[礼物]",0x1F381);
          put("[蛋糕]",0x1F382);
          put("[圣诞树]",0x1F384);
          put("[圣诞老人]",0x1F385);
          put("[十字旗]",0x1F38C);
          put("[烟火]",0x1F386);
          put("[气球]",0x1F388);
          put("[喷带]",0x1F389);
          put("[仙人掌]",0x1F38D);
          put("[日本娃娃]",0x1F38E);
          put("[学士帽]",0x1F393);
          put("[书包]",0x1F392);
          put("[双鱼旗]",0x1F38F);
          put("[烟花]",0x1F387);
          put("[风铃]",0x1F390);
          put("[南瓜头像]",0x1F383);
          put("[五彩球]",0x1F38A);
          put("[七夕树]",0x1F38B);
          put("[赏月]",0x1F391);
          put("[传呼机]",0x1F4DF);
          put("[电话]",0x260E);
          put("[接电话]",0x1F4DE);
          put("[手机]",0x1F4F1);
          put("[电话]",0x1F4F2);
          put("[备忘录]",0x1F4DD);
          put("[传真]",0x1F4E0);
          put("[信]",0x2709);
          put("[信封]",0x1F4E8);
          put("[发邮件]",0x1F4E9);
          put("[信箱]",0x1F4EA);
          put("[信箱]",0x1F4EB);
          put("[邮局信箱]",0x1F4EE);
          put("[报纸]",0x1F4F0);
          put("[广播]",0x1F4E2);
          put("[喇叭]",0x1F4E3);
          put("[天线]",0x1F4E1);
          put("[打开抽屉]",0x1F4E4);
          put("[关闭抽屉]",0x1F4E5);
          put("[包裹]",0x1F4E6);
          put("[邮件]",0x1F4E7);
          put("[ABCD]",0x1F520);
          put("[abcd]",0x1F521);
          put("[1234]",0x1F522);
          put("[符号]",0x1F523);
          put("[abc]",0x1F524);
          put("[笔尖]",0x2712);
          put("[座位]",0x1F4BA);
          put("[个人电脑]",0x1F4BB);
          put("[铅笔]",0x270F);
          put("[曲别针]",0x1F4CE);
          put("[公文包]",0x1F4BC);
          put("[迷你光盘]",0x1F4BD);
          put("[硬盘]",0x1F4BE);
          put("[光盘]",0x1F4BF);
          put("[DVD]",0x1F4C0);
          put("[剪子]",0x2702);
          put("[标记]",0x1F4CD);
          put("[卷叶]",0x1F4C3);
          put("[纸]",0x1F4C4);
          put("[日历]",0x1F4C5);
          put("[文件夹]",0x1F4C1);
          put("[打开文件夹]",0x1F4C2);
          put("[笔记本]",0x1F4D3);
          put("[书]",0x1F4D6);
          put("[笔记本]",0x1F4D4);
          put("[红色书]",0x1F4D5);
          put("[绿色书]",0x1F4D7);
          put("[蓝色书]",0x1F4D8);
          put("[橘色书]",0x1F4D9);
          put("[书]",0x1F4DA);
          put("[姓名卡]",0x1F4DB);
          put("[卷纸]",0x1F4DC);
          put("[文件板]",0x1F4CB);
          put("[撕下日历]",0x1F4C6);
          put("[柱状图]",0x1F4CA);
          put("[向上趋势]",0x1F4C8);
          put("[向下趋势]",0x1F4C9);
          put("[记账索引]",0x1F4C7);
          put("[图钉]",0x1F4CC);
          put("[账本]",0x1F4D2);
          put("[直尺]",0x1F4CF);
          put("[三角板]",0x1F4D0);
          put("[书签]",0x1F4D1);
          put("[冲浪]",0x1F3BD);
          put("[棒球]",0x26BE);
          put("[插旗]",0x26F3);
          put("[网球]",0x1F3BE);
          put("[足球]",0x26BD);
          put("[滑雪板]",0x1F3BF);
          put("[篮球]",0x1F3C0);
          put("[赛车]",0x1F3C1);
          put("[滑雪]",0x1F3C2);
          put("[跑步]",0x1F3C3);
          put("[冲浪]",0x1F3C4);
          put("[奖杯]",0x1F3C6);
          put("[橄榄球]",0x1F3C8);
          put("[游泳]",0x1F3CA);
          put("[旅游巴士]",0x1F683);
          put("[地铁]",0x1F687);
          put("[M]",0x24C2);
          put("[动车]",0x1F684);
          put("[高铁]",0x1F685);
          put("[汽车]",0x1F697);
          put("[汽车]",0x1F699);
          put("[巴士]",0x1F68C);
           put("[公交站牌]",0x1F68F);
          put("[轮船]",0x1F6A2);
          put("[飞机]",0x2708);
          put("[帆船]",0x26F5);
          put("[火车站]",0x1F689);
          put("[火箭]",0x1F680);
          put("[独木舟]",0x1F6A4);
          put("[出租车]",0x1F695);
          put("[货车]",0x1F69A);
          put("[消防车]",0x1F692);
          put("[救护车]",0x1F691);
          put("[警车]",0x1F693);
          put("[加油站]",0x26FD);
          put("[停车标识]",0x1F17F);
          put("[红绿灯]",0x1F6A5);
          put("[路障]",0x1F6A7);
          put("[报警]",0x1F6A8);
          put("[热风]",0x2668);
          put("[帐篷]",0x26FA);
          put("[旋转木马]",0x1F3A0);
          put("[摩天轮]",0x1F3A1);
          put("[过山车]",0x1F3A2);
          put("[钓鱼]",0x1F3A3);
          put("[唱歌]",0x1F3A4);
          put("[摄像]",0x1F3A5);
          put("[摄像机]",0x1F3A6);
          put("[音乐]",0x1F3A7);
          put("[画板]",0x1F3A8);
          put("[高帽]",0x1F3A9);
          put("[蒙古包]",0x1F3AA);
          put("[票]",0x1F3AB);
          put("[打板]",0x1F3AC);
          put("[面具]",0x1F3AD);
          put("[游戏手柄]",0x1F3AE);
          put("[麻将]",0x1F004);
          put("[正中靶心]",0x1F3AF);
          put("[苹果机]",0x1F3B0);
          put("[台球]",0x1F3B1);
          put("[骰子]",0x1F3B2);
          put("[炸弹]",0x1F3B3);
          put("[花扑克牌]",0x1F3B4);
          put("[王牌]",0x1F0CF);
          put("[音乐]",0x1F3B5);
          put("[音符]",0x1F3B6);
          put("[萨克斯]",0x1F3B7);
          put("[吉他]",0x1F3B8);
          put("[钢琴]",0x1F3B9);
          put("[小号]",0x1F3BA);
          put("[小提琴]",0x1F3BB);
          put("[五线谱]",0x1F3BC);
          put("[零件变更标识]",0x303D);
          put("[相机]",0x1F4F7);
          put("[摄像机]",0x1F4F9);
          put("[电视]",0x1F4FA);
          put("[收音机]",0x1F4FB);
          put("[录音机]",0x1F4FC);
          put("[吻]",0x1F48B);
          put("[情书]",0x1F48C);
          put("[戒指]",0x1F48D);
          put("[钻石]",0x1F48E);
          put("[吻]",0x1F48F);
          put("[花束]",0x1F490);
          put("[爱情]",0x1F491);
          put("[婚礼]",0x1F492);
          put("[18禁]",0x1F51E);
      

          
           put("[汉堡包]",0x1F354);
           put("[粽子]",0x1F359);
           put("[蛋糕]",0x1F370);
           put("[面条]",0x1F35C);
           put("[面包]",0x1F35E);
           put("[查找]",0x1F373);
           put("[冰激凌]",0x1F366);
           put("[薯条]",0x1F35F);
           put("[糖葫芦]",0x1F361);
           put("[米饼]",0x1F358);
           put("[米饭]",0x1F35A);
           put("[拉面]",0x1F35D);
           put("[盖浇饭]",0x1F35B);
           put("[串串]",0x1F362);
           put("[寿司]",0x1F363);
           put("[抽屉]",0x1F371);
           put("[热汤]",0x1F372);
           put("[冷饮]",0x1F367);
           put("[肉~]",0x1F356);
           put("[蛋糕]",0x1F365);
           put("[烤红薯]",0x1F360);
           put("[披萨]",0x1F355);
           put("[鸡腿]",0x1F357);
           put("[冰激凌]",0x1F368);
           put("[甜甜圈]",0x1F369);
           put("[饼干]",0x1F36A);
           put("[巧克力]",0x1F36B);
           put("[糖果]",0x1F36C);
           put("[彩虹糖]",0x1F36D);
           put("[蛋糕]",0x1F36E);
           put("[蜂蜜]",0x1F36F);
           put("[虾]",0x1F364);
           put("[刀叉]",0x1F374);
           put("[咖啡]",0x2615);
           put("[高脚杯]",0x1F378);
           put("[啤酒]",0x1F37A);
           put("[茶]",0x1F375);
           put("[牛奶瓶]",0x1F376);
           put("[红酒杯]",0x1F377);
           put("[啤酒杯]",0x1F37B);
           put("[冷饮]",0x1F379);
           put("[东北方向]",0x2197);
           put("[东南方向]",0x2198);
           put("[西北方向]",0x2196);
           put("[西南方向]",0x2199);
           put("[右上拐]",0x2934);
           put("[右下拐]",0x2935);
           put("[左右方向]",0x2194);
           put("[上线方向]",0x2195);
           put("[向上]",0x2B06);
           put("[向下]",0x2B07);
           put("[向右]",0x27A1);
           put("[向左]",0x2B05);
           put("[右三角]",0x25B6);
           put("[左三角]",0x25C0);
           put("[快进]",0x23E9);
           put("[快退]",0x23EA);
           put("[快升]",0x23EB);
           put("[快降]",0x23EC);
           put("[上]",0x1F53A);
           put("[下]",0x1F53B);
           put("[上]",0x1F53C);
           put("[下]",0x1F53D);
           put("[对]",0x2B55);
           put("[叉]",0x274C);
           put("[错]",0x274E);
           put("[感叹号]",0x2757);
           put("[非常疑惑]",0x2049);
           put("[非常惊讶]",0x203C);
           put("[问号]",0x2753);
           put("[问号]",0x2754);
           put("[感叹号]",0x2755);
           put("[波浪式]",0x3030);
           put("[卷曲式]",0x27B0);
           put("[双圈]",0x27BF);
           put("[红心]",0x2764);
           put("[红心]",0x1F493);
           put("[心碎]",0x1F494);
           put("[心花怒放]",0x1F495);
           put("[心花怒放]",0x1F496);
           put("[心动]",0x1F497);
           put("[中了丘比特之箭]",0x1F498);
           put("[蓝心]",0x1F499);
           put("[绿心]",0x1F49A);
           put("[黄心]",0x1F49B);
           put("[紫心]",0x1F49C);
           put("[心似礼物]",0x1F49D);
           put("[心连心]",0x1F49E);
           put("[心]",0x1F49F);
           put("[红桃]",0x2665);
           put("[黑桃]",0x2660);
           put("[方片]",0x2666);
           put("[梅花]",0x2663);
           put("[吸烟]",0x1F6AC);
           put("[禁止吸烟]",0x1F6AD);
           put("[无障碍标识]",0x267F);
           put("[红旗]",0x1F6A9);
           put("[危险]",0x26A0);
           put("[禁止通行]",0x26D4);
           put("[可回收]",0x267B);
           put("[自行车]",0x1F6B2);
           put("[行人]",0x1F6B6);
           put("[男]",0x1F6B9);
           put("[女]",0x1F6BA);
           put("[浴缸]",0x1F6C0);
           put("[卫生间]",0x1F6BB);
           put("[马桶]",0x1F6BD);
           put("[WC]",0x1F6BE);
           put("[baby]",0x1F6BC);
           put("[门]",0x1F6AA);
           put("[禁止入内]",0x1F6AB);
           put("[对号]",0x2714);
           put("[平方和]",0x1F191);
           put("[冷]",0x1F192);
           put("[免费]",0x1F193);
           put("[ID]",0x1F194);
           put("[新]",0x1F195);
           put("[NG]",0x1F196);
           put("[OK]",0x1F197);
           put("[SOS]",0x1F198);
           put("[UP]",0x1F199);
           put("[VS]",0x1F19A);
           put("[平假名]",0x1F201);
           put("[平假名]",0x1F202);
           put("[禁止]",0x1F232);
           put("[空]",0x1F233);
           put("[合]",0x1F234);
           put("[满]",0x1F235);
           put("[有]",0x1F236);
           put("[无]",0x1F21A);
           put("[月]",0x1F237);
           put("[申]",0x1F238);
           put("[割]",0x1F239);
           put("[指]",0x1F22F);
           put("[宫]",0x1F23A);
           put("[密]",0x3299);
           put("[祝]",0x3297);
           put("[得]",0x1F250);
           put("[可]",0x1F251);
           put("[加号]",0x2795);
           put("[减号]",0x2796);
           put("[乘号]",0x2716);
           put("[除号]",0x2797);
           put("[图案]",0x1F4A0);
           put("[灯泡]",0x1F4A1);
           put("[生气]",0x1F4A2);
           put("[炸弹]",0x1F4A3);
           put("[困困困]",0x1F4A4);
           put("[碰撞]",0x1F4A5);
           put("[流汗]",0x1F4A6);
           put("[水滴]",0x1F4A7);
           put("[短跑]",0x1F4A8);
           put("[一坨屎]",0x1F4A9);
           put("[肌肉]",0x1F4AA);
           put("[晕]",0x1F4AB);
           put("[消息]",0x1F4AC);
           put("[小星星]",0x2728);
           put("[八尖黑星]",0x2734);
           put("[八轮辐星]",0x2733);
           put("[透明圆圈]",0x26AA);
           put("[黑点]",0x26AB);
           put("[红点]",0x1F534);
           put("[蓝点]",0x1F535);
           put("[方块]",0x1F532);
           put("[方块]",0x1F533);
           put("[星星]",0x2B50);
           put("[方块]",0x2B1C);
           put("[黑方块]",0x2B1B);
          
  
           
           
           put("[菱形]",0x1F536);
           put("[蓝菱形]",0x1F537);
           put("[小菱形]",0x1F538);
           put("[小菱形]",0x1F539);
           put("[闪耀]",0x2747);
           put("[窗花]",0x1F4AE);
           put("[100分]",0x1F4AF);
           put("[撤销]",0x21A9);
           put("[返回]",0x21AA);
           put("[循环]",0x1F503);
           put("[喇叭]",0x1F50A);
           put("[电池]",0x1F50B);
           put("[电插头]",0x1F50C);
           
           put("[查找]",0x1F50D);
           put("[查找]",0x1F50E);
           put("[锁定]",0x1F512);
           put("[解锁]",0x1F513);
           put("[锁]",0x1F50F);
           put("[锁和钥匙]",0x1F510);
           put("[钥匙]",0x1F511);
           put("[铃铛]",0x1F514);
           put("[对号]",0x2611);
           put("[收音机按钮]",0x1F518);
           put("[书签]",0x1F516);
           put("[曲别针]",0x1F517);
           put("[后退]",0x1F519);
           put("[后退到底]",0x1F51A);
           put("[向左向右]",0x1F51B);
           put("[前进]",0x1F51C);
           put("[Top]",0x1F51D);
           put("[对号]",0x2705);
       








        }

        public static ReplacementsMap getInstance() {
            if (mInstance == null) {
                mInstance = new ReplacementsMap();
            }
            return mInstance;
        }

    }

    private static String getUnicodeChar(int codepoint) {
        return new String(Character.toChars(codepoint));
    }

    /** Constructs a regular expression which ensures that the emoticon is not part of a longer string of special chars (e.g. <:)))> or <http://> which both include basic emoticons) */
    private static String getEmoticonSearchRegex(String emoticon) {
        return REGEX_NEGATIVE_LOOKBEHIND+"("+Pattern.quote(emoticon)+")"+REGEX_NEGATIVE_LOOKAHEAD;
    }

    /**
     * Replaces all emoticons in the given text with their corresponding Unicode Emoji
     *
     * @param text the String to search and replace in
     * @return the new String containing the Unicode Emoji
     */
    public static String replaceInText(String text) {
        return replaceInText(text, false);
    }

    /**
     * Converts between emoticons and their corresponding Unicode Emoji in the given text
     *
     * @param text the String to search and replace in
     * @param reverse whether to replace emoticons with emoji as usual (false) or revert emoji to emoticons (true)
     * @return the new String containing the the converted entities
     */
    public static String replaceInText(String text, boolean reverse) {
        final ReplacementsMap replacements = ReplacementsMap.getInstance();
        String emoticon;
        Integer codepoint;

        for (Map.Entry<String, Integer> entry : replacements.entrySet()) {
            if (entry != null) {
                emoticon = entry.getKey();
                codepoint = entry.getValue();
                if (emoticon != null && codepoint != null) {
                    String unicodeChar = getUnicodeChar(codepoint.intValue());
                    if (reverse) {
                        text = text.replace(unicodeChar, emoticon);
                    }
                    else {
                        text = text.replaceAll(getEmoticonSearchRegex(emoticon), unicodeChar);
                    }
                }
            }
        }


        // 请其他未知的表情过滤掉
        //text = filter(text);

        return text;
    }


    private static String regex = "[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u25b6-\u25c0]|[\u25e9-\u25ec]|[\u23e9-\u23ec]|[\u2b05-\u2b07]|[\u27a1]|[\u2194-\u2199]|[\u2934-\u2935]|[\u21a9-\u21aa]|[\u200d]|[\u2764\ufe0f]|[\u261d]|[\u270a-\u270c]|[\u2600-\u2615]|[\u2648-\u264f]|[\u2764\ufe0f]|[\u261d]|[\u270a-\u270c]|[\u2600-\u2615]|[\u26a0-\u26a1]|[\u26aa-\u26ab]|[\u26c4-\u26c5]|[\u26ce]|[\u25fb-\u25fe]|[\u2753-\u2757]|[\u2744-\u274f]|[\u2b50]|[\u26f2-\u26fa]|[\u26bd-\u26be]|[\u2708-\u270f]|[\u2728]|[\u26bd-\u26be]|[\u26fd]|[\u3297-\u3299]|[\u2650-\u2653]"
            + "|[\u2693]|[\u26ea]|[\u231a]|[\u23f0]|[\u23f3]|[\u231b]|[\u2702]|[\u2712]|[\u26d4]|[\u2733]|[\u2705]|[\u2734]"
            + "|[\u2668]|[\u267b]|[\u2660]|[\u2663]|[\u2665]|[\u2666]|[\u25aa]|[\u25ab]|[\u2b1b]|[\u2b1c]|[\u267f]|[\u2b55]|[\u24c2]|[\u2139]|[\u2795]|[\u2796]|[\u3030]|[\u2797]|[\u2716]|[\u2714]|[\u2122]|[\u27b0]|[\u27bf]|[\u303d]"
            + "|[\u20e3]|[\u263a]";
    private static Pattern pattern = Pattern.compile(regex,
            Pattern.UNICODE_CASE | Pattern.CASE_INSENSITIVE);

    private static String filter(String inputString) {
        return pattern.matcher(inputString).replaceAll("[表情]");
    }
}