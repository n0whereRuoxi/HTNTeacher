( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b558 - block
    b876 - block
    b783 - block
    b586 - block
    b301 - block
    b8 - block
    b245 - block
    b373 - block
    b899 - block
    b206 - block
    b58 - block
    b603 - block
    b434 - block
    b847 - block
    b156 - block
    b46 - block
    b323 - block
    b758 - block
    b582 - block
    b577 - block
    b870 - block
    b431 - block
    b818 - block
    b275 - block
    b853 - block
    b176 - block
    b690 - block
    b933 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b558 )
    ( on b876 b558 )
    ( on b783 b876 )
    ( on b586 b783 )
    ( on b301 b586 )
    ( on b8 b301 )
    ( on b245 b8 )
    ( on b373 b245 )
    ( on b899 b373 )
    ( on b206 b899 )
    ( on b58 b206 )
    ( on b603 b58 )
    ( on b434 b603 )
    ( on b847 b434 )
    ( on b156 b847 )
    ( on b46 b156 )
    ( on b323 b46 )
    ( on b758 b323 )
    ( on b582 b758 )
    ( on b577 b582 )
    ( on b870 b577 )
    ( on b431 b870 )
    ( on b818 b431 )
    ( on b275 b818 )
    ( on b853 b275 )
    ( on b176 b853 )
    ( on b690 b176 )
    ( on b933 b690 )
    ( clear b933 )
  )
  ( :tasks
    ( Make-27Pile b876 b783 b586 b301 b8 b245 b373 b899 b206 b58 b603 b434 b847 b156 b46 b323 b758 b582 b577 b870 b431 b818 b275 b853 b176 b690 b933 )
  )
)
