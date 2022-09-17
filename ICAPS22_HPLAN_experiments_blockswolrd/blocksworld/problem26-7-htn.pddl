( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b590 - block
    b101 - block
    b595 - block
    b202 - block
    b40 - block
    b123 - block
    b130 - block
    b214 - block
    b3 - block
    b791 - block
    b883 - block
    b111 - block
    b773 - block
    b97 - block
    b724 - block
    b951 - block
    b991 - block
    b847 - block
    b756 - block
    b197 - block
    b26 - block
    b85 - block
    b313 - block
    b897 - block
    b30 - block
    b704 - block
    b279 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b590 )
    ( on b101 b590 )
    ( on b595 b101 )
    ( on b202 b595 )
    ( on b40 b202 )
    ( on b123 b40 )
    ( on b130 b123 )
    ( on b214 b130 )
    ( on b3 b214 )
    ( on b791 b3 )
    ( on b883 b791 )
    ( on b111 b883 )
    ( on b773 b111 )
    ( on b97 b773 )
    ( on b724 b97 )
    ( on b951 b724 )
    ( on b991 b951 )
    ( on b847 b991 )
    ( on b756 b847 )
    ( on b197 b756 )
    ( on b26 b197 )
    ( on b85 b26 )
    ( on b313 b85 )
    ( on b897 b313 )
    ( on b30 b897 )
    ( on b704 b30 )
    ( on b279 b704 )
    ( clear b279 )
  )
  ( :tasks
    ( Make-26Pile b101 b595 b202 b40 b123 b130 b214 b3 b791 b883 b111 b773 b97 b724 b951 b991 b847 b756 b197 b26 b85 b313 b897 b30 b704 b279 )
  )
)
