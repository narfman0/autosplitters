init
{
}

update
{
}

start
{
    return features["start"].current > 95.0 || features["start54After"].current > 95.0;
}

reset
{
    return features["resetLeft16px"].current > 95.0;
}

split
{
    return features["endWrongWarp"].current > 95.7 || features["airshipGrab"].current > 91.0;
}
