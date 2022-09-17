( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b203 - block
    b451 - block
    b29 - block
    b44 - block
    b865 - block
    b981 - block
    b478 - block
    b757 - block
    b831 - block
    b582 - block
    b826 - block
    b861 - block
    b273 - block
    b901 - block
    b697 - block
    b602 - block
    b149 - block
    b946 - block
    b45 - block
    b704 - block
    b805 - block
    b176 - block
    b914 - block
    b212 - block
    b376 - block
    b771 - block
    b95 - block
    b988 - block
    b320 - block
    b449 - block
    b193 - block
    b834 - block
    b956 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b203 )
    ( on b451 b203 )
    ( on b29 b451 )
    ( on b44 b29 )
    ( on b865 b44 )
    ( on b981 b865 )
    ( on b478 b981 )
    ( on b757 b478 )
    ( on b831 b757 )
    ( on b582 b831 )
    ( on b826 b582 )
    ( on b861 b826 )
    ( on b273 b861 )
    ( on b901 b273 )
    ( on b697 b901 )
    ( on b602 b697 )
    ( on b149 b602 )
    ( on b946 b149 )
    ( on b45 b946 )
    ( on b704 b45 )
    ( on b805 b704 )
    ( on b176 b805 )
    ( on b914 b176 )
    ( on b212 b914 )
    ( on b376 b212 )
    ( on b771 b376 )
    ( on b95 b771 )
    ( on b988 b95 )
    ( on b320 b988 )
    ( on b449 b320 )
    ( on b193 b449 )
    ( on b834 b193 )
    ( on b956 b834 )
    ( clear b956 )
  )
  ( :goal
    ( and
      ( clear b203 )
    )
  )
)
