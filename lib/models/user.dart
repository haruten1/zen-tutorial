// Userのモデルクラスを作成　

class User{
  // コンストラクタ
  User({
    required this.id,
    required this.profileImageUrl,
  });

// プロパティ
  final String id;
  final String profileImageUrl;

  // JSONからUserを生成するファクトリコンストラクタ
  // dynamic型としてjsonを受け取り、１つ１つ展開していきます。
  // また展開した値は as <データ型> と明記する事で指定したデータ型へキャストする事が可能です。
  factory User.fromJson(dynamic json){
  return User(
    id:json["id"] as String,
    profileImageUrl: json["profile_image_url"] as String,
  );
}
}

