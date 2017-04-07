function cacher_message(image,message)

im1=imread(image);

n=size(im1);

x=double(zeros(n));//hypermatrice à la taille de l'image
im1=uint8(im1);

x=floor(im1/16)*16 ;//mettre les lsb à 0

txt=ascii(message);
tt=length(txt);//taille du message
//disp(dec2bin(bitcmp(tt,8)));
//disp(txt);

[li,col]=size(im1);
nbpx=li * col;//nbre de pixels

count=1;

//tant que message <= nombre de pixels dispo
if tt <= nbpx then

       for i=1:li
            for j=1:col
                    
                    //cacher le nombre de caractères dans le 1er pixel
                    if (i == 1) & (j == 1) then
                        x(i,j,2) = x(i,j,2) + uint8(floor(tt/16));//msb de tt
                        k2 = uint8(floor(tt*16));//lsb de tt
                        x(i,j,3) = x(i,j,3) + (k2/16);//tt cacher sur 16 bits
                        //j=j+1;
                    
                    
                    //cacher les caracteres dans les pixels suivant
                    elseif count <= tt then
                        x(i,j,2) = x(i,j,2) + floor(txt(count)/16);
                        k2 = uint8(floor(txt(count)*16));
                        x(i,j,3) = x(i,j,3) + (k2/16);
                        count=count+1;
                    
                    else break    
                    end
        end
    end
else disp('Message trop long');
end

y=uint8(x);

imwrite(y,'output.png');//ecrire image + message

endfunction
