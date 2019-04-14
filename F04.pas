program F04;

//Kamus Lokal

const
    nmax = 100;

type
    buku = record
        id_buku: longint;
        judul_buku : string;
        author: string;
        kategori: string;
        tahun_terbit : integer;
        jumlah_buku : integer;
    end;

var
    list : array [1..nmax] of buku;
    i, tahuna, result : integer;
    kategori : string;
    stop : boolean;

//Prosedur print buku

procedure print_buku( var bukua: buku);
    begin
    write(bukua.id_buku, ' | ');
    write(bukua.judul_buku, ' | ');
    write(bukua.author);
    writeln();
    end;

//Algoritma

begin
stop := false;

with list[1] do
    begin
    id_buku := 2516;
    judul_buku := 'Clean Code';
    author := 'Robert';
    kategori := 'programming';
    tahun_terbit := 2010;
    end;
    
with list[2] do
    begin
    id_buku := 786727;
    judul_buku := 'Competitive Programming 3';
    author := 'Steven';
    kategori := 'programming';
    tahun_terbit := 2011;
    end;

result := 0;

while not(stop) do
    begin
    write ('Masukan tahun_terbit: ');
    readln(tahuna);
    write ('Masukan kategori: ');
    readln(kategori);
    writeln();
    writeln('Buku yang terbit ', kategori, ' ', tahuna, ': ');
    if kategori = '=' then
        begin
        for i := 1 to nmax do 
            begin
            if list[i].tahun_terbit = tahuna then
                begin
                print_buku(list[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');
        stop := True;
        end

    else if kategori = '<' then
        begin
        for i := 1 to nmax do 
            begin
            if list[i].tahun_terbit < tahuna then
                begin
                print_buku(list[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
        stop := True;
        end

    else if kategori = '>' then
        begin
        for i := 1 to nmax do 
            begin
            if list[i].tahun_terbit > tahuna then
                begin
                print_buku(list[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.'); 
        stop := True; 
        end

    else if kategori = '>=' then
        begin
        for i := 1 to nmax do 
            begin
            if list[i].tahun_terbit >= tahuna then
                begin
                print_buku(list[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
        stop := True;
        end

    else if kategori = '<=' then
        begin
            for i := 1 to nmax do 
                begin
                if list[i].tahun_terbit <= tahuna then
                    begin
                    print_buku(list[i]);
                    result += 1;
                    end;
                end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.'); 
        stop := True; 
        end
    
    end;
end.
