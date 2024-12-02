function abs(x){return ((x < 0.0) ? -x : x)}
{ l[NR]=$1; r[NR]=$2 }
END {
  asort(l); asort(r)
  for (i in l) { sum+=abs(l[i] - r[i]) }
  print sum
}
