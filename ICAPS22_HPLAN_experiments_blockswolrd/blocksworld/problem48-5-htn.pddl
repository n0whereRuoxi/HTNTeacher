( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b688 - block
    b409 - block
    b593 - block
    b689 - block
    b832 - block
    b693 - block
    b237 - block
    b327 - block
    b987 - block
    b985 - block
    b721 - block
    b739 - block
    b154 - block
    b962 - block
    b547 - block
    b406 - block
    b652 - block
    b762 - block
    b863 - block
    b904 - block
    b625 - block
    b392 - block
    b716 - block
    b234 - block
    b945 - block
    b700 - block
    b243 - block
    b210 - block
    b793 - block
    b350 - block
    b632 - block
    b809 - block
    b368 - block
    b454 - block
    b104 - block
    b459 - block
    b951 - block
    b573 - block
    b642 - block
    b848 - block
    b468 - block
    b630 - block
    b251 - block
    b692 - block
    b433 - block
    b691 - block
    b915 - block
    b972 - block
    b415 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b688 )
    ( on b409 b688 )
    ( on b593 b409 )
    ( on b689 b593 )
    ( on b832 b689 )
    ( on b693 b832 )
    ( on b237 b693 )
    ( on b327 b237 )
    ( on b987 b327 )
    ( on b985 b987 )
    ( on b721 b985 )
    ( on b739 b721 )
    ( on b154 b739 )
    ( on b962 b154 )
    ( on b547 b962 )
    ( on b406 b547 )
    ( on b652 b406 )
    ( on b762 b652 )
    ( on b863 b762 )
    ( on b904 b863 )
    ( on b625 b904 )
    ( on b392 b625 )
    ( on b716 b392 )
    ( on b234 b716 )
    ( on b945 b234 )
    ( on b700 b945 )
    ( on b243 b700 )
    ( on b210 b243 )
    ( on b793 b210 )
    ( on b350 b793 )
    ( on b632 b350 )
    ( on b809 b632 )
    ( on b368 b809 )
    ( on b454 b368 )
    ( on b104 b454 )
    ( on b459 b104 )
    ( on b951 b459 )
    ( on b573 b951 )
    ( on b642 b573 )
    ( on b848 b642 )
    ( on b468 b848 )
    ( on b630 b468 )
    ( on b251 b630 )
    ( on b692 b251 )
    ( on b433 b692 )
    ( on b691 b433 )
    ( on b915 b691 )
    ( on b972 b915 )
    ( on b415 b972 )
    ( clear b415 )
  )
  ( :tasks
    ( Make-48Pile b409 b593 b689 b832 b693 b237 b327 b987 b985 b721 b739 b154 b962 b547 b406 b652 b762 b863 b904 b625 b392 b716 b234 b945 b700 b243 b210 b793 b350 b632 b809 b368 b454 b104 b459 b951 b573 b642 b848 b468 b630 b251 b692 b433 b691 b915 b972 b415 )
  )
)
