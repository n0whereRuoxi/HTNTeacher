( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b320 - block
    b445 - block
    b590 - block
    b336 - block
    b669 - block
    b704 - block
    b308 - block
    b552 - block
    b142 - block
    b288 - block
    b578 - block
    b64 - block
    b555 - block
    b431 - block
    b98 - block
    b513 - block
    b623 - block
    b366 - block
    b777 - block
    b347 - block
    b393 - block
    b661 - block
    b874 - block
    b149 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b320 )
    ( on b445 b320 )
    ( on b590 b445 )
    ( on b336 b590 )
    ( on b669 b336 )
    ( on b704 b669 )
    ( on b308 b704 )
    ( on b552 b308 )
    ( on b142 b552 )
    ( on b288 b142 )
    ( on b578 b288 )
    ( on b64 b578 )
    ( on b555 b64 )
    ( on b431 b555 )
    ( on b98 b431 )
    ( on b513 b98 )
    ( on b623 b513 )
    ( on b366 b623 )
    ( on b777 b366 )
    ( on b347 b777 )
    ( on b393 b347 )
    ( on b661 b393 )
    ( on b874 b661 )
    ( on b149 b874 )
    ( clear b149 )
  )
  ( :tasks
    ( Make-23Pile b445 b590 b336 b669 b704 b308 b552 b142 b288 b578 b64 b555 b431 b98 b513 b623 b366 b777 b347 b393 b661 b874 b149 )
  )
)
