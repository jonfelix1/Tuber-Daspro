unit F09;

interface

uses loadandsave;

procedure tambahBuku (var ArrayBuku: arrBuku);
// Prosedur ini dapat dimanfaatkan untuk menambah identitas sebuah buku baru
var
	buku_baru : Buku;

implementation

procedure tambahBuku (var ArrayBuku: arrBuku);
begin
	// Menambah panjang array yang digunakan
	ArrayBuku.neff := ArrayBuku.neff + 1;

	// Input data buku baru
	writeln('Masukkan Informasi buku yang ditambahkan :');
	write('Masukkan id buku : ');
	readln(buku_baru.ID_Buku);
	write('Masukkan jumlah buku : ');
	readln(buku_baru.Jumlah_Buku);
	write('Masukkan tahun terbit buku : ');
	readln(buku_baru.Tahun_Penerbit);
	write('Masukkan judul buku : ');
	readln(buku_baru.Judul_Buku);
	write('Masukkan pengarang buku : ');
	readln(buku_baru.Author);
	write('Masukkan kategori buku : ');
	readln(buku_baru.Kategori);

	// Memasukkan data baru ke array
	ArrayBuku.tab[ArrayBuku.neff].ID_Buku := buku_baru.ID_Buku;
	ArrayBuku.tab[ArrayBuku.neff].Jumlah_Buku := buku_baru.Jumlah_Buku;
	ArrayBuku.tab[ArrayBuku.neff].Tahun_Penerbit := buku_baru.Tahun_Penerbit;
	ArrayBuku.tab[ArrayBuku.neff].Judul_Buku := buku_baru.Judul_Buku;
	ArrayBuku.tab[ArrayBuku.neff].Author := buku_baru.Author;
	ArrayBuku.tab[ArrayBuku.neff].Kategori := buku_baru.Kategori;
	
	// Menampilkan pesan keberhasilan penambahan buku
	writeln('');
	writeln('Buku berhasil ditambahkan ke dalam sistem!');
end;