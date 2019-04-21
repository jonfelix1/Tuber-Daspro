unit F09;

uses loadandsave;

interface

procedure tambahBuku ();
// Prosedur ini dapat dimanfaatkan untuk menambah identitas sebuah buku baru
var
	buku_baru : Buku;

implementation

procedure tambahBuku ();
begin
	// Me-load array of Buku
	handleBuku(load('Buku.csv'), arrBuku);

	// Menambah panjang array yang digunakan
	setLength(arrBuku, arrBuku.neff + 1);

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
	arrBuku.tab[arrBuku.neff + 1].ID_Buku := buku_baru.ID_Buku;
	arrBuku.tab[arrBuku.neff + 1].Jumlah_Buku := buku_baru.Jumlah_Buku;
	arrBuku.tab[arrBuku.neff + 1].Tahun_Penerbit := buku_baru.Tahun_Penerbit;
	arrBuku.tab[arrBuku.neff + 1].Judul_Buku := buku_baru.Judul_Buku;
	arrBuku.tab[arrBuku.neff + 1].Author := buku_baru.Author;
	arrBuku.tab[arrBuku.neff + 1].Kategori := buku_baru.Kategori;
	
	// Menampilkan pesan keberhasilan penambahan buku
	writeln('');
	writeln('Buku berhasil ditambahkan ke dalam sistem!');

	// Menyimpan perubahan yang berhasil dilakukan
	save('Buku.csv', convertBuku(arrBuku));
end;