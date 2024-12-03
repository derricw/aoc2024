function abs(x){return ((x < 0.0) ? -x : x)}
function delta_bad(a, b){d=abs(a-b); return ( d<1 || d>3 )}
function direction(c, d){return (c-d > 0) ? 1 : -1}
function is_unsafe(arr) {
  dir=direction(arr[2],arr[1])
  for (i=2; i<=length(arr); i++) {
    if (delta_bad(arr[i], arr[i-1])) { return i } else
    if (direction(arr[i], arr[i-1]) != dir) { return i }
  }
  return 0
}
{
  for (i=1; i<=NF; i++) { levels[i]=$i }
  if (is_unsafe(levels)>0) { unsafe++ }
  delete levels
}
END { print NR - unsafe }
