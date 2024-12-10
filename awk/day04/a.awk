function count(mat) {
  n = 0
  for (i in mat) {
    n += patsplit(mat[i], _, "XMAS") + patsplit(mat[i], _, "SAMX")
  }
  return n
}

function rot90(mat, out) {
  for (row in mat) {
    for (i=1; i<=length(mat[row]); i++) {
      out[i]=out[i] substr(mat[row], i, 1)
    }
  }
}

function rot45(mat, out) {
  for (j=1; j<= length(mat); j++) {
    row=mat[j]
    for (i = 1; i <= length(row); i++) {
      out[j + i - 1] = (out[j + i - 1] ? out[j + i - 1] : "") substr(row, i, 1)
    }
  }
}

function rot135(mat, out) {
  numrows = length(mat)
  for (j=1; j<= numrows; j++) {
    row=mat[j]
    for (i = 1; i <= length(row); i++) {
      out[i - j + numrows] = (out[i - j + numrows] ? out[i -j + numrows] : "") substr(row, i, 1)
    }
  }
}

{ matrix[NR]=$0 }
END {
  rot90(matrix, rotated)
  rot45(matrix, diagl)
  rot135(rotated, diagr)
  print count(matrix) + count(rotated) + count(diagl) + count(diagr)
}
