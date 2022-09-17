( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b438 - block
    b519 - block
    b116 - block
    b426 - block
    b16 - block
    b714 - block
    b940 - block
    b948 - block
    b10 - block
    b672 - block
    b697 - block
    b281 - block
    b203 - block
    b910 - block
    b303 - block
    b630 - block
    b448 - block
    b785 - block
    b799 - block
    b764 - block
    b602 - block
    b425 - block
    b971 - block
    b936 - block
    b289 - block
    b189 - block
    b824 - block
    b372 - block
    b967 - block
    b802 - block
    b277 - block
    b604 - block
    b568 - block
    b699 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b438 )
    ( on b519 b438 )
    ( on b116 b519 )
    ( on b426 b116 )
    ( on b16 b426 )
    ( on b714 b16 )
    ( on b940 b714 )
    ( on b948 b940 )
    ( on b10 b948 )
    ( on b672 b10 )
    ( on b697 b672 )
    ( on b281 b697 )
    ( on b203 b281 )
    ( on b910 b203 )
    ( on b303 b910 )
    ( on b630 b303 )
    ( on b448 b630 )
    ( on b785 b448 )
    ( on b799 b785 )
    ( on b764 b799 )
    ( on b602 b764 )
    ( on b425 b602 )
    ( on b971 b425 )
    ( on b936 b971 )
    ( on b289 b936 )
    ( on b189 b289 )
    ( on b824 b189 )
    ( on b372 b824 )
    ( on b967 b372 )
    ( on b802 b967 )
    ( on b277 b802 )
    ( on b604 b277 )
    ( on b568 b604 )
    ( on b699 b568 )
    ( on b721 b699 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b438 )
    )
  )
)
