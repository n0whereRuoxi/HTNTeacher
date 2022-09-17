( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b732 - block
    b731 - block
    b376 - block
    b968 - block
    b57 - block
    b795 - block
    b435 - block
    b176 - block
    b631 - block
    b608 - block
    b932 - block
    b470 - block
    b258 - block
    b852 - block
    b213 - block
    b863 - block
    b297 - block
    b746 - block
    b160 - block
    b180 - block
    b249 - block
    b107 - block
    b633 - block
    b595 - block
    b43 - block
    b238 - block
    b634 - block
    b253 - block
    b311 - block
    b938 - block
    b108 - block
    b864 - block
    b471 - block
    b178 - block
    b562 - block
    b504 - block
    b843 - block
    b839 - block
    b429 - block
    b114 - block
    b675 - block
    b865 - block
    b369 - block
    b898 - block
    b123 - block
    b264 - block
    b286 - block
    b618 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b732 )
    ( on b731 b732 )
    ( on b376 b731 )
    ( on b968 b376 )
    ( on b57 b968 )
    ( on b795 b57 )
    ( on b435 b795 )
    ( on b176 b435 )
    ( on b631 b176 )
    ( on b608 b631 )
    ( on b932 b608 )
    ( on b470 b932 )
    ( on b258 b470 )
    ( on b852 b258 )
    ( on b213 b852 )
    ( on b863 b213 )
    ( on b297 b863 )
    ( on b746 b297 )
    ( on b160 b746 )
    ( on b180 b160 )
    ( on b249 b180 )
    ( on b107 b249 )
    ( on b633 b107 )
    ( on b595 b633 )
    ( on b43 b595 )
    ( on b238 b43 )
    ( on b634 b238 )
    ( on b253 b634 )
    ( on b311 b253 )
    ( on b938 b311 )
    ( on b108 b938 )
    ( on b864 b108 )
    ( on b471 b864 )
    ( on b178 b471 )
    ( on b562 b178 )
    ( on b504 b562 )
    ( on b843 b504 )
    ( on b839 b843 )
    ( on b429 b839 )
    ( on b114 b429 )
    ( on b675 b114 )
    ( on b865 b675 )
    ( on b369 b865 )
    ( on b898 b369 )
    ( on b123 b898 )
    ( on b264 b123 )
    ( on b286 b264 )
    ( on b618 b286 )
    ( clear b618 )
  )
  ( :goal
    ( and
      ( clear b732 )
    )
  )
)
