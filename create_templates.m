%CREATE TEMPLATES
%Letter
A=rgb2gray(imread('char/A.bmp'));

B=rgb2gray(imread('char/B.bmp'));

C=rgb2gray(imread('char/C.bmp'));D=rgb2gray(imread('char/D.bmp'));
E=rgb2gray(imread('char/E.bmp'));F=rgb2gray(imread('char/F.bmp'));
G=rgb2gray(imread('char/G.bmp'));H=rgb2gray(imread('char/H.bmp'));
I=rgb2gray(imread('char/I.bmp'));J=rgb2gray(imread('char/J.bmp'));
K=rgb2gray(imread('char/K.bmp'));L=rgb2gray(imread('char/L.bmp'));
M=rgb2gray(imread('char/M.bmp'));N=rgb2gray(imread('char/N.bmp'));
O=rgb2gray(imread('char/O.bmp'));P=rgb2gray(imread('char/P.bmp'));
Q=rgb2gray(imread('char/Q.bmp'));R=rgb2gray(imread('char/R.bmp'));
S=rgb2gray(imread('char/S.bmp'));T=rgb2gray(imread('char/T.bmp'));
U=rgb2gray(imread('char/U.bmp'));V=rgb2gray(imread('char/V.bmp'));
W=rgb2gray(imread('char/W.bmp'));X=rgb2gray(imread('char/X.bmp'));
Y=rgb2gray(imread('char/Y.bmp'));Z=rgb2gray(imread('char/Z.bmp'));
Afill=rgb2gray(imread('char/fillA.bmp'));
Bfill=rgb2gray(imread('char/fillB.bmp'));
Dfill=rgb2gray(imread('char/fillD.bmp'));
Ofill=rgb2gray(imread('char/fillO.bmp'));
Pfill=rgb2gray(imread('char/fillP.bmp'));
Qfill=rgb2gray(imread('char/fillQ.bmp'));
Rfill=rgb2gray(imread('char/fillR.bmp'));




%Number
one=rgb2gray(imread('char/1.bmp'));  two=rgb2gray(imread('char/2.bmp'));
three=rgb2gray(imread('char/3.bmp'));four=rgb2gray(imread('char/4.bmp'));
five=rgb2gray(imread('char/5.bmp')); six=rgb2gray(imread('char/6.bmp'));
seven=rgb2gray(imread('char/7.bmp'));eight=rgb2gray(imread('char/8.bmp'));
nine=rgb2gray(imread('char/9.bmp')); zero=rgb2gray(imread('char/0.bmp'));
zerofill=rgb2gray(imread('char/fill0.bmp'));
fourfill=rgb2gray(imread('char/fill4.bmp'));
sixfill=rgb2gray(imread('char/fill6.bmp'));
sixfill2=rgb2gray(imread('char/fill6_2.bmp'));
eightfill=rgb2gray(imread('char/fill8.bmp'));
ninefill=rgb2gray(imread('char/fill9.bmp'));
ninefill2=rgb2gray(imread('char/fill9_2.bmp'));


letter=[A Afill B Bfill C D Dfill E F G H I J K L M N O Ofill P Pfill Q Qfill R Rfill S T U V W X Y Z];

number=[one two three four fourfill five six sixfill sixfill2 seven eight eightfill nine ninefill ninefill2 zero zerofill];

character=[letter number];

NewTemplates=mat2cell(character,42,[24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24]);

save ('NewTemplates','NewTemplates')
