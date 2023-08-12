import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easypisy/models/easypisy.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ required this.uid});

  // collection reference
  final CollectionReference easypisyCollection = FirebaseFirestore.instance.collection('user');

  // Future updateUserData(String easypisyName, String image) async{
  //   return await easypisyCollection.doc(uid).set({
  //     'easypisyName' : easypisyName,
  //     'image' : image
  //   });
  // }

  Future uploadUserData(String easypisyName, String tag) async{
    return await easypisyCollection.doc(uid).collection('easypisyCollection').doc().set({
      'easypisyName' : easypisyName,
      'tag' : tag,
      'image' : 'image'
    });
  }

  // List<Easypisy> _easypisyListFromSnapshot (QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc){
  //     return Easypisy(
  //         easypisyName: doc['easypisyName'] ?? '',
  //         image: doc['image'] ?? '',
  //         tag: doc['tag'] ?? ''
  //     );
  //   }).toList();
  // }

  List<Easypisy> _easypisyListFromSnapshot (QuerySnapshot snapshot){
     return snapshot.docs.map((doc){
       return Easypisy(
          easypisyName:doc['easypisyName'] ?? '',
          image: doc['image'] ?? '',
          tag: doc['tag'] ?? ''
      );
    }).toList();
  }
  
  Stream<List<Easypisy>> get easypisys{
    print('easypisy snapshot ------length-----');
    print(uid);
    print(easypisyCollection.doc(uid).collection('easypisyCollection'));
    return easypisyCollection.doc(uid) .collection('easypisyCollection')
           .snapshots().map(_easypisyListFromSnapshot);
  }
}