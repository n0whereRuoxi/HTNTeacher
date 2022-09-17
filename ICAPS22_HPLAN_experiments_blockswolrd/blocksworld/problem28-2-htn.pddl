( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b784 - block
    b102 - block
    b177 - block
    b194 - block
    b262 - block
    b235 - block
    b569 - block
    b391 - block
    b590 - block
    b4 - block
    b796 - block
    b947 - block
    b949 - block
    b559 - block
    b439 - block
    b763 - block
    b959 - block
    b278 - block
    b334 - block
    b728 - block
    b231 - block
    b941 - block
    b817 - block
    b331 - block
    b794 - block
    b931 - block
    b218 - block
    b452 - block
    b983 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b784 )
    ( on b102 b784 )
    ( on b177 b102 )
    ( on b194 b177 )
    ( on b262 b194 )
    ( on b235 b262 )
    ( on b569 b235 )
    ( on b391 b569 )
    ( on b590 b391 )
    ( on b4 b590 )
    ( on b796 b4 )
    ( on b947 b796 )
    ( on b949 b947 )
    ( on b559 b949 )
    ( on b439 b559 )
    ( on b763 b439 )
    ( on b959 b763 )
    ( on b278 b959 )
    ( on b334 b278 )
    ( on b728 b334 )
    ( on b231 b728 )
    ( on b941 b231 )
    ( on b817 b941 )
    ( on b331 b817 )
    ( on b794 b331 )
    ( on b931 b794 )
    ( on b218 b931 )
    ( on b452 b218 )
    ( on b983 b452 )
    ( clear b983 )
  )
  ( :tasks
    ( Make-28Pile b102 b177 b194 b262 b235 b569 b391 b590 b4 b796 b947 b949 b559 b439 b763 b959 b278 b334 b728 b231 b941 b817 b331 b794 b931 b218 b452 b983 )
  )
)
