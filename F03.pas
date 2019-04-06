program exRecords;
uses db;

const
    nmax = 100;

type
    buku = record
        id: longint;
        judul : packed array [1..50] of char;
        penulis: packed array [1..50] of char;
        kategori: packed array [1..100] of char;
   
end;

var
    list_buku : array [1..nmax] of buku;

procedure print_buku( var bukua: buku);
    begin
        write(bukua.id, ' | ');
        write(bukua.judul, ' | ');
        write(bukua.penulis);
    end;

begin
    
end.