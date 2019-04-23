unit F12_unit;
interface

procedure statistik(var data1: arrBuku, data2: arrUser);

implementation

procedure statistik(var data1: arrBuku, data2: arrUser);

//Kamus Lokal
    var
        count_admin, count_pengunjung, count_sastra, count_sains, count_manga, count_sejarah, count_programming, i, j : integer;

    //Algoritma
    begin
    count_admin := 0;
    count_pengunjung := 0;
    count_manga := 0;
    count_programming := 0;
    count_sains := 0;
    count_sastra := 0;
    count_sejarah := 0;

    i := 1;
    j := 1;
    while i <= data2.neff do 
        begin
        if data2.arr[i].role = 'admin' then
            count_admin += 1
        else 
            count_pengunjung += 1;
        i += 1;
        end;
    
    while j <= data1.neff do
        begin
        if data1.arr[j].kategori = 'manga' then
            count_manga += 1
        else if data1.arr[j].kategori = 'programming' then
            count_programming += 1
        else if data1.arr[j].kategori = 'sains' then
            count_sains += 1
        else if data1.arr[j].kategori = 'sastra' then
            count_sastra += 1
        else if data1.arr[j].kategori = 'sejarah' then
            count_sejarah += 1;
        j += 1;
        end;
    
    writeln('Pengguna:');
    writeln('Admin | ', count_admin);
    writeln('Pengunjung | ', count_pengunjung);
    writeln('Total | ', count_admin + count_pengunjung);
    writeln('Buku:');
    writeln('sastra | ', count_sastra);
    writeln('sains | ', count_sains);
    writeln('manga | ', count_manga);
    writeln('sejarah | ', count_sejarah);
    writeln('programming | ', count_programming);
    writeln('Total | ', count_manga + count_programming + count_sains + count_sastra + count_sejarah);
    end;

end.