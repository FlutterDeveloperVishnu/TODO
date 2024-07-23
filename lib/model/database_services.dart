import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/model/todo_model.dart';

class DatabaseServices {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('ToDos');

  User? user = FirebaseAuth.instance.currentUser;

  // Add ToDo Task
  Future<DocumentReference> addToDoTasks(String title, String description) {
    return todoCollection.add({
      'uid': user!.uid,
      'title': title,
      'description': description,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // Update Todo Collections
  Future<void> updateTodo(String id, String title, String description) async {
    final updateTodoCollections =
        FirebaseFirestore.instance.collection('ToDos').doc(id);
    return await updateTodoCollections.update({
      'title': title,
      'description': description,
    });
  }

  // Update ToDo Tasks
  Future<void> updateTodoTask(String id, bool completed) async {
    return await todoCollection.doc(id).update({'completed': completed});
  }

  // Update ToDo Tasks
  Future<void> deleteTodo(String id) async {
    return await todoCollection.doc(id).delete();
  }

  // get pending Task
  Stream<List<Todo>> get todos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(_todoListFromSnapshot);
  }

  // get completed Task
  Stream<List<Todo>> get completedtodos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(_todoListFromSnapshot);
  }

  List<Todo> _todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Todo(
        id: doc.id,
        title: doc['title'] ?? '',
        description: doc['description'],
        completed: doc['completed'] ?? false,
        timeStamp: doc['createdAt'] ?? '',
      );
    }).toList();
  }
}
