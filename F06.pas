program F06; // Pengembalian Buku
uses sysutils;
//Kamus Global

const
    nmax = 100;

type
    History_Pengembalian = record
    username : string;
    id_buku : integer;
    Tanggal_Pengembalian : tanggal;
    end;

    tanggal = record
        dd, mm, yyyy : integer;
    end;

    history_peminjaman = record
        username : string;
        id_buku : integer;
        tanggal_peminjaman : tanggal;
        tanggal_batas_pengembalian : tanggal;
        status_pengembalian : boolean;
    end;

    d1 = record
    arr : array[1..nmax] of history_peminjaman;
    neff : integer;
    end;

    d3 = record
        arr : array [1..nmax] of history_pengembalian;
        neff : integer;
    end;


var
    data1 : d1;
    data3 : d3;

//Prosedurnya

procedure kembali_buku;
//Kamus Lokal
var
    stock, i, temp_id, ec, temp_dd, temp_mm, temp_yyyy: integer;
    found : boolean;
    temp_tanggal, judul_buku : string;

//Algoritma
begin

write('Masukan id buku yang ingin dikembalikan: ');
readln(temp_id);

i := 1;
found := false;
writeln('Data Peminjaman');
//Mencari data di history_peminjaman.csv
while not(found) and (i <= data1.neff) do
    begin
    if data1.arr[i].id_buku = temp_id and data1.arr[i].username = user_id then
        begin
        found := true;
        writeln('Username : ',data1.arr[i].jumlah_buku;
        judul_buku := data1.arr[i].judul_buku;
        end
    else i += 1;
    end;
