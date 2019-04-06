program exRecords;
uses db;

const
    nmax = 100;

type
    buku = record
        id: longint;
        judul : packed array [1..50] of char;
        penulis: packed array [1..50] of char;
        kategori: string;
        tahun : integer;
   
end;

var
    list_buku : array [1..nmax] of buku;
    i : integer;

procedure print_buku( var bukua: buku);
    begin
        write(bukua.id, ' | ');
        write(bukua.judul, ' | ');
        write(bukua.penulis);
    end;

begin
    readln(input);
    
    for i := 1 to nmax do 
        begin
            if list_buku[i].kategori = input then
                print_buku(list_buku[i]);
        end;
                

end.
