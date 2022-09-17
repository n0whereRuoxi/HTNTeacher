( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b992 - block
    b585 - block
    b861 - block
    b691 - block
    b582 - block
    b872 - block
    b968 - block
    b569 - block
    b954 - block
    b15 - block
    b481 - block
    b120 - block
    b240 - block
    b697 - block
    b982 - block
    b215 - block
    b515 - block
    b38 - block
    b492 - block
    b422 - block
    b746 - block
    b160 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b992 )
    ( on b585 b992 )
    ( on b861 b585 )
    ( on b691 b861 )
    ( on b582 b691 )
    ( on b872 b582 )
    ( on b968 b872 )
    ( on b569 b968 )
    ( on b954 b569 )
    ( on b15 b954 )
    ( on b481 b15 )
    ( on b120 b481 )
    ( on b240 b120 )
    ( on b697 b240 )
    ( on b982 b697 )
    ( on b215 b982 )
    ( on b515 b215 )
    ( on b38 b515 )
    ( on b492 b38 )
    ( on b422 b492 )
    ( on b746 b422 )
    ( on b160 b746 )
    ( clear b160 )
  )
  ( :goal
    ( and
      ( clear b992 )
    )
  )
)
