import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rombak_files/general_observer.dart';
import 'app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const App());
}
