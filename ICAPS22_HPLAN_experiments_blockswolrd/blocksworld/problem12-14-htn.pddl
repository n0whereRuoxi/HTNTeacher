( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b207 - block
    b317 - block
    b221 - block
    b507 - block
    b658 - block
    b997 - block
    b122 - block
    b735 - block
    b257 - block
    b425 - block
    b494 - block
    b326 - block
    b518 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b207 )
    ( on b317 b207 )
    ( on b221 b317 )
    ( on b507 b221 )
    ( on b658 b507 )
    ( on b997 b658 )
    ( on b122 b997 )
    ( on b735 b122 )
    ( on b257 b735 )
    ( on b425 b257 )
    ( on b494 b425 )
    ( on b326 b494 )
    ( on b518 b326 )
    ( clear b518 )
  )
  ( :tasks
    ( Make-12Pile b317 b221 b507 b658 b997 b122 b735 b257 b425 b494 b326 b518 )
  )
)
