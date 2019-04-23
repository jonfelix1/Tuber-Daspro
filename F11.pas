unit F11;

interface
    uses loadandsave,crt;

    procedure riwayatPeminjaman(a:arrKembali;b:arrBuku);

implementation
procedure riwayatPeminjaman(a:arrKembali;b:arrBuku);
var
    i,j:integer;
    u:String;
begin
  Write('Masukkan username pengunjung: ');ReadLn(u);
  WriteLn('Riwayat: ');
  for i:=1 to a.neff do
    if u=a.tab[i].Username then 
        begin
        Write(gabungTanggal(a.tab[i].Tanggal_Pengembalian),' | ',
                a.tab[i].ID_Buku:7,' | ');
        j:=0;
        repeat
            inc(j);
        until a.tab[i].ID_Buku=b.tab[j].ID_Buku;
        writeln(b.tab[j].Judul_Buku:20);
        end;
end;
end.