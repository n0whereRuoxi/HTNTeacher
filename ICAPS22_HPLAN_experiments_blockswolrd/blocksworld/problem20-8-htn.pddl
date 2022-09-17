( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b670 - block
    b818 - block
    b288 - block
    b977 - block
    b55 - block
    b562 - block
    b211 - block
    b922 - block
    b951 - block
    b686 - block
    b283 - block
    b23 - block
    b227 - block
    b791 - block
    b162 - block
    b372 - block
    b179 - block
    b282 - block
    b194 - block
    b586 - block
    b2 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b670 )
    ( on b818 b670 )
    ( on b288 b818 )
    ( on b977 b288 )
    ( on b55 b977 )
    ( on b562 b55 )
    ( on b211 b562 )
    ( on b922 b211 )
    ( on b951 b922 )
    ( on b686 b951 )
    ( on b283 b686 )
    ( on b23 b283 )
    ( on b227 b23 )
    ( on b791 b227 )
    ( on b162 b791 )
    ( on b372 b162 )
    ( on b179 b372 )
    ( on b282 b179 )
    ( on b194 b282 )
    ( on b586 b194 )
    ( on b2 b586 )
    ( clear b2 )
  )
  ( :tasks
    ( Make-20Pile b818 b288 b977 b55 b562 b211 b922 b951 b686 b283 b23 b227 b791 b162 b372 b179 b282 b194 b586 b2 )
  )
)
