unit F15;

uses loadandsave;

interface

procedure mencari_Anggota();
// Prosedur ini dapat dimanfaatkan untuk mencari identitas anggota
var 
	masuk : User;
	stop, found : boolean;
	count : integer;
	
implementation

procedure mencari_Anggota(); 
begin
	// Me-load array of User
	handleUser(load('User.csv'), arrUser);

	// Inisialisasi variabel-variabel temporer
	count := 1;
	found := false;
	stop := false;

	// Program meminta username anggota yang identitasnya ingin diketahui
	repeat
		write('Masukkan username: ');
		readln(masuk.Username);

		// Program mengklarifikasi apakah username yang dimasukkan terdapat dalam daftar anggota
		while ((count <= arrUser.neff) and not(found)) do
		begin
			if ((arrUser.tab[count].Username) = masuk.Username) then
			begin
				// Jika terdapat, identitas anggota terkait ditampilkan 
				writeln('Nama anggota: ', arrUser.tab[count].Username);
				writeln('Alamat anggota: ', arrUser.tab[count].Alamat);
				found := true;
			end else
			begin
				count := count + 1;
			end;
		end;

		// Pada kondisi ini, terjadi satu atau dua peristiwa: (1) count = arrUser.neff atau (2) found = true
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