( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b447 - block
    b822 - block
    b387 - block
    b666 - block
    b785 - block
    b839 - block
    b326 - block
    b629 - block
    b670 - block
    b703 - block
    b335 - block
    b993 - block
    b207 - block
    b673 - block
    b8 - block
    b625 - block
    b226 - block
    b252 - block
    b452 - block
    b425 - block
    b10 - block
    b328 - block
    b149 - block
    b13 - block
    b52 - block
    b729 - block
    b210 - block
    b280 - block
    b38 - block
    b35 - block
    b138 - block
    b343 - block
    b315 - block
    b724 - block
    b595 - block
    b379 - block
    b47 - block
    b83 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b447 )
    ( on b822 b447 )
    ( on b387 b822 )
    ( on b666 b387 )
    ( on b785 b666 )
    ( on b839 b785 )
    ( on b326 b839 )
    ( on b629 b326 )
    ( on b670 b629 )
    ( on b703 b670 )
    ( on b335 b703 )
    ( on b993 b335 )
    ( on b207 b993 )
    ( on b673 b207 )
    ( on b8 b673 )
    ( on b625 b8 )
    ( on b226 b625 )
    ( on b252 b226 )
    ( on b452 b252 )
    ( on b425 b452 )
    ( on b10 b425 )
    ( on b328 b10 )
    ( on b149 b328 )
    ( on b13 b149 )
    ( on b52 b13 )
    ( on b729 b52 )
    ( on b210 b729 )
    ( on b280 b210 )
    ( on b38 b280 )
    ( on b35 b38 )
    ( on b138 b35 )
    ( on b343 b138 )
    ( on b315 b343 )
    ( on b724 b315 )
    ( on b595 b724 )
    ( on b379 b595 )
    ( on b47 b379 )
    ( on b83 b47 )
    ( clear b83 )
  )
  ( :tasks
    ( Make-37Pile b822 b387 b666 b785 b839 b326 b629 b670 b703 b335 b993 b207 b673 b8 b625 b226 b252 b452 b425 b10 b328 b149 b13 b52 b729 b210 b280 b38 b35 b138 b343 b315 b724 b595 b379 b47 b83 )
  )
)
