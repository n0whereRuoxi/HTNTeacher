( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b730 - block
    b305 - block
    b715 - block
    b351 - block
    b291 - block
    b25 - block
    b106 - block
    b770 - block
    b231 - block
    b675 - block
    b550 - block
    b515 - block
    b438 - block
    b811 - block
    b745 - block
    b718 - block
    b825 - block
    b277 - block
    b817 - block
    b142 - block
    b326 - block
    b627 - block
    b886 - block
    b937 - block
    b431 - block
    b62 - block
    b192 - block
    b47 - block
    b842 - block
    b547 - block
    b637 - block
    b28 - block
    b846 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b730 )
    ( on b305 b730 )
    ( on b715 b305 )
    ( on b351 b715 )
    ( on b291 b351 )
    ( on b25 b291 )
    ( on b106 b25 )
    ( on b770 b106 )
    ( on b231 b770 )
    ( on b675 b231 )
    ( on b550 b675 )
    ( on b515 b550 )
    ( on b438 b515 )
    ( on b811 b438 )
    ( on b745 b811 )
    ( on b718 b745 )
    ( on b825 b718 )
    ( on b277 b825 )
    ( on b817 b277 )
    ( on b142 b817 )
    ( on b326 b142 )
    ( on b627 b326 )
    ( on b886 b627 )
    ( on b937 b886 )
    ( on b431 b937 )
    ( on b62 b431 )
    ( on b192 b62 )
    ( on b47 b192 )
    ( on b842 b47 )
    ( on b547 b842 )
    ( on b637 b547 )
    ( on b28 b637 )
    ( on b846 b28 )
    ( clear b846 )
  )
  ( :tasks
    ( Make-32Pile b305 b715 b351 b291 b25 b106 b770 b231 b675 b550 b515 b438 b811 b745 b718 b825 b277 b817 b142 b326 b627 b886 b937 b431 b62 b192 b47 b842 b547 b637 b28 b846 )
  )
)
