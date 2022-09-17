( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b137 - block
    b662 - block
    b326 - block
    b183 - block
    b488 - block
    b950 - block
    b776 - block
    b360 - block
    b946 - block
    b507 - block
    b290 - block
    b774 - block
    b584 - block
    b577 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b137 )
    ( on b662 b137 )
    ( on b326 b662 )
    ( on b183 b326 )
    ( on b488 b183 )
    ( on b950 b488 )
    ( on b776 b950 )
    ( on b360 b776 )
    ( on b946 b360 )
    ( on b507 b946 )
    ( on b290 b507 )
    ( on b774 b290 )
    ( on b584 b774 )
    ( on b577 b584 )
    ( clear b577 )
  )
  ( :goal
    ( and
      ( clear b137 )
    )
  )
)
