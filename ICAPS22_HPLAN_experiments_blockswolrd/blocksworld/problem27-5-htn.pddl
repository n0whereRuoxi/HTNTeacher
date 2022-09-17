( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b679 - block
    b380 - block
    b38 - block
    b310 - block
    b385 - block
    b229 - block
    b540 - block
    b163 - block
    b86 - block
    b145 - block
    b618 - block
    b493 - block
    b688 - block
    b412 - block
    b555 - block
    b478 - block
    b828 - block
    b928 - block
    b262 - block
    b258 - block
    b134 - block
    b203 - block
    b437 - block
    b539 - block
    b733 - block
    b399 - block
    b502 - block
    b992 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b679 )
    ( on b380 b679 )
    ( on b38 b380 )
    ( on b310 b38 )
    ( on b385 b310 )
    ( on b229 b385 )
    ( on b540 b229 )
    ( on b163 b540 )
    ( on b86 b163 )
    ( on b145 b86 )
    ( on b618 b145 )
    ( on b493 b618 )
    ( on b688 b493 )
    ( on b412 b688 )
    ( on b555 b412 )
    ( on b478 b555 )
    ( on b828 b478 )
    ( on b928 b828 )
    ( on b262 b928 )
    ( on b258 b262 )
    ( on b134 b258 )
    ( on b203 b134 )
    ( on b437 b203 )
    ( on b539 b437 )
    ( on b733 b539 )
    ( on b399 b733 )
    ( on b502 b399 )
    ( on b992 b502 )
    ( clear b992 )
  )
  ( :tasks
    ( Make-27Pile b380 b38 b310 b385 b229 b540 b163 b86 b145 b618 b493 b688 b412 b555 b478 b828 b928 b262 b258 b134 b203 b437 b539 b733 b399 b502 b992 )
  )
)
