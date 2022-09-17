( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b910 - block
    b521 - block
    b812 - block
    b664 - block
    b40 - block
    b678 - block
    b771 - block
    b753 - block
    b247 - block
    b613 - block
    b725 - block
    b782 - block
    b320 - block
    b163 - block
    b717 - block
    b899 - block
    b523 - block
    b110 - block
    b638 - block
    b146 - block
    b544 - block
    b696 - block
    b982 - block
    b283 - block
    b559 - block
    b969 - block
    b960 - block
    b788 - block
    b507 - block
    b893 - block
    b767 - block
    b718 - block
    b506 - block
    b99 - block
    b595 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b910 )
    ( on b521 b910 )
    ( on b812 b521 )
    ( on b664 b812 )
    ( on b40 b664 )
    ( on b678 b40 )
    ( on b771 b678 )
    ( on b753 b771 )
    ( on b247 b753 )
    ( on b613 b247 )
    ( on b725 b613 )
    ( on b782 b725 )
    ( on b320 b782 )
    ( on b163 b320 )
    ( on b717 b163 )
    ( on b899 b717 )
    ( on b523 b899 )
    ( on b110 b523 )
    ( on b638 b110 )
    ( on b146 b638 )
    ( on b544 b146 )
    ( on b696 b544 )
    ( on b982 b696 )
    ( on b283 b982 )
    ( on b559 b283 )
    ( on b969 b559 )
    ( on b960 b969 )
    ( on b788 b960 )
    ( on b507 b788 )
    ( on b893 b507 )
    ( on b767 b893 )
    ( on b718 b767 )
    ( on b506 b718 )
    ( on b99 b506 )
    ( on b595 b99 )
    ( clear b595 )
  )
  ( :tasks
    ( Make-34Pile b521 b812 b664 b40 b678 b771 b753 b247 b613 b725 b782 b320 b163 b717 b899 b523 b110 b638 b146 b544 b696 b982 b283 b559 b969 b960 b788 b507 b893 b767 b718 b506 b99 b595 )
  )
)
