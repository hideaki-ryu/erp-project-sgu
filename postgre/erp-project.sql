PGDMP     .    &                z            erp-project-clean    13.4    13.4 [    -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            0           1262    35752    erp-project-clean    DATABASE     s   CREATE DATABASE "erp-project-clean" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';
 #   DROP DATABASE "erp-project-clean";
                postgres    false            �            1259    35818    batches    TABLE     L  CREATE TABLE public.batches (
    batch_id integer NOT NULL,
    material_id integer NOT NULL,
    supplier_id integer NOT NULL,
    purchase_qty real NOT NULL,
    current_qty real NOT NULL,
    price_per_unit integer NOT NULL,
    purchase_price integer NOT NULL,
    purchase_date date NOT NULL,
    expiry_date date NOT NULL
);
    DROP TABLE public.batches;
       public         heap    postgres    false            �            1259    35816    batches_batch_id_seq    SEQUENCE     �   CREATE SEQUENCE public.batches_batch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.batches_batch_id_seq;
       public          postgres    false    210            1           0    0    batches_batch_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.batches_batch_id_seq OWNED BY public.batches.batch_id;
          public          postgres    false    209            �            1259    35763    business    TABLE     �   CREATE TABLE public.business (
    business_id integer NOT NULL,
    user_id character varying(21) NOT NULL,
    name character varying(30),
    address character varying(250)
);
    DROP TABLE public.business;
       public         heap    postgres    false            �            1259    35761    business_business_id_seq    SEQUENCE     �   CREATE SEQUENCE public.business_business_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.business_business_id_seq;
       public          postgres    false    202            2           0    0    business_business_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.business_business_id_seq OWNED BY public.business.business_id;
          public          postgres    false    201            �            1259    35886    in_use_batch    TABLE     �   CREATE TABLE public.in_use_batch (
    product_batch_id integer NOT NULL,
    material_batch_id integer NOT NULL,
    qty real NOT NULL
);
     DROP TABLE public.in_use_batch;
       public         heap    postgres    false            �            1259    35784    material    TABLE     �   CREATE TABLE public.material (
    material_id integer NOT NULL,
    business_id integer NOT NULL,
    measurement_id integer NOT NULL,
    name character varying NOT NULL,
    safety_stock_qty real
);
    DROP TABLE public.material;
       public         heap    postgres    false            �            1259    35782    material_material_id_seq    SEQUENCE     �   CREATE SEQUENCE public.material_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.material_material_id_seq;
       public          postgres    false    206            3           0    0    material_material_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.material_material_id_seq OWNED BY public.material.material_id;
          public          postgres    false    205            �            1259    35776    measurement    TABLE     r   CREATE TABLE public.measurement (
    measurement_id integer NOT NULL,
    name character varying(10) NOT NULL
);
    DROP TABLE public.measurement;
       public         heap    postgres    false            �            1259    35774    measurement_measurement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.measurement_measurement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.measurement_measurement_id_seq;
       public          postgres    false    204            4           0    0    measurement_measurement_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.measurement_measurement_id_seq OWNED BY public.measurement.measurement_id;
          public          postgres    false    203            �            1259    35903    order    TABLE     �   CREATE TABLE public."order" (
    order_id integer NOT NULL,
    business_id integer NOT NULL,
    order_date date NOT NULL,
    client_name character varying
);
    DROP TABLE public."order";
       public         heap    postgres    false            �            1259    35901    order_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_order_id_seq;
       public          postgres    false    218            5           0    0    order_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;
          public          postgres    false    217            �            1259    35919    order_product    TABLE     �   CREATE TABLE public.order_product (
    order_product_id integer NOT NULL,
    order_id integer NOT NULL,
    product_name character varying NOT NULL,
    product_price real NOT NULL,
    qty integer NOT NULL
);
 !   DROP TABLE public.order_product;
       public         heap    postgres    false            �            1259    35917 "   order_product_order_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_product_order_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.order_product_order_product_id_seq;
       public          postgres    false    220            6           0    0 "   order_product_order_product_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.order_product_order_product_id_seq OWNED BY public.order_product.order_product_id;
          public          postgres    false    219            �            1259    35836    product    TABLE     �   CREATE TABLE public.product (
    product_id integer NOT NULL,
    business_id integer NOT NULL,
    name character varying NOT NULL,
    price real NOT NULL,
    production_process character varying
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    35872    product_batches    TABLE     �   CREATE TABLE public.product_batches (
    product_batch_id integer NOT NULL,
    product_id integer NOT NULL,
    production_date date NOT NULL,
    expiry_date date NOT NULL,
    qty integer NOT NULL,
    status character varying NOT NULL
);
 #   DROP TABLE public.product_batches;
       public         heap    postgres    false            �            1259    35870 $   product_batches_product_batch_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_batches_product_batch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.product_batches_product_batch_id_seq;
       public          postgres    false    215            7           0    0 $   product_batches_product_batch_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.product_batches_product_batch_id_seq OWNED BY public.product_batches.product_batch_id;
          public          postgres    false    214            �            1259    35850    product_material    TABLE     �   CREATE TABLE public.product_material (
    product_id integer NOT NULL,
    material_id integer NOT NULL,
    measurement_id integer NOT NULL,
    qty real NOT NULL
);
 $   DROP TABLE public.product_material;
       public         heap    postgres    false            �            1259    35834    product_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.product_product_id_seq;
       public          postgres    false    212            8           0    0    product_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;
          public          postgres    false    211            �            1259    35805    supplier    TABLE     �   CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    business_id integer NOT NULL,
    name character varying(30) NOT NULL,
    address character varying(250),
    telp character varying(13)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false            �            1259    35803    supplier_supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.supplier_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.supplier_supplier_id_seq;
       public          postgres    false    208            9           0    0    supplier_supplier_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;
          public          postgres    false    207            �            1259    35753    users    TABLE     �   CREATE TABLE public.users (
    user_id character varying(21) NOT NULL,
    email character varying NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    profile_picture character varying(200)
);
    DROP TABLE public.users;
       public         heap    postgres    false            h           2604    35821    batches batch_id    DEFAULT     t   ALTER TABLE ONLY public.batches ALTER COLUMN batch_id SET DEFAULT nextval('public.batches_batch_id_seq'::regclass);
 ?   ALTER TABLE public.batches ALTER COLUMN batch_id DROP DEFAULT;
       public          postgres    false    210    209    210            d           2604    35766    business business_id    DEFAULT     |   ALTER TABLE ONLY public.business ALTER COLUMN business_id SET DEFAULT nextval('public.business_business_id_seq'::regclass);
 C   ALTER TABLE public.business ALTER COLUMN business_id DROP DEFAULT;
       public          postgres    false    201    202    202            f           2604    35787    material material_id    DEFAULT     |   ALTER TABLE ONLY public.material ALTER COLUMN material_id SET DEFAULT nextval('public.material_material_id_seq'::regclass);
 C   ALTER TABLE public.material ALTER COLUMN material_id DROP DEFAULT;
       public          postgres    false    205    206    206            e           2604    35779    measurement measurement_id    DEFAULT     �   ALTER TABLE ONLY public.measurement ALTER COLUMN measurement_id SET DEFAULT nextval('public.measurement_measurement_id_seq'::regclass);
 I   ALTER TABLE public.measurement ALTER COLUMN measurement_id DROP DEFAULT;
       public          postgres    false    203    204    204            k           2604    35906    order order_id    DEFAULT     r   ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);
 ?   ALTER TABLE public."order" ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    218    217    218            l           2604    35922    order_product order_product_id    DEFAULT     �   ALTER TABLE ONLY public.order_product ALTER COLUMN order_product_id SET DEFAULT nextval('public.order_product_order_product_id_seq'::regclass);
 M   ALTER TABLE public.order_product ALTER COLUMN order_product_id DROP DEFAULT;
       public          postgres    false    220    219    220            i           2604    35839    product product_id    DEFAULT     x   ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);
 A   ALTER TABLE public.product ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    211    212    212            j           2604    35875     product_batches product_batch_id    DEFAULT     �   ALTER TABLE ONLY public.product_batches ALTER COLUMN product_batch_id SET DEFAULT nextval('public.product_batches_product_batch_id_seq'::regclass);
 O   ALTER TABLE public.product_batches ALTER COLUMN product_batch_id DROP DEFAULT;
       public          postgres    false    215    214    215            g           2604    35808    supplier supplier_id    DEFAULT     |   ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_supplier_id_seq'::regclass);
 C   ALTER TABLE public.supplier ALTER COLUMN supplier_id DROP DEFAULT;
       public          postgres    false    207    208    208                       0    35818    batches 
   TABLE DATA           �   COPY public.batches (batch_id, material_id, supplier_id, purchase_qty, current_qty, price_per_unit, purchase_price, purchase_date, expiry_date) FROM stdin;
    public          postgres    false    210   <o                 0    35763    business 
   TABLE DATA           G   COPY public.business (business_id, user_id, name, address) FROM stdin;
    public          postgres    false    202   Yo       &          0    35886    in_use_batch 
   TABLE DATA           P   COPY public.in_use_batch (product_batch_id, material_batch_id, qty) FROM stdin;
    public          postgres    false    216   vo                 0    35784    material 
   TABLE DATA           d   COPY public.material (material_id, business_id, measurement_id, name, safety_stock_qty) FROM stdin;
    public          postgres    false    206   �o                 0    35776    measurement 
   TABLE DATA           ;   COPY public.measurement (measurement_id, name) FROM stdin;
    public          postgres    false    204   �o       (          0    35903    order 
   TABLE DATA           Q   COPY public."order" (order_id, business_id, order_date, client_name) FROM stdin;
    public          postgres    false    218   �o       *          0    35919    order_product 
   TABLE DATA           e   COPY public.order_product (order_product_id, order_id, product_name, product_price, qty) FROM stdin;
    public          postgres    false    220   �o       "          0    35836    product 
   TABLE DATA           [   COPY public.product (product_id, business_id, name, price, production_process) FROM stdin;
    public          postgres    false    212   p       %          0    35872    product_batches 
   TABLE DATA           r   COPY public.product_batches (product_batch_id, product_id, production_date, expiry_date, qty, status) FROM stdin;
    public          postgres    false    215   7p       #          0    35850    product_material 
   TABLE DATA           X   COPY public.product_material (product_id, material_id, measurement_id, qty) FROM stdin;
    public          postgres    false    213   Tp                 0    35805    supplier 
   TABLE DATA           Q   COPY public.supplier (supplier_id, business_id, name, address, telp) FROM stdin;
    public          postgres    false    208   qp                 0    35753    users 
   TABLE DATA           U   COPY public.users (user_id, email, firstname, lastname, profile_picture) FROM stdin;
    public          postgres    false    200   �p       :           0    0    batches_batch_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.batches_batch_id_seq', 1, false);
          public          postgres    false    209            ;           0    0    business_business_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.business_business_id_seq', 1, false);
          public          postgres    false    201            <           0    0    material_material_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.material_material_id_seq', 1, false);
          public          postgres    false    205            =           0    0    measurement_measurement_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.measurement_measurement_id_seq', 4, true);
          public          postgres    false    203            >           0    0    order_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);
          public          postgres    false    217            ?           0    0 "   order_product_order_product_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.order_product_order_product_id_seq', 1, false);
          public          postgres    false    219            @           0    0 $   product_batches_product_batch_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.product_batches_product_batch_id_seq', 1, false);
          public          postgres    false    214            A           0    0    product_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);
          public          postgres    false    211            B           0    0    supplier_supplier_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 1, false);
          public          postgres    false    207            x           2606    35823    batches batches_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.batches
    ADD CONSTRAINT batches_pkey PRIMARY KEY (batch_id);
 >   ALTER TABLE ONLY public.batches DROP CONSTRAINT batches_pkey;
       public            postgres    false    210            p           2606    35768    business business_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (business_id);
 @   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pkey;
       public            postgres    false    202            �           2606    35890    in_use_batch in_use_batch_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.in_use_batch
    ADD CONSTRAINT in_use_batch_pkey PRIMARY KEY (product_batch_id, material_batch_id);
 H   ALTER TABLE ONLY public.in_use_batch DROP CONSTRAINT in_use_batch_pkey;
       public            postgres    false    216    216            t           2606    35792    material material_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (material_id);
 @   ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
       public            postgres    false    206            r           2606    35781    measurement measurement_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT measurement_pkey PRIMARY KEY (measurement_id);
 F   ALTER TABLE ONLY public.measurement DROP CONSTRAINT measurement_pkey;
       public            postgres    false    204            �           2606    35911    order order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public            postgres    false    218            �           2606    35927     order_product order_product_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (order_product_id);
 J   ALTER TABLE ONLY public.order_product DROP CONSTRAINT order_product_pkey;
       public            postgres    false    220            ~           2606    35880 $   product_batches product_batches_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.product_batches
    ADD CONSTRAINT product_batches_pkey PRIMARY KEY (product_batch_id);
 N   ALTER TABLE ONLY public.product_batches DROP CONSTRAINT product_batches_pkey;
       public            postgres    false    215            |           2606    35854 &   product_material product_material_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.product_material
    ADD CONSTRAINT product_material_pkey PRIMARY KEY (product_id, material_id);
 P   ALTER TABLE ONLY public.product_material DROP CONSTRAINT product_material_pkey;
       public            postgres    false    213    213            z           2606    35844    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    212            v           2606    35810    supplier supplier_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    208            n           2606    35760    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    200            �           2606    35793    material fk_business    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT fk_business FOREIGN KEY (business_id) REFERENCES public.business(business_id);
 >   ALTER TABLE ONLY public.material DROP CONSTRAINT fk_business;
       public          postgres    false    206    2928    202            �           2606    35811    supplier fk_business    FK CONSTRAINT     �   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT fk_business FOREIGN KEY (business_id) REFERENCES public.business(business_id);
 >   ALTER TABLE ONLY public.supplier DROP CONSTRAINT fk_business;
       public          postgres    false    208    202    2928            �           2606    35845    product fk_business    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_business FOREIGN KEY (business_id) REFERENCES public.business(business_id);
 =   ALTER TABLE ONLY public.product DROP CONSTRAINT fk_business;
       public          postgres    false    2928    212    202            �           2606    35912    order fk_business    FK CONSTRAINT     �   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT fk_business FOREIGN KEY (business_id) REFERENCES public.business(business_id);
 =   ALTER TABLE ONLY public."order" DROP CONSTRAINT fk_business;
       public          postgres    false    2928    202    218            �           2606    35824    batches fk_material    FK CONSTRAINT     �   ALTER TABLE ONLY public.batches
    ADD CONSTRAINT fk_material FOREIGN KEY (material_id) REFERENCES public.material(material_id);
 =   ALTER TABLE ONLY public.batches DROP CONSTRAINT fk_material;
       public          postgres    false    2932    206    210            �           2606    35860    product_material fk_material    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_material
    ADD CONSTRAINT fk_material FOREIGN KEY (material_id) REFERENCES public.material(material_id);
 F   ALTER TABLE ONLY public.product_material DROP CONSTRAINT fk_material;
       public          postgres    false    206    213    2932            �           2606    35896 !   in_use_batch fk_material_batch_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.in_use_batch
    ADD CONSTRAINT fk_material_batch_id FOREIGN KEY (material_batch_id) REFERENCES public.batches(batch_id);
 K   ALTER TABLE ONLY public.in_use_batch DROP CONSTRAINT fk_material_batch_id;
       public          postgres    false    216    2936    210            �           2606    35798    material fk_measurement    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT fk_measurement FOREIGN KEY (measurement_id) REFERENCES public.measurement(measurement_id);
 A   ALTER TABLE ONLY public.material DROP CONSTRAINT fk_measurement;
       public          postgres    false    2930    206    204            �           2606    35865    product_material fk_measurement    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_material
    ADD CONSTRAINT fk_measurement FOREIGN KEY (measurement_id) REFERENCES public.measurement(measurement_id);
 I   ALTER TABLE ONLY public.product_material DROP CONSTRAINT fk_measurement;
       public          postgres    false    204    213    2930            �           2606    35928    order_product fk_order    FK CONSTRAINT     ~   ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES public."order"(order_id);
 @   ALTER TABLE ONLY public.order_product DROP CONSTRAINT fk_order;
       public          postgres    false    2946    218    220            �           2606    35855    product_material fk_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_material
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 E   ALTER TABLE ONLY public.product_material DROP CONSTRAINT fk_product;
       public          postgres    false    212    2938    213            �           2606    35891     in_use_batch fk_product_batch_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.in_use_batch
    ADD CONSTRAINT fk_product_batch_id FOREIGN KEY (product_batch_id) REFERENCES public.product_batches(product_batch_id);
 J   ALTER TABLE ONLY public.in_use_batch DROP CONSTRAINT fk_product_batch_id;
       public          postgres    false    216    2942    215            �           2606    35881    product_batches fk_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_batches
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 G   ALTER TABLE ONLY public.product_batches DROP CONSTRAINT fk_product_id;
       public          postgres    false    212    2938    215            �           2606    35829    batches fk_supplier    FK CONSTRAINT     �   ALTER TABLE ONLY public.batches
    ADD CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 =   ALTER TABLE ONLY public.batches DROP CONSTRAINT fk_supplier;
       public          postgres    false    208    210    2934            �           2606    35769    business fk_user    FK CONSTRAINT     t   ALTER TABLE ONLY public.business
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 :   ALTER TABLE ONLY public.business DROP CONSTRAINT fk_user;
       public          postgres    false    202    2926    200                   x������ � �            x������ � �      &      x������ � �            x������ � �             x�3��N�2�L/�2���2�������� =��      (      x������ � �      *      x������ � �      "      x������ � �      %      x������ � �      #      x������ � �            x������ � �            x������ � �     