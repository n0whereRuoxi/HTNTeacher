( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b230 - block
    b388 - block
    b48 - block
    b789 - block
    b371 - block
    b962 - block
    b476 - block
    b349 - block
    b367 - block
    b474 - block
    b347 - block
    b168 - block
    b481 - block
    b412 - block
    b10 - block
    b52 - block
    b225 - block
    b649 - block
    b596 - block
    b598 - block
    b830 - block
    b420 - block
    b710 - block
    b398 - block
    b700 - block
    b984 - block
    b583 - block
    b310 - block
    b954 - block
    b576 - block
    b640 - block
    b754 - block
    b876 - block
    b633 - block
    b376 - block
    b101 - block
    b886 - block
    b533 - block
    b634 - block
    b593 - block
    b822 - block
    b123 - block
    b692 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b230 )
    ( on b388 b230 )
    ( on b48 b388 )
    ( on b789 b48 )
    ( on b371 b789 )
    ( on b962 b371 )
    ( on b476 b962 )
    ( on b349 b476 )
    ( on b367 b349 )
    ( on b474 b367 )
    ( on b347 b474 )
    ( on b168 b347 )
    ( on b481 b168 )
    ( on b412 b481 )
    ( on b10 b412 )
    ( on b52 b10 )
    ( on b225 b52 )
    ( on b649 b225 )
    ( on b596 b649 )
    ( on b598 b596 )
    ( on b830 b598 )
    ( on b420 b830 )
    ( on b710 b420 )
    ( on b398 b710 )
    ( on b700 b398 )
    ( on b984 b700 )
    ( on b583 b984 )
    ( on b310 b583 )
    ( on b954 b310 )
    ( on b576 b954 )
    ( on b640 b576 )
    ( on b754 b640 )
    ( on b876 b754 )
    ( on b633 b876 )
    ( on b376 b633 )
    ( on b101 b376 )
    ( on b886 b101 )
    ( on b533 b886 )
    ( on b634 b533 )
    ( on b593 b634 )
    ( on b822 b593 )
    ( on b123 b822 )
    ( on b692 b123 )
    ( clear b692 )
  )
  ( :tasks
    ( Make-42Pile b388 b48 b789 b371 b962 b476 b349 b367 b474 b347 b168 b481 b412 b10 b52 b225 b649 b596 b598 b830 b420 b710 b398 b700 b984 b583 b310 b954 b576 b640 b754 b876 b633 b376 b101 b886 b533 b634 b593 b822 b123 b692 )
  )
)
