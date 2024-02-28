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
  // Uri.httpsでは下記の通り、第一引数に baseUrl、第二引数にURL
  // パス、Map<String,dynamic>型でクエリパラメータを指定します。
  final uri = Uri.https("qitta.com","/api/v2/items", {
    "query":"title:$keyword",
    "par_page":"10",
  });

  // API通信のリクエストヘッダーに含めるアクセストークンをdotenvから取得します。
  final String token = dotenv.env['QIITA_ACCESS_TOKEN'] ?? '';

  // 2. Qiita APIにリクエストを送る
  // awaitで非同期処理を待ち、http.Response型のresに結果を格納します。
  final http.Response res = await http.get(uri, headers:{
    "Authorization":"Bearer $token",
  });

  // 3. 戻り値をArticleクラスの配列に変換
  // ステータスに応じた処理
  if(res.statusCode == 200){
    // モデルクラスへ変換
    // レスポンスは複数の投稿データの配列なので、一度jsonDecode()を使ってList<dynamic>型に変換します。
    // その後、map()でList<dynamic>型の配列の中身を１つ１つ factory コンストラクタを使ってArticleオブジェクトに変換し、
    // toList()で再度配列に格納し直し返します。
    final List<dynamic> body = jsonDecode(res.body);
    return body.map((dynamic json)=> Article.fromJson(json)).toList();
  }else {
    return [];
  }

  // 4. 変換したArticleクラスの配列を返す(returnする)
  
}