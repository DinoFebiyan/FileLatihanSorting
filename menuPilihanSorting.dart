import 'dart:io'; // Import library untuk input/output
import 'dart:math'; // Import library untuk fungsi matematika, seperti Random

void main() {
  // Membuat list dengan 100 angka acak antara 0 dan 999
  List<int> numbers = List.generate(100, (index) => Random().nextInt(1000));
  
  // Menampilkan menu pilihan algoritma sorting
  print('ALGORITMA SORTING');
  print('1. Insertion');
  print('2. Selection');
  print('3. Bubble');
  print('4. Shell');
  print('5. Quick');
  print('6. Merge');
  stdout.write('Pilihan : '); // Meminta input dari pengguna
  int choice = int.parse(stdin.readLineSync()!); // Membaca input pilihan algoritma

  // Menampilkan menu pilihan urutan (ascending atau descending)
  print('\n1. Ascending');
  print('2. Descending');
  stdout.write('Pilihan : ');
  int order = int.parse(stdin.readLineSync()!); // Membaca input urutan

  Stopwatch stopwatch = Stopwatch()..start(); // Memulai stopwatch untuk mengukur waktu eksekusi

  // Switch case untuk memilih algoritma sorting berdasarkan input pengguna
  switch (choice) {
    case 1:
      insertionSort(numbers, order == 1); // Memanggil fungsi insertionSort
      break;
    case 2:
      selectionSort(numbers, order == 1); // Memanggil fungsi selectionSort
      break;
    case 3:
      bubbleSort(numbers, order == 1); // Memanggil fungsi bubbleSort
      break;
    case 4:
      shellSort(numbers, order == 1); // Memanggil fungsi shellSort
      break;
    case 5:
      quickSort(numbers, 0, numbers.length - 1, order == 1); // Memanggil fungsi quickSort
      break;
    case 6:
      mergeSort(numbers, 0, numbers.length - 1, order == 1); // Memanggil fungsi mergeSort
      break;
  }

  stopwatch.stop(); // Menghentikan stopwatch
  print('Waktu : ${stopwatch.elapsedMilliseconds} ms'); // Menampilkan waktu eksekusi
  print('Hasil : $numbers'); // Menampilkan hasil pengurutan
}

// Fungsi insertionSort untuk mengurutkan list menggunakan algoritma Insertion Sort
void insertionSort(List<int> arr, bool ascending) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i]; // Menyimpan elemen yang akan dipindahkan
    int j = i - 1;
    if (ascending) {
      // Jika ascending, geser elemen yang lebih besar dari key ke kanan
      while (j >= 0 && arr[j] > key) {
        arr[j + 1] = arr[j];
        j--;
      }
    } else {
      // Jika descending, geser elemen yang lebih kecil dari key ke kanan
      while (j >= 0 && arr[j] < key) {
        arr[j + 1] = arr[j];
        j--;
      }
    }
    arr[j + 1] = key; // Menempatkan key pada posisi yang benar
  }
}

// Fungsi selectionSort untuk mengurutkan list menggunakan algoritma Selection Sort
void selectionSort(List<int> arr, bool ascending) {
  for (int i = 0; i < arr.length - 1; i++) {
    int extremeIndex = i; // Menyimpan indeks elemen terkecil/terbesar
    for (int j = i + 1; j < arr.length; j++) {
      if (ascending) {
        // Jika ascending, cari elemen terkecil
        if (arr[j] < arr[extremeIndex]) extremeIndex = j;
      } else {
        // Jika descending, cari elemen terbesar
        if (arr[j] > arr[extremeIndex]) extremeIndex = j;
      }
    }
    // Tukar elemen terkecil/terbesar dengan elemen pada posisi i
    int temp = arr[i];
    arr[i] = arr[extremeIndex];
    arr[extremeIndex] = temp;
  }
}

// Fungsi bubbleSort untuk mengurutkan list menggunakan algoritma Bubble Sort
void bubbleSort(List<int> arr, bool ascending) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (ascending) {
        // Jika ascending, tukar jika elemen saat ini lebih besar dari elemen berikutnya
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      } else {
        // Jika descending, tukar jika elemen saat ini lebih kecil dari elemen berikutnya
        if (arr[j] < arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }
      }
    }
  }
}

// Fungsi shellSort untuk mengurutkan list menggunakan algoritma Shell Sort
void shellSort(List<int> arr, bool ascending) {
  for (int gap = arr.length ~/ 2; gap > 0; gap ~/= 2) { // Menentukan gap
    for (int i = gap; i < arr.length; i++) {
      int temp = arr[i]; // Menyimpan elemen yang akan dipindahkan
      int j;
      if (ascending) {
        // Jika ascending, geser elemen yang lebih besar dari temp ke kanan
        for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
          arr[j] = arr[j - gap];
        }
      } else {
        // Jika descending, geser elemen yang lebih kecil dari temp ke kanan
        for (j = i; j >= gap && arr[j - gap] < temp; j -= gap) {
          arr[j] = arr[j - gap];
        }
      }
      arr[j] = temp; // Menempatkan temp pada posisi yang benar
    }
  }
}

// Fungsi quickSort untuk mengurutkan list menggunakan algoritma Quick Sort
void quickSort(List<int> arr, int low, int high, bool ascending) {
  if (low < high) {
    int pi = partition(arr, low, high, ascending); // Partisi array
    quickSort(arr, low, pi - 1, ascending); // Rekursif pada bagian kiri
    quickSort(arr, pi + 1, high, ascending); // Rekursif pada bagian kanan
  }
}

// Fungsi partition untuk membagi array dalam Quick Sort
int partition(List<int> arr, int low, int high, bool ascending) {
  int pivot = arr[high]; // Pilih pivot sebagai elemen terakhir
  int i = low - 1; // Indeks untuk elemen yang lebih kecil dari pivot
  
  for (int j = low; j < high; j++) {
    if (ascending) {
      // Jika ascending, pindahkan elemen yang lebih kecil dari pivot ke kiri
      if (arr[j] <= pivot) {
        i++;
        swap(arr, i, j);
      }
    } else {
      // Jika descending, pindahkan elemen yang lebih besar dari pivot ke kiri
      if (arr[j] >= pivot) {
        i++;
        swap(arr, i, j);
      }
    }
  }
  swap(arr, i + 1, high); // Pindahkan pivot ke posisi yang benar
  return i + 1; // Kembalikan indeks pivot
}

// Fungsi mergeSort untuk mengurutkan list menggunakan algoritma Merge Sort
void mergeSort(List<int> arr, int left, int right, bool ascending) {
  if (left < right) {
    int middle = (left + right) ~/ 2; // Temukan titik tengah
    mergeSort(arr, left, middle, ascending); // Rekursif pada bagian kiri
    mergeSort(arr, middle + 1, right, ascending); // Rekursif pada bagian kanan
    merge(arr, left, middle, right, ascending); // Gabungkan dua bagian
  }
}

// Fungsi merge untuk menggabungkan dua bagian dalam Merge Sort
void merge(List<int> arr, int left, int middle, int right, bool ascending) {
  int n1 = middle - left + 1; // Ukuran bagian kiri
  int n2 = right - middle; // Ukuran bagian kanan
  
  List<int> L = List<int>.filled(n1, 0); // Buat array untuk bagian kiri
  List<int> R = List<int>.filled(n2, 0); // Buat array untuk bagian kanan
  
  for (int i = 0; i < n1; i++) L[i] = arr[left + i]; // Salin data ke bagian kiri
  for (int j = 0; j < n2; j++) R[j] = arr[middle + 1 + j]; // Salin data ke bagian kanan
  
  int i = 0, j = 0, k = left; // Indeks untuk bagian kiri, kanan, dan array utama
  
  while (i < n1 && j < n2) {
    if (ascending) {
      // Jika ascending, pilih elemen terkecil dari bagian kiri atau kanan
      if (L[i] <= R[j]) {
        arr[k] = L[i];
        i++;
      } else {
        arr[k] = R[j];
        j++;
      }
    } else {
      // Jika descending, pilih elemen terbesar dari bagian kiri atau kanan
      if (L[i] >= R[j]) {
        arr[k] = L[i];
        i++;
      } else {
        arr[k] = R[j];
        j++;
      }
    }
    k++;
  }
  
  // Salin sisa elemen dari bagian kiri jika ada
  while (i < n1) {
    arr[k] = L[i];
    i++;
    k++;
  }
  
  // Salin sisa elemen dari bagian kanan jika ada
  while (j < n2) {
    arr[k] = R[j];
    j++;
    k++;
  }
}

// Fungsi swap untuk menukar dua elemen dalam array
void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}