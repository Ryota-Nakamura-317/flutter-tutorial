import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class EstateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createBody(),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButton: _createFloatingActionButton(),
    );
  }
}

Widget _createFloatingActionButton() {
  return Container(
    width: 75,
    height: 75,
    child: FittedBox(
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal[400],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search),
            Text(
              '物件',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _createBottomNavigationBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    unselectedItemColor: Colors.grey[400],
    selectedItemColor: Colors.teal[400],
    unselectedFontSize: 12,
    unselectedIconTheme: IconThemeData(size: 30),
    selectedIconTheme: IconThemeData(size: 30),
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'お気に入り',
      ),
      BottomNavigationBarItem(
        icon: Badge(
          badgeContent: Text('1', style: TextStyle(color: Colors.white)),
          child: Icon(Icons.message),
        ),
        label: 'メッセージ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        label: 'マイページ',
      ),
    ],
  );
}

Widget _createBody() {
  final estateList = estateInfo();
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        height: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'カウルのおすすめ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '新着３件',
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(width: 150),
                    Text(
                      '編集',
                      style: TextStyle(color: Colors.teal[400]),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.teal[400],
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.brown[50],
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.train, size: 20),
                            Text('東京駅・品川駅・川崎駅・横浜駅・目黒駅'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on, size: 20),
                            Text('下限なし〜2,000万円'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.info_outline, size: 20),
                            Text('1R〜4LDK / 10㎡以上 / 徒歩20分'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: estateList.length,
          itemBuilder: (context, index) {
            return _createEstateInfo(context, estateList[index]);
          },
        ),
      )
    ],
  );
}

Widget _createAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.teal[400]),
    title: Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'おすすめ',
            style: TextStyle(color: Colors.teal[400]),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.grey[200],
            shape: StadiumBorder(),
          ),
        ),
        SizedBox(width: 10),
        Badge(
          badgeContent: Text('1', style: TextStyle(color: Colors.white)),
          position: BadgePosition.topEnd(top: -4, end: -4),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'リフォーム',
              style: TextStyle(color: Colors.teal[400]),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[200],
              shape: StadiumBorder(),
            ),
          ),
        ),
      ],
    ),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 16),
        child: IconButton(
          icon: Icon(Icons.add_circle),
          iconSize: 40,
          onPressed: () {},
        ),
      ),
    ],
  );
}

Widget _createEstateInfo(BuildContext context, EstateData data) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
    height: 430,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(data.image, width: 500),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  data.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  data.price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.train, size: 20),
                    Text(data.distance),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.monetization_on, size: 20),
                    Text(data.large),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 20),
                    Text(data.spec),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 170,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: Colors.grey[300]),
                        label: Text('興味なし'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey[700],
                          side: BorderSide(color: Colors.grey[400], width: 2),
                          elevation: 0,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 170,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border,
                            color: Colors.grey[300]),
                        label: Text('お気に入り'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.grey[700],
                          side: BorderSide(color: Colors.grey[400], width: 2),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

List<EstateData> estateInfo() {
  return [
    EstateData(
      'images/スクリーンショット 2021-04-05 午後13.55.32 午後.png',
      'Rising place 川崎',
      '2,000万円',
      '京急本線 京急川崎駅 より 徒歩9分',
      '1K / 21.24㎡ 南西向き',
      '2階/15階建 築5年',
    ),
    EstateData(
      'images/スクリーンショット 2021-04-05 午後13.55.32 午後.png',
      'Rising place 川崎',
      '2,000万円',
      '京急本線 京急川崎駅 より 徒歩9分',
      '1K / 21.24㎡ 南西向き',
      '2階/15階建 築5年',
    ),
    EstateData(
      'images/スクリーンショット 2021-04-05 午後13.55.32 午後.png',
      'Rising place 川崎',
      '2,000万円',
      '京急本線 京急川崎駅 より 徒歩9分',
      '1K / 21.24㎡ 南西向き',
      '2階/15階建 築5年',
    ),
  ];
}

class EstateData {
  final image;
  final name;
  final price;
  final distance;
  final large;
  final spec;

  EstateData(
    this.image,
    this.name,
    this.price,
    this.distance,
    this.large,
    this.spec,
  );
}