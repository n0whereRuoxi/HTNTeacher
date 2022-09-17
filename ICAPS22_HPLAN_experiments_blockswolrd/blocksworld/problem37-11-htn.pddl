( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b939 - block
    b592 - block
    b960 - block
    b524 - block
    b845 - block
    b715 - block
    b910 - block
    b988 - block
    b462 - block
    b767 - block
    b464 - block
    b833 - block
    b403 - block
    b299 - block
    b371 - block
    b511 - block
    b632 - block
    b317 - block
    b717 - block
    b492 - block
    b166 - block
    b400 - block
    b418 - block
    b493 - block
    b826 - block
    b695 - block
    b349 - block
    b292 - block
    b836 - block
    b667 - block
    b32 - block
    b64 - block
    b814 - block
    b313 - block
    b698 - block
    b346 - block
    b424 - block
    b301 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b939 )
    ( on b592 b939 )
    ( on b960 b592 )
    ( on b524 b960 )
    ( on b845 b524 )
    ( on b715 b845 )
    ( on b910 b715 )
    ( on b988 b910 )
    ( on b462 b988 )
    ( on b767 b462 )
    ( on b464 b767 )
    ( on b833 b464 )
    ( on b403 b833 )
    ( on b299 b403 )
    ( on b371 b299 )
    ( on b511 b371 )
    ( on b632 b511 )
    ( on b317 b632 )
    ( on b717 b317 )
    ( on b492 b717 )
    ( on b166 b492 )
    ( on b400 b166 )
    ( on b418 b400 )
    ( on b493 b418 )
    ( on b826 b493 )
    ( on b695 b826 )
    ( on b349 b695 )
    ( on b292 b349 )
    ( on b836 b292 )
    ( on b667 b836 )
    ( on b32 b667 )
    ( on b64 b32 )
    ( on b814 b64 )
    ( on b313 b814 )
    ( on b698 b313 )
    ( on b346 b698 )
    ( on b424 b346 )
    ( on b301 b424 )
    ( clear b301 )
  )
  ( :tasks
    ( Make-37Pile b592 b960 b524 b845 b715 b910 b988 b462 b767 b464 b833 b403 b299 b371 b511 b632 b317 b717 b492 b166 b400 b418 b493 b826 b695 b349 b292 b836 b667 b32 b64 b814 b313 b698 b346 b424 b301 )
  )
)
