( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b688 - block
    b876 - block
    b502 - block
    b34 - block
    b689 - block
    b261 - block
    b475 - block
    b347 - block
    b469 - block
    b48 - block
    b772 - block
    b280 - block
    b787 - block
    b995 - block
    b26 - block
    b552 - block
    b840 - block
    b166 - block
    b978 - block
    b172 - block
    b219 - block
    b771 - block
    b302 - block
    b801 - block
    b561 - block
    b866 - block
    b360 - block
    b751 - block
    b761 - block
    b310 - block
    b431 - block
    b616 - block
    b148 - block
    b289 - block
    b32 - block
    b537 - block
    b461 - block
    b312 - block
    b491 - block
    b282 - block
    b451 - block
    b450 - block
    b521 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b688 )
    ( on b876 b688 )
    ( on b502 b876 )
    ( on b34 b502 )
    ( on b689 b34 )
    ( on b261 b689 )
    ( on b475 b261 )
    ( on b347 b475 )
    ( on b469 b347 )
    ( on b48 b469 )
    ( on b772 b48 )
    ( on b280 b772 )
    ( on b787 b280 )
    ( on b995 b787 )
    ( on b26 b995 )
    ( on b552 b26 )
    ( on b840 b552 )
    ( on b166 b840 )
    ( on b978 b166 )
    ( on b172 b978 )
    ( on b219 b172 )
    ( on b771 b219 )
    ( on b302 b771 )
    ( on b801 b302 )
    ( on b561 b801 )
    ( on b866 b561 )
    ( on b360 b866 )
    ( on b751 b360 )
    ( on b761 b751 )
    ( on b310 b761 )
    ( on b431 b310 )
    ( on b616 b431 )
    ( on b148 b616 )
    ( on b289 b148 )
    ( on b32 b289 )
    ( on b537 b32 )
    ( on b461 b537 )
    ( on b312 b461 )
    ( on b491 b312 )
    ( on b282 b491 )
    ( on b451 b282 )
    ( on b450 b451 )
    ( on b521 b450 )
    ( clear b521 )
  )
  ( :tasks
    ( Make-42Pile b876 b502 b34 b689 b261 b475 b347 b469 b48 b772 b280 b787 b995 b26 b552 b840 b166 b978 b172 b219 b771 b302 b801 b561 b866 b360 b751 b761 b310 b431 b616 b148 b289 b32 b537 b461 b312 b491 b282 b451 b450 b521 )
  )
)
