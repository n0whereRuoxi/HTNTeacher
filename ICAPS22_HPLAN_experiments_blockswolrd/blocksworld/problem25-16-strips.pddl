( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b120 - block
    b319 - block
    b233 - block
    b898 - block
    b263 - block
    b804 - block
    b247 - block
    b240 - block
    b231 - block
    b648 - block
    b446 - block
    b388 - block
    b733 - block
    b448 - block
    b107 - block
    b766 - block
    b329 - block
    b363 - block
    b180 - block
    b77 - block
    b806 - block
    b209 - block
    b244 - block
    b442 - block
    b932 - block
    b356 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b120 )
    ( on b319 b120 )
    ( on b233 b319 )
    ( on b898 b233 )
    ( on b263 b898 )
    ( on b804 b263 )
    ( on b247 b804 )
    ( on b240 b247 )
    ( on b231 b240 )
    ( on b648 b231 )
    ( on b446 b648 )
    ( on b388 b446 )
    ( on b733 b388 )
    ( on b448 b733 )
    ( on b107 b448 )
    ( on b766 b107 )
    ( on b329 b766 )
    ( on b363 b329 )
    ( on b180 b363 )
    ( on b77 b180 )
    ( on b806 b77 )
    ( on b209 b806 )
    ( on b244 b209 )
    ( on b442 b244 )
    ( on b932 b442 )
    ( on b356 b932 )
    ( clear b356 )
  )
  ( :goal
    ( and
      ( clear b120 )
    )
  )
)
