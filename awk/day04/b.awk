function count(mat) {
  for (i=2; i<=length(mat); i++) {
	for (j=2; j<=length(mat[i]); j++) {
	  if (substr(mat[i], j, 1) == "A") {
		x = substr(mat[i-1], j-1, 1) substr(mat[i+1], j+1, 1)
		y = substr(mat[i-1], j+1, 1) substr(mat[i+1], j-1, 1)
		if ((x=="MS" || x=="SM") && (y=="MS" || y=="SM")) {
		  n++
		}
	  }
	}
  }
  return n
}
{ matrix[NR]=$0 }
END { print count(matrix) }
