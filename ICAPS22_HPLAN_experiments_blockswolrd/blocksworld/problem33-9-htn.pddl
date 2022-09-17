( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b198 - block
    b303 - block
    b10 - block
    b506 - block
    b238 - block
    b946 - block
    b281 - block
    b647 - block
    b248 - block
    b999 - block
    b549 - block
    b156 - block
    b296 - block
    b190 - block
    b331 - block
    b795 - block
    b350 - block
    b463 - block
    b477 - block
    b601 - block
    b231 - block
    b966 - block
    b963 - block
    b529 - block
    b324 - block
    b997 - block
    b79 - block
    b955 - block
    b110 - block
    b342 - block
    b493 - block
    b166 - block
    b919 - block
    b340 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b198 )
    ( on b303 b198 )
    ( on b10 b303 )
    ( on b506 b10 )
    ( on b238 b506 )
    ( on b946 b238 )
    ( on b281 b946 )
    ( on b647 b281 )
    ( on b248 b647 )
    ( on b999 b248 )
    ( on b549 b999 )
    ( on b156 b549 )
    ( on b296 b156 )
    ( on b190 b296 )
    ( on b331 b190 )
    ( on b795 b331 )
    ( on b350 b795 )
    ( on b463 b350 )
    ( on b477 b463 )
    ( on b601 b477 )
    ( on b231 b601 )
    ( on b966 b231 )
    ( on b963 b966 )
    ( on b529 b963 )
    ( on b324 b529 )
    ( on b997 b324 )
    ( on b79 b997 )
    ( on b955 b79 )
    ( on b110 b955 )
    ( on b342 b110 )
    ( on b493 b342 )
    ( on b166 b493 )
    ( on b919 b166 )
    ( on b340 b919 )
    ( clear b340 )
  )
  ( :tasks
    ( Make-33Pile b303 b10 b506 b238 b946 b281 b647 b248 b999 b549 b156 b296 b190 b331 b795 b350 b463 b477 b601 b231 b966 b963 b529 b324 b997 b79 b955 b110 b342 b493 b166 b919 b340 )
  )
)
