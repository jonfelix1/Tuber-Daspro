program F04_rev1;

//Kamus Global

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
    list_buku : array[1..nmax] of buku;
    input_kategori : string;

//Prosedur output

procedure print_buku(var bukua: buku);
    begin
    write(bukua.id_buku, ' | ');
    write(bukua.judul_buku, ' | ');
    write(bukua.author);
    writeln();
    end;

procedure caritahunterbit;

//Kamus lokal
var
    i, tahuna, result : integer;
    stop : boolean;

//Algoritma

begin
result := 0;
stop := false;

while not(stop) do
    begin
    write ('Masukan tahun_terbit: ');
    readln(tahuna);
    write ('Masukan kategori: ');
    readln(input_kategori);
    writeln();
    writeln('Buku yang terbit ', input_kategori, ' ', tahuna, ': ');
    if input_kategori = '=' then
        begin
        for i := 1 to nmax do 
            begin
            if list_buku[i].tahun_terbit = tahuna then
                begin
                print_buku(list_buku[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');
        stop := True;
        end

    else if input_kategori = '<' then
        begin
        for i := 1 to nmax do 
            begin
            if list_buku[i].tahun_terbit < tahuna then
                begin
                print_buku(list_buku[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
        stop := True;
        end

    else if input_kategori = '>' then
        begin
        for i := 1 to nmax do 
            begin
            if list_buku[i].tahun_terbit > tahuna then
                begin
                print_buku(list_buku[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.'); 
        stop := True; 
        end

    else if input_kategori = '>=' then
        begin
        for i := 1 to nmax do 
            begin
            if list_buku[i].tahun_terbit >= tahuna then
                begin
                print_buku(list_buku[i]);
                result += 1;
                end;
            end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.');  
        stop := True;
        end

    else if input_kategori = '<=' then
        begin
            for i := 1 to nmax do 
                begin
                if list_buku[i].tahun_terbit <= tahuna then
                    begin
                    print_buku(list_buku[i]);
                    result += 1;
                    end;
                end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.'); 
        stop := True; 
        end
    
    end;
end;

//Algoritma tes jalan

begin

with list_buku[1] do
    begin
    id_buku := 2516;
    judul_buku := 'Clean Code';
    author := 'Robert';
    kategori := 'programming';
    tahun_terbit := 2010;
    end;
    
with list_buku[2] do
    begin
    id_buku := 786727;
    judul_buku := 'Competitive Programming 3';
    author := 'Steven';
    kategori := 'programming';
    tahun_terbit := 2011;
    end;

caritahunterbit;
end.

