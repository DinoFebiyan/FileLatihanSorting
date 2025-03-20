import 'dart:io'; // Import library untuk input/output

void main() {
  // Membuat list dengan 100 angka acak
  List<int> data = List<int>.generate(100, (index)=>(index + 1)); //generate untuk membuat list dengan 100 angka, index+1 untuk membuat angka dari 1-100
  data.shuffle(); //mengacak angka
  
  // Menampilkan menu pilihan algoritma sorting
  print('ALGORITMA SORTING');//judul
  print('1. Insertion');//sortir dengan insertion
  print('2. Selection');//sortir dengan selection
  print('3. Bubble');//sortir dengan bubble
  print('4. Shell');//sortir dengan shell
  print('5. Quick');//sortir dengan quick
  print('6. Merge');//sortir dengan merge
  stdout.write('Pilihan : '); // Meminta input dari pengguna
  int pilihan = int.parse(stdin.readLineSync()!); // Membaca input pilihan algoritma dari pengguna

  // Menampilkan menu pilihan urutan (ascending atau descending)
  print('\n1. Ascending');//\n digunakan untuk membuat baris baru
  print('2. Descending');
  stdout.write('Pilihan : ');//membaca input pilihan urutan dari pengguna
  int mode = int.parse(stdin.readLineSync()!); // Membaca input
  
  print('Data Sebelum Pengurutan: $data');//menampilkan data sebelum diurutkan)
  DateTime start = DateTime.now(); // Memulai penghitungan untuk mengukur waktu eksekusi

  // Switch case untuk memilih algoritma sorting berdasarkan input pengguna
  // Saua menggunakan swift case karena meminta pilihan input dari pengguna berdasarkan pilihan yang berbeda
  // Data pada case 1,2,3,4,5,6 adalah algoritma sorting yang akan digunakan yang diperoleh dari pengacakan angka sebelumya
  switch (pilihan) {
    case 1:
      insertionSort(data, mode == 1); // Memanggil fungsi insertionSort, mode == 1 digunakan untuk menentukan urutan ascending atau descending. misal mode == 1 maka akan ascending sedangkan jika ordwr != 1 maka akan descending
      break;//menghentikan switch case
    case 2:
      selectionSort(data, mode == 1); // Memanggil fungsi selectionSort
      break;
    case 3:
      bubbleSort(data, mode == 1); // Memanggil fungsi bubbleSort
      break;
    case 4:
      shellSort(data, mode == 1); // Memanggil fungsi shellSort
      break;
    case 5:
      quickSort(data, 0, data.length - 1, mode == 1); // Memanggil fungsi quickSort, 0 dan numbers.length - 1 digunakan untuk menentukan elemen pertama dan elemen terakhir dalam array yang akan diurutkan. karena sorting menggunakan quick sort
      break;
    case 6:
      mergeSort(data, 0, data.length - 1, mode == 1); // Memanggil fungsi mergeSort, 0 dan numbers.length - 1 digunakan untuk menentukan elemen pertama dan elemen terakhir dalam array yang akan diurutkan. karena sorting menggunakan merge sort
      break;
  }

  Duration elapsedTime = DateTime.now().difference(start); // Menghentikan penghitungan waktu eksekusi
  print('data setelah diurutkan menggunakan $pilihan : $data'); // Menampilkan hasil pengurutan
  print('Waktu: ${elapsedTime.inMilliseconds} ms'); // Menampilkan waktu eksekusi dalam milidetik
}

// Fungsi fungsi insertionSort, selectionSort, bubbleSort, shellSort, quickSort, dan mergeSort
// Fungsi insertionSort untuk mengurutkan list menggunakan algoritma Insertion Sort
void insertionSort(List<int> arr, bool ascending) {
  for (int i = 1; i < arr.length; i++) { // Memulai perulangan dari elemen kedua hingga elemen terakhir
    int key = arr[i]; // Menyimpan elemen yang akan dipindahkan
    int j = i - 1; // Menyimpan indeks j yaitu elemen sebelum elemen yang akan dipindahkan
    if (ascending) { // pilihan berdasarkan mode == 1 yaituu ascending
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
    int indeks = i; // Menyimpan indeks elemen terkecil/terbesar
    for (int j = i + 1; j < arr.length; j++) {
      if (ascending) {
        // Jika ascending, cari elemen terkecil
        if (arr[j] < arr[indeks]) indeks = j;
      } else {
        // Jika descending, cari elemen terbesar
        if (arr[j] > arr[indeks]) indeks = j;
      }
    }
    // Tukar elemen terkecil/terbesar dengan elemen pada posisi i
    int temp = arr[i];
    arr[i] = arr[indeks];
    arr[indeks] = temp;
  }
}

// Fungsi bubbleSort untuk mengurutkan list menggunakan algoritma Bubble Sort
void bubbleSort(List<int> arr, bool ascending) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) { // Perulangan untuk membandingkan elemen-elemen dalam array
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
  for (int gap = arr.length ~/ 2; gap > 0; gap ~/= 2) { // Menentukan gap, dimulai dari setengah panjang array
    for (int i = gap; i < arr.length; i++) {
      int temp = arr[i]; // Menyimpan elemen yang akan dipindahkan
      int j;
      if (ascending) {
        // Jika ascending, geser elemen yang lebih besar dari temp ke kanan
        for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) { // Menggeser elemen-elemen yang lebih besar dari temp ke kanan
          arr[j] = arr[j - gap];
        }
      } else {
        // Jika descending, geser elemen yang lebih kecil dari temp ke kanan
        for (j = i; j >= gap && arr[j - gap] < temp; j -= gap) { // Menggeser elemen-elemen yang lebih kecil dari temp ke kanan
          arr[j] = arr[j - gap];
        }
      }
      arr[j] = temp; // Menempatkan temp pada posisi yang benar
    }
  }
}

// Fungsi quickSort untuk mengurutkan list menggunakan algoritma Quick Sort
void quickSort(List<int> arr, int left, int right, bool ascending) {
  if (left < right) {
    int pi = partition(arr, left, right, ascending); // Partisi array
    quickSort(arr, left, pi - 1, ascending); // Rekursif pada bagian kiri
    quickSort(arr, pi + 1, right, ascending); // Rekursif pada bagian kanan
  }
}

// Fungsi partition untuk membagi array dalam Quick Sort
int partition(List<int> arr, int left, int right, bool ascending) {
  int pivot = arr[right]; // Pilih pivot dari elemen terakhir
  int i = left - 1; // Indeks untuk elemen yang lebih kecil dari pivot
  
  for (int j = left; j < right; j++) {
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
  swap(arr, i + 1, right); // Pindahkan pivot ke posisi yang benar
  return i + 1; // Kembalikan indeks pivot
}

// Fungsi mergeSort untuk mengurutkan list menggunakan algoritma Merge Sort
void mergeSort(List<int> arr, int left, int right, bool ascending) {
  if (left < right) {
    int middle = (left + right) ~/ 2; // menentuksn nilai tengah, ~/ untuk membulatkan ke bawah dan /2 untuk membagi
    mergeSort(arr, left, middle, ascending); // perulangan untuk bagian kiri
    mergeSort(arr, middle + 1, right, ascending); // perulangan untuk bagian kanan
    merge(arr, left, middle, right, ascending); // menggabungkan kedua bagian kembali
  }
}

// Fungsi merge untuk menggabungkan dua bagian dalam Merge Sort
void merge(List<int> arr, int left, int middle, int right, bool ascending) {
  int n1 = middle - left + 1; // Ukuran bagian kiri
  int n2 = right - middle; // Ukuran bagian kanan
  
  List<int> L = List<int>.filled(n1, 0); // membuat array untuk bagian kiri
  List<int> R = List<int>.filled(n2, 0); // membuat array untuk bagian kanan
  
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
