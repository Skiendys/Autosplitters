state("FarCry")
{
	int fileSavingBuffer : "CryGame.dll", 0x00118564, 0x48, 0x18, 0x8, 0x4A0;
	int fileAccessMode : "CrySystem.dll", 0x00095E3C, 0x10;
	int loadIndicator : "Cry3DEngine.dll", 0x00029DFC, 0x0, 0xBC;
	int levelTime : "Cry3DEngine.dll", 0x00093A60, 0xFC, 0x24, 0x6CC, 0x550;
}

startup {
	settings.Add("splitOnSave", false, "If checked splits on every save game.");
	refreshRate = 100;	
}

start
{
	return current.loadIndicator == 0 && old.loadIndicator == 600;
}

isLoading
{	
	bool saving = current.fileSavingBuffer > 0 && current.fileAccessMode == 5;
	
	return current.loadIndicator == 600 || saving;
}

split
{
	bool saving = current.fileSavingBuffer > 0 && current.fileAccessMode == 5;
	bool oldSaving = old.fileSavingBuffer > 0 && old.fileAccessMode == 5;
	
	return (old.levelTime > 1 && current.levelTime == 0) 
			|| (oldSaving == false && saving == true && settings["splitOnSave"] == true);
}
