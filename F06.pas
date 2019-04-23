program F06; // Pengembalian Buku
uses sysutils;
//Kamus Global

const
    nmax = 100;

type
    user = record
        nama : string;
        alamat : string;
        username : string;
        password : string;
        role : string;
    end;

    tanggal = record
        dd, mm, yyyy : integer;
    end;

    buku = record
        id_buku: longint;
        judul_buku : string;
        author: string;
        kategori: string;
        tahun_terbit : integer;
        jumlah_buku : integer;
    end;


    history_pengembalian = record
        username : string;
        id_buku : integer;
        Tanggal_Pengembalian : tanggal;
    end;

    history_peminjaman = record
        username : string;
        id_buku : integer;
        tanggal_peminjaman : tanggal;
        tanggal_batas_pengembalian : tanggal;
        status_pengembalian : boolean;
    end;

    d1 = record
        arr : array[1..nmax] of buku;
        neff : integer;
    end;

    d3 = record
        arr : array[1..nmax] of history_peminjaman;
        neff : integer;
    end;

    d4 = record
        arr : array [1..nmax] of history_pengembalian;
        neff : integer;
    end;


var
    data1 : d1;
    data3 : d3;
    data4 : d4;
    current_user : user;

//Prosedurnya

procedure kembali_buku;
    //Kamus Lokal
    var
        stock, i, j, temp_id, ec, temp_dd, temp_mm, temp_yyyy: integer;
        found, found1 : boolean;
        temp_tanggal, judul_buku : string;

    //Algoritma
    begin

    write('Masukan id buku yang ingin dikembalikan: ');
    readln(temp_id);

    i := 1;
    j := 1;
    found := false;
    found1 := false;
    writeln('Data Peminjaman');
    //Mencari data di history_peminjaman.csv
    while not(found) and (i <= data3.neff) do
        begin
        if (data3.arr[i].id_buku = temp_id) and (data3.arr[i].username = current_user.username) then
            begin
            found := true;
            while not(found1) and (j <= data1.neff) do
                begin
                if temp_id = data1.arr[j].id_buku then
                    found1 := true
                else j += 1;
                end;
            end
        else i += 1;
        end;
    
    if not(found) then
        writeln('Anda tidak meminjam buku tersebut')
    else 
        begin
        data4.neff += 1;
        data4.arr[data4.neff].username := current_user.username;
        data4.arr[data4.neff].id_buku := temp_id;

        writeln('Data peminjaman:');
        writeln('Username :' + data3.arr[i].username);
        writeln('Judul buku: ' + data1.arr[j].judul_buku);
        writeln('Tanggal peminjaman: ' , data3.arr[i].tanggal_peminjaman.dd , '/' , data3.arr[i].tanggal_peminjaman.mm , '/' , data3.arr[i].tanggal_peminjaman.yyyy);
        writeln('Tanggal batas pengembalian: ' , data3.arr[i].tanggal_batas_pengembalian.dd , '/' , data3.arr[i].tanggal_batas_pengembalian.mm , '/' , data3.arr[i].tanggal_batas_pengembalian.yyyy);

        writeln('Masukan tanggal hari ini: ');
        readln(temp_tanggal)
        //fungsi telat belom
        end;
    end;

begin
end.


