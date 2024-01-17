import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.people), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0||index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1||index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }

            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='從國小開始我就發現我的家長與其他的家長不太一樣，我的家長不會對我的學業成績有過度要求，但我也沒也因此放縱自己，'
      '對於自己的課業有一定的要求，這讓我從小就能夠自律與自我要求。求學過程中，父母也和其他的家長一樣希望自己的孩子課業能夠比其他孩子更強，'
      '想將我送去補習班學習而來詢問我的意見，我拒絕了，因為我認為我有能力自己能做得比別人好，家長也是尊重我的選擇。之後，我面臨的選擇越來越多，'
      '每一次的選擇後果不管是好是壞我都必須自己承擔，這讓我學會了為自己的選擇負責，每次抉擇後不管是好是壞都不怨天尤人，因為那是自己所做的選擇。';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who am I', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),

        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width:3),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
          ],
        ),
        child: Text('國中技藝班探索國三時，有舉辦了技藝班，為了探索自我，確定未來的路，我上下學期都有參加。'
            '我去了第二次才發現我想要去哪一個科系。我去的電機與電子系裡面剛好有教到程式設計，使用微電腦 arduino 設計LED做出跑馬'
            '燈與使用 arduino block控制micro-bit 智慧小車依據已畫出的車道規劃程式，我都一老師要求完整的做出來了。'
            '在寫的時候我突然想到，原來我在國小的時候就有碰過程式相關的課程了，當時是使用scratch製作的，當時做的作品是打磚塊，'
            '我還記得當時做出來後那莫大的喜悅，原來在很早之前我就喜歡寫程式了。', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大一時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 學好英文'),
                  Text('2. 微積分學好'),
                  Text('3. 人際關係'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大二時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 發掘未來方向'),
                  Text('2. 時間有效利用'),

                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大三時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:100,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 努力做好大專題'),
                  Text('2. 開始了解未來想要的出路'),
                  Text('3. 演算法修好'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('大四時期'),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height:150,
              width: 200,
              child: ListView(
                children: [
                  Text('1. 努力找到想要的實習'),
                  Text('2. 考取多益550'),
                ],
              ),
            ),
          ],
        ),
      ],),
    );
  }
}
class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width:3),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
          ],
        ),
        child: Text('目前希望能朝資安或是網頁設計這兩種學習，之後實習也會挑選相關職缺應徵看看', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}