( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b83 - block
    b256 - block
    b483 - block
    b997 - block
    b241 - block
    b206 - block
    b808 - block
    b372 - block
    b303 - block
    b796 - block
    b97 - block
    b785 - block
    b96 - block
    b888 - block
    b780 - block
    b942 - block
    b226 - block
    b173 - block
    b174 - block
    b760 - block
    b35 - block
    b116 - block
    b393 - block
    b764 - block
    b598 - block
    b812 - block
    b645 - block
    b70 - block
    b735 - block
    b431 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b256 b83 )
    ( on b483 b256 )
    ( on b997 b483 )
    ( on b241 b997 )
    ( on b206 b241 )
    ( on b808 b206 )
    ( on b372 b808 )
    ( on b303 b372 )
    ( on b796 b303 )
    ( on b97 b796 )
    ( on b785 b97 )
    ( on b96 b785 )
    ( on b888 b96 )
    ( on b780 b888 )
    ( on b942 b780 )
    ( on b226 b942 )
    ( on b173 b226 )
    ( on b174 b173 )
    ( on b760 b174 )
    ( on b35 b760 )
    ( on b116 b35 )
    ( on b393 b116 )
    ( on b764 b393 )
    ( on b598 b764 )
    ( on b812 b598 )
    ( on b645 b812 )
    ( on b70 b645 )
    ( on b735 b70 )
    ( on b431 b735 )
    ( clear b431 )
  )
  ( :tasks
    ( Make-29Pile b256 b483 b997 b241 b206 b808 b372 b303 b796 b97 b785 b96 b888 b780 b942 b226 b173 b174 b760 b35 b116 b393 b764 b598 b812 b645 b70 b735 b431 )
  )
)
