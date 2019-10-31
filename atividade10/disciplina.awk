BEGIN {print "Aluno:Situação:Média"}
{
  media = ($2+$3+$4)/3
  if (NR > 1){
    if (media >= 7.0) {
      printf "%s:Aprovado:%.1f\n" , $1 , media
    }
    else if (media >= 5.0) {
      printf "%s:Final:%.1f\n" , $1 , media
    }
    else {
      printf "%s:Reprovado:%.1f\n" , $1 , media
    }
  }
}
END {}