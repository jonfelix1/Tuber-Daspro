unit F07_unit;
interface

procedure lapor_hilang(data: arrHilang);

implementation

procedure lapor_hilang(data: arrHilang);

var
    temp : string;
    ec : integer;

//Algoritma
begin
    data.neff += 1;
    write('Masukan id buku: ');
    readln(data.arr[data.neff].id_buku_hilang);
    write('Masukan judul buku: ');
    readln();
    write('Masukan tanggal pelaporan: ');
    readln(temp);
    val(temp[1] +  temp[2], data.arr[data.neff].tanggal_laporan.dd, ec);
    val(temp[4] +  temp[5], data.arr[data.neff].tanggal_laporan.mm, ec);
    val(temp[7] +  temp[8] + temp[9] + temp[10], data.arr[data.neff].tanggal_laporan.yyyy, ec);
end;
end.