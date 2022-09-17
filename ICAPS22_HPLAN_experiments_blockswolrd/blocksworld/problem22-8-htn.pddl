( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b885 - block
    b161 - block
    b627 - block
    b944 - block
    b488 - block
    b219 - block
    b403 - block
    b890 - block
    b17 - block
    b950 - block
    b689 - block
    b51 - block
    b560 - block
    b545 - block
    b449 - block
    b704 - block
    b60 - block
    b170 - block
    b479 - block
    b533 - block
    b894 - block
    b999 - block
    b641 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b885 )
    ( on b161 b885 )
    ( on b627 b161 )
    ( on b944 b627 )
    ( on b488 b944 )
    ( on b219 b488 )
    ( on b403 b219 )
    ( on b890 b403 )
    ( on b17 b890 )
    ( on b950 b17 )
    ( on b689 b950 )
    ( on b51 b689 )
    ( on b560 b51 )
    ( on b545 b560 )
    ( on b449 b545 )
    ( on b704 b449 )
    ( on b60 b704 )
    ( on b170 b60 )
    ( on b479 b170 )
    ( on b533 b479 )
    ( on b894 b533 )
    ( on b999 b894 )
    ( on b641 b999 )
    ( clear b641 )
  )
  ( :tasks
    ( Make-22Pile b161 b627 b944 b488 b219 b403 b890 b17 b950 b689 b51 b560 b545 b449 b704 b60 b170 b479 b533 b894 b999 b641 )
  )
)
