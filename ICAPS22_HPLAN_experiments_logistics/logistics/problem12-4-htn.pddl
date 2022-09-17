( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-887 - location
    l000-972 - location
    l000-219 - location
    l000-841 - location
    l000-210 - location
    l000-890 - location
    l000-337 - location
    l000-521 - location
    l000-569 - location
    l000-989 - location
    l000-655 - location
    l000-22 - location
    l000-970 - location
    l000-473 - location
    l000-375 - location
    p226 - obj
    p388 - obj
    p535 - obj
    p205 - obj
    p132 - obj
    p852 - obj
    p58 - obj
    p424 - obj
    p235 - obj
    p586 - obj
    p675 - obj
    p733 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-887 c000 )
    ( in-city l000-972 c000 )
    ( in-city l000-219 c000 )
    ( in-city l000-841 c000 )
    ( in-city l000-210 c000 )
    ( in-city l000-890 c000 )
    ( in-city l000-337 c000 )
    ( in-city l000-521 c000 )
    ( in-city l000-569 c000 )
    ( in-city l000-989 c000 )
    ( in-city l000-655 c000 )
    ( in-city l000-22 c000 )
    ( in-city l000-970 c000 )
    ( in-city l000-473 c000 )
    ( in-city l000-375 c000 )
    ( obj-at p226 l000-473 )
    ( obj-at p388 l000-521 )
    ( obj-at p535 l000-887 )
    ( obj-at p205 l000-219 )
    ( obj-at p132 l000-473 )
    ( obj-at p852 l000-521 )
    ( obj-at p58 l000-22 )
    ( obj-at p424 l000-22 )
    ( obj-at p235 l000-521 )
    ( obj-at p586 l000-22 )
    ( obj-at p675 l000-890 )
    ( obj-at p733 l000-890 )
    ( greater-than p388 p226 )
    ( greater-than p535 p226 )
    ( greater-than p535 p388 )
    ( greater-than p205 p226 )
    ( greater-than p205 p388 )
    ( greater-than p205 p535 )
    ( greater-than p132 p226 )
    ( greater-than p132 p388 )
    ( greater-than p132 p535 )
    ( greater-than p132 p205 )
    ( greater-than p852 p226 )
    ( greater-than p852 p388 )
    ( greater-than p852 p535 )
    ( greater-than p852 p205 )
    ( greater-than p852 p132 )
    ( greater-than p58 p226 )
    ( greater-than p58 p388 )
    ( greater-than p58 p535 )
    ( greater-than p58 p205 )
    ( greater-than p58 p132 )
    ( greater-than p58 p852 )
    ( greater-than p424 p226 )
    ( greater-than p424 p388 )
    ( greater-than p424 p535 )
    ( greater-than p424 p205 )
    ( greater-than p424 p132 )
    ( greater-than p424 p852 )
    ( greater-than p424 p58 )
    ( greater-than p235 p226 )
    ( greater-than p235 p388 )
    ( greater-than p235 p535 )
    ( greater-than p235 p205 )
    ( greater-than p235 p132 )
    ( greater-than p235 p852 )
    ( greater-than p235 p58 )
    ( greater-than p235 p424 )
    ( greater-than p586 p226 )
    ( greater-than p586 p388 )
    ( greater-than p586 p535 )
    ( greater-than p586 p205 )
    ( greater-than p586 p132 )
    ( greater-than p586 p852 )
    ( greater-than p586 p58 )
    ( greater-than p586 p424 )
    ( greater-than p586 p235 )
    ( greater-than p675 p226 )
    ( greater-than p675 p388 )
    ( greater-than p675 p535 )
    ( greater-than p675 p205 )
    ( greater-than p675 p132 )
    ( greater-than p675 p852 )
    ( greater-than p675 p58 )
    ( greater-than p675 p424 )
    ( greater-than p675 p235 )
    ( greater-than p675 p586 )
    ( greater-than p733 p226 )
    ( greater-than p733 p388 )
    ( greater-than p733 p535 )
    ( greater-than p733 p205 )
    ( greater-than p733 p132 )
    ( greater-than p733 p852 )
    ( greater-than p733 p58 )
    ( greater-than p733 p424 )
    ( greater-than p733 p235 )
    ( greater-than p733 p586 )
    ( greater-than p733 p675 )
  )
  ( :tasks
    ( Deliver-12Pkg p226 p388 p535 p205 p132 p852 p58 p424 p235 p586 p675 p733 l000-000 )
  )
)
