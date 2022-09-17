( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b900 - block
    b379 - block
    b157 - block
    b578 - block
    b259 - block
    b670 - block
    b320 - block
    b894 - block
    b874 - block
    b746 - block
    b341 - block
    b901 - block
    b822 - block
    b85 - block
    b839 - block
    b430 - block
    b326 - block
    b784 - block
    b404 - block
    b409 - block
    b648 - block
    b311 - block
    b758 - block
    b131 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b900 )
    ( on b379 b900 )
    ( on b157 b379 )
    ( on b578 b157 )
    ( on b259 b578 )
    ( on b670 b259 )
    ( on b320 b670 )
    ( on b894 b320 )
    ( on b874 b894 )
    ( on b746 b874 )
    ( on b341 b746 )
    ( on b901 b341 )
    ( on b822 b901 )
    ( on b85 b822 )
    ( on b839 b85 )
    ( on b430 b839 )
    ( on b326 b430 )
    ( on b784 b326 )
    ( on b404 b784 )
    ( on b409 b404 )
    ( on b648 b409 )
    ( on b311 b648 )
    ( on b758 b311 )
    ( on b131 b758 )
    ( clear b131 )
  )
  ( :goal
    ( and
      ( clear b900 )
    )
  )
)
