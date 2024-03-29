//
// import 'package:firebase_auth/firebase_auth.dart';
// import'package:flutter/material.dart';
// void PhoneFireBase({@required String phoneNumber,context,String Verification}) async {
//   FirebaseAuth auth=FirebaseAuth.instance;
//   auth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted:(credential){
//     auth.signInWithCredential(credential).then((value){
//       Navigator.popAndPushNamed(context, 'home');
//     });
//   }
// }, verificationFailed:(Erreur){print("Erreur");}, codeSent:(verify,val){Verification=verify;}, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/NotificationWidget.dart';
import 'package:ii_cpi_project/components/Post.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';
import 'package:ii_cpi_project/constantes/Functions.dart';
import 'package:ii_cpi_project/models/postClass.dart';
import 'package:ii_cpi_project/models/user.dart';
import 'package:mysql1/mysql1.dart';

var settings = ConnectionSettings(
  // host: '172.20.10.10',   //when using iphone
  // host: "192.168.43.145",
  host: "192.168.43.155",
  port: 3306,
  user: 'mosbah',
  password: 'mosbah',
  db: 'ftrigk',
);
void createPostToDB(PostClass postClass, String postType) async {
  var conn = await MySqlConnection.connect(settings);
  print(conn.toString());
  var r = await conn.query(
      "insert into  $postType (UserId,PostingDate,Date,Time,Trajet,Vehicule,Description,phoneNumber) values (?,?,?,?,?,?,?,?)",
      [
        postClass.userId,
        postClass.postingDate,
        DateTime.parse(postClass.date).toUtc(),
        postClass.time,
        postClass.trajet.first,
        getNumOfVehicule(postClass.vehicule),
        postClass.description,
        postClass.phoneNumber,
      ]);
  print(r);
}

Stream<List<Widget>> importPosts({@required String postType}) async* {
  //! 0 --> demandes 1--> offers
  //! there is a postType map in Constatns. Use it.
  List<Widget> posts = [];
  var conn = await MySqlConnection.connect(settings);
  var result = await conn.query("SELECT * FROM `$postType`");
  List<dynamic> entriesToPost = [];

  for (var r in result) {
    r.fields.forEach((key, value) {
      print(value);
      entriesToPost.add(value);
    });
    PostClass postClass = PostClass(
      userId: entriesToPost[1],
      postID: entriesToPost[0],
      postingDate: entriesToPost[2],
      date: entriesToPost[3].toString().substring(0, 10) +
          entriesToPost[3].toString().substring(
              entriesToPost[3].toString().length - 9,
              entriesToPost[3].toString().length),
      time: entriesToPost[4],
      trajet: numToStringWilaya(entriesToPost[5].toString()),
      vehicule: getTheTypeOfVehicule(entriesToPost[6]),
      description: entriesToPost[7].toString(),
      phoneNumber: entriesToPost[8].toString(),
      // time: entriesToPost[9].toString(),
    );
    User user;
    var result = await conn
        .query("SELECT * FROM `user` WHERE userId=?", [postClass.userId]);
    print("userid " + postClass.userId.toString());
    user = await findUserById(postClass.userId, result);

    posts.add(
      Post(post: postClass, isOffer: postType == "Offer", user: user),
    );

    entriesToPost.clear();
  }
  try {
    yield posts;
  } catch (e) {
    print(e);
  }
}

Future<void> createuser(String nom, String fname, number, String token) async {
  var conn = await MySqlConnection.connect(settings);
  await conn.query(
      "insert into user (FirstName,FamillyName,PhoneNumber,token) values (?,?,?,?)",
      [nom, fname, number, token]);
  await setUserInSharedPrefs(thisUser);
}

Future<bool> verifyNumber({@required phone}) async {
  var conn = await MySqlConnection.connect(settings);
  var result =
      await conn.query("SELECT * FROM `user` WHERE PhoneNumber=?", [phone]);
  if (result.isEmpty) {
    return false;
  } else {
    List<dynamic> entriesToUser = [];
    entriesToUser = result.first.toList();

    thisUser = User(
      id: entriesToUser[0],
      firstName: entriesToUser[1].toString(),
      famillyName: entriesToUser[2].toString(),
      phoneNumber: '0' + entriesToUser[3].toString(),
      rateAsClient: entriesToUser[4],
      rateAsDriver: entriesToUser[5],
    );
    await setUserInSharedPrefs(thisUser);
    return true;
  }
}

Stream<List<Widget>> importUserPosts({@required String table}) async* {
  //! 0 --> demands 1--> offers
  //! there is a postType map in Constants. Use it.
  List<Widget> posts = [];
  var conn = await MySqlConnection.connect(settings);
  var result =
      await conn.query("SELECT * FROM `$table` WHERE user Id=?", [thisUser.id]);
  print(result);

  List<dynamic> entriesToPost = [];

  for (var r in result) {
    r.fields.forEach((key, value) {
      entriesToPost.add(value);
    });

    PostClass postClass = PostClass(
      userId: entriesToPost[1],
      postID: entriesToPost[0],
      postingDate: entriesToPost[2],
      date: entriesToPost[3].toString().substring(0, 10) +
          entriesToPost[3].toString().substring(
              entriesToPost[3].toString().length - 9,
              entriesToPost[3].toString().length),
      trajet: numToStringWilaya(entriesToPost[4].toString()),
      vehicule: entriesToPost[5].toString(),
      description: entriesToPost[6].toString(),
      phoneNumber: entriesToPost[7].toString(),
      // time: entriesToPost[9].toString(),
    );

    posts.add(Post(
      post: postClass,
      isOffer: true,
      user: thisUser,
    ));
    entriesToPost.clear();
  }
  try {
    yield posts;
  } catch (e) {
    print(e);
  }
}

Stream<List<Widget>> searchForPost(
    {@required String postType,
    String depart,
    String arrive,
    int vehicle}) async* {
  //! 0 --> demands 1--> offers
  //! there is a postType map in Constants. Use it.
  List<Widget> posts = [];
  var conn = await MySqlConnection.connect(settings);
  var result = await conn.query(
      "SELECT * FROM Offer WHERE (Trajet LIKE (?) OR Trajet LIKE (?))  AND Vehicule =(?)",
      ["%$depart%", "%$arrive%", vehicle]);
  print(result);

  List<dynamic> entriesToPost = [];

  for (var r in result) {
    r.fields.forEach((key, value) {
      entriesToPost.add(value);
    });

    PostClass postClass = PostClass(
      userId: entriesToPost[0],
      postID: entriesToPost[1],
      postingDate: entriesToPost[2],
      date: entriesToPost[3].toString().substring(0, 10) +
          entriesToPost[3].toString().substring(
              entriesToPost[3].toString().length - 9,
              entriesToPost[3].toString().length),
      trajet: numToStringWilaya(entriesToPost[4].toString()),
      vehicule: entriesToPost[5].toString(),
      description: entriesToPost[6].toString(),
      phoneNumber: entriesToPost[7].toString(),
      // time: entriesToPost[9].toString(),
    );
    posts.add(Post(
      post: postClass,
      isOffer: true,
    ));
    entriesToPost.clear();
  }
  try {
    yield posts;
  } catch (e) {
    print(e);
  }
}

Future<User> findUserById(int id, Results result) async {
  List<dynamic> entriesToUser = [];
  result.first.forEach((element) {
    entriesToUser.add(element);
    print(element);
  });
  print("result " + result.toString());
  return User(
    id: entriesToUser[0],
    firstName: entriesToUser[1],
    famillyName: entriesToUser[2],
    phoneNumber: '0' + entriesToUser[3].toString(),
    rateAsClient: entriesToUser[4],
    rateAsDriver: entriesToUser[5],
    token: entriesToUser[6].toString(),
  );
}

Future<bool> archiver() async {
  var conn = await MySqlConnection.connect(settings);
  bool a = (await conn.query(
          "INSERT INTO `AOffer` SELECT * FROM `Offer` WHERE Date <=now()", []))
      .isEmpty;
  bool b = (await conn.query(
          "INSERT INTO `ADemande` SELECT * FROM `Demande` WHERE Date <= now()",
          []))
      .isEmpty;
  bool c =
      (await conn.query("DELETE FROM `Offer` WHERE Date <= now()", [])).isEmpty;
  await conn.query("DELETE FROM `Demande` WHERE Date <= now()", []);

  return !((await conn.query("select 'a'")).isEmpty);
void insertNotification(ownerid, userId, username, msg) async {
  var conn = await MySqlConnection.connect(settings);
  print(conn.toString());
  var r = await conn.query(
      "insert into Notifications (ownerid,userId,username,msg) values (?,?,?,?)",
      [ownerid, userId, username, msg]);
}

Stream<List<NotificationWidget>> importNotifications(
    {@required int ownerid}) async* {
  //! 0 --> demandes 1--> offers
  //! there is a postType map in Constatns. Use it.
  List<NotificationWidget> notifications = [];
  var conn = await MySqlConnection.connect(settings);
  var result = await conn
      .query("SELECT * FROM `Notifications` WHERE ownerid=?", [ownerid]);
  List<dynamic> entriesToNotification = [];

  for (var r in result) {
    r.fields.forEach((key, value) {
      print(value);
      entriesToNotification.add(value);
    });
    NotificationClass notification = NotificationClass(
      id: entriesToNotification[0],
      ownerid: entriesToNotification[1],
      userid: entriesToNotification[2],
      username: entriesToNotification[3],
      msg: entriesToNotification[4],
    );

    notifications.add(
      NotificationWidget(noti: notification),
    );

    entriesToNotification.clear();
  }
  try {
    yield notifications;
  } catch (e) {
    print(e);
  }
}
