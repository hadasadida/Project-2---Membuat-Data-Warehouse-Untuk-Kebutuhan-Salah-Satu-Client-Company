# Project 2 - Membuat Data Warehouse Untuk Kebutuhan Salah Satu Client Company
Salah satu client dari sebuah perusahaan yang bergerak di bidang e-commerce memiliki kebutuhan untuk membuat sebuah Data Warehouse yang berasal dari beberapa tabel dari database sumber. Data Warehouse ini nantinya terdiri dari satu tabel Fact dan beberapa tabel Dimension. 

Sebagai Data Engineer, ada beberapa task yang perlu dilakukan yaitu : 
1. Melakukan Import/Restore Database Staging.
2. Membuat sebuah Database bernama DWH_Project, serta membuat Tabel Fact dan  Dimension dari tabel yang ada di database Staging.
3. Membuat Job ETL di aplikasi talend untuk memindahkan data dari Staging ke Data  Warehouse. (Khusus untuk Tabel DimCustomer, lakukan transformasi data dengan merubah data dari kolom FirstName dan LastName menjadi huruf kapital semua, lalu gabungkan kedua kolom tersebut menjadi satu kolom yang bernama CustomerName.)
4. Membuat Store Procedure (SP) untuk menampilkan summary sales order berdasarkan status pengiriman.

## Result
## Task 1 Melakukan Import/Restore Database Staging
Melakukan restore database Staging.bak, sehingga muncul 4 tabel seperti gambar dibawah.

![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/e73ba282-7c93-4bc5-b757-7b58dabe759c)

## Task 2 Membuat sebuah Database bernama DWH_Project, serta membuat Tabel Fact dan  Dimension dari tabel yang ada di database Staging
Membuat database yang diberi nama DWH_Project, kemudian membuat table fact dan dimension beserta masing-masing primary key dan foreign key. Berdasarkan gambar dibawah, Pada table FactSalesOrder kolom OrderID merupakan primary key dan CustomerID dan StatusID merupakan foreign key. 

![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/f4ebd866-5506-4796-ad3d-e46b0e7cfb32)

## Task 3  Membuat Job ETL di aplikasi talend untuk memindahkan data dari Staging ke Data  Warehouse
Membuat empat job untuk menarik data dari database staging ke database DWH_Project yaitu DimCustomer, DimProduct, DimStatusOrder dan FactSalesOrder. 
Sebelumnya perlu dilakukan konfigurasi metadata untuk menyimpan koneksi database sehingga tidak perlu input informasi kemlagi ketika membuat job. Lakukan pada kedua database yaitu staging dan DWH_Project.

![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/f94e9b39-405a-458c-91f6-386c90cb5660)

Selanjutnya adalah membuat job. Untuk job DimCustomer karena terdapat transformasi data yaitu menggabungkan kolom first_name dan last_name, maka menggunakan
komponen tMap sebelum load data ke target. Klik pada Map Editor untuk melakukan konfigurasi pada komponen tMap.

![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/d68091f5-8002-4300-8715-20e0eaed00a0)

Berikut untuk melakukan konfigurasi pada tMap.

![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/c8e6cbe4-df49-4dbd-bab9-abcf0f6663f4)

Job DimCustomer berhasil dirunning.

![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/46d40f58-7a82-4c1e-b290-66cc8643822f)
![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/bde511d6-f08c-418c-af74-9776140ab1e5)

Untuk Job DimProduct, DimStatusOrder, dan FactSalesOrder, karena hanya memindahkan data saja tanpa terdapat transformasi data atau penambahan kolom, maka dapat menggunakan
komponen tDBInput dan tDBOutput saja (tanpa tMap). Berikut tampilan Job FactSalesOrder.

![image](https://github.com/hadasadida/Project-2---Membuat-Data-Warehouse-Untuk-Kebutuhan-Salah-Satu-Client-Company/assets/124650679/cc522c4e-f7cb-40fc-86e8-153f915ad85b)

## Task 4 Membuat Store Procedure (SP) untuk menampilkan summary sales order berdasarkan status pengiriman
