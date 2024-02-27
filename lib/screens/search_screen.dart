//  material パッケージはマテリアルデザインの UI コンポーネントを使う為のパッケージで、UI を構成するファイルでは必ずと言って良いほどインポートすることになります。

import "package:flutter/material.dart";
import "dart:convert"; //json変換で使用
import "package:http/http.dart" as http;// httpという変数を通して、httpパッケージにアクセス
import "package:flutter_dotenv/flutter_dotenv.dart";//秘匿化したアクセストークンの取得に使用
import 'package:zenflutterapp/models/article.dart';//作成済みのArticleクラス

// StatefulWidgetクラス と Stateクラス に分かれていることがわかります。
// StateクラスはStatefulWidgetのcreateStateメソッドで返され、この２つのクラスは必ず対になっている必要があります。
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// Stateクラスは 自身が持つ変数の更新を検知すると、自身のbuildメソッドを再度呼び出す という機能を持っています。
// setStateメソッドで更新する事ができます。

// Scaffold Widget：マテリアルデザインのアプリを作る(MaterialAppを使う)場合に、ページの元となる widget 
// bodyに渡す Widget がページの中身になります。
// その他AppBar、FloatingActionButton、Drawer、BottomNavigationBar などの Widget をレイアウトしてくれます。

class _SearchScreenState extends State<SearchScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Qitta Search"),
      ),
      body: Container(),
    );
    
  }
}


Future<List<Article>> searchQitta(String keyword) async {
  // 1. http通信に必要なデータを準備をする
  // 2. Qiita APIにリクエストを送る
  // 3. 戻り値をArticleクラスの配列に変換
  // 4. 変換したArticleクラスの配列を返す(returnする)
}