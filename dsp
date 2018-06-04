int main()
{
float val_tmp;                                                                            //valeur temporaire
int max_color = 0;
short Tab_coef[9] = {-1,-1,-1,-1,8,-1,-1,-1,-1};
unsigned short Tab_pix[9];
tab_image_final =malloc(width*height*sizeof(unsigned char));                            // allocation de la mémoire 
int i,j;
printf("start\n");

                                                                                       //Appel de la fonction qui permet de lire l'image   
                                                                                       "lena.ascii.pgm" et de récupérer son contenu
                                                                                      //open_file ("lena64.pgm");
open_file ("lena.ascii.pgm");

for(i=0;i<height*width;i++){
if(j==width) j=0;
if(i<=width-1){                                                                       // premiere ligne
Tab_pix[0]=0;Tab_pix[1]=0; Tab_pix[2]=0;
if((i>=1)&&(i<=width-2)){  
                                                                                     //entre 2ème et avant derniere clonne
Tab_pix[3]=tab_image_source[i-1]; Tab_pix[4]=tab_image_source[i];
Tab_pix[5]=tab_image_source[i+1];Tab_pix[6]=tab_image_source[i-1+width];
Tab_pix[7]=tab_image_source[i+width]; Tab_pix[8]=tab_image_source[i+width+1];
}
if(i==0) {                                                                           // superieur gauche
Tab_pix[3]=0; Tab_pix[4]=tab_image_source[i]; Tab_pix[5]=tab_image_source[i+1];
Tab_pix[6]=0; Tab_pix[7]=tab_image_source[i+width];
Tab_pix[8]=tab_image_source[i+width+1];
}
if(i==width-1){                                                                     // superieur droite
Tab_pix[3]=tab_image_source[i-1]; Tab_pix[4]=tab_image_source[i]; Tab_pix[5]=0;
Tab_pix[6]=tab_image_source[i-1+width]; Tab_pix[7]=tab_image_source[i+width];
Tab_pix[8]=0;
}
} else{
if(height*width-i<=width){                                                         // dernere ligne
Tab_pix[6]=0; Tab_pix[7]=0; Tab_pix[8]=0;
Tab_pix[1]=tab_image_source[i-width]; Tab_pix[4]=tab_image_source[i];
Réalisé par Condé Kabinet année 2016-2017
if(j==0){                                                                         //premiere colonne de la derniere ligne
Tab_pix[0]=0; Tab_pix[3]=0; Tab_pix[6]=0;
Tab_pix[2]=tab_image_source[i-width+1];Tab_pix[3]=0;
Tab_pix[5]=tab_image_source[i+1];
}
if(j==width-1){Tab_pix[2]=0;Tab_pix[5]=0;Tab_pix[8]=0;                            //derniere colonne
Tab_pix[0]=tab_image_source[i-width-1]; Tab_pix[3]=tab_image_source[i-1];
}
if((j!=0) &&(j!=width-1)){                                                        //entre 2eme colonne et avant dernier cololonne
Tab_pix[0]=tab_image_source[i-width-1]; Tab_pix[2]=tab_image_source[iwidth+
1];
Tab_pix[3]=tab_image_source[i-1]; Tab_pix[5]=tab_image_source[i+1];
}
} else{                                                                           // au milieu
if( (j==0) || (j==width-1)){                                                     //premiere et derniere colonne
Tab_pix[1]=tab_image_source[i-width];
Tab_pix[4]=tab_image_source[i];
Tab_pix[7]=tab_image_source[i+width];
if(j==0){                                                                       //premiere colonne
Tab_pix[0]=0; Tab_pix[2]=tab_image_source[i-width+1];Tab_pix[3]=0;
Tab_pix[5]=tab_image_source[i+1]; Tab_pix[6]=0;
Tab_pix[8]=tab_image_source[i+width+1];
}
if(j==width-1){                                                                 //derniere colonne
Tab_pix[0]=tab_image_source[i-width-1]; Tab_pix[2]=0;
Tab_pix[3]=tab_image_source[i-1];
Tab_pix[5]=0; Tab_pix[6]=tab_image_source[i-1+width]; Tab_pix[8]=0;
Tab_pix[8]=0;
}
} else{                                                                        //milieu du milieu
Tab_pix[0]=tab_image_source[i-width-1]; Tab_pix[1]=tab_image_source[i-width];
Tab_pix[2]=tab_image_source[i-width+1];Tab_pix[3]=tab_image_source[i-1];
Tab_pix[4]=tab_image_source[i];
Tab_pix[5]=tab_image_source[i+1];Tab_pix[6]=tab_image_source[i-1+width];
Tab_pix[7]=tab_image_source[i+width];
Tab_pix[8]=tab_image_source[i+width+1];
}
}

}
//val_tmp=Fonction_asm(Tab_pix,Tab_coef)/8.0;
val_tmp=Produit_somme(Tab_pix,Tab_coef)/8.0;
if(val_tmp<=0) val_tmp=0;
if(val_tmp>=255) val_tmp=255;
if (val_tmp>=max_color) max_color= val_tmp;                                  // calcul de la valeur max des pixels
tab_image_final[i]= (unsigned char)(int) val_tmp;                            //remplissage du tableau resultat
j++;                                                                         //J permet de determiner la position du pixel par rapport                                                                                //  au bord

}                                                                            //fin convolution
write_file (tab_image_final,max_color );
printf("color max= %d ", max_color);
}
