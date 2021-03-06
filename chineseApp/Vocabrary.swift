//
//  VocabraryList.swift
//  chineseApp
//
//  Created by shoichiyamazaki on 2017/08/31.
//  Copyright © 2017年 shoichiyamazaki. All rights reserved.
//

import Foundation

class Vocabrary{
    var list:[[String]] = [["老师","先生","让他做老师","Lǎoshī"],
                           ["漂亮","きれい","她很漂亮","Piàoliang"],
                           ["开水","お湯","我不喝茶，给我一杯开水吧","Kāishuǐ"],
                           ["汽水","サイダー","汽水在冰箱里放着呢","Qìshuǐ"],
                           ["矿泉水","ミネラルウォーター","现在喝矿泉水的人越来越多了","Kuànquánshuǐ"],
                           ["习惯","慣れる","我不习惯喝威士忌","Xíguàn"],
                           ["营养","栄養","白菜虽然便宜，但是很有营养","Yíngyǎng"],
                           ["老家","故郷","我们老家的土豆很有名","Lǎojiā"],
                           ["胳膊","腕","我的胳膊有点儿疼","Gēbó"],
                           ["眼泪","涙","她感动得流下了眼泪","Yǎnlèi"],
                           ["骨头","骨","他骨头没有受伤","Gǔtou"],
                           ["脾气","性格","他脾气不好，容易生气","Píqì"],
                           ["时装","ファッション","晚上我们去看时装表演","Shízhuāng"],
                           ["西服","スーツ","他穿上西服真帅","Xīfú"],
                           ["领带","ネクタイ","今天不用系领带","Lǐngdài"],
                           ["手绢","ハンカチ","他用自己的手绢给我擦眼泪","Shǒujuàn"],
                           ["袜子","靴下","这双鞋应该配什么颜色的袜子","Wàzi"],
                           ["牛仔裤","ジーンズ","女儿喜欢穿破的牛仔裤","Niúzǎikù"],
                           ["消息","ニュース","你这个消息是从哪听说的？","Xiāo xi"],
                           ["舆论","世論","社会舆论都支持他的行动","Yúlùn"],
                           ["主持人","司会者","我很爱看这个主持人的节目","Zhǔchírén"],
                           ["播音员","アナウンサー","播音员赈灾报道晚间新闻","Bōyīnyuán"],
                           ["直播","生放送","大家一起看世界杯足球决赛的直播","Zhíbō"],
                           ["收视率","視聴率","这个节目的收视率挺高的","Shōushìlü"],
                           ["电视剧","ドラマ","韩国节目的很受观众的喜爱","Diànshìjù"],
                           ["天线","アンテナ","画面不清楚，是不是天线出问题了？","Tiānxiàn"],
                           ["频道","チャンネル","频道太多了，不知看哪个好？","Píndào"],
                           ["邮政编码","郵便番号","你知道他的邮政编码吗？","Yòuzhèng biānmǎ"],
                           ["包裹","小包","这个包裹是谁寄来的","Bāogǔo"],
                           ["信封","封筒","一看信封就知道是爸爸的来信","Xìnfēng"],
                           ["信箱","ポスト","你快去看看信箱里有没有信","Xìnxiāng"],
                           ["零花钱","小遣い","这个月的零花钱都花光了","Línghuāqián"],
                           ["存折","預金通帳","这是存折，别弄丢了","Cúnzhé"],
                           ["股票","株券","现在在中国连老太太也炒股票","Gǔpiào"],
                           ["价格","価格","如果价格合适，可以考虑订货","Jiàgé"],
                           ["发票","領収書","买东西的发票都在这个抽屉里","Fāpiao"],
                           ["合同","契約","经过几个月的谈判，今天终于签合同了","Hétong"],
                           ["生意","商売","最近生意做的怎么样？","Shēnyì"],
                           ["工资","給料","我的工资跟的同龄人比起来不算高","GōngzĪ"],
                           ["奖金","賞金・ボーナス","你们公司每年发几次奖金","Jiǎngjīn"],
                           ["津贴","（残業などの）手当","你们加班有津贴吗？","Jīntiē"],
                           ["福利","福利厚生","你们公司的福利待遇怎么样？","Fúlì"],
                           ["太阳","太陽","雨一停，太阳就出来了","Tāiyáng"],
                           ["凉鞋","サンダル","这双凉鞋只穿过一次","Liánxié"],
                           ["拖鞋","スリッパ","你怎么穿着拖鞋上街呢","Tuōxié"],
                           ["导游","ガイド","导游领着我们参观博物馆","Dǎoyóu"],
                           ["董事长","理事長","最后请董事长给我们讲话","Dǒngshìzhǎng"],
                           ["临时工","アルバイト","我们刚雇了几个临时工","Línshígōng"],
                           ["师傅","師匠","站在那里的是我的师傅","Shīfu"],
                           ["小伙子","青年","小伙子们都游泳去了","Xiǎohǔozi"],
                           ["年轻人","若者","最近的年轻人讲究名牌货","Niánqīngrén"]]
    
    var list2:[[String]] = [["一辈子","生涯","他一辈子都在学校里教书","Yíbèizi"],
                            ["整天","一日中","我整天都在想这件事情","Zhěntiān"],
                            ["白天","昼間","我白天学习，晚上打工","Báitiān"],
                            ["假期","休暇","我想利用这个假期好好儿休息一下儿","Jiàqī"],
                            ["欧洲","ヨーロッパ","我去过欧洲的很多国家","Ōuzhōu"],
                            ["亚洲","アジア","我们应该加强与亚洲各国的交往","Yàzhōu"],
                            ["非洲","アフリカ","我们班有两个从非洲来的留学生","Fēizhōu"],
                            ["加油站","ガソリンスタンド","往右拐一直走就是加油站","Jiāyóuzhàn"],
                            ["写字楼","オフィスビル","听说他们公司就在这座写字楼里","Xiězìlóu"],
                            ["办公室","オフィス","他的办公室在二楼","Bàngōngshì"],
                            ["剧场","劇場","今天剧场上演京剧，你想去看吗？","Jùchǎng"],
                            ["校园","キャンパス","校园里有一片很大的树林","Xiàoyuán"],
                            ["旁边","そば","我家旁边就是邮局","Pángbiān"],
                            ["邻居","隣近所","我们是邻居，相处的很好","Línjū"],
                            ["马路","道路","过马路，往右拐，就有一家书店","Mǎlù"],
                            ["胡同","路地","以前北京有很多胡同，现在越来越小了","Hútòng"],
                            ["院子","中庭","他家的院子里有一片竹林","Yuànzi"],
                            ["公寓","マンション","因为这个公寓离市中心近，所以很贵","Gōngyù"],["屋子","部屋","不好意思，屋子里乱七八糟的","Wūzi"],["卧室","寝室","我的卧室在楼上","Wòshì"],["别墅","別荘","他邀请我们去他的别墅玩儿","Biéshù"],["香皂","石鹸","这个牌子的香皂根香，我一直用它","Xiāngzào"],["梳子","くし","他总是随身带着一把梳子","Shūzi"],["背包","リュックサック","他背着背包出门了","Bēibāo"],["名片","名刺","你今天千万不能忘带名片","Míngpiàn"],["乐器","楽器","你都会弹什么乐器","Yùeqì"],["动画片","アニメ","妹妹一看起东动画片来，连饭也不吃","Dònghuàpiàn"],["网址","URL","我告诉你网址，你快写下来","Wǎnzhǐ"],["网吧","インターネットカフェ","昨天我们在网吧玩儿了一个网上","Wǎnbā"],["黑客","ハッカー","这个网站又遭到了黑客攻击","Hāikè"],["演播室","スタジオ","他们正在演播室里录制节目","Yǎnbōshì"],["邮递员","郵便配達員","刚才邮递员送邮包来了","Yóudìuán"],["礼拜","週","我每个礼拜游三次泳","Lǐbài"],
                            ["工夫","時間","今天我没工夫，改日再说吧","Gōngfu"],["航空信","航空便","航空信比平信快几天","Hángkōngxìn"],["外汇","外貨","你知道在哪儿能换外汇吗？","Wàihùi"],["相声","漫才","你喜欢听相声吗？","Xiàngsheng"],["私房钱","へそくり","他可能存了不少私房钱","Sīfángqián"],["冠军","優勝","他是2010北京国际马拉松的冠军","Guànjūn"],["玫瑰花","バラ","他送我一枝玫瑰花，不知什么意思","Méiguihuā"],["暂时","しばらく","我现在暂时住在亲戚家里","Zànshí"],["围巾","マフラー","今年冬天流行戴长围巾","Wéijīn"],["丝袜","ストッキング","这个丝袜又开线了","Sīchóu"],["蛋糕","ケーキ","我们买了一个大蛋糕给她过生日","Dàngāo"],["自助餐","バイキング","你喜不喜欢吃自助餐？","Zìzhùcān"],["快餐","ファストフード","没有时间了，还是吃快餐吧","Kuàicān"],["口香糖","ガム","我一紧张就开始嚼口香糖","Kǒuxiāngtáng"],["樱花","サクラ","星期天大家都到公园去赏樱花","Yīnghūa"],["圣诞节","クリスマス","圣诞节他送了你什么礼物","Shèngdànjié"],["除夕","大晦日","除夕我们全家人一起包饺子","Chúxī"]]
    
    var list3:[[String]] = [["堆","積む","书房里堆着很多书和杂志","Duī"],["运","運ぶ","我开车把东西运到车站","Yùn"],["赶","急ぐ","我要赶最后运到车站","Gǎn"],["转","ぶらぶら歩く","我们今天去转了两个商场","Zhuàn"],["踩","踏む","我的眼睛被踩坏了","Cǎi"],["摔","倒れる","他不小心摔了一个跟头","Shuāi"],["抓","つかむ","警察抓到小偷了","Zhuā"],["摁","押す","你摁一下这个键","èn"],["掐","つまむ","我的脚扭伤了","Qiā"],["撕","引き裂く","他一生气，就把车票死了","Sī"],["甩","振り捨てる・動かす","他被女朋友甩了","Shuǎi"],["拖","延ばす、ひきずる","你不要拖时间了","Tuō"],["种","植える","毕业生们在校园里种了一棵树","Zhòng"],["浇","（水などを）浴びせる","他每天给花浇水","Jiāo"],["抹","塗る","我给你抹点儿药吧","Mǒ"],["瞧","見る","你瞧瞧，他们俩多亲热","Qiáo"],["嚷","大声で騒ぐ","你们不要嚷，一个一个说","Rǎng"],["劝","勧める","大家劝他不要再喝了","Quàn"],["煎","焼く","他煎的鱼很好吃","Jiān"],["炸","油で揚げる","油条炸得很脆","Zhá"],["烫","やけどする、熱する","手烫了一下","Tàng"],["醉","（酒に）酔う","昨天晚上大家都喝醉了","Zuì"],["捐","寄付する","同学们纷纷给受灾地区捐钱","Juān"],["藏","隠す","你把画儿藏哪儿了","Cáng"],["赢","勝つ","下次我们一定会赢的","Yíng"],["输","負ける","这次比赛我们输给对手了","Shū"],["夺","奪う","他夺过我的行李，不让我走","Duó"],["抢","奪う","坏人抢走了奶奶的提包","Qiǎng"],["忍","我慢する","他忍不住笑了起来","Rěn"],["赚","儲かる","你一个月能赚多少钱","Zhuàn"],["调","異動する、調整する","我被调上海工作了","Diào"],["选","選ぶ","他这次被选为市长","Xuǎn"],["管","構う、関わる","我的事儿你不要管","Guǎn"],["惹","（状態を）引き起こす","弟弟又惹妈妈生气了","Rě"],["挡","遮る、防ぐ","别挡道，快让开","Dǎng"],["组织","組織する","我们马上组织技术人员研究","Zǔzhī"],["违反","違反する","不管谁违反了规定都要处分","Wéifǎn"],["构成","構成する","这家公司是有五个部门构成的","Gòuchéng"],["从事","従事する","他在公司一直从事管理工作","Cóngshì"],["亏损","損する","公司去年一共亏损三千万日元","Kuīsǔn"],["采用","採用する","这次我们采用了一种新技术","Cǎiyòng"],["培养","育成する","北京大学培养了大量的优秀人才","Péiyǎng"],["造句","作文する","老师让我们研究这个词造句","Zàojù"],["辅导","補習する","老师到留学生宿舍辅导我们功课","Fǔdǎo"],["表达","表現する","这些意思我用中文表达不出来","Biǎodá"],["后悔","後悔する","以前我没有好好儿学习，现在很后海","Hòuhuǐ"],["盼望","待ち望む","我盼望快点儿放假","Pànwàng"],["问候","挨拶する","我爸爸让我问候您","Wènhòu"],["允许","許可する","小红的爸爸允许我们交往了","Yǔnxǔ"],["依靠","頼る","不要依靠别人，要靠自己努力","Yīkǎo"]]
    
    var list4:[[String]] = [["打扰","訪問する","不好意思，星期天打扰您","Dǎrǎo"],["获得","獲得する","日本队获得了足球赛的冠军","Hùodá"],["关照","世話する","老板平时很关照我们","Guānzhào"],["欺骗","だます","他用谎言欺骗了我们","Qīpìan"],["上当","だまされる","她能说会道，我差点了上当","Shàngdàng"],["照顾","面倒を見る","护士热心地照顾病人","Zhàogu"],["误会","誤解する","你误会我的意思了","Wùhùi"],["原谅","許す","请你原谅我","Yúanliàng"],["召开","開く","今天公司召开全体职工大会","Zhàokāi"],["举行","開催する","我的朋友举行了盛大的结婚仪式","Jǔxíng"],["签名","サインする","观众们请明星签名","Qiānmíng"],["牺牲","犠牲にする","大家牺牲了午休时间开会讨论","Xīshēng"],["避免","避ける","为了避免出错，再好好儿看一次","Bìmiǎn"],["缺乏","欠如する","我还年轻，缺乏工作经验","Qūefá"],["值得","値する","他们的成功经验值得我们学习","Zhíde"],["采访","取材する","记者正在采访我们的老师","Cǎifǎng"],["深入","深掘りする","我们要经常深入基层调查研究","Shēnrù"],["刮风","風が吹く","这几天又是刮风又是下雨","Quāfēng"],["松","緩い","小孩儿的鞋带松了","Sōng"],["宽","幅が広い","北京的街道都很宽","Kuān"],["窄","幅が狭い","这个胡同太窄了，汽车开不进去","Zhǎi"],["整齐","整っている","书架上整齐的放着有关法律的书籍","Zhěngqí"],["先进","先進的である","我们要不断的学习先进技术","Xiānjìn"],["糟糕","だめだ","糟糕！我忘带钥匙了","Zāogāo"],["稳定","安定している","他的病情已经稳定下来了","Wěndìng"],["懒","怠惰な","她懒得连碗也不洗","Lǎn"],["严肃","厳粛である","这种场合，你们应该严肃一点儿","Yánsù"],["萧洒","洒落ている","他今天穿的很萧洒","Xiāosǎ"],["苗条","スタイルが良い","他身材苗条，像芭蕾舞演员","Miáotiáo"],["干脆","てきぱきしている","他回答得干脆","Gāncuì"],["马虎","そそっかしい","他太马虎了，出门也不锁门","Mǎhu"],["风趣","ユーモアがある","他平时说话很风趣","Fēngqù"],["可靠","信頼できる、確かである","他很可靠，找他没错","Kěkào"],["乐观","楽観的である","不管遇到什么困难，他都很乐观","Lèguān"],["朴素","質素である","老年人比你年轻人穿的朴素","Pǔsù"],["轻松","気楽である","做完作业，我感到很轻松","Qīngsōng"],["无聊","つまらない","这个电视节目很无聊","Wúliáo"],["讨厌","嫌だ","我很讨厌他的做法","Tǎoyàn"],["浓","濃い","这杯咖啡太浓了","Nóng"],["腻","脂っこい","这个汤用太多了，有点儿腻","Nì"],["却","〜のに","我们本来打算去北京，他却去上海了","Què"],["偏","意地になって","不让他去，他偏要去","Piān"],["特地","わざわざ","他特地来机场接我","Tèdì"],["仅","ただ、わずか","他仅学了一年汉语，就说的这么好","Jǐn"],["尽量","できるだけ","尽量不要给他们添麻烦","Jǐnliàng"],["反正","いずれにしても","反正今天做不完，明天再干吧","Fǎnzhèng"],["逐渐","徐々に","天气逐渐暖和起来了","Zhújiàn"],["将要","間もなく","听说将要在这里国际比赛","Jiāngyào"],["至少","少なくとも","上课前，你至少应该吧生词背下来","Zhìshǎo"],["尤其","特に","汉语很难，尤其是声调","Yóuqí"]]
    
    var list5:[[String]] = [["的确","確かに","这交通的确不方便","Díqùe"],["亲自","自ら","老师亲自来到我的宿舍给我补课","Qīnzì"],["也许","〜かもしれない","他也许来，也许不来","Yěxǔ"],["首先","まず","我首先打表全体同学表示感谢","Shǒuxiān"],["比萨饼","ピザ","我家附近有一家比萨饼店","Bǐsàbǐng"],["汉堡包","ハンバーガー","他中午只吃了一个汉堡包","Hànbǎobāo"],["薯条","フライドポテト","再给我来一包薯条","Shǔtiáo"],["色拉","サラダ","他做的色拉色香味俱全","Sèlā"],["香肠","ソーセージ","超市里有各种各样的香肠","Xiāngcháng"],["金枪鱼","マグロ","我爱吃金枪鱼寿司","Jīngqīangyú"],["生鱼片","刺し身","最近中国人也开始吃生鱼片了","Shēngyúpiàn"],["冰激凌","アイス","我想吃草莓味儿的冰激凌","Bīngjīlíng"],["蔬菜","野菜","不要光吃肉，还要多吃点儿蔬菜","Shūcài"],["蒜","にんにく","这个才不要放蒜了，他不喜欢吃","Suàn"],["葱","ネギ","你去买两根葱回来","Cōng"],["姜","生姜","做鱼的时候一定要放姜","Jiāng"],["胡萝卜","人参","事实上这是非常好吃的胡萝卜","Húlúobo"],["目前","現在","目前我还不打算去留学","Mùqián"],["当前","当面","当前的主要问题是发展经济","Dāngqián"],["当时","当時","当时我还不到六岁","Dāngshí"],["微波炉","電子レンジ","你用微波炉热一热再吃","Wēibōlú"],["电风扇","扇風機","我觉得还是电风扇舒服","Diànfēngshàn"],["电饭锅","炊飯器","我家的电饭锅还可以蒸馒头","Diànfànguō"],["吹风机","ドライヤー","这是一台老式吹风机，已经不能用了","Chuīfēngjī"],["熨斗","アイロン","你把熨斗放到什么地方去了？","Yùndǒu"],["遥控器","リモコン","这几个遥控里，哪个是电视的？","Yáokòngqì"],["浴巾","バスタオル","你能不能给我换一条新浴巾？","Yùjīn"],["化妆品","化粧品","商场的一楼一般都是化妆品专柜","Huàzhuāngpǐn"],["自来水","水道水","这里的自来水可以直接饮用吗？","Zìláishǔi"],["筷子","箸","请给我筷子","Kùaizi"],["勺子","スプーン","我用勺子吃","Sháozi"],["刀子","ナイフ","用刀子抹黄油","Dāozi"],["生活垃圾","生ゴミ","每天都会产生生活垃圾","Shēnghúolājī"],["高中","高校","你是哪一年高中毕业的？","Gāozhōng"],["课堂","教室","他在课堂上一只表现得很积极","Kètáng"],["学分","（授業などの）単位","我好不容易才拿到汉语学分","Xuéfēn"],["撒谎","嘘をつく","别信他的，他没撒谎了","Sāhuǎng"],["交谈","話をする","刚才和你交谈的人是谁？","Jiāotán"],["提议","提案する","他的提议收到了上级的重视","Tíyì"],["询问","質問する","他向医生询问了自己的病情","Xúwèn"],["谈论","議論する","他们谈论得很激烈","Tánlùn"],["夸奖","褒める","老师夸奖了他的作文","Kuājiǎng"],["干扰","邪魔をする","机场的噪音干扰了居民的睡眠","Gānrǎo"],["留神","注意する","下雨路滑，留神别摔着","Liúshén"],["猜","推測する","我说个谜语你来猜吧","Cāi"],["怀疑","疑う","你不应该随便的怀疑他","Huáiyí"],["谅解","了承する","我向他道了歉，她也谅解了我","Liàngjiě"],["来不及","間に合わない","已经来不及了，火车马上就要开了","Láibují"],["报名","申し込む","明天的大会，我早就报名了","Bàomíng"],["举办","行う","父母为他们举办了盛大的婚礼","Jǔbàn"]]
    
    var list6:[[String]] = [["流通","流通する","打开窗户，让空气流通一下","Liútōng"],["欣赏","鑑賞する","我们昨天晚上欣赏了香港的夜景","Xīnshǎng"],["背","暗記する","上个星期背了一百个生词","Bèi"],["实习","実習する","他现在在市立医院里实习","Shíxí"],["练","練習する","要想学好外语，就得多练","Liàn"],["盖","家を立てる","盖了新房子","Gài"],["收购","買収する","他们公司被一家美国公司收购了","Shōugòu"],["花费","費やす","别在这件事上花费太多的时间了","Huāfèi"],["提价","値段が上がる","食品有提价了","Tíjià"],["补偿","補償する","银行决定补偿顾客的损失","Bǔcháng"],["付出","費やす","他为这个计划付出了巨大的努力","Fùchū"],["就业","就職する","他大学毕业后就在银行就业了","Jiùyè"],["退休","退職する","我妈妈三年前就退休了","Tuìxiū"],["当","〜になる","他已经当了三年人民代表了","Dāng"],["开除","解雇する","他犯了法，被公司开除了","Kāichú"],["注册","登録する","他花了三万块，注册了一家小公司","Zhùcè"],["进修","研修する","他去年国外进修了一年","Jìnxiū"],["安装","取り付ける","最近我家安装了有线电视","ānzhuāng"],["具备","備える","他还不具备一个在国外生活的能力","Jùbèi"],["剩下","のこる","剩下的时间不多了","Shèngxià"],["接到","受け取る","能接到他的回信，我很高兴","Jiēdào"],["歇","休憩する","你累了吧，快坐下来歇一歇","Xiē"],["减肥","ダイエットする","我成功减肥二十公斤","Jiǎnféi"],["出院","退院する","奶奶昨天终于出院了","Chūyuàn"],["生病","病気になる","他身体弱，经常生病","Shēngbìng"],["叫醒","目覚める","四点钟之前叫醒我","Jiàoxǐng"],["冲","突進する","那条狗一直向我冲过来真可怕","Chōng"],["躲","隠れる","他这几天不知躲到哪里去了","Duǒ"],["摘","採る","在教室里请把帽子摘下来","Zhāi"],["挥","振る","送行的人挥手和亲友告别","Huī"],["递","渡す","请把那本书递给我","Dì"],["揍","殴る","他被人揍了一顿","Zòu"],["拆","壊す","村里的老房子都拆了，盖了楼","Chāi"],["删除","削除する","我删除感染的病毒的邮件了","Shānchú"],["转换","転換する","你能把这个文件转换成繁体字吗？","Zhuǎnhuàn"],["对付","対処する","别着急，我有办法对付","Duìfu"],["受骗","騙される","我再也不会受骗上当了","Shòupiàn"],["委屈","つらい","我的心里很委屈","Wěiqu"],["惊人","驚くべき","这个城市的变化太惊人了","Jīngrén"],["惊奇","不思議に思う","他对周围的变化感到惊奇","Jīngqí"],["沉默","寡黙","我爸爸一个沉默寡言的人","Chénmò"],["刻苦","努力する","他学习比我们谁都刻苦","Kèkǔ"],["麻木","しびれる","天气太冷，我手脚都冻麻木了","Mámù"],["好久","久しぶり","我好久没见他了，不知他最近如何","Hǎojiǔ"],["昂贵","高価な","在欧洲旅游，住宿费非常昂贵","ángguì"],["大批","大量の","中国有大批学生在日本留学","Dàpī"],["起码","最低限の","这是起码的常识","Qǐmǎ"],["及时","タイミングが良い","这场雨下的很及时","Jíshí"],["耐用","長持ちする","这种产品又便宜耐用，非常受欢迎","Nàiyòng"],["时髦","流行している","这种发型现在很时髦","Shímáo"]]
    var allList:[[String]]
    init() {
        allList = list + list2 + list3 + list4 + list5 + list6
    }
}
