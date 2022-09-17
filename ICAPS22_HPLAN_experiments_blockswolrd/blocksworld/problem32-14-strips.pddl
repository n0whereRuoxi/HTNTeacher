( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b185 - block
    b470 - block
    b469 - block
    b267 - block
    b633 - block
    b425 - block
    b334 - block
    b882 - block
    b858 - block
    b656 - block
    b569 - block
    b729 - block
    b271 - block
    b956 - block
    b383 - block
    b660 - block
    b842 - block
    b212 - block
    b553 - block
    b331 - block
    b878 - block
    b995 - block
    b692 - block
    b778 - block
    b320 - block
    b775 - block
    b96 - block
    b509 - block
    b964 - block
    b685 - block
    b752 - block
    b304 - block
    b732 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b185 )
    ( on b470 b185 )
    ( on b469 b470 )
    ( on b267 b469 )
    ( on b633 b267 )
    ( on b425 b633 )
    ( on b334 b425 )
    ( on b882 b334 )
    ( on b858 b882 )
    ( on b656 b858 )
    ( on b569 b656 )
    ( on b729 b569 )
    ( on b271 b729 )
    ( on b956 b271 )
    ( on b383 b956 )
    ( on b660 b383 )
    ( on b842 b660 )
    ( on b212 b842 )
    ( on b553 b212 )
    ( on b331 b553 )
    ( on b878 b331 )
    ( on b995 b878 )
    ( on b692 b995 )
    ( on b778 b692 )
    ( on b320 b778 )
    ( on b775 b320 )
    ( on b96 b775 )
    ( on b509 b96 )
    ( on b964 b509 )
    ( on b685 b964 )
    ( on b752 b685 )
    ( on b304 b752 )
    ( on b732 b304 )
    ( clear b732 )
  )
  ( :goal
    ( and
      ( clear b185 )
    )
  )
)
