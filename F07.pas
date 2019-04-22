program f07;

//kamus

const
    nmax = 100;

type
    tanggal = record
        dd, mm, yyyy : integer;
    end;

    laporan_hilang = record
        username : string;
        id_buku_hilang : integer;
        judul : string;
        tanggal_laporan : tanggal;
    end;

    list = record
        neff : integer;
        arr : array[1..nmax] of laporan_hilang;
    end;

var 
    data : list;

procedure input(a : list; i : integer);
var
    temp : string;
    ec : integer;
begin
    a.neff += 1;
    write('Masukan id buku: ');
    readln(a.arr[i].id_buku_hilang);
    write('Masukan judul buku: ');
    readln(a.arr[i].judul);
    write('Masukan tanggal pelaporan: ');
    readln(temp);
    val(temp[1] +  temp[2], a.arr[i].tanggal_laporan.dd, ec);
    val(temp[4] +  temp[5], a.arr[i].tanggal_laporan.mm, ec);
    val(temp[7] +  temp[8] + temp[9] + temp[10], a.arr[i].tanggal_laporan.yyyy, ec);
end;

begin
data.neff := 0;
input(data, 1);
end.


