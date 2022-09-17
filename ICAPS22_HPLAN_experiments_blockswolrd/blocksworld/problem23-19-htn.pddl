( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b913 - block
    b720 - block
    b206 - block
    b329 - block
    b661 - block
    b508 - block
    b73 - block
    b294 - block
    b164 - block
    b952 - block
    b730 - block
    b301 - block
    b757 - block
    b266 - block
    b495 - block
    b349 - block
    b155 - block
    b752 - block
    b507 - block
    b579 - block
    b505 - block
    b445 - block
    b591 - block
    b127 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b913 )
    ( on b720 b913 )
    ( on b206 b720 )
    ( on b329 b206 )
    ( on b661 b329 )
    ( on b508 b661 )
    ( on b73 b508 )
    ( on b294 b73 )
    ( on b164 b294 )
    ( on b952 b164 )
    ( on b730 b952 )
    ( on b301 b730 )
    ( on b757 b301 )
    ( on b266 b757 )
    ( on b495 b266 )
    ( on b349 b495 )
    ( on b155 b349 )
    ( on b752 b155 )
    ( on b507 b752 )
    ( on b579 b507 )
    ( on b505 b579 )
    ( on b445 b505 )
    ( on b591 b445 )
    ( on b127 b591 )
    ( clear b127 )
  )
  ( :tasks
    ( Make-23Pile b720 b206 b329 b661 b508 b73 b294 b164 b952 b730 b301 b757 b266 b495 b349 b155 b752 b507 b579 b505 b445 b591 b127 )
  )
)
