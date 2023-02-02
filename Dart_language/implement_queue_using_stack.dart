// ignore_for_file: unused_local_variable

class MyQueue {
  List<int> data = [];

  MyQueue();

  void push(int x) {
    data.add(x);
  }

  int pop() {
    int deleteData = data[0];
    data.remove(data[0]);

    return deleteData;
  }

  int peek() {
    return data[0];
  }

  bool empty() {
    return data.isEmpty;
  }
}

void main(List<String> args) {
  final objQueue = MyQueue();
  objQueue.push(1);
  int param2 = objQueue.pop();
  int param3 = objQueue.peek();
  bool param4 = objQueue.empty();
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * MyQueue obj = MyQueue();
 * obj.push(x);
 * int param2 = obj.pop();
 * int param3 = obj.peek();
 * bool param4 = obj.empty();
 */