( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b62 - block
    b776 - block
    b932 - block
    b656 - block
    b204 - block
    b335 - block
    b793 - block
    b133 - block
    b154 - block
    b689 - block
    b162 - block
    b649 - block
    b408 - block
    b302 - block
    b692 - block
    b211 - block
    b241 - block
    b137 - block
    b160 - block
    b419 - block
    b753 - block
    b109 - block
    b252 - block
    b918 - block
    b167 - block
    b942 - block
    b54 - block
    b950 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b62 )
    ( on b776 b62 )
    ( on b932 b776 )
    ( on b656 b932 )
    ( on b204 b656 )
    ( on b335 b204 )
    ( on b793 b335 )
    ( on b133 b793 )
    ( on b154 b133 )
    ( on b689 b154 )
    ( on b162 b689 )
    ( on b649 b162 )
    ( on b408 b649 )
    ( on b302 b408 )
    ( on b692 b302 )
    ( on b211 b692 )
    ( on b241 b211 )
    ( on b137 b241 )
    ( on b160 b137 )
    ( on b419 b160 )
    ( on b753 b419 )
    ( on b109 b753 )
    ( on b252 b109 )
    ( on b918 b252 )
    ( on b167 b918 )
    ( on b942 b167 )
    ( on b54 b942 )
    ( on b950 b54 )
    ( clear b950 )
  )
  ( :goal
    ( and
      ( clear b62 )
    )
  )
)
