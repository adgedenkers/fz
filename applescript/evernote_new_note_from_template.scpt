FasdUAS 1.101.10   ��   ��    k             l      ��  ��   pj
TITLE:  Create Note from Template

SCRIPT INFORMATION
        Sript displays a dropdown list of existing templates for selection
	 Exports/Imports template as a .enex file so no elements are lost
	 Customizes new note (Title etc)

        Thanks to https://github.com/gtuckerkellogg/evernote_applescript_utils/blob/master/scripts/en_templates.applescript

TERMS OF USE:

CHANGELOG:
2016/03/01 Create a Journal Note in Evernote
2016/03/24 Converted to a generic template app; added pick list
2016/03/25 Added Sort for template list
2016/03/30 Added code for Blank-CopyTags
2016/12/29 Added Import option to notebook @Inbox	  

RECOMMENDED INSTALLATION AND USAGE INSTRUCTIONS:
- script is stored at /Users/<username>/Library/Scriptsfor access by Script Menu
- Fastscripts app is used for shortcut key access
- Templates are identified as tag:!Templates
   Adjust as required
     � 	 	� 
 T I T L E :     C r e a t e   N o t e   f r o m   T e m p l a t e 
 
 S C R I P T   I N F O R M A T I O N 
                 S r i p t   d i s p l a y s   a   d r o p d o w n   l i s t   o f   e x i s t i n g   t e m p l a t e s   f o r   s e l e c t i o n 
 	   E x p o r t s / I m p o r t s   t e m p l a t e   a s   a   . e n e x   f i l e   s o   n o   e l e m e n t s   a r e   l o s t 
 	   C u s t o m i z e s   n e w   n o t e   ( T i t l e   e t c ) 
 
                 T h a n k s   t o   h t t p s : / / g i t h u b . c o m / g t u c k e r k e l l o g g / e v e r n o t e _ a p p l e s c r i p t _ u t i l s / b l o b / m a s t e r / s c r i p t s / e n _ t e m p l a t e s . a p p l e s c r i p t 
 
 T E R M S   O F   U S E : 
 
 C H A N G E L O G : 
 2 0 1 6 / 0 3 / 0 1   C r e a t e   a   J o u r n a l   N o t e   i n   E v e r n o t e 
 2 0 1 6 / 0 3 / 2 4   C o n v e r t e d   t o   a   g e n e r i c   t e m p l a t e   a p p ;   a d d e d   p i c k   l i s t 
 2 0 1 6 / 0 3 / 2 5   A d d e d   S o r t   f o r   t e m p l a t e   l i s t 
 2 0 1 6 / 0 3 / 3 0   A d d e d   c o d e   f o r   B l a n k - C o p y T a g s 
 2 0 1 6 / 1 2 / 2 9   A d d e d   I m p o r t   o p t i o n   t o   n o t e b o o k   @ I n b o x 	     
 
 R E C O M M E N D E D   I N S T A L L A T I O N   A N D   U S A G E   I N S T R U C T I O N S : 
 -   s c r i p t   i s   s t o r e d   a t   / U s e r s / < u s e r n a m e > / L i b r a r y / S c r i p t s f o r   a c c e s s   b y   S c r i p t   M e n u 
 -   F a s t s c r i p t s   a p p   i s   u s e d   f o r   s h o r t c u t   k e y   a c c e s s 
 -   T e m p l a t e s   a r e   i d e n t i f i e d   a s   t a g : ! T e m p l a t e s 
       A d j u s t   a s   r e q u i r e d 
   
  
 l     ��������  ��  ��        l     ��  ��    . (--------------  MAIN PROGRAM -----------     �   P - - - - - - - - - - - - - -     M A I N   P R O G R A M   - - - - - - - - - - -      l     ��������  ��  ��        l     ����  r         I     �������� 0 get_template Get_Template��  ��    o      ���� 0 templatetitle templateTitle��  ��        l    ����  Z      ����  >       o    	���� 0 templatetitle templateTitle  J   	 ����    I   ���� �� 0 create_note Create_Note��    ��  ��
�� 
from   o    ���� 0 templatetitle templateTitle��  ��  ��  ��  ��     ! " ! l     ��������  ��  ��   "  # $ # l     ��������  ��  ��   $  % & % l     ��������  ��  ��   &  ' ( ' l     ��������  ��  ��   (  ) * ) l     ��������  ��  ��   *  + , + l     ��������  ��  ��   ,  - . - l     �� / 0��   / - '--------------  SUBROUTINES -----------    0 � 1 1 N - - - - - - - - - - - - - -     S U B R O U T I N E S   - - - - - - - - - - - .  2 3 2 l     ��������  ��  ��   3  4 5 4 l     �� 6 7��   6  Get Template    7 � 8 8  G e t   T e m p l a t e 5  9 : 9 l     �� ; <��   ;  ---------------    < � = =  - - - - - - - - - - - - - - - :  > ? > i      @ A @ I      �������� 0 get_template Get_Template��  ��   A k     R B B  C D C l     ��������  ��  ��   D  E F E r      G H G J     ����   H o      ����  0 templatetitles templateTitles F  I J I l   ��������  ��  ��   J  K L K O    - M N M k   	 , O O  P Q P r   	  R S R I  	 �� T��
�� .EVRNfindnull���     ctxt T m   	 
 U U � V V & t a g : ! T y p e - T e m p l a t e s��   S o      ���� 0 templatelist templateList Q  W�� W X    , X�� Y X s   ! ' Z [ Z l  ! $ \���� \ n   ! $ ] ^ ] 1   " $��
�� 
EVet ^ o   ! "���� 0 mynote myNote��  ��   [ n       _ ` _  ;   % & ` o   $ %����  0 templatetitles templateTitles�� 0 mynote myNote Y o    ���� 0 templatelist templateList��   N m     a a�                                                                                  EVRN  alis    *  Macintosh HD                   BD ����Evernote.app                                                   ����            ����  
 cu             Applications  /:Applications:Evernote.app/    E v e r n o t e . a p p    M a c i n t o s h   H D  Applications/Evernote.app   / ��   L  b c b l  . .��������  ��  ��   c  d e d r   . 6 f g f I   . 4�� h���� 0 simple_sort   h  i�� i o   / 0����  0 templatetitles templateTitles��  ��   g o      ����  0 templatetitles templateTitles e  j k j l  7 7��������  ��  ��   k  l m l I  7 <�� n��
�� .gtqpchltns    @   @ ns   n o   7 8����  0 templatetitles templateTitles��   m  o p o Z   = M q r�� s q >  = @ t u t 1   = >��
�� 
rslt u m   > ?��
�� boovfals r r   C F v w v 1   C D��
�� 
rslt w o      ���� 0 templatetitle templateTitle��   s r   I M x y x J   I K����   y o      ���� 0 templatetitle templateTitle p  z { z l  N N��������  ��  ��   {  | } | L   N P ~ ~ o   N O���� 0 templatetitle templateTitle }  ��  l  Q Q��������  ��  ��  ��   ?  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �  Simple Sort    � � � �  S i m p l e   S o r t �  � � � l     �� � ���   �  -------------    � � � �  - - - - - - - - - - - - - �  � � � i     � � � I      �� ����� 0 simple_sort   �  ��� � o      ���� 0 my_list  ��  ��   � k     u � �  � � � r      � � � J     ����   � l      ����� � o      ���� 0 
index_list  ��  ��   �  � � � r    	 � � � J    ����   � l      ����� � o      ���� 0 sorted_list  ��  ��   �  � � � U   
 r � � � k    m � �  � � � r     � � � m     � � � � �   � l      ����� � o      ���� 0 low_item  ��  ��   �  � � � Y    c ��� � ��� � Z   ) ^ � ����� � H   ) - � � E  ) , � � � l  ) * ���~ � o   ) *�}�} 0 
index_list  �  �~   � o   * +�|�| 0 i   � k   0 Z � �  � � � r   0 8 � � � c   0 6 � � � n   0 4 � � � 4   1 4�{ �
�{ 
cobj � o   2 3�z�z 0 i   � o   0 1�y�y 0 my_list   � m   4 5�x
�x 
ctxt � o      �w�w 0 	this_item   �  ��v � Z   9 Z � � ��u � =  9 < � � � l  9 : ��t�s � o   9 :�r�r 0 low_item  �t  �s   � m   : ; � � � � �   � k   ? F � �  � � � r   ? B � � � o   ? @�q�q 0 	this_item   � l      ��p�o � o      �n�n 0 low_item  �p  �o   �  ��m � r   C F � � � o   C D�l�l 0 i   � l      ��k�j � o      �i�i 0 low_item_index  �k  �j  �m   �  � � � A I L � � � o   I J�h�h 0 	this_item   � l  J K ��g�f � o   J K�e�e 0 low_item  �g  �f   �  ��d � k   O V � �  � � � r   O R � � � o   O P�c�c 0 	this_item   � l      ��b�a � o      �`�` 0 low_item  �b  �a   �  ��_ � r   S V � � � o   S T�^�^ 0 i   � l      ��]�\ � o      �[�[ 0 low_item_index  �]  �\  �_  �d  �u  �v  ��  ��  �� 0 i   � m    �Z�Z  � l   $ ��Y�X � n    $ � � � m   ! #�W
�W 
nmbr � n   ! � � � 2   !�V
�V 
cobj � o    �U�U 0 my_list  �Y  �X  ��   �  � � � l  d d�T�S�R�T  �S  �R   �  � � � r   d h � � � l  d e ��Q�P � o   d e�O�O 0 low_item  �Q  �P   � l      ��N�M � n       � � �  ;   f g � o   e f�L�L 0 sorted_list  �N  �M   �  ��K � r   i m � � � l  i j ��J�I � o   i j�H�H 0 low_item_index  �J  �I   � l      ��G�F � n       � � �  ;   k l � l  j k ��E�D � o   j k�C�C 0 
index_list  �E  �D  �G  �F  �K   � l    ��B�A � l    ��@�? � n     � � � m    �>
�> 
nmbr � n    � � � 2   �=
�= 
cobj � o    �<�< 0 my_list  �@  �?  �B  �A   �  �;  L   s u l  s t�:�9 o   s t�8�8 0 sorted_list  �:  �9  �;   �  l     �7�6�5�7  �6  �5    l     �4�3�2�4  �3  �2    l     �1	
�1  	  Create Note   
 �  C r e a t e   N o t e  l     �0�0    -------------    �  - - - - - - - - - - - - -  i     I      �/�.�/ 0 create_note Create_Note�.   �-�,
�- 
from o      �+�+ 0 templatetitle templateTitle�,   k    �  l     �*�)�(�*  �)  �(    O    � k   �   l   �'�&�%�'  �&  �%    !"! l   �$#$�$  # = 7 Retrieve the template, export and import as a new note   $ �%% n   R e t r i e v e   t h e   t e m p l a t e ,   e x p o r t   a n d   i m p o r t   a s   a   n e w   n o t e" &'& l   �#�"�!�#  �"  �!  ' ()( r    *+* I   � ,�
�  .EVRNfindnull���     ctxt, b    -.- m    // �00  i n T i t l e :. o    �� 0 templatetitle templateTitle�  + o      �� 0 thetemplate theTemplate) 121 r    343 m    55 �66 N / U s e r s / D a v i d / D e s k t o p / T e m p - T e m p l a t e . e n e x4 o      �� 0 tempfile tempFile2 787 I   �9:
� .EVRNenxpnull���     ****9 o    �� 0 thetemplate theTemplate: �;<
� 
kfil; o    �� 0 tempfile tempFile< �=>
� 
Expf= m    �
� Exffenex> �?�
� 
Exit? m    �
� boovtrue�  8 @A@ r    )BCB I   '�DE
� .EVRNenimnull���     fileD o    �� 0 tempfile tempFileE �FG
� 
EnimF m     !HH �II  @ I n b o xG �J�
� 
ExitJ m   " #�
� boovtrue�  C o      �� 0 newnotes newNotesA KLK r   * 0MNM n   * .OPO 4   + .�Q
� 
cobjQ m   , -�
�
 P o   * +�	�	 0 newnotes newNotesN o      �� 0 newnote newNoteL RSR l  1 1����  �  �  S TUT l  1 1�VW�  V  Update the new note		   W �XX * U p d a t e   t h e   n e w   n o t e 	 	U YZY l  1 1����  �  �  Z [\[ r   1 t]^] l     _� ��_ I     ������
�� .misccurdldt    ��� null��  ��  �   ��  ^ K   3 O`` ��ab
�� 
yeara o   6 9���� 0 yyyy  b ��cd
�� 
mnthc o   < ?���� 0 mmm  d ��ef
�� 
day e o   B E���� 0 d  f ��g��
�� 
wkdyg o   H K���� 0 dddd  ��  \ hih r   u �jkj l  u �l����l n   u �mnm 7  ~ ���op
�� 
ctxto m   � �������p m   � �������n l  u ~q����q c   u ~rsr b   u ztut m   u xvv �ww  0u o   x y���� 0 d  s m   z }��
�� 
ctxt��  ��  ��  ��  k o      ���� 0 dd  i xyx r   � �z{z c   � �|}| o   � ����� 0 mmm  } m   � ���
�� 
long{ o      ���� 0 m  y ~~ r   � ���� l  � ������� n   � ���� 7  � �����
�� 
ctxt� m   � �������� m   � �������� l  � ������� c   � ���� b   � ���� m   � ��� ���  0� o   � ����� 0 m  � m   � ���
�� 
ctxt��  ��  ��  ��  � o      ���� 0 mm   ��� l  � ���������  ��  ��  � ��� r   � ���� l  � ������� l  � ������� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n   � ���� 7  � �����
�� 
ctxt� m   � ����� 
� m   � �������� l  � ������� c   � ���� o   � ����� 0 templatetitle templateTitle� m   � ���
�� 
TEXT��  ��  � m   � ��� ���    -  � o   � ����� 0 yyyy  � m   � ��� ���  /� o   � ����� 0 mm  � m   � ��� ���  /� o   � ����� 0 dd  ��  ��  ��  ��  � o      ���� 0 	notetitle 	noteTitle� ��� r   � ���� o   � ����� 0 	notetitle 	noteTitle� n      ��� 1   � ���
�� 
EVet� o   � ����� 0 newnote newNote� ��� r   � ���� I  � �������
�� .misccurdldt    ��� null��  ��  � n      ��� 1   � ���
�� 
EVdd� o   � ����� 0 newnote newNote� ��� r   � ���� I  � �������
�� .misccurdldt    ��� null��  ��  � n      ��� 1   � ���
�� 
EVmm� o   � ����� 0 newnote newNote� ��� I  �	����
�� .EVRNunasnull���     ****� 4   ����
�� 
EVtg� m   � �� ���  ! T y p e - T e m p l a t e s� �����
�� 
EV14� o  ���� 0 newnote newNote��  � ��� l 

��������  ��  ��  � ��� Z  
������� =  
��� c  
��� o  
���� 0 templatetitle templateTitle� m  ��
�� 
TEXT� m  �� ���   T e m p l a t e - J o u r n a l� k  U�� ��� r  #��� c  !��� b  ��� b  ��� o  ���� 0 	notetitle 	noteTitle� m  �� ���   � o  ���� 0 dddd  � m   ��
�� 
TEXT� o      ���� 0 	notetitle 	noteTitle� ��� r  $+��� o  $%���� 0 	notetitle 	noteTitle� n      ��� 1  &*��
�� 
EVet� o  %&���� 0 newnote newNote� ��� I ,<����
�� .EVRNassnnull���     ****� 4  ,4���
�� 
EVtg� m  03�� ���  ! H o t   N o t e s� �����
�� 
EV13� o  78���� 0 newnote newNote��  � ��� r  =M��� l =K������ n  =K��� 1  GK��
�� 
EVhl� n  =G��� 4  DG���
�� 
cobj� m  EF���� � l =D������ I =D�����
�� .EVRNfindnull���     ctxt� l =@������ m  =@�� ��� , i n t i t l e : J o u r n a l - U p d a t e��  ��  ��  ��  ��  ��  ��  � o      ���� 0 
theweather 
theWeather�    I NS����
�� .JonspClpnull���     **** o  NO���� 0 
theweather 
theWeather��   �� l TT��������  ��  ��  ��  �  =  Xa c  X]	 o  XY���� 0 templatetitle templateTitle	 m  Y\��
�� 
TEXT m  ]`

 � " T e m p l a t e - P r o j e c t s  k  d�  r  dm m  dg �  - P r o j e c t :   n       1  hl��
�� 
EVet o  gh���� 0 newnote newNote  I n~��
�� .EVRNassnnull���     **** 4  nv��
�� 
EVtg m  ru �  ! P r o j e c t ����
�� 
EV13 o  yz���� 0 newnote newNote��   �� l ��������  ��  ��  ��    !  =  ��"#" c  ��$%$ o  ������ 0 templatetitle templateTitle% m  ����
�� 
TEXT# m  ��&& �'' . T e m p l a t e - B l a n k - C o p y T a g s! (��( k  ��)) *+* r  ��,-, l ��.����. 1  ����
�� 
EV15��  ��  - o      �� 0 theselection theSelection+ /0/ r  ��121 n  ��343 4  ���~5
�~ 
cobj5 m  ���}�} 4 o  ���|�| 0 theselection theSelection2 o      �{�{ 0 thenote theNote0 676 r  ��898 n  ��:;: 2 ���z
�z 
EVtg; o  ���y�y 0 thenote theNote9 o      �x�x 0 copytags copyTags7 <�w< I ���v=>
�v .EVRNassnnull���     ****= o  ���u�u 0 copytags copyTags> �t?�s
�t 
EV13? o  ���r�r 0 newnote newNote�s  �w  ��  ��  � @A@ l ���q�p�o�q  �p  �o  A BCB I ���n�mD
�n .EVRNonwnnull��� ��� null�m  D �lE�k
�l 
EV17E o  ���j�j 0 newnote newNote�k  C F�iF l ���h�g�f�h  �g  �f  �i   m     GG�                                                                                  EVRN  alis    *  Macintosh HD                   BD ����Evernote.app                                                   ����            ����  
 cu             Applications  /:Applications:Evernote.app/    E v e r n o t e . a p p    M a c i n t o s h   H D  Applications/Evernote.app   / ��   HIH l ���e�d�c�e  �d  �c  I JKJ O ��LML I ���bN�a
�b .coredelonull���     obj N c  ��OPO 4  ���`Q
�` 
fileQ o  ���_�_ 0 tempfile tempFileP m  ���^
�^ 
psxf�a  M m  ��RR�                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  K S�]S l ���\�[�Z�\  �[  �Z  �]   TUT l     �Y�X�W�Y  �X  �W  U VWV l     �V�U�T�V  �U  �T  W X�SX l     �R�Q�P�R  �Q  �P  �S       �OYZ[\]�O  Y �N�M�L�K�N 0 get_template Get_Template�M 0 simple_sort  �L 0 create_note Create_Note
�K .aevtoappnull  �   � ****Z �J A�I�H^_�G�J 0 get_template Get_Template�I  �H  ^ �F�E�D�C�F  0 templatetitles templateTitles�E 0 templatelist templateList�D 0 mynote myNote�C 0 templatetitle templateTitle_ 
 a U�B�A�@�?�>�=�<�;
�B .EVRNfindnull���     ctxt
�A 
kocl
�@ 
cobj
�? .corecnte****       ****
�> 
EVet�= 0 simple_sort  
�< .gtqpchltns    @   @ ns  
�; 
rslt�G SjvE�O� %�j E�O �[��l kh ��,�6G[OY��UO*�k+ E�O�j O�f �E�Y jvE�O�OP[ �: ��9�8`a�7�: 0 simple_sort  �9 �6b�6 b  �5�5 0 my_list  �8  ` �4�3�2�1�0�/�.�4 0 my_list  �3 0 
index_list  �2 0 sorted_list  �1 0 low_item  �0 0 i  �/ 0 	this_item  �. 0 low_item_index  a �-�, ��+ �
�- 
cobj
�, 
nmbr
�+ 
ctxt�7 vjvE�OjvE�O g��-�,Ekh�E�O Hk��-�,Ekh �� /��/�&E�O��  �E�O�E�Y �� �E�O�E�Y hY h[OY��O��6FO��6F[OY��O�\ �*�)�(cd�'�* 0 create_note Create_Note�)  �( �&�%�$
�& 
from�% 0 templatetitle templateTitle�$  c �#�"�!� ��������������# 0 templatetitle templateTitle�" 0 thetemplate theTemplate�! 0 tempfile tempFile�  0 newnotes newNotes� 0 newnote newNote� 0 yyyy  � 0 mmm  � 0 d  � 0 dddd  � 0 dd  � 0 m  � 0 mm  � 0 	notetitle 	noteTitle� 0 
theweather 
theWeather� 0 theselection theSelection� 0 thenote theNote� 0 copytags copyTagsd >G/�5�������H�
�	��������� ������v���������������������������������������
&������R������
� .EVRNfindnull���     ctxt
� 
kfil
� 
Expf
� Exffenex
� 
Exit� 
� .EVRNenxpnull���     ****
� 
Enim�
 
�	 .EVRNenimnull���     file
� 
cobj
� 
Krtn
� 
year� 0 yyyy  
� 
mnth� 0 mmm  
� 
day � 0 d  
�  
wkdy�� 0 dddd  �� 
�� .misccurdldt    ��� null
�� 
ctxt����
�� 
long
�� 
TEXT�� 

�� 
EVet
�� 
EVdd
�� 
EVmm
�� 
EVtg
�� 
EV14
�� .EVRNunasnull���     ****
�� 
EV13
�� .EVRNassnnull���     ****
�� 
EVhl
�� .JonspClpnull���     ****
�� 
EV15
�� 
EV17
�� .EVRNonwnnull��� ��� null
�� 
file
�� 
psxf
�� .coredelonull���     obj �'����%j E�O�E�O�����e� 	O����e� E�O��k/E�O*�a a a a a a a a a l E[a ,E�Z[a ,E�Z[a ,E�Z[a ,E�ZOa �%a &[a \[Za \Zi2E�O�a &E�Oa �%a &[a \[Za \Zi2E�O�a &[a \[Za  \Zi2a !%�%a "%�%a #%�%E�O��a $,FO*j �a %,FO*j �a &,FO*a 'a (/a )�l *O�a &a +  D�a ,%�%a &E�O��a $,FO*a 'a -/a .�l /Oa 0j �k/a 1,E�O�j 2OPY a�a &a 3  !a 4�a $,FO*a 'a 5/a .�l /OPY 6�a &a 6  )*a 7,E�O��k/E�O�a '-E^ O] a .�l /Y hO*a 8�l 9OPUOa : *a ;�/a <&j =UOP] ��e����fg��
�� .aevtoappnull  �   � ****e k     hh  ii  ����  ��  ��  f  g ���������� 0 get_template Get_Template�� 0 templatetitle templateTitle
�� 
from�� 0 create_note Create_Note�� *j+  E�O�jv *��l Y hascr  ��ޭ