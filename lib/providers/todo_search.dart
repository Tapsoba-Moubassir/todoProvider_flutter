
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TodoSearchState extends Equatable{
  final String searchTearm;

  TodoSearchState({required this.searchTearm});

  factory TodoSearchState.initial(){
    return TodoSearchState(searchTearm: '');
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [searchTearm];

  TodoSearchState copyWith({String? searchTerm}){
    return TodoSearchState(searchTearm: searchTearm ?? this.searchTearm);
  }
}

class TodoSearch with ChangeNotifier{
  TodoSearchState _state = TodoSearchState.initial();
  TodoSearchState get state => _state;

  void setSearchTerm(String newSearchTerm){
    _state = _state.copyWith(searchTerm: newSearchTerm);
    notifyListeners();
  }
}