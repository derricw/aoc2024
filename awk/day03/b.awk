BEGIN { on=1; pattern="(mul\\([0-9]{1,3},[0-9]{1,3}\\)|do\\(\\)|don't\\(\\))" }
{
  patsplit($0, matches, pattern)
  for (i in matches) {
    switch (matches[i]) {
    case "do()": on=1; continue
    case "don't()": on=0; continue
    default:
      if (on) {
        patsplit(matches[i], nums, "[0-9]+")
        SUM+=nums[1]*nums[2]
      }
    }
  }
}
END { print SUM }
