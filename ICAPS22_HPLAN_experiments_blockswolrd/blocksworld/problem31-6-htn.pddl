( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b567 - block
    b504 - block
    b469 - block
    b758 - block
    b304 - block
    b177 - block
    b633 - block
    b545 - block
    b87 - block
    b187 - block
    b671 - block
    b11 - block
    b812 - block
    b375 - block
    b624 - block
    b923 - block
    b630 - block
    b643 - block
    b753 - block
    b977 - block
    b761 - block
    b268 - block
    b166 - block
    b208 - block
    b468 - block
    b239 - block
    b266 - block
    b751 - block
    b464 - block
    b72 - block
    b235 - block
    b479 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b567 )
    ( on b504 b567 )
    ( on b469 b504 )
    ( on b758 b469 )
    ( on b304 b758 )
    ( on b177 b304 )
    ( on b633 b177 )
    ( on b545 b633 )
    ( on b87 b545 )
    ( on b187 b87 )
    ( on b671 b187 )
    ( on b11 b671 )
    ( on b812 b11 )
    ( on b375 b812 )
    ( on b624 b375 )
    ( on b923 b624 )
    ( on b630 b923 )
    ( on b643 b630 )
    ( on b753 b643 )
    ( on b977 b753 )
    ( on b761 b977 )
    ( on b268 b761 )
    ( on b166 b268 )
    ( on b208 b166 )
    ( on b468 b208 )
    ( on b239 b468 )
    ( on b266 b239 )
    ( on b751 b266 )
    ( on b464 b751 )
    ( on b72 b464 )
    ( on b235 b72 )
    ( on b479 b235 )
    ( clear b479 )
  )
  ( :tasks
    ( Make-31Pile b504 b469 b758 b304 b177 b633 b545 b87 b187 b671 b11 b812 b375 b624 b923 b630 b643 b753 b977 b761 b268 b166 b208 b468 b239 b266 b751 b464 b72 b235 b479 )
  )
)
