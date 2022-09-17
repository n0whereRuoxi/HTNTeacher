( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b747 - block
    b436 - block
    b799 - block
    b601 - block
    b720 - block
    b748 - block
    b802 - block
    b796 - block
    b386 - block
    b574 - block
    b446 - block
    b404 - block
    b551 - block
    b323 - block
    b36 - block
    b560 - block
    b617 - block
    b515 - block
    b688 - block
    b712 - block
    b669 - block
    b746 - block
    b704 - block
    b236 - block
    b602 - block
    b641 - block
    b860 - block
    b827 - block
    b216 - block
    b646 - block
    b568 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b747 )
    ( on b436 b747 )
    ( on b799 b436 )
    ( on b601 b799 )
    ( on b720 b601 )
    ( on b748 b720 )
    ( on b802 b748 )
    ( on b796 b802 )
    ( on b386 b796 )
    ( on b574 b386 )
    ( on b446 b574 )
    ( on b404 b446 )
    ( on b551 b404 )
    ( on b323 b551 )
    ( on b36 b323 )
    ( on b560 b36 )
    ( on b617 b560 )
    ( on b515 b617 )
    ( on b688 b515 )
    ( on b712 b688 )
    ( on b669 b712 )
    ( on b746 b669 )
    ( on b704 b746 )
    ( on b236 b704 )
    ( on b602 b236 )
    ( on b641 b602 )
    ( on b860 b641 )
    ( on b827 b860 )
    ( on b216 b827 )
    ( on b646 b216 )
    ( on b568 b646 )
    ( clear b568 )
  )
  ( :tasks
    ( Make-30Pile b436 b799 b601 b720 b748 b802 b796 b386 b574 b446 b404 b551 b323 b36 b560 b617 b515 b688 b712 b669 b746 b704 b236 b602 b641 b860 b827 b216 b646 b568 )
  )
)
