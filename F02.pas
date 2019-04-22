unit F02;

interface

uses loadandsave;

procedure login(var ArrayUser: arrUser);
// Prosedur ini dapat dimanfaatkan pengguna atau admin untuk login
var 
	masuk : User;
	stop, correct : boolean;
	count : integer;
	
implementation

procedure login(var ArrayUser: arrUser); 
begin
	// Inisialisasi variabel-variabel temporer
	count := 1;
	correct := false;
	stop := false;

	// Program meminta masukan username dan password yang benar
	repeat
		write('Masukkan username: ');
		readln(masuk.Username);
		write('Masukkan password: ');
		readln(masuk.Password); 

		// Program mengklarifikasi apakah pasangan masukan benar
		while ((count <= ArrayUser.neff) and not(correct)) do
		begin
			if (((ArrayUser.tab[count].Username) = masuk.Username) and ((ArrayUser.tab[count].Password) = masuk.Password)) then
			begin
				// Jika benar, pesan keberhasilan login ditampilkan
				writeln('Selamat datang ', ArrayUser.tab[count].Username, '!');
				correct := true;
			end else
			begin
				count := count + 1;
			end;
		end;

		// Pada kondisi ini, terjadi satu atau dua peristiwa: (1) count = arrUser.neff atau (2) correct = true
		if not(correct) then
		begin
			// Jika salah, pesan kesalahan ditampilkan
			writeln('Username / password salah! Silakan coba lagi.');
		end else 
		begin 
			stop := true;
		end;
	until stop;
end;
end.