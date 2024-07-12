// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:equatable/equatable.dart';

// part 'session_state.dart';

// class SessionCubit extends Cubit<SessionState> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   SessionCubit() : super(SessionInitial());

//   Future<void> createSession() async {
//     try {
//       emit(SessionLoading());
//       String userId = _auth.currentUser!.uid;
//       DocumentReference sessionRef = await _firestore.collection('sessions').add({
//         'teacherId': userId,
//         'channelName': 'live_${DateTime.now().millisecondsSinceEpoch}',
//       });
//       String channelName = (await sessionRef.get())['channelName'];
//       emit(SessionCreated(sessionId: sessionRef.id, channelName: channelName));
//     } catch (e) {
//       emit(SessionError(message: e.toString()));
//     }
//   }

//   Future<void> joinSession(String sessionId) async {
//     try {
//       emit(SessionLoading());
//       DocumentSnapshot sessionSnapshot = await _firestore.collection('sessions').doc(sessionId).get();
//       if (sessionSnapshot.exists) {
//         emit(SessionJoined(sessionId: sessionId, channelName: sessionSnapshot['channelName']));
//       } else {
//         emit(SessionError(message: 'Session not found'));
//       }
//     } catch (e) {
//       emit(SessionError(message: e.toString()));
//     }
//   }
// }
