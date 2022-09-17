( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b816 - block
    b109 - block
    b50 - block
    b579 - block
    b453 - block
    b529 - block
    b948 - block
    b756 - block
    b244 - block
    b766 - block
    b735 - block
    b227 - block
    b866 - block
    b765 - block
    b921 - block
    b137 - block
    b64 - block
    b801 - block
    b950 - block
    b798 - block
    b331 - block
    b526 - block
    b966 - block
    b539 - block
    b235 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b816 )
    ( on b109 b816 )
    ( on b50 b109 )
    ( on b579 b50 )
    ( on b453 b579 )
    ( on b529 b453 )
    ( on b948 b529 )
    ( on b756 b948 )
    ( on b244 b756 )
    ( on b766 b244 )
    ( on b735 b766 )
    ( on b227 b735 )
    ( on b866 b227 )
    ( on b765 b866 )
    ( on b921 b765 )
    ( on b137 b921 )
    ( on b64 b137 )
    ( on b801 b64 )
    ( on b950 b801 )
    ( on b798 b950 )
    ( on b331 b798 )
    ( on b526 b331 )
    ( on b966 b526 )
    ( on b539 b966 )
    ( on b235 b539 )
    ( clear b235 )
  )
  ( :tasks
    ( Make-24Pile b109 b50 b579 b453 b529 b948 b756 b244 b766 b735 b227 b866 b765 b921 b137 b64 b801 b950 b798 b331 b526 b966 b539 b235 )
  )
)
