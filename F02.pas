unit F02;

interface
procedure login (var masuk : reg; var akun : user; var arrMax : integer);
var 
	stop, found : boolean;
	count : integer;
	
implementation
procedure login (var masuk : reg; var akun : user; var arrMax : integer); 
begin
	repeat //program akan meminta masukan username dan password secara berulang apabila pasangan masukan tidak benar
		count := 1;
		found := false;
		stop := false;
		write('Masukkan username: ');
		readln(masuk.Username);
		write('Masukkan password: ');
		readln(masuk.Pass); 
		while ((count <= arrMax) and not(found)) do //arrMax adalah nilai banyaknya daftar akun yang terdaftar
		begin //mencari apakah pasangan masukan benar
			if (((akun.tab[count].Username) = masuk.Username) and ((akun.tab[count].Pass) = masuk.Pass)) then
			begin
				writeln('Selamat datang ', akun.tab[count].Username, '!');
				found := true;
			end else
			begin
				count := count + 1;
			end;
		end;
		if not(found) then
		begin
			writeln('Username / password salah! Silakan coba lagi.');
		end else 
		begin 
			stop := true;
		end;
	until stop;
	end;

end.