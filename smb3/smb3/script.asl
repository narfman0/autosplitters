init
{
}

update
{
}

start
{
    return features["start"].current > 86.0;
}

reset
{
    return features["reset"].current > 88.5;
}

split
{
}
