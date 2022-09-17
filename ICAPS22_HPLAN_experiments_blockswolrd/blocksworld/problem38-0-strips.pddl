( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b392 - block
    b727 - block
    b243 - block
    b350 - block
    b49 - block
    b943 - block
    b353 - block
    b488 - block
    b700 - block
    b604 - block
    b367 - block
    b186 - block
    b992 - block
    b214 - block
    b197 - block
    b326 - block
    b261 - block
    b151 - block
    b496 - block
    b314 - block
    b671 - block
    b807 - block
    b480 - block
    b174 - block
    b882 - block
    b249 - block
    b150 - block
    b447 - block
    b685 - block
    b37 - block
    b143 - block
    b182 - block
    b660 - block
    b691 - block
    b746 - block
    b697 - block
    b406 - block
    b762 - block
    b190 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b392 )
    ( on b727 b392 )
    ( on b243 b727 )
    ( on b350 b243 )
    ( on b49 b350 )
    ( on b943 b49 )
    ( on b353 b943 )
    ( on b488 b353 )
    ( on b700 b488 )
    ( on b604 b700 )
    ( on b367 b604 )
    ( on b186 b367 )
    ( on b992 b186 )
    ( on b214 b992 )
    ( on b197 b214 )
    ( on b326 b197 )
    ( on b261 b326 )
    ( on b151 b261 )
    ( on b496 b151 )
    ( on b314 b496 )
    ( on b671 b314 )
    ( on b807 b671 )
    ( on b480 b807 )
    ( on b174 b480 )
    ( on b882 b174 )
    ( on b249 b882 )
    ( on b150 b249 )
    ( on b447 b150 )
    ( on b685 b447 )
    ( on b37 b685 )
    ( on b143 b37 )
    ( on b182 b143 )
    ( on b660 b182 )
    ( on b691 b660 )
    ( on b746 b691 )
    ( on b697 b746 )
    ( on b406 b697 )
    ( on b762 b406 )
    ( on b190 b762 )
    ( clear b190 )
  )
  ( :goal
    ( and
      ( clear b392 )
    )
  )
)
