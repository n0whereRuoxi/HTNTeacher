( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b10 - block
    b139 - block
    b70 - block
    b623 - block
    b547 - block
    b743 - block
    b979 - block
    b445 - block
    b938 - block
    b73 - block
    b11 - block
    b279 - block
    b813 - block
    b158 - block
    b325 - block
    b866 - block
    b609 - block
    b988 - block
    b841 - block
    b764 - block
    b990 - block
    b6 - block
    b833 - block
    b1 - block
    b651 - block
    b878 - block
    b961 - block
    b346 - block
    b611 - block
    b897 - block
    b484 - block
    b38 - block
    b110 - block
    b395 - block
    b838 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b10 )
    ( on b139 b10 )
    ( on b70 b139 )
    ( on b623 b70 )
    ( on b547 b623 )
    ( on b743 b547 )
    ( on b979 b743 )
    ( on b445 b979 )
    ( on b938 b445 )
    ( on b73 b938 )
    ( on b11 b73 )
    ( on b279 b11 )
    ( on b813 b279 )
    ( on b158 b813 )
    ( on b325 b158 )
    ( on b866 b325 )
    ( on b609 b866 )
    ( on b988 b609 )
    ( on b841 b988 )
    ( on b764 b841 )
    ( on b990 b764 )
    ( on b6 b990 )
    ( on b833 b6 )
    ( on b1 b833 )
    ( on b651 b1 )
    ( on b878 b651 )
    ( on b961 b878 )
    ( on b346 b961 )
    ( on b611 b346 )
    ( on b897 b611 )
    ( on b484 b897 )
    ( on b38 b484 )
    ( on b110 b38 )
    ( on b395 b110 )
    ( on b838 b395 )
    ( clear b838 )
  )
  ( :tasks
    ( Make-34Pile b139 b70 b623 b547 b743 b979 b445 b938 b73 b11 b279 b813 b158 b325 b866 b609 b988 b841 b764 b990 b6 b833 b1 b651 b878 b961 b346 b611 b897 b484 b38 b110 b395 b838 )
  )
)
