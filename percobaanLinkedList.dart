import 'dart:io';
class Node {
  int nodeValue;
  Node? next;
  
  Node(this.nodeValue) : next = null;
}

class SingleLinkedList {
  Node? head = null;
  
  bool isEmpty() {
    return head == null;
  }
  
  void InsertFront(int data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  void InsertBack(int data) {
    Node newNode = Node(data);
    if (isEmpty()) {
      head = newNode;
    } else {
      Node? temp = head;
      while (temp!.next != null) {
        temp = temp.next;
      }
      temp.next = newNode;
    }
  }

  void InsertAfter(Node prevNode, int newData) {
    if (prevNode == isEmpty()) {
      print("Node sebelumnya yang diberikan tidak boleh null");
    }
    Node newNode = Node(newData);
    newNode.next = prevNode.next;
    prevNode.next = newNode;
  }

  void deleteFront() {
    if (!isEmpty()) {
      if (head!.next != null) {
        head = head!.next;
      } else {
        head = null;
      }
    }
  }

  void deleteEnd() {
    if (!isEmpty()) {
      if (head!.next != null) {
        Node? bantu = head;
        while (bantu!.next!.next != null) {
          bantu = bantu.next;
        }
        bantu.next = null;
      } else {
        head = null;
      }
    }
  }

  void deleteMiddle(int cari) {
    if (!isEmpty()) {
      if (head!.next != null) {
        Node? bantu = head;
        while (bantu!.next!.nodeValue != cari) {
          bantu = bantu.next;
        }
        Node? hapus = bantu.next;
        bantu.next = hapus!.next;
        hapus.next = null;
      } else {
        head = null;
      }
    }
  }

  void PrintList() {
    if (!isEmpty()) {
      Node? now = head;
      while (now != null) {
        stdout.write('${now.nodeValue} ');
        now = now.next;
      }
    } else {
      print('Linked List dalam kondisi kosong');
    }
  }
}
void main() {
  SingleLinkedList L = SingleLinkedList();
  print("Data:");
  L.InsertFront(10);
  L.InsertFront(30);
  print("\nOperasi Insertion Front:");
  L.PrintList();
  L.InsertBack(5);
  print("\nOperasi Insertion Back:");
  L.PrintList();
  print("\nInsert After Data: ");
  L.InsertAfter(L.head!.next!.next!, 20);
  L.PrintList();
  print("\nDelete data:");

  L.deleteEnd();
  L.deleteMiddle(5);
  L.PrintList();
}