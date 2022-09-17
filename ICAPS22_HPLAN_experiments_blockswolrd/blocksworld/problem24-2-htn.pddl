( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b73 - block
    b735 - block
    b585 - block
    b390 - block
    b373 - block
    b943 - block
    b575 - block
    b145 - block
    b625 - block
    b795 - block
    b592 - block
    b218 - block
    b256 - block
    b469 - block
    b630 - block
    b377 - block
    b944 - block
    b185 - block
    b963 - block
    b371 - block
    b202 - block
    b859 - block
    b304 - block
    b623 - block
    b803 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b73 )
    ( on b735 b73 )
    ( on b585 b735 )
    ( on b390 b585 )
    ( on b373 b390 )
    ( on b943 b373 )
    ( on b575 b943 )
    ( on b145 b575 )
    ( on b625 b145 )
    ( on b795 b625 )
    ( on b592 b795 )
    ( on b218 b592 )
    ( on b256 b218 )
    ( on b469 b256 )
    ( on b630 b469 )
    ( on b377 b630 )
    ( on b944 b377 )
    ( on b185 b944 )
    ( on b963 b185 )
    ( on b371 b963 )
    ( on b202 b371 )
    ( on b859 b202 )
    ( on b304 b859 )
    ( on b623 b304 )
    ( on b803 b623 )
    ( clear b803 )
  )
  ( :tasks
    ( Make-24Pile b735 b585 b390 b373 b943 b575 b145 b625 b795 b592 b218 b256 b469 b630 b377 b944 b185 b963 b371 b202 b859 b304 b623 b803 )
  )
)
