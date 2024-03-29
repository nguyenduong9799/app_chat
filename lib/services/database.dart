import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {



  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection('users').add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .snapshots();
  }

   searchByName(String searchField) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where('name', arrayContains: searchField)
        .snapshots();

  }
  //
  Future<void> addChatRoom(chatRoom, chatRoomId) async {
    FirebaseFirestore.instance
        .collection('chatRoom')
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async{
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  Future<void> addMessage(String chatRoomId, chatMessageData)async {

    FirebaseFirestore.instance.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
Future SearchByName(String searchField) async {
  return  FirebaseFirestore.instance
      .collection("users")
      .where('name', isGreaterThanOrEqualTo: searchField)
      .get();
}
}