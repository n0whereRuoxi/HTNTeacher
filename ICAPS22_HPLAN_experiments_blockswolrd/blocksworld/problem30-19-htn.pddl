( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b116 - block
    b846 - block
    b239 - block
    b35 - block
    b628 - block
    b822 - block
    b554 - block
    b28 - block
    b989 - block
    b367 - block
    b878 - block
    b507 - block
    b72 - block
    b346 - block
    b682 - block
    b764 - block
    b283 - block
    b191 - block
    b366 - block
    b293 - block
    b333 - block
    b785 - block
    b911 - block
    b278 - block
    b45 - block
    b645 - block
    b681 - block
    b417 - block
    b606 - block
    b864 - block
    b605 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b116 )
    ( on b846 b116 )
    ( on b239 b846 )
    ( on b35 b239 )
    ( on b628 b35 )
    ( on b822 b628 )
    ( on b554 b822 )
    ( on b28 b554 )
    ( on b989 b28 )
    ( on b367 b989 )
    ( on b878 b367 )
    ( on b507 b878 )
    ( on b72 b507 )
    ( on b346 b72 )
    ( on b682 b346 )
    ( on b764 b682 )
    ( on b283 b764 )
    ( on b191 b283 )
    ( on b366 b191 )
    ( on b293 b366 )
    ( on b333 b293 )
    ( on b785 b333 )
    ( on b911 b785 )
    ( on b278 b911 )
    ( on b45 b278 )
    ( on b645 b45 )
    ( on b681 b645 )
    ( on b417 b681 )
    ( on b606 b417 )
    ( on b864 b606 )
    ( on b605 b864 )
    ( clear b605 )
  )
  ( :tasks
    ( Make-30Pile b846 b239 b35 b628 b822 b554 b28 b989 b367 b878 b507 b72 b346 b682 b764 b283 b191 b366 b293 b333 b785 b911 b278 b45 b645 b681 b417 b606 b864 b605 )
  )
)
