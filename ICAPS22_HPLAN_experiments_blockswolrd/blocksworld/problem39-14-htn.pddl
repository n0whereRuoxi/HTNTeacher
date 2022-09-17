( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b350 - block
    b601 - block
    b26 - block
    b706 - block
    b465 - block
    b285 - block
    b209 - block
    b509 - block
    b6 - block
    b785 - block
    b320 - block
    b846 - block
    b160 - block
    b981 - block
    b111 - block
    b912 - block
    b803 - block
    b681 - block
    b821 - block
    b42 - block
    b199 - block
    b377 - block
    b133 - block
    b989 - block
    b479 - block
    b316 - block
    b894 - block
    b387 - block
    b828 - block
    b900 - block
    b76 - block
    b203 - block
    b610 - block
    b492 - block
    b390 - block
    b953 - block
    b562 - block
    b37 - block
    b874 - block
    b391 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b350 )
    ( on b601 b350 )
    ( on b26 b601 )
    ( on b706 b26 )
    ( on b465 b706 )
    ( on b285 b465 )
    ( on b209 b285 )
    ( on b509 b209 )
    ( on b6 b509 )
    ( on b785 b6 )
    ( on b320 b785 )
    ( on b846 b320 )
    ( on b160 b846 )
    ( on b981 b160 )
    ( on b111 b981 )
    ( on b912 b111 )
    ( on b803 b912 )
    ( on b681 b803 )
    ( on b821 b681 )
    ( on b42 b821 )
    ( on b199 b42 )
    ( on b377 b199 )
    ( on b133 b377 )
    ( on b989 b133 )
    ( on b479 b989 )
    ( on b316 b479 )
    ( on b894 b316 )
    ( on b387 b894 )
    ( on b828 b387 )
    ( on b900 b828 )
    ( on b76 b900 )
    ( on b203 b76 )
    ( on b610 b203 )
    ( on b492 b610 )
    ( on b390 b492 )
    ( on b953 b390 )
    ( on b562 b953 )
    ( on b37 b562 )
    ( on b874 b37 )
    ( on b391 b874 )
    ( clear b391 )
  )
  ( :tasks
    ( Make-39Pile b601 b26 b706 b465 b285 b209 b509 b6 b785 b320 b846 b160 b981 b111 b912 b803 b681 b821 b42 b199 b377 b133 b989 b479 b316 b894 b387 b828 b900 b76 b203 b610 b492 b390 b953 b562 b37 b874 b391 )
  )
)
