BEGIN { pattern="mul\\([0-9]{1,3},[0-9]{1,3}\\)" }
{
  patsplit($0, matches, pattern)
  for (i in matches) {
    patsplit(matches[i], nums, "[0-9]+")
    SUM+=nums[1]*nums[2] }
}
END { print SUM }
