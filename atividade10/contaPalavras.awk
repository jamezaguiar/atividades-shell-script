BEGIN {print "Relatório de palavras."}
{
  for (i = 1; i <= NF; i++){
    gsub(/[[:punct:]]/,"")
    vetor[$i]++
    totalPalavras++
  }
}
END {
  for (z in vetor) {
    printf "%s:\t%d\n", z , vetor[z]
  };
  printf "Total de Palavras analisadas: %d\n" , totalPalavras
}