program F03;

//Kamus

const
    nmax = 100;

type
    buku = record
        id_buku: longint;
        judul_buku : string;
        author: string;
        kategori: string;
        tahun_terbit : integer;
    end;

var
    list : array [1..nmax] of buku;
    i,result : integer;
    input : string;
    stop : boolean;

//Prosedur output buku

procedure print_buku( var bukua: buku);
    begin
    write(bukua.id_buku, ' | ');
    write(bukua.judul_buku, ' | ');
    write(bukua.author);
    writeln();
    end;

//Algoritma

begin
{Ganti ke csv}
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
    tahun_terbit := 2010;
    end;

result := 0;

while not(stop) do
    begin
    write('Masukan kategori: ');
    readln(input);
    if  (input = 'sastra') or
        (input = 'sains') or
        (input = 'manga')  or
        (input = 'sejarah')  or
        (input = 'programming') then
        begin
        writeln('Hasil pencarian :');
        for i := 1 to nmax do 
            begin
            if list[i].kategori = input then
                begin
                print_buku(list[i]);
                result += 1;
                end;
            end;
    if result = 0 then 
        begin
        writeln('Tidak ada buku dalam kategori ini.');
        stop := True;
        end
    else
        stop := True;
    
    end
    else writeln('Kategori ', input, ' tidak valid.');
    end;
end.
