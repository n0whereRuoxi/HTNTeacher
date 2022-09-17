( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city115 - city
    city74 - city
    city703 - city
    city260 - city
    city997 - city
    city62 - city
    city54 - city
    city611 - city
    city477 - city
    city536 - city
    city712 - city
    person218 - person
    person410 - person
    person918 - person
    person644 - person
    person875 - person
    person957 - person
    person688 - person
    person691 - person
    person899 - person
    person959 - person
    person533 - person
    person132 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person218 city477 )
    ( person-at person410 city260 )
    ( person-at person918 city712 )
    ( person-at person644 city260 )
    ( person-at person875 city62 )
    ( person-at person957 city712 )
    ( person-at person688 city477 )
    ( person-at person691 city115 )
    ( person-at person899 city115 )
    ( person-at person959 city712 )
    ( person-at person533 city536 )
    ( person-at person132 city54 )
  )
  ( :goal
    ( and
      ( person-at person218 city000 )
      ( person-at person410 city000 )
      ( person-at person918 city000 )
      ( person-at person644 city000 )
      ( person-at person875 city000 )
      ( person-at person957 city000 )
      ( person-at person688 city000 )
      ( person-at person691 city000 )
      ( person-at person899 city000 )
      ( person-at person959 city000 )
      ( person-at person533 city000 )
      ( person-at person132 city000 )
    )
  )
)
