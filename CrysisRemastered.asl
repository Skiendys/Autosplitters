state("CrysisRemastered")
{
	int loading : "CrysisRemastered.exe", 0x2049A7C;
}

startup {
	refreshRate = 100;	
}

start
{
}

isLoading
{	
	return current.loading == 256;
}

split
{
}
