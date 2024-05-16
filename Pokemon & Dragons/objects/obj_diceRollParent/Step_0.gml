/// @description ???

_timeLength = room_speed * 2.5;
_holdTime = room_speed * 2;


if (loopCounter < _timeLength)
{
	image_index = irandom_range(1, topEnd);
	loopCounter++;
	counter = 0;
}
else if (loopCounter == _timeLength)
{
	image_index = result;
	if (counter > _holdTime)
	{
		loopCounter++;
		counter = 0;
	}
	counter++;
}
else if (loopCounter == _timeLength + 1)
{
	image_index = result + modifier;
	if (counter > _holdTime)
	{
		loopCounter++;
		counter = 0;
	}
	counter++;
}
else if (loopCounter == _timeLength + 2)
{
	if (counter > _holdTime)
	{
		loopCounter++;
	}
	counter++;
}
else if (loopCounter == _timeLength + 3)
{
	alarm_set(0, _holdTime);
	loopCounter++;
}
else if (loopCounter == _timeLength + 4)
{
	image_alpha -= 0.01;
}
	