import 'dart:io';
class Node<T> {
  T? nodeValue;
  Node<T>? next;

  // Konstruktor default
  Node() {
    nodeValue = null;
    next = null;
  }

  // Konstruktor dengan inisialisasi nilai
  Node.withvalue(T item) {
    nodeValue = item;
    next = null;
  }
}

class SingleLinkedList<T> {
  Node<T>? head;

  SingleLinkedList() {
    head = null;
  }

  bool isEmpty() {
    return head == null;
  }

  void insertFront(T item) {
    Node<T> newNode = Node<T>.withvalue(item);
    if (isEmpty()) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode; 
    }
  }

  void insertBack(T item) {
    Node<T> newNode = Node<T>.withvalue(item);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node<T>? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newNode;
    }
  }

  void deleteNode(T item) {
    if (isEmpty()) {
      print("tidak bisa menghapus, linked list dalam keadaan kosong.");
      return;
    }

    if (head?.nodeValue == item) {
      head = head?.next;
      return;
    }

    Node<T>? current = head;
    Node<T>? prev = null;

    while (current != null && current.nodeValue != item) {
      prev = current;
      current = current.next;
    }

    if (current == null) {
      print("data tidak ada dalam liked list");
      return;
    }
    prev?.next = current.next;
  }

  void Hasil() {
    if (isEmpty()) {
      print("linked list kosong.");
      return;
    }

    Node<T>? current = head;
    while (current != null) {
      stdout.write('${current.nodeValue} ');
      current = current.next;
    }
  }
}
void main() {
  SingleLinkedList<int> L = SingleLinkedList<int>();
  print('DATA \noperasi insertion front:');
  L.insertFront(10);
  L.insertFront(20);
  L.insertFront(15);
  L.Hasil();
  print('\noperasi insertion back:');
  L.insertBack(30);
  L.Hasil();
  print('\noperasi delete value node:');
  L.deleteNode(10);
  L.Hasil();
}