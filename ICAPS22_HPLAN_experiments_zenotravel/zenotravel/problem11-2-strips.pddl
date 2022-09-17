( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city27 - city
    city5 - city
    city849 - city
    city458 - city
    city594 - city
    city527 - city
    city875 - city
    city179 - city
    city562 - city
    city650 - city
    city524 - city
    city327 - city
    city173 - city
    person382 - person
    person631 - person
    person336 - person
    person769 - person
    person841 - person
    person366 - person
    person719 - person
    person585 - person
    person214 - person
    person23 - person
    person997 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person382 city527 )
    ( person-at person631 city458 )
    ( person-at person336 city527 )
    ( person-at person769 city27 )
    ( person-at person841 city458 )
    ( person-at person366 city562 )
    ( person-at person719 city875 )
    ( person-at person585 city524 )
    ( person-at person214 city27 )
    ( person-at person23 city327 )
    ( person-at person997 city594 )
  )
  ( :goal
    ( and
      ( person-at person382 city000 )
      ( person-at person631 city000 )
      ( person-at person336 city000 )
      ( person-at person769 city000 )
      ( person-at person841 city000 )
      ( person-at person366 city000 )
      ( person-at person719 city000 )
      ( person-at person585 city000 )
      ( person-at person214 city000 )
      ( person-at person23 city000 )
      ( person-at person997 city000 )
    )
  )
)
