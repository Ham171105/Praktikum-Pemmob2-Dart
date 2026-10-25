class Queue {
  List<int> _antrian = [];

  void enqueue(int data) {
    _antrian.add(data);
    print("$data berhasil ditambahkan ke antrian");
  }

  int? pop() {
    if (_antrian.isEmpty) {
      print("Antrian kosong!");
      return null;
    }
    int data = _antrian.removeAt(0);
    print("$data dihapus dari antrian");
    return data;
  }

  void cetakAntrian() {
    print("Isi antrian: $_antrian");
  }
}

void main() {
  Queue q = Queue();

  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);

  q.cetakAntrian();

  q.pop();

  q.cetakAntrian();
}