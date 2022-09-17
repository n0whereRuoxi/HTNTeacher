( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b466 - block
    b61 - block
    b734 - block
    b416 - block
    b369 - block
    b322 - block
    b99 - block
    b880 - block
    b720 - block
    b158 - block
    b692 - block
    b933 - block
    b190 - block
    b185 - block
    b926 - block
    b798 - block
    b480 - block
    b716 - block
    b261 - block
    b202 - block
    b201 - block
    b691 - block
    b112 - block
    b688 - block
    b337 - block
    b257 - block
    b87 - block
    b418 - block
    b784 - block
    b477 - block
    b976 - block
    b624 - block
    b898 - block
    b751 - block
    b220 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b466 )
    ( on b61 b466 )
    ( on b734 b61 )
    ( on b416 b734 )
    ( on b369 b416 )
    ( on b322 b369 )
    ( on b99 b322 )
    ( on b880 b99 )
    ( on b720 b880 )
    ( on b158 b720 )
    ( on b692 b158 )
    ( on b933 b692 )
    ( on b190 b933 )
    ( on b185 b190 )
    ( on b926 b185 )
    ( on b798 b926 )
    ( on b480 b798 )
    ( on b716 b480 )
    ( on b261 b716 )
    ( on b202 b261 )
    ( on b201 b202 )
    ( on b691 b201 )
    ( on b112 b691 )
    ( on b688 b112 )
    ( on b337 b688 )
    ( on b257 b337 )
    ( on b87 b257 )
    ( on b418 b87 )
    ( on b784 b418 )
    ( on b477 b784 )
    ( on b976 b477 )
    ( on b624 b976 )
    ( on b898 b624 )
    ( on b751 b898 )
    ( on b220 b751 )
    ( clear b220 )
  )
  ( :goal
    ( and
      ( clear b466 )
    )
  )
)
