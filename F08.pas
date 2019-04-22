unit F08;

interface

uses loadandsave;

procedure bukuHilang (var ArrayBuku: arrBuku, var Buku_Hilang: arrHilang);
// Prosedur ini dapat dimanfaatkan untuk melihat daftar buku yang hilang
var
	i: integer;

implementation

procedure bukuHilang (var ArrayBuku: arrBuku, var Buku_Hilang: arrHilang);
begin
	writeln('Buku yang hilang: ');
	for i := 1 to (Buku_Hilang.neff) do
	begin
		writeln(Buku_Hilang.tab[i].ID_Buku_Hilang, ' | ', ArrayBuku.tab[i].Judul_Buku, ' | ', Buku_Hilang.tab[i].Tanggal_Laporan);
	end;
end;
end.