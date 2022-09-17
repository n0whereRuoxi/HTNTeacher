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
      ?auto_150 - PERSON
      ?auto_149 - CITY
    )
    :vars
    (
      ?auto_153 - FLEVEL
      ?auto_152 - FLEVEL
      ?auto_154 - CITY
      ?auto_151 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_153 ?auto_152 ) ( PERSON-AT ?auto_150 ?auto_154 ) ( AIRCRAFT-AT ?auto_151 ?auto_149 ) ( FUEL-LEVEL ?auto_151 ?auto_153 ) ( not ( = ?auto_149 ?auto_154 ) ) ( not ( = ?auto_153 ?auto_152 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_151 ?auto_149 ?auto_153 ?auto_152 )
      ( !FLY ?auto_151 ?auto_149 ?auto_154 ?auto_152 ?auto_153 )
      ( !REFUEL ?auto_151 ?auto_154 ?auto_153 ?auto_152 )
      ( !BOARD ?auto_150 ?auto_151 ?auto_154 )
      ( !FLY ?auto_151 ?auto_154 ?auto_149 ?auto_152 ?auto_153 )
      ( !DEBARK ?auto_150 ?auto_151 ?auto_149 )
      ( FLY-1PPL-VERIFY ?auto_150 ?auto_149 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_158 - PERSON
      ?auto_157 - CITY
    )
    :vars
    (
      ?auto_161 - FLEVEL
      ?auto_160 - FLEVEL
      ?auto_162 - CITY
      ?auto_159 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_161 ?auto_160 ) ( PERSON-AT ?auto_158 ?auto_162 ) ( AIRCRAFT-AT ?auto_159 ?auto_157 ) ( FUEL-LEVEL ?auto_159 ?auto_161 ) ( not ( = ?auto_157 ?auto_162 ) ) ( not ( = ?auto_161 ?auto_160 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_159 ?auto_157 ?auto_161 ?auto_160 )
      ( !FLY ?auto_159 ?auto_157 ?auto_162 ?auto_160 ?auto_161 )
      ( !REFUEL ?auto_159 ?auto_162 ?auto_161 ?auto_160 )
      ( !BOARD ?auto_158 ?auto_159 ?auto_162 )
      ( !FLY ?auto_159 ?auto_162 ?auto_157 ?auto_160 ?auto_161 )
      ( !DEBARK ?auto_158 ?auto_159 ?auto_157 )
      ( FLY-1PPL-VERIFY ?auto_158 ?auto_157 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_173 - PERSON
      ?auto_174 - PERSON
      ?auto_172 - CITY
    )
    :vars
    (
      ?auto_176 - FLEVEL
      ?auto_178 - FLEVEL
      ?auto_175 - CITY
      ?auto_179 - CITY
      ?auto_177 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_176 ?auto_178 ) ( PERSON-AT ?auto_174 ?auto_175 ) ( not ( = ?auto_172 ?auto_175 ) ) ( not ( = ?auto_176 ?auto_178 ) ) ( PERSON-AT ?auto_173 ?auto_179 ) ( AIRCRAFT-AT ?auto_177 ?auto_172 ) ( FUEL-LEVEL ?auto_177 ?auto_176 ) ( not ( = ?auto_172 ?auto_179 ) ) ( not ( = ?auto_173 ?auto_174 ) ) ( not ( = ?auto_175 ?auto_179 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_173 ?auto_172 )
      ( FLY-1PPL ?auto_174 ?auto_172 )
      ( FLY-2PPL-VERIFY ?auto_173 ?auto_174 ?auto_172 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_181 - PERSON
      ?auto_182 - PERSON
      ?auto_180 - CITY
    )
    :vars
    (
      ?auto_187 - FLEVEL
      ?auto_183 - FLEVEL
      ?auto_184 - CITY
      ?auto_186 - CITY
      ?auto_185 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_187 ?auto_183 ) ( PERSON-AT ?auto_181 ?auto_184 ) ( not ( = ?auto_180 ?auto_184 ) ) ( not ( = ?auto_187 ?auto_183 ) ) ( PERSON-AT ?auto_182 ?auto_186 ) ( AIRCRAFT-AT ?auto_185 ?auto_180 ) ( FUEL-LEVEL ?auto_185 ?auto_187 ) ( not ( = ?auto_180 ?auto_186 ) ) ( not ( = ?auto_182 ?auto_181 ) ) ( not ( = ?auto_184 ?auto_186 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_182 ?auto_181 ?auto_180 )
      ( FLY-2PPL-VERIFY ?auto_181 ?auto_182 ?auto_180 ) )
  )

)

