( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b295 - block
    b65 - block
    b243 - block
    b766 - block
    b940 - block
    b972 - block
    b793 - block
    b746 - block
    b820 - block
    b432 - block
    b828 - block
    b789 - block
    b260 - block
    b815 - block
    b710 - block
    b821 - block
    b194 - block
    b607 - block
    b219 - block
    b254 - block
    b898 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b295 )
    ( on b65 b295 )
    ( on b243 b65 )
    ( on b766 b243 )
    ( on b940 b766 )
    ( on b972 b940 )
    ( on b793 b972 )
    ( on b746 b793 )
    ( on b820 b746 )
    ( on b432 b820 )
    ( on b828 b432 )
    ( on b789 b828 )
    ( on b260 b789 )
    ( on b815 b260 )
    ( on b710 b815 )
    ( on b821 b710 )
    ( on b194 b821 )
    ( on b607 b194 )
    ( on b219 b607 )
    ( on b254 b219 )
    ( on b898 b254 )
    ( clear b898 )
  )
  ( :tasks
    ( Make-20Pile b65 b243 b766 b940 b972 b793 b746 b820 b432 b828 b789 b260 b815 b710 b821 b194 b607 b219 b254 b898 )
  )
)
