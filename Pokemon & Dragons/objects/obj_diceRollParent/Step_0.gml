/// @description ???

timeLength = room_speed * 2.5;
holdTime = room_speed * 2;


if (loopCounter < timeLength)
{
	image_index = irandom_range(1, topEnd);
	loopCounter++;
	counter = 0;
}
else if (loopCounter == timeLength)
{
	image_index = result;
	if (result == topEnd) // Critical hits (Nat 20)
	{
		image_blend = c_lime;
	}
	else if (result == 1) // Critical Failures (Nat 1)
	{
		image_blend = c_red;
	}
	
	if (counter > holdTime)
	{
		loopCounter++;
		counter = 0;
	}
	counter++;
}
else if (loopCounter == timeLength + 1)
{
	image_index = result + modifier;
	if (counter > holdTime)
	{
		loopCounter++;
		counter = 0;
	}
	counter++;
}
else if (loopCounter == timeLength + 2)
{
	if (counter > holdTime)
	{
		loopCounter++;
	}
	counter++;
}
else if (loopCounter == timeLength + 3)
{
	alarm_set(0, holdTime);
	loopCounter++;
}
else if (loopCounter == timeLength + 4)
{
	image_alpha -= 0.01;
}
	