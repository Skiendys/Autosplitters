state("BFBC2Game")
{
	int loading1 : "BFBC2Game.exe", 0x0114A730, 0x490, 0x624;
	int exclude1 : "BFBC2Game.exe", 0x0116662C;
}

startup {
	refreshRate = 100;
}

start
{
	bool Loading = (current.loading1 == 2 && current.exclude1 != 1);
					
	bool wasLoading = (old.loading1 == 2 && old.exclude1 != 1);
	
	return Loading == false && wasLoading == true;
}

isLoading
{		
	return (current.loading1 == 2 && current.exclude1 != 1);
}
