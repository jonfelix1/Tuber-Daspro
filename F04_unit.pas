unit F04  ;
interface

uses loadandsave;
procedure print_buku(var bukua: buku);
procedure caritahunterbit(list_buku: arrBuku);

implementation

procedure print_buku(var bukua: buku);
    begin
    write(bukua.id_buku, ' | ');
    write(bukua.judul_buku, ' | ');
    write(bukua.author);
    writeln();
    end;

procedure caritahunterbit(list_buku: arrBuku);

//Kamus lokal
var
    i, tahuna, result,nmax : integer;
    stop : boolean;
    input_kategori : string;

//Algoritma

begin
result := 0;
stop := false;
nmax:=list_buku.neff;

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
            if list_buku.tab[i].Tahun_Penerbit = tahuna then
                begin
                print_buku(list_buku.tab[i]);
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
            if (list_buku.tab[i].Tahun_Penerbit < tahuna) and
               (list_buku.tab[i].Tahun_Penerbit > 1) then
                begin
                print_buku(list_buku.tab[i]);
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
            if list_buku.tab[i].Tahun_Penerbit > tahuna then
                begin
                print_buku(list_buku.tab[i]);
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
            if list_buku.tab[i].Tahun_Penerbit >= tahuna then
                begin
                print_buku(list_buku.tab[i]);
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
                if (list_buku.tab[i].Tahun_Penerbit <= tahuna) and
                   (list_buku.tab[i].Tahun_Penerbit > 1) then
                    begin
                    print_buku(list_buku.tab[i]);
                    result += 1;
                    end;
                end;
        if result = 0 then writeln('Tidak ada buku dalam kategori ini.'); 
        stop := True; 
        end
    
    end;
end;


end.

