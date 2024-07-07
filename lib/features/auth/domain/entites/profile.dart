

class Profile {
  String userid;
  String username;
  String email;
  String image;
  List storeid;

//<editor-fold desc="Data Methods">
  Profile({
    required this.userid,
    required this.username,
    required this.email,
    required this.image,
    required this.storeid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Profile &&
              runtimeType == other.runtimeType &&
              userid == other.userid &&
              username == other.username &&
              email == other.email &&
              image == other.image &&
              storeid == other.storeid);

  @override
  int get hashCode =>
      userid.hashCode ^
      username.hashCode ^
      email.hashCode ^
      image.hashCode ^
      storeid.hashCode;

  @override
  String toString() {
    return 'StoreKeeper{' +
        ' userid: $userid,' +
        ' username: $username,' +
        ' email: $email,' +
        ' image: $image,' +
        ' storeid: $storeid,' +
        '}';
  }

  Profile copyWith({
    String? userid,
    String? username,
    String? email,
    String? image,
    List? storeid,
  }) {
    return Profile(
      userid: userid ?? this.userid,
      username: username ?? this.username,
      email: email ?? this.email,
      image: image ?? this.image,
      storeid: storeid ?? this.storeid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'image': image,
      'storeid': storeid,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      userid: map['userid'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      storeid: map['storeid'] as List,
    );
  }

  static empty() {
    return Profile(
        userid: '',
        username: '',
        email: '',
        image: '',
        storeid: []);
  }

//</editor-fold>
}