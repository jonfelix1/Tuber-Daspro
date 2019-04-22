program f07;

//Kamus Global

const
    nmax = 100;

type
    tanggal = record
        dd, mm, yyyy : integer;
    end;

    laporan_hilang = record
        username : string;
        id_buku_hilang : integer;
        tanggal_laporan : tanggal;
    end;

    list = record
        neff : integer;
        arr : array[1..nmax] of laporan_hilang;
    end;

var 
    data : list;

//Prosedurnya

procedure input(i : integer);
//Kamus Lokal
var
    temp : string;
    ec : integer;

//Algoritma
begin
    data.neff += 1;
    write('Masukan id buku: ');
    readln(data.arr[i].id_buku_hilang);
    write('Masukan judul buku: ');
    readln();
    write('Masukan tanggal pelaporan: ');
    readln(temp);
    val(temp[1] +  temp[2], data.arr[i].tanggal_laporan.dd, ec);
    val(temp[4] +  temp[5], data.arr[i].tanggal_laporan.mm, ec);
    val(temp[7] +  temp[8] + temp[9] + temp[10], data.arr[i].tanggal_laporan.yyyy, ec);
end;

//Tes Jalan

begin
data.neff := 0;
input(1);
end.


