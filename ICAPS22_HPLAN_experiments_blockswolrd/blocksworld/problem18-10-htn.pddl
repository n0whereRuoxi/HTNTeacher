( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b773 - block
    b919 - block
    b511 - block
    b914 - block
    b42 - block
    b939 - block
    b248 - block
    b747 - block
    b498 - block
    b128 - block
    b614 - block
    b193 - block
    b291 - block
    b105 - block
    b622 - block
    b818 - block
    b604 - block
    b393 - block
    b54 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b773 )
    ( on b919 b773 )
    ( on b511 b919 )
    ( on b914 b511 )
    ( on b42 b914 )
    ( on b939 b42 )
    ( on b248 b939 )
    ( on b747 b248 )
    ( on b498 b747 )
    ( on b128 b498 )
    ( on b614 b128 )
    ( on b193 b614 )
    ( on b291 b193 )
    ( on b105 b291 )
    ( on b622 b105 )
    ( on b818 b622 )
    ( on b604 b818 )
    ( on b393 b604 )
    ( on b54 b393 )
    ( clear b54 )
  )
  ( :tasks
    ( Make-18Pile b919 b511 b914 b42 b939 b248 b747 b498 b128 b614 b193 b291 b105 b622 b818 b604 b393 b54 )
  )
)
