
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_provider/providers/todo_list.dart';

import '../models/todo_model.dart';

class ActiveTodoCountState extends Equatable{
  final int activeTodoCount;

  ActiveTodoCountState({required this.activeTodoCount});

  factory ActiveTodoCountState.initial(){
    return ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [activeTodoCount];

  ActiveTodoCountState copyWith({int? activeTodoCount,}){
    return ActiveTodoCountState(activeTodoCount: activeTodoCount ?? this.activeTodoCount);
  }
}

class ActiveTodoCount with ChangeNotifier{
  ActiveTodoCountState _state = ActiveTodoCountState.initial();
  ActiveTodoCountState get state => _state;

  void update(TodoList todoList){
    final int newActiveTodoCount =  todoList.state.todos
        .where((Todo todo) => !todo.completed)
        .toList()
        .length;

    _state = _state.copyWith(activeTodoCount: newActiveTodoCount);
    notifyListeners();
  }
}