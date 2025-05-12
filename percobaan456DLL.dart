import 'dart:io';
class Dnode<T>{
  T nodeValue;
  Dnode? prev;
  Dnode? next;

  Dnode(this.nodeValue) : next = null, prev = null;
}

class DLinkedList<T>{
  Dnode<T>? head;

  bool isEmpty() {
    return head == null;
  }

  void append(T data) {
    Dnode<T> newNode = Dnode<T>(data);
    head = newNode;
  }
  
  void printList(Dnode? node) {
    Dnode? tail;
    tail = null;
    print("Traversal in Forward Direction: ");
    while (node != null) {
      stdout.write("${node.nodeValue} ");
      tail = node;
      node = node.next;
    }
    print("");
    print("Traversal in Reverse Direction: ");
    while (tail != null) {
      stdout.write("${tail.nodeValue} ");
      tail = tail.prev;
    }
    print("");
  }

  // Menambahkan data sebelum head
  void InsertBeforeHead(T data) {
    Dnode newNode = Dnode(data);
    if (isEmpty()) {
      append(data);
    } else {
      newNode.next = head;
      head!.prev = newNode;
    }
  }

  // menambahkan data baru atau di akhir node
  void InsertTailNode(T data) {
    Dnode newNode = Dnode(data);
    if (isEmpty()) {
      append(data);
    } else {
      Dnode? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
      newNode.prev = temp;
    }
  }
}
void main(){
  DLinkedList<int> D = DLinkedList<int>();

  print('DATA \noperasi insert before head:');
  D.InsertBeforeHead(10);
  D.InsertBeforeHead(15);
  D.InsertBeforeHead(30);
  D.InsertBeforeHead(50);
  D.printList(D.head);
  print('\noperasi insert tail node:');
  D.InsertTailNode(1);
  D.InsertTailNode(2);
  D.printList(D.head);
}