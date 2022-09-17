( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b827 - block
    b552 - block
    b416 - block
    b341 - block
    b451 - block
    b986 - block
    b778 - block
    b833 - block
    b768 - block
    b493 - block
    b392 - block
    b208 - block
    b763 - block
    b221 - block
    b110 - block
    b230 - block
    b885 - block
    b109 - block
    b40 - block
    b680 - block
    b17 - block
    b783 - block
    b273 - block
    b862 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b827 )
    ( on b552 b827 )
    ( on b416 b552 )
    ( on b341 b416 )
    ( on b451 b341 )
    ( on b986 b451 )
    ( on b778 b986 )
    ( on b833 b778 )
    ( on b768 b833 )
    ( on b493 b768 )
    ( on b392 b493 )
    ( on b208 b392 )
    ( on b763 b208 )
    ( on b221 b763 )
    ( on b110 b221 )
    ( on b230 b110 )
    ( on b885 b230 )
    ( on b109 b885 )
    ( on b40 b109 )
    ( on b680 b40 )
    ( on b17 b680 )
    ( on b783 b17 )
    ( on b273 b783 )
    ( on b862 b273 )
    ( clear b862 )
  )
  ( :tasks
    ( Make-23Pile b552 b416 b341 b451 b986 b778 b833 b768 b493 b392 b208 b763 b221 b110 b230 b885 b109 b40 b680 b17 b783 b273 b862 )
  )
)
