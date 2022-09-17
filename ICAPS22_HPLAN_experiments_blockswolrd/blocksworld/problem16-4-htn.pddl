( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b715 - block
    b933 - block
    b259 - block
    b861 - block
    b696 - block
    b120 - block
    b171 - block
    b214 - block
    b388 - block
    b5 - block
    b56 - block
    b734 - block
    b134 - block
    b104 - block
    b837 - block
    b258 - block
    b785 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b715 )
    ( on b933 b715 )
    ( on b259 b933 )
    ( on b861 b259 )
    ( on b696 b861 )
    ( on b120 b696 )
    ( on b171 b120 )
    ( on b214 b171 )
    ( on b388 b214 )
    ( on b5 b388 )
    ( on b56 b5 )
    ( on b734 b56 )
    ( on b134 b734 )
    ( on b104 b134 )
    ( on b837 b104 )
    ( on b258 b837 )
    ( on b785 b258 )
    ( clear b785 )
  )
  ( :tasks
    ( Make-16Pile b933 b259 b861 b696 b120 b171 b214 b388 b5 b56 b734 b134 b104 b837 b258 b785 )
  )
)
