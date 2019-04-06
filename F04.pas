program F04;
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
    i, tahuna, result : integer;
    kategori : string;

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
        tahun := 2011;
    end;

    result := 0;

    while True do
        begin
            write ('Masukan tahun: ');
            readln(tahuna);
            write ('Masukan kategori: ');
            readln(kategori);
            writeln();
            writeln('Buku yang terbit ', kategori, ' ', tahuna, ': ');
            if kategori = '=' then
                begin
                    for i := 1 to nmax do 
                            begin
                                if list[i].tahun = tahuna then
                                    begin
                                        print_buku(list[i]);
                                        result += 1;
                                    end;
                            end;
                        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');
                end
            else if kategori = '<' then
                begin
                    for i := 1 to nmax do 
                            begin
                                if list[i].tahun < tahuna then
                                    begin
                                        print_buku(list[i]);
                                        result += 1;
                                    end;
                            end;
                        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
                end
            else if kategori = '>' then
                begin
                    for i := 1 to nmax do 
                            begin
                                if list[i].tahun > tahuna then
                                    begin
                                        print_buku(list[i]);
                                        result += 1;
                                    end;
                            end;
                        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
                end
            else if kategori = '>=' then
                begin
                    for i := 1 to nmax do 
                            begin
                                if list[i].tahun >= tahuna then
                                    begin
                                        print_buku(list[i]);
                                        result += 1;
                                    end;
                            end;
                        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
                end
            else if kategori = '<=' then
                begin
                    for i := 1 to nmax do 
                            begin
                                if list[i].tahun <= tahuna then
                                    begin
                                        print_buku(list[i]);
                                        result += 1;
                                    end;
                            end;
                        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
                end
        end;
end.