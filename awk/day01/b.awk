{ l[NR]=$1; r[$2]++ }
END {
  for (i in l) { sum+=r[l[i]] * l[i] }
  print sum
}
