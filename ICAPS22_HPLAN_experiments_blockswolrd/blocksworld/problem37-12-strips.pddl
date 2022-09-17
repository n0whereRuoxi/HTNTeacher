( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b151 - block
    b244 - block
    b325 - block
    b819 - block
    b367 - block
    b204 - block
    b68 - block
    b669 - block
    b858 - block
    b903 - block
    b626 - block
    b116 - block
    b749 - block
    b905 - block
    b505 - block
    b495 - block
    b31 - block
    b369 - block
    b919 - block
    b531 - block
    b137 - block
    b433 - block
    b557 - block
    b655 - block
    b552 - block
    b760 - block
    b110 - block
    b721 - block
    b809 - block
    b10 - block
    b74 - block
    b759 - block
    b942 - block
    b731 - block
    b780 - block
    b512 - block
    b361 - block
    b692 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b151 )
    ( on b244 b151 )
    ( on b325 b244 )
    ( on b819 b325 )
    ( on b367 b819 )
    ( on b204 b367 )
    ( on b68 b204 )
    ( on b669 b68 )
    ( on b858 b669 )
    ( on b903 b858 )
    ( on b626 b903 )
    ( on b116 b626 )
    ( on b749 b116 )
    ( on b905 b749 )
    ( on b505 b905 )
    ( on b495 b505 )
    ( on b31 b495 )
    ( on b369 b31 )
    ( on b919 b369 )
    ( on b531 b919 )
    ( on b137 b531 )
    ( on b433 b137 )
    ( on b557 b433 )
    ( on b655 b557 )
    ( on b552 b655 )
    ( on b760 b552 )
    ( on b110 b760 )
    ( on b721 b110 )
    ( on b809 b721 )
    ( on b10 b809 )
    ( on b74 b10 )
    ( on b759 b74 )
    ( on b942 b759 )
    ( on b731 b942 )
    ( on b780 b731 )
    ( on b512 b780 )
    ( on b361 b512 )
    ( on b692 b361 )
    ( clear b692 )
  )
  ( :goal
    ( and
      ( clear b151 )
    )
  )
)
