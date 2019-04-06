program F03;
uses db, sysutils;

const
    nmax = 100;

type
    buku = record
        id: longint;
        judul : string;
        penulis: string;
        kategori: string;
        tahun : integer;
   
end;

var
    list : array [1..nmax] of buku;
    i,result : integer;
    input : string;

procedure print_buku( var bukua: buku);
    begin
        write(bukua.id, ' | ');
        write(bukua.judul, ' | ');
        write(bukua.penulis);
        writeln();
    end;

begin
    {Ganti ke csv}
    with list[1] do
    begin
        id := 2516;
        judul := 'Clean Code';
        penulis := 'Robert';
        kategori := 'programming';
        tahun := 2010;
    end;
    
    with list[2] do
    begin
        id := 786727;
        judul := 'Competitive Programming 3';
        penulis := 'Steven';
        kategori := 'programming';
        tahun := 2010;
    end;

    result := 0;

    while True do
        begin
            write('Masukan kategori: ');
            read(input);
            if  (AnsiCompareStr(input, 'sastra') = 0) or
                (AnsiCompareStr(input, 'sains') = 0) or
                (AnsiCompareStr(input, 'manga') = 0) or
                (AnsiCompareStr(input, 'sejarah') = 0) or
                (AnsiCompareStr(input, 'programming') = 0) then
                    begin
                        writeln('Hasil pencarian :');
                        for i := 1 to nmax do 
                            begin
                                if AnsiCompareStr(list[i].kategori, input) = 0 then
                                    begin
                                        print_buku(list[i]);
                                        result += 1;
                                    end;
                            end;
                        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');
                        exit;
                    end
            else writeln('Kategori ', input, ' tidak valid.');
        end;
end.
