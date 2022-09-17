( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b34 - block
    b2 - block
    b902 - block
    b438 - block
    b601 - block
    b204 - block
    b959 - block
    b253 - block
    b413 - block
    b107 - block
    b293 - block
    b903 - block
    b819 - block
    b608 - block
    b326 - block
    b250 - block
    b172 - block
    b789 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b34 )
    ( on b2 b34 )
    ( on b902 b2 )
    ( on b438 b902 )
    ( on b601 b438 )
    ( on b204 b601 )
    ( on b959 b204 )
    ( on b253 b959 )
    ( on b413 b253 )
    ( on b107 b413 )
    ( on b293 b107 )
    ( on b903 b293 )
    ( on b819 b903 )
    ( on b608 b819 )
    ( on b326 b608 )
    ( on b250 b326 )
    ( on b172 b250 )
    ( on b789 b172 )
    ( clear b789 )
  )
  ( :goal
    ( and
      ( clear b34 )
    )
  )
)
