( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b772 - block
    b237 - block
    b275 - block
    b370 - block
    b243 - block
    b346 - block
    b231 - block
    b577 - block
    b727 - block
    b848 - block
    b31 - block
    b375 - block
    b37 - block
    b266 - block
    b797 - block
    b308 - block
    b613 - block
    b889 - block
    b187 - block
    b262 - block
    b309 - block
    b70 - block
    b629 - block
    b652 - block
    b548 - block
    b665 - block
    b106 - block
    b149 - block
    b559 - block
    b780 - block
    b190 - block
    b987 - block
    b404 - block
    b299 - block
    b406 - block
    b55 - block
    b17 - block
    b688 - block
    b769 - block
    b929 - block
    b912 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b772 )
    ( on b237 b772 )
    ( on b275 b237 )
    ( on b370 b275 )
    ( on b243 b370 )
    ( on b346 b243 )
    ( on b231 b346 )
    ( on b577 b231 )
    ( on b727 b577 )
    ( on b848 b727 )
    ( on b31 b848 )
    ( on b375 b31 )
    ( on b37 b375 )
    ( on b266 b37 )
    ( on b797 b266 )
    ( on b308 b797 )
    ( on b613 b308 )
    ( on b889 b613 )
    ( on b187 b889 )
    ( on b262 b187 )
    ( on b309 b262 )
    ( on b70 b309 )
    ( on b629 b70 )
    ( on b652 b629 )
    ( on b548 b652 )
    ( on b665 b548 )
    ( on b106 b665 )
    ( on b149 b106 )
    ( on b559 b149 )
    ( on b780 b559 )
    ( on b190 b780 )
    ( on b987 b190 )
    ( on b404 b987 )
    ( on b299 b404 )
    ( on b406 b299 )
    ( on b55 b406 )
    ( on b17 b55 )
    ( on b688 b17 )
    ( on b769 b688 )
    ( on b929 b769 )
    ( on b912 b929 )
    ( clear b912 )
  )
  ( :tasks
    ( Make-40Pile b237 b275 b370 b243 b346 b231 b577 b727 b848 b31 b375 b37 b266 b797 b308 b613 b889 b187 b262 b309 b70 b629 b652 b548 b665 b106 b149 b559 b780 b190 b987 b404 b299 b406 b55 b17 b688 b769 b929 b912 )
  )
)
