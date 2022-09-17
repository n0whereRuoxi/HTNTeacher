( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b65 - block
    b37 - block
    b280 - block
    b716 - block
    b196 - block
    b883 - block
    b655 - block
    b544 - block
    b884 - block
    b935 - block
    b433 - block
    b711 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b65 )
    ( on b37 b65 )
    ( on b280 b37 )
    ( on b716 b280 )
    ( on b196 b716 )
    ( on b883 b196 )
    ( on b655 b883 )
    ( on b544 b655 )
    ( on b884 b544 )
    ( on b935 b884 )
    ( on b433 b935 )
    ( on b711 b433 )
    ( clear b711 )
  )
  ( :tasks
    ( Make-11Pile b37 b280 b716 b196 b883 b655 b544 b884 b935 b433 b711 )
  )
)
