import 'dart:io';
class Dnode<T> {
  T? nodeValue;
  Dnode<T>? next;
  Dnode<T>? prev;

  Dnode() {
    nodeValue = null;
    next = this;
    prev = this;
  }

  Dnode.withvalue(T item) {
    nodeValue = item;
    next = null;
    prev = null;
  }
}

class DLinkedList<T> {
  Dnode<T>? head;

  bool isEmpty() {
    return head == null;
  }

  void DinsertFront(T data) {
    Dnode<T> baru = Dnode<T>.withvalue(data);
    if (isEmpty()) {
      head = baru;
      head!.next = null;
      head!.prev = null;
    } else {
      baru.next = head;
      head!.prev = baru;
      head = baru;
    }
  }

  void DeleteFront() {
    if (!isEmpty()) {
      if (head!.next != null) {
        Dnode? delete = head;
        head = head!.next;
        head!.prev = null;
        delete!.next = null;
      } else {
        head = null;
      }
    }
  }

  void DeleteEnd() {
    Dnode<T>? temp;
    if (!isEmpty()) {
      if (head!.next != null) {
        temp = head;
        while (temp!.next!.next != null) {
          temp = temp.next;
        }
        temp.next!.prev = null;
        temp.next = null;
      } else {
        head = null;
      }
    }
  }



  void hasil() {
    Dnode<T>? tail;
    Dnode<T>? node = head;
    tail = null;

    if (isEmpty()) {
      print("linked list kosong.");
      return;
    }
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
}
void main() {
  DLinkedList<int> D = DLinkedList<int>();
  print('DATA \ndata sebelum penghapusan:');
  D.DinsertFront(10);
  D.DinsertFront(20);
  D.DinsertFront(30);
  D.DinsertFront(50);
  D.hasil();
  print('\npenghapusan node depan:');
  D.DeleteFront();
  D.hasil();
  print('\npenghapusan node belakang:');
  D.DeleteEnd();
  D.hasil();
}