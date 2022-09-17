( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b8 - block
    b863 - block
    b714 - block
    b717 - block
    b782 - block
    b345 - block
    b42 - block
    b704 - block
    b667 - block
    b246 - block
    b671 - block
    b791 - block
    b430 - block
    b960 - block
    b437 - block
    b127 - block
    b809 - block
    b856 - block
    b940 - block
    b386 - block
    b728 - block
    b85 - block
    b676 - block
    b719 - block
    b425 - block
    b60 - block
    b57 - block
    b642 - block
    b499 - block
    b775 - block
    b334 - block
    b825 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b8 b874 )
    ( on b863 b8 )
    ( on b714 b863 )
    ( on b717 b714 )
    ( on b782 b717 )
    ( on b345 b782 )
    ( on b42 b345 )
    ( on b704 b42 )
    ( on b667 b704 )
    ( on b246 b667 )
    ( on b671 b246 )
    ( on b791 b671 )
    ( on b430 b791 )
    ( on b960 b430 )
    ( on b437 b960 )
    ( on b127 b437 )
    ( on b809 b127 )
    ( on b856 b809 )
    ( on b940 b856 )
    ( on b386 b940 )
    ( on b728 b386 )
    ( on b85 b728 )
    ( on b676 b85 )
    ( on b719 b676 )
    ( on b425 b719 )
    ( on b60 b425 )
    ( on b57 b60 )
    ( on b642 b57 )
    ( on b499 b642 )
    ( on b775 b499 )
    ( on b334 b775 )
    ( on b825 b334 )
    ( clear b825 )
  )
  ( :goal
    ( and
      ( clear b874 )
    )
  )
)
