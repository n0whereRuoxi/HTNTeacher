( define ( domain zeno-travel )
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

  ( :method TRAVEL-VERIFY
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

  ( :method TRAVEL
    :parameters
    (
      ?auto_3 - PERSON
      ?auto_2 - CITY
    )
    :vars
    (
      ?auto_4 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3 ?auto_4 ) ( AIRCRAFT-AT ?auto_4 ?auto_2 ) )
    :subtasks
    ( ( !DEBARK ?auto_3 ?auto_4 ?auto_2 )
      ( TRAVEL-VERIFY ?auto_3 ?auto_2 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_10 - PERSON
      ?auto_9 - CITY
    )
    :vars
    (
      ?auto_11 - AIRCRAFT
      ?auto_14 - CITY
      ?auto_12 - FLEVEL
      ?auto_13 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_10 ?auto_11 ) ( AIRCRAFT-AT ?auto_11 ?auto_14 ) ( FUEL-LEVEL ?auto_11 ?auto_12 ) ( NEXT ?auto_13 ?auto_12 ) ( not ( = ?auto_9 ?auto_14 ) ) ( not ( = ?auto_12 ?auto_13 ) ) )
    :subtasks
    ( ( !FLY ?auto_11 ?auto_14 ?auto_9 ?auto_12 ?auto_13 )
      ( TRAVEL ?auto_10 ?auto_9 )
      ( TRAVEL-VERIFY ?auto_10 ?auto_9 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_16 - PERSON
      ?auto_15 - CITY
    )
    :vars
    (
      ?auto_17 - AIRCRAFT
      ?auto_20 - CITY
      ?auto_18 - FLEVEL
      ?auto_19 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_17 ?auto_20 ) ( FUEL-LEVEL ?auto_17 ?auto_18 ) ( NEXT ?auto_19 ?auto_18 ) ( not ( = ?auto_15 ?auto_20 ) ) ( not ( = ?auto_18 ?auto_19 ) ) ( PERSON-AT ?auto_16 ?auto_20 ) )
    :subtasks
    ( ( !BOARD ?auto_16 ?auto_17 ?auto_20 )
      ( TRAVEL ?auto_16 ?auto_15 )
      ( TRAVEL-VERIFY ?auto_16 ?auto_15 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_78 - PERSON
      ?auto_77 - CITY
    )
    :vars
    (
      ?auto_81 - FLEVEL
      ?auto_80 - FLEVEL
      ?auto_82 - CITY
      ?auto_79 - AIRCRAFT
      ?auto_83 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_81 ?auto_80 ) ( not ( = ?auto_77 ?auto_82 ) ) ( not ( = ?auto_80 ?auto_81 ) ) ( PERSON-AT ?auto_78 ?auto_82 ) ( AIRCRAFT-AT ?auto_79 ?auto_83 ) ( FUEL-LEVEL ?auto_79 ?auto_80 ) ( not ( = ?auto_77 ?auto_83 ) ) ( not ( = ?auto_82 ?auto_83 ) ) )
    :subtasks
    ( ( !FLY ?auto_79 ?auto_83 ?auto_82 ?auto_80 ?auto_81 )
      ( TRAVEL ?auto_78 ?auto_77 )
      ( TRAVEL-VERIFY ?auto_78 ?auto_77 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_72 - PERSON
      ?auto_71 - CITY
    )
    :vars
    (
      ?auto_75 - AIRCRAFT
      ?auto_73 - CITY
      ?auto_76 - FLEVEL
      ?auto_74 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_75 ?auto_73 ) ( NEXT ?auto_76 ?auto_74 ) ( not ( = ?auto_71 ?auto_73 ) ) ( not ( = ?auto_74 ?auto_76 ) ) ( PERSON-AT ?auto_72 ?auto_73 ) ( FUEL-LEVEL ?auto_75 ?auto_76 ) )
    :subtasks
    ( ( !REFUEL ?auto_75 ?auto_73 ?auto_76 ?auto_74 )
      ( TRAVEL ?auto_72 ?auto_71 )
      ( TRAVEL-VERIFY ?auto_72 ?auto_71 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_106 - PERSON
      ?auto_105 - CITY
    )
    :vars
    (
      ?auto_107 - AIRCRAFT
      ?auto_109 - CITY
      ?auto_108 - FLEVEL
      ?auto_110 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_106 ?auto_107 ) ( AIRCRAFT-AT ?auto_107 ?auto_109 ) ( NEXT ?auto_108 ?auto_110 ) ( not ( = ?auto_105 ?auto_109 ) ) ( not ( = ?auto_110 ?auto_108 ) ) ( FUEL-LEVEL ?auto_107 ?auto_108 ) )
    :subtasks
    ( ( !REFUEL ?auto_107 ?auto_109 ?auto_108 ?auto_110 )
      ( TRAVEL ?auto_106 ?auto_105 )
      ( TRAVEL-VERIFY ?auto_106 ?auto_105 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_114 - PERSON
      ?auto_113 - CITY
    )
    :vars
    (
      ?auto_115 - AIRCRAFT
      ?auto_118 - CITY
      ?auto_116 - FLEVEL
      ?auto_117 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_115 ?auto_118 ) ( NEXT ?auto_116 ?auto_117 ) ( not ( = ?auto_113 ?auto_118 ) ) ( not ( = ?auto_117 ?auto_116 ) ) ( FUEL-LEVEL ?auto_115 ?auto_116 ) ( PERSON-AT ?auto_114 ?auto_118 ) )
    :subtasks
    ( ( !BOARD ?auto_114 ?auto_115 ?auto_118 )
      ( TRAVEL ?auto_114 ?auto_113 )
      ( TRAVEL-VERIFY ?auto_114 ?auto_113 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_173 - PERSON
      ?auto_172 - CITY
    )
    :vars
    (
      ?auto_176 - FLEVEL
      ?auto_174 - FLEVEL
      ?auto_177 - CITY
      ?auto_175 - AIRCRAFT
      ?auto_178 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_176 ?auto_174 ) ( not ( = ?auto_172 ?auto_177 ) ) ( not ( = ?auto_174 ?auto_176 ) ) ( PERSON-AT ?auto_173 ?auto_177 ) ( AIRCRAFT-AT ?auto_175 ?auto_178 ) ( not ( = ?auto_172 ?auto_178 ) ) ( not ( = ?auto_177 ?auto_178 ) ) ( FUEL-LEVEL ?auto_175 ?auto_176 ) )
    :subtasks
    ( ( !REFUEL ?auto_175 ?auto_178 ?auto_176 ?auto_174 )
      ( TRAVEL ?auto_173 ?auto_172 )
      ( TRAVEL-VERIFY ?auto_173 ?auto_172 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_302 - PERSON
      ?auto_301 - CITY
    )
    :vars
    (
      ?auto_306 - FLEVEL
      ?auto_304 - FLEVEL
      ?auto_303 - CITY
      ?auto_305 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_306 ?auto_304 ) ( not ( = ?auto_301 ?auto_303 ) ) ( not ( = ?auto_304 ?auto_306 ) ) ( PERSON-AT ?auto_302 ?auto_303 ) ( AIRCRAFT-AT ?auto_305 ?auto_301 ) ( FUEL-LEVEL ?auto_305 ?auto_304 ) )
    :subtasks
    ( ( !FLY ?auto_305 ?auto_301 ?auto_303 ?auto_304 ?auto_306 )
      ( TRAVEL ?auto_302 ?auto_301 )
      ( TRAVEL-VERIFY ?auto_302 ?auto_301 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_492 - PERSON
      ?auto_491 - CITY
    )
    :vars
    (
      ?auto_495 - FLEVEL
      ?auto_496 - FLEVEL
      ?auto_493 - CITY
      ?auto_494 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_495 ?auto_496 ) ( not ( = ?auto_491 ?auto_493 ) ) ( not ( = ?auto_496 ?auto_495 ) ) ( PERSON-AT ?auto_492 ?auto_493 ) ( AIRCRAFT-AT ?auto_494 ?auto_491 ) ( FUEL-LEVEL ?auto_494 ?auto_495 ) )
    :subtasks
    ( ( !REFUEL ?auto_494 ?auto_491 ?auto_495 ?auto_496 )
      ( TRAVEL ?auto_492 ?auto_491 )
      ( TRAVEL-VERIFY ?auto_492 ?auto_491 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_596 - PERSON
      ?auto_595 - CITY
    )
    :vars
    (
      ?auto_601 - FLEVEL
      ?auto_597 - FLEVEL
      ?auto_600 - CITY
      ?auto_599 - CITY
      ?auto_598 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_601 ?auto_597 ) ( not ( = ?auto_595 ?auto_600 ) ) ( not ( = ?auto_597 ?auto_601 ) ) ( PERSON-AT ?auto_596 ?auto_600 ) ( not ( = ?auto_595 ?auto_599 ) ) ( not ( = ?auto_600 ?auto_599 ) ) ( AIRCRAFT-AT ?auto_598 ?auto_595 ) ( FUEL-LEVEL ?auto_598 ?auto_597 ) )
    :subtasks
    ( ( !FLY ?auto_598 ?auto_595 ?auto_599 ?auto_597 ?auto_601 )
      ( TRAVEL ?auto_596 ?auto_595 )
      ( TRAVEL-VERIFY ?auto_596 ?auto_595 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_608 - PERSON
      ?auto_607 - CITY
    )
    :vars
    (
      ?auto_609 - AIRCRAFT
      ?auto_613 - CITY
      ?auto_610 - FLEVEL
      ?auto_611 - FLEVEL
      ?auto_612 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_608 ?auto_609 ) ( AIRCRAFT-AT ?auto_609 ?auto_613 ) ( FUEL-LEVEL ?auto_609 ?auto_610 ) ( NEXT ?auto_611 ?auto_610 ) ( NEXT ?auto_612 ?auto_611 ) ( not ( = ?auto_607 ?auto_613 ) ) ( not ( = ?auto_610 ?auto_611 ) ) ( not ( = ?auto_610 ?auto_612 ) ) ( not ( = ?auto_611 ?auto_612 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_609 ?auto_613 ?auto_607 ?auto_610 ?auto_611 ?auto_612 )
      ( TRAVEL ?auto_608 ?auto_607 )
      ( TRAVEL-VERIFY ?auto_608 ?auto_607 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_706 - PERSON
      ?auto_705 - CITY
    )
    :vars
    (
      ?auto_707 - FLEVEL
      ?auto_710 - FLEVEL
      ?auto_708 - CITY
      ?auto_709 - AIRCRAFT
      ?auto_711 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_707 ?auto_710 ) ( not ( = ?auto_705 ?auto_708 ) ) ( not ( = ?auto_710 ?auto_707 ) ) ( PERSON-AT ?auto_706 ?auto_708 ) ( AIRCRAFT-AT ?auto_709 ?auto_705 ) ( FUEL-LEVEL ?auto_709 ?auto_711 ) ( NEXT ?auto_710 ?auto_711 ) ( not ( = ?auto_707 ?auto_711 ) ) ( not ( = ?auto_710 ?auto_711 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_709 ?auto_705 ?auto_708 ?auto_711 ?auto_710 ?auto_707 )
      ( TRAVEL ?auto_706 ?auto_705 )
      ( TRAVEL-VERIFY ?auto_706 ?auto_705 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_766 - PERSON
      ?auto_765 - CITY
    )
    :vars
    (
      ?auto_768 - FLEVEL
      ?auto_769 - FLEVEL
      ?auto_771 - CITY
      ?auto_767 - FLEVEL
      ?auto_770 - AIRCRAFT
      ?auto_773 - CITY
      ?auto_772 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_768 ?auto_769 ) ( not ( = ?auto_765 ?auto_771 ) ) ( not ( = ?auto_769 ?auto_768 ) ) ( PERSON-AT ?auto_766 ?auto_771 ) ( NEXT ?auto_769 ?auto_767 ) ( not ( = ?auto_768 ?auto_767 ) ) ( not ( = ?auto_769 ?auto_767 ) ) ( AIRCRAFT-AT ?auto_770 ?auto_773 ) ( FUEL-LEVEL ?auto_770 ?auto_772 ) ( NEXT ?auto_767 ?auto_772 ) ( not ( = ?auto_765 ?auto_773 ) ) ( not ( = ?auto_768 ?auto_772 ) ) ( not ( = ?auto_769 ?auto_772 ) ) ( not ( = ?auto_771 ?auto_773 ) ) ( not ( = ?auto_767 ?auto_772 ) ) )
    :subtasks
    ( ( !FLY ?auto_770 ?auto_773 ?auto_765 ?auto_772 ?auto_767 )
      ( TRAVEL ?auto_766 ?auto_765 )
      ( TRAVEL-VERIFY ?auto_766 ?auto_765 ) )
  )

  ( :method TRAVEL
    :parameters
    (
      ?auto_879 - PERSON
      ?auto_878 - CITY
    )
    :vars
    (
      ?auto_880 - FLEVEL
      ?auto_882 - FLEVEL
      ?auto_883 - CITY
      ?auto_881 - AIRCRAFT
      ?auto_885 - CITY
      ?auto_884 - FLEVEL
    )
    :precondition
    ( and ( NEXT ?auto_880 ?auto_882 ) ( not ( = ?auto_878 ?auto_883 ) ) ( not ( = ?auto_882 ?auto_880 ) ) ( PERSON-AT ?auto_879 ?auto_883 ) ( AIRCRAFT-AT ?auto_881 ?auto_885 ) ( FUEL-LEVEL ?auto_881 ?auto_884 ) ( NEXT ?auto_882 ?auto_884 ) ( not ( = ?auto_878 ?auto_885 ) ) ( not ( = ?auto_880 ?auto_884 ) ) ( not ( = ?auto_882 ?auto_884 ) ) ( not ( = ?auto_883 ?auto_885 ) ) )
    :subtasks
    ( ( !ZOOM ?auto_881 ?auto_885 ?auto_883 ?auto_884 ?auto_882 ?auto_880 )
      ( TRAVEL ?auto_879 ?auto_878 )
      ( TRAVEL-VERIFY ?auto_879 ?auto_878 ) )
  )

)

