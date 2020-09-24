state("CrysisRemastered")
{
	int loadingCheckpoint : "CrysisRemastered.exe", 0x21228AC;
	int loading : "CrysisRemastered.exe", 0x2049A7C;
	int loading2 : "CrysisRemastered.exe", 0x22D4F04;
}

startup {
	refreshRate = 100;	
}

start
{
}

isLoading
{	
	return current.loading == 256 || 
	current.loading2 == 1 || 
	current.loadingCheckpoint == 1;
}

split
{
}
