( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b81 - block
    b243 - block
    b703 - block
    b360 - block
    b495 - block
    b749 - block
    b722 - block
    b310 - block
    b347 - block
    b765 - block
    b775 - block
    b18 - block
    b202 - block
    b399 - block
    b677 - block
    b489 - block
    b783 - block
    b857 - block
    b128 - block
    b661 - block
    b990 - block
    b605 - block
    b431 - block
    b521 - block
    b648 - block
    b168 - block
    b774 - block
    b106 - block
    b880 - block
    b131 - block
    b441 - block
    b799 - block
    b571 - block
    b899 - block
    b950 - block
    b569 - block
    b744 - block
    b730 - block
    b408 - block
    b704 - block
    b867 - block
    b75 - block
    b200 - block
    b837 - block
    b437 - block
    b285 - block
    b915 - block
    b969 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b81 )
    ( on b243 b81 )
    ( on b703 b243 )
    ( on b360 b703 )
    ( on b495 b360 )
    ( on b749 b495 )
    ( on b722 b749 )
    ( on b310 b722 )
    ( on b347 b310 )
    ( on b765 b347 )
    ( on b775 b765 )
    ( on b18 b775 )
    ( on b202 b18 )
    ( on b399 b202 )
    ( on b677 b399 )
    ( on b489 b677 )
    ( on b783 b489 )
    ( on b857 b783 )
    ( on b128 b857 )
    ( on b661 b128 )
    ( on b990 b661 )
    ( on b605 b990 )
    ( on b431 b605 )
    ( on b521 b431 )
    ( on b648 b521 )
    ( on b168 b648 )
    ( on b774 b168 )
    ( on b106 b774 )
    ( on b880 b106 )
    ( on b131 b880 )
    ( on b441 b131 )
    ( on b799 b441 )
    ( on b571 b799 )
    ( on b899 b571 )
    ( on b950 b899 )
    ( on b569 b950 )
    ( on b744 b569 )
    ( on b730 b744 )
    ( on b408 b730 )
    ( on b704 b408 )
    ( on b867 b704 )
    ( on b75 b867 )
    ( on b200 b75 )
    ( on b837 b200 )
    ( on b437 b837 )
    ( on b285 b437 )
    ( on b915 b285 )
    ( on b969 b915 )
    ( clear b969 )
  )
  ( :tasks
    ( Make-47Pile b243 b703 b360 b495 b749 b722 b310 b347 b765 b775 b18 b202 b399 b677 b489 b783 b857 b128 b661 b990 b605 b431 b521 b648 b168 b774 b106 b880 b131 b441 b799 b571 b899 b950 b569 b744 b730 b408 b704 b867 b75 b200 b837 b437 b285 b915 b969 )
  )
)
