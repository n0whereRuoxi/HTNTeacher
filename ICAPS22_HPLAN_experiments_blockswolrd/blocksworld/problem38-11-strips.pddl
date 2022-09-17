( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b446 - block
    b623 - block
    b393 - block
    b908 - block
    b492 - block
    b986 - block
    b941 - block
    b57 - block
    b746 - block
    b627 - block
    b614 - block
    b418 - block
    b625 - block
    b175 - block
    b892 - block
    b260 - block
    b696 - block
    b372 - block
    b308 - block
    b469 - block
    b333 - block
    b63 - block
    b504 - block
    b143 - block
    b601 - block
    b361 - block
    b462 - block
    b332 - block
    b516 - block
    b989 - block
    b833 - block
    b730 - block
    b713 - block
    b583 - block
    b672 - block
    b13 - block
    b567 - block
    b449 - block
    b304 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b446 )
    ( on b623 b446 )
    ( on b393 b623 )
    ( on b908 b393 )
    ( on b492 b908 )
    ( on b986 b492 )
    ( on b941 b986 )
    ( on b57 b941 )
    ( on b746 b57 )
    ( on b627 b746 )
    ( on b614 b627 )
    ( on b418 b614 )
    ( on b625 b418 )
    ( on b175 b625 )
    ( on b892 b175 )
    ( on b260 b892 )
    ( on b696 b260 )
    ( on b372 b696 )
    ( on b308 b372 )
    ( on b469 b308 )
    ( on b333 b469 )
    ( on b63 b333 )
    ( on b504 b63 )
    ( on b143 b504 )
    ( on b601 b143 )
    ( on b361 b601 )
    ( on b462 b361 )
    ( on b332 b462 )
    ( on b516 b332 )
    ( on b989 b516 )
    ( on b833 b989 )
    ( on b730 b833 )
    ( on b713 b730 )
    ( on b583 b713 )
    ( on b672 b583 )
    ( on b13 b672 )
    ( on b567 b13 )
    ( on b449 b567 )
    ( on b304 b449 )
    ( clear b304 )
  )
  ( :goal
    ( and
      ( clear b446 )
    )
  )
)
