import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final Logger _logger = Logger();

  SignupBloc(this._firebaseAuth, this._firestore) : super(SignupInitial()) {
    on<SignupButtonPressed>(_onSignupButtonPressed);
  }

  Future<void> _onSignupButtonPressed(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    _logger.i('SignupButtonPressed event received');
    emit(SignupLoading());
    try {
      _logger.i('Creating user with email: ${event.email}');
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      _logger.i('User created with UID: ${userCredential.user!.uid}');
      // Store user details in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': event.email,
        'createdAt': DateTime.now(),
      });

      _logger.i('User details stored in Firestore');
      emit(SignupSuccess());
    } catch (e) {
      _logger.e('Signup failed: $e');
      emit(SignupFailure(e.toString()));
    }
  }
}
