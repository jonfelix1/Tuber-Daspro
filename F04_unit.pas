unit F04_unit   ;
interface

procedure print_buku(var bukua: buku);
procedure caritahunterbit;

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
    i, tahuna, result : integer;
    stop : boolean;
    input_kategori : string;

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
            if (list_buku[i].tahun_terbit = tahuna) then
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
            if (list_buku[i].tahun_terbit < tahuna) and
               (list_buku[i].tahun_terbit > 1) then
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
                if (list_buku[i].tahun_terbit <= tahuna) and
                   (list_buku[i].tahun_terbit > 1) then
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


end.