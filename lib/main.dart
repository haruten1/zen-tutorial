//  material パッケージはマテリアルデザインの UI コンポーネントを使う為のパッケージで、UI を構成するファイルでは必ずと言って良いほどインポートすることになります。
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zenflutterapp/screens/search_screen.dart';


// ファイルを指定して実行すると呼び出されるのが main関数です。
// runApp関数はアプリを構成する Widget 群を受け取り、描画エンジンに繋げる役割を担います。
// この関数に渡される Widget がアプリのルート(根っこ) になります。
// void main() {
//   runApp(const MainApp());
// }

// dot_envパッケージをインポートし、読み込みのdotenv.load()メソッドを実行します。
// この処理は非同期処理となる為、main関数をFutureに変更しましょう。

// Futureは将来的に実行される処理の結果を表現するオブジェクトであり、<void>はその結果が何も返さないことを示します。
// つまり、Future<void>は何らかの非同期処理が完了した後に、何も戻り値を返さないことを示します。
void main() async {
  await dotenv.load(fileName:".env");
  runApp(const MainApp());
}

// StatelessWidgetとStatefulWidgetは抽象クラスの為、継承したクラスを定義し、buildメソッドを実装します。
// StatelessWidget と StatefulWidget の違いは、StatelessWidgetは状態を持たない一方で、StatefulWidgetは状態を持つことができるという点

// MaterialApp : Google が提供するマテリアルデザインに準拠する Widget とそれらで使う様々な機能を提供してくれる Widget 
// アプリ全体のカラーテーマやアプリのルーティングなど様々な設定を定義することができます。
// homeフィールド には最初に表示する Widget を指定します

// ThemeData:アプリ全体のビジュアルに関するテーマを定義するクラスです(今回はない)

// Key：１つ１つの Widget を一意に特定する為の識別子です
// nullable な引数なので、必ず渡す必要はありませんが StatelessWidget、StatefulWidget を定義する際は必ず引数として記述します。
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qitta Search",
      theme: ThemeData(primarySwatch: Colors.green,
      fontFamily: "Hiragino Sans", 
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF55C500)),
      textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),

      home: const SearchScreen()
    );
  }
}