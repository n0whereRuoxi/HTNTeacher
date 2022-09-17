( define ( htn-problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    b570 - block
    b799 - block
    b828 - block
    b469 - block
    b451 - block
    b237 - block
    b550 - block
    b258 - block
    b762 - block
    b977 - block
    b407 - block
    b39 - block
    b464 - block
    b498 - block
    b230 - block
    b484 - block
    b100 - block
    b936 - block
    b273 - block
    b935 - block
    b555 - block
    b204 - block
    b978 - block
    b117 - block
    b577 - block
    b590 - block
    b378 - block
    b739 - block
    b866 - block
    b775 - block
    b636 - block
    b6 - block
    b791 - block
    b194 - block
    b675 - block
    b349 - block
    b53 - block
    b419 - block
    b159 - block
    b641 - block
    b392 - block
    b624 - block
    b621 - block
    b811 - block
    b528 - block
    b758 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b570 )
    ( on b799 b570 )
    ( on b828 b799 )
    ( on b469 b828 )
    ( on b451 b469 )
    ( on b237 b451 )
    ( on b550 b237 )
    ( on b258 b550 )
    ( on b762 b258 )
    ( on b977 b762 )
    ( on b407 b977 )
    ( on b39 b407 )
    ( on b464 b39 )
    ( on b498 b464 )
    ( on b230 b498 )
    ( on b484 b230 )
    ( on b100 b484 )
    ( on b936 b100 )
    ( on b273 b936 )
    ( on b935 b273 )
    ( on b555 b935 )
    ( on b204 b555 )
    ( on b978 b204 )
    ( on b117 b978 )
    ( on b577 b117 )
    ( on b590 b577 )
    ( on b378 b590 )
    ( on b739 b378 )
    ( on b866 b739 )
    ( on b775 b866 )
    ( on b636 b775 )
    ( on b6 b636 )
    ( on b791 b6 )
    ( on b194 b791 )
    ( on b675 b194 )
    ( on b349 b675 )
    ( on b53 b349 )
    ( on b419 b53 )
    ( on b159 b419 )
    ( on b641 b159 )
    ( on b392 b641 )
    ( on b624 b392 )
    ( on b621 b624 )
    ( on b811 b621 )
    ( on b528 b811 )
    ( on b758 b528 )
    ( clear b758 )
  )
  ( :tasks
    ( Make-45Pile b799 b828 b469 b451 b237 b550 b258 b762 b977 b407 b39 b464 b498 b230 b484 b100 b936 b273 b935 b555 b204 b978 b117 b577 b590 b378 b739 b866 b775 b636 b6 b791 b194 b675 b349 b53 b419 b159 b641 b392 b624 b621 b811 b528 b758 )
  )
)
