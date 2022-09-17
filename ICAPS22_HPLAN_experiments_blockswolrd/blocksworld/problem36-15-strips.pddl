( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b70 - block
    b244 - block
    b342 - block
    b215 - block
    b85 - block
    b719 - block
    b653 - block
    b30 - block
    b810 - block
    b687 - block
    b368 - block
    b547 - block
    b906 - block
    b529 - block
    b936 - block
    b143 - block
    b706 - block
    b645 - block
    b372 - block
    b157 - block
    b479 - block
    b484 - block
    b807 - block
    b181 - block
    b63 - block
    b832 - block
    b539 - block
    b713 - block
    b794 - block
    b333 - block
    b292 - block
    b139 - block
    b278 - block
    b58 - block
    b778 - block
    b505 - block
    b692 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b70 )
    ( on b244 b70 )
    ( on b342 b244 )
    ( on b215 b342 )
    ( on b85 b215 )
    ( on b719 b85 )
    ( on b653 b719 )
    ( on b30 b653 )
    ( on b810 b30 )
    ( on b687 b810 )
    ( on b368 b687 )
    ( on b547 b368 )
    ( on b906 b547 )
    ( on b529 b906 )
    ( on b936 b529 )
    ( on b143 b936 )
    ( on b706 b143 )
    ( on b645 b706 )
    ( on b372 b645 )
    ( on b157 b372 )
    ( on b479 b157 )
    ( on b484 b479 )
    ( on b807 b484 )
    ( on b181 b807 )
    ( on b63 b181 )
    ( on b832 b63 )
    ( on b539 b832 )
    ( on b713 b539 )
    ( on b794 b713 )
    ( on b333 b794 )
    ( on b292 b333 )
    ( on b139 b292 )
    ( on b278 b139 )
    ( on b58 b278 )
    ( on b778 b58 )
    ( on b505 b778 )
    ( on b692 b505 )
    ( clear b692 )
  )
  ( :goal
    ( and
      ( clear b70 )
    )
  )
)
