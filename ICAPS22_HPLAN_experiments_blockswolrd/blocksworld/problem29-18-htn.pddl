( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b605 - block
    b278 - block
    b855 - block
    b130 - block
    b689 - block
    b249 - block
    b522 - block
    b650 - block
    b811 - block
    b456 - block
    b664 - block
    b14 - block
    b181 - block
    b807 - block
    b231 - block
    b876 - block
    b175 - block
    b530 - block
    b989 - block
    b462 - block
    b408 - block
    b247 - block
    b599 - block
    b838 - block
    b448 - block
    b68 - block
    b333 - block
    b591 - block
    b529 - block
    b120 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b605 )
    ( on b278 b605 )
    ( on b855 b278 )
    ( on b130 b855 )
    ( on b689 b130 )
    ( on b249 b689 )
    ( on b522 b249 )
    ( on b650 b522 )
    ( on b811 b650 )
    ( on b456 b811 )
    ( on b664 b456 )
    ( on b14 b664 )
    ( on b181 b14 )
    ( on b807 b181 )
    ( on b231 b807 )
    ( on b876 b231 )
    ( on b175 b876 )
    ( on b530 b175 )
    ( on b989 b530 )
    ( on b462 b989 )
    ( on b408 b462 )
    ( on b247 b408 )
    ( on b599 b247 )
    ( on b838 b599 )
    ( on b448 b838 )
    ( on b68 b448 )
    ( on b333 b68 )
    ( on b591 b333 )
    ( on b529 b591 )
    ( on b120 b529 )
    ( clear b120 )
  )
  ( :tasks
    ( Make-29Pile b278 b855 b130 b689 b249 b522 b650 b811 b456 b664 b14 b181 b807 b231 b876 b175 b530 b989 b462 b408 b247 b599 b838 b448 b68 b333 b591 b529 b120 )
  )
)
