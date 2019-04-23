unit F05_unit;
interface

procedure pinjam_buku(var data1: arrBuku, data3: arrPinjam, current_user : user);

implementation

procedure pinjam_buku(var data1: arrBuku, data3: arrPinjam, current_user : user);
//Kamus Lokal
var
    stock, i, temp_id, ec, temp_dd, temp_mm, temp_yyyy: integer;
    found : boolean;
    temp_tanggal, judul_buku : string;

//Algoritma
begin
write('Masukan id buku yang ingin dipinjam: ');
readln(temp_id);
write('Masukan tanggal hari ini: ');
readln(temp_tanggal);

i := 1;
found := false;

//Mencari data di buku.csv
while not(found) and (i <= data1.neff) do 
    begin
    if data1.arr[i].id_buku = temp_id then
        begin
        found := true;
        stock := data1.arr[i].jumlah_buku;
        judul_buku := data1.arr[i].judul_buku;
        end
    else i += 1;
    end;

if stock > 0 then
    begin
    writeln('Buku ' + judul_buku + ' berhasil dipinjam!');
    writeln('Tersisa ' + IntToStr(stock-1) + ' buku ' + judul_buku);
    writeln('Terima kasih sudah meminjam.');
    data1.arr[i].jumlah_buku -= 1;
    data3.neff += 1;
    data3.arr[data3.neff].id_buku := temp_id;
    val(temp_tanggal[1] +  temp_tanggal[2], data3.arr[data3.neff].tanggal_peminjaman.dd, ec);
    val(temp_tanggal[4] +  temp_tanggal[5], data3.arr[data3.neff].tanggal_peminjaman.mm, ec);
    val(temp_tanggal[7] +  temp_tanggal[8] + temp_tanggal[9] + temp_tanggal[10], data3.arr[data3.neff].tanggal_peminjaman.yyyy, ec);
    temp_dd := data3.arr[data3.neff].tanggal_peminjaman.dd + 7;
    temp_mm := data3.arr[data3.neff].tanggal_peminjaman.mm;
    temp_yyyy := data3.arr[data3.neff].tanggal_peminjaman.yyyy;
    data3.arr[data3.neff].username := current_user.username;

    if  ((temp_mm = 1) or
        (temp_mm = 3) or
        (temp_mm = 5) or
        (temp_mm = 7) or
        (temp_mm = 8) or
        (temp_mm = 10) or
        (temp_mm = 12)) and
        (temp_dd > 31) then
            begin
            temp_mm += 1;
            temp_dd -= 31;
            if temp_mm = 13 then
                begin
                temp_mm := 1;
                temp_yyyy += 1;
                end;
            end


    else if temp_mm = 2 then
        begin
        if (temp_yyyy mod 400 = 0) and (temp_dd > 29) then
            begin
            temp_dd -= 29;
            temp_mm += 1;
            end
        else if (temp_yyyy mod 100 > 0) and (temp_yyyy mod 4 = 0) and (temp_dd > 29) then
            begin
            temp_dd -= 29;
            temp_mm += 1;
            end
        else if temp_dd > 28 then
            begin
            temp_dd -= 28;
            temp_mm += 1;  
            end;
        end

    else if (temp_dd > 30) then 
        begin
        temp_dd -= 30;
        temp_mm += 1;
        end;
    
    data3.arr[data3.neff].tanggal_batas_pengembalian.dd := temp_dd;
    data3.arr[data3.neff].tanggal_batas_pengembalian.mm := temp_mm;
    data3.arr[data3.neff].tanggal_batas_pengembalian.yyyy := temp_yyyy;
    end

else
    begin
    writeln('Buku ' + judul_buku + ' sedang habis');
    writeln('Coba lain kali');
    end;

end;
end.
