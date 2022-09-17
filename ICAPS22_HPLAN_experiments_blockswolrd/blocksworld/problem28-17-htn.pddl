( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b86 - block
    b850 - block
    b384 - block
    b207 - block
    b659 - block
    b442 - block
    b684 - block
    b5 - block
    b122 - block
    b190 - block
    b473 - block
    b229 - block
    b257 - block
    b489 - block
    b174 - block
    b206 - block
    b610 - block
    b851 - block
    b234 - block
    b604 - block
    b837 - block
    b328 - block
    b828 - block
    b193 - block
    b804 - block
    b836 - block
    b729 - block
    b687 - block
    b745 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b86 )
    ( on b850 b86 )
    ( on b384 b850 )
    ( on b207 b384 )
    ( on b659 b207 )
    ( on b442 b659 )
    ( on b684 b442 )
    ( on b5 b684 )
    ( on b122 b5 )
    ( on b190 b122 )
    ( on b473 b190 )
    ( on b229 b473 )
    ( on b257 b229 )
    ( on b489 b257 )
    ( on b174 b489 )
    ( on b206 b174 )
    ( on b610 b206 )
    ( on b851 b610 )
    ( on b234 b851 )
    ( on b604 b234 )
    ( on b837 b604 )
    ( on b328 b837 )
    ( on b828 b328 )
    ( on b193 b828 )
    ( on b804 b193 )
    ( on b836 b804 )
    ( on b729 b836 )
    ( on b687 b729 )
    ( on b745 b687 )
    ( clear b745 )
  )
  ( :tasks
    ( Make-28Pile b850 b384 b207 b659 b442 b684 b5 b122 b190 b473 b229 b257 b489 b174 b206 b610 b851 b234 b604 b837 b328 b828 b193 b804 b836 b729 b687 b745 )
  )
)
