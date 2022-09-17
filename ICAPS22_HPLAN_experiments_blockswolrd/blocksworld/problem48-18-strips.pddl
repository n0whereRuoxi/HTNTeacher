( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b279 - block
    b403 - block
    b241 - block
    b635 - block
    b888 - block
    b699 - block
    b450 - block
    b931 - block
    b61 - block
    b828 - block
    b918 - block
    b738 - block
    b414 - block
    b645 - block
    b464 - block
    b827 - block
    b138 - block
    b881 - block
    b755 - block
    b585 - block
    b382 - block
    b398 - block
    b856 - block
    b583 - block
    b927 - block
    b537 - block
    b693 - block
    b591 - block
    b789 - block
    b203 - block
    b206 - block
    b906 - block
    b831 - block
    b246 - block
    b363 - block
    b104 - block
    b495 - block
    b281 - block
    b753 - block
    b945 - block
    b878 - block
    b427 - block
    b858 - block
    b139 - block
    b10 - block
    b421 - block
    b401 - block
    b451 - block
    b197 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b279 )
    ( on b403 b279 )
    ( on b241 b403 )
    ( on b635 b241 )
    ( on b888 b635 )
    ( on b699 b888 )
    ( on b450 b699 )
    ( on b931 b450 )
    ( on b61 b931 )
    ( on b828 b61 )
    ( on b918 b828 )
    ( on b738 b918 )
    ( on b414 b738 )
    ( on b645 b414 )
    ( on b464 b645 )
    ( on b827 b464 )
    ( on b138 b827 )
    ( on b881 b138 )
    ( on b755 b881 )
    ( on b585 b755 )
    ( on b382 b585 )
    ( on b398 b382 )
    ( on b856 b398 )
    ( on b583 b856 )
    ( on b927 b583 )
    ( on b537 b927 )
    ( on b693 b537 )
    ( on b591 b693 )
    ( on b789 b591 )
    ( on b203 b789 )
    ( on b206 b203 )
    ( on b906 b206 )
    ( on b831 b906 )
    ( on b246 b831 )
    ( on b363 b246 )
    ( on b104 b363 )
    ( on b495 b104 )
    ( on b281 b495 )
    ( on b753 b281 )
    ( on b945 b753 )
    ( on b878 b945 )
    ( on b427 b878 )
    ( on b858 b427 )
    ( on b139 b858 )
    ( on b10 b139 )
    ( on b421 b10 )
    ( on b401 b421 )
    ( on b451 b401 )
    ( on b197 b451 )
    ( clear b197 )
  )
  ( :goal
    ( and
      ( clear b279 )
    )
  )
)
