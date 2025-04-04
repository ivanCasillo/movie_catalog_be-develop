PGDMP     !                    {           MovieCatalog    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16696    MovieCatalog    DATABASE     �   CREATE DATABASE "MovieCatalog" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE "MovieCatalog";
                postgres    false            �            1259    16768    movies    TABLE     s  CREATE TABLE public.movies (
    title character varying(100) NOT NULL,
    year character varying(50) NOT NULL,
    rated character varying(10),
    released date,
    runtime character varying(10),
    genre character varying(100) NOT NULL,
    director character varying(50),
    writer character varying(400),
    actors character varying(100),
    plot character varying(500),
    language character varying(50),
    country character varying(50),
    awards character varying(100),
    poster character varying(200) NOT NULL,
    metascore character varying(3),
    imdbrating numeric(3,1),
    imdbvotes character varying(10),
    imdbid character varying(15) NOT NULL,
    type character varying(10),
    dvd date,
    boxoffice character varying(15),
    production character varying(50),
    website character varying(50),
    response boolean,
    totalseasons integer
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    16803    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false            �            1259    16804    roles    TABLE     �   CREATE TABLE public.roles (
    id integer DEFAULT nextval('public.roles_id_seq'::regclass) NOT NULL,
    role character varying(30) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false    215            �            1259    16810    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false            �            1259    16811    users    TABLE     �  CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(200) NOT NULL,
    role integer NOT NULL,
    surname character varying NOT NULL,
    cf character varying(17) NOT NULL,
    birthdate date NOT NULL,
    disabled_at date,
    pass_reset boolean DEFAULT false NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    217                      0    16768    movies 
   TABLE DATA           �   COPY public.movies (title, year, rated, released, runtime, genre, director, writer, actors, plot, language, country, awards, poster, metascore, imdbrating, imdbvotes, imdbid, type, dvd, boxoffice, production, website, response, totalseasons) FROM stdin;
    public          postgres    false    214   )                 0    16804    roles 
   TABLE DATA           )   COPY public.roles (id, role) FROM stdin;
    public          postgres    false    216   RR                 0    16811    users 
   TABLE DATA           q   COPY public.users (id, name, email, password, role, surname, cf, birthdate, disabled_at, pass_reset) FROM stdin;
    public          postgres    false    218   �R                  0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    215                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 10, true);
          public          postgres    false    217            r           2606    16774    movies Movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "Movies_pkey" PRIMARY KEY (imdbid);
 >   ALTER TABLE ONLY public.movies DROP CONSTRAINT "Movies_pkey";
       public            postgres    false    214            v           2606    16850    users UNIQUE_CF 
   CONSTRAINT     J   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UNIQUE_CF" UNIQUE (cf);
 ;   ALTER TABLE ONLY public.users DROP CONSTRAINT "UNIQUE_CF";
       public            postgres    false    218            x           2606    16848    users UNIQUE_EMAIL 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UNIQUE_EMAIL" UNIQUE (email);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT "UNIQUE_EMAIL";
       public            postgres    false    218            t           2606    16809    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            {           2606    16846    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            y           1259    16844    fki_fk_users_roles    INDEX     D   CREATE INDEX fki_fk_users_roles ON public.users USING btree (role);
 &   DROP INDEX public.fki_fk_users_roles;
       public            postgres    false    218            |           2606    16839    users fk_users_roles    FK CONSTRAINT     z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_roles FOREIGN KEY (role) REFERENCES public.roles(id) NOT VALID;
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_users_roles;
       public          postgres    false    3188    218    216                  x��}Yr�X��7s�2��HkH��C�tINjrtI�3I+�0|"Ab``E~�j�]f���I����,�]��)���{��z��&�HI���~��q��ң_/D&�l̷�����>_��&�z�'z��7�Jĵ3?�XU�F/"΋T�J;�"��Y�"Un<�%q�����SzI8��"�b���DU>O�0��=�<Y�8�u�`�M�~��T�^������nz�(Q��$�jgJ$�L�J���\yN����a�B��)"Or�O���YfJ&r%)�_�x�4)�X,�<QF"��d�o�'�>�ҍ��CeދP�`4
ŉ��|�������5}��4�Ok�x�jA<�R�L�X(C���U�1rA�ν\d�>���t3�K�SE7LeЩ�3��P�.�����II�ϳ��-:��(�N�Z��3�K�D�Xd�9�9_�s��,�S�tW���\9��9���m�Zs{~��c|	���tؿ�1�,�1��ӿ��|Y���U�wg;������E������N��Z˨5O�5]mi-�g��\��a6jQ���8њ'Z����몮۪eh�u񿼦���6�W<�A�2�Z�ˉn�'Z��H�yy��g/O�xKU�I&��>U>{�XԜ$}^�F�ǐ��E���i�R>�)%/��|�xi�E���y�+#�1�O�"����\2�I<';|��va�K���o(��ꗣW��9ᛑ^��=!��P(���x�O'��t{e�� �^D����c�P/������p�|�0��'�t���`�t,b_���%���c�݅�����چ���76ݩ�:X���4��5m`\���9�����ao��:���Xn۷�vg�����V�4�j�^'X6ꦮ��Z&Ҁ�]���P(Rq�ħ���L��U�o!�/�x�(��x�w��vI+�����'t��F|��$�;:�xo����%W$�4��zed��[	�niBd�c>x�S�|�&�?��)Ym�b���U����
/���I�03���}���P�����p�wr�p'���moFȺ���h`tN:��y���l�L�lw�P�Uk�jD�ͦ�6�&Sc�aԵ5Z'�}b�D���bC5�P��^	H���5j$�yq�eD�}/���De� �8奴��TD�kN@,C�x.@�ʯY��K��j���wu�ڔ_��E��=��Y����A.�QI���ev���:T��'�	�V����[c%|Uzp����2�~la���2)�'/ω�}��<t�[�z����YͨPdlc�����L;�ۻ[4l�;�Ͻ�<&����x�m�w�H�#��)чj�&�a6&Ac�E“Ü>���-��^b��`T�pQ��쭡����o�8D�\��E�+�bD�x�a��Ωr	���K�w�3#�����j������§$����3#P��KZ�� 'v��/S1fL��	\~*�c8
!�Н�@
�~L�`�|ZҚ�?u�s�����v���_��(���Be��o��NHB��������]���sbQ�,h�{x�;N�i�����O謓,�_���ϸw����LЪ�� ��}/��u��^�0���/E,R�BE��IJby%t�Ѝ�s��eH�Q6t��� B�k*�"�0�h��OkP����J�V޺�~�v���tF��Y�Vڿ���@s�g��o�tC�6�'��7��T�:�5�#�k�{��m�+���A�b-�U���C�[�d��,����hO��3�����9����-5Qo���	����)Wy�������"�{ҵ�O&�>�_��$aq&�&��	d~@J��h/W�DeJ[��.)���^�t�ך���ݞc��!`z�!S~\ J�m��հ��q�6�ہ!���%!w��	n!�?�������)V�����}���O���E������?x�����+ƓX�}��t�K����a)/�e,�S*��to��9�>�x��B'��־�6	01s��O�,�<�ayw����t��E,Ueg�/r��ԛ�#϶wG�5�e�ά���d���aD�+���|ًh�����W�=x��'�syg�i��#w����rPmjM��V3����q��F��ڃ�+>����d��$oI�Ziw������&7�u٦�D���0��c�7����Tٞ�� ����G��B.8��e飮=��a&�6�z䔦Ч�O����A�����e�$��5 �?X��m�&N��d�����@�È�ي\��B�HmX�!�h��ۼrp�jz��$A�?!�u����r����{�|B����I�1�g�d�(��|8%�C����j_�:r�ßE�ϩ�ȃ?IHH�ގ*$5 �\ۉ��x�qCS�ɵy�q��V@b�4����F�U���)��^:K�3F�ܽ�{R���ȝ�r�7^�7�nol��yk���?
�g�n{�����Q�B&�R���Z�Ѭ�6�E��u�5�j��A;d"���VN�[&���!�Of�/Y/�����u�sCXQ:��x%���O�1�FV�9�鈞y?)IK��2"�3��΂pT�xXV<e�ςΝ��̛��bxe�k������g�8"""�� 	�B���EL�Al&q�/O�D~h���Za�D����?�z��`ᴯ_���<�u����|S�ԉ�,�M�f75��sK��#~ə����['d�:X�a��8�$�R�/�,�^���9p,��=P�kz!D���
�'O"E�i6�IO�@E��CԂ]������$�x#��Nm��uL^V�/���J߫�w��E��AA����N�
i�&"d�KEDk�DFt	ʷ����".$�E��ཥ�Q*�g�H@'�/$�e�!�+����Z�:�->���]�L�̃�F�~�֕�G��hک�؄qM��4�ǑX���`��6�՝q$VF�yj,�9pu�,ݶ����Ɖ��>4��j6LUӴ�h=������6n�^ӭ71[En���'b�H����=��f��Ꭰc��X���A�q\�l-�E4?!�ҁ=e�`EI���g�4q�4�-Fb��oT~e �Uy��$M�'b�=!Mm������d��'S�	)s�[�T�w�ǗB1��'�{#��p���{ �f7��)���{IƷ�9~d��^Ǽ����- #=�-׸�����!����rz�}��� �ض�Ph�-�26�,<:����[�@[m֛GQ�M+xcs�&'iD����f�+eآ=��vL�� -	N�
Bʓ�e��Z<?�_��A���<�<�|E/�ͩJƫ�e@�S�+ܺk�.]P�2/�26z�	���z��F�=|7u����w���N�q������;��j�5��[|�D�T�jꍦ�Dڴ������!�5�&9:�e���[�6�f$����l�@�1y��=���T�`�k�59 �%Iz�XG,!�_�%��2�D�'�*2��̟�lt��>�##���*�|�槂x�n�-Z�=|�y4�|��ޓij-wKgzF.�(�"�t9X pA�=6��G{xymz��>k뽒�`t{�hj�4u�Z�� ���k4q����a���P[���F��jUl�_K6�EV7��P�M�d~�Z�Y�a9�\��E =H7����	 �tX/h�b��"�X�H��� ��J�pYC0�a�l���bt<?�c�mD�}C�1J���D_s�)P�Ax�n�HO����xE��y�o2���J��_�;:���ۿ�=�BKB�ʷo��������>�������a���d53���1�yڬY�j-N6��z]�@@�`��hZj�l���)��]?Q3a�'�����w�$ʵ�D��r��8I�'@�a��� ���!���N�xd�o��J�UZ\r���ġe�;['�9"���`Wd�T�a�a�"$uc��1���%��N�f�Ӟ�cn�mwV���Lǋk�q�k.o�5��ߙ�\#e;M	^�5��OS"�8��A��"���A<�R�����<����EvT ֏� '���^��B2�`N�    ��=��v� }o��v�%��C�Qĕ��^���[	�NE��i�L6��M2�6�޵=�pCD����0����t���mO��������l\�^k���4M��Z[9��.8vQ����o�Wjm�J&���kƷ� y��-����K ?D<�"���L��M k�n? ���s�J9W}NV��iB4����,�I鈾=���:�F�-ӫ�?�-�;|\:���Q�>=[8=⼣���*�J\AfX�m[��� �(]�yK�.�hl8�� �}��Wb�I)��5X!��A�"97ĳ��S��9�@�nhs��,Tn�i�!��Q_,r��ŋ������]��W��"Œ�q�+�Ԕ\�0,r!��9.Z����i���Q�S���@��"�-b��$xʘn�8Gm$��Si+?��m���;F�������[��u�M
J�u`���E�L9#�;�+Af��հN�_��<��pV3�Y���{��q��4�-M�U7�@\��.l�>�MS�M[�tkOxU���v�E�zY势��P����TH��~�� ���Ry��84�=�ODNz�F�����'���Er��2�=��!���[�7�ִ��i	����(Z���o��=��`z1sz�l�̇��	��1.��'A����w�_BRG�nt3�1�G��"o��u��g�ǹ¬�]��a���4���14C>_�4j�> &I���	1�yb�5!7�\^߃G�z���!"R�Kije=��w������������I3��PK�p�B(�f�l���.�K��%D×I�1�D"���+'�x��<�L��~�r䲣�Sg��fy�7ӇD�{%G�L}�@��:�"$I|PG@���șk;��`�Ou��6�0�n��i��p,\]�����X��]a�.{�p�e���� N\ �|^����ķ�
�`��� �Z~��	G��$�[T8@	
=��Y�#ɯ��w���i|��܉�A���;�|���o��m?j$���6���l��Y׌5����W�����H�����ЋY5*�zxĠ��W^<S�V���n�Ûu��kҌ{��z'j$:��"㚿��s#��#8��I���>��N����w:��N*1�٢�got�H�0��L��>	w-�1��/���)d�78��Lx=ɇ-��*O����(7~{U��SRٖy���������U�=�ݾ;�\�o{3$��޿�����`�(~���G��15N����ji��7k?��~K�u��Ū�ͷd�!pv@��:"���=P2)��7Q�
�q'�r]����SĂ�t� ��A5��q�g�(��c���c�H�e�pL�=�	;�������b���e��������� N�ɪ-6qLlT�C�[��-9��X�T��	��S�[��T�Z�7��ΠI��~�N��R�XVCd��Ӂ�j3粳�퍑�����р��o:��#H�福�[�����"Ѵ�����{��!*�B?������n�x�!�*�E�����u ����RK. ֟#��YqUI���|��k�@*��D-g%c������X �y�e2~�-O�[�R��$O�4)HK���O�8)��s�Na��t���/K�?�����׸�8=��mߡa$�n��|2?$(�$��kT-����{9<�C²�H�Ύ"B�5-x�a4�u�W!q)K3���<��8�=��2�&C�I�I:y!���	*9Q/R�^)�	.'���OE�3���3�J��0�����^�=��Q"���a�� �[��rE�S�M���I#�(��d�$RM�8��#s��4dA�4O�X:'�U��$����#�\A�*�8�12?�L9r�M�"s�;�;"����҂�u(G��A�x+�a��L��٪�oS���}BkOg){�_���R�E��3�rK����c/y?6aB��SRp����3��ْ���c�@6�+��s��V,h2]	OV�g�3,T����ǟ'�yd��-��I�9�FO��y���.�{#���3_H��A�1�V�T͠�!��Y��Ƚt'��7 d��:W�&I�ZU��ړ�2��9��2���\�.���l5�X�DKSf�  ��u�خ2�6飳�J¡����x7�N	�Y��MLʧ0!$���G~<?��:Q�u�l�qǃ��8�m�5=UV\�@ݦ��.�/XТV��q���z�r�����lF��A:�aM^�Y����F�7���= J A͖N��*"�=h�yu1�R"E��C��qY|_i�%`L�s�ʃ�z\_�ՍYۯ��Z��ش�7�5=� X�E�M��H�֙v����h�V�MUc�M35K���^KԱ������f�u[�bI�"J�,A�*/��$`��:���U5vXDOE�cx݆�zI�љ��Y�'�Oqb&�j샣삳�)���Dw�1˸��I��x䣅�*K�pl��e�/[���@Y��"�[F��}.�X/\��ʾ�����ת��F����+�\�3�mT]8�GԊ�:�c�mOf��d�FSH�Cf:+�������G޶TXG���| G�������-]���o!����.W�~W>C� ������/@��d h�WyhȖo@��4����dF��O��$�HDd������JR?-^EV��Ċ�a,��6�4d`Q:�U�X���|M�?�]&3�Lf���������A�M�xz��ȍ��+c�%g�5��7���5a�0��mwlw�1����M����l5T��FD]۪Q�ct4uղ���&�.����x�"H���Y�w&^�߂;�.�qa��­:_���4q��y���*TNAM<86�9!��P1_ #�/� Idٚ�T�@�|�Q@ D܉aS��űc(̈��m�]�ĝ?�ue�ǽ/yu�04	��k��մ����9B4u�F���!M������MQ������Z���2����J[R�ҭ�@Ρ������NP�����lfUm��2��$�Oȱ��NP���C&1��t�R�U"���2?�"+�=!@Y�Q�i�|Vc]�M���(k�\����Ei��
V�������3%�j�O���[�rw�Y>l�	5ۍmgz$��Rx9,��	v�ZS��z�agX�ݙA6��>�zSm6�*��o�+�������u޴θ�Ե����W��,#��S����1�a�ܿt�	qW	:z�C����3]q3D���$YT��YRᣙ�1if"
;��2 Gp�u��Yf�u�6�g2��_��?̡���Ãu$�Z����@Ű��FS�wGr���;*�,�=���Q�#�_)`,�o��i���ٖ���~�������QO\��e$-����Y�lԞ�顀�*��$�]}�R������d3�+�1���_P�u}'OS��+�Ǝ���cW�]���+�K6�� ���]̅¼�c�b�c:���{v`��~5�n�9��eԵ��3,S�`��ٰԺ�M_��-]�%�<A���X	3�|sb^D��]U�w	I�;:~���5R�$�e��0ۻ������!��֥!����i#tn z�#+T�&�:	8)��d'd�,^?����'��^�d3BR+z����U��(�M��z�8�.|��>��y�����d�F7Q�1�ݕ���a4 ��<L\��dD���>8�c�v��Z�K�0���~1|ʖ��M����74Z�XV�y���jj�V밺@��8Mʳv�P�^�	�~�2�ɬRJxRF!�w0��#1�ǂw��[�ϩ�n8�=E��*
,�C�P�����k-�R}I6'*C����/B񄌐�ɛ�Pݡ�AJ�C�t(?,Fҍ�Q�"2��c�Pـ����~.Rv`���f����w���8�nBD5��m��Ƌ��ɇ���ۻ��g9���C#<�I��k�JBY�ڨ[<C��5��2�,g�����u�r�P�?�헚����Xm����T������a��=x�Ĕu�U���^x�~5-���%�    t^�!��;t�쫓�(c$�&�<YVFM�C����A*�#'�w7��.Yٓ��7�m\�$�g�H��oa���L�,��&�2r�	2�9F� �YF��[etr��/�4����������n�L��q:�W��/��j2�Ѱ��m��o���ָ ����������7�/������^��/��V/��0���θ�B�g�+Q4���W̌��%�M2˲�?�ҙX��i�洃k�W��<TX��`����nsb�w�u�c퉚��DW��/�-`6�#�16�՝�!֚�i�uC��rK���XK=S#�jZ�{���E�>#cd�x���9�x��Ɋ��*��Č�$8�Ǥ�j�98�)�^�D���!�zt��N6	CUNr�� �x���O:��Lp`�K$ʮ��Z��'��|��M�θ�����Ś�g���Iߍ�����m;�`�,�����=�tj�:k�+��É�;�\�~�Y������Qka���sR�A΀e�Qmq��!)k�fe��sV�����q���7�A�%&X�*%$��[s����B�Z^��ċ��/q���"��ba��Q���".�����#iN�G��RO�(l�:Hܰ�VI�Ë��T�Pi{h�Xf��}_ǵY
�u����X��A��z9 ����`5�o{��`:˝��٠��v�S�s92W��}��iX��������I���_���HЌ��z: ؆,�� Ӻ��ǅIB�Z��t �C,�D^VF&�E�f�!�Z�������vFȋ)n"nv�4�:h�~���k���W\ϳ%�5%2�8����T�`�b]d���L��P�z	u]������Бf�]N��`$�@D<&%*�Ҽ�"�_�A��i�6��
j����>V�
|�kr��r��lq�����;[��z���qg#�ս$	ݿ^"18�;���b:��$���`z\9��9s�~x!�-�+���f�Q���$�?�LU�Zj��S�eq
�~�e��v��t��$�j ��7i�oӍ�N�z�<ɚoTQ 1�(�A# ZTe�dY&��/��&���Y1fθ$ .	<"�0Lj��N\u���,�J�n�e�j��?{�DJ�o*;f!v�a�`c:/���1�*����G��,x������|��$��y�O���/�L��N����%� �8�B���)c蠉�Y��Z{N��h@.�v�c��?ٲ���k����`	L�{���#	��6aO�۪Ւ� �^�J�49�P�} �^���F}|���(�X�+)t6d�m� ��`Dxڷ&@����NnYexH��ƥ�L�|*��R/�0��|�A�\ � f|)����e�ѴO�'�+,� �� ����E1�p2*C
%����g����j2Y�S0�)�d[�:�_��"E��H<�7�D+ѳSy���,0�B��'��܃�jW�،kzO �m�&��yel;�,���v��;���a�<�dN��H$����;���b�a���(�[�i;��P�A7�� g{�����j��c�Qɮ2�h�Jy���~��x]C��q��a�)���s�R:���A��W�Ȟ�Y��w\,�-f$t�A��̛[2�	=���l�=3\
��(j"H兑2�a\���@�Q���	%�ŔC�x�=e,�����K�J���[�<f@�C
S����H���4�*Z�r69j�=.ܰ��C��׹{9����Kw��%��s�0���mv0����^	pK���'�vS5���ۄ%2���U����6S���\�e��������OF�/=;��U�zW�9�^��"��z�fw�zd��ޔ����2�;�J M��x�QQ$��<������?I����Lo��\���##����#gr���mrPv�Օ�M�b�>�x<�?�}<[�:��R�U]�`3���r�#��(�YJG����%�����g�"��)\�G�oy��k=[�]T��|Ù���>6�(����`T�v���!룍�����}���Z���}G�S�l���:��b������;���@h
7o�6N��ٍp~D���'�a�E<�0�����9S+K|�sV�&�Fx����c<M�v�IA�%�67�X`��h ��z�$���*eG�H6�%3!�6��7��D�aY�B�4��;�!/��{3�yLޤ�M�S�V`o��љ����g֑=�i�j��m��Uo5�f�XU��h��Q�-c�W��\E�/k�x�l$;�U2�y 1i���a����x��ʘ'ψ@�����z����!�s:�͆��`���I4{��C::J@Q@����A�"˒�PVpC��� {t}x+���䬃%s��T	cS�.��.��B2���W�W�G��A�"O%��zӴ�{��P�Qo�����[��A4Gx����>1��1e����)Qr����zX�	!J���GĩPh%#X�����#�]! ��u\�u��%2�B�71��HY�$�0 Y�.6�k�I��^<I9a�d�G��J�����Ka�]���+��H���H�O����1�1t��$�x��hD��
�策Q���L�|��y=z�xW��ʧ��˻���Td�{�m������cV�9l;���a��G�j�n���Þ-K�l�U�.�?t�4w���4�vK���nm3>B�/Z����f^�?襥N}� �~���j8#(9O�'�sYr"zq��Uk�"C61�@��'q����O��8�<�#�e�ܛ�>f������Ɣ�1e^yK�F��k���1K�z�����D'��HΊ.<����j�C!JT�1��.Hլ��:�si�Y��GJ��s!�e�'a@8��
��U ����('�=�r;[��&�b���a�4�ܙ�B�C�GFQ�����6]�y�:ڏl���[��T[-S֔5З��Æ.�ĩ���F�ا�V�ܓ�N����r@��:��w�Q����i%�*	�uP��f��&\�@���9�+�x3��K�7�x���12}�ohX�0�K��%gSo��L��y�T��OmD ���0�/����}�Qz<���j��Bl��t̆�dz2��5��ޞ�z�����񐷸"op�K.�}�m�#z��
� :��2v�a���r��P�:T��z^N�+�a�#������l�kc9�B}_�r��uq�8E�ҋΞ8Q�#�7�����|3��eӋ��8���6R����Q�P��|$*	��rzʄ���S%.IsF��d�>�eE��M�.������.Gq�C�����ca�3�qdd/�0H�����|�l֖֭���eh����H��;Ⱥ�F�0ő�M\�	�	����k�*�X������y��[��x���G�b�C��A��x���A��v��A��O��?NʖE��d�D|2�ri;�e�8�����v'��msU��Mxb>����(�,x~����WNsV~�8|��C>�z2Q��/RS0���>H6��Q�3Gٽ`?�I��7����Bl�Pd����Zwz�zV�j4'g躪7�j�	"��Z��	A������м����<�5�N����:"�~�(]�1����;4"GB�?���/�1�f�E	��30���L2��vl�P�� ���x2,]��2)�'2qd&��Y(<\�@ě�V�d�^�e3��)]�Q���S2��G��u��G�x��.��<��-�e���f&O��L9Rz�D���i�?<yGj�������!C�p�3�G���Z���G�&�m�j��H�$aۣ���fH�_�+-�nZ�������o.��$��ed�&�+2l�"���"���{�hq�_����%�pt�xS�E�3Q㹡n"�7�H-@��I��.���g�,��L씁�D� =*9p���3F��ok�*����{m��a��Vc���.�P��;&{P�h����e^����0}ͥEK���oD�g衔�ً���N��م{-p k]_��{�"cHޟc;S$m�C�G�\۷��ruШ� 
  Ag����A�Qg�t�h�9�,�D�J��*m6�u�+#E΃��k�j����v�>�>�*�wP_�����n���
ɳ#��w/�Y�PS���^�*Q������A5�,vB��p���ӊ�`D�p��d�ᅊ�8R�g�y��WnRE,"mZ@5�5��f���#��-Z����� �K�u,H���x桨6[��2Ն����Zs;��-[�6^R灷[((brBT<�L�S3��ĭ�F�Xڔ�2�(����@
N��Lh��*Sn�I�hA�_밙KP4���.�9�3�b�[Re>!8�ī�;Y�ƼH��BzftS���F�SȬĄ� �2�P6xE2�%Pu���X%�+�"g�rGy"a���K�1w[��[{ozbk�e������w1�a�M�I�`Rb�ca�<L<F_&��(t�}��>�����:Ӭ�����W��i���T��?�4-K5��N8�$&�h G!R��P�
�l��7�nʙ�=/���7��ݿP�B܀9/��%�i�'O�o�P>�S��r�K�C��2��;wz!�(��1b�َ��ⅳ%i�A��!��R��*�A��"�r���8��i���̆��ʁt�B��"��qB�W�.��OvƷ@����e��n|9���}@J(NIa�6�m^��wd�F��vg�^g4�@�n������9D�ku�iZGF7~0-S5��4��@�*�����&����+<uvӸ���ћY� $GV��M�Ve<Q�O��@8�k���+>��AX���J�@r�4@����X�)����%Cɀ�Ҩ��մ/�U�K�3�6�W7�V6��==냞пv>�:�� �;���Y�`��NZe�����\"���M�����Z��Uˮ��e�1��G��^��7��E>I��a�v���Yb���
�;F׶�h���PU�6|����i2Jxe1�Y���x���S9r1%顯��x(�[��0,"��%���sϛ�=��c�ie��z�N�Q�ʥ�]��<A<<�{1�x�;����sw
�KG
O�<�V3���y�{Z����O���|:Q���b�����|�q�N�ș���~4�����j�&��Ml��j���vN�7���Y`��"�2Ԗ�$������e�"=A4U�2��+�:���+S��,p��]��f�V#�ػ��ؚ۷�v���a�G^��yn��.C.��ZU�����iPq7�ֻm�z��ƹ!-H$J�jg��Bw&�#���.�����y���h�o�k+�a�N�,`䝒!����o"����~��V���c�����>�Z�?��8��[�
�[B�Yo4[��=$䃜)\38Zʉ��?ʮ�&{Z��_ۯK�zd>�H>�5��1��t�ț��aǐ Jd��d�UDi6�!���\ "�=�AB�nL���G�XX�)�� �h��M�t��a䈑yKv�T������;Q�I'R�|�?�ѣ�"�Bq/�sQF�puN��(��rݓ�J�i���|�p��2�3�e-�}/czA�jL�B�G:Ь�/��u,�i��U��sY�.���֋<�h'��[&��F���<�#y��O��{P��9�x��A�	ko�V-��N��Fj�K�w�C�O�6,�{&�kw�f7��d�^�? �{O��j��R�s$�$��/r�^��sk�J9��n��ۛ�l�RO�����jF+��$G�y��"m�8�o^'42���E��F)o�[�w7���y����n��5�^����C8é�Ė��)�#1�Vw��q�5�ӻ{uWH�L�nh����h��l��a<�|�C��-��W��W����9-�G�%}/���C�����^�%r�K�����\y���b{���(㲩(gQϫ�F.��J���8A5�a��&�2ʜ#^��q
!���^n�*+�������""Aw9:E"�6�ycX;{6晴آ��fÝ^c�N��6ZW��n����hxyv�wv�k�!g:���k�m���`����75ދ�j5�iY�=����� `	�n         (   x�3�LL����2�,(M��L�2�,.-H-����qqq �O
�         �  x�e��r�@���s����Q���d��A��1��љ�I�n��}�չ��������<���\��*�q<Dpx]9'�]���.����|�������LQE�s6K�^x��+�O��`A�BN��E�� �(A�x�@6���+��-�c]��},�ƞg�˕�|-9Y�^2�;���&>�dsz<�C
۬4ag.��!��@Ș��xJ ���:�t��] �R���eqn�_��j��Z��y�+���Ʒd���V(]-EOs5�/�ҙŶ��z&>a pxh� rk� ��@�:�mi]k�]�]n�6*�B�K���O'��5ǝXN�Gi��u7�2��R���K߁���{`FhS���������F�<,@���g|�\V��5y�5�En���[��:�μ�l�ja�u���2MR@�@�x?��v ��`0���     