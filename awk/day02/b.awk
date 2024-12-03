function abs(x) { return ((x < 0.0) ? -x : x) }
function delta_bad(a, b) { d=abs(a-b); return ( d<1 || d>3 ) }
function direction(c, d){ return (c-d > 0) ? 1 : -1 }
function copy_array(src, dest, i) {
  delete dest
  for (i in src) { dest[i] = src[i] }
}
function remove_item(src, idx, i) {
  len=length(src)
  for (i=idx; i<len; i++) { src[i]=src[i+1] }
  delete src[len]
}
function is_unsafe(arr, i) {
  for (i=2; i<=length(arr); i++) {
    if (delta_bad(arr[i], arr[i-1])) { return i }
    else if (direction(arr[i], arr[i-1]) != direction(arr[2],arr[1])) { return i }
  }
  return 0 # safe
}
{
  for (i=1; i<=NF; i++) { levels[i]=$i }
  unsafe_idx=is_unsafe(levels)
  if (unsafe_idx>0) {
    for (i=1; i<=length(levels); i++) {
      copy_array(levels, copy)
      remove_item(copy, i)
      if (is_unsafe(copy) == 0) { safe++; break }
    }
  } else { safe++ }
  delete levels;
}
END { print safe }
