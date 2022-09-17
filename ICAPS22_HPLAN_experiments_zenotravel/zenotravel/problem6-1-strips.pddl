( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city161 - city
    city847 - city
    city146 - city
    city622 - city
    city111 - city
    person844 - person
    person930 - person
    person909 - person
    person134 - person
    person891 - person
    person1 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person844 city111 )
    ( person-at person930 city622 )
    ( person-at person909 city847 )
    ( person-at person134 city622 )
    ( person-at person891 city847 )
    ( person-at person1 city622 )
  )
  ( :goal
    ( and
      ( person-at person844 city000 )
      ( person-at person930 city000 )
      ( person-at person909 city000 )
      ( person-at person134 city000 )
      ( person-at person891 city000 )
      ( person-at person1 city000 )
    )
  )
)
