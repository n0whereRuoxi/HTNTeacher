( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b841 - block
    b301 - block
    b578 - block
    b462 - block
    b770 - block
    b419 - block
    b107 - block
    b426 - block
    b684 - block
    b709 - block
    b641 - block
    b446 - block
    b6 - block
    b738 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b841 )
    ( on b301 b841 )
    ( on b578 b301 )
    ( on b462 b578 )
    ( on b770 b462 )
    ( on b419 b770 )
    ( on b107 b419 )
    ( on b426 b107 )
    ( on b684 b426 )
    ( on b709 b684 )
    ( on b641 b709 )
    ( on b446 b641 )
    ( on b6 b446 )
    ( on b738 b6 )
    ( clear b738 )
  )
  ( :tasks
    ( Make-13Pile b301 b578 b462 b770 b419 b107 b426 b684 b709 b641 b446 b6 b738 )
  )
)
