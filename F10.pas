unit F10;

interface

uses loadandsave;

procedure tambahJumlahBuku (var ArrayBuku: arrBuku);
// Prosedur ini dapat dimanfaatkan untuk menambah jumlah sebuah buku
var
	jumlah_tambahan, i : integer;
	id_terkait : string;
	found : boolean;

implementation
	
procedure tambahJumlahBuku (var ArrayBuku: arrBuku);
begin
	// Menerima input dari pengguna
	write('Masukkan ID buku : ');
	readln(id_terkait);
	write('Masukkan jumlah buku yang ditambahkan : ');
	readln(jumlah_tambahan);

	// Prosedur mencari urutan buku yang sesuai dengan ID yang dimasukkan
	// Nilai yang ditemukan akan ditampung dalam sebuah variabel (yaitu i)
	found := false;
	i := 0;
	repeat
		i := i + 1;
		if (ArrayBuku.tab[i].ID_Buku = id_terkait) then
		begin
			found := True;
		end;
	until found;

	// Urutan buku, yaitu i, sudah ditemukan

	// Memperbarui jumlah buku ID terkait
	ArrayBuku.tab[i].Jumlah_Buku := ArrayBuku.tab[i].Jumlah_Buku + jumlah_tambahan;

	// Menampilkan pesan keberhasilan penambahan jumlah buku
	writeln('');
	writeln('Pembaruan jumlah buku berhasil dilakukan, total buku ', ArrayBuku, ' di perpustakaan menjadi ', ArrayBuku.tab[i].Jumlah_Buku;
end;