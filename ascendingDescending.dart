import 'dart:io';

// Dibawah ini adalah fungsi untuk mengurutkan angka dari bilangan terkecil ke terbesar dengan menggunakan metode shell sort
// Cara kerjanya mirip seperti bubble sort tetapi memakai jarak
void shellSortAscending(List<int> arr) {
  int i, jarak; // i adalah index, jarak untuk menentukan besaran jarak(misal jaraknya adalah setengah dari panjang array)
  bool didSwap =//boolean untuk mengecek apakah ada yang ditukar atau tidak
      true; // bagian ini untuk mengecek apakah masih ada yang ditukar atau tidak
  int temp; // variabel sementara untuk menukar nilai
  jarak = arr.length; // awalnya jarak sama dengan panjang array

  while (jarak > 1) {
    // selama jarak masih lebih dari 1
    jarak = (jarak ~/ 2); // jaraknya dibagi 2 (pakai ~/ agar hasilnya bulat)
    didSwap = true; // reset flag ditukar jadi true

    while (didSwap) {
      // jika masih ada yang dituker
      didSwap = false; // reset flag jadi false terlebih dahulu
      i = 0; // mulai dari index 0
      while (i < (arr.length - jarak)) {
        // loop sampe akhir array - jarak
        if (arr[i] > arr[i + jarak]) {
          // jika nilai sekarang lebih besar dari nilai+jarak
          temp = arr[i]; // tuker posisinya pakai variabel temp
          arr[i] = arr[i + jarak];
          arr[i + jarak] = temp;
          didSwap = true; // bagian ini memberi tahu kalau ada yang ditukar
        }
        i++; // perulangan proses ke index berikutnya
      }
    }
  }
}

// Ini fungsi untuk mengurutkan angka dari besar ke kecil
// Sama seperti yang ascending, cuma beda di tanda perbandingannya
void shellSortDescending(List<int> arr) {
  int i, jarak;
  bool didSwap = true;
  int temp;
  jarak = arr.length;

  while (jarak > 1) {
    jarak = (jarak ~/ 2);
    didSwap = true;

    while (didSwap) {
      didSwap = false;
      i = 0;
      while (i < (arr.length - jarak)) {
        if (arr[i] < arr[i + jarak]) {
          // perbedaannya di sini, memakai < bukan >
          temp = arr[i];
          arr[i] = arr[i + jarak];
          arr[i + jarak] = temp;
          didSwap = true;
        }
        i++;
      }
    }
  }
}

// Fungsi untuk menampilkan isi array
void display(List<int> data) {
  for (int objek in data) {
    // loop setiap angka di array
    stdout.write('$objek '); // print angka dengan dengan ditamabh spasi
  }
  print(''); // membuat baris baru
}

void main() {
  // Meminta user memilih ascending atau descending
  stdout.write('Pilih mode yang dipilih(1 = Ascending, 2 = Descending): ');
  String? input = stdin.readLineSync(); // membaca input dari keyboard
  int mode =
      int.parse(input ?? '1'); // Mengubah string menjadi angka, kalo null pake 1

  // membuat array dengan 100 angka lalu mengacaknya
  List<int> data = List<int>.generate(100, (index) => (index + 1));
  data.shuffle();//menacakk array

  // Print array sebelum diurutkan
  print('Data Sebelum Pengurutan:');
  display(data);

  // mencatat waktu mulai
  DateTime start = DateTime.now();

  // memanggil fungsi sort sesuai mode yang dipilih
  if (mode == 1) {
    shellSortAscending(data);
  } else {
    shellSortDescending(data);
  }

  // menghitung berapa lama prosesnya
  Duration elapsedTime = DateTime.now().difference(start);

  // Print hasil pengurutan
  print('Data Setelah Pengurutan:');
  display(data);

  // Print berapa lama waktunya dalam millisecond
  print('Waktu: ${elapsedTime.inMilliseconds} ms');
}
