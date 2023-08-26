# Project 2 - Membuat Data Warehouse Untuk Kebutuhan Salah Satu Client Company
Salah satu client dari sebuah perusahaan yang bergerak di bidang e-commerce memiliki kebutuhan untuk membuat sebuah Data Warehouse yang berasal dari beberapa tabel dari database sumber. Data Warehouse ini nantinya terdiri dari satu tabel Fact dan beberapa tabel Dimension. 

Sebagai Data Engineer, ada beberapa task yang perlu dilakukan yaitu : 
1. Melakukan Import/Restore Database Staging.
2. Membuat sebuah Database bernama DWH_Project, serta membuat Tabel Fact dan  Dimension dari tabel yang ada di database Staging.
3. Membuat Job ETL di aplikasi talend untuk memindahkan data dari Staging ke Data  Warehouse. (Khusus untuk Tabel DimCustomer, lakukan transformasi data dengan merubah data dari kolom FirstName dan LastName menjadi huruf kapital semua, lalu gabungkan kedua kolom tersebut menjadi satu kolom yang bernama CustomerName.)
4. Membuat Store Procedure (SP) untuk menampilkan summary sales order berdasarkan status pengiriman.
