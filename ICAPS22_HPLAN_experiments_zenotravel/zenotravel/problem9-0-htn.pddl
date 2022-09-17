( define ( htn-problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city947 - city
    city607 - city
    city326 - city
    city704 - city
    city590 - city
    city380 - city
    city767 - city
    city877 - city
    city112 - city
    city372 - city
    city90 - city
    city388 - city
    city888 - city
    city108 - city
    city727 - city
    city810 - city
    city466 - city
    person565 - person
    person712 - person
    person538 - person
    person105 - person
    person566 - person
    person758 - person
    person925 - person
    person513 - person
    person501 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person565 city810 )
    ( person-at person712 city326 )
    ( person-at person538 city727 )
    ( person-at person105 city877 )
    ( person-at person566 city372 )
    ( person-at person758 city727 )
    ( person-at person925 city388 )
    ( person-at person513 city607 )
    ( person-at person501 city326 )
  )
  ( :tasks
    ( Fly-9Ppl person565 person712 person538 person105 person566 person758 person925 person513 person501 city000 )
  )
)
