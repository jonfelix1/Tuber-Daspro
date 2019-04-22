unit F15;

interface

uses loadandsave;

procedure mencari_Anggota(var ArrayUser: arrUser);
// Prosedur ini dapat dimanfaatkan untuk mencari identitas anggota
var 
	masuk : User;
	stop, found : boolean;
	count : integer;
	
implementation

procedure mencari_Anggota(var ArrayUser: arrUser); 
begin
	// Inisialisasi variabel-variabel temporer
	count := 1;
	found := false;
	stop := false;

	// Program meminta username anggota yang identitasnya ingin diketahui
	repeat
		write('Masukkan username: ');
		readln(masuk.Username);

		// Program mengklarifikasi apakah username yang dimasukkan terdapat dalam daftar anggota
		while ((count <= ArrayUser.neff) and not(found)) do
		begin
			if ((ArrayUser.tab[count].Username) = masuk.Username) then
			begin
				// Jika terdapat, identitas anggota terkait ditampilkan 
				writeln('Nama anggota: ', ArrayUser.tab[count].Username);
				writeln('Alamat anggota: ', ArrayUser.tab[count].Alamat);
				found := true;
			end else
			begin
				count := count + 1;
			end;
		end;

		// Pada kondisi ini, terjadi satu atau dua peristiwa: (1) count = ArrayUser.neff atau (2) found = true
		if not(found) then
		begin
			//Jika tidak terdapat, pesan kesalahan ditampilkan
			writeln('Anggota tidak ditemukan. Silakan coba lagi!');
		end else 
		begin 
			stop := true;
		end;
	until stop;
end;