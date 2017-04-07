function trouver_message(image2)
    
im2=imread(image2);

[ligne,colonne]=size(im2);

count2=0;

for o=1:ligne
    for p=1:colonne

            //récupérer la taille de la chaine    
            if o==1 & p==1 then
                k4=uint8(floor(im2(o,p,2)*16));//msb de la taille
                k5=floor(im2(o,p,3)*16)/16;//lsb de la taille
                limite=k4+k5; //limite = nbre de caractères dans le message
                //p=p+1;
             //end
             
             //récupérer les caractère du message
            elseif count2 <= limite then 
                
                count2=count2+1;
                //stocker les caractères dans k6
                k4=uint8(floor(im2(o,p,2)*16));//k4=msb du caractère
                k5=floor(im2(o,p,3)*16)/16;//k5=lsb du caractere
                k6(1,count2,1)=k4+k5;//k6 = msb +lsb du caractère
            else break
            end
    end 
end 

//afficher notre message
disp(ascii(k6));
    
endfunction
