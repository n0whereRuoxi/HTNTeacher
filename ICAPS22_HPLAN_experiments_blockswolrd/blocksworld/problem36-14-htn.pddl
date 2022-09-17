( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b785 - block
    b265 - block
    b831 - block
    b209 - block
    b591 - block
    b809 - block
    b564 - block
    b760 - block
    b520 - block
    b804 - block
    b365 - block
    b478 - block
    b41 - block
    b23 - block
    b339 - block
    b858 - block
    b178 - block
    b686 - block
    b114 - block
    b268 - block
    b820 - block
    b439 - block
    b350 - block
    b167 - block
    b859 - block
    b711 - block
    b459 - block
    b775 - block
    b498 - block
    b552 - block
    b650 - block
    b276 - block
    b812 - block
    b226 - block
    b84 - block
    b950 - block
    b840 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b785 )
    ( on b265 b785 )
    ( on b831 b265 )
    ( on b209 b831 )
    ( on b591 b209 )
    ( on b809 b591 )
    ( on b564 b809 )
    ( on b760 b564 )
    ( on b520 b760 )
    ( on b804 b520 )
    ( on b365 b804 )
    ( on b478 b365 )
    ( on b41 b478 )
    ( on b23 b41 )
    ( on b339 b23 )
    ( on b858 b339 )
    ( on b178 b858 )
    ( on b686 b178 )
    ( on b114 b686 )
    ( on b268 b114 )
    ( on b820 b268 )
    ( on b439 b820 )
    ( on b350 b439 )
    ( on b167 b350 )
    ( on b859 b167 )
    ( on b711 b859 )
    ( on b459 b711 )
    ( on b775 b459 )
    ( on b498 b775 )
    ( on b552 b498 )
    ( on b650 b552 )
    ( on b276 b650 )
    ( on b812 b276 )
    ( on b226 b812 )
    ( on b84 b226 )
    ( on b950 b84 )
    ( on b840 b950 )
    ( clear b840 )
  )
  ( :tasks
    ( Make-36Pile b265 b831 b209 b591 b809 b564 b760 b520 b804 b365 b478 b41 b23 b339 b858 b178 b686 b114 b268 b820 b439 b350 b167 b859 b711 b459 b775 b498 b552 b650 b276 b812 b226 b84 b950 b840 )
  )
)
