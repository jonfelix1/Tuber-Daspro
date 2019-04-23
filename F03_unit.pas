unit F03_unit;
interface

procedure print_buku(var bukua: buku);
procedure cari(var list : arrBuku);

implementation

procedure print_buku( var bukua: buku);
    begin
    write(bukua.id_buku, ' | ');
    write(bukua.judul_buku, ' | ');
    write(bukua.author);
    writeln();
    end;

procedure cari(var list : arrBuku);

//Kamus Lokal
var
    i , result, i_out : integer;
    input, tmp, tmp2 : string;
    stop : boolean;
    list_output : array [1..nmax] of buku;
    tmp3 : buku;

begin
stop := false;
result := 0;
i_out := 1;

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
                list_output[i_out] := list[i];
                i_out += 1;
                result += 1;
                end;
        end;

    i_out -= 1;
    i := 1;
    
    if result > 1 then
        begin
        repeat
            begin
            tmp := list_output[i].judul_buku;
            tmp2 := list_output[i+1].judul_buku;
            if tmp > tmp2 then
                begin
                tmp3 := list_output[i];
                list_output[i] := list_output[i+1];
                list_output[i+1] := tmp3;
                i := 0;
                end;
            i += 1;
            end
        until i = i_out;
        end;

    if result = 0 then 
        begin
        writeln('Tidak ada buku dalam kategori ini.');
        stop := true;
        end
    else
        begin
        for i := 1 to i_out do print_buku(list_output[i]);
        stop := true;
        end;
    
    end
    else writeln('Kategori ', input, ' tidak valid.');
    end;

end;

end.
