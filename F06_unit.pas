unit F06_unit;
interface

procedure kembali_buku(var data1: arrBuku, data3: arrPinjam, data4: arrKembali, current_user: user);

implementation

procedure kembali_buku(var data1: arrBuku, data3: arrPinjam, data4: arrKembali, current_user: user);
//Kamus Lokal
    var
        stock, i, j, temp_id, ec, temp_dd, temp_mm, temp_yyyy: integer;
        found, found1 : boolean;
        temp_tanggal : string;

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

        data1.arr[i].jumlah_buku += 1;

        writeln('Data peminjaman:');
        writeln('Username :' + data3.arr[i].username);
        writeln('Judul buku: ' + data1.arr[j].judul_buku);
        writeln('Tanggal peminjaman: ' , data3.arr[i].tanggal_peminjaman.dd , '/' , data3.arr[i].tanggal_peminjaman.mm , '/' , data3.arr[i].tanggal_peminjaman.yyyy);
        writeln('Tanggal batas pengembalian: ' , data3.arr[i].tanggal_batas_pengembalian.dd , '/' , data3.arr[i].tanggal_batas_pengembalian.mm , '/' , data3.arr[i].tanggal_batas_pengembalian.yyyy);

        writeln('Masukan tanggal hari ini: ');
        readln(temp_tanggal);
        val(temp_tanggal[1] +  temp_tanggal[2], temp_dd, ec);
        val(temp_tanggal[4] +  temp_tanggal[5], temp_mm, ec);
        val(temp_tanggal[7] +  temp_tanggal[8] + temp_tanggal[9] + temp_tanggal[10], temp_yyyy, ec);

        if ((temp_dd > data3.arr[i].tanggal_batas_pengembalian.dd) and (temp_mm = data3.arr[i].tanggal_batas_pengembalian.mm) and (temp_yyyy = data3.arr[i].tanggal_batas_pengembalian.yyyy)) or
           ((temp_mm > data3.arr[i].tanggal_batas_pengembalian.mm) and (temp_yyyy = data3.arr[i].tanggal_batas_pengembalian.yyyy)) or
           (temp_yyyy > data3.arr[i].tanggal_batas_pengembalian.yyyy) then
            writeln ('Anda terlambat mengembalikan buku')
        else writeln('Terimakasih sudah meminjam');
        end;
    end;

end.