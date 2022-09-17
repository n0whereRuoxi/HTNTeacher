( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_100 - PERSON
      ?auto_99 - CITY
    )
    :vars
    (
      ?auto_103 - FLEVEL
      ?auto_102 - FLEVEL
      ?auto_104 - CITY
      ?auto_101 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_103 ?auto_102 ) ( PERSON-AT ?auto_100 ?auto_104 ) ( AIRCRAFT-AT ?auto_101 ?auto_99 ) ( FUEL-LEVEL ?auto_101 ?auto_103 ) ( not ( = ?auto_99 ?auto_104 ) ) ( not ( = ?auto_103 ?auto_102 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_101 ?auto_99 ?auto_103 ?auto_102 )
      ( !FLY ?auto_101 ?auto_99 ?auto_104 ?auto_102 ?auto_103 )
      ( !REFUEL ?auto_101 ?auto_104 ?auto_103 ?auto_102 )
      ( !BOARD ?auto_100 ?auto_101 ?auto_104 )
      ( !FLY ?auto_101 ?auto_104 ?auto_99 ?auto_102 ?auto_103 )
      ( !DEBARK ?auto_100 ?auto_101 ?auto_99 )
      ( FLY-1PPL-VERIFY ?auto_100 ?auto_99 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_108 - PERSON
      ?auto_107 - CITY
    )
    :vars
    (
      ?auto_111 - FLEVEL
      ?auto_110 - FLEVEL
      ?auto_112 - CITY
      ?auto_109 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_111 ?auto_110 ) ( PERSON-AT ?auto_108 ?auto_112 ) ( AIRCRAFT-AT ?auto_109 ?auto_107 ) ( FUEL-LEVEL ?auto_109 ?auto_111 ) ( not ( = ?auto_107 ?auto_112 ) ) ( not ( = ?auto_111 ?auto_110 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_109 ?auto_107 ?auto_111 ?auto_110 )
      ( !FLY ?auto_109 ?auto_107 ?auto_112 ?auto_110 ?auto_111 )
      ( !REFUEL ?auto_109 ?auto_112 ?auto_111 ?auto_110 )
      ( !BOARD ?auto_108 ?auto_109 ?auto_112 )
      ( !FLY ?auto_109 ?auto_112 ?auto_107 ?auto_110 ?auto_111 )
      ( !DEBARK ?auto_108 ?auto_109 ?auto_107 )
      ( FLY-1PPL-VERIFY ?auto_108 ?auto_107 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_123 - PERSON
      ?auto_124 - PERSON
      ?auto_122 - CITY
    )
    :vars
    (
      ?auto_125 - FLEVEL
      ?auto_128 - FLEVEL
      ?auto_127 - CITY
      ?auto_129 - CITY
      ?auto_126 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_125 ?auto_128 ) ( PERSON-AT ?auto_124 ?auto_127 ) ( not ( = ?auto_122 ?auto_127 ) ) ( not ( = ?auto_125 ?auto_128 ) ) ( PERSON-AT ?auto_123 ?auto_129 ) ( AIRCRAFT-AT ?auto_126 ?auto_122 ) ( FUEL-LEVEL ?auto_126 ?auto_125 ) ( not ( = ?auto_122 ?auto_129 ) ) ( not ( = ?auto_123 ?auto_124 ) ) ( not ( = ?auto_127 ?auto_129 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_123 ?auto_122 )
      ( FLY-1PPL ?auto_124 ?auto_122 )
      ( FLY-2PPL-VERIFY ?auto_123 ?auto_124 ?auto_122 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_131 - PERSON
      ?auto_132 - PERSON
      ?auto_130 - CITY
    )
    :vars
    (
      ?auto_135 - FLEVEL
      ?auto_133 - FLEVEL
      ?auto_134 - CITY
      ?auto_136 - CITY
      ?auto_137 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_135 ?auto_133 ) ( PERSON-AT ?auto_131 ?auto_134 ) ( not ( = ?auto_130 ?auto_134 ) ) ( not ( = ?auto_135 ?auto_133 ) ) ( PERSON-AT ?auto_132 ?auto_136 ) ( AIRCRAFT-AT ?auto_137 ?auto_130 ) ( FUEL-LEVEL ?auto_137 ?auto_135 ) ( not ( = ?auto_130 ?auto_136 ) ) ( not ( = ?auto_132 ?auto_131 ) ) ( not ( = ?auto_134 ?auto_136 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_132 ?auto_131 ?auto_130 )
      ( FLY-2PPL-VERIFY ?auto_131 ?auto_132 ?auto_130 ) )
  )

)

