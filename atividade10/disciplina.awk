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

    if (NF > 1){
      mediap1=mediap1+$2
      mediap2=mediap2+$3
      mediap3=mediap3+$4
    }

  }
  
}
END {printf "Média das Provas: %.1f %.1f %.1f\n" , mediap1/(NR-1) , mediap2/(NR-1) , mediap3/(NR-1)}