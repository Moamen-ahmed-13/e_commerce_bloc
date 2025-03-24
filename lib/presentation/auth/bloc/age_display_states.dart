import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgeDisplayState {}
class AgeDisplayInitial extends AgeDisplayState {}
class AgeDisplayLoading extends AgeDisplayState {}
class AgeDisplayLoaded extends AgeDisplayState {
  final  List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;
  AgeDisplayLoaded({ required this.ages});
}
class AgeDisplayError extends AgeDisplayState {
  final String message;
  AgeDisplayError({required this.message});
}