( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city229 - city
    city763 - city
    city777 - city
    city36 - city
    city807 - city
    city900 - city
    city642 - city
    city175 - city
    city858 - city
    city401 - city
    person657 - person
    person881 - person
    person706 - person
    person9 - person
    person182 - person
    person283 - person
    person894 - person
    person48 - person
    person978 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person657 city642 )
    ( person-at person881 city900 )
    ( person-at person706 city900 )
    ( person-at person9 city900 )
    ( person-at person182 city642 )
    ( person-at person283 city807 )
    ( person-at person894 city229 )
    ( person-at person48 city401 )
    ( person-at person978 city36 )
  )
  ( :goal
    ( and
      ( person-at person657 city000 )
      ( person-at person881 city000 )
      ( person-at person706 city000 )
      ( person-at person9 city000 )
      ( person-at person182 city000 )
      ( person-at person283 city000 )
      ( person-at person894 city000 )
      ( person-at person48 city000 )
      ( person-at person978 city000 )
    )
  )
)
