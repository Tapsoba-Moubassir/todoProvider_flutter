
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoListState extends Equatable{
  final List<Todo> todos;

  TodoListState({required this.todos});

  factory TodoListState.initial(){
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Nettoyer la chambre'),
      Todo(id: '2', desc: 'Laver les plats'),
      Todo(id: '1', desc: 'Faire ses exercices'),
    ]);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [todos];

  TodoListState copyWith({List<Todo>? todos}){
    return TodoListState(todos: todos ?? this.todos);
  }
}

class TodoList with ChangeNotifier{

  TodoListState _state = TodoListState.initial();
  TodoListState get state => _state;

  void addTodo(String todoDesc){
    final newTodo = Todo(desc: todoDesc);
    final newTodos = [..._state.todos, newTodo];

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void editTodo(String id, String todoDesc){
    final newTodos = _state.todos.map((Todo todo) {
      if(todo.id == id){
        return Todo(
          id: id,
          desc: todoDesc,
          completed: todo.completed
        );
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void toogleTodo(String id){
    final newTodos = _state.todos.map((Todo todo) {
      if(todo.id == id){
        return Todo(
          id: id,
          desc: todo.desc,
          completed: !todo.completed
        );
      }
      return todo;
    }).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }

  void removeTodo(Todo todo){
    final newTodos = _state.todos.where((Todo t) => t.id != todo.id).toList();

    _state = _state.copyWith(todos: newTodos);
    notifyListeners();
  }
}