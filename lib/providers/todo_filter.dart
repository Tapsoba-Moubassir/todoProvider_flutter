
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoFilterState extends Equatable{
  final Filter filter;

  TodoFilterState({required this.filter});

  factory TodoFilterState.initial(){
    return TodoFilterState(filter: Filter.all);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [filter];

  TodoFilterState copyWith({Filter? filter,}){
    return TodoFilterState(filter: filter ?? this.filter);
  }
}

class TodoFilter with ChangeNotifier{
  TodoFilterState _state = TodoFilterState.initial();
  TodoFilterState get state => _state;

  void changeFilter(Filter newFilter){
    _state = _state.copyWith(filter: newFilter);
    notifyListeners();
  }
}