( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b931 - block
    b182 - block
    b439 - block
    b880 - block
    b499 - block
    b229 - block
    b216 - block
    b816 - block
    b884 - block
    b830 - block
    b727 - block
    b763 - block
    b691 - block
    b982 - block
    b211 - block
    b301 - block
    b972 - block
    b130 - block
    b960 - block
    b11 - block
    b843 - block
    b800 - block
    b864 - block
    b268 - block
    b976 - block
    b926 - block
    b230 - block
    b451 - block
    b431 - block
    b392 - block
    b34 - block
    b899 - block
    b465 - block
    b755 - block
    b738 - block
    b895 - block
    b47 - block
    b119 - block
    b977 - block
    b517 - block
    b781 - block
    b889 - block
    b231 - block
    b862 - block
    b808 - block
    b949 - block
    b697 - block
    b934 - block
    b944 - block
    b672 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b931 )
    ( on b182 b931 )
    ( on b439 b182 )
    ( on b880 b439 )
    ( on b499 b880 )
    ( on b229 b499 )
    ( on b216 b229 )
    ( on b816 b216 )
    ( on b884 b816 )
    ( on b830 b884 )
    ( on b727 b830 )
    ( on b763 b727 )
    ( on b691 b763 )
    ( on b982 b691 )
    ( on b211 b982 )
    ( on b301 b211 )
    ( on b972 b301 )
    ( on b130 b972 )
    ( on b960 b130 )
    ( on b11 b960 )
    ( on b843 b11 )
    ( on b800 b843 )
    ( on b864 b800 )
    ( on b268 b864 )
    ( on b976 b268 )
    ( on b926 b976 )
    ( on b230 b926 )
    ( on b451 b230 )
    ( on b431 b451 )
    ( on b392 b431 )
    ( on b34 b392 )
    ( on b899 b34 )
    ( on b465 b899 )
    ( on b755 b465 )
    ( on b738 b755 )
    ( on b895 b738 )
    ( on b47 b895 )
    ( on b119 b47 )
    ( on b977 b119 )
    ( on b517 b977 )
    ( on b781 b517 )
    ( on b889 b781 )
    ( on b231 b889 )
    ( on b862 b231 )
    ( on b808 b862 )
    ( on b949 b808 )
    ( on b697 b949 )
    ( on b934 b697 )
    ( on b944 b934 )
    ( on b672 b944 )
    ( clear b672 )
  )
  ( :goal
    ( and
      ( clear b931 )
    )
  )
)
