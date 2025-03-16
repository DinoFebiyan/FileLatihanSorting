import 'dart:io';

// Fungsi untuk mengurutkan list secara ascending (dari kecil ke besar)
// Menggunakan generic type T yang extends Comparable untuk memastikan elemen dapat dibandingkan
void shellSortAscending<T extends Comparable<T>>(List<T> arr) {
  int i, jarak;
  bool didSwap = true; // Penanda apakah terjadi pertukaran
  T temp;
  jarak = arr.length; // Inisialisasi jarak dengan panjang array
  
  while (jarak > 1) {
    // Mengurangi jarak dengan membagi 2 dan dibulatkan ke bawah
    jarak = (jarak / 2).floor();
    didSwap = true;
    
    while (didSwap) {
      didSwap = false;
      i = 0;
      while (i < (arr.length - jarak)) {
        // Membandingkan elemen dengan jarak tertentu
        // Jika elemen kiri lebih besar dari elemen kanan, tukar posisinya
        if (arr[i].compareTo(arr[i + jarak]) > 0) {
          temp = arr[i];
          arr[i] = arr[i + jarak];
          arr[i + jarak] = temp;
          didSwap = true; // Menandai bahwa terjadi pertukaran
        }
        i++;
      }
    }
  }
}

// Fungsi untuk mengurutkan list secara descending (dari besar ke kecil)
// Menggunakan generic type T yang extends Comparable untuk memastikan elemen dapat dibandingkan
void shellSortDescending<T extends Comparable<T>>(List<T> arr) {
  int i, jarak;
  bool didSwap = true; // Penanda apakah terjadi pertukaran
  T temp;
  jarak = arr.length; // Inisialisasi jarak dengan panjang array
  
  while (jarak > 1) {
    // Mengurangi jarak dengan membagi 2 dan dibulatkan ke bawah
    jarak = (jarak / 2).floor();
    didSwap = true;
    
    while (didSwap) {
      didSwap = false;
      i = 0;
      while (i < (arr.length - jarak)) {
        // Membandingkan elemen dengan jarak tertentu
        // Jika elemen kiri lebih kecil dari elemen kanan, maka tukar posisinya
        if (arr[i].compareTo(arr[i + jarak]) < 0) {
          temp = arr[i];
          arr[i] = arr[i + jarak];
          arr[i + jarak] = temp;
          didSwap = true; // Menandai bahwa terjadi pertukaran
        }
        i++;
      }
    }
  }
}

// Fungsi untuk menampilkan isi list
// Menggunakan generic type T agar dapat menampilkan berbagai tipe data
void display<T>(List<T> data) {
  for (T objek in data) {
    stdout.write('$objek '); // Menampilkan setiap elemen diikuti spasi
  }
  print(''); // Membuat baris baru setelah menampilkan semua elemen
}

void main() {
  // Meminta input dari user untuk memilih mode pengurutan (1 = Ascending, 2 = Descending)
  stdout.write('Pilih mode yang dipilih(1 = Ascending, 2 = Descending): ');
  String? input = stdin.readLineSync(); // Membaca input dari keyboard
  int mode = int.parse(input ?? '1'); // Mengkonversi input string ke integer, default 1 jika null
  
  // Membuat list dengan 10 angka genap (2,4,6,8,10,12,14,16,18,20) kemudian diacak
  List<num> data = List<num>.generate(10, (index) => (index + 1) * 2);
  data.shuffle(); // Mengacak urutan elemen dalam list
  
  // Menampilkan data sebelum diurutkan
  print('Data Sebelum Pengurutan:');
  display(data);

  // Mencatat waktu saat program memulai pengurutan
  DateTime start = DateTime.now();
  
  // Melakukan pengurutan berdasarkan mode yang dipilih
  if (mode == 1) {
    shellSortAscending(data); // Mengurutkan secara ascending
  } else {
    shellSortDescending(data); // Mengurutkan secara descending
  }
  
  // Menghitung waktu yang dibutuhkan untuk pengurutan
  Duration elapsedTime = DateTime.now().difference(start);
  
  // Menampilkan data setelah diurutkan
  print('Data Setelah Pengurutan:');
  display(data);
  
  // Menampilkan waktu yang dibutuhkan dalam millisecond
  print('Waktu: ${elapsedTime.inMilliseconds} ms');
}