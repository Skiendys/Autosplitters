state("FarCry")
{
	int loadIndicator : "Cry3DEngine.dll", 0x00029DFC, 0x0, 0xBC;
	int levelTime : "Cry3DEngine.dll", 0x00093A60, 0xFC, 0x24, 0x6CC, 0x550;
}

start
{
	return current.loadIndicator == 0 && old.loadIndicator == 600;
}

isLoading
{
	return current.loadIndicator == 600;
}

split
{
	return old.levelTime > 1 && current.levelTime == 0;
}