unit F10;

uses loadandsave;

interface

procedure tambahJumlahBuku ();
// Prosedur ini dapat dimanfaatkan untuk menambah jumlah sebuah buku
var
	jumlah_tambahan, i : integer;
	id_terkait : string;
	found : boolean;

implementation
	
procedure tambahJumlahBuku ();
begin
	// Me-load array of Buku
	handleBuku(load(buku.csv), arrBuku);

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
		if (arrBuku.tab[i].ID_Buku = id_terkait) then
		begin
			found := True;
		end;
	until found;

	// Urutan buku, yaitu i, sudah ditemukan

	// Memperbarui jumlah buku ID terkait
	arrBuku.tab[i].Jumlah_Buku := arrBuku.tab[i].Jumlah_Buku + jumlah_tambahan;

	// Menampilkan pesan keberhasilan penambahan jumlah buku
	writeln('');
	writeln('Pembaruan jumlah buku berhasil dilakukan, total buku ', arrBuku, ' di perpustakaan menjadi ', arrBuku.tab[i].Jumlah_Buku;

	// Menyimpan perubahan yang berhasil dilakukan
	save('Buku.csv', convertBuku(arrBuku));
end;