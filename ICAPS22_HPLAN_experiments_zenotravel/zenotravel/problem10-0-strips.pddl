( define ( problem probname )
  ( :domain zenotravel )
  ( :requirements :strips :typing :equality )
  ( :objects
    level000 - flevel
    level001 - flevel
    city000 - city
    aircraft000 - aircraft
    city214 - city
    city201 - city
    city697 - city
    city621 - city
    city60 - city
    city606 - city
    city791 - city
    city905 - city
    city124 - city
    city77 - city
    city144 - city
    city166 - city
    city177 - city
    city256 - city
    city541 - city
    city817 - city
    person754 - person
    person384 - person
    person669 - person
    person288 - person
    person836 - person
    person766 - person
    person630 - person
    person636 - person
    person305 - person
    person816 - person
  )
  ( :init
    ( next level000 level001 )
    ( aircraft-at aircraft000 city000 )
    ( fuel-level aircraft000 level000 )
    ( person-at person754 city541 )
    ( person-at person384 city166 )
    ( person-at person669 city541 )
    ( person-at person288 city256 )
    ( person-at person836 city201 )
    ( person-at person766 city60 )
    ( person-at person630 city144 )
    ( person-at person636 city124 )
    ( person-at person305 city124 )
    ( person-at person816 city60 )
  )
  ( :goal
    ( and
      ( person-at person754 city000 )
      ( person-at person384 city000 )
      ( person-at person669 city000 )
      ( person-at person288 city000 )
      ( person-at person836 city000 )
      ( person-at person766 city000 )
      ( person-at person630 city000 )
      ( person-at person636 city000 )
      ( person-at person305 city000 )
      ( person-at person816 city000 )
    )
  )
)
