unit F02;

interface

uses typeTUBES;
procedure login (var log : reg; var akunuser : user);

var 
	stop, bool: boolean;
	akun: integer;
	
implementation
procedure login (var log : reg; var akunuser : user); 
begin
	bool := false;
	stop := false;
	repeat
		akun := 1;
		bool :=false;
		write('Masukkan username: ');
		readln(log.Username);
		write('Masukkan password: ');
		readln(log.Pass); 
		while (akun <= arrMax) do 
			begin
			if (((akunuser.tab[akun].Username)=log.Username) and ((akunuser.tab[akun].Pass)=log.Pass)) then
				begin
					writeln('Selamat datang ',akunuser.tab[akun].Name,' (',akunuser.tab[akun].Role,') ');
					bool := true;
					akun := arrMax+1;
				end
			else
				begin
					akun := akun+1;
				end;
			end;
		if bool = false then
			begin
				writeln('Username / password salah! Silakan coba lagi.');
			end
		else 
			begin 
				stop := true;
			end;
	until stop;
	end;

end.
