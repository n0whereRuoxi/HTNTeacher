( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19084 - SURFACE
      ?auto_19085 - SURFACE
    )
    :vars
    (
      ?auto_19086 - HOIST
      ?auto_19087 - PLACE
      ?auto_19089 - PLACE
      ?auto_19090 - HOIST
      ?auto_19091 - SURFACE
      ?auto_19088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19086 ?auto_19087 ) ( SURFACE-AT ?auto_19084 ?auto_19087 ) ( CLEAR ?auto_19084 ) ( IS-CRATE ?auto_19085 ) ( AVAILABLE ?auto_19086 ) ( not ( = ?auto_19089 ?auto_19087 ) ) ( HOIST-AT ?auto_19090 ?auto_19089 ) ( AVAILABLE ?auto_19090 ) ( SURFACE-AT ?auto_19085 ?auto_19089 ) ( ON ?auto_19085 ?auto_19091 ) ( CLEAR ?auto_19085 ) ( TRUCK-AT ?auto_19088 ?auto_19087 ) ( not ( = ?auto_19084 ?auto_19085 ) ) ( not ( = ?auto_19084 ?auto_19091 ) ) ( not ( = ?auto_19085 ?auto_19091 ) ) ( not ( = ?auto_19086 ?auto_19090 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19088 ?auto_19087 ?auto_19089 )
      ( !LIFT ?auto_19090 ?auto_19085 ?auto_19091 ?auto_19089 )
      ( !LOAD ?auto_19090 ?auto_19085 ?auto_19088 ?auto_19089 )
      ( !DRIVE ?auto_19088 ?auto_19089 ?auto_19087 )
      ( !UNLOAD ?auto_19086 ?auto_19085 ?auto_19088 ?auto_19087 )
      ( !DROP ?auto_19086 ?auto_19085 ?auto_19084 ?auto_19087 )
      ( MAKE-1CRATE-VERIFY ?auto_19084 ?auto_19085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19105 - SURFACE
      ?auto_19106 - SURFACE
      ?auto_19107 - SURFACE
    )
    :vars
    (
      ?auto_19112 - HOIST
      ?auto_19113 - PLACE
      ?auto_19111 - PLACE
      ?auto_19109 - HOIST
      ?auto_19110 - SURFACE
      ?auto_19114 - PLACE
      ?auto_19115 - HOIST
      ?auto_19116 - SURFACE
      ?auto_19108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19112 ?auto_19113 ) ( IS-CRATE ?auto_19107 ) ( not ( = ?auto_19111 ?auto_19113 ) ) ( HOIST-AT ?auto_19109 ?auto_19111 ) ( AVAILABLE ?auto_19109 ) ( SURFACE-AT ?auto_19107 ?auto_19111 ) ( ON ?auto_19107 ?auto_19110 ) ( CLEAR ?auto_19107 ) ( not ( = ?auto_19106 ?auto_19107 ) ) ( not ( = ?auto_19106 ?auto_19110 ) ) ( not ( = ?auto_19107 ?auto_19110 ) ) ( not ( = ?auto_19112 ?auto_19109 ) ) ( SURFACE-AT ?auto_19105 ?auto_19113 ) ( CLEAR ?auto_19105 ) ( IS-CRATE ?auto_19106 ) ( AVAILABLE ?auto_19112 ) ( not ( = ?auto_19114 ?auto_19113 ) ) ( HOIST-AT ?auto_19115 ?auto_19114 ) ( AVAILABLE ?auto_19115 ) ( SURFACE-AT ?auto_19106 ?auto_19114 ) ( ON ?auto_19106 ?auto_19116 ) ( CLEAR ?auto_19106 ) ( TRUCK-AT ?auto_19108 ?auto_19113 ) ( not ( = ?auto_19105 ?auto_19106 ) ) ( not ( = ?auto_19105 ?auto_19116 ) ) ( not ( = ?auto_19106 ?auto_19116 ) ) ( not ( = ?auto_19112 ?auto_19115 ) ) ( not ( = ?auto_19105 ?auto_19107 ) ) ( not ( = ?auto_19105 ?auto_19110 ) ) ( not ( = ?auto_19107 ?auto_19116 ) ) ( not ( = ?auto_19111 ?auto_19114 ) ) ( not ( = ?auto_19109 ?auto_19115 ) ) ( not ( = ?auto_19110 ?auto_19116 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19105 ?auto_19106 )
      ( MAKE-1CRATE ?auto_19106 ?auto_19107 )
      ( MAKE-2CRATE-VERIFY ?auto_19105 ?auto_19106 ?auto_19107 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19131 - SURFACE
      ?auto_19132 - SURFACE
      ?auto_19133 - SURFACE
      ?auto_19134 - SURFACE
    )
    :vars
    (
      ?auto_19139 - HOIST
      ?auto_19138 - PLACE
      ?auto_19140 - PLACE
      ?auto_19136 - HOIST
      ?auto_19135 - SURFACE
      ?auto_19142 - PLACE
      ?auto_19146 - HOIST
      ?auto_19143 - SURFACE
      ?auto_19141 - PLACE
      ?auto_19144 - HOIST
      ?auto_19145 - SURFACE
      ?auto_19137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19139 ?auto_19138 ) ( IS-CRATE ?auto_19134 ) ( not ( = ?auto_19140 ?auto_19138 ) ) ( HOIST-AT ?auto_19136 ?auto_19140 ) ( AVAILABLE ?auto_19136 ) ( SURFACE-AT ?auto_19134 ?auto_19140 ) ( ON ?auto_19134 ?auto_19135 ) ( CLEAR ?auto_19134 ) ( not ( = ?auto_19133 ?auto_19134 ) ) ( not ( = ?auto_19133 ?auto_19135 ) ) ( not ( = ?auto_19134 ?auto_19135 ) ) ( not ( = ?auto_19139 ?auto_19136 ) ) ( IS-CRATE ?auto_19133 ) ( not ( = ?auto_19142 ?auto_19138 ) ) ( HOIST-AT ?auto_19146 ?auto_19142 ) ( AVAILABLE ?auto_19146 ) ( SURFACE-AT ?auto_19133 ?auto_19142 ) ( ON ?auto_19133 ?auto_19143 ) ( CLEAR ?auto_19133 ) ( not ( = ?auto_19132 ?auto_19133 ) ) ( not ( = ?auto_19132 ?auto_19143 ) ) ( not ( = ?auto_19133 ?auto_19143 ) ) ( not ( = ?auto_19139 ?auto_19146 ) ) ( SURFACE-AT ?auto_19131 ?auto_19138 ) ( CLEAR ?auto_19131 ) ( IS-CRATE ?auto_19132 ) ( AVAILABLE ?auto_19139 ) ( not ( = ?auto_19141 ?auto_19138 ) ) ( HOIST-AT ?auto_19144 ?auto_19141 ) ( AVAILABLE ?auto_19144 ) ( SURFACE-AT ?auto_19132 ?auto_19141 ) ( ON ?auto_19132 ?auto_19145 ) ( CLEAR ?auto_19132 ) ( TRUCK-AT ?auto_19137 ?auto_19138 ) ( not ( = ?auto_19131 ?auto_19132 ) ) ( not ( = ?auto_19131 ?auto_19145 ) ) ( not ( = ?auto_19132 ?auto_19145 ) ) ( not ( = ?auto_19139 ?auto_19144 ) ) ( not ( = ?auto_19131 ?auto_19133 ) ) ( not ( = ?auto_19131 ?auto_19143 ) ) ( not ( = ?auto_19133 ?auto_19145 ) ) ( not ( = ?auto_19142 ?auto_19141 ) ) ( not ( = ?auto_19146 ?auto_19144 ) ) ( not ( = ?auto_19143 ?auto_19145 ) ) ( not ( = ?auto_19131 ?auto_19134 ) ) ( not ( = ?auto_19131 ?auto_19135 ) ) ( not ( = ?auto_19132 ?auto_19134 ) ) ( not ( = ?auto_19132 ?auto_19135 ) ) ( not ( = ?auto_19134 ?auto_19143 ) ) ( not ( = ?auto_19134 ?auto_19145 ) ) ( not ( = ?auto_19140 ?auto_19142 ) ) ( not ( = ?auto_19140 ?auto_19141 ) ) ( not ( = ?auto_19136 ?auto_19146 ) ) ( not ( = ?auto_19136 ?auto_19144 ) ) ( not ( = ?auto_19135 ?auto_19143 ) ) ( not ( = ?auto_19135 ?auto_19145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19131 ?auto_19132 ?auto_19133 )
      ( MAKE-1CRATE ?auto_19133 ?auto_19134 )
      ( MAKE-3CRATE-VERIFY ?auto_19131 ?auto_19132 ?auto_19133 ?auto_19134 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19162 - SURFACE
      ?auto_19163 - SURFACE
      ?auto_19164 - SURFACE
      ?auto_19165 - SURFACE
      ?auto_19166 - SURFACE
    )
    :vars
    (
      ?auto_19172 - HOIST
      ?auto_19171 - PLACE
      ?auto_19169 - PLACE
      ?auto_19170 - HOIST
      ?auto_19168 - SURFACE
      ?auto_19174 - PLACE
      ?auto_19177 - HOIST
      ?auto_19173 - SURFACE
      ?auto_19179 - PLACE
      ?auto_19175 - HOIST
      ?auto_19178 - SURFACE
      ?auto_19176 - PLACE
      ?auto_19180 - HOIST
      ?auto_19181 - SURFACE
      ?auto_19167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19172 ?auto_19171 ) ( IS-CRATE ?auto_19166 ) ( not ( = ?auto_19169 ?auto_19171 ) ) ( HOIST-AT ?auto_19170 ?auto_19169 ) ( AVAILABLE ?auto_19170 ) ( SURFACE-AT ?auto_19166 ?auto_19169 ) ( ON ?auto_19166 ?auto_19168 ) ( CLEAR ?auto_19166 ) ( not ( = ?auto_19165 ?auto_19166 ) ) ( not ( = ?auto_19165 ?auto_19168 ) ) ( not ( = ?auto_19166 ?auto_19168 ) ) ( not ( = ?auto_19172 ?auto_19170 ) ) ( IS-CRATE ?auto_19165 ) ( not ( = ?auto_19174 ?auto_19171 ) ) ( HOIST-AT ?auto_19177 ?auto_19174 ) ( AVAILABLE ?auto_19177 ) ( SURFACE-AT ?auto_19165 ?auto_19174 ) ( ON ?auto_19165 ?auto_19173 ) ( CLEAR ?auto_19165 ) ( not ( = ?auto_19164 ?auto_19165 ) ) ( not ( = ?auto_19164 ?auto_19173 ) ) ( not ( = ?auto_19165 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19177 ) ) ( IS-CRATE ?auto_19164 ) ( not ( = ?auto_19179 ?auto_19171 ) ) ( HOIST-AT ?auto_19175 ?auto_19179 ) ( AVAILABLE ?auto_19175 ) ( SURFACE-AT ?auto_19164 ?auto_19179 ) ( ON ?auto_19164 ?auto_19178 ) ( CLEAR ?auto_19164 ) ( not ( = ?auto_19163 ?auto_19164 ) ) ( not ( = ?auto_19163 ?auto_19178 ) ) ( not ( = ?auto_19164 ?auto_19178 ) ) ( not ( = ?auto_19172 ?auto_19175 ) ) ( SURFACE-AT ?auto_19162 ?auto_19171 ) ( CLEAR ?auto_19162 ) ( IS-CRATE ?auto_19163 ) ( AVAILABLE ?auto_19172 ) ( not ( = ?auto_19176 ?auto_19171 ) ) ( HOIST-AT ?auto_19180 ?auto_19176 ) ( AVAILABLE ?auto_19180 ) ( SURFACE-AT ?auto_19163 ?auto_19176 ) ( ON ?auto_19163 ?auto_19181 ) ( CLEAR ?auto_19163 ) ( TRUCK-AT ?auto_19167 ?auto_19171 ) ( not ( = ?auto_19162 ?auto_19163 ) ) ( not ( = ?auto_19162 ?auto_19181 ) ) ( not ( = ?auto_19163 ?auto_19181 ) ) ( not ( = ?auto_19172 ?auto_19180 ) ) ( not ( = ?auto_19162 ?auto_19164 ) ) ( not ( = ?auto_19162 ?auto_19178 ) ) ( not ( = ?auto_19164 ?auto_19181 ) ) ( not ( = ?auto_19179 ?auto_19176 ) ) ( not ( = ?auto_19175 ?auto_19180 ) ) ( not ( = ?auto_19178 ?auto_19181 ) ) ( not ( = ?auto_19162 ?auto_19165 ) ) ( not ( = ?auto_19162 ?auto_19173 ) ) ( not ( = ?auto_19163 ?auto_19165 ) ) ( not ( = ?auto_19163 ?auto_19173 ) ) ( not ( = ?auto_19165 ?auto_19178 ) ) ( not ( = ?auto_19165 ?auto_19181 ) ) ( not ( = ?auto_19174 ?auto_19179 ) ) ( not ( = ?auto_19174 ?auto_19176 ) ) ( not ( = ?auto_19177 ?auto_19175 ) ) ( not ( = ?auto_19177 ?auto_19180 ) ) ( not ( = ?auto_19173 ?auto_19178 ) ) ( not ( = ?auto_19173 ?auto_19181 ) ) ( not ( = ?auto_19162 ?auto_19166 ) ) ( not ( = ?auto_19162 ?auto_19168 ) ) ( not ( = ?auto_19163 ?auto_19166 ) ) ( not ( = ?auto_19163 ?auto_19168 ) ) ( not ( = ?auto_19164 ?auto_19166 ) ) ( not ( = ?auto_19164 ?auto_19168 ) ) ( not ( = ?auto_19166 ?auto_19173 ) ) ( not ( = ?auto_19166 ?auto_19178 ) ) ( not ( = ?auto_19166 ?auto_19181 ) ) ( not ( = ?auto_19169 ?auto_19174 ) ) ( not ( = ?auto_19169 ?auto_19179 ) ) ( not ( = ?auto_19169 ?auto_19176 ) ) ( not ( = ?auto_19170 ?auto_19177 ) ) ( not ( = ?auto_19170 ?auto_19175 ) ) ( not ( = ?auto_19170 ?auto_19180 ) ) ( not ( = ?auto_19168 ?auto_19173 ) ) ( not ( = ?auto_19168 ?auto_19178 ) ) ( not ( = ?auto_19168 ?auto_19181 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19162 ?auto_19163 ?auto_19164 ?auto_19165 )
      ( MAKE-1CRATE ?auto_19165 ?auto_19166 )
      ( MAKE-4CRATE-VERIFY ?auto_19162 ?auto_19163 ?auto_19164 ?auto_19165 ?auto_19166 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19198 - SURFACE
      ?auto_19199 - SURFACE
      ?auto_19200 - SURFACE
      ?auto_19201 - SURFACE
      ?auto_19202 - SURFACE
      ?auto_19203 - SURFACE
    )
    :vars
    (
      ?auto_19209 - HOIST
      ?auto_19204 - PLACE
      ?auto_19208 - PLACE
      ?auto_19205 - HOIST
      ?auto_19206 - SURFACE
      ?auto_19210 - PLACE
      ?auto_19211 - HOIST
      ?auto_19219 - SURFACE
      ?auto_19213 - PLACE
      ?auto_19220 - HOIST
      ?auto_19212 - SURFACE
      ?auto_19216 - PLACE
      ?auto_19221 - HOIST
      ?auto_19217 - SURFACE
      ?auto_19218 - PLACE
      ?auto_19215 - HOIST
      ?auto_19214 - SURFACE
      ?auto_19207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19209 ?auto_19204 ) ( IS-CRATE ?auto_19203 ) ( not ( = ?auto_19208 ?auto_19204 ) ) ( HOIST-AT ?auto_19205 ?auto_19208 ) ( AVAILABLE ?auto_19205 ) ( SURFACE-AT ?auto_19203 ?auto_19208 ) ( ON ?auto_19203 ?auto_19206 ) ( CLEAR ?auto_19203 ) ( not ( = ?auto_19202 ?auto_19203 ) ) ( not ( = ?auto_19202 ?auto_19206 ) ) ( not ( = ?auto_19203 ?auto_19206 ) ) ( not ( = ?auto_19209 ?auto_19205 ) ) ( IS-CRATE ?auto_19202 ) ( not ( = ?auto_19210 ?auto_19204 ) ) ( HOIST-AT ?auto_19211 ?auto_19210 ) ( AVAILABLE ?auto_19211 ) ( SURFACE-AT ?auto_19202 ?auto_19210 ) ( ON ?auto_19202 ?auto_19219 ) ( CLEAR ?auto_19202 ) ( not ( = ?auto_19201 ?auto_19202 ) ) ( not ( = ?auto_19201 ?auto_19219 ) ) ( not ( = ?auto_19202 ?auto_19219 ) ) ( not ( = ?auto_19209 ?auto_19211 ) ) ( IS-CRATE ?auto_19201 ) ( not ( = ?auto_19213 ?auto_19204 ) ) ( HOIST-AT ?auto_19220 ?auto_19213 ) ( AVAILABLE ?auto_19220 ) ( SURFACE-AT ?auto_19201 ?auto_19213 ) ( ON ?auto_19201 ?auto_19212 ) ( CLEAR ?auto_19201 ) ( not ( = ?auto_19200 ?auto_19201 ) ) ( not ( = ?auto_19200 ?auto_19212 ) ) ( not ( = ?auto_19201 ?auto_19212 ) ) ( not ( = ?auto_19209 ?auto_19220 ) ) ( IS-CRATE ?auto_19200 ) ( not ( = ?auto_19216 ?auto_19204 ) ) ( HOIST-AT ?auto_19221 ?auto_19216 ) ( AVAILABLE ?auto_19221 ) ( SURFACE-AT ?auto_19200 ?auto_19216 ) ( ON ?auto_19200 ?auto_19217 ) ( CLEAR ?auto_19200 ) ( not ( = ?auto_19199 ?auto_19200 ) ) ( not ( = ?auto_19199 ?auto_19217 ) ) ( not ( = ?auto_19200 ?auto_19217 ) ) ( not ( = ?auto_19209 ?auto_19221 ) ) ( SURFACE-AT ?auto_19198 ?auto_19204 ) ( CLEAR ?auto_19198 ) ( IS-CRATE ?auto_19199 ) ( AVAILABLE ?auto_19209 ) ( not ( = ?auto_19218 ?auto_19204 ) ) ( HOIST-AT ?auto_19215 ?auto_19218 ) ( AVAILABLE ?auto_19215 ) ( SURFACE-AT ?auto_19199 ?auto_19218 ) ( ON ?auto_19199 ?auto_19214 ) ( CLEAR ?auto_19199 ) ( TRUCK-AT ?auto_19207 ?auto_19204 ) ( not ( = ?auto_19198 ?auto_19199 ) ) ( not ( = ?auto_19198 ?auto_19214 ) ) ( not ( = ?auto_19199 ?auto_19214 ) ) ( not ( = ?auto_19209 ?auto_19215 ) ) ( not ( = ?auto_19198 ?auto_19200 ) ) ( not ( = ?auto_19198 ?auto_19217 ) ) ( not ( = ?auto_19200 ?auto_19214 ) ) ( not ( = ?auto_19216 ?auto_19218 ) ) ( not ( = ?auto_19221 ?auto_19215 ) ) ( not ( = ?auto_19217 ?auto_19214 ) ) ( not ( = ?auto_19198 ?auto_19201 ) ) ( not ( = ?auto_19198 ?auto_19212 ) ) ( not ( = ?auto_19199 ?auto_19201 ) ) ( not ( = ?auto_19199 ?auto_19212 ) ) ( not ( = ?auto_19201 ?auto_19217 ) ) ( not ( = ?auto_19201 ?auto_19214 ) ) ( not ( = ?auto_19213 ?auto_19216 ) ) ( not ( = ?auto_19213 ?auto_19218 ) ) ( not ( = ?auto_19220 ?auto_19221 ) ) ( not ( = ?auto_19220 ?auto_19215 ) ) ( not ( = ?auto_19212 ?auto_19217 ) ) ( not ( = ?auto_19212 ?auto_19214 ) ) ( not ( = ?auto_19198 ?auto_19202 ) ) ( not ( = ?auto_19198 ?auto_19219 ) ) ( not ( = ?auto_19199 ?auto_19202 ) ) ( not ( = ?auto_19199 ?auto_19219 ) ) ( not ( = ?auto_19200 ?auto_19202 ) ) ( not ( = ?auto_19200 ?auto_19219 ) ) ( not ( = ?auto_19202 ?auto_19212 ) ) ( not ( = ?auto_19202 ?auto_19217 ) ) ( not ( = ?auto_19202 ?auto_19214 ) ) ( not ( = ?auto_19210 ?auto_19213 ) ) ( not ( = ?auto_19210 ?auto_19216 ) ) ( not ( = ?auto_19210 ?auto_19218 ) ) ( not ( = ?auto_19211 ?auto_19220 ) ) ( not ( = ?auto_19211 ?auto_19221 ) ) ( not ( = ?auto_19211 ?auto_19215 ) ) ( not ( = ?auto_19219 ?auto_19212 ) ) ( not ( = ?auto_19219 ?auto_19217 ) ) ( not ( = ?auto_19219 ?auto_19214 ) ) ( not ( = ?auto_19198 ?auto_19203 ) ) ( not ( = ?auto_19198 ?auto_19206 ) ) ( not ( = ?auto_19199 ?auto_19203 ) ) ( not ( = ?auto_19199 ?auto_19206 ) ) ( not ( = ?auto_19200 ?auto_19203 ) ) ( not ( = ?auto_19200 ?auto_19206 ) ) ( not ( = ?auto_19201 ?auto_19203 ) ) ( not ( = ?auto_19201 ?auto_19206 ) ) ( not ( = ?auto_19203 ?auto_19219 ) ) ( not ( = ?auto_19203 ?auto_19212 ) ) ( not ( = ?auto_19203 ?auto_19217 ) ) ( not ( = ?auto_19203 ?auto_19214 ) ) ( not ( = ?auto_19208 ?auto_19210 ) ) ( not ( = ?auto_19208 ?auto_19213 ) ) ( not ( = ?auto_19208 ?auto_19216 ) ) ( not ( = ?auto_19208 ?auto_19218 ) ) ( not ( = ?auto_19205 ?auto_19211 ) ) ( not ( = ?auto_19205 ?auto_19220 ) ) ( not ( = ?auto_19205 ?auto_19221 ) ) ( not ( = ?auto_19205 ?auto_19215 ) ) ( not ( = ?auto_19206 ?auto_19219 ) ) ( not ( = ?auto_19206 ?auto_19212 ) ) ( not ( = ?auto_19206 ?auto_19217 ) ) ( not ( = ?auto_19206 ?auto_19214 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19198 ?auto_19199 ?auto_19200 ?auto_19201 ?auto_19202 )
      ( MAKE-1CRATE ?auto_19202 ?auto_19203 )
      ( MAKE-5CRATE-VERIFY ?auto_19198 ?auto_19199 ?auto_19200 ?auto_19201 ?auto_19202 ?auto_19203 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_19239 - SURFACE
      ?auto_19240 - SURFACE
      ?auto_19241 - SURFACE
      ?auto_19242 - SURFACE
      ?auto_19243 - SURFACE
      ?auto_19244 - SURFACE
      ?auto_19245 - SURFACE
    )
    :vars
    (
      ?auto_19246 - HOIST
      ?auto_19251 - PLACE
      ?auto_19250 - PLACE
      ?auto_19249 - HOIST
      ?auto_19248 - SURFACE
      ?auto_19266 - PLACE
      ?auto_19252 - HOIST
      ?auto_19261 - SURFACE
      ?auto_19259 - PLACE
      ?auto_19255 - HOIST
      ?auto_19253 - SURFACE
      ?auto_19254 - PLACE
      ?auto_19260 - HOIST
      ?auto_19256 - SURFACE
      ?auto_19265 - PLACE
      ?auto_19258 - HOIST
      ?auto_19262 - SURFACE
      ?auto_19257 - PLACE
      ?auto_19263 - HOIST
      ?auto_19264 - SURFACE
      ?auto_19247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19246 ?auto_19251 ) ( IS-CRATE ?auto_19245 ) ( not ( = ?auto_19250 ?auto_19251 ) ) ( HOIST-AT ?auto_19249 ?auto_19250 ) ( AVAILABLE ?auto_19249 ) ( SURFACE-AT ?auto_19245 ?auto_19250 ) ( ON ?auto_19245 ?auto_19248 ) ( CLEAR ?auto_19245 ) ( not ( = ?auto_19244 ?auto_19245 ) ) ( not ( = ?auto_19244 ?auto_19248 ) ) ( not ( = ?auto_19245 ?auto_19248 ) ) ( not ( = ?auto_19246 ?auto_19249 ) ) ( IS-CRATE ?auto_19244 ) ( not ( = ?auto_19266 ?auto_19251 ) ) ( HOIST-AT ?auto_19252 ?auto_19266 ) ( AVAILABLE ?auto_19252 ) ( SURFACE-AT ?auto_19244 ?auto_19266 ) ( ON ?auto_19244 ?auto_19261 ) ( CLEAR ?auto_19244 ) ( not ( = ?auto_19243 ?auto_19244 ) ) ( not ( = ?auto_19243 ?auto_19261 ) ) ( not ( = ?auto_19244 ?auto_19261 ) ) ( not ( = ?auto_19246 ?auto_19252 ) ) ( IS-CRATE ?auto_19243 ) ( not ( = ?auto_19259 ?auto_19251 ) ) ( HOIST-AT ?auto_19255 ?auto_19259 ) ( AVAILABLE ?auto_19255 ) ( SURFACE-AT ?auto_19243 ?auto_19259 ) ( ON ?auto_19243 ?auto_19253 ) ( CLEAR ?auto_19243 ) ( not ( = ?auto_19242 ?auto_19243 ) ) ( not ( = ?auto_19242 ?auto_19253 ) ) ( not ( = ?auto_19243 ?auto_19253 ) ) ( not ( = ?auto_19246 ?auto_19255 ) ) ( IS-CRATE ?auto_19242 ) ( not ( = ?auto_19254 ?auto_19251 ) ) ( HOIST-AT ?auto_19260 ?auto_19254 ) ( AVAILABLE ?auto_19260 ) ( SURFACE-AT ?auto_19242 ?auto_19254 ) ( ON ?auto_19242 ?auto_19256 ) ( CLEAR ?auto_19242 ) ( not ( = ?auto_19241 ?auto_19242 ) ) ( not ( = ?auto_19241 ?auto_19256 ) ) ( not ( = ?auto_19242 ?auto_19256 ) ) ( not ( = ?auto_19246 ?auto_19260 ) ) ( IS-CRATE ?auto_19241 ) ( not ( = ?auto_19265 ?auto_19251 ) ) ( HOIST-AT ?auto_19258 ?auto_19265 ) ( AVAILABLE ?auto_19258 ) ( SURFACE-AT ?auto_19241 ?auto_19265 ) ( ON ?auto_19241 ?auto_19262 ) ( CLEAR ?auto_19241 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19240 ?auto_19262 ) ) ( not ( = ?auto_19241 ?auto_19262 ) ) ( not ( = ?auto_19246 ?auto_19258 ) ) ( SURFACE-AT ?auto_19239 ?auto_19251 ) ( CLEAR ?auto_19239 ) ( IS-CRATE ?auto_19240 ) ( AVAILABLE ?auto_19246 ) ( not ( = ?auto_19257 ?auto_19251 ) ) ( HOIST-AT ?auto_19263 ?auto_19257 ) ( AVAILABLE ?auto_19263 ) ( SURFACE-AT ?auto_19240 ?auto_19257 ) ( ON ?auto_19240 ?auto_19264 ) ( CLEAR ?auto_19240 ) ( TRUCK-AT ?auto_19247 ?auto_19251 ) ( not ( = ?auto_19239 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19264 ) ) ( not ( = ?auto_19240 ?auto_19264 ) ) ( not ( = ?auto_19246 ?auto_19263 ) ) ( not ( = ?auto_19239 ?auto_19241 ) ) ( not ( = ?auto_19239 ?auto_19262 ) ) ( not ( = ?auto_19241 ?auto_19264 ) ) ( not ( = ?auto_19265 ?auto_19257 ) ) ( not ( = ?auto_19258 ?auto_19263 ) ) ( not ( = ?auto_19262 ?auto_19264 ) ) ( not ( = ?auto_19239 ?auto_19242 ) ) ( not ( = ?auto_19239 ?auto_19256 ) ) ( not ( = ?auto_19240 ?auto_19242 ) ) ( not ( = ?auto_19240 ?auto_19256 ) ) ( not ( = ?auto_19242 ?auto_19262 ) ) ( not ( = ?auto_19242 ?auto_19264 ) ) ( not ( = ?auto_19254 ?auto_19265 ) ) ( not ( = ?auto_19254 ?auto_19257 ) ) ( not ( = ?auto_19260 ?auto_19258 ) ) ( not ( = ?auto_19260 ?auto_19263 ) ) ( not ( = ?auto_19256 ?auto_19262 ) ) ( not ( = ?auto_19256 ?auto_19264 ) ) ( not ( = ?auto_19239 ?auto_19243 ) ) ( not ( = ?auto_19239 ?auto_19253 ) ) ( not ( = ?auto_19240 ?auto_19243 ) ) ( not ( = ?auto_19240 ?auto_19253 ) ) ( not ( = ?auto_19241 ?auto_19243 ) ) ( not ( = ?auto_19241 ?auto_19253 ) ) ( not ( = ?auto_19243 ?auto_19256 ) ) ( not ( = ?auto_19243 ?auto_19262 ) ) ( not ( = ?auto_19243 ?auto_19264 ) ) ( not ( = ?auto_19259 ?auto_19254 ) ) ( not ( = ?auto_19259 ?auto_19265 ) ) ( not ( = ?auto_19259 ?auto_19257 ) ) ( not ( = ?auto_19255 ?auto_19260 ) ) ( not ( = ?auto_19255 ?auto_19258 ) ) ( not ( = ?auto_19255 ?auto_19263 ) ) ( not ( = ?auto_19253 ?auto_19256 ) ) ( not ( = ?auto_19253 ?auto_19262 ) ) ( not ( = ?auto_19253 ?auto_19264 ) ) ( not ( = ?auto_19239 ?auto_19244 ) ) ( not ( = ?auto_19239 ?auto_19261 ) ) ( not ( = ?auto_19240 ?auto_19244 ) ) ( not ( = ?auto_19240 ?auto_19261 ) ) ( not ( = ?auto_19241 ?auto_19244 ) ) ( not ( = ?auto_19241 ?auto_19261 ) ) ( not ( = ?auto_19242 ?auto_19244 ) ) ( not ( = ?auto_19242 ?auto_19261 ) ) ( not ( = ?auto_19244 ?auto_19253 ) ) ( not ( = ?auto_19244 ?auto_19256 ) ) ( not ( = ?auto_19244 ?auto_19262 ) ) ( not ( = ?auto_19244 ?auto_19264 ) ) ( not ( = ?auto_19266 ?auto_19259 ) ) ( not ( = ?auto_19266 ?auto_19254 ) ) ( not ( = ?auto_19266 ?auto_19265 ) ) ( not ( = ?auto_19266 ?auto_19257 ) ) ( not ( = ?auto_19252 ?auto_19255 ) ) ( not ( = ?auto_19252 ?auto_19260 ) ) ( not ( = ?auto_19252 ?auto_19258 ) ) ( not ( = ?auto_19252 ?auto_19263 ) ) ( not ( = ?auto_19261 ?auto_19253 ) ) ( not ( = ?auto_19261 ?auto_19256 ) ) ( not ( = ?auto_19261 ?auto_19262 ) ) ( not ( = ?auto_19261 ?auto_19264 ) ) ( not ( = ?auto_19239 ?auto_19245 ) ) ( not ( = ?auto_19239 ?auto_19248 ) ) ( not ( = ?auto_19240 ?auto_19245 ) ) ( not ( = ?auto_19240 ?auto_19248 ) ) ( not ( = ?auto_19241 ?auto_19245 ) ) ( not ( = ?auto_19241 ?auto_19248 ) ) ( not ( = ?auto_19242 ?auto_19245 ) ) ( not ( = ?auto_19242 ?auto_19248 ) ) ( not ( = ?auto_19243 ?auto_19245 ) ) ( not ( = ?auto_19243 ?auto_19248 ) ) ( not ( = ?auto_19245 ?auto_19261 ) ) ( not ( = ?auto_19245 ?auto_19253 ) ) ( not ( = ?auto_19245 ?auto_19256 ) ) ( not ( = ?auto_19245 ?auto_19262 ) ) ( not ( = ?auto_19245 ?auto_19264 ) ) ( not ( = ?auto_19250 ?auto_19266 ) ) ( not ( = ?auto_19250 ?auto_19259 ) ) ( not ( = ?auto_19250 ?auto_19254 ) ) ( not ( = ?auto_19250 ?auto_19265 ) ) ( not ( = ?auto_19250 ?auto_19257 ) ) ( not ( = ?auto_19249 ?auto_19252 ) ) ( not ( = ?auto_19249 ?auto_19255 ) ) ( not ( = ?auto_19249 ?auto_19260 ) ) ( not ( = ?auto_19249 ?auto_19258 ) ) ( not ( = ?auto_19249 ?auto_19263 ) ) ( not ( = ?auto_19248 ?auto_19261 ) ) ( not ( = ?auto_19248 ?auto_19253 ) ) ( not ( = ?auto_19248 ?auto_19256 ) ) ( not ( = ?auto_19248 ?auto_19262 ) ) ( not ( = ?auto_19248 ?auto_19264 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19244 )
      ( MAKE-1CRATE ?auto_19244 ?auto_19245 )
      ( MAKE-6CRATE-VERIFY ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19244 ?auto_19245 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_19285 - SURFACE
      ?auto_19286 - SURFACE
      ?auto_19287 - SURFACE
      ?auto_19288 - SURFACE
      ?auto_19289 - SURFACE
      ?auto_19290 - SURFACE
      ?auto_19291 - SURFACE
      ?auto_19292 - SURFACE
    )
    :vars
    (
      ?auto_19293 - HOIST
      ?auto_19297 - PLACE
      ?auto_19298 - PLACE
      ?auto_19295 - HOIST
      ?auto_19296 - SURFACE
      ?auto_19316 - PLACE
      ?auto_19299 - HOIST
      ?auto_19315 - SURFACE
      ?auto_19306 - PLACE
      ?auto_19303 - HOIST
      ?auto_19307 - SURFACE
      ?auto_19311 - PLACE
      ?auto_19302 - HOIST
      ?auto_19301 - SURFACE
      ?auto_19300 - PLACE
      ?auto_19304 - HOIST
      ?auto_19314 - SURFACE
      ?auto_19310 - PLACE
      ?auto_19312 - HOIST
      ?auto_19305 - SURFACE
      ?auto_19313 - PLACE
      ?auto_19308 - HOIST
      ?auto_19309 - SURFACE
      ?auto_19294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19293 ?auto_19297 ) ( IS-CRATE ?auto_19292 ) ( not ( = ?auto_19298 ?auto_19297 ) ) ( HOIST-AT ?auto_19295 ?auto_19298 ) ( AVAILABLE ?auto_19295 ) ( SURFACE-AT ?auto_19292 ?auto_19298 ) ( ON ?auto_19292 ?auto_19296 ) ( CLEAR ?auto_19292 ) ( not ( = ?auto_19291 ?auto_19292 ) ) ( not ( = ?auto_19291 ?auto_19296 ) ) ( not ( = ?auto_19292 ?auto_19296 ) ) ( not ( = ?auto_19293 ?auto_19295 ) ) ( IS-CRATE ?auto_19291 ) ( not ( = ?auto_19316 ?auto_19297 ) ) ( HOIST-AT ?auto_19299 ?auto_19316 ) ( AVAILABLE ?auto_19299 ) ( SURFACE-AT ?auto_19291 ?auto_19316 ) ( ON ?auto_19291 ?auto_19315 ) ( CLEAR ?auto_19291 ) ( not ( = ?auto_19290 ?auto_19291 ) ) ( not ( = ?auto_19290 ?auto_19315 ) ) ( not ( = ?auto_19291 ?auto_19315 ) ) ( not ( = ?auto_19293 ?auto_19299 ) ) ( IS-CRATE ?auto_19290 ) ( not ( = ?auto_19306 ?auto_19297 ) ) ( HOIST-AT ?auto_19303 ?auto_19306 ) ( AVAILABLE ?auto_19303 ) ( SURFACE-AT ?auto_19290 ?auto_19306 ) ( ON ?auto_19290 ?auto_19307 ) ( CLEAR ?auto_19290 ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( not ( = ?auto_19289 ?auto_19307 ) ) ( not ( = ?auto_19290 ?auto_19307 ) ) ( not ( = ?auto_19293 ?auto_19303 ) ) ( IS-CRATE ?auto_19289 ) ( not ( = ?auto_19311 ?auto_19297 ) ) ( HOIST-AT ?auto_19302 ?auto_19311 ) ( AVAILABLE ?auto_19302 ) ( SURFACE-AT ?auto_19289 ?auto_19311 ) ( ON ?auto_19289 ?auto_19301 ) ( CLEAR ?auto_19289 ) ( not ( = ?auto_19288 ?auto_19289 ) ) ( not ( = ?auto_19288 ?auto_19301 ) ) ( not ( = ?auto_19289 ?auto_19301 ) ) ( not ( = ?auto_19293 ?auto_19302 ) ) ( IS-CRATE ?auto_19288 ) ( not ( = ?auto_19300 ?auto_19297 ) ) ( HOIST-AT ?auto_19304 ?auto_19300 ) ( AVAILABLE ?auto_19304 ) ( SURFACE-AT ?auto_19288 ?auto_19300 ) ( ON ?auto_19288 ?auto_19314 ) ( CLEAR ?auto_19288 ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19314 ) ) ( not ( = ?auto_19288 ?auto_19314 ) ) ( not ( = ?auto_19293 ?auto_19304 ) ) ( IS-CRATE ?auto_19287 ) ( not ( = ?auto_19310 ?auto_19297 ) ) ( HOIST-AT ?auto_19312 ?auto_19310 ) ( AVAILABLE ?auto_19312 ) ( SURFACE-AT ?auto_19287 ?auto_19310 ) ( ON ?auto_19287 ?auto_19305 ) ( CLEAR ?auto_19287 ) ( not ( = ?auto_19286 ?auto_19287 ) ) ( not ( = ?auto_19286 ?auto_19305 ) ) ( not ( = ?auto_19287 ?auto_19305 ) ) ( not ( = ?auto_19293 ?auto_19312 ) ) ( SURFACE-AT ?auto_19285 ?auto_19297 ) ( CLEAR ?auto_19285 ) ( IS-CRATE ?auto_19286 ) ( AVAILABLE ?auto_19293 ) ( not ( = ?auto_19313 ?auto_19297 ) ) ( HOIST-AT ?auto_19308 ?auto_19313 ) ( AVAILABLE ?auto_19308 ) ( SURFACE-AT ?auto_19286 ?auto_19313 ) ( ON ?auto_19286 ?auto_19309 ) ( CLEAR ?auto_19286 ) ( TRUCK-AT ?auto_19294 ?auto_19297 ) ( not ( = ?auto_19285 ?auto_19286 ) ) ( not ( = ?auto_19285 ?auto_19309 ) ) ( not ( = ?auto_19286 ?auto_19309 ) ) ( not ( = ?auto_19293 ?auto_19308 ) ) ( not ( = ?auto_19285 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19305 ) ) ( not ( = ?auto_19287 ?auto_19309 ) ) ( not ( = ?auto_19310 ?auto_19313 ) ) ( not ( = ?auto_19312 ?auto_19308 ) ) ( not ( = ?auto_19305 ?auto_19309 ) ) ( not ( = ?auto_19285 ?auto_19288 ) ) ( not ( = ?auto_19285 ?auto_19314 ) ) ( not ( = ?auto_19286 ?auto_19288 ) ) ( not ( = ?auto_19286 ?auto_19314 ) ) ( not ( = ?auto_19288 ?auto_19305 ) ) ( not ( = ?auto_19288 ?auto_19309 ) ) ( not ( = ?auto_19300 ?auto_19310 ) ) ( not ( = ?auto_19300 ?auto_19313 ) ) ( not ( = ?auto_19304 ?auto_19312 ) ) ( not ( = ?auto_19304 ?auto_19308 ) ) ( not ( = ?auto_19314 ?auto_19305 ) ) ( not ( = ?auto_19314 ?auto_19309 ) ) ( not ( = ?auto_19285 ?auto_19289 ) ) ( not ( = ?auto_19285 ?auto_19301 ) ) ( not ( = ?auto_19286 ?auto_19289 ) ) ( not ( = ?auto_19286 ?auto_19301 ) ) ( not ( = ?auto_19287 ?auto_19289 ) ) ( not ( = ?auto_19287 ?auto_19301 ) ) ( not ( = ?auto_19289 ?auto_19314 ) ) ( not ( = ?auto_19289 ?auto_19305 ) ) ( not ( = ?auto_19289 ?auto_19309 ) ) ( not ( = ?auto_19311 ?auto_19300 ) ) ( not ( = ?auto_19311 ?auto_19310 ) ) ( not ( = ?auto_19311 ?auto_19313 ) ) ( not ( = ?auto_19302 ?auto_19304 ) ) ( not ( = ?auto_19302 ?auto_19312 ) ) ( not ( = ?auto_19302 ?auto_19308 ) ) ( not ( = ?auto_19301 ?auto_19314 ) ) ( not ( = ?auto_19301 ?auto_19305 ) ) ( not ( = ?auto_19301 ?auto_19309 ) ) ( not ( = ?auto_19285 ?auto_19290 ) ) ( not ( = ?auto_19285 ?auto_19307 ) ) ( not ( = ?auto_19286 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19307 ) ) ( not ( = ?auto_19287 ?auto_19290 ) ) ( not ( = ?auto_19287 ?auto_19307 ) ) ( not ( = ?auto_19288 ?auto_19290 ) ) ( not ( = ?auto_19288 ?auto_19307 ) ) ( not ( = ?auto_19290 ?auto_19301 ) ) ( not ( = ?auto_19290 ?auto_19314 ) ) ( not ( = ?auto_19290 ?auto_19305 ) ) ( not ( = ?auto_19290 ?auto_19309 ) ) ( not ( = ?auto_19306 ?auto_19311 ) ) ( not ( = ?auto_19306 ?auto_19300 ) ) ( not ( = ?auto_19306 ?auto_19310 ) ) ( not ( = ?auto_19306 ?auto_19313 ) ) ( not ( = ?auto_19303 ?auto_19302 ) ) ( not ( = ?auto_19303 ?auto_19304 ) ) ( not ( = ?auto_19303 ?auto_19312 ) ) ( not ( = ?auto_19303 ?auto_19308 ) ) ( not ( = ?auto_19307 ?auto_19301 ) ) ( not ( = ?auto_19307 ?auto_19314 ) ) ( not ( = ?auto_19307 ?auto_19305 ) ) ( not ( = ?auto_19307 ?auto_19309 ) ) ( not ( = ?auto_19285 ?auto_19291 ) ) ( not ( = ?auto_19285 ?auto_19315 ) ) ( not ( = ?auto_19286 ?auto_19291 ) ) ( not ( = ?auto_19286 ?auto_19315 ) ) ( not ( = ?auto_19287 ?auto_19291 ) ) ( not ( = ?auto_19287 ?auto_19315 ) ) ( not ( = ?auto_19288 ?auto_19291 ) ) ( not ( = ?auto_19288 ?auto_19315 ) ) ( not ( = ?auto_19289 ?auto_19291 ) ) ( not ( = ?auto_19289 ?auto_19315 ) ) ( not ( = ?auto_19291 ?auto_19307 ) ) ( not ( = ?auto_19291 ?auto_19301 ) ) ( not ( = ?auto_19291 ?auto_19314 ) ) ( not ( = ?auto_19291 ?auto_19305 ) ) ( not ( = ?auto_19291 ?auto_19309 ) ) ( not ( = ?auto_19316 ?auto_19306 ) ) ( not ( = ?auto_19316 ?auto_19311 ) ) ( not ( = ?auto_19316 ?auto_19300 ) ) ( not ( = ?auto_19316 ?auto_19310 ) ) ( not ( = ?auto_19316 ?auto_19313 ) ) ( not ( = ?auto_19299 ?auto_19303 ) ) ( not ( = ?auto_19299 ?auto_19302 ) ) ( not ( = ?auto_19299 ?auto_19304 ) ) ( not ( = ?auto_19299 ?auto_19312 ) ) ( not ( = ?auto_19299 ?auto_19308 ) ) ( not ( = ?auto_19315 ?auto_19307 ) ) ( not ( = ?auto_19315 ?auto_19301 ) ) ( not ( = ?auto_19315 ?auto_19314 ) ) ( not ( = ?auto_19315 ?auto_19305 ) ) ( not ( = ?auto_19315 ?auto_19309 ) ) ( not ( = ?auto_19285 ?auto_19292 ) ) ( not ( = ?auto_19285 ?auto_19296 ) ) ( not ( = ?auto_19286 ?auto_19292 ) ) ( not ( = ?auto_19286 ?auto_19296 ) ) ( not ( = ?auto_19287 ?auto_19292 ) ) ( not ( = ?auto_19287 ?auto_19296 ) ) ( not ( = ?auto_19288 ?auto_19292 ) ) ( not ( = ?auto_19288 ?auto_19296 ) ) ( not ( = ?auto_19289 ?auto_19292 ) ) ( not ( = ?auto_19289 ?auto_19296 ) ) ( not ( = ?auto_19290 ?auto_19292 ) ) ( not ( = ?auto_19290 ?auto_19296 ) ) ( not ( = ?auto_19292 ?auto_19315 ) ) ( not ( = ?auto_19292 ?auto_19307 ) ) ( not ( = ?auto_19292 ?auto_19301 ) ) ( not ( = ?auto_19292 ?auto_19314 ) ) ( not ( = ?auto_19292 ?auto_19305 ) ) ( not ( = ?auto_19292 ?auto_19309 ) ) ( not ( = ?auto_19298 ?auto_19316 ) ) ( not ( = ?auto_19298 ?auto_19306 ) ) ( not ( = ?auto_19298 ?auto_19311 ) ) ( not ( = ?auto_19298 ?auto_19300 ) ) ( not ( = ?auto_19298 ?auto_19310 ) ) ( not ( = ?auto_19298 ?auto_19313 ) ) ( not ( = ?auto_19295 ?auto_19299 ) ) ( not ( = ?auto_19295 ?auto_19303 ) ) ( not ( = ?auto_19295 ?auto_19302 ) ) ( not ( = ?auto_19295 ?auto_19304 ) ) ( not ( = ?auto_19295 ?auto_19312 ) ) ( not ( = ?auto_19295 ?auto_19308 ) ) ( not ( = ?auto_19296 ?auto_19315 ) ) ( not ( = ?auto_19296 ?auto_19307 ) ) ( not ( = ?auto_19296 ?auto_19301 ) ) ( not ( = ?auto_19296 ?auto_19314 ) ) ( not ( = ?auto_19296 ?auto_19305 ) ) ( not ( = ?auto_19296 ?auto_19309 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_19285 ?auto_19286 ?auto_19287 ?auto_19288 ?auto_19289 ?auto_19290 ?auto_19291 )
      ( MAKE-1CRATE ?auto_19291 ?auto_19292 )
      ( MAKE-7CRATE-VERIFY ?auto_19285 ?auto_19286 ?auto_19287 ?auto_19288 ?auto_19289 ?auto_19290 ?auto_19291 ?auto_19292 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_19336 - SURFACE
      ?auto_19337 - SURFACE
      ?auto_19338 - SURFACE
      ?auto_19339 - SURFACE
      ?auto_19340 - SURFACE
      ?auto_19341 - SURFACE
      ?auto_19342 - SURFACE
      ?auto_19343 - SURFACE
      ?auto_19344 - SURFACE
    )
    :vars
    (
      ?auto_19349 - HOIST
      ?auto_19348 - PLACE
      ?auto_19346 - PLACE
      ?auto_19347 - HOIST
      ?auto_19350 - SURFACE
      ?auto_19371 - PLACE
      ?auto_19355 - HOIST
      ?auto_19363 - SURFACE
      ?auto_19360 - PLACE
      ?auto_19362 - HOIST
      ?auto_19361 - SURFACE
      ?auto_19369 - PLACE
      ?auto_19365 - HOIST
      ?auto_19353 - SURFACE
      ?auto_19367 - PLACE
      ?auto_19356 - HOIST
      ?auto_19358 - SURFACE
      ?auto_19357 - PLACE
      ?auto_19364 - HOIST
      ?auto_19354 - SURFACE
      ?auto_19366 - PLACE
      ?auto_19368 - HOIST
      ?auto_19370 - SURFACE
      ?auto_19359 - PLACE
      ?auto_19352 - HOIST
      ?auto_19351 - SURFACE
      ?auto_19345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19349 ?auto_19348 ) ( IS-CRATE ?auto_19344 ) ( not ( = ?auto_19346 ?auto_19348 ) ) ( HOIST-AT ?auto_19347 ?auto_19346 ) ( AVAILABLE ?auto_19347 ) ( SURFACE-AT ?auto_19344 ?auto_19346 ) ( ON ?auto_19344 ?auto_19350 ) ( CLEAR ?auto_19344 ) ( not ( = ?auto_19343 ?auto_19344 ) ) ( not ( = ?auto_19343 ?auto_19350 ) ) ( not ( = ?auto_19344 ?auto_19350 ) ) ( not ( = ?auto_19349 ?auto_19347 ) ) ( IS-CRATE ?auto_19343 ) ( not ( = ?auto_19371 ?auto_19348 ) ) ( HOIST-AT ?auto_19355 ?auto_19371 ) ( AVAILABLE ?auto_19355 ) ( SURFACE-AT ?auto_19343 ?auto_19371 ) ( ON ?auto_19343 ?auto_19363 ) ( CLEAR ?auto_19343 ) ( not ( = ?auto_19342 ?auto_19343 ) ) ( not ( = ?auto_19342 ?auto_19363 ) ) ( not ( = ?auto_19343 ?auto_19363 ) ) ( not ( = ?auto_19349 ?auto_19355 ) ) ( IS-CRATE ?auto_19342 ) ( not ( = ?auto_19360 ?auto_19348 ) ) ( HOIST-AT ?auto_19362 ?auto_19360 ) ( AVAILABLE ?auto_19362 ) ( SURFACE-AT ?auto_19342 ?auto_19360 ) ( ON ?auto_19342 ?auto_19361 ) ( CLEAR ?auto_19342 ) ( not ( = ?auto_19341 ?auto_19342 ) ) ( not ( = ?auto_19341 ?auto_19361 ) ) ( not ( = ?auto_19342 ?auto_19361 ) ) ( not ( = ?auto_19349 ?auto_19362 ) ) ( IS-CRATE ?auto_19341 ) ( not ( = ?auto_19369 ?auto_19348 ) ) ( HOIST-AT ?auto_19365 ?auto_19369 ) ( AVAILABLE ?auto_19365 ) ( SURFACE-AT ?auto_19341 ?auto_19369 ) ( ON ?auto_19341 ?auto_19353 ) ( CLEAR ?auto_19341 ) ( not ( = ?auto_19340 ?auto_19341 ) ) ( not ( = ?auto_19340 ?auto_19353 ) ) ( not ( = ?auto_19341 ?auto_19353 ) ) ( not ( = ?auto_19349 ?auto_19365 ) ) ( IS-CRATE ?auto_19340 ) ( not ( = ?auto_19367 ?auto_19348 ) ) ( HOIST-AT ?auto_19356 ?auto_19367 ) ( AVAILABLE ?auto_19356 ) ( SURFACE-AT ?auto_19340 ?auto_19367 ) ( ON ?auto_19340 ?auto_19358 ) ( CLEAR ?auto_19340 ) ( not ( = ?auto_19339 ?auto_19340 ) ) ( not ( = ?auto_19339 ?auto_19358 ) ) ( not ( = ?auto_19340 ?auto_19358 ) ) ( not ( = ?auto_19349 ?auto_19356 ) ) ( IS-CRATE ?auto_19339 ) ( not ( = ?auto_19357 ?auto_19348 ) ) ( HOIST-AT ?auto_19364 ?auto_19357 ) ( AVAILABLE ?auto_19364 ) ( SURFACE-AT ?auto_19339 ?auto_19357 ) ( ON ?auto_19339 ?auto_19354 ) ( CLEAR ?auto_19339 ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19354 ) ) ( not ( = ?auto_19339 ?auto_19354 ) ) ( not ( = ?auto_19349 ?auto_19364 ) ) ( IS-CRATE ?auto_19338 ) ( not ( = ?auto_19366 ?auto_19348 ) ) ( HOIST-AT ?auto_19368 ?auto_19366 ) ( AVAILABLE ?auto_19368 ) ( SURFACE-AT ?auto_19338 ?auto_19366 ) ( ON ?auto_19338 ?auto_19370 ) ( CLEAR ?auto_19338 ) ( not ( = ?auto_19337 ?auto_19338 ) ) ( not ( = ?auto_19337 ?auto_19370 ) ) ( not ( = ?auto_19338 ?auto_19370 ) ) ( not ( = ?auto_19349 ?auto_19368 ) ) ( SURFACE-AT ?auto_19336 ?auto_19348 ) ( CLEAR ?auto_19336 ) ( IS-CRATE ?auto_19337 ) ( AVAILABLE ?auto_19349 ) ( not ( = ?auto_19359 ?auto_19348 ) ) ( HOIST-AT ?auto_19352 ?auto_19359 ) ( AVAILABLE ?auto_19352 ) ( SURFACE-AT ?auto_19337 ?auto_19359 ) ( ON ?auto_19337 ?auto_19351 ) ( CLEAR ?auto_19337 ) ( TRUCK-AT ?auto_19345 ?auto_19348 ) ( not ( = ?auto_19336 ?auto_19337 ) ) ( not ( = ?auto_19336 ?auto_19351 ) ) ( not ( = ?auto_19337 ?auto_19351 ) ) ( not ( = ?auto_19349 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19338 ) ) ( not ( = ?auto_19336 ?auto_19370 ) ) ( not ( = ?auto_19338 ?auto_19351 ) ) ( not ( = ?auto_19366 ?auto_19359 ) ) ( not ( = ?auto_19368 ?auto_19352 ) ) ( not ( = ?auto_19370 ?auto_19351 ) ) ( not ( = ?auto_19336 ?auto_19339 ) ) ( not ( = ?auto_19336 ?auto_19354 ) ) ( not ( = ?auto_19337 ?auto_19339 ) ) ( not ( = ?auto_19337 ?auto_19354 ) ) ( not ( = ?auto_19339 ?auto_19370 ) ) ( not ( = ?auto_19339 ?auto_19351 ) ) ( not ( = ?auto_19357 ?auto_19366 ) ) ( not ( = ?auto_19357 ?auto_19359 ) ) ( not ( = ?auto_19364 ?auto_19368 ) ) ( not ( = ?auto_19364 ?auto_19352 ) ) ( not ( = ?auto_19354 ?auto_19370 ) ) ( not ( = ?auto_19354 ?auto_19351 ) ) ( not ( = ?auto_19336 ?auto_19340 ) ) ( not ( = ?auto_19336 ?auto_19358 ) ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19337 ?auto_19358 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19338 ?auto_19358 ) ) ( not ( = ?auto_19340 ?auto_19354 ) ) ( not ( = ?auto_19340 ?auto_19370 ) ) ( not ( = ?auto_19340 ?auto_19351 ) ) ( not ( = ?auto_19367 ?auto_19357 ) ) ( not ( = ?auto_19367 ?auto_19366 ) ) ( not ( = ?auto_19367 ?auto_19359 ) ) ( not ( = ?auto_19356 ?auto_19364 ) ) ( not ( = ?auto_19356 ?auto_19368 ) ) ( not ( = ?auto_19356 ?auto_19352 ) ) ( not ( = ?auto_19358 ?auto_19354 ) ) ( not ( = ?auto_19358 ?auto_19370 ) ) ( not ( = ?auto_19358 ?auto_19351 ) ) ( not ( = ?auto_19336 ?auto_19341 ) ) ( not ( = ?auto_19336 ?auto_19353 ) ) ( not ( = ?auto_19337 ?auto_19341 ) ) ( not ( = ?auto_19337 ?auto_19353 ) ) ( not ( = ?auto_19338 ?auto_19341 ) ) ( not ( = ?auto_19338 ?auto_19353 ) ) ( not ( = ?auto_19339 ?auto_19341 ) ) ( not ( = ?auto_19339 ?auto_19353 ) ) ( not ( = ?auto_19341 ?auto_19358 ) ) ( not ( = ?auto_19341 ?auto_19354 ) ) ( not ( = ?auto_19341 ?auto_19370 ) ) ( not ( = ?auto_19341 ?auto_19351 ) ) ( not ( = ?auto_19369 ?auto_19367 ) ) ( not ( = ?auto_19369 ?auto_19357 ) ) ( not ( = ?auto_19369 ?auto_19366 ) ) ( not ( = ?auto_19369 ?auto_19359 ) ) ( not ( = ?auto_19365 ?auto_19356 ) ) ( not ( = ?auto_19365 ?auto_19364 ) ) ( not ( = ?auto_19365 ?auto_19368 ) ) ( not ( = ?auto_19365 ?auto_19352 ) ) ( not ( = ?auto_19353 ?auto_19358 ) ) ( not ( = ?auto_19353 ?auto_19354 ) ) ( not ( = ?auto_19353 ?auto_19370 ) ) ( not ( = ?auto_19353 ?auto_19351 ) ) ( not ( = ?auto_19336 ?auto_19342 ) ) ( not ( = ?auto_19336 ?auto_19361 ) ) ( not ( = ?auto_19337 ?auto_19342 ) ) ( not ( = ?auto_19337 ?auto_19361 ) ) ( not ( = ?auto_19338 ?auto_19342 ) ) ( not ( = ?auto_19338 ?auto_19361 ) ) ( not ( = ?auto_19339 ?auto_19342 ) ) ( not ( = ?auto_19339 ?auto_19361 ) ) ( not ( = ?auto_19340 ?auto_19342 ) ) ( not ( = ?auto_19340 ?auto_19361 ) ) ( not ( = ?auto_19342 ?auto_19353 ) ) ( not ( = ?auto_19342 ?auto_19358 ) ) ( not ( = ?auto_19342 ?auto_19354 ) ) ( not ( = ?auto_19342 ?auto_19370 ) ) ( not ( = ?auto_19342 ?auto_19351 ) ) ( not ( = ?auto_19360 ?auto_19369 ) ) ( not ( = ?auto_19360 ?auto_19367 ) ) ( not ( = ?auto_19360 ?auto_19357 ) ) ( not ( = ?auto_19360 ?auto_19366 ) ) ( not ( = ?auto_19360 ?auto_19359 ) ) ( not ( = ?auto_19362 ?auto_19365 ) ) ( not ( = ?auto_19362 ?auto_19356 ) ) ( not ( = ?auto_19362 ?auto_19364 ) ) ( not ( = ?auto_19362 ?auto_19368 ) ) ( not ( = ?auto_19362 ?auto_19352 ) ) ( not ( = ?auto_19361 ?auto_19353 ) ) ( not ( = ?auto_19361 ?auto_19358 ) ) ( not ( = ?auto_19361 ?auto_19354 ) ) ( not ( = ?auto_19361 ?auto_19370 ) ) ( not ( = ?auto_19361 ?auto_19351 ) ) ( not ( = ?auto_19336 ?auto_19343 ) ) ( not ( = ?auto_19336 ?auto_19363 ) ) ( not ( = ?auto_19337 ?auto_19343 ) ) ( not ( = ?auto_19337 ?auto_19363 ) ) ( not ( = ?auto_19338 ?auto_19343 ) ) ( not ( = ?auto_19338 ?auto_19363 ) ) ( not ( = ?auto_19339 ?auto_19343 ) ) ( not ( = ?auto_19339 ?auto_19363 ) ) ( not ( = ?auto_19340 ?auto_19343 ) ) ( not ( = ?auto_19340 ?auto_19363 ) ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( not ( = ?auto_19341 ?auto_19363 ) ) ( not ( = ?auto_19343 ?auto_19361 ) ) ( not ( = ?auto_19343 ?auto_19353 ) ) ( not ( = ?auto_19343 ?auto_19358 ) ) ( not ( = ?auto_19343 ?auto_19354 ) ) ( not ( = ?auto_19343 ?auto_19370 ) ) ( not ( = ?auto_19343 ?auto_19351 ) ) ( not ( = ?auto_19371 ?auto_19360 ) ) ( not ( = ?auto_19371 ?auto_19369 ) ) ( not ( = ?auto_19371 ?auto_19367 ) ) ( not ( = ?auto_19371 ?auto_19357 ) ) ( not ( = ?auto_19371 ?auto_19366 ) ) ( not ( = ?auto_19371 ?auto_19359 ) ) ( not ( = ?auto_19355 ?auto_19362 ) ) ( not ( = ?auto_19355 ?auto_19365 ) ) ( not ( = ?auto_19355 ?auto_19356 ) ) ( not ( = ?auto_19355 ?auto_19364 ) ) ( not ( = ?auto_19355 ?auto_19368 ) ) ( not ( = ?auto_19355 ?auto_19352 ) ) ( not ( = ?auto_19363 ?auto_19361 ) ) ( not ( = ?auto_19363 ?auto_19353 ) ) ( not ( = ?auto_19363 ?auto_19358 ) ) ( not ( = ?auto_19363 ?auto_19354 ) ) ( not ( = ?auto_19363 ?auto_19370 ) ) ( not ( = ?auto_19363 ?auto_19351 ) ) ( not ( = ?auto_19336 ?auto_19344 ) ) ( not ( = ?auto_19336 ?auto_19350 ) ) ( not ( = ?auto_19337 ?auto_19344 ) ) ( not ( = ?auto_19337 ?auto_19350 ) ) ( not ( = ?auto_19338 ?auto_19344 ) ) ( not ( = ?auto_19338 ?auto_19350 ) ) ( not ( = ?auto_19339 ?auto_19344 ) ) ( not ( = ?auto_19339 ?auto_19350 ) ) ( not ( = ?auto_19340 ?auto_19344 ) ) ( not ( = ?auto_19340 ?auto_19350 ) ) ( not ( = ?auto_19341 ?auto_19344 ) ) ( not ( = ?auto_19341 ?auto_19350 ) ) ( not ( = ?auto_19342 ?auto_19344 ) ) ( not ( = ?auto_19342 ?auto_19350 ) ) ( not ( = ?auto_19344 ?auto_19363 ) ) ( not ( = ?auto_19344 ?auto_19361 ) ) ( not ( = ?auto_19344 ?auto_19353 ) ) ( not ( = ?auto_19344 ?auto_19358 ) ) ( not ( = ?auto_19344 ?auto_19354 ) ) ( not ( = ?auto_19344 ?auto_19370 ) ) ( not ( = ?auto_19344 ?auto_19351 ) ) ( not ( = ?auto_19346 ?auto_19371 ) ) ( not ( = ?auto_19346 ?auto_19360 ) ) ( not ( = ?auto_19346 ?auto_19369 ) ) ( not ( = ?auto_19346 ?auto_19367 ) ) ( not ( = ?auto_19346 ?auto_19357 ) ) ( not ( = ?auto_19346 ?auto_19366 ) ) ( not ( = ?auto_19346 ?auto_19359 ) ) ( not ( = ?auto_19347 ?auto_19355 ) ) ( not ( = ?auto_19347 ?auto_19362 ) ) ( not ( = ?auto_19347 ?auto_19365 ) ) ( not ( = ?auto_19347 ?auto_19356 ) ) ( not ( = ?auto_19347 ?auto_19364 ) ) ( not ( = ?auto_19347 ?auto_19368 ) ) ( not ( = ?auto_19347 ?auto_19352 ) ) ( not ( = ?auto_19350 ?auto_19363 ) ) ( not ( = ?auto_19350 ?auto_19361 ) ) ( not ( = ?auto_19350 ?auto_19353 ) ) ( not ( = ?auto_19350 ?auto_19358 ) ) ( not ( = ?auto_19350 ?auto_19354 ) ) ( not ( = ?auto_19350 ?auto_19370 ) ) ( not ( = ?auto_19350 ?auto_19351 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_19336 ?auto_19337 ?auto_19338 ?auto_19339 ?auto_19340 ?auto_19341 ?auto_19342 ?auto_19343 )
      ( MAKE-1CRATE ?auto_19343 ?auto_19344 )
      ( MAKE-8CRATE-VERIFY ?auto_19336 ?auto_19337 ?auto_19338 ?auto_19339 ?auto_19340 ?auto_19341 ?auto_19342 ?auto_19343 ?auto_19344 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_19392 - SURFACE
      ?auto_19393 - SURFACE
      ?auto_19394 - SURFACE
      ?auto_19395 - SURFACE
      ?auto_19396 - SURFACE
      ?auto_19397 - SURFACE
      ?auto_19398 - SURFACE
      ?auto_19399 - SURFACE
      ?auto_19400 - SURFACE
      ?auto_19401 - SURFACE
    )
    :vars
    (
      ?auto_19403 - HOIST
      ?auto_19404 - PLACE
      ?auto_19407 - PLACE
      ?auto_19406 - HOIST
      ?auto_19405 - SURFACE
      ?auto_19421 - PLACE
      ?auto_19431 - HOIST
      ?auto_19419 - SURFACE
      ?auto_19412 - PLACE
      ?auto_19428 - HOIST
      ?auto_19423 - SURFACE
      ?auto_19417 - PLACE
      ?auto_19418 - HOIST
      ?auto_19416 - SURFACE
      ?auto_19411 - PLACE
      ?auto_19408 - HOIST
      ?auto_19409 - SURFACE
      ?auto_19410 - PLACE
      ?auto_19427 - HOIST
      ?auto_19425 - SURFACE
      ?auto_19426 - PLACE
      ?auto_19424 - HOIST
      ?auto_19422 - SURFACE
      ?auto_19414 - PLACE
      ?auto_19430 - HOIST
      ?auto_19413 - SURFACE
      ?auto_19415 - PLACE
      ?auto_19420 - HOIST
      ?auto_19429 - SURFACE
      ?auto_19402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19403 ?auto_19404 ) ( IS-CRATE ?auto_19401 ) ( not ( = ?auto_19407 ?auto_19404 ) ) ( HOIST-AT ?auto_19406 ?auto_19407 ) ( AVAILABLE ?auto_19406 ) ( SURFACE-AT ?auto_19401 ?auto_19407 ) ( ON ?auto_19401 ?auto_19405 ) ( CLEAR ?auto_19401 ) ( not ( = ?auto_19400 ?auto_19401 ) ) ( not ( = ?auto_19400 ?auto_19405 ) ) ( not ( = ?auto_19401 ?auto_19405 ) ) ( not ( = ?auto_19403 ?auto_19406 ) ) ( IS-CRATE ?auto_19400 ) ( not ( = ?auto_19421 ?auto_19404 ) ) ( HOIST-AT ?auto_19431 ?auto_19421 ) ( AVAILABLE ?auto_19431 ) ( SURFACE-AT ?auto_19400 ?auto_19421 ) ( ON ?auto_19400 ?auto_19419 ) ( CLEAR ?auto_19400 ) ( not ( = ?auto_19399 ?auto_19400 ) ) ( not ( = ?auto_19399 ?auto_19419 ) ) ( not ( = ?auto_19400 ?auto_19419 ) ) ( not ( = ?auto_19403 ?auto_19431 ) ) ( IS-CRATE ?auto_19399 ) ( not ( = ?auto_19412 ?auto_19404 ) ) ( HOIST-AT ?auto_19428 ?auto_19412 ) ( AVAILABLE ?auto_19428 ) ( SURFACE-AT ?auto_19399 ?auto_19412 ) ( ON ?auto_19399 ?auto_19423 ) ( CLEAR ?auto_19399 ) ( not ( = ?auto_19398 ?auto_19399 ) ) ( not ( = ?auto_19398 ?auto_19423 ) ) ( not ( = ?auto_19399 ?auto_19423 ) ) ( not ( = ?auto_19403 ?auto_19428 ) ) ( IS-CRATE ?auto_19398 ) ( not ( = ?auto_19417 ?auto_19404 ) ) ( HOIST-AT ?auto_19418 ?auto_19417 ) ( AVAILABLE ?auto_19418 ) ( SURFACE-AT ?auto_19398 ?auto_19417 ) ( ON ?auto_19398 ?auto_19416 ) ( CLEAR ?auto_19398 ) ( not ( = ?auto_19397 ?auto_19398 ) ) ( not ( = ?auto_19397 ?auto_19416 ) ) ( not ( = ?auto_19398 ?auto_19416 ) ) ( not ( = ?auto_19403 ?auto_19418 ) ) ( IS-CRATE ?auto_19397 ) ( not ( = ?auto_19411 ?auto_19404 ) ) ( HOIST-AT ?auto_19408 ?auto_19411 ) ( AVAILABLE ?auto_19408 ) ( SURFACE-AT ?auto_19397 ?auto_19411 ) ( ON ?auto_19397 ?auto_19409 ) ( CLEAR ?auto_19397 ) ( not ( = ?auto_19396 ?auto_19397 ) ) ( not ( = ?auto_19396 ?auto_19409 ) ) ( not ( = ?auto_19397 ?auto_19409 ) ) ( not ( = ?auto_19403 ?auto_19408 ) ) ( IS-CRATE ?auto_19396 ) ( not ( = ?auto_19410 ?auto_19404 ) ) ( HOIST-AT ?auto_19427 ?auto_19410 ) ( AVAILABLE ?auto_19427 ) ( SURFACE-AT ?auto_19396 ?auto_19410 ) ( ON ?auto_19396 ?auto_19425 ) ( CLEAR ?auto_19396 ) ( not ( = ?auto_19395 ?auto_19396 ) ) ( not ( = ?auto_19395 ?auto_19425 ) ) ( not ( = ?auto_19396 ?auto_19425 ) ) ( not ( = ?auto_19403 ?auto_19427 ) ) ( IS-CRATE ?auto_19395 ) ( not ( = ?auto_19426 ?auto_19404 ) ) ( HOIST-AT ?auto_19424 ?auto_19426 ) ( AVAILABLE ?auto_19424 ) ( SURFACE-AT ?auto_19395 ?auto_19426 ) ( ON ?auto_19395 ?auto_19422 ) ( CLEAR ?auto_19395 ) ( not ( = ?auto_19394 ?auto_19395 ) ) ( not ( = ?auto_19394 ?auto_19422 ) ) ( not ( = ?auto_19395 ?auto_19422 ) ) ( not ( = ?auto_19403 ?auto_19424 ) ) ( IS-CRATE ?auto_19394 ) ( not ( = ?auto_19414 ?auto_19404 ) ) ( HOIST-AT ?auto_19430 ?auto_19414 ) ( AVAILABLE ?auto_19430 ) ( SURFACE-AT ?auto_19394 ?auto_19414 ) ( ON ?auto_19394 ?auto_19413 ) ( CLEAR ?auto_19394 ) ( not ( = ?auto_19393 ?auto_19394 ) ) ( not ( = ?auto_19393 ?auto_19413 ) ) ( not ( = ?auto_19394 ?auto_19413 ) ) ( not ( = ?auto_19403 ?auto_19430 ) ) ( SURFACE-AT ?auto_19392 ?auto_19404 ) ( CLEAR ?auto_19392 ) ( IS-CRATE ?auto_19393 ) ( AVAILABLE ?auto_19403 ) ( not ( = ?auto_19415 ?auto_19404 ) ) ( HOIST-AT ?auto_19420 ?auto_19415 ) ( AVAILABLE ?auto_19420 ) ( SURFACE-AT ?auto_19393 ?auto_19415 ) ( ON ?auto_19393 ?auto_19429 ) ( CLEAR ?auto_19393 ) ( TRUCK-AT ?auto_19402 ?auto_19404 ) ( not ( = ?auto_19392 ?auto_19393 ) ) ( not ( = ?auto_19392 ?auto_19429 ) ) ( not ( = ?auto_19393 ?auto_19429 ) ) ( not ( = ?auto_19403 ?auto_19420 ) ) ( not ( = ?auto_19392 ?auto_19394 ) ) ( not ( = ?auto_19392 ?auto_19413 ) ) ( not ( = ?auto_19394 ?auto_19429 ) ) ( not ( = ?auto_19414 ?auto_19415 ) ) ( not ( = ?auto_19430 ?auto_19420 ) ) ( not ( = ?auto_19413 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19395 ) ) ( not ( = ?auto_19392 ?auto_19422 ) ) ( not ( = ?auto_19393 ?auto_19395 ) ) ( not ( = ?auto_19393 ?auto_19422 ) ) ( not ( = ?auto_19395 ?auto_19413 ) ) ( not ( = ?auto_19395 ?auto_19429 ) ) ( not ( = ?auto_19426 ?auto_19414 ) ) ( not ( = ?auto_19426 ?auto_19415 ) ) ( not ( = ?auto_19424 ?auto_19430 ) ) ( not ( = ?auto_19424 ?auto_19420 ) ) ( not ( = ?auto_19422 ?auto_19413 ) ) ( not ( = ?auto_19422 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19396 ) ) ( not ( = ?auto_19392 ?auto_19425 ) ) ( not ( = ?auto_19393 ?auto_19396 ) ) ( not ( = ?auto_19393 ?auto_19425 ) ) ( not ( = ?auto_19394 ?auto_19396 ) ) ( not ( = ?auto_19394 ?auto_19425 ) ) ( not ( = ?auto_19396 ?auto_19422 ) ) ( not ( = ?auto_19396 ?auto_19413 ) ) ( not ( = ?auto_19396 ?auto_19429 ) ) ( not ( = ?auto_19410 ?auto_19426 ) ) ( not ( = ?auto_19410 ?auto_19414 ) ) ( not ( = ?auto_19410 ?auto_19415 ) ) ( not ( = ?auto_19427 ?auto_19424 ) ) ( not ( = ?auto_19427 ?auto_19430 ) ) ( not ( = ?auto_19427 ?auto_19420 ) ) ( not ( = ?auto_19425 ?auto_19422 ) ) ( not ( = ?auto_19425 ?auto_19413 ) ) ( not ( = ?auto_19425 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19397 ) ) ( not ( = ?auto_19392 ?auto_19409 ) ) ( not ( = ?auto_19393 ?auto_19397 ) ) ( not ( = ?auto_19393 ?auto_19409 ) ) ( not ( = ?auto_19394 ?auto_19397 ) ) ( not ( = ?auto_19394 ?auto_19409 ) ) ( not ( = ?auto_19395 ?auto_19397 ) ) ( not ( = ?auto_19395 ?auto_19409 ) ) ( not ( = ?auto_19397 ?auto_19425 ) ) ( not ( = ?auto_19397 ?auto_19422 ) ) ( not ( = ?auto_19397 ?auto_19413 ) ) ( not ( = ?auto_19397 ?auto_19429 ) ) ( not ( = ?auto_19411 ?auto_19410 ) ) ( not ( = ?auto_19411 ?auto_19426 ) ) ( not ( = ?auto_19411 ?auto_19414 ) ) ( not ( = ?auto_19411 ?auto_19415 ) ) ( not ( = ?auto_19408 ?auto_19427 ) ) ( not ( = ?auto_19408 ?auto_19424 ) ) ( not ( = ?auto_19408 ?auto_19430 ) ) ( not ( = ?auto_19408 ?auto_19420 ) ) ( not ( = ?auto_19409 ?auto_19425 ) ) ( not ( = ?auto_19409 ?auto_19422 ) ) ( not ( = ?auto_19409 ?auto_19413 ) ) ( not ( = ?auto_19409 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19398 ) ) ( not ( = ?auto_19392 ?auto_19416 ) ) ( not ( = ?auto_19393 ?auto_19398 ) ) ( not ( = ?auto_19393 ?auto_19416 ) ) ( not ( = ?auto_19394 ?auto_19398 ) ) ( not ( = ?auto_19394 ?auto_19416 ) ) ( not ( = ?auto_19395 ?auto_19398 ) ) ( not ( = ?auto_19395 ?auto_19416 ) ) ( not ( = ?auto_19396 ?auto_19398 ) ) ( not ( = ?auto_19396 ?auto_19416 ) ) ( not ( = ?auto_19398 ?auto_19409 ) ) ( not ( = ?auto_19398 ?auto_19425 ) ) ( not ( = ?auto_19398 ?auto_19422 ) ) ( not ( = ?auto_19398 ?auto_19413 ) ) ( not ( = ?auto_19398 ?auto_19429 ) ) ( not ( = ?auto_19417 ?auto_19411 ) ) ( not ( = ?auto_19417 ?auto_19410 ) ) ( not ( = ?auto_19417 ?auto_19426 ) ) ( not ( = ?auto_19417 ?auto_19414 ) ) ( not ( = ?auto_19417 ?auto_19415 ) ) ( not ( = ?auto_19418 ?auto_19408 ) ) ( not ( = ?auto_19418 ?auto_19427 ) ) ( not ( = ?auto_19418 ?auto_19424 ) ) ( not ( = ?auto_19418 ?auto_19430 ) ) ( not ( = ?auto_19418 ?auto_19420 ) ) ( not ( = ?auto_19416 ?auto_19409 ) ) ( not ( = ?auto_19416 ?auto_19425 ) ) ( not ( = ?auto_19416 ?auto_19422 ) ) ( not ( = ?auto_19416 ?auto_19413 ) ) ( not ( = ?auto_19416 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19399 ) ) ( not ( = ?auto_19392 ?auto_19423 ) ) ( not ( = ?auto_19393 ?auto_19399 ) ) ( not ( = ?auto_19393 ?auto_19423 ) ) ( not ( = ?auto_19394 ?auto_19399 ) ) ( not ( = ?auto_19394 ?auto_19423 ) ) ( not ( = ?auto_19395 ?auto_19399 ) ) ( not ( = ?auto_19395 ?auto_19423 ) ) ( not ( = ?auto_19396 ?auto_19399 ) ) ( not ( = ?auto_19396 ?auto_19423 ) ) ( not ( = ?auto_19397 ?auto_19399 ) ) ( not ( = ?auto_19397 ?auto_19423 ) ) ( not ( = ?auto_19399 ?auto_19416 ) ) ( not ( = ?auto_19399 ?auto_19409 ) ) ( not ( = ?auto_19399 ?auto_19425 ) ) ( not ( = ?auto_19399 ?auto_19422 ) ) ( not ( = ?auto_19399 ?auto_19413 ) ) ( not ( = ?auto_19399 ?auto_19429 ) ) ( not ( = ?auto_19412 ?auto_19417 ) ) ( not ( = ?auto_19412 ?auto_19411 ) ) ( not ( = ?auto_19412 ?auto_19410 ) ) ( not ( = ?auto_19412 ?auto_19426 ) ) ( not ( = ?auto_19412 ?auto_19414 ) ) ( not ( = ?auto_19412 ?auto_19415 ) ) ( not ( = ?auto_19428 ?auto_19418 ) ) ( not ( = ?auto_19428 ?auto_19408 ) ) ( not ( = ?auto_19428 ?auto_19427 ) ) ( not ( = ?auto_19428 ?auto_19424 ) ) ( not ( = ?auto_19428 ?auto_19430 ) ) ( not ( = ?auto_19428 ?auto_19420 ) ) ( not ( = ?auto_19423 ?auto_19416 ) ) ( not ( = ?auto_19423 ?auto_19409 ) ) ( not ( = ?auto_19423 ?auto_19425 ) ) ( not ( = ?auto_19423 ?auto_19422 ) ) ( not ( = ?auto_19423 ?auto_19413 ) ) ( not ( = ?auto_19423 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19400 ) ) ( not ( = ?auto_19392 ?auto_19419 ) ) ( not ( = ?auto_19393 ?auto_19400 ) ) ( not ( = ?auto_19393 ?auto_19419 ) ) ( not ( = ?auto_19394 ?auto_19400 ) ) ( not ( = ?auto_19394 ?auto_19419 ) ) ( not ( = ?auto_19395 ?auto_19400 ) ) ( not ( = ?auto_19395 ?auto_19419 ) ) ( not ( = ?auto_19396 ?auto_19400 ) ) ( not ( = ?auto_19396 ?auto_19419 ) ) ( not ( = ?auto_19397 ?auto_19400 ) ) ( not ( = ?auto_19397 ?auto_19419 ) ) ( not ( = ?auto_19398 ?auto_19400 ) ) ( not ( = ?auto_19398 ?auto_19419 ) ) ( not ( = ?auto_19400 ?auto_19423 ) ) ( not ( = ?auto_19400 ?auto_19416 ) ) ( not ( = ?auto_19400 ?auto_19409 ) ) ( not ( = ?auto_19400 ?auto_19425 ) ) ( not ( = ?auto_19400 ?auto_19422 ) ) ( not ( = ?auto_19400 ?auto_19413 ) ) ( not ( = ?auto_19400 ?auto_19429 ) ) ( not ( = ?auto_19421 ?auto_19412 ) ) ( not ( = ?auto_19421 ?auto_19417 ) ) ( not ( = ?auto_19421 ?auto_19411 ) ) ( not ( = ?auto_19421 ?auto_19410 ) ) ( not ( = ?auto_19421 ?auto_19426 ) ) ( not ( = ?auto_19421 ?auto_19414 ) ) ( not ( = ?auto_19421 ?auto_19415 ) ) ( not ( = ?auto_19431 ?auto_19428 ) ) ( not ( = ?auto_19431 ?auto_19418 ) ) ( not ( = ?auto_19431 ?auto_19408 ) ) ( not ( = ?auto_19431 ?auto_19427 ) ) ( not ( = ?auto_19431 ?auto_19424 ) ) ( not ( = ?auto_19431 ?auto_19430 ) ) ( not ( = ?auto_19431 ?auto_19420 ) ) ( not ( = ?auto_19419 ?auto_19423 ) ) ( not ( = ?auto_19419 ?auto_19416 ) ) ( not ( = ?auto_19419 ?auto_19409 ) ) ( not ( = ?auto_19419 ?auto_19425 ) ) ( not ( = ?auto_19419 ?auto_19422 ) ) ( not ( = ?auto_19419 ?auto_19413 ) ) ( not ( = ?auto_19419 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19401 ) ) ( not ( = ?auto_19392 ?auto_19405 ) ) ( not ( = ?auto_19393 ?auto_19401 ) ) ( not ( = ?auto_19393 ?auto_19405 ) ) ( not ( = ?auto_19394 ?auto_19401 ) ) ( not ( = ?auto_19394 ?auto_19405 ) ) ( not ( = ?auto_19395 ?auto_19401 ) ) ( not ( = ?auto_19395 ?auto_19405 ) ) ( not ( = ?auto_19396 ?auto_19401 ) ) ( not ( = ?auto_19396 ?auto_19405 ) ) ( not ( = ?auto_19397 ?auto_19401 ) ) ( not ( = ?auto_19397 ?auto_19405 ) ) ( not ( = ?auto_19398 ?auto_19401 ) ) ( not ( = ?auto_19398 ?auto_19405 ) ) ( not ( = ?auto_19399 ?auto_19401 ) ) ( not ( = ?auto_19399 ?auto_19405 ) ) ( not ( = ?auto_19401 ?auto_19419 ) ) ( not ( = ?auto_19401 ?auto_19423 ) ) ( not ( = ?auto_19401 ?auto_19416 ) ) ( not ( = ?auto_19401 ?auto_19409 ) ) ( not ( = ?auto_19401 ?auto_19425 ) ) ( not ( = ?auto_19401 ?auto_19422 ) ) ( not ( = ?auto_19401 ?auto_19413 ) ) ( not ( = ?auto_19401 ?auto_19429 ) ) ( not ( = ?auto_19407 ?auto_19421 ) ) ( not ( = ?auto_19407 ?auto_19412 ) ) ( not ( = ?auto_19407 ?auto_19417 ) ) ( not ( = ?auto_19407 ?auto_19411 ) ) ( not ( = ?auto_19407 ?auto_19410 ) ) ( not ( = ?auto_19407 ?auto_19426 ) ) ( not ( = ?auto_19407 ?auto_19414 ) ) ( not ( = ?auto_19407 ?auto_19415 ) ) ( not ( = ?auto_19406 ?auto_19431 ) ) ( not ( = ?auto_19406 ?auto_19428 ) ) ( not ( = ?auto_19406 ?auto_19418 ) ) ( not ( = ?auto_19406 ?auto_19408 ) ) ( not ( = ?auto_19406 ?auto_19427 ) ) ( not ( = ?auto_19406 ?auto_19424 ) ) ( not ( = ?auto_19406 ?auto_19430 ) ) ( not ( = ?auto_19406 ?auto_19420 ) ) ( not ( = ?auto_19405 ?auto_19419 ) ) ( not ( = ?auto_19405 ?auto_19423 ) ) ( not ( = ?auto_19405 ?auto_19416 ) ) ( not ( = ?auto_19405 ?auto_19409 ) ) ( not ( = ?auto_19405 ?auto_19425 ) ) ( not ( = ?auto_19405 ?auto_19422 ) ) ( not ( = ?auto_19405 ?auto_19413 ) ) ( not ( = ?auto_19405 ?auto_19429 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_19392 ?auto_19393 ?auto_19394 ?auto_19395 ?auto_19396 ?auto_19397 ?auto_19398 ?auto_19399 ?auto_19400 )
      ( MAKE-1CRATE ?auto_19400 ?auto_19401 )
      ( MAKE-9CRATE-VERIFY ?auto_19392 ?auto_19393 ?auto_19394 ?auto_19395 ?auto_19396 ?auto_19397 ?auto_19398 ?auto_19399 ?auto_19400 ?auto_19401 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_19453 - SURFACE
      ?auto_19454 - SURFACE
      ?auto_19455 - SURFACE
      ?auto_19456 - SURFACE
      ?auto_19457 - SURFACE
      ?auto_19458 - SURFACE
      ?auto_19459 - SURFACE
      ?auto_19460 - SURFACE
      ?auto_19461 - SURFACE
      ?auto_19462 - SURFACE
      ?auto_19463 - SURFACE
    )
    :vars
    (
      ?auto_19464 - HOIST
      ?auto_19468 - PLACE
      ?auto_19469 - PLACE
      ?auto_19465 - HOIST
      ?auto_19466 - SURFACE
      ?auto_19475 - PLACE
      ?auto_19479 - HOIST
      ?auto_19480 - SURFACE
      ?auto_19492 - PLACE
      ?auto_19494 - HOIST
      ?auto_19483 - SURFACE
      ?auto_19472 - PLACE
      ?auto_19489 - HOIST
      ?auto_19481 - SURFACE
      ?auto_19482 - PLACE
      ?auto_19473 - HOIST
      ?auto_19496 - SURFACE
      ?auto_19485 - PLACE
      ?auto_19487 - HOIST
      ?auto_19484 - SURFACE
      ?auto_19478 - PLACE
      ?auto_19490 - HOIST
      ?auto_19486 - SURFACE
      ?auto_19495 - PLACE
      ?auto_19474 - HOIST
      ?auto_19488 - SURFACE
      ?auto_19470 - PLACE
      ?auto_19476 - HOIST
      ?auto_19471 - SURFACE
      ?auto_19493 - PLACE
      ?auto_19477 - HOIST
      ?auto_19491 - SURFACE
      ?auto_19467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19464 ?auto_19468 ) ( IS-CRATE ?auto_19463 ) ( not ( = ?auto_19469 ?auto_19468 ) ) ( HOIST-AT ?auto_19465 ?auto_19469 ) ( AVAILABLE ?auto_19465 ) ( SURFACE-AT ?auto_19463 ?auto_19469 ) ( ON ?auto_19463 ?auto_19466 ) ( CLEAR ?auto_19463 ) ( not ( = ?auto_19462 ?auto_19463 ) ) ( not ( = ?auto_19462 ?auto_19466 ) ) ( not ( = ?auto_19463 ?auto_19466 ) ) ( not ( = ?auto_19464 ?auto_19465 ) ) ( IS-CRATE ?auto_19462 ) ( not ( = ?auto_19475 ?auto_19468 ) ) ( HOIST-AT ?auto_19479 ?auto_19475 ) ( AVAILABLE ?auto_19479 ) ( SURFACE-AT ?auto_19462 ?auto_19475 ) ( ON ?auto_19462 ?auto_19480 ) ( CLEAR ?auto_19462 ) ( not ( = ?auto_19461 ?auto_19462 ) ) ( not ( = ?auto_19461 ?auto_19480 ) ) ( not ( = ?auto_19462 ?auto_19480 ) ) ( not ( = ?auto_19464 ?auto_19479 ) ) ( IS-CRATE ?auto_19461 ) ( not ( = ?auto_19492 ?auto_19468 ) ) ( HOIST-AT ?auto_19494 ?auto_19492 ) ( AVAILABLE ?auto_19494 ) ( SURFACE-AT ?auto_19461 ?auto_19492 ) ( ON ?auto_19461 ?auto_19483 ) ( CLEAR ?auto_19461 ) ( not ( = ?auto_19460 ?auto_19461 ) ) ( not ( = ?auto_19460 ?auto_19483 ) ) ( not ( = ?auto_19461 ?auto_19483 ) ) ( not ( = ?auto_19464 ?auto_19494 ) ) ( IS-CRATE ?auto_19460 ) ( not ( = ?auto_19472 ?auto_19468 ) ) ( HOIST-AT ?auto_19489 ?auto_19472 ) ( AVAILABLE ?auto_19489 ) ( SURFACE-AT ?auto_19460 ?auto_19472 ) ( ON ?auto_19460 ?auto_19481 ) ( CLEAR ?auto_19460 ) ( not ( = ?auto_19459 ?auto_19460 ) ) ( not ( = ?auto_19459 ?auto_19481 ) ) ( not ( = ?auto_19460 ?auto_19481 ) ) ( not ( = ?auto_19464 ?auto_19489 ) ) ( IS-CRATE ?auto_19459 ) ( not ( = ?auto_19482 ?auto_19468 ) ) ( HOIST-AT ?auto_19473 ?auto_19482 ) ( AVAILABLE ?auto_19473 ) ( SURFACE-AT ?auto_19459 ?auto_19482 ) ( ON ?auto_19459 ?auto_19496 ) ( CLEAR ?auto_19459 ) ( not ( = ?auto_19458 ?auto_19459 ) ) ( not ( = ?auto_19458 ?auto_19496 ) ) ( not ( = ?auto_19459 ?auto_19496 ) ) ( not ( = ?auto_19464 ?auto_19473 ) ) ( IS-CRATE ?auto_19458 ) ( not ( = ?auto_19485 ?auto_19468 ) ) ( HOIST-AT ?auto_19487 ?auto_19485 ) ( AVAILABLE ?auto_19487 ) ( SURFACE-AT ?auto_19458 ?auto_19485 ) ( ON ?auto_19458 ?auto_19484 ) ( CLEAR ?auto_19458 ) ( not ( = ?auto_19457 ?auto_19458 ) ) ( not ( = ?auto_19457 ?auto_19484 ) ) ( not ( = ?auto_19458 ?auto_19484 ) ) ( not ( = ?auto_19464 ?auto_19487 ) ) ( IS-CRATE ?auto_19457 ) ( not ( = ?auto_19478 ?auto_19468 ) ) ( HOIST-AT ?auto_19490 ?auto_19478 ) ( AVAILABLE ?auto_19490 ) ( SURFACE-AT ?auto_19457 ?auto_19478 ) ( ON ?auto_19457 ?auto_19486 ) ( CLEAR ?auto_19457 ) ( not ( = ?auto_19456 ?auto_19457 ) ) ( not ( = ?auto_19456 ?auto_19486 ) ) ( not ( = ?auto_19457 ?auto_19486 ) ) ( not ( = ?auto_19464 ?auto_19490 ) ) ( IS-CRATE ?auto_19456 ) ( not ( = ?auto_19495 ?auto_19468 ) ) ( HOIST-AT ?auto_19474 ?auto_19495 ) ( AVAILABLE ?auto_19474 ) ( SURFACE-AT ?auto_19456 ?auto_19495 ) ( ON ?auto_19456 ?auto_19488 ) ( CLEAR ?auto_19456 ) ( not ( = ?auto_19455 ?auto_19456 ) ) ( not ( = ?auto_19455 ?auto_19488 ) ) ( not ( = ?auto_19456 ?auto_19488 ) ) ( not ( = ?auto_19464 ?auto_19474 ) ) ( IS-CRATE ?auto_19455 ) ( not ( = ?auto_19470 ?auto_19468 ) ) ( HOIST-AT ?auto_19476 ?auto_19470 ) ( AVAILABLE ?auto_19476 ) ( SURFACE-AT ?auto_19455 ?auto_19470 ) ( ON ?auto_19455 ?auto_19471 ) ( CLEAR ?auto_19455 ) ( not ( = ?auto_19454 ?auto_19455 ) ) ( not ( = ?auto_19454 ?auto_19471 ) ) ( not ( = ?auto_19455 ?auto_19471 ) ) ( not ( = ?auto_19464 ?auto_19476 ) ) ( SURFACE-AT ?auto_19453 ?auto_19468 ) ( CLEAR ?auto_19453 ) ( IS-CRATE ?auto_19454 ) ( AVAILABLE ?auto_19464 ) ( not ( = ?auto_19493 ?auto_19468 ) ) ( HOIST-AT ?auto_19477 ?auto_19493 ) ( AVAILABLE ?auto_19477 ) ( SURFACE-AT ?auto_19454 ?auto_19493 ) ( ON ?auto_19454 ?auto_19491 ) ( CLEAR ?auto_19454 ) ( TRUCK-AT ?auto_19467 ?auto_19468 ) ( not ( = ?auto_19453 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19491 ) ) ( not ( = ?auto_19454 ?auto_19491 ) ) ( not ( = ?auto_19464 ?auto_19477 ) ) ( not ( = ?auto_19453 ?auto_19455 ) ) ( not ( = ?auto_19453 ?auto_19471 ) ) ( not ( = ?auto_19455 ?auto_19491 ) ) ( not ( = ?auto_19470 ?auto_19493 ) ) ( not ( = ?auto_19476 ?auto_19477 ) ) ( not ( = ?auto_19471 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19456 ) ) ( not ( = ?auto_19453 ?auto_19488 ) ) ( not ( = ?auto_19454 ?auto_19456 ) ) ( not ( = ?auto_19454 ?auto_19488 ) ) ( not ( = ?auto_19456 ?auto_19471 ) ) ( not ( = ?auto_19456 ?auto_19491 ) ) ( not ( = ?auto_19495 ?auto_19470 ) ) ( not ( = ?auto_19495 ?auto_19493 ) ) ( not ( = ?auto_19474 ?auto_19476 ) ) ( not ( = ?auto_19474 ?auto_19477 ) ) ( not ( = ?auto_19488 ?auto_19471 ) ) ( not ( = ?auto_19488 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19486 ) ) ( not ( = ?auto_19454 ?auto_19457 ) ) ( not ( = ?auto_19454 ?auto_19486 ) ) ( not ( = ?auto_19455 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19486 ) ) ( not ( = ?auto_19457 ?auto_19488 ) ) ( not ( = ?auto_19457 ?auto_19471 ) ) ( not ( = ?auto_19457 ?auto_19491 ) ) ( not ( = ?auto_19478 ?auto_19495 ) ) ( not ( = ?auto_19478 ?auto_19470 ) ) ( not ( = ?auto_19478 ?auto_19493 ) ) ( not ( = ?auto_19490 ?auto_19474 ) ) ( not ( = ?auto_19490 ?auto_19476 ) ) ( not ( = ?auto_19490 ?auto_19477 ) ) ( not ( = ?auto_19486 ?auto_19488 ) ) ( not ( = ?auto_19486 ?auto_19471 ) ) ( not ( = ?auto_19486 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19458 ) ) ( not ( = ?auto_19453 ?auto_19484 ) ) ( not ( = ?auto_19454 ?auto_19458 ) ) ( not ( = ?auto_19454 ?auto_19484 ) ) ( not ( = ?auto_19455 ?auto_19458 ) ) ( not ( = ?auto_19455 ?auto_19484 ) ) ( not ( = ?auto_19456 ?auto_19458 ) ) ( not ( = ?auto_19456 ?auto_19484 ) ) ( not ( = ?auto_19458 ?auto_19486 ) ) ( not ( = ?auto_19458 ?auto_19488 ) ) ( not ( = ?auto_19458 ?auto_19471 ) ) ( not ( = ?auto_19458 ?auto_19491 ) ) ( not ( = ?auto_19485 ?auto_19478 ) ) ( not ( = ?auto_19485 ?auto_19495 ) ) ( not ( = ?auto_19485 ?auto_19470 ) ) ( not ( = ?auto_19485 ?auto_19493 ) ) ( not ( = ?auto_19487 ?auto_19490 ) ) ( not ( = ?auto_19487 ?auto_19474 ) ) ( not ( = ?auto_19487 ?auto_19476 ) ) ( not ( = ?auto_19487 ?auto_19477 ) ) ( not ( = ?auto_19484 ?auto_19486 ) ) ( not ( = ?auto_19484 ?auto_19488 ) ) ( not ( = ?auto_19484 ?auto_19471 ) ) ( not ( = ?auto_19484 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19459 ) ) ( not ( = ?auto_19453 ?auto_19496 ) ) ( not ( = ?auto_19454 ?auto_19459 ) ) ( not ( = ?auto_19454 ?auto_19496 ) ) ( not ( = ?auto_19455 ?auto_19459 ) ) ( not ( = ?auto_19455 ?auto_19496 ) ) ( not ( = ?auto_19456 ?auto_19459 ) ) ( not ( = ?auto_19456 ?auto_19496 ) ) ( not ( = ?auto_19457 ?auto_19459 ) ) ( not ( = ?auto_19457 ?auto_19496 ) ) ( not ( = ?auto_19459 ?auto_19484 ) ) ( not ( = ?auto_19459 ?auto_19486 ) ) ( not ( = ?auto_19459 ?auto_19488 ) ) ( not ( = ?auto_19459 ?auto_19471 ) ) ( not ( = ?auto_19459 ?auto_19491 ) ) ( not ( = ?auto_19482 ?auto_19485 ) ) ( not ( = ?auto_19482 ?auto_19478 ) ) ( not ( = ?auto_19482 ?auto_19495 ) ) ( not ( = ?auto_19482 ?auto_19470 ) ) ( not ( = ?auto_19482 ?auto_19493 ) ) ( not ( = ?auto_19473 ?auto_19487 ) ) ( not ( = ?auto_19473 ?auto_19490 ) ) ( not ( = ?auto_19473 ?auto_19474 ) ) ( not ( = ?auto_19473 ?auto_19476 ) ) ( not ( = ?auto_19473 ?auto_19477 ) ) ( not ( = ?auto_19496 ?auto_19484 ) ) ( not ( = ?auto_19496 ?auto_19486 ) ) ( not ( = ?auto_19496 ?auto_19488 ) ) ( not ( = ?auto_19496 ?auto_19471 ) ) ( not ( = ?auto_19496 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19460 ) ) ( not ( = ?auto_19453 ?auto_19481 ) ) ( not ( = ?auto_19454 ?auto_19460 ) ) ( not ( = ?auto_19454 ?auto_19481 ) ) ( not ( = ?auto_19455 ?auto_19460 ) ) ( not ( = ?auto_19455 ?auto_19481 ) ) ( not ( = ?auto_19456 ?auto_19460 ) ) ( not ( = ?auto_19456 ?auto_19481 ) ) ( not ( = ?auto_19457 ?auto_19460 ) ) ( not ( = ?auto_19457 ?auto_19481 ) ) ( not ( = ?auto_19458 ?auto_19460 ) ) ( not ( = ?auto_19458 ?auto_19481 ) ) ( not ( = ?auto_19460 ?auto_19496 ) ) ( not ( = ?auto_19460 ?auto_19484 ) ) ( not ( = ?auto_19460 ?auto_19486 ) ) ( not ( = ?auto_19460 ?auto_19488 ) ) ( not ( = ?auto_19460 ?auto_19471 ) ) ( not ( = ?auto_19460 ?auto_19491 ) ) ( not ( = ?auto_19472 ?auto_19482 ) ) ( not ( = ?auto_19472 ?auto_19485 ) ) ( not ( = ?auto_19472 ?auto_19478 ) ) ( not ( = ?auto_19472 ?auto_19495 ) ) ( not ( = ?auto_19472 ?auto_19470 ) ) ( not ( = ?auto_19472 ?auto_19493 ) ) ( not ( = ?auto_19489 ?auto_19473 ) ) ( not ( = ?auto_19489 ?auto_19487 ) ) ( not ( = ?auto_19489 ?auto_19490 ) ) ( not ( = ?auto_19489 ?auto_19474 ) ) ( not ( = ?auto_19489 ?auto_19476 ) ) ( not ( = ?auto_19489 ?auto_19477 ) ) ( not ( = ?auto_19481 ?auto_19496 ) ) ( not ( = ?auto_19481 ?auto_19484 ) ) ( not ( = ?auto_19481 ?auto_19486 ) ) ( not ( = ?auto_19481 ?auto_19488 ) ) ( not ( = ?auto_19481 ?auto_19471 ) ) ( not ( = ?auto_19481 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19461 ) ) ( not ( = ?auto_19453 ?auto_19483 ) ) ( not ( = ?auto_19454 ?auto_19461 ) ) ( not ( = ?auto_19454 ?auto_19483 ) ) ( not ( = ?auto_19455 ?auto_19461 ) ) ( not ( = ?auto_19455 ?auto_19483 ) ) ( not ( = ?auto_19456 ?auto_19461 ) ) ( not ( = ?auto_19456 ?auto_19483 ) ) ( not ( = ?auto_19457 ?auto_19461 ) ) ( not ( = ?auto_19457 ?auto_19483 ) ) ( not ( = ?auto_19458 ?auto_19461 ) ) ( not ( = ?auto_19458 ?auto_19483 ) ) ( not ( = ?auto_19459 ?auto_19461 ) ) ( not ( = ?auto_19459 ?auto_19483 ) ) ( not ( = ?auto_19461 ?auto_19481 ) ) ( not ( = ?auto_19461 ?auto_19496 ) ) ( not ( = ?auto_19461 ?auto_19484 ) ) ( not ( = ?auto_19461 ?auto_19486 ) ) ( not ( = ?auto_19461 ?auto_19488 ) ) ( not ( = ?auto_19461 ?auto_19471 ) ) ( not ( = ?auto_19461 ?auto_19491 ) ) ( not ( = ?auto_19492 ?auto_19472 ) ) ( not ( = ?auto_19492 ?auto_19482 ) ) ( not ( = ?auto_19492 ?auto_19485 ) ) ( not ( = ?auto_19492 ?auto_19478 ) ) ( not ( = ?auto_19492 ?auto_19495 ) ) ( not ( = ?auto_19492 ?auto_19470 ) ) ( not ( = ?auto_19492 ?auto_19493 ) ) ( not ( = ?auto_19494 ?auto_19489 ) ) ( not ( = ?auto_19494 ?auto_19473 ) ) ( not ( = ?auto_19494 ?auto_19487 ) ) ( not ( = ?auto_19494 ?auto_19490 ) ) ( not ( = ?auto_19494 ?auto_19474 ) ) ( not ( = ?auto_19494 ?auto_19476 ) ) ( not ( = ?auto_19494 ?auto_19477 ) ) ( not ( = ?auto_19483 ?auto_19481 ) ) ( not ( = ?auto_19483 ?auto_19496 ) ) ( not ( = ?auto_19483 ?auto_19484 ) ) ( not ( = ?auto_19483 ?auto_19486 ) ) ( not ( = ?auto_19483 ?auto_19488 ) ) ( not ( = ?auto_19483 ?auto_19471 ) ) ( not ( = ?auto_19483 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19462 ) ) ( not ( = ?auto_19453 ?auto_19480 ) ) ( not ( = ?auto_19454 ?auto_19462 ) ) ( not ( = ?auto_19454 ?auto_19480 ) ) ( not ( = ?auto_19455 ?auto_19462 ) ) ( not ( = ?auto_19455 ?auto_19480 ) ) ( not ( = ?auto_19456 ?auto_19462 ) ) ( not ( = ?auto_19456 ?auto_19480 ) ) ( not ( = ?auto_19457 ?auto_19462 ) ) ( not ( = ?auto_19457 ?auto_19480 ) ) ( not ( = ?auto_19458 ?auto_19462 ) ) ( not ( = ?auto_19458 ?auto_19480 ) ) ( not ( = ?auto_19459 ?auto_19462 ) ) ( not ( = ?auto_19459 ?auto_19480 ) ) ( not ( = ?auto_19460 ?auto_19462 ) ) ( not ( = ?auto_19460 ?auto_19480 ) ) ( not ( = ?auto_19462 ?auto_19483 ) ) ( not ( = ?auto_19462 ?auto_19481 ) ) ( not ( = ?auto_19462 ?auto_19496 ) ) ( not ( = ?auto_19462 ?auto_19484 ) ) ( not ( = ?auto_19462 ?auto_19486 ) ) ( not ( = ?auto_19462 ?auto_19488 ) ) ( not ( = ?auto_19462 ?auto_19471 ) ) ( not ( = ?auto_19462 ?auto_19491 ) ) ( not ( = ?auto_19475 ?auto_19492 ) ) ( not ( = ?auto_19475 ?auto_19472 ) ) ( not ( = ?auto_19475 ?auto_19482 ) ) ( not ( = ?auto_19475 ?auto_19485 ) ) ( not ( = ?auto_19475 ?auto_19478 ) ) ( not ( = ?auto_19475 ?auto_19495 ) ) ( not ( = ?auto_19475 ?auto_19470 ) ) ( not ( = ?auto_19475 ?auto_19493 ) ) ( not ( = ?auto_19479 ?auto_19494 ) ) ( not ( = ?auto_19479 ?auto_19489 ) ) ( not ( = ?auto_19479 ?auto_19473 ) ) ( not ( = ?auto_19479 ?auto_19487 ) ) ( not ( = ?auto_19479 ?auto_19490 ) ) ( not ( = ?auto_19479 ?auto_19474 ) ) ( not ( = ?auto_19479 ?auto_19476 ) ) ( not ( = ?auto_19479 ?auto_19477 ) ) ( not ( = ?auto_19480 ?auto_19483 ) ) ( not ( = ?auto_19480 ?auto_19481 ) ) ( not ( = ?auto_19480 ?auto_19496 ) ) ( not ( = ?auto_19480 ?auto_19484 ) ) ( not ( = ?auto_19480 ?auto_19486 ) ) ( not ( = ?auto_19480 ?auto_19488 ) ) ( not ( = ?auto_19480 ?auto_19471 ) ) ( not ( = ?auto_19480 ?auto_19491 ) ) ( not ( = ?auto_19453 ?auto_19463 ) ) ( not ( = ?auto_19453 ?auto_19466 ) ) ( not ( = ?auto_19454 ?auto_19463 ) ) ( not ( = ?auto_19454 ?auto_19466 ) ) ( not ( = ?auto_19455 ?auto_19463 ) ) ( not ( = ?auto_19455 ?auto_19466 ) ) ( not ( = ?auto_19456 ?auto_19463 ) ) ( not ( = ?auto_19456 ?auto_19466 ) ) ( not ( = ?auto_19457 ?auto_19463 ) ) ( not ( = ?auto_19457 ?auto_19466 ) ) ( not ( = ?auto_19458 ?auto_19463 ) ) ( not ( = ?auto_19458 ?auto_19466 ) ) ( not ( = ?auto_19459 ?auto_19463 ) ) ( not ( = ?auto_19459 ?auto_19466 ) ) ( not ( = ?auto_19460 ?auto_19463 ) ) ( not ( = ?auto_19460 ?auto_19466 ) ) ( not ( = ?auto_19461 ?auto_19463 ) ) ( not ( = ?auto_19461 ?auto_19466 ) ) ( not ( = ?auto_19463 ?auto_19480 ) ) ( not ( = ?auto_19463 ?auto_19483 ) ) ( not ( = ?auto_19463 ?auto_19481 ) ) ( not ( = ?auto_19463 ?auto_19496 ) ) ( not ( = ?auto_19463 ?auto_19484 ) ) ( not ( = ?auto_19463 ?auto_19486 ) ) ( not ( = ?auto_19463 ?auto_19488 ) ) ( not ( = ?auto_19463 ?auto_19471 ) ) ( not ( = ?auto_19463 ?auto_19491 ) ) ( not ( = ?auto_19469 ?auto_19475 ) ) ( not ( = ?auto_19469 ?auto_19492 ) ) ( not ( = ?auto_19469 ?auto_19472 ) ) ( not ( = ?auto_19469 ?auto_19482 ) ) ( not ( = ?auto_19469 ?auto_19485 ) ) ( not ( = ?auto_19469 ?auto_19478 ) ) ( not ( = ?auto_19469 ?auto_19495 ) ) ( not ( = ?auto_19469 ?auto_19470 ) ) ( not ( = ?auto_19469 ?auto_19493 ) ) ( not ( = ?auto_19465 ?auto_19479 ) ) ( not ( = ?auto_19465 ?auto_19494 ) ) ( not ( = ?auto_19465 ?auto_19489 ) ) ( not ( = ?auto_19465 ?auto_19473 ) ) ( not ( = ?auto_19465 ?auto_19487 ) ) ( not ( = ?auto_19465 ?auto_19490 ) ) ( not ( = ?auto_19465 ?auto_19474 ) ) ( not ( = ?auto_19465 ?auto_19476 ) ) ( not ( = ?auto_19465 ?auto_19477 ) ) ( not ( = ?auto_19466 ?auto_19480 ) ) ( not ( = ?auto_19466 ?auto_19483 ) ) ( not ( = ?auto_19466 ?auto_19481 ) ) ( not ( = ?auto_19466 ?auto_19496 ) ) ( not ( = ?auto_19466 ?auto_19484 ) ) ( not ( = ?auto_19466 ?auto_19486 ) ) ( not ( = ?auto_19466 ?auto_19488 ) ) ( not ( = ?auto_19466 ?auto_19471 ) ) ( not ( = ?auto_19466 ?auto_19491 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_19453 ?auto_19454 ?auto_19455 ?auto_19456 ?auto_19457 ?auto_19458 ?auto_19459 ?auto_19460 ?auto_19461 ?auto_19462 )
      ( MAKE-1CRATE ?auto_19462 ?auto_19463 )
      ( MAKE-10CRATE-VERIFY ?auto_19453 ?auto_19454 ?auto_19455 ?auto_19456 ?auto_19457 ?auto_19458 ?auto_19459 ?auto_19460 ?auto_19461 ?auto_19462 ?auto_19463 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_19519 - SURFACE
      ?auto_19520 - SURFACE
      ?auto_19521 - SURFACE
      ?auto_19522 - SURFACE
      ?auto_19523 - SURFACE
      ?auto_19524 - SURFACE
      ?auto_19525 - SURFACE
      ?auto_19526 - SURFACE
      ?auto_19527 - SURFACE
      ?auto_19528 - SURFACE
      ?auto_19529 - SURFACE
      ?auto_19530 - SURFACE
    )
    :vars
    (
      ?auto_19533 - HOIST
      ?auto_19531 - PLACE
      ?auto_19535 - PLACE
      ?auto_19532 - HOIST
      ?auto_19534 - SURFACE
      ?auto_19540 - PLACE
      ?auto_19557 - HOIST
      ?auto_19564 - SURFACE
      ?auto_19543 - PLACE
      ?auto_19545 - HOIST
      ?auto_19548 - SURFACE
      ?auto_19565 - PLACE
      ?auto_19547 - HOIST
      ?auto_19544 - SURFACE
      ?auto_19537 - PLACE
      ?auto_19550 - HOIST
      ?auto_19559 - SURFACE
      ?auto_19549 - PLACE
      ?auto_19539 - HOIST
      ?auto_19546 - SURFACE
      ?auto_19556 - PLACE
      ?auto_19561 - HOIST
      ?auto_19541 - SURFACE
      ?auto_19553 - PLACE
      ?auto_19551 - HOIST
      ?auto_19538 - SURFACE
      ?auto_19562 - PLACE
      ?auto_19554 - HOIST
      ?auto_19560 - SURFACE
      ?auto_19542 - PLACE
      ?auto_19558 - HOIST
      ?auto_19555 - SURFACE
      ?auto_19563 - PLACE
      ?auto_19566 - HOIST
      ?auto_19552 - SURFACE
      ?auto_19536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19533 ?auto_19531 ) ( IS-CRATE ?auto_19530 ) ( not ( = ?auto_19535 ?auto_19531 ) ) ( HOIST-AT ?auto_19532 ?auto_19535 ) ( AVAILABLE ?auto_19532 ) ( SURFACE-AT ?auto_19530 ?auto_19535 ) ( ON ?auto_19530 ?auto_19534 ) ( CLEAR ?auto_19530 ) ( not ( = ?auto_19529 ?auto_19530 ) ) ( not ( = ?auto_19529 ?auto_19534 ) ) ( not ( = ?auto_19530 ?auto_19534 ) ) ( not ( = ?auto_19533 ?auto_19532 ) ) ( IS-CRATE ?auto_19529 ) ( not ( = ?auto_19540 ?auto_19531 ) ) ( HOIST-AT ?auto_19557 ?auto_19540 ) ( AVAILABLE ?auto_19557 ) ( SURFACE-AT ?auto_19529 ?auto_19540 ) ( ON ?auto_19529 ?auto_19564 ) ( CLEAR ?auto_19529 ) ( not ( = ?auto_19528 ?auto_19529 ) ) ( not ( = ?auto_19528 ?auto_19564 ) ) ( not ( = ?auto_19529 ?auto_19564 ) ) ( not ( = ?auto_19533 ?auto_19557 ) ) ( IS-CRATE ?auto_19528 ) ( not ( = ?auto_19543 ?auto_19531 ) ) ( HOIST-AT ?auto_19545 ?auto_19543 ) ( AVAILABLE ?auto_19545 ) ( SURFACE-AT ?auto_19528 ?auto_19543 ) ( ON ?auto_19528 ?auto_19548 ) ( CLEAR ?auto_19528 ) ( not ( = ?auto_19527 ?auto_19528 ) ) ( not ( = ?auto_19527 ?auto_19548 ) ) ( not ( = ?auto_19528 ?auto_19548 ) ) ( not ( = ?auto_19533 ?auto_19545 ) ) ( IS-CRATE ?auto_19527 ) ( not ( = ?auto_19565 ?auto_19531 ) ) ( HOIST-AT ?auto_19547 ?auto_19565 ) ( AVAILABLE ?auto_19547 ) ( SURFACE-AT ?auto_19527 ?auto_19565 ) ( ON ?auto_19527 ?auto_19544 ) ( CLEAR ?auto_19527 ) ( not ( = ?auto_19526 ?auto_19527 ) ) ( not ( = ?auto_19526 ?auto_19544 ) ) ( not ( = ?auto_19527 ?auto_19544 ) ) ( not ( = ?auto_19533 ?auto_19547 ) ) ( IS-CRATE ?auto_19526 ) ( not ( = ?auto_19537 ?auto_19531 ) ) ( HOIST-AT ?auto_19550 ?auto_19537 ) ( AVAILABLE ?auto_19550 ) ( SURFACE-AT ?auto_19526 ?auto_19537 ) ( ON ?auto_19526 ?auto_19559 ) ( CLEAR ?auto_19526 ) ( not ( = ?auto_19525 ?auto_19526 ) ) ( not ( = ?auto_19525 ?auto_19559 ) ) ( not ( = ?auto_19526 ?auto_19559 ) ) ( not ( = ?auto_19533 ?auto_19550 ) ) ( IS-CRATE ?auto_19525 ) ( not ( = ?auto_19549 ?auto_19531 ) ) ( HOIST-AT ?auto_19539 ?auto_19549 ) ( AVAILABLE ?auto_19539 ) ( SURFACE-AT ?auto_19525 ?auto_19549 ) ( ON ?auto_19525 ?auto_19546 ) ( CLEAR ?auto_19525 ) ( not ( = ?auto_19524 ?auto_19525 ) ) ( not ( = ?auto_19524 ?auto_19546 ) ) ( not ( = ?auto_19525 ?auto_19546 ) ) ( not ( = ?auto_19533 ?auto_19539 ) ) ( IS-CRATE ?auto_19524 ) ( not ( = ?auto_19556 ?auto_19531 ) ) ( HOIST-AT ?auto_19561 ?auto_19556 ) ( AVAILABLE ?auto_19561 ) ( SURFACE-AT ?auto_19524 ?auto_19556 ) ( ON ?auto_19524 ?auto_19541 ) ( CLEAR ?auto_19524 ) ( not ( = ?auto_19523 ?auto_19524 ) ) ( not ( = ?auto_19523 ?auto_19541 ) ) ( not ( = ?auto_19524 ?auto_19541 ) ) ( not ( = ?auto_19533 ?auto_19561 ) ) ( IS-CRATE ?auto_19523 ) ( not ( = ?auto_19553 ?auto_19531 ) ) ( HOIST-AT ?auto_19551 ?auto_19553 ) ( AVAILABLE ?auto_19551 ) ( SURFACE-AT ?auto_19523 ?auto_19553 ) ( ON ?auto_19523 ?auto_19538 ) ( CLEAR ?auto_19523 ) ( not ( = ?auto_19522 ?auto_19523 ) ) ( not ( = ?auto_19522 ?auto_19538 ) ) ( not ( = ?auto_19523 ?auto_19538 ) ) ( not ( = ?auto_19533 ?auto_19551 ) ) ( IS-CRATE ?auto_19522 ) ( not ( = ?auto_19562 ?auto_19531 ) ) ( HOIST-AT ?auto_19554 ?auto_19562 ) ( AVAILABLE ?auto_19554 ) ( SURFACE-AT ?auto_19522 ?auto_19562 ) ( ON ?auto_19522 ?auto_19560 ) ( CLEAR ?auto_19522 ) ( not ( = ?auto_19521 ?auto_19522 ) ) ( not ( = ?auto_19521 ?auto_19560 ) ) ( not ( = ?auto_19522 ?auto_19560 ) ) ( not ( = ?auto_19533 ?auto_19554 ) ) ( IS-CRATE ?auto_19521 ) ( not ( = ?auto_19542 ?auto_19531 ) ) ( HOIST-AT ?auto_19558 ?auto_19542 ) ( AVAILABLE ?auto_19558 ) ( SURFACE-AT ?auto_19521 ?auto_19542 ) ( ON ?auto_19521 ?auto_19555 ) ( CLEAR ?auto_19521 ) ( not ( = ?auto_19520 ?auto_19521 ) ) ( not ( = ?auto_19520 ?auto_19555 ) ) ( not ( = ?auto_19521 ?auto_19555 ) ) ( not ( = ?auto_19533 ?auto_19558 ) ) ( SURFACE-AT ?auto_19519 ?auto_19531 ) ( CLEAR ?auto_19519 ) ( IS-CRATE ?auto_19520 ) ( AVAILABLE ?auto_19533 ) ( not ( = ?auto_19563 ?auto_19531 ) ) ( HOIST-AT ?auto_19566 ?auto_19563 ) ( AVAILABLE ?auto_19566 ) ( SURFACE-AT ?auto_19520 ?auto_19563 ) ( ON ?auto_19520 ?auto_19552 ) ( CLEAR ?auto_19520 ) ( TRUCK-AT ?auto_19536 ?auto_19531 ) ( not ( = ?auto_19519 ?auto_19520 ) ) ( not ( = ?auto_19519 ?auto_19552 ) ) ( not ( = ?auto_19520 ?auto_19552 ) ) ( not ( = ?auto_19533 ?auto_19566 ) ) ( not ( = ?auto_19519 ?auto_19521 ) ) ( not ( = ?auto_19519 ?auto_19555 ) ) ( not ( = ?auto_19521 ?auto_19552 ) ) ( not ( = ?auto_19542 ?auto_19563 ) ) ( not ( = ?auto_19558 ?auto_19566 ) ) ( not ( = ?auto_19555 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19522 ) ) ( not ( = ?auto_19519 ?auto_19560 ) ) ( not ( = ?auto_19520 ?auto_19522 ) ) ( not ( = ?auto_19520 ?auto_19560 ) ) ( not ( = ?auto_19522 ?auto_19555 ) ) ( not ( = ?auto_19522 ?auto_19552 ) ) ( not ( = ?auto_19562 ?auto_19542 ) ) ( not ( = ?auto_19562 ?auto_19563 ) ) ( not ( = ?auto_19554 ?auto_19558 ) ) ( not ( = ?auto_19554 ?auto_19566 ) ) ( not ( = ?auto_19560 ?auto_19555 ) ) ( not ( = ?auto_19560 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19523 ) ) ( not ( = ?auto_19519 ?auto_19538 ) ) ( not ( = ?auto_19520 ?auto_19523 ) ) ( not ( = ?auto_19520 ?auto_19538 ) ) ( not ( = ?auto_19521 ?auto_19523 ) ) ( not ( = ?auto_19521 ?auto_19538 ) ) ( not ( = ?auto_19523 ?auto_19560 ) ) ( not ( = ?auto_19523 ?auto_19555 ) ) ( not ( = ?auto_19523 ?auto_19552 ) ) ( not ( = ?auto_19553 ?auto_19562 ) ) ( not ( = ?auto_19553 ?auto_19542 ) ) ( not ( = ?auto_19553 ?auto_19563 ) ) ( not ( = ?auto_19551 ?auto_19554 ) ) ( not ( = ?auto_19551 ?auto_19558 ) ) ( not ( = ?auto_19551 ?auto_19566 ) ) ( not ( = ?auto_19538 ?auto_19560 ) ) ( not ( = ?auto_19538 ?auto_19555 ) ) ( not ( = ?auto_19538 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19524 ) ) ( not ( = ?auto_19519 ?auto_19541 ) ) ( not ( = ?auto_19520 ?auto_19524 ) ) ( not ( = ?auto_19520 ?auto_19541 ) ) ( not ( = ?auto_19521 ?auto_19524 ) ) ( not ( = ?auto_19521 ?auto_19541 ) ) ( not ( = ?auto_19522 ?auto_19524 ) ) ( not ( = ?auto_19522 ?auto_19541 ) ) ( not ( = ?auto_19524 ?auto_19538 ) ) ( not ( = ?auto_19524 ?auto_19560 ) ) ( not ( = ?auto_19524 ?auto_19555 ) ) ( not ( = ?auto_19524 ?auto_19552 ) ) ( not ( = ?auto_19556 ?auto_19553 ) ) ( not ( = ?auto_19556 ?auto_19562 ) ) ( not ( = ?auto_19556 ?auto_19542 ) ) ( not ( = ?auto_19556 ?auto_19563 ) ) ( not ( = ?auto_19561 ?auto_19551 ) ) ( not ( = ?auto_19561 ?auto_19554 ) ) ( not ( = ?auto_19561 ?auto_19558 ) ) ( not ( = ?auto_19561 ?auto_19566 ) ) ( not ( = ?auto_19541 ?auto_19538 ) ) ( not ( = ?auto_19541 ?auto_19560 ) ) ( not ( = ?auto_19541 ?auto_19555 ) ) ( not ( = ?auto_19541 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19525 ) ) ( not ( = ?auto_19519 ?auto_19546 ) ) ( not ( = ?auto_19520 ?auto_19525 ) ) ( not ( = ?auto_19520 ?auto_19546 ) ) ( not ( = ?auto_19521 ?auto_19525 ) ) ( not ( = ?auto_19521 ?auto_19546 ) ) ( not ( = ?auto_19522 ?auto_19525 ) ) ( not ( = ?auto_19522 ?auto_19546 ) ) ( not ( = ?auto_19523 ?auto_19525 ) ) ( not ( = ?auto_19523 ?auto_19546 ) ) ( not ( = ?auto_19525 ?auto_19541 ) ) ( not ( = ?auto_19525 ?auto_19538 ) ) ( not ( = ?auto_19525 ?auto_19560 ) ) ( not ( = ?auto_19525 ?auto_19555 ) ) ( not ( = ?auto_19525 ?auto_19552 ) ) ( not ( = ?auto_19549 ?auto_19556 ) ) ( not ( = ?auto_19549 ?auto_19553 ) ) ( not ( = ?auto_19549 ?auto_19562 ) ) ( not ( = ?auto_19549 ?auto_19542 ) ) ( not ( = ?auto_19549 ?auto_19563 ) ) ( not ( = ?auto_19539 ?auto_19561 ) ) ( not ( = ?auto_19539 ?auto_19551 ) ) ( not ( = ?auto_19539 ?auto_19554 ) ) ( not ( = ?auto_19539 ?auto_19558 ) ) ( not ( = ?auto_19539 ?auto_19566 ) ) ( not ( = ?auto_19546 ?auto_19541 ) ) ( not ( = ?auto_19546 ?auto_19538 ) ) ( not ( = ?auto_19546 ?auto_19560 ) ) ( not ( = ?auto_19546 ?auto_19555 ) ) ( not ( = ?auto_19546 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19526 ) ) ( not ( = ?auto_19519 ?auto_19559 ) ) ( not ( = ?auto_19520 ?auto_19526 ) ) ( not ( = ?auto_19520 ?auto_19559 ) ) ( not ( = ?auto_19521 ?auto_19526 ) ) ( not ( = ?auto_19521 ?auto_19559 ) ) ( not ( = ?auto_19522 ?auto_19526 ) ) ( not ( = ?auto_19522 ?auto_19559 ) ) ( not ( = ?auto_19523 ?auto_19526 ) ) ( not ( = ?auto_19523 ?auto_19559 ) ) ( not ( = ?auto_19524 ?auto_19526 ) ) ( not ( = ?auto_19524 ?auto_19559 ) ) ( not ( = ?auto_19526 ?auto_19546 ) ) ( not ( = ?auto_19526 ?auto_19541 ) ) ( not ( = ?auto_19526 ?auto_19538 ) ) ( not ( = ?auto_19526 ?auto_19560 ) ) ( not ( = ?auto_19526 ?auto_19555 ) ) ( not ( = ?auto_19526 ?auto_19552 ) ) ( not ( = ?auto_19537 ?auto_19549 ) ) ( not ( = ?auto_19537 ?auto_19556 ) ) ( not ( = ?auto_19537 ?auto_19553 ) ) ( not ( = ?auto_19537 ?auto_19562 ) ) ( not ( = ?auto_19537 ?auto_19542 ) ) ( not ( = ?auto_19537 ?auto_19563 ) ) ( not ( = ?auto_19550 ?auto_19539 ) ) ( not ( = ?auto_19550 ?auto_19561 ) ) ( not ( = ?auto_19550 ?auto_19551 ) ) ( not ( = ?auto_19550 ?auto_19554 ) ) ( not ( = ?auto_19550 ?auto_19558 ) ) ( not ( = ?auto_19550 ?auto_19566 ) ) ( not ( = ?auto_19559 ?auto_19546 ) ) ( not ( = ?auto_19559 ?auto_19541 ) ) ( not ( = ?auto_19559 ?auto_19538 ) ) ( not ( = ?auto_19559 ?auto_19560 ) ) ( not ( = ?auto_19559 ?auto_19555 ) ) ( not ( = ?auto_19559 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19527 ) ) ( not ( = ?auto_19519 ?auto_19544 ) ) ( not ( = ?auto_19520 ?auto_19527 ) ) ( not ( = ?auto_19520 ?auto_19544 ) ) ( not ( = ?auto_19521 ?auto_19527 ) ) ( not ( = ?auto_19521 ?auto_19544 ) ) ( not ( = ?auto_19522 ?auto_19527 ) ) ( not ( = ?auto_19522 ?auto_19544 ) ) ( not ( = ?auto_19523 ?auto_19527 ) ) ( not ( = ?auto_19523 ?auto_19544 ) ) ( not ( = ?auto_19524 ?auto_19527 ) ) ( not ( = ?auto_19524 ?auto_19544 ) ) ( not ( = ?auto_19525 ?auto_19527 ) ) ( not ( = ?auto_19525 ?auto_19544 ) ) ( not ( = ?auto_19527 ?auto_19559 ) ) ( not ( = ?auto_19527 ?auto_19546 ) ) ( not ( = ?auto_19527 ?auto_19541 ) ) ( not ( = ?auto_19527 ?auto_19538 ) ) ( not ( = ?auto_19527 ?auto_19560 ) ) ( not ( = ?auto_19527 ?auto_19555 ) ) ( not ( = ?auto_19527 ?auto_19552 ) ) ( not ( = ?auto_19565 ?auto_19537 ) ) ( not ( = ?auto_19565 ?auto_19549 ) ) ( not ( = ?auto_19565 ?auto_19556 ) ) ( not ( = ?auto_19565 ?auto_19553 ) ) ( not ( = ?auto_19565 ?auto_19562 ) ) ( not ( = ?auto_19565 ?auto_19542 ) ) ( not ( = ?auto_19565 ?auto_19563 ) ) ( not ( = ?auto_19547 ?auto_19550 ) ) ( not ( = ?auto_19547 ?auto_19539 ) ) ( not ( = ?auto_19547 ?auto_19561 ) ) ( not ( = ?auto_19547 ?auto_19551 ) ) ( not ( = ?auto_19547 ?auto_19554 ) ) ( not ( = ?auto_19547 ?auto_19558 ) ) ( not ( = ?auto_19547 ?auto_19566 ) ) ( not ( = ?auto_19544 ?auto_19559 ) ) ( not ( = ?auto_19544 ?auto_19546 ) ) ( not ( = ?auto_19544 ?auto_19541 ) ) ( not ( = ?auto_19544 ?auto_19538 ) ) ( not ( = ?auto_19544 ?auto_19560 ) ) ( not ( = ?auto_19544 ?auto_19555 ) ) ( not ( = ?auto_19544 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19528 ) ) ( not ( = ?auto_19519 ?auto_19548 ) ) ( not ( = ?auto_19520 ?auto_19528 ) ) ( not ( = ?auto_19520 ?auto_19548 ) ) ( not ( = ?auto_19521 ?auto_19528 ) ) ( not ( = ?auto_19521 ?auto_19548 ) ) ( not ( = ?auto_19522 ?auto_19528 ) ) ( not ( = ?auto_19522 ?auto_19548 ) ) ( not ( = ?auto_19523 ?auto_19528 ) ) ( not ( = ?auto_19523 ?auto_19548 ) ) ( not ( = ?auto_19524 ?auto_19528 ) ) ( not ( = ?auto_19524 ?auto_19548 ) ) ( not ( = ?auto_19525 ?auto_19528 ) ) ( not ( = ?auto_19525 ?auto_19548 ) ) ( not ( = ?auto_19526 ?auto_19528 ) ) ( not ( = ?auto_19526 ?auto_19548 ) ) ( not ( = ?auto_19528 ?auto_19544 ) ) ( not ( = ?auto_19528 ?auto_19559 ) ) ( not ( = ?auto_19528 ?auto_19546 ) ) ( not ( = ?auto_19528 ?auto_19541 ) ) ( not ( = ?auto_19528 ?auto_19538 ) ) ( not ( = ?auto_19528 ?auto_19560 ) ) ( not ( = ?auto_19528 ?auto_19555 ) ) ( not ( = ?auto_19528 ?auto_19552 ) ) ( not ( = ?auto_19543 ?auto_19565 ) ) ( not ( = ?auto_19543 ?auto_19537 ) ) ( not ( = ?auto_19543 ?auto_19549 ) ) ( not ( = ?auto_19543 ?auto_19556 ) ) ( not ( = ?auto_19543 ?auto_19553 ) ) ( not ( = ?auto_19543 ?auto_19562 ) ) ( not ( = ?auto_19543 ?auto_19542 ) ) ( not ( = ?auto_19543 ?auto_19563 ) ) ( not ( = ?auto_19545 ?auto_19547 ) ) ( not ( = ?auto_19545 ?auto_19550 ) ) ( not ( = ?auto_19545 ?auto_19539 ) ) ( not ( = ?auto_19545 ?auto_19561 ) ) ( not ( = ?auto_19545 ?auto_19551 ) ) ( not ( = ?auto_19545 ?auto_19554 ) ) ( not ( = ?auto_19545 ?auto_19558 ) ) ( not ( = ?auto_19545 ?auto_19566 ) ) ( not ( = ?auto_19548 ?auto_19544 ) ) ( not ( = ?auto_19548 ?auto_19559 ) ) ( not ( = ?auto_19548 ?auto_19546 ) ) ( not ( = ?auto_19548 ?auto_19541 ) ) ( not ( = ?auto_19548 ?auto_19538 ) ) ( not ( = ?auto_19548 ?auto_19560 ) ) ( not ( = ?auto_19548 ?auto_19555 ) ) ( not ( = ?auto_19548 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19529 ) ) ( not ( = ?auto_19519 ?auto_19564 ) ) ( not ( = ?auto_19520 ?auto_19529 ) ) ( not ( = ?auto_19520 ?auto_19564 ) ) ( not ( = ?auto_19521 ?auto_19529 ) ) ( not ( = ?auto_19521 ?auto_19564 ) ) ( not ( = ?auto_19522 ?auto_19529 ) ) ( not ( = ?auto_19522 ?auto_19564 ) ) ( not ( = ?auto_19523 ?auto_19529 ) ) ( not ( = ?auto_19523 ?auto_19564 ) ) ( not ( = ?auto_19524 ?auto_19529 ) ) ( not ( = ?auto_19524 ?auto_19564 ) ) ( not ( = ?auto_19525 ?auto_19529 ) ) ( not ( = ?auto_19525 ?auto_19564 ) ) ( not ( = ?auto_19526 ?auto_19529 ) ) ( not ( = ?auto_19526 ?auto_19564 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19527 ?auto_19564 ) ) ( not ( = ?auto_19529 ?auto_19548 ) ) ( not ( = ?auto_19529 ?auto_19544 ) ) ( not ( = ?auto_19529 ?auto_19559 ) ) ( not ( = ?auto_19529 ?auto_19546 ) ) ( not ( = ?auto_19529 ?auto_19541 ) ) ( not ( = ?auto_19529 ?auto_19538 ) ) ( not ( = ?auto_19529 ?auto_19560 ) ) ( not ( = ?auto_19529 ?auto_19555 ) ) ( not ( = ?auto_19529 ?auto_19552 ) ) ( not ( = ?auto_19540 ?auto_19543 ) ) ( not ( = ?auto_19540 ?auto_19565 ) ) ( not ( = ?auto_19540 ?auto_19537 ) ) ( not ( = ?auto_19540 ?auto_19549 ) ) ( not ( = ?auto_19540 ?auto_19556 ) ) ( not ( = ?auto_19540 ?auto_19553 ) ) ( not ( = ?auto_19540 ?auto_19562 ) ) ( not ( = ?auto_19540 ?auto_19542 ) ) ( not ( = ?auto_19540 ?auto_19563 ) ) ( not ( = ?auto_19557 ?auto_19545 ) ) ( not ( = ?auto_19557 ?auto_19547 ) ) ( not ( = ?auto_19557 ?auto_19550 ) ) ( not ( = ?auto_19557 ?auto_19539 ) ) ( not ( = ?auto_19557 ?auto_19561 ) ) ( not ( = ?auto_19557 ?auto_19551 ) ) ( not ( = ?auto_19557 ?auto_19554 ) ) ( not ( = ?auto_19557 ?auto_19558 ) ) ( not ( = ?auto_19557 ?auto_19566 ) ) ( not ( = ?auto_19564 ?auto_19548 ) ) ( not ( = ?auto_19564 ?auto_19544 ) ) ( not ( = ?auto_19564 ?auto_19559 ) ) ( not ( = ?auto_19564 ?auto_19546 ) ) ( not ( = ?auto_19564 ?auto_19541 ) ) ( not ( = ?auto_19564 ?auto_19538 ) ) ( not ( = ?auto_19564 ?auto_19560 ) ) ( not ( = ?auto_19564 ?auto_19555 ) ) ( not ( = ?auto_19564 ?auto_19552 ) ) ( not ( = ?auto_19519 ?auto_19530 ) ) ( not ( = ?auto_19519 ?auto_19534 ) ) ( not ( = ?auto_19520 ?auto_19530 ) ) ( not ( = ?auto_19520 ?auto_19534 ) ) ( not ( = ?auto_19521 ?auto_19530 ) ) ( not ( = ?auto_19521 ?auto_19534 ) ) ( not ( = ?auto_19522 ?auto_19530 ) ) ( not ( = ?auto_19522 ?auto_19534 ) ) ( not ( = ?auto_19523 ?auto_19530 ) ) ( not ( = ?auto_19523 ?auto_19534 ) ) ( not ( = ?auto_19524 ?auto_19530 ) ) ( not ( = ?auto_19524 ?auto_19534 ) ) ( not ( = ?auto_19525 ?auto_19530 ) ) ( not ( = ?auto_19525 ?auto_19534 ) ) ( not ( = ?auto_19526 ?auto_19530 ) ) ( not ( = ?auto_19526 ?auto_19534 ) ) ( not ( = ?auto_19527 ?auto_19530 ) ) ( not ( = ?auto_19527 ?auto_19534 ) ) ( not ( = ?auto_19528 ?auto_19530 ) ) ( not ( = ?auto_19528 ?auto_19534 ) ) ( not ( = ?auto_19530 ?auto_19564 ) ) ( not ( = ?auto_19530 ?auto_19548 ) ) ( not ( = ?auto_19530 ?auto_19544 ) ) ( not ( = ?auto_19530 ?auto_19559 ) ) ( not ( = ?auto_19530 ?auto_19546 ) ) ( not ( = ?auto_19530 ?auto_19541 ) ) ( not ( = ?auto_19530 ?auto_19538 ) ) ( not ( = ?auto_19530 ?auto_19560 ) ) ( not ( = ?auto_19530 ?auto_19555 ) ) ( not ( = ?auto_19530 ?auto_19552 ) ) ( not ( = ?auto_19535 ?auto_19540 ) ) ( not ( = ?auto_19535 ?auto_19543 ) ) ( not ( = ?auto_19535 ?auto_19565 ) ) ( not ( = ?auto_19535 ?auto_19537 ) ) ( not ( = ?auto_19535 ?auto_19549 ) ) ( not ( = ?auto_19535 ?auto_19556 ) ) ( not ( = ?auto_19535 ?auto_19553 ) ) ( not ( = ?auto_19535 ?auto_19562 ) ) ( not ( = ?auto_19535 ?auto_19542 ) ) ( not ( = ?auto_19535 ?auto_19563 ) ) ( not ( = ?auto_19532 ?auto_19557 ) ) ( not ( = ?auto_19532 ?auto_19545 ) ) ( not ( = ?auto_19532 ?auto_19547 ) ) ( not ( = ?auto_19532 ?auto_19550 ) ) ( not ( = ?auto_19532 ?auto_19539 ) ) ( not ( = ?auto_19532 ?auto_19561 ) ) ( not ( = ?auto_19532 ?auto_19551 ) ) ( not ( = ?auto_19532 ?auto_19554 ) ) ( not ( = ?auto_19532 ?auto_19558 ) ) ( not ( = ?auto_19532 ?auto_19566 ) ) ( not ( = ?auto_19534 ?auto_19564 ) ) ( not ( = ?auto_19534 ?auto_19548 ) ) ( not ( = ?auto_19534 ?auto_19544 ) ) ( not ( = ?auto_19534 ?auto_19559 ) ) ( not ( = ?auto_19534 ?auto_19546 ) ) ( not ( = ?auto_19534 ?auto_19541 ) ) ( not ( = ?auto_19534 ?auto_19538 ) ) ( not ( = ?auto_19534 ?auto_19560 ) ) ( not ( = ?auto_19534 ?auto_19555 ) ) ( not ( = ?auto_19534 ?auto_19552 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_19519 ?auto_19520 ?auto_19521 ?auto_19522 ?auto_19523 ?auto_19524 ?auto_19525 ?auto_19526 ?auto_19527 ?auto_19528 ?auto_19529 )
      ( MAKE-1CRATE ?auto_19529 ?auto_19530 )
      ( MAKE-11CRATE-VERIFY ?auto_19519 ?auto_19520 ?auto_19521 ?auto_19522 ?auto_19523 ?auto_19524 ?auto_19525 ?auto_19526 ?auto_19527 ?auto_19528 ?auto_19529 ?auto_19530 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_19590 - SURFACE
      ?auto_19591 - SURFACE
      ?auto_19592 - SURFACE
      ?auto_19593 - SURFACE
      ?auto_19594 - SURFACE
      ?auto_19595 - SURFACE
      ?auto_19596 - SURFACE
      ?auto_19597 - SURFACE
      ?auto_19598 - SURFACE
      ?auto_19599 - SURFACE
      ?auto_19600 - SURFACE
      ?auto_19601 - SURFACE
      ?auto_19602 - SURFACE
    )
    :vars
    (
      ?auto_19603 - HOIST
      ?auto_19608 - PLACE
      ?auto_19607 - PLACE
      ?auto_19606 - HOIST
      ?auto_19604 - SURFACE
      ?auto_19628 - PLACE
      ?auto_19612 - HOIST
      ?auto_19640 - SURFACE
      ?auto_19625 - PLACE
      ?auto_19621 - HOIST
      ?auto_19638 - SURFACE
      ?auto_19613 - PLACE
      ?auto_19636 - HOIST
      ?auto_19620 - SURFACE
      ?auto_19634 - PLACE
      ?auto_19622 - HOIST
      ?auto_19611 - SURFACE
      ?auto_19624 - PLACE
      ?auto_19639 - HOIST
      ?auto_19637 - SURFACE
      ?auto_19616 - PLACE
      ?auto_19631 - HOIST
      ?auto_19623 - SURFACE
      ?auto_19609 - PLACE
      ?auto_19632 - HOIST
      ?auto_19630 - SURFACE
      ?auto_19633 - PLACE
      ?auto_19610 - HOIST
      ?auto_19629 - SURFACE
      ?auto_19615 - PLACE
      ?auto_19614 - HOIST
      ?auto_19626 - SURFACE
      ?auto_19619 - PLACE
      ?auto_19641 - HOIST
      ?auto_19617 - SURFACE
      ?auto_19635 - PLACE
      ?auto_19618 - HOIST
      ?auto_19627 - SURFACE
      ?auto_19605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19603 ?auto_19608 ) ( IS-CRATE ?auto_19602 ) ( not ( = ?auto_19607 ?auto_19608 ) ) ( HOIST-AT ?auto_19606 ?auto_19607 ) ( AVAILABLE ?auto_19606 ) ( SURFACE-AT ?auto_19602 ?auto_19607 ) ( ON ?auto_19602 ?auto_19604 ) ( CLEAR ?auto_19602 ) ( not ( = ?auto_19601 ?auto_19602 ) ) ( not ( = ?auto_19601 ?auto_19604 ) ) ( not ( = ?auto_19602 ?auto_19604 ) ) ( not ( = ?auto_19603 ?auto_19606 ) ) ( IS-CRATE ?auto_19601 ) ( not ( = ?auto_19628 ?auto_19608 ) ) ( HOIST-AT ?auto_19612 ?auto_19628 ) ( AVAILABLE ?auto_19612 ) ( SURFACE-AT ?auto_19601 ?auto_19628 ) ( ON ?auto_19601 ?auto_19640 ) ( CLEAR ?auto_19601 ) ( not ( = ?auto_19600 ?auto_19601 ) ) ( not ( = ?auto_19600 ?auto_19640 ) ) ( not ( = ?auto_19601 ?auto_19640 ) ) ( not ( = ?auto_19603 ?auto_19612 ) ) ( IS-CRATE ?auto_19600 ) ( not ( = ?auto_19625 ?auto_19608 ) ) ( HOIST-AT ?auto_19621 ?auto_19625 ) ( AVAILABLE ?auto_19621 ) ( SURFACE-AT ?auto_19600 ?auto_19625 ) ( ON ?auto_19600 ?auto_19638 ) ( CLEAR ?auto_19600 ) ( not ( = ?auto_19599 ?auto_19600 ) ) ( not ( = ?auto_19599 ?auto_19638 ) ) ( not ( = ?auto_19600 ?auto_19638 ) ) ( not ( = ?auto_19603 ?auto_19621 ) ) ( IS-CRATE ?auto_19599 ) ( not ( = ?auto_19613 ?auto_19608 ) ) ( HOIST-AT ?auto_19636 ?auto_19613 ) ( AVAILABLE ?auto_19636 ) ( SURFACE-AT ?auto_19599 ?auto_19613 ) ( ON ?auto_19599 ?auto_19620 ) ( CLEAR ?auto_19599 ) ( not ( = ?auto_19598 ?auto_19599 ) ) ( not ( = ?auto_19598 ?auto_19620 ) ) ( not ( = ?auto_19599 ?auto_19620 ) ) ( not ( = ?auto_19603 ?auto_19636 ) ) ( IS-CRATE ?auto_19598 ) ( not ( = ?auto_19634 ?auto_19608 ) ) ( HOIST-AT ?auto_19622 ?auto_19634 ) ( AVAILABLE ?auto_19622 ) ( SURFACE-AT ?auto_19598 ?auto_19634 ) ( ON ?auto_19598 ?auto_19611 ) ( CLEAR ?auto_19598 ) ( not ( = ?auto_19597 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19611 ) ) ( not ( = ?auto_19598 ?auto_19611 ) ) ( not ( = ?auto_19603 ?auto_19622 ) ) ( IS-CRATE ?auto_19597 ) ( not ( = ?auto_19624 ?auto_19608 ) ) ( HOIST-AT ?auto_19639 ?auto_19624 ) ( AVAILABLE ?auto_19639 ) ( SURFACE-AT ?auto_19597 ?auto_19624 ) ( ON ?auto_19597 ?auto_19637 ) ( CLEAR ?auto_19597 ) ( not ( = ?auto_19596 ?auto_19597 ) ) ( not ( = ?auto_19596 ?auto_19637 ) ) ( not ( = ?auto_19597 ?auto_19637 ) ) ( not ( = ?auto_19603 ?auto_19639 ) ) ( IS-CRATE ?auto_19596 ) ( not ( = ?auto_19616 ?auto_19608 ) ) ( HOIST-AT ?auto_19631 ?auto_19616 ) ( AVAILABLE ?auto_19631 ) ( SURFACE-AT ?auto_19596 ?auto_19616 ) ( ON ?auto_19596 ?auto_19623 ) ( CLEAR ?auto_19596 ) ( not ( = ?auto_19595 ?auto_19596 ) ) ( not ( = ?auto_19595 ?auto_19623 ) ) ( not ( = ?auto_19596 ?auto_19623 ) ) ( not ( = ?auto_19603 ?auto_19631 ) ) ( IS-CRATE ?auto_19595 ) ( not ( = ?auto_19609 ?auto_19608 ) ) ( HOIST-AT ?auto_19632 ?auto_19609 ) ( AVAILABLE ?auto_19632 ) ( SURFACE-AT ?auto_19595 ?auto_19609 ) ( ON ?auto_19595 ?auto_19630 ) ( CLEAR ?auto_19595 ) ( not ( = ?auto_19594 ?auto_19595 ) ) ( not ( = ?auto_19594 ?auto_19630 ) ) ( not ( = ?auto_19595 ?auto_19630 ) ) ( not ( = ?auto_19603 ?auto_19632 ) ) ( IS-CRATE ?auto_19594 ) ( not ( = ?auto_19633 ?auto_19608 ) ) ( HOIST-AT ?auto_19610 ?auto_19633 ) ( AVAILABLE ?auto_19610 ) ( SURFACE-AT ?auto_19594 ?auto_19633 ) ( ON ?auto_19594 ?auto_19629 ) ( CLEAR ?auto_19594 ) ( not ( = ?auto_19593 ?auto_19594 ) ) ( not ( = ?auto_19593 ?auto_19629 ) ) ( not ( = ?auto_19594 ?auto_19629 ) ) ( not ( = ?auto_19603 ?auto_19610 ) ) ( IS-CRATE ?auto_19593 ) ( not ( = ?auto_19615 ?auto_19608 ) ) ( HOIST-AT ?auto_19614 ?auto_19615 ) ( AVAILABLE ?auto_19614 ) ( SURFACE-AT ?auto_19593 ?auto_19615 ) ( ON ?auto_19593 ?auto_19626 ) ( CLEAR ?auto_19593 ) ( not ( = ?auto_19592 ?auto_19593 ) ) ( not ( = ?auto_19592 ?auto_19626 ) ) ( not ( = ?auto_19593 ?auto_19626 ) ) ( not ( = ?auto_19603 ?auto_19614 ) ) ( IS-CRATE ?auto_19592 ) ( not ( = ?auto_19619 ?auto_19608 ) ) ( HOIST-AT ?auto_19641 ?auto_19619 ) ( AVAILABLE ?auto_19641 ) ( SURFACE-AT ?auto_19592 ?auto_19619 ) ( ON ?auto_19592 ?auto_19617 ) ( CLEAR ?auto_19592 ) ( not ( = ?auto_19591 ?auto_19592 ) ) ( not ( = ?auto_19591 ?auto_19617 ) ) ( not ( = ?auto_19592 ?auto_19617 ) ) ( not ( = ?auto_19603 ?auto_19641 ) ) ( SURFACE-AT ?auto_19590 ?auto_19608 ) ( CLEAR ?auto_19590 ) ( IS-CRATE ?auto_19591 ) ( AVAILABLE ?auto_19603 ) ( not ( = ?auto_19635 ?auto_19608 ) ) ( HOIST-AT ?auto_19618 ?auto_19635 ) ( AVAILABLE ?auto_19618 ) ( SURFACE-AT ?auto_19591 ?auto_19635 ) ( ON ?auto_19591 ?auto_19627 ) ( CLEAR ?auto_19591 ) ( TRUCK-AT ?auto_19605 ?auto_19608 ) ( not ( = ?auto_19590 ?auto_19591 ) ) ( not ( = ?auto_19590 ?auto_19627 ) ) ( not ( = ?auto_19591 ?auto_19627 ) ) ( not ( = ?auto_19603 ?auto_19618 ) ) ( not ( = ?auto_19590 ?auto_19592 ) ) ( not ( = ?auto_19590 ?auto_19617 ) ) ( not ( = ?auto_19592 ?auto_19627 ) ) ( not ( = ?auto_19619 ?auto_19635 ) ) ( not ( = ?auto_19641 ?auto_19618 ) ) ( not ( = ?auto_19617 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19593 ) ) ( not ( = ?auto_19590 ?auto_19626 ) ) ( not ( = ?auto_19591 ?auto_19593 ) ) ( not ( = ?auto_19591 ?auto_19626 ) ) ( not ( = ?auto_19593 ?auto_19617 ) ) ( not ( = ?auto_19593 ?auto_19627 ) ) ( not ( = ?auto_19615 ?auto_19619 ) ) ( not ( = ?auto_19615 ?auto_19635 ) ) ( not ( = ?auto_19614 ?auto_19641 ) ) ( not ( = ?auto_19614 ?auto_19618 ) ) ( not ( = ?auto_19626 ?auto_19617 ) ) ( not ( = ?auto_19626 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19594 ) ) ( not ( = ?auto_19590 ?auto_19629 ) ) ( not ( = ?auto_19591 ?auto_19594 ) ) ( not ( = ?auto_19591 ?auto_19629 ) ) ( not ( = ?auto_19592 ?auto_19594 ) ) ( not ( = ?auto_19592 ?auto_19629 ) ) ( not ( = ?auto_19594 ?auto_19626 ) ) ( not ( = ?auto_19594 ?auto_19617 ) ) ( not ( = ?auto_19594 ?auto_19627 ) ) ( not ( = ?auto_19633 ?auto_19615 ) ) ( not ( = ?auto_19633 ?auto_19619 ) ) ( not ( = ?auto_19633 ?auto_19635 ) ) ( not ( = ?auto_19610 ?auto_19614 ) ) ( not ( = ?auto_19610 ?auto_19641 ) ) ( not ( = ?auto_19610 ?auto_19618 ) ) ( not ( = ?auto_19629 ?auto_19626 ) ) ( not ( = ?auto_19629 ?auto_19617 ) ) ( not ( = ?auto_19629 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19595 ) ) ( not ( = ?auto_19590 ?auto_19630 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19630 ) ) ( not ( = ?auto_19592 ?auto_19595 ) ) ( not ( = ?auto_19592 ?auto_19630 ) ) ( not ( = ?auto_19593 ?auto_19595 ) ) ( not ( = ?auto_19593 ?auto_19630 ) ) ( not ( = ?auto_19595 ?auto_19629 ) ) ( not ( = ?auto_19595 ?auto_19626 ) ) ( not ( = ?auto_19595 ?auto_19617 ) ) ( not ( = ?auto_19595 ?auto_19627 ) ) ( not ( = ?auto_19609 ?auto_19633 ) ) ( not ( = ?auto_19609 ?auto_19615 ) ) ( not ( = ?auto_19609 ?auto_19619 ) ) ( not ( = ?auto_19609 ?auto_19635 ) ) ( not ( = ?auto_19632 ?auto_19610 ) ) ( not ( = ?auto_19632 ?auto_19614 ) ) ( not ( = ?auto_19632 ?auto_19641 ) ) ( not ( = ?auto_19632 ?auto_19618 ) ) ( not ( = ?auto_19630 ?auto_19629 ) ) ( not ( = ?auto_19630 ?auto_19626 ) ) ( not ( = ?auto_19630 ?auto_19617 ) ) ( not ( = ?auto_19630 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19596 ) ) ( not ( = ?auto_19590 ?auto_19623 ) ) ( not ( = ?auto_19591 ?auto_19596 ) ) ( not ( = ?auto_19591 ?auto_19623 ) ) ( not ( = ?auto_19592 ?auto_19596 ) ) ( not ( = ?auto_19592 ?auto_19623 ) ) ( not ( = ?auto_19593 ?auto_19596 ) ) ( not ( = ?auto_19593 ?auto_19623 ) ) ( not ( = ?auto_19594 ?auto_19596 ) ) ( not ( = ?auto_19594 ?auto_19623 ) ) ( not ( = ?auto_19596 ?auto_19630 ) ) ( not ( = ?auto_19596 ?auto_19629 ) ) ( not ( = ?auto_19596 ?auto_19626 ) ) ( not ( = ?auto_19596 ?auto_19617 ) ) ( not ( = ?auto_19596 ?auto_19627 ) ) ( not ( = ?auto_19616 ?auto_19609 ) ) ( not ( = ?auto_19616 ?auto_19633 ) ) ( not ( = ?auto_19616 ?auto_19615 ) ) ( not ( = ?auto_19616 ?auto_19619 ) ) ( not ( = ?auto_19616 ?auto_19635 ) ) ( not ( = ?auto_19631 ?auto_19632 ) ) ( not ( = ?auto_19631 ?auto_19610 ) ) ( not ( = ?auto_19631 ?auto_19614 ) ) ( not ( = ?auto_19631 ?auto_19641 ) ) ( not ( = ?auto_19631 ?auto_19618 ) ) ( not ( = ?auto_19623 ?auto_19630 ) ) ( not ( = ?auto_19623 ?auto_19629 ) ) ( not ( = ?auto_19623 ?auto_19626 ) ) ( not ( = ?auto_19623 ?auto_19617 ) ) ( not ( = ?auto_19623 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19597 ) ) ( not ( = ?auto_19590 ?auto_19637 ) ) ( not ( = ?auto_19591 ?auto_19597 ) ) ( not ( = ?auto_19591 ?auto_19637 ) ) ( not ( = ?auto_19592 ?auto_19597 ) ) ( not ( = ?auto_19592 ?auto_19637 ) ) ( not ( = ?auto_19593 ?auto_19597 ) ) ( not ( = ?auto_19593 ?auto_19637 ) ) ( not ( = ?auto_19594 ?auto_19597 ) ) ( not ( = ?auto_19594 ?auto_19637 ) ) ( not ( = ?auto_19595 ?auto_19597 ) ) ( not ( = ?auto_19595 ?auto_19637 ) ) ( not ( = ?auto_19597 ?auto_19623 ) ) ( not ( = ?auto_19597 ?auto_19630 ) ) ( not ( = ?auto_19597 ?auto_19629 ) ) ( not ( = ?auto_19597 ?auto_19626 ) ) ( not ( = ?auto_19597 ?auto_19617 ) ) ( not ( = ?auto_19597 ?auto_19627 ) ) ( not ( = ?auto_19624 ?auto_19616 ) ) ( not ( = ?auto_19624 ?auto_19609 ) ) ( not ( = ?auto_19624 ?auto_19633 ) ) ( not ( = ?auto_19624 ?auto_19615 ) ) ( not ( = ?auto_19624 ?auto_19619 ) ) ( not ( = ?auto_19624 ?auto_19635 ) ) ( not ( = ?auto_19639 ?auto_19631 ) ) ( not ( = ?auto_19639 ?auto_19632 ) ) ( not ( = ?auto_19639 ?auto_19610 ) ) ( not ( = ?auto_19639 ?auto_19614 ) ) ( not ( = ?auto_19639 ?auto_19641 ) ) ( not ( = ?auto_19639 ?auto_19618 ) ) ( not ( = ?auto_19637 ?auto_19623 ) ) ( not ( = ?auto_19637 ?auto_19630 ) ) ( not ( = ?auto_19637 ?auto_19629 ) ) ( not ( = ?auto_19637 ?auto_19626 ) ) ( not ( = ?auto_19637 ?auto_19617 ) ) ( not ( = ?auto_19637 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19598 ) ) ( not ( = ?auto_19590 ?auto_19611 ) ) ( not ( = ?auto_19591 ?auto_19598 ) ) ( not ( = ?auto_19591 ?auto_19611 ) ) ( not ( = ?auto_19592 ?auto_19598 ) ) ( not ( = ?auto_19592 ?auto_19611 ) ) ( not ( = ?auto_19593 ?auto_19598 ) ) ( not ( = ?auto_19593 ?auto_19611 ) ) ( not ( = ?auto_19594 ?auto_19598 ) ) ( not ( = ?auto_19594 ?auto_19611 ) ) ( not ( = ?auto_19595 ?auto_19598 ) ) ( not ( = ?auto_19595 ?auto_19611 ) ) ( not ( = ?auto_19596 ?auto_19598 ) ) ( not ( = ?auto_19596 ?auto_19611 ) ) ( not ( = ?auto_19598 ?auto_19637 ) ) ( not ( = ?auto_19598 ?auto_19623 ) ) ( not ( = ?auto_19598 ?auto_19630 ) ) ( not ( = ?auto_19598 ?auto_19629 ) ) ( not ( = ?auto_19598 ?auto_19626 ) ) ( not ( = ?auto_19598 ?auto_19617 ) ) ( not ( = ?auto_19598 ?auto_19627 ) ) ( not ( = ?auto_19634 ?auto_19624 ) ) ( not ( = ?auto_19634 ?auto_19616 ) ) ( not ( = ?auto_19634 ?auto_19609 ) ) ( not ( = ?auto_19634 ?auto_19633 ) ) ( not ( = ?auto_19634 ?auto_19615 ) ) ( not ( = ?auto_19634 ?auto_19619 ) ) ( not ( = ?auto_19634 ?auto_19635 ) ) ( not ( = ?auto_19622 ?auto_19639 ) ) ( not ( = ?auto_19622 ?auto_19631 ) ) ( not ( = ?auto_19622 ?auto_19632 ) ) ( not ( = ?auto_19622 ?auto_19610 ) ) ( not ( = ?auto_19622 ?auto_19614 ) ) ( not ( = ?auto_19622 ?auto_19641 ) ) ( not ( = ?auto_19622 ?auto_19618 ) ) ( not ( = ?auto_19611 ?auto_19637 ) ) ( not ( = ?auto_19611 ?auto_19623 ) ) ( not ( = ?auto_19611 ?auto_19630 ) ) ( not ( = ?auto_19611 ?auto_19629 ) ) ( not ( = ?auto_19611 ?auto_19626 ) ) ( not ( = ?auto_19611 ?auto_19617 ) ) ( not ( = ?auto_19611 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19599 ) ) ( not ( = ?auto_19590 ?auto_19620 ) ) ( not ( = ?auto_19591 ?auto_19599 ) ) ( not ( = ?auto_19591 ?auto_19620 ) ) ( not ( = ?auto_19592 ?auto_19599 ) ) ( not ( = ?auto_19592 ?auto_19620 ) ) ( not ( = ?auto_19593 ?auto_19599 ) ) ( not ( = ?auto_19593 ?auto_19620 ) ) ( not ( = ?auto_19594 ?auto_19599 ) ) ( not ( = ?auto_19594 ?auto_19620 ) ) ( not ( = ?auto_19595 ?auto_19599 ) ) ( not ( = ?auto_19595 ?auto_19620 ) ) ( not ( = ?auto_19596 ?auto_19599 ) ) ( not ( = ?auto_19596 ?auto_19620 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19597 ?auto_19620 ) ) ( not ( = ?auto_19599 ?auto_19611 ) ) ( not ( = ?auto_19599 ?auto_19637 ) ) ( not ( = ?auto_19599 ?auto_19623 ) ) ( not ( = ?auto_19599 ?auto_19630 ) ) ( not ( = ?auto_19599 ?auto_19629 ) ) ( not ( = ?auto_19599 ?auto_19626 ) ) ( not ( = ?auto_19599 ?auto_19617 ) ) ( not ( = ?auto_19599 ?auto_19627 ) ) ( not ( = ?auto_19613 ?auto_19634 ) ) ( not ( = ?auto_19613 ?auto_19624 ) ) ( not ( = ?auto_19613 ?auto_19616 ) ) ( not ( = ?auto_19613 ?auto_19609 ) ) ( not ( = ?auto_19613 ?auto_19633 ) ) ( not ( = ?auto_19613 ?auto_19615 ) ) ( not ( = ?auto_19613 ?auto_19619 ) ) ( not ( = ?auto_19613 ?auto_19635 ) ) ( not ( = ?auto_19636 ?auto_19622 ) ) ( not ( = ?auto_19636 ?auto_19639 ) ) ( not ( = ?auto_19636 ?auto_19631 ) ) ( not ( = ?auto_19636 ?auto_19632 ) ) ( not ( = ?auto_19636 ?auto_19610 ) ) ( not ( = ?auto_19636 ?auto_19614 ) ) ( not ( = ?auto_19636 ?auto_19641 ) ) ( not ( = ?auto_19636 ?auto_19618 ) ) ( not ( = ?auto_19620 ?auto_19611 ) ) ( not ( = ?auto_19620 ?auto_19637 ) ) ( not ( = ?auto_19620 ?auto_19623 ) ) ( not ( = ?auto_19620 ?auto_19630 ) ) ( not ( = ?auto_19620 ?auto_19629 ) ) ( not ( = ?auto_19620 ?auto_19626 ) ) ( not ( = ?auto_19620 ?auto_19617 ) ) ( not ( = ?auto_19620 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19600 ) ) ( not ( = ?auto_19590 ?auto_19638 ) ) ( not ( = ?auto_19591 ?auto_19600 ) ) ( not ( = ?auto_19591 ?auto_19638 ) ) ( not ( = ?auto_19592 ?auto_19600 ) ) ( not ( = ?auto_19592 ?auto_19638 ) ) ( not ( = ?auto_19593 ?auto_19600 ) ) ( not ( = ?auto_19593 ?auto_19638 ) ) ( not ( = ?auto_19594 ?auto_19600 ) ) ( not ( = ?auto_19594 ?auto_19638 ) ) ( not ( = ?auto_19595 ?auto_19600 ) ) ( not ( = ?auto_19595 ?auto_19638 ) ) ( not ( = ?auto_19596 ?auto_19600 ) ) ( not ( = ?auto_19596 ?auto_19638 ) ) ( not ( = ?auto_19597 ?auto_19600 ) ) ( not ( = ?auto_19597 ?auto_19638 ) ) ( not ( = ?auto_19598 ?auto_19600 ) ) ( not ( = ?auto_19598 ?auto_19638 ) ) ( not ( = ?auto_19600 ?auto_19620 ) ) ( not ( = ?auto_19600 ?auto_19611 ) ) ( not ( = ?auto_19600 ?auto_19637 ) ) ( not ( = ?auto_19600 ?auto_19623 ) ) ( not ( = ?auto_19600 ?auto_19630 ) ) ( not ( = ?auto_19600 ?auto_19629 ) ) ( not ( = ?auto_19600 ?auto_19626 ) ) ( not ( = ?auto_19600 ?auto_19617 ) ) ( not ( = ?auto_19600 ?auto_19627 ) ) ( not ( = ?auto_19625 ?auto_19613 ) ) ( not ( = ?auto_19625 ?auto_19634 ) ) ( not ( = ?auto_19625 ?auto_19624 ) ) ( not ( = ?auto_19625 ?auto_19616 ) ) ( not ( = ?auto_19625 ?auto_19609 ) ) ( not ( = ?auto_19625 ?auto_19633 ) ) ( not ( = ?auto_19625 ?auto_19615 ) ) ( not ( = ?auto_19625 ?auto_19619 ) ) ( not ( = ?auto_19625 ?auto_19635 ) ) ( not ( = ?auto_19621 ?auto_19636 ) ) ( not ( = ?auto_19621 ?auto_19622 ) ) ( not ( = ?auto_19621 ?auto_19639 ) ) ( not ( = ?auto_19621 ?auto_19631 ) ) ( not ( = ?auto_19621 ?auto_19632 ) ) ( not ( = ?auto_19621 ?auto_19610 ) ) ( not ( = ?auto_19621 ?auto_19614 ) ) ( not ( = ?auto_19621 ?auto_19641 ) ) ( not ( = ?auto_19621 ?auto_19618 ) ) ( not ( = ?auto_19638 ?auto_19620 ) ) ( not ( = ?auto_19638 ?auto_19611 ) ) ( not ( = ?auto_19638 ?auto_19637 ) ) ( not ( = ?auto_19638 ?auto_19623 ) ) ( not ( = ?auto_19638 ?auto_19630 ) ) ( not ( = ?auto_19638 ?auto_19629 ) ) ( not ( = ?auto_19638 ?auto_19626 ) ) ( not ( = ?auto_19638 ?auto_19617 ) ) ( not ( = ?auto_19638 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19601 ) ) ( not ( = ?auto_19590 ?auto_19640 ) ) ( not ( = ?auto_19591 ?auto_19601 ) ) ( not ( = ?auto_19591 ?auto_19640 ) ) ( not ( = ?auto_19592 ?auto_19601 ) ) ( not ( = ?auto_19592 ?auto_19640 ) ) ( not ( = ?auto_19593 ?auto_19601 ) ) ( not ( = ?auto_19593 ?auto_19640 ) ) ( not ( = ?auto_19594 ?auto_19601 ) ) ( not ( = ?auto_19594 ?auto_19640 ) ) ( not ( = ?auto_19595 ?auto_19601 ) ) ( not ( = ?auto_19595 ?auto_19640 ) ) ( not ( = ?auto_19596 ?auto_19601 ) ) ( not ( = ?auto_19596 ?auto_19640 ) ) ( not ( = ?auto_19597 ?auto_19601 ) ) ( not ( = ?auto_19597 ?auto_19640 ) ) ( not ( = ?auto_19598 ?auto_19601 ) ) ( not ( = ?auto_19598 ?auto_19640 ) ) ( not ( = ?auto_19599 ?auto_19601 ) ) ( not ( = ?auto_19599 ?auto_19640 ) ) ( not ( = ?auto_19601 ?auto_19638 ) ) ( not ( = ?auto_19601 ?auto_19620 ) ) ( not ( = ?auto_19601 ?auto_19611 ) ) ( not ( = ?auto_19601 ?auto_19637 ) ) ( not ( = ?auto_19601 ?auto_19623 ) ) ( not ( = ?auto_19601 ?auto_19630 ) ) ( not ( = ?auto_19601 ?auto_19629 ) ) ( not ( = ?auto_19601 ?auto_19626 ) ) ( not ( = ?auto_19601 ?auto_19617 ) ) ( not ( = ?auto_19601 ?auto_19627 ) ) ( not ( = ?auto_19628 ?auto_19625 ) ) ( not ( = ?auto_19628 ?auto_19613 ) ) ( not ( = ?auto_19628 ?auto_19634 ) ) ( not ( = ?auto_19628 ?auto_19624 ) ) ( not ( = ?auto_19628 ?auto_19616 ) ) ( not ( = ?auto_19628 ?auto_19609 ) ) ( not ( = ?auto_19628 ?auto_19633 ) ) ( not ( = ?auto_19628 ?auto_19615 ) ) ( not ( = ?auto_19628 ?auto_19619 ) ) ( not ( = ?auto_19628 ?auto_19635 ) ) ( not ( = ?auto_19612 ?auto_19621 ) ) ( not ( = ?auto_19612 ?auto_19636 ) ) ( not ( = ?auto_19612 ?auto_19622 ) ) ( not ( = ?auto_19612 ?auto_19639 ) ) ( not ( = ?auto_19612 ?auto_19631 ) ) ( not ( = ?auto_19612 ?auto_19632 ) ) ( not ( = ?auto_19612 ?auto_19610 ) ) ( not ( = ?auto_19612 ?auto_19614 ) ) ( not ( = ?auto_19612 ?auto_19641 ) ) ( not ( = ?auto_19612 ?auto_19618 ) ) ( not ( = ?auto_19640 ?auto_19638 ) ) ( not ( = ?auto_19640 ?auto_19620 ) ) ( not ( = ?auto_19640 ?auto_19611 ) ) ( not ( = ?auto_19640 ?auto_19637 ) ) ( not ( = ?auto_19640 ?auto_19623 ) ) ( not ( = ?auto_19640 ?auto_19630 ) ) ( not ( = ?auto_19640 ?auto_19629 ) ) ( not ( = ?auto_19640 ?auto_19626 ) ) ( not ( = ?auto_19640 ?auto_19617 ) ) ( not ( = ?auto_19640 ?auto_19627 ) ) ( not ( = ?auto_19590 ?auto_19602 ) ) ( not ( = ?auto_19590 ?auto_19604 ) ) ( not ( = ?auto_19591 ?auto_19602 ) ) ( not ( = ?auto_19591 ?auto_19604 ) ) ( not ( = ?auto_19592 ?auto_19602 ) ) ( not ( = ?auto_19592 ?auto_19604 ) ) ( not ( = ?auto_19593 ?auto_19602 ) ) ( not ( = ?auto_19593 ?auto_19604 ) ) ( not ( = ?auto_19594 ?auto_19602 ) ) ( not ( = ?auto_19594 ?auto_19604 ) ) ( not ( = ?auto_19595 ?auto_19602 ) ) ( not ( = ?auto_19595 ?auto_19604 ) ) ( not ( = ?auto_19596 ?auto_19602 ) ) ( not ( = ?auto_19596 ?auto_19604 ) ) ( not ( = ?auto_19597 ?auto_19602 ) ) ( not ( = ?auto_19597 ?auto_19604 ) ) ( not ( = ?auto_19598 ?auto_19602 ) ) ( not ( = ?auto_19598 ?auto_19604 ) ) ( not ( = ?auto_19599 ?auto_19602 ) ) ( not ( = ?auto_19599 ?auto_19604 ) ) ( not ( = ?auto_19600 ?auto_19602 ) ) ( not ( = ?auto_19600 ?auto_19604 ) ) ( not ( = ?auto_19602 ?auto_19640 ) ) ( not ( = ?auto_19602 ?auto_19638 ) ) ( not ( = ?auto_19602 ?auto_19620 ) ) ( not ( = ?auto_19602 ?auto_19611 ) ) ( not ( = ?auto_19602 ?auto_19637 ) ) ( not ( = ?auto_19602 ?auto_19623 ) ) ( not ( = ?auto_19602 ?auto_19630 ) ) ( not ( = ?auto_19602 ?auto_19629 ) ) ( not ( = ?auto_19602 ?auto_19626 ) ) ( not ( = ?auto_19602 ?auto_19617 ) ) ( not ( = ?auto_19602 ?auto_19627 ) ) ( not ( = ?auto_19607 ?auto_19628 ) ) ( not ( = ?auto_19607 ?auto_19625 ) ) ( not ( = ?auto_19607 ?auto_19613 ) ) ( not ( = ?auto_19607 ?auto_19634 ) ) ( not ( = ?auto_19607 ?auto_19624 ) ) ( not ( = ?auto_19607 ?auto_19616 ) ) ( not ( = ?auto_19607 ?auto_19609 ) ) ( not ( = ?auto_19607 ?auto_19633 ) ) ( not ( = ?auto_19607 ?auto_19615 ) ) ( not ( = ?auto_19607 ?auto_19619 ) ) ( not ( = ?auto_19607 ?auto_19635 ) ) ( not ( = ?auto_19606 ?auto_19612 ) ) ( not ( = ?auto_19606 ?auto_19621 ) ) ( not ( = ?auto_19606 ?auto_19636 ) ) ( not ( = ?auto_19606 ?auto_19622 ) ) ( not ( = ?auto_19606 ?auto_19639 ) ) ( not ( = ?auto_19606 ?auto_19631 ) ) ( not ( = ?auto_19606 ?auto_19632 ) ) ( not ( = ?auto_19606 ?auto_19610 ) ) ( not ( = ?auto_19606 ?auto_19614 ) ) ( not ( = ?auto_19606 ?auto_19641 ) ) ( not ( = ?auto_19606 ?auto_19618 ) ) ( not ( = ?auto_19604 ?auto_19640 ) ) ( not ( = ?auto_19604 ?auto_19638 ) ) ( not ( = ?auto_19604 ?auto_19620 ) ) ( not ( = ?auto_19604 ?auto_19611 ) ) ( not ( = ?auto_19604 ?auto_19637 ) ) ( not ( = ?auto_19604 ?auto_19623 ) ) ( not ( = ?auto_19604 ?auto_19630 ) ) ( not ( = ?auto_19604 ?auto_19629 ) ) ( not ( = ?auto_19604 ?auto_19626 ) ) ( not ( = ?auto_19604 ?auto_19617 ) ) ( not ( = ?auto_19604 ?auto_19627 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_19590 ?auto_19591 ?auto_19592 ?auto_19593 ?auto_19594 ?auto_19595 ?auto_19596 ?auto_19597 ?auto_19598 ?auto_19599 ?auto_19600 ?auto_19601 )
      ( MAKE-1CRATE ?auto_19601 ?auto_19602 )
      ( MAKE-12CRATE-VERIFY ?auto_19590 ?auto_19591 ?auto_19592 ?auto_19593 ?auto_19594 ?auto_19595 ?auto_19596 ?auto_19597 ?auto_19598 ?auto_19599 ?auto_19600 ?auto_19601 ?auto_19602 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_19666 - SURFACE
      ?auto_19667 - SURFACE
      ?auto_19668 - SURFACE
      ?auto_19669 - SURFACE
      ?auto_19670 - SURFACE
      ?auto_19671 - SURFACE
      ?auto_19672 - SURFACE
      ?auto_19673 - SURFACE
      ?auto_19674 - SURFACE
      ?auto_19675 - SURFACE
      ?auto_19676 - SURFACE
      ?auto_19677 - SURFACE
      ?auto_19678 - SURFACE
      ?auto_19679 - SURFACE
    )
    :vars
    (
      ?auto_19685 - HOIST
      ?auto_19680 - PLACE
      ?auto_19681 - PLACE
      ?auto_19682 - HOIST
      ?auto_19684 - SURFACE
      ?auto_19718 - PLACE
      ?auto_19689 - HOIST
      ?auto_19711 - SURFACE
      ?auto_19715 - PLACE
      ?auto_19696 - HOIST
      ?auto_19686 - SURFACE
      ?auto_19690 - PLACE
      ?auto_19720 - HOIST
      ?auto_19703 - SURFACE
      ?auto_19688 - PLACE
      ?auto_19691 - HOIST
      ?auto_19705 - SURFACE
      ?auto_19719 - PLACE
      ?auto_19716 - HOIST
      ?auto_19698 - SURFACE
      ?auto_19706 - PLACE
      ?auto_19687 - HOIST
      ?auto_19704 - SURFACE
      ?auto_19721 - PLACE
      ?auto_19714 - HOIST
      ?auto_19713 - SURFACE
      ?auto_19710 - PLACE
      ?auto_19717 - HOIST
      ?auto_19700 - SURFACE
      ?auto_19694 - PLACE
      ?auto_19709 - HOIST
      ?auto_19707 - SURFACE
      ?auto_19692 - PLACE
      ?auto_19697 - HOIST
      ?auto_19712 - SURFACE
      ?auto_19695 - PLACE
      ?auto_19693 - HOIST
      ?auto_19708 - SURFACE
      ?auto_19702 - PLACE
      ?auto_19699 - HOIST
      ?auto_19701 - SURFACE
      ?auto_19683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19685 ?auto_19680 ) ( IS-CRATE ?auto_19679 ) ( not ( = ?auto_19681 ?auto_19680 ) ) ( HOIST-AT ?auto_19682 ?auto_19681 ) ( AVAILABLE ?auto_19682 ) ( SURFACE-AT ?auto_19679 ?auto_19681 ) ( ON ?auto_19679 ?auto_19684 ) ( CLEAR ?auto_19679 ) ( not ( = ?auto_19678 ?auto_19679 ) ) ( not ( = ?auto_19678 ?auto_19684 ) ) ( not ( = ?auto_19679 ?auto_19684 ) ) ( not ( = ?auto_19685 ?auto_19682 ) ) ( IS-CRATE ?auto_19678 ) ( not ( = ?auto_19718 ?auto_19680 ) ) ( HOIST-AT ?auto_19689 ?auto_19718 ) ( AVAILABLE ?auto_19689 ) ( SURFACE-AT ?auto_19678 ?auto_19718 ) ( ON ?auto_19678 ?auto_19711 ) ( CLEAR ?auto_19678 ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( not ( = ?auto_19677 ?auto_19711 ) ) ( not ( = ?auto_19678 ?auto_19711 ) ) ( not ( = ?auto_19685 ?auto_19689 ) ) ( IS-CRATE ?auto_19677 ) ( not ( = ?auto_19715 ?auto_19680 ) ) ( HOIST-AT ?auto_19696 ?auto_19715 ) ( AVAILABLE ?auto_19696 ) ( SURFACE-AT ?auto_19677 ?auto_19715 ) ( ON ?auto_19677 ?auto_19686 ) ( CLEAR ?auto_19677 ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19676 ?auto_19686 ) ) ( not ( = ?auto_19677 ?auto_19686 ) ) ( not ( = ?auto_19685 ?auto_19696 ) ) ( IS-CRATE ?auto_19676 ) ( not ( = ?auto_19690 ?auto_19680 ) ) ( HOIST-AT ?auto_19720 ?auto_19690 ) ( AVAILABLE ?auto_19720 ) ( SURFACE-AT ?auto_19676 ?auto_19690 ) ( ON ?auto_19676 ?auto_19703 ) ( CLEAR ?auto_19676 ) ( not ( = ?auto_19675 ?auto_19676 ) ) ( not ( = ?auto_19675 ?auto_19703 ) ) ( not ( = ?auto_19676 ?auto_19703 ) ) ( not ( = ?auto_19685 ?auto_19720 ) ) ( IS-CRATE ?auto_19675 ) ( not ( = ?auto_19688 ?auto_19680 ) ) ( HOIST-AT ?auto_19691 ?auto_19688 ) ( AVAILABLE ?auto_19691 ) ( SURFACE-AT ?auto_19675 ?auto_19688 ) ( ON ?auto_19675 ?auto_19705 ) ( CLEAR ?auto_19675 ) ( not ( = ?auto_19674 ?auto_19675 ) ) ( not ( = ?auto_19674 ?auto_19705 ) ) ( not ( = ?auto_19675 ?auto_19705 ) ) ( not ( = ?auto_19685 ?auto_19691 ) ) ( IS-CRATE ?auto_19674 ) ( not ( = ?auto_19719 ?auto_19680 ) ) ( HOIST-AT ?auto_19716 ?auto_19719 ) ( AVAILABLE ?auto_19716 ) ( SURFACE-AT ?auto_19674 ?auto_19719 ) ( ON ?auto_19674 ?auto_19698 ) ( CLEAR ?auto_19674 ) ( not ( = ?auto_19673 ?auto_19674 ) ) ( not ( = ?auto_19673 ?auto_19698 ) ) ( not ( = ?auto_19674 ?auto_19698 ) ) ( not ( = ?auto_19685 ?auto_19716 ) ) ( IS-CRATE ?auto_19673 ) ( not ( = ?auto_19706 ?auto_19680 ) ) ( HOIST-AT ?auto_19687 ?auto_19706 ) ( AVAILABLE ?auto_19687 ) ( SURFACE-AT ?auto_19673 ?auto_19706 ) ( ON ?auto_19673 ?auto_19704 ) ( CLEAR ?auto_19673 ) ( not ( = ?auto_19672 ?auto_19673 ) ) ( not ( = ?auto_19672 ?auto_19704 ) ) ( not ( = ?auto_19673 ?auto_19704 ) ) ( not ( = ?auto_19685 ?auto_19687 ) ) ( IS-CRATE ?auto_19672 ) ( not ( = ?auto_19721 ?auto_19680 ) ) ( HOIST-AT ?auto_19714 ?auto_19721 ) ( AVAILABLE ?auto_19714 ) ( SURFACE-AT ?auto_19672 ?auto_19721 ) ( ON ?auto_19672 ?auto_19713 ) ( CLEAR ?auto_19672 ) ( not ( = ?auto_19671 ?auto_19672 ) ) ( not ( = ?auto_19671 ?auto_19713 ) ) ( not ( = ?auto_19672 ?auto_19713 ) ) ( not ( = ?auto_19685 ?auto_19714 ) ) ( IS-CRATE ?auto_19671 ) ( not ( = ?auto_19710 ?auto_19680 ) ) ( HOIST-AT ?auto_19717 ?auto_19710 ) ( AVAILABLE ?auto_19717 ) ( SURFACE-AT ?auto_19671 ?auto_19710 ) ( ON ?auto_19671 ?auto_19700 ) ( CLEAR ?auto_19671 ) ( not ( = ?auto_19670 ?auto_19671 ) ) ( not ( = ?auto_19670 ?auto_19700 ) ) ( not ( = ?auto_19671 ?auto_19700 ) ) ( not ( = ?auto_19685 ?auto_19717 ) ) ( IS-CRATE ?auto_19670 ) ( not ( = ?auto_19694 ?auto_19680 ) ) ( HOIST-AT ?auto_19709 ?auto_19694 ) ( AVAILABLE ?auto_19709 ) ( SURFACE-AT ?auto_19670 ?auto_19694 ) ( ON ?auto_19670 ?auto_19707 ) ( CLEAR ?auto_19670 ) ( not ( = ?auto_19669 ?auto_19670 ) ) ( not ( = ?auto_19669 ?auto_19707 ) ) ( not ( = ?auto_19670 ?auto_19707 ) ) ( not ( = ?auto_19685 ?auto_19709 ) ) ( IS-CRATE ?auto_19669 ) ( not ( = ?auto_19692 ?auto_19680 ) ) ( HOIST-AT ?auto_19697 ?auto_19692 ) ( AVAILABLE ?auto_19697 ) ( SURFACE-AT ?auto_19669 ?auto_19692 ) ( ON ?auto_19669 ?auto_19712 ) ( CLEAR ?auto_19669 ) ( not ( = ?auto_19668 ?auto_19669 ) ) ( not ( = ?auto_19668 ?auto_19712 ) ) ( not ( = ?auto_19669 ?auto_19712 ) ) ( not ( = ?auto_19685 ?auto_19697 ) ) ( IS-CRATE ?auto_19668 ) ( not ( = ?auto_19695 ?auto_19680 ) ) ( HOIST-AT ?auto_19693 ?auto_19695 ) ( AVAILABLE ?auto_19693 ) ( SURFACE-AT ?auto_19668 ?auto_19695 ) ( ON ?auto_19668 ?auto_19708 ) ( CLEAR ?auto_19668 ) ( not ( = ?auto_19667 ?auto_19668 ) ) ( not ( = ?auto_19667 ?auto_19708 ) ) ( not ( = ?auto_19668 ?auto_19708 ) ) ( not ( = ?auto_19685 ?auto_19693 ) ) ( SURFACE-AT ?auto_19666 ?auto_19680 ) ( CLEAR ?auto_19666 ) ( IS-CRATE ?auto_19667 ) ( AVAILABLE ?auto_19685 ) ( not ( = ?auto_19702 ?auto_19680 ) ) ( HOIST-AT ?auto_19699 ?auto_19702 ) ( AVAILABLE ?auto_19699 ) ( SURFACE-AT ?auto_19667 ?auto_19702 ) ( ON ?auto_19667 ?auto_19701 ) ( CLEAR ?auto_19667 ) ( TRUCK-AT ?auto_19683 ?auto_19680 ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19666 ?auto_19701 ) ) ( not ( = ?auto_19667 ?auto_19701 ) ) ( not ( = ?auto_19685 ?auto_19699 ) ) ( not ( = ?auto_19666 ?auto_19668 ) ) ( not ( = ?auto_19666 ?auto_19708 ) ) ( not ( = ?auto_19668 ?auto_19701 ) ) ( not ( = ?auto_19695 ?auto_19702 ) ) ( not ( = ?auto_19693 ?auto_19699 ) ) ( not ( = ?auto_19708 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19669 ) ) ( not ( = ?auto_19666 ?auto_19712 ) ) ( not ( = ?auto_19667 ?auto_19669 ) ) ( not ( = ?auto_19667 ?auto_19712 ) ) ( not ( = ?auto_19669 ?auto_19708 ) ) ( not ( = ?auto_19669 ?auto_19701 ) ) ( not ( = ?auto_19692 ?auto_19695 ) ) ( not ( = ?auto_19692 ?auto_19702 ) ) ( not ( = ?auto_19697 ?auto_19693 ) ) ( not ( = ?auto_19697 ?auto_19699 ) ) ( not ( = ?auto_19712 ?auto_19708 ) ) ( not ( = ?auto_19712 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19670 ) ) ( not ( = ?auto_19666 ?auto_19707 ) ) ( not ( = ?auto_19667 ?auto_19670 ) ) ( not ( = ?auto_19667 ?auto_19707 ) ) ( not ( = ?auto_19668 ?auto_19670 ) ) ( not ( = ?auto_19668 ?auto_19707 ) ) ( not ( = ?auto_19670 ?auto_19712 ) ) ( not ( = ?auto_19670 ?auto_19708 ) ) ( not ( = ?auto_19670 ?auto_19701 ) ) ( not ( = ?auto_19694 ?auto_19692 ) ) ( not ( = ?auto_19694 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19702 ) ) ( not ( = ?auto_19709 ?auto_19697 ) ) ( not ( = ?auto_19709 ?auto_19693 ) ) ( not ( = ?auto_19709 ?auto_19699 ) ) ( not ( = ?auto_19707 ?auto_19712 ) ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( not ( = ?auto_19707 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19671 ) ) ( not ( = ?auto_19666 ?auto_19700 ) ) ( not ( = ?auto_19667 ?auto_19671 ) ) ( not ( = ?auto_19667 ?auto_19700 ) ) ( not ( = ?auto_19668 ?auto_19671 ) ) ( not ( = ?auto_19668 ?auto_19700 ) ) ( not ( = ?auto_19669 ?auto_19671 ) ) ( not ( = ?auto_19669 ?auto_19700 ) ) ( not ( = ?auto_19671 ?auto_19707 ) ) ( not ( = ?auto_19671 ?auto_19712 ) ) ( not ( = ?auto_19671 ?auto_19708 ) ) ( not ( = ?auto_19671 ?auto_19701 ) ) ( not ( = ?auto_19710 ?auto_19694 ) ) ( not ( = ?auto_19710 ?auto_19692 ) ) ( not ( = ?auto_19710 ?auto_19695 ) ) ( not ( = ?auto_19710 ?auto_19702 ) ) ( not ( = ?auto_19717 ?auto_19709 ) ) ( not ( = ?auto_19717 ?auto_19697 ) ) ( not ( = ?auto_19717 ?auto_19693 ) ) ( not ( = ?auto_19717 ?auto_19699 ) ) ( not ( = ?auto_19700 ?auto_19707 ) ) ( not ( = ?auto_19700 ?auto_19712 ) ) ( not ( = ?auto_19700 ?auto_19708 ) ) ( not ( = ?auto_19700 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19672 ) ) ( not ( = ?auto_19666 ?auto_19713 ) ) ( not ( = ?auto_19667 ?auto_19672 ) ) ( not ( = ?auto_19667 ?auto_19713 ) ) ( not ( = ?auto_19668 ?auto_19672 ) ) ( not ( = ?auto_19668 ?auto_19713 ) ) ( not ( = ?auto_19669 ?auto_19672 ) ) ( not ( = ?auto_19669 ?auto_19713 ) ) ( not ( = ?auto_19670 ?auto_19672 ) ) ( not ( = ?auto_19670 ?auto_19713 ) ) ( not ( = ?auto_19672 ?auto_19700 ) ) ( not ( = ?auto_19672 ?auto_19707 ) ) ( not ( = ?auto_19672 ?auto_19712 ) ) ( not ( = ?auto_19672 ?auto_19708 ) ) ( not ( = ?auto_19672 ?auto_19701 ) ) ( not ( = ?auto_19721 ?auto_19710 ) ) ( not ( = ?auto_19721 ?auto_19694 ) ) ( not ( = ?auto_19721 ?auto_19692 ) ) ( not ( = ?auto_19721 ?auto_19695 ) ) ( not ( = ?auto_19721 ?auto_19702 ) ) ( not ( = ?auto_19714 ?auto_19717 ) ) ( not ( = ?auto_19714 ?auto_19709 ) ) ( not ( = ?auto_19714 ?auto_19697 ) ) ( not ( = ?auto_19714 ?auto_19693 ) ) ( not ( = ?auto_19714 ?auto_19699 ) ) ( not ( = ?auto_19713 ?auto_19700 ) ) ( not ( = ?auto_19713 ?auto_19707 ) ) ( not ( = ?auto_19713 ?auto_19712 ) ) ( not ( = ?auto_19713 ?auto_19708 ) ) ( not ( = ?auto_19713 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19673 ) ) ( not ( = ?auto_19666 ?auto_19704 ) ) ( not ( = ?auto_19667 ?auto_19673 ) ) ( not ( = ?auto_19667 ?auto_19704 ) ) ( not ( = ?auto_19668 ?auto_19673 ) ) ( not ( = ?auto_19668 ?auto_19704 ) ) ( not ( = ?auto_19669 ?auto_19673 ) ) ( not ( = ?auto_19669 ?auto_19704 ) ) ( not ( = ?auto_19670 ?auto_19673 ) ) ( not ( = ?auto_19670 ?auto_19704 ) ) ( not ( = ?auto_19671 ?auto_19673 ) ) ( not ( = ?auto_19671 ?auto_19704 ) ) ( not ( = ?auto_19673 ?auto_19713 ) ) ( not ( = ?auto_19673 ?auto_19700 ) ) ( not ( = ?auto_19673 ?auto_19707 ) ) ( not ( = ?auto_19673 ?auto_19712 ) ) ( not ( = ?auto_19673 ?auto_19708 ) ) ( not ( = ?auto_19673 ?auto_19701 ) ) ( not ( = ?auto_19706 ?auto_19721 ) ) ( not ( = ?auto_19706 ?auto_19710 ) ) ( not ( = ?auto_19706 ?auto_19694 ) ) ( not ( = ?auto_19706 ?auto_19692 ) ) ( not ( = ?auto_19706 ?auto_19695 ) ) ( not ( = ?auto_19706 ?auto_19702 ) ) ( not ( = ?auto_19687 ?auto_19714 ) ) ( not ( = ?auto_19687 ?auto_19717 ) ) ( not ( = ?auto_19687 ?auto_19709 ) ) ( not ( = ?auto_19687 ?auto_19697 ) ) ( not ( = ?auto_19687 ?auto_19693 ) ) ( not ( = ?auto_19687 ?auto_19699 ) ) ( not ( = ?auto_19704 ?auto_19713 ) ) ( not ( = ?auto_19704 ?auto_19700 ) ) ( not ( = ?auto_19704 ?auto_19707 ) ) ( not ( = ?auto_19704 ?auto_19712 ) ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19704 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19674 ) ) ( not ( = ?auto_19666 ?auto_19698 ) ) ( not ( = ?auto_19667 ?auto_19674 ) ) ( not ( = ?auto_19667 ?auto_19698 ) ) ( not ( = ?auto_19668 ?auto_19674 ) ) ( not ( = ?auto_19668 ?auto_19698 ) ) ( not ( = ?auto_19669 ?auto_19674 ) ) ( not ( = ?auto_19669 ?auto_19698 ) ) ( not ( = ?auto_19670 ?auto_19674 ) ) ( not ( = ?auto_19670 ?auto_19698 ) ) ( not ( = ?auto_19671 ?auto_19674 ) ) ( not ( = ?auto_19671 ?auto_19698 ) ) ( not ( = ?auto_19672 ?auto_19674 ) ) ( not ( = ?auto_19672 ?auto_19698 ) ) ( not ( = ?auto_19674 ?auto_19704 ) ) ( not ( = ?auto_19674 ?auto_19713 ) ) ( not ( = ?auto_19674 ?auto_19700 ) ) ( not ( = ?auto_19674 ?auto_19707 ) ) ( not ( = ?auto_19674 ?auto_19712 ) ) ( not ( = ?auto_19674 ?auto_19708 ) ) ( not ( = ?auto_19674 ?auto_19701 ) ) ( not ( = ?auto_19719 ?auto_19706 ) ) ( not ( = ?auto_19719 ?auto_19721 ) ) ( not ( = ?auto_19719 ?auto_19710 ) ) ( not ( = ?auto_19719 ?auto_19694 ) ) ( not ( = ?auto_19719 ?auto_19692 ) ) ( not ( = ?auto_19719 ?auto_19695 ) ) ( not ( = ?auto_19719 ?auto_19702 ) ) ( not ( = ?auto_19716 ?auto_19687 ) ) ( not ( = ?auto_19716 ?auto_19714 ) ) ( not ( = ?auto_19716 ?auto_19717 ) ) ( not ( = ?auto_19716 ?auto_19709 ) ) ( not ( = ?auto_19716 ?auto_19697 ) ) ( not ( = ?auto_19716 ?auto_19693 ) ) ( not ( = ?auto_19716 ?auto_19699 ) ) ( not ( = ?auto_19698 ?auto_19704 ) ) ( not ( = ?auto_19698 ?auto_19713 ) ) ( not ( = ?auto_19698 ?auto_19700 ) ) ( not ( = ?auto_19698 ?auto_19707 ) ) ( not ( = ?auto_19698 ?auto_19712 ) ) ( not ( = ?auto_19698 ?auto_19708 ) ) ( not ( = ?auto_19698 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19675 ) ) ( not ( = ?auto_19666 ?auto_19705 ) ) ( not ( = ?auto_19667 ?auto_19675 ) ) ( not ( = ?auto_19667 ?auto_19705 ) ) ( not ( = ?auto_19668 ?auto_19675 ) ) ( not ( = ?auto_19668 ?auto_19705 ) ) ( not ( = ?auto_19669 ?auto_19675 ) ) ( not ( = ?auto_19669 ?auto_19705 ) ) ( not ( = ?auto_19670 ?auto_19675 ) ) ( not ( = ?auto_19670 ?auto_19705 ) ) ( not ( = ?auto_19671 ?auto_19675 ) ) ( not ( = ?auto_19671 ?auto_19705 ) ) ( not ( = ?auto_19672 ?auto_19675 ) ) ( not ( = ?auto_19672 ?auto_19705 ) ) ( not ( = ?auto_19673 ?auto_19675 ) ) ( not ( = ?auto_19673 ?auto_19705 ) ) ( not ( = ?auto_19675 ?auto_19698 ) ) ( not ( = ?auto_19675 ?auto_19704 ) ) ( not ( = ?auto_19675 ?auto_19713 ) ) ( not ( = ?auto_19675 ?auto_19700 ) ) ( not ( = ?auto_19675 ?auto_19707 ) ) ( not ( = ?auto_19675 ?auto_19712 ) ) ( not ( = ?auto_19675 ?auto_19708 ) ) ( not ( = ?auto_19675 ?auto_19701 ) ) ( not ( = ?auto_19688 ?auto_19719 ) ) ( not ( = ?auto_19688 ?auto_19706 ) ) ( not ( = ?auto_19688 ?auto_19721 ) ) ( not ( = ?auto_19688 ?auto_19710 ) ) ( not ( = ?auto_19688 ?auto_19694 ) ) ( not ( = ?auto_19688 ?auto_19692 ) ) ( not ( = ?auto_19688 ?auto_19695 ) ) ( not ( = ?auto_19688 ?auto_19702 ) ) ( not ( = ?auto_19691 ?auto_19716 ) ) ( not ( = ?auto_19691 ?auto_19687 ) ) ( not ( = ?auto_19691 ?auto_19714 ) ) ( not ( = ?auto_19691 ?auto_19717 ) ) ( not ( = ?auto_19691 ?auto_19709 ) ) ( not ( = ?auto_19691 ?auto_19697 ) ) ( not ( = ?auto_19691 ?auto_19693 ) ) ( not ( = ?auto_19691 ?auto_19699 ) ) ( not ( = ?auto_19705 ?auto_19698 ) ) ( not ( = ?auto_19705 ?auto_19704 ) ) ( not ( = ?auto_19705 ?auto_19713 ) ) ( not ( = ?auto_19705 ?auto_19700 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19712 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19676 ) ) ( not ( = ?auto_19666 ?auto_19703 ) ) ( not ( = ?auto_19667 ?auto_19676 ) ) ( not ( = ?auto_19667 ?auto_19703 ) ) ( not ( = ?auto_19668 ?auto_19676 ) ) ( not ( = ?auto_19668 ?auto_19703 ) ) ( not ( = ?auto_19669 ?auto_19676 ) ) ( not ( = ?auto_19669 ?auto_19703 ) ) ( not ( = ?auto_19670 ?auto_19676 ) ) ( not ( = ?auto_19670 ?auto_19703 ) ) ( not ( = ?auto_19671 ?auto_19676 ) ) ( not ( = ?auto_19671 ?auto_19703 ) ) ( not ( = ?auto_19672 ?auto_19676 ) ) ( not ( = ?auto_19672 ?auto_19703 ) ) ( not ( = ?auto_19673 ?auto_19676 ) ) ( not ( = ?auto_19673 ?auto_19703 ) ) ( not ( = ?auto_19674 ?auto_19676 ) ) ( not ( = ?auto_19674 ?auto_19703 ) ) ( not ( = ?auto_19676 ?auto_19705 ) ) ( not ( = ?auto_19676 ?auto_19698 ) ) ( not ( = ?auto_19676 ?auto_19704 ) ) ( not ( = ?auto_19676 ?auto_19713 ) ) ( not ( = ?auto_19676 ?auto_19700 ) ) ( not ( = ?auto_19676 ?auto_19707 ) ) ( not ( = ?auto_19676 ?auto_19712 ) ) ( not ( = ?auto_19676 ?auto_19708 ) ) ( not ( = ?auto_19676 ?auto_19701 ) ) ( not ( = ?auto_19690 ?auto_19688 ) ) ( not ( = ?auto_19690 ?auto_19719 ) ) ( not ( = ?auto_19690 ?auto_19706 ) ) ( not ( = ?auto_19690 ?auto_19721 ) ) ( not ( = ?auto_19690 ?auto_19710 ) ) ( not ( = ?auto_19690 ?auto_19694 ) ) ( not ( = ?auto_19690 ?auto_19692 ) ) ( not ( = ?auto_19690 ?auto_19695 ) ) ( not ( = ?auto_19690 ?auto_19702 ) ) ( not ( = ?auto_19720 ?auto_19691 ) ) ( not ( = ?auto_19720 ?auto_19716 ) ) ( not ( = ?auto_19720 ?auto_19687 ) ) ( not ( = ?auto_19720 ?auto_19714 ) ) ( not ( = ?auto_19720 ?auto_19717 ) ) ( not ( = ?auto_19720 ?auto_19709 ) ) ( not ( = ?auto_19720 ?auto_19697 ) ) ( not ( = ?auto_19720 ?auto_19693 ) ) ( not ( = ?auto_19720 ?auto_19699 ) ) ( not ( = ?auto_19703 ?auto_19705 ) ) ( not ( = ?auto_19703 ?auto_19698 ) ) ( not ( = ?auto_19703 ?auto_19704 ) ) ( not ( = ?auto_19703 ?auto_19713 ) ) ( not ( = ?auto_19703 ?auto_19700 ) ) ( not ( = ?auto_19703 ?auto_19707 ) ) ( not ( = ?auto_19703 ?auto_19712 ) ) ( not ( = ?auto_19703 ?auto_19708 ) ) ( not ( = ?auto_19703 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19677 ) ) ( not ( = ?auto_19666 ?auto_19686 ) ) ( not ( = ?auto_19667 ?auto_19677 ) ) ( not ( = ?auto_19667 ?auto_19686 ) ) ( not ( = ?auto_19668 ?auto_19677 ) ) ( not ( = ?auto_19668 ?auto_19686 ) ) ( not ( = ?auto_19669 ?auto_19677 ) ) ( not ( = ?auto_19669 ?auto_19686 ) ) ( not ( = ?auto_19670 ?auto_19677 ) ) ( not ( = ?auto_19670 ?auto_19686 ) ) ( not ( = ?auto_19671 ?auto_19677 ) ) ( not ( = ?auto_19671 ?auto_19686 ) ) ( not ( = ?auto_19672 ?auto_19677 ) ) ( not ( = ?auto_19672 ?auto_19686 ) ) ( not ( = ?auto_19673 ?auto_19677 ) ) ( not ( = ?auto_19673 ?auto_19686 ) ) ( not ( = ?auto_19674 ?auto_19677 ) ) ( not ( = ?auto_19674 ?auto_19686 ) ) ( not ( = ?auto_19675 ?auto_19677 ) ) ( not ( = ?auto_19675 ?auto_19686 ) ) ( not ( = ?auto_19677 ?auto_19703 ) ) ( not ( = ?auto_19677 ?auto_19705 ) ) ( not ( = ?auto_19677 ?auto_19698 ) ) ( not ( = ?auto_19677 ?auto_19704 ) ) ( not ( = ?auto_19677 ?auto_19713 ) ) ( not ( = ?auto_19677 ?auto_19700 ) ) ( not ( = ?auto_19677 ?auto_19707 ) ) ( not ( = ?auto_19677 ?auto_19712 ) ) ( not ( = ?auto_19677 ?auto_19708 ) ) ( not ( = ?auto_19677 ?auto_19701 ) ) ( not ( = ?auto_19715 ?auto_19690 ) ) ( not ( = ?auto_19715 ?auto_19688 ) ) ( not ( = ?auto_19715 ?auto_19719 ) ) ( not ( = ?auto_19715 ?auto_19706 ) ) ( not ( = ?auto_19715 ?auto_19721 ) ) ( not ( = ?auto_19715 ?auto_19710 ) ) ( not ( = ?auto_19715 ?auto_19694 ) ) ( not ( = ?auto_19715 ?auto_19692 ) ) ( not ( = ?auto_19715 ?auto_19695 ) ) ( not ( = ?auto_19715 ?auto_19702 ) ) ( not ( = ?auto_19696 ?auto_19720 ) ) ( not ( = ?auto_19696 ?auto_19691 ) ) ( not ( = ?auto_19696 ?auto_19716 ) ) ( not ( = ?auto_19696 ?auto_19687 ) ) ( not ( = ?auto_19696 ?auto_19714 ) ) ( not ( = ?auto_19696 ?auto_19717 ) ) ( not ( = ?auto_19696 ?auto_19709 ) ) ( not ( = ?auto_19696 ?auto_19697 ) ) ( not ( = ?auto_19696 ?auto_19693 ) ) ( not ( = ?auto_19696 ?auto_19699 ) ) ( not ( = ?auto_19686 ?auto_19703 ) ) ( not ( = ?auto_19686 ?auto_19705 ) ) ( not ( = ?auto_19686 ?auto_19698 ) ) ( not ( = ?auto_19686 ?auto_19704 ) ) ( not ( = ?auto_19686 ?auto_19713 ) ) ( not ( = ?auto_19686 ?auto_19700 ) ) ( not ( = ?auto_19686 ?auto_19707 ) ) ( not ( = ?auto_19686 ?auto_19712 ) ) ( not ( = ?auto_19686 ?auto_19708 ) ) ( not ( = ?auto_19686 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19678 ) ) ( not ( = ?auto_19666 ?auto_19711 ) ) ( not ( = ?auto_19667 ?auto_19678 ) ) ( not ( = ?auto_19667 ?auto_19711 ) ) ( not ( = ?auto_19668 ?auto_19678 ) ) ( not ( = ?auto_19668 ?auto_19711 ) ) ( not ( = ?auto_19669 ?auto_19678 ) ) ( not ( = ?auto_19669 ?auto_19711 ) ) ( not ( = ?auto_19670 ?auto_19678 ) ) ( not ( = ?auto_19670 ?auto_19711 ) ) ( not ( = ?auto_19671 ?auto_19678 ) ) ( not ( = ?auto_19671 ?auto_19711 ) ) ( not ( = ?auto_19672 ?auto_19678 ) ) ( not ( = ?auto_19672 ?auto_19711 ) ) ( not ( = ?auto_19673 ?auto_19678 ) ) ( not ( = ?auto_19673 ?auto_19711 ) ) ( not ( = ?auto_19674 ?auto_19678 ) ) ( not ( = ?auto_19674 ?auto_19711 ) ) ( not ( = ?auto_19675 ?auto_19678 ) ) ( not ( = ?auto_19675 ?auto_19711 ) ) ( not ( = ?auto_19676 ?auto_19678 ) ) ( not ( = ?auto_19676 ?auto_19711 ) ) ( not ( = ?auto_19678 ?auto_19686 ) ) ( not ( = ?auto_19678 ?auto_19703 ) ) ( not ( = ?auto_19678 ?auto_19705 ) ) ( not ( = ?auto_19678 ?auto_19698 ) ) ( not ( = ?auto_19678 ?auto_19704 ) ) ( not ( = ?auto_19678 ?auto_19713 ) ) ( not ( = ?auto_19678 ?auto_19700 ) ) ( not ( = ?auto_19678 ?auto_19707 ) ) ( not ( = ?auto_19678 ?auto_19712 ) ) ( not ( = ?auto_19678 ?auto_19708 ) ) ( not ( = ?auto_19678 ?auto_19701 ) ) ( not ( = ?auto_19718 ?auto_19715 ) ) ( not ( = ?auto_19718 ?auto_19690 ) ) ( not ( = ?auto_19718 ?auto_19688 ) ) ( not ( = ?auto_19718 ?auto_19719 ) ) ( not ( = ?auto_19718 ?auto_19706 ) ) ( not ( = ?auto_19718 ?auto_19721 ) ) ( not ( = ?auto_19718 ?auto_19710 ) ) ( not ( = ?auto_19718 ?auto_19694 ) ) ( not ( = ?auto_19718 ?auto_19692 ) ) ( not ( = ?auto_19718 ?auto_19695 ) ) ( not ( = ?auto_19718 ?auto_19702 ) ) ( not ( = ?auto_19689 ?auto_19696 ) ) ( not ( = ?auto_19689 ?auto_19720 ) ) ( not ( = ?auto_19689 ?auto_19691 ) ) ( not ( = ?auto_19689 ?auto_19716 ) ) ( not ( = ?auto_19689 ?auto_19687 ) ) ( not ( = ?auto_19689 ?auto_19714 ) ) ( not ( = ?auto_19689 ?auto_19717 ) ) ( not ( = ?auto_19689 ?auto_19709 ) ) ( not ( = ?auto_19689 ?auto_19697 ) ) ( not ( = ?auto_19689 ?auto_19693 ) ) ( not ( = ?auto_19689 ?auto_19699 ) ) ( not ( = ?auto_19711 ?auto_19686 ) ) ( not ( = ?auto_19711 ?auto_19703 ) ) ( not ( = ?auto_19711 ?auto_19705 ) ) ( not ( = ?auto_19711 ?auto_19698 ) ) ( not ( = ?auto_19711 ?auto_19704 ) ) ( not ( = ?auto_19711 ?auto_19713 ) ) ( not ( = ?auto_19711 ?auto_19700 ) ) ( not ( = ?auto_19711 ?auto_19707 ) ) ( not ( = ?auto_19711 ?auto_19712 ) ) ( not ( = ?auto_19711 ?auto_19708 ) ) ( not ( = ?auto_19711 ?auto_19701 ) ) ( not ( = ?auto_19666 ?auto_19679 ) ) ( not ( = ?auto_19666 ?auto_19684 ) ) ( not ( = ?auto_19667 ?auto_19679 ) ) ( not ( = ?auto_19667 ?auto_19684 ) ) ( not ( = ?auto_19668 ?auto_19679 ) ) ( not ( = ?auto_19668 ?auto_19684 ) ) ( not ( = ?auto_19669 ?auto_19679 ) ) ( not ( = ?auto_19669 ?auto_19684 ) ) ( not ( = ?auto_19670 ?auto_19679 ) ) ( not ( = ?auto_19670 ?auto_19684 ) ) ( not ( = ?auto_19671 ?auto_19679 ) ) ( not ( = ?auto_19671 ?auto_19684 ) ) ( not ( = ?auto_19672 ?auto_19679 ) ) ( not ( = ?auto_19672 ?auto_19684 ) ) ( not ( = ?auto_19673 ?auto_19679 ) ) ( not ( = ?auto_19673 ?auto_19684 ) ) ( not ( = ?auto_19674 ?auto_19679 ) ) ( not ( = ?auto_19674 ?auto_19684 ) ) ( not ( = ?auto_19675 ?auto_19679 ) ) ( not ( = ?auto_19675 ?auto_19684 ) ) ( not ( = ?auto_19676 ?auto_19679 ) ) ( not ( = ?auto_19676 ?auto_19684 ) ) ( not ( = ?auto_19677 ?auto_19679 ) ) ( not ( = ?auto_19677 ?auto_19684 ) ) ( not ( = ?auto_19679 ?auto_19711 ) ) ( not ( = ?auto_19679 ?auto_19686 ) ) ( not ( = ?auto_19679 ?auto_19703 ) ) ( not ( = ?auto_19679 ?auto_19705 ) ) ( not ( = ?auto_19679 ?auto_19698 ) ) ( not ( = ?auto_19679 ?auto_19704 ) ) ( not ( = ?auto_19679 ?auto_19713 ) ) ( not ( = ?auto_19679 ?auto_19700 ) ) ( not ( = ?auto_19679 ?auto_19707 ) ) ( not ( = ?auto_19679 ?auto_19712 ) ) ( not ( = ?auto_19679 ?auto_19708 ) ) ( not ( = ?auto_19679 ?auto_19701 ) ) ( not ( = ?auto_19681 ?auto_19718 ) ) ( not ( = ?auto_19681 ?auto_19715 ) ) ( not ( = ?auto_19681 ?auto_19690 ) ) ( not ( = ?auto_19681 ?auto_19688 ) ) ( not ( = ?auto_19681 ?auto_19719 ) ) ( not ( = ?auto_19681 ?auto_19706 ) ) ( not ( = ?auto_19681 ?auto_19721 ) ) ( not ( = ?auto_19681 ?auto_19710 ) ) ( not ( = ?auto_19681 ?auto_19694 ) ) ( not ( = ?auto_19681 ?auto_19692 ) ) ( not ( = ?auto_19681 ?auto_19695 ) ) ( not ( = ?auto_19681 ?auto_19702 ) ) ( not ( = ?auto_19682 ?auto_19689 ) ) ( not ( = ?auto_19682 ?auto_19696 ) ) ( not ( = ?auto_19682 ?auto_19720 ) ) ( not ( = ?auto_19682 ?auto_19691 ) ) ( not ( = ?auto_19682 ?auto_19716 ) ) ( not ( = ?auto_19682 ?auto_19687 ) ) ( not ( = ?auto_19682 ?auto_19714 ) ) ( not ( = ?auto_19682 ?auto_19717 ) ) ( not ( = ?auto_19682 ?auto_19709 ) ) ( not ( = ?auto_19682 ?auto_19697 ) ) ( not ( = ?auto_19682 ?auto_19693 ) ) ( not ( = ?auto_19682 ?auto_19699 ) ) ( not ( = ?auto_19684 ?auto_19711 ) ) ( not ( = ?auto_19684 ?auto_19686 ) ) ( not ( = ?auto_19684 ?auto_19703 ) ) ( not ( = ?auto_19684 ?auto_19705 ) ) ( not ( = ?auto_19684 ?auto_19698 ) ) ( not ( = ?auto_19684 ?auto_19704 ) ) ( not ( = ?auto_19684 ?auto_19713 ) ) ( not ( = ?auto_19684 ?auto_19700 ) ) ( not ( = ?auto_19684 ?auto_19707 ) ) ( not ( = ?auto_19684 ?auto_19712 ) ) ( not ( = ?auto_19684 ?auto_19708 ) ) ( not ( = ?auto_19684 ?auto_19701 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19666 ?auto_19667 ?auto_19668 ?auto_19669 ?auto_19670 ?auto_19671 ?auto_19672 ?auto_19673 ?auto_19674 ?auto_19675 ?auto_19676 ?auto_19677 ?auto_19678 )
      ( MAKE-1CRATE ?auto_19678 ?auto_19679 )
      ( MAKE-13CRATE-VERIFY ?auto_19666 ?auto_19667 ?auto_19668 ?auto_19669 ?auto_19670 ?auto_19671 ?auto_19672 ?auto_19673 ?auto_19674 ?auto_19675 ?auto_19676 ?auto_19677 ?auto_19678 ?auto_19679 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_19747 - SURFACE
      ?auto_19748 - SURFACE
      ?auto_19749 - SURFACE
      ?auto_19750 - SURFACE
      ?auto_19751 - SURFACE
      ?auto_19752 - SURFACE
      ?auto_19753 - SURFACE
      ?auto_19754 - SURFACE
      ?auto_19755 - SURFACE
      ?auto_19756 - SURFACE
      ?auto_19757 - SURFACE
      ?auto_19758 - SURFACE
      ?auto_19759 - SURFACE
      ?auto_19760 - SURFACE
      ?auto_19761 - SURFACE
    )
    :vars
    (
      ?auto_19766 - HOIST
      ?auto_19762 - PLACE
      ?auto_19763 - PLACE
      ?auto_19764 - HOIST
      ?auto_19767 - SURFACE
      ?auto_19778 - PLACE
      ?auto_19770 - HOIST
      ?auto_19806 - SURFACE
      ?auto_19791 - PLACE
      ?auto_19787 - HOIST
      ?auto_19768 - SURFACE
      ?auto_19800 - PLACE
      ?auto_19782 - HOIST
      ?auto_19773 - SURFACE
      ?auto_19789 - PLACE
      ?auto_19805 - HOIST
      ?auto_19776 - SURFACE
      ?auto_19771 - PLACE
      ?auto_19794 - HOIST
      ?auto_19785 - SURFACE
      ?auto_19777 - PLACE
      ?auto_19786 - HOIST
      ?auto_19781 - SURFACE
      ?auto_19799 - PLACE
      ?auto_19788 - HOIST
      ?auto_19780 - SURFACE
      ?auto_19769 - PLACE
      ?auto_19796 - HOIST
      ?auto_19793 - SURFACE
      ?auto_19779 - PLACE
      ?auto_19790 - HOIST
      ?auto_19784 - SURFACE
      ?auto_19797 - PLACE
      ?auto_19775 - HOIST
      ?auto_19802 - SURFACE
      ?auto_19801 - PLACE
      ?auto_19792 - HOIST
      ?auto_19795 - SURFACE
      ?auto_19774 - PLACE
      ?auto_19772 - HOIST
      ?auto_19783 - SURFACE
      ?auto_19803 - PLACE
      ?auto_19798 - HOIST
      ?auto_19804 - SURFACE
      ?auto_19765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19766 ?auto_19762 ) ( IS-CRATE ?auto_19761 ) ( not ( = ?auto_19763 ?auto_19762 ) ) ( HOIST-AT ?auto_19764 ?auto_19763 ) ( AVAILABLE ?auto_19764 ) ( SURFACE-AT ?auto_19761 ?auto_19763 ) ( ON ?auto_19761 ?auto_19767 ) ( CLEAR ?auto_19761 ) ( not ( = ?auto_19760 ?auto_19761 ) ) ( not ( = ?auto_19760 ?auto_19767 ) ) ( not ( = ?auto_19761 ?auto_19767 ) ) ( not ( = ?auto_19766 ?auto_19764 ) ) ( IS-CRATE ?auto_19760 ) ( not ( = ?auto_19778 ?auto_19762 ) ) ( HOIST-AT ?auto_19770 ?auto_19778 ) ( AVAILABLE ?auto_19770 ) ( SURFACE-AT ?auto_19760 ?auto_19778 ) ( ON ?auto_19760 ?auto_19806 ) ( CLEAR ?auto_19760 ) ( not ( = ?auto_19759 ?auto_19760 ) ) ( not ( = ?auto_19759 ?auto_19806 ) ) ( not ( = ?auto_19760 ?auto_19806 ) ) ( not ( = ?auto_19766 ?auto_19770 ) ) ( IS-CRATE ?auto_19759 ) ( not ( = ?auto_19791 ?auto_19762 ) ) ( HOIST-AT ?auto_19787 ?auto_19791 ) ( AVAILABLE ?auto_19787 ) ( SURFACE-AT ?auto_19759 ?auto_19791 ) ( ON ?auto_19759 ?auto_19768 ) ( CLEAR ?auto_19759 ) ( not ( = ?auto_19758 ?auto_19759 ) ) ( not ( = ?auto_19758 ?auto_19768 ) ) ( not ( = ?auto_19759 ?auto_19768 ) ) ( not ( = ?auto_19766 ?auto_19787 ) ) ( IS-CRATE ?auto_19758 ) ( not ( = ?auto_19800 ?auto_19762 ) ) ( HOIST-AT ?auto_19782 ?auto_19800 ) ( AVAILABLE ?auto_19782 ) ( SURFACE-AT ?auto_19758 ?auto_19800 ) ( ON ?auto_19758 ?auto_19773 ) ( CLEAR ?auto_19758 ) ( not ( = ?auto_19757 ?auto_19758 ) ) ( not ( = ?auto_19757 ?auto_19773 ) ) ( not ( = ?auto_19758 ?auto_19773 ) ) ( not ( = ?auto_19766 ?auto_19782 ) ) ( IS-CRATE ?auto_19757 ) ( not ( = ?auto_19789 ?auto_19762 ) ) ( HOIST-AT ?auto_19805 ?auto_19789 ) ( AVAILABLE ?auto_19805 ) ( SURFACE-AT ?auto_19757 ?auto_19789 ) ( ON ?auto_19757 ?auto_19776 ) ( CLEAR ?auto_19757 ) ( not ( = ?auto_19756 ?auto_19757 ) ) ( not ( = ?auto_19756 ?auto_19776 ) ) ( not ( = ?auto_19757 ?auto_19776 ) ) ( not ( = ?auto_19766 ?auto_19805 ) ) ( IS-CRATE ?auto_19756 ) ( not ( = ?auto_19771 ?auto_19762 ) ) ( HOIST-AT ?auto_19794 ?auto_19771 ) ( AVAILABLE ?auto_19794 ) ( SURFACE-AT ?auto_19756 ?auto_19771 ) ( ON ?auto_19756 ?auto_19785 ) ( CLEAR ?auto_19756 ) ( not ( = ?auto_19755 ?auto_19756 ) ) ( not ( = ?auto_19755 ?auto_19785 ) ) ( not ( = ?auto_19756 ?auto_19785 ) ) ( not ( = ?auto_19766 ?auto_19794 ) ) ( IS-CRATE ?auto_19755 ) ( not ( = ?auto_19777 ?auto_19762 ) ) ( HOIST-AT ?auto_19786 ?auto_19777 ) ( AVAILABLE ?auto_19786 ) ( SURFACE-AT ?auto_19755 ?auto_19777 ) ( ON ?auto_19755 ?auto_19781 ) ( CLEAR ?auto_19755 ) ( not ( = ?auto_19754 ?auto_19755 ) ) ( not ( = ?auto_19754 ?auto_19781 ) ) ( not ( = ?auto_19755 ?auto_19781 ) ) ( not ( = ?auto_19766 ?auto_19786 ) ) ( IS-CRATE ?auto_19754 ) ( not ( = ?auto_19799 ?auto_19762 ) ) ( HOIST-AT ?auto_19788 ?auto_19799 ) ( AVAILABLE ?auto_19788 ) ( SURFACE-AT ?auto_19754 ?auto_19799 ) ( ON ?auto_19754 ?auto_19780 ) ( CLEAR ?auto_19754 ) ( not ( = ?auto_19753 ?auto_19754 ) ) ( not ( = ?auto_19753 ?auto_19780 ) ) ( not ( = ?auto_19754 ?auto_19780 ) ) ( not ( = ?auto_19766 ?auto_19788 ) ) ( IS-CRATE ?auto_19753 ) ( not ( = ?auto_19769 ?auto_19762 ) ) ( HOIST-AT ?auto_19796 ?auto_19769 ) ( AVAILABLE ?auto_19796 ) ( SURFACE-AT ?auto_19753 ?auto_19769 ) ( ON ?auto_19753 ?auto_19793 ) ( CLEAR ?auto_19753 ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19793 ) ) ( not ( = ?auto_19753 ?auto_19793 ) ) ( not ( = ?auto_19766 ?auto_19796 ) ) ( IS-CRATE ?auto_19752 ) ( not ( = ?auto_19779 ?auto_19762 ) ) ( HOIST-AT ?auto_19790 ?auto_19779 ) ( AVAILABLE ?auto_19790 ) ( SURFACE-AT ?auto_19752 ?auto_19779 ) ( ON ?auto_19752 ?auto_19784 ) ( CLEAR ?auto_19752 ) ( not ( = ?auto_19751 ?auto_19752 ) ) ( not ( = ?auto_19751 ?auto_19784 ) ) ( not ( = ?auto_19752 ?auto_19784 ) ) ( not ( = ?auto_19766 ?auto_19790 ) ) ( IS-CRATE ?auto_19751 ) ( not ( = ?auto_19797 ?auto_19762 ) ) ( HOIST-AT ?auto_19775 ?auto_19797 ) ( AVAILABLE ?auto_19775 ) ( SURFACE-AT ?auto_19751 ?auto_19797 ) ( ON ?auto_19751 ?auto_19802 ) ( CLEAR ?auto_19751 ) ( not ( = ?auto_19750 ?auto_19751 ) ) ( not ( = ?auto_19750 ?auto_19802 ) ) ( not ( = ?auto_19751 ?auto_19802 ) ) ( not ( = ?auto_19766 ?auto_19775 ) ) ( IS-CRATE ?auto_19750 ) ( not ( = ?auto_19801 ?auto_19762 ) ) ( HOIST-AT ?auto_19792 ?auto_19801 ) ( AVAILABLE ?auto_19792 ) ( SURFACE-AT ?auto_19750 ?auto_19801 ) ( ON ?auto_19750 ?auto_19795 ) ( CLEAR ?auto_19750 ) ( not ( = ?auto_19749 ?auto_19750 ) ) ( not ( = ?auto_19749 ?auto_19795 ) ) ( not ( = ?auto_19750 ?auto_19795 ) ) ( not ( = ?auto_19766 ?auto_19792 ) ) ( IS-CRATE ?auto_19749 ) ( not ( = ?auto_19774 ?auto_19762 ) ) ( HOIST-AT ?auto_19772 ?auto_19774 ) ( AVAILABLE ?auto_19772 ) ( SURFACE-AT ?auto_19749 ?auto_19774 ) ( ON ?auto_19749 ?auto_19783 ) ( CLEAR ?auto_19749 ) ( not ( = ?auto_19748 ?auto_19749 ) ) ( not ( = ?auto_19748 ?auto_19783 ) ) ( not ( = ?auto_19749 ?auto_19783 ) ) ( not ( = ?auto_19766 ?auto_19772 ) ) ( SURFACE-AT ?auto_19747 ?auto_19762 ) ( CLEAR ?auto_19747 ) ( IS-CRATE ?auto_19748 ) ( AVAILABLE ?auto_19766 ) ( not ( = ?auto_19803 ?auto_19762 ) ) ( HOIST-AT ?auto_19798 ?auto_19803 ) ( AVAILABLE ?auto_19798 ) ( SURFACE-AT ?auto_19748 ?auto_19803 ) ( ON ?auto_19748 ?auto_19804 ) ( CLEAR ?auto_19748 ) ( TRUCK-AT ?auto_19765 ?auto_19762 ) ( not ( = ?auto_19747 ?auto_19748 ) ) ( not ( = ?auto_19747 ?auto_19804 ) ) ( not ( = ?auto_19748 ?auto_19804 ) ) ( not ( = ?auto_19766 ?auto_19798 ) ) ( not ( = ?auto_19747 ?auto_19749 ) ) ( not ( = ?auto_19747 ?auto_19783 ) ) ( not ( = ?auto_19749 ?auto_19804 ) ) ( not ( = ?auto_19774 ?auto_19803 ) ) ( not ( = ?auto_19772 ?auto_19798 ) ) ( not ( = ?auto_19783 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19750 ) ) ( not ( = ?auto_19747 ?auto_19795 ) ) ( not ( = ?auto_19748 ?auto_19750 ) ) ( not ( = ?auto_19748 ?auto_19795 ) ) ( not ( = ?auto_19750 ?auto_19783 ) ) ( not ( = ?auto_19750 ?auto_19804 ) ) ( not ( = ?auto_19801 ?auto_19774 ) ) ( not ( = ?auto_19801 ?auto_19803 ) ) ( not ( = ?auto_19792 ?auto_19772 ) ) ( not ( = ?auto_19792 ?auto_19798 ) ) ( not ( = ?auto_19795 ?auto_19783 ) ) ( not ( = ?auto_19795 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19751 ) ) ( not ( = ?auto_19747 ?auto_19802 ) ) ( not ( = ?auto_19748 ?auto_19751 ) ) ( not ( = ?auto_19748 ?auto_19802 ) ) ( not ( = ?auto_19749 ?auto_19751 ) ) ( not ( = ?auto_19749 ?auto_19802 ) ) ( not ( = ?auto_19751 ?auto_19795 ) ) ( not ( = ?auto_19751 ?auto_19783 ) ) ( not ( = ?auto_19751 ?auto_19804 ) ) ( not ( = ?auto_19797 ?auto_19801 ) ) ( not ( = ?auto_19797 ?auto_19774 ) ) ( not ( = ?auto_19797 ?auto_19803 ) ) ( not ( = ?auto_19775 ?auto_19792 ) ) ( not ( = ?auto_19775 ?auto_19772 ) ) ( not ( = ?auto_19775 ?auto_19798 ) ) ( not ( = ?auto_19802 ?auto_19795 ) ) ( not ( = ?auto_19802 ?auto_19783 ) ) ( not ( = ?auto_19802 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19752 ) ) ( not ( = ?auto_19747 ?auto_19784 ) ) ( not ( = ?auto_19748 ?auto_19752 ) ) ( not ( = ?auto_19748 ?auto_19784 ) ) ( not ( = ?auto_19749 ?auto_19752 ) ) ( not ( = ?auto_19749 ?auto_19784 ) ) ( not ( = ?auto_19750 ?auto_19752 ) ) ( not ( = ?auto_19750 ?auto_19784 ) ) ( not ( = ?auto_19752 ?auto_19802 ) ) ( not ( = ?auto_19752 ?auto_19795 ) ) ( not ( = ?auto_19752 ?auto_19783 ) ) ( not ( = ?auto_19752 ?auto_19804 ) ) ( not ( = ?auto_19779 ?auto_19797 ) ) ( not ( = ?auto_19779 ?auto_19801 ) ) ( not ( = ?auto_19779 ?auto_19774 ) ) ( not ( = ?auto_19779 ?auto_19803 ) ) ( not ( = ?auto_19790 ?auto_19775 ) ) ( not ( = ?auto_19790 ?auto_19792 ) ) ( not ( = ?auto_19790 ?auto_19772 ) ) ( not ( = ?auto_19790 ?auto_19798 ) ) ( not ( = ?auto_19784 ?auto_19802 ) ) ( not ( = ?auto_19784 ?auto_19795 ) ) ( not ( = ?auto_19784 ?auto_19783 ) ) ( not ( = ?auto_19784 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19753 ) ) ( not ( = ?auto_19747 ?auto_19793 ) ) ( not ( = ?auto_19748 ?auto_19753 ) ) ( not ( = ?auto_19748 ?auto_19793 ) ) ( not ( = ?auto_19749 ?auto_19753 ) ) ( not ( = ?auto_19749 ?auto_19793 ) ) ( not ( = ?auto_19750 ?auto_19753 ) ) ( not ( = ?auto_19750 ?auto_19793 ) ) ( not ( = ?auto_19751 ?auto_19753 ) ) ( not ( = ?auto_19751 ?auto_19793 ) ) ( not ( = ?auto_19753 ?auto_19784 ) ) ( not ( = ?auto_19753 ?auto_19802 ) ) ( not ( = ?auto_19753 ?auto_19795 ) ) ( not ( = ?auto_19753 ?auto_19783 ) ) ( not ( = ?auto_19753 ?auto_19804 ) ) ( not ( = ?auto_19769 ?auto_19779 ) ) ( not ( = ?auto_19769 ?auto_19797 ) ) ( not ( = ?auto_19769 ?auto_19801 ) ) ( not ( = ?auto_19769 ?auto_19774 ) ) ( not ( = ?auto_19769 ?auto_19803 ) ) ( not ( = ?auto_19796 ?auto_19790 ) ) ( not ( = ?auto_19796 ?auto_19775 ) ) ( not ( = ?auto_19796 ?auto_19792 ) ) ( not ( = ?auto_19796 ?auto_19772 ) ) ( not ( = ?auto_19796 ?auto_19798 ) ) ( not ( = ?auto_19793 ?auto_19784 ) ) ( not ( = ?auto_19793 ?auto_19802 ) ) ( not ( = ?auto_19793 ?auto_19795 ) ) ( not ( = ?auto_19793 ?auto_19783 ) ) ( not ( = ?auto_19793 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19754 ) ) ( not ( = ?auto_19747 ?auto_19780 ) ) ( not ( = ?auto_19748 ?auto_19754 ) ) ( not ( = ?auto_19748 ?auto_19780 ) ) ( not ( = ?auto_19749 ?auto_19754 ) ) ( not ( = ?auto_19749 ?auto_19780 ) ) ( not ( = ?auto_19750 ?auto_19754 ) ) ( not ( = ?auto_19750 ?auto_19780 ) ) ( not ( = ?auto_19751 ?auto_19754 ) ) ( not ( = ?auto_19751 ?auto_19780 ) ) ( not ( = ?auto_19752 ?auto_19754 ) ) ( not ( = ?auto_19752 ?auto_19780 ) ) ( not ( = ?auto_19754 ?auto_19793 ) ) ( not ( = ?auto_19754 ?auto_19784 ) ) ( not ( = ?auto_19754 ?auto_19802 ) ) ( not ( = ?auto_19754 ?auto_19795 ) ) ( not ( = ?auto_19754 ?auto_19783 ) ) ( not ( = ?auto_19754 ?auto_19804 ) ) ( not ( = ?auto_19799 ?auto_19769 ) ) ( not ( = ?auto_19799 ?auto_19779 ) ) ( not ( = ?auto_19799 ?auto_19797 ) ) ( not ( = ?auto_19799 ?auto_19801 ) ) ( not ( = ?auto_19799 ?auto_19774 ) ) ( not ( = ?auto_19799 ?auto_19803 ) ) ( not ( = ?auto_19788 ?auto_19796 ) ) ( not ( = ?auto_19788 ?auto_19790 ) ) ( not ( = ?auto_19788 ?auto_19775 ) ) ( not ( = ?auto_19788 ?auto_19792 ) ) ( not ( = ?auto_19788 ?auto_19772 ) ) ( not ( = ?auto_19788 ?auto_19798 ) ) ( not ( = ?auto_19780 ?auto_19793 ) ) ( not ( = ?auto_19780 ?auto_19784 ) ) ( not ( = ?auto_19780 ?auto_19802 ) ) ( not ( = ?auto_19780 ?auto_19795 ) ) ( not ( = ?auto_19780 ?auto_19783 ) ) ( not ( = ?auto_19780 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19755 ) ) ( not ( = ?auto_19747 ?auto_19781 ) ) ( not ( = ?auto_19748 ?auto_19755 ) ) ( not ( = ?auto_19748 ?auto_19781 ) ) ( not ( = ?auto_19749 ?auto_19755 ) ) ( not ( = ?auto_19749 ?auto_19781 ) ) ( not ( = ?auto_19750 ?auto_19755 ) ) ( not ( = ?auto_19750 ?auto_19781 ) ) ( not ( = ?auto_19751 ?auto_19755 ) ) ( not ( = ?auto_19751 ?auto_19781 ) ) ( not ( = ?auto_19752 ?auto_19755 ) ) ( not ( = ?auto_19752 ?auto_19781 ) ) ( not ( = ?auto_19753 ?auto_19755 ) ) ( not ( = ?auto_19753 ?auto_19781 ) ) ( not ( = ?auto_19755 ?auto_19780 ) ) ( not ( = ?auto_19755 ?auto_19793 ) ) ( not ( = ?auto_19755 ?auto_19784 ) ) ( not ( = ?auto_19755 ?auto_19802 ) ) ( not ( = ?auto_19755 ?auto_19795 ) ) ( not ( = ?auto_19755 ?auto_19783 ) ) ( not ( = ?auto_19755 ?auto_19804 ) ) ( not ( = ?auto_19777 ?auto_19799 ) ) ( not ( = ?auto_19777 ?auto_19769 ) ) ( not ( = ?auto_19777 ?auto_19779 ) ) ( not ( = ?auto_19777 ?auto_19797 ) ) ( not ( = ?auto_19777 ?auto_19801 ) ) ( not ( = ?auto_19777 ?auto_19774 ) ) ( not ( = ?auto_19777 ?auto_19803 ) ) ( not ( = ?auto_19786 ?auto_19788 ) ) ( not ( = ?auto_19786 ?auto_19796 ) ) ( not ( = ?auto_19786 ?auto_19790 ) ) ( not ( = ?auto_19786 ?auto_19775 ) ) ( not ( = ?auto_19786 ?auto_19792 ) ) ( not ( = ?auto_19786 ?auto_19772 ) ) ( not ( = ?auto_19786 ?auto_19798 ) ) ( not ( = ?auto_19781 ?auto_19780 ) ) ( not ( = ?auto_19781 ?auto_19793 ) ) ( not ( = ?auto_19781 ?auto_19784 ) ) ( not ( = ?auto_19781 ?auto_19802 ) ) ( not ( = ?auto_19781 ?auto_19795 ) ) ( not ( = ?auto_19781 ?auto_19783 ) ) ( not ( = ?auto_19781 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19756 ) ) ( not ( = ?auto_19747 ?auto_19785 ) ) ( not ( = ?auto_19748 ?auto_19756 ) ) ( not ( = ?auto_19748 ?auto_19785 ) ) ( not ( = ?auto_19749 ?auto_19756 ) ) ( not ( = ?auto_19749 ?auto_19785 ) ) ( not ( = ?auto_19750 ?auto_19756 ) ) ( not ( = ?auto_19750 ?auto_19785 ) ) ( not ( = ?auto_19751 ?auto_19756 ) ) ( not ( = ?auto_19751 ?auto_19785 ) ) ( not ( = ?auto_19752 ?auto_19756 ) ) ( not ( = ?auto_19752 ?auto_19785 ) ) ( not ( = ?auto_19753 ?auto_19756 ) ) ( not ( = ?auto_19753 ?auto_19785 ) ) ( not ( = ?auto_19754 ?auto_19756 ) ) ( not ( = ?auto_19754 ?auto_19785 ) ) ( not ( = ?auto_19756 ?auto_19781 ) ) ( not ( = ?auto_19756 ?auto_19780 ) ) ( not ( = ?auto_19756 ?auto_19793 ) ) ( not ( = ?auto_19756 ?auto_19784 ) ) ( not ( = ?auto_19756 ?auto_19802 ) ) ( not ( = ?auto_19756 ?auto_19795 ) ) ( not ( = ?auto_19756 ?auto_19783 ) ) ( not ( = ?auto_19756 ?auto_19804 ) ) ( not ( = ?auto_19771 ?auto_19777 ) ) ( not ( = ?auto_19771 ?auto_19799 ) ) ( not ( = ?auto_19771 ?auto_19769 ) ) ( not ( = ?auto_19771 ?auto_19779 ) ) ( not ( = ?auto_19771 ?auto_19797 ) ) ( not ( = ?auto_19771 ?auto_19801 ) ) ( not ( = ?auto_19771 ?auto_19774 ) ) ( not ( = ?auto_19771 ?auto_19803 ) ) ( not ( = ?auto_19794 ?auto_19786 ) ) ( not ( = ?auto_19794 ?auto_19788 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( not ( = ?auto_19794 ?auto_19790 ) ) ( not ( = ?auto_19794 ?auto_19775 ) ) ( not ( = ?auto_19794 ?auto_19792 ) ) ( not ( = ?auto_19794 ?auto_19772 ) ) ( not ( = ?auto_19794 ?auto_19798 ) ) ( not ( = ?auto_19785 ?auto_19781 ) ) ( not ( = ?auto_19785 ?auto_19780 ) ) ( not ( = ?auto_19785 ?auto_19793 ) ) ( not ( = ?auto_19785 ?auto_19784 ) ) ( not ( = ?auto_19785 ?auto_19802 ) ) ( not ( = ?auto_19785 ?auto_19795 ) ) ( not ( = ?auto_19785 ?auto_19783 ) ) ( not ( = ?auto_19785 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19757 ) ) ( not ( = ?auto_19747 ?auto_19776 ) ) ( not ( = ?auto_19748 ?auto_19757 ) ) ( not ( = ?auto_19748 ?auto_19776 ) ) ( not ( = ?auto_19749 ?auto_19757 ) ) ( not ( = ?auto_19749 ?auto_19776 ) ) ( not ( = ?auto_19750 ?auto_19757 ) ) ( not ( = ?auto_19750 ?auto_19776 ) ) ( not ( = ?auto_19751 ?auto_19757 ) ) ( not ( = ?auto_19751 ?auto_19776 ) ) ( not ( = ?auto_19752 ?auto_19757 ) ) ( not ( = ?auto_19752 ?auto_19776 ) ) ( not ( = ?auto_19753 ?auto_19757 ) ) ( not ( = ?auto_19753 ?auto_19776 ) ) ( not ( = ?auto_19754 ?auto_19757 ) ) ( not ( = ?auto_19754 ?auto_19776 ) ) ( not ( = ?auto_19755 ?auto_19757 ) ) ( not ( = ?auto_19755 ?auto_19776 ) ) ( not ( = ?auto_19757 ?auto_19785 ) ) ( not ( = ?auto_19757 ?auto_19781 ) ) ( not ( = ?auto_19757 ?auto_19780 ) ) ( not ( = ?auto_19757 ?auto_19793 ) ) ( not ( = ?auto_19757 ?auto_19784 ) ) ( not ( = ?auto_19757 ?auto_19802 ) ) ( not ( = ?auto_19757 ?auto_19795 ) ) ( not ( = ?auto_19757 ?auto_19783 ) ) ( not ( = ?auto_19757 ?auto_19804 ) ) ( not ( = ?auto_19789 ?auto_19771 ) ) ( not ( = ?auto_19789 ?auto_19777 ) ) ( not ( = ?auto_19789 ?auto_19799 ) ) ( not ( = ?auto_19789 ?auto_19769 ) ) ( not ( = ?auto_19789 ?auto_19779 ) ) ( not ( = ?auto_19789 ?auto_19797 ) ) ( not ( = ?auto_19789 ?auto_19801 ) ) ( not ( = ?auto_19789 ?auto_19774 ) ) ( not ( = ?auto_19789 ?auto_19803 ) ) ( not ( = ?auto_19805 ?auto_19794 ) ) ( not ( = ?auto_19805 ?auto_19786 ) ) ( not ( = ?auto_19805 ?auto_19788 ) ) ( not ( = ?auto_19805 ?auto_19796 ) ) ( not ( = ?auto_19805 ?auto_19790 ) ) ( not ( = ?auto_19805 ?auto_19775 ) ) ( not ( = ?auto_19805 ?auto_19792 ) ) ( not ( = ?auto_19805 ?auto_19772 ) ) ( not ( = ?auto_19805 ?auto_19798 ) ) ( not ( = ?auto_19776 ?auto_19785 ) ) ( not ( = ?auto_19776 ?auto_19781 ) ) ( not ( = ?auto_19776 ?auto_19780 ) ) ( not ( = ?auto_19776 ?auto_19793 ) ) ( not ( = ?auto_19776 ?auto_19784 ) ) ( not ( = ?auto_19776 ?auto_19802 ) ) ( not ( = ?auto_19776 ?auto_19795 ) ) ( not ( = ?auto_19776 ?auto_19783 ) ) ( not ( = ?auto_19776 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19758 ) ) ( not ( = ?auto_19747 ?auto_19773 ) ) ( not ( = ?auto_19748 ?auto_19758 ) ) ( not ( = ?auto_19748 ?auto_19773 ) ) ( not ( = ?auto_19749 ?auto_19758 ) ) ( not ( = ?auto_19749 ?auto_19773 ) ) ( not ( = ?auto_19750 ?auto_19758 ) ) ( not ( = ?auto_19750 ?auto_19773 ) ) ( not ( = ?auto_19751 ?auto_19758 ) ) ( not ( = ?auto_19751 ?auto_19773 ) ) ( not ( = ?auto_19752 ?auto_19758 ) ) ( not ( = ?auto_19752 ?auto_19773 ) ) ( not ( = ?auto_19753 ?auto_19758 ) ) ( not ( = ?auto_19753 ?auto_19773 ) ) ( not ( = ?auto_19754 ?auto_19758 ) ) ( not ( = ?auto_19754 ?auto_19773 ) ) ( not ( = ?auto_19755 ?auto_19758 ) ) ( not ( = ?auto_19755 ?auto_19773 ) ) ( not ( = ?auto_19756 ?auto_19758 ) ) ( not ( = ?auto_19756 ?auto_19773 ) ) ( not ( = ?auto_19758 ?auto_19776 ) ) ( not ( = ?auto_19758 ?auto_19785 ) ) ( not ( = ?auto_19758 ?auto_19781 ) ) ( not ( = ?auto_19758 ?auto_19780 ) ) ( not ( = ?auto_19758 ?auto_19793 ) ) ( not ( = ?auto_19758 ?auto_19784 ) ) ( not ( = ?auto_19758 ?auto_19802 ) ) ( not ( = ?auto_19758 ?auto_19795 ) ) ( not ( = ?auto_19758 ?auto_19783 ) ) ( not ( = ?auto_19758 ?auto_19804 ) ) ( not ( = ?auto_19800 ?auto_19789 ) ) ( not ( = ?auto_19800 ?auto_19771 ) ) ( not ( = ?auto_19800 ?auto_19777 ) ) ( not ( = ?auto_19800 ?auto_19799 ) ) ( not ( = ?auto_19800 ?auto_19769 ) ) ( not ( = ?auto_19800 ?auto_19779 ) ) ( not ( = ?auto_19800 ?auto_19797 ) ) ( not ( = ?auto_19800 ?auto_19801 ) ) ( not ( = ?auto_19800 ?auto_19774 ) ) ( not ( = ?auto_19800 ?auto_19803 ) ) ( not ( = ?auto_19782 ?auto_19805 ) ) ( not ( = ?auto_19782 ?auto_19794 ) ) ( not ( = ?auto_19782 ?auto_19786 ) ) ( not ( = ?auto_19782 ?auto_19788 ) ) ( not ( = ?auto_19782 ?auto_19796 ) ) ( not ( = ?auto_19782 ?auto_19790 ) ) ( not ( = ?auto_19782 ?auto_19775 ) ) ( not ( = ?auto_19782 ?auto_19792 ) ) ( not ( = ?auto_19782 ?auto_19772 ) ) ( not ( = ?auto_19782 ?auto_19798 ) ) ( not ( = ?auto_19773 ?auto_19776 ) ) ( not ( = ?auto_19773 ?auto_19785 ) ) ( not ( = ?auto_19773 ?auto_19781 ) ) ( not ( = ?auto_19773 ?auto_19780 ) ) ( not ( = ?auto_19773 ?auto_19793 ) ) ( not ( = ?auto_19773 ?auto_19784 ) ) ( not ( = ?auto_19773 ?auto_19802 ) ) ( not ( = ?auto_19773 ?auto_19795 ) ) ( not ( = ?auto_19773 ?auto_19783 ) ) ( not ( = ?auto_19773 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19759 ) ) ( not ( = ?auto_19747 ?auto_19768 ) ) ( not ( = ?auto_19748 ?auto_19759 ) ) ( not ( = ?auto_19748 ?auto_19768 ) ) ( not ( = ?auto_19749 ?auto_19759 ) ) ( not ( = ?auto_19749 ?auto_19768 ) ) ( not ( = ?auto_19750 ?auto_19759 ) ) ( not ( = ?auto_19750 ?auto_19768 ) ) ( not ( = ?auto_19751 ?auto_19759 ) ) ( not ( = ?auto_19751 ?auto_19768 ) ) ( not ( = ?auto_19752 ?auto_19759 ) ) ( not ( = ?auto_19752 ?auto_19768 ) ) ( not ( = ?auto_19753 ?auto_19759 ) ) ( not ( = ?auto_19753 ?auto_19768 ) ) ( not ( = ?auto_19754 ?auto_19759 ) ) ( not ( = ?auto_19754 ?auto_19768 ) ) ( not ( = ?auto_19755 ?auto_19759 ) ) ( not ( = ?auto_19755 ?auto_19768 ) ) ( not ( = ?auto_19756 ?auto_19759 ) ) ( not ( = ?auto_19756 ?auto_19768 ) ) ( not ( = ?auto_19757 ?auto_19759 ) ) ( not ( = ?auto_19757 ?auto_19768 ) ) ( not ( = ?auto_19759 ?auto_19773 ) ) ( not ( = ?auto_19759 ?auto_19776 ) ) ( not ( = ?auto_19759 ?auto_19785 ) ) ( not ( = ?auto_19759 ?auto_19781 ) ) ( not ( = ?auto_19759 ?auto_19780 ) ) ( not ( = ?auto_19759 ?auto_19793 ) ) ( not ( = ?auto_19759 ?auto_19784 ) ) ( not ( = ?auto_19759 ?auto_19802 ) ) ( not ( = ?auto_19759 ?auto_19795 ) ) ( not ( = ?auto_19759 ?auto_19783 ) ) ( not ( = ?auto_19759 ?auto_19804 ) ) ( not ( = ?auto_19791 ?auto_19800 ) ) ( not ( = ?auto_19791 ?auto_19789 ) ) ( not ( = ?auto_19791 ?auto_19771 ) ) ( not ( = ?auto_19791 ?auto_19777 ) ) ( not ( = ?auto_19791 ?auto_19799 ) ) ( not ( = ?auto_19791 ?auto_19769 ) ) ( not ( = ?auto_19791 ?auto_19779 ) ) ( not ( = ?auto_19791 ?auto_19797 ) ) ( not ( = ?auto_19791 ?auto_19801 ) ) ( not ( = ?auto_19791 ?auto_19774 ) ) ( not ( = ?auto_19791 ?auto_19803 ) ) ( not ( = ?auto_19787 ?auto_19782 ) ) ( not ( = ?auto_19787 ?auto_19805 ) ) ( not ( = ?auto_19787 ?auto_19794 ) ) ( not ( = ?auto_19787 ?auto_19786 ) ) ( not ( = ?auto_19787 ?auto_19788 ) ) ( not ( = ?auto_19787 ?auto_19796 ) ) ( not ( = ?auto_19787 ?auto_19790 ) ) ( not ( = ?auto_19787 ?auto_19775 ) ) ( not ( = ?auto_19787 ?auto_19792 ) ) ( not ( = ?auto_19787 ?auto_19772 ) ) ( not ( = ?auto_19787 ?auto_19798 ) ) ( not ( = ?auto_19768 ?auto_19773 ) ) ( not ( = ?auto_19768 ?auto_19776 ) ) ( not ( = ?auto_19768 ?auto_19785 ) ) ( not ( = ?auto_19768 ?auto_19781 ) ) ( not ( = ?auto_19768 ?auto_19780 ) ) ( not ( = ?auto_19768 ?auto_19793 ) ) ( not ( = ?auto_19768 ?auto_19784 ) ) ( not ( = ?auto_19768 ?auto_19802 ) ) ( not ( = ?auto_19768 ?auto_19795 ) ) ( not ( = ?auto_19768 ?auto_19783 ) ) ( not ( = ?auto_19768 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19760 ) ) ( not ( = ?auto_19747 ?auto_19806 ) ) ( not ( = ?auto_19748 ?auto_19760 ) ) ( not ( = ?auto_19748 ?auto_19806 ) ) ( not ( = ?auto_19749 ?auto_19760 ) ) ( not ( = ?auto_19749 ?auto_19806 ) ) ( not ( = ?auto_19750 ?auto_19760 ) ) ( not ( = ?auto_19750 ?auto_19806 ) ) ( not ( = ?auto_19751 ?auto_19760 ) ) ( not ( = ?auto_19751 ?auto_19806 ) ) ( not ( = ?auto_19752 ?auto_19760 ) ) ( not ( = ?auto_19752 ?auto_19806 ) ) ( not ( = ?auto_19753 ?auto_19760 ) ) ( not ( = ?auto_19753 ?auto_19806 ) ) ( not ( = ?auto_19754 ?auto_19760 ) ) ( not ( = ?auto_19754 ?auto_19806 ) ) ( not ( = ?auto_19755 ?auto_19760 ) ) ( not ( = ?auto_19755 ?auto_19806 ) ) ( not ( = ?auto_19756 ?auto_19760 ) ) ( not ( = ?auto_19756 ?auto_19806 ) ) ( not ( = ?auto_19757 ?auto_19760 ) ) ( not ( = ?auto_19757 ?auto_19806 ) ) ( not ( = ?auto_19758 ?auto_19760 ) ) ( not ( = ?auto_19758 ?auto_19806 ) ) ( not ( = ?auto_19760 ?auto_19768 ) ) ( not ( = ?auto_19760 ?auto_19773 ) ) ( not ( = ?auto_19760 ?auto_19776 ) ) ( not ( = ?auto_19760 ?auto_19785 ) ) ( not ( = ?auto_19760 ?auto_19781 ) ) ( not ( = ?auto_19760 ?auto_19780 ) ) ( not ( = ?auto_19760 ?auto_19793 ) ) ( not ( = ?auto_19760 ?auto_19784 ) ) ( not ( = ?auto_19760 ?auto_19802 ) ) ( not ( = ?auto_19760 ?auto_19795 ) ) ( not ( = ?auto_19760 ?auto_19783 ) ) ( not ( = ?auto_19760 ?auto_19804 ) ) ( not ( = ?auto_19778 ?auto_19791 ) ) ( not ( = ?auto_19778 ?auto_19800 ) ) ( not ( = ?auto_19778 ?auto_19789 ) ) ( not ( = ?auto_19778 ?auto_19771 ) ) ( not ( = ?auto_19778 ?auto_19777 ) ) ( not ( = ?auto_19778 ?auto_19799 ) ) ( not ( = ?auto_19778 ?auto_19769 ) ) ( not ( = ?auto_19778 ?auto_19779 ) ) ( not ( = ?auto_19778 ?auto_19797 ) ) ( not ( = ?auto_19778 ?auto_19801 ) ) ( not ( = ?auto_19778 ?auto_19774 ) ) ( not ( = ?auto_19778 ?auto_19803 ) ) ( not ( = ?auto_19770 ?auto_19787 ) ) ( not ( = ?auto_19770 ?auto_19782 ) ) ( not ( = ?auto_19770 ?auto_19805 ) ) ( not ( = ?auto_19770 ?auto_19794 ) ) ( not ( = ?auto_19770 ?auto_19786 ) ) ( not ( = ?auto_19770 ?auto_19788 ) ) ( not ( = ?auto_19770 ?auto_19796 ) ) ( not ( = ?auto_19770 ?auto_19790 ) ) ( not ( = ?auto_19770 ?auto_19775 ) ) ( not ( = ?auto_19770 ?auto_19792 ) ) ( not ( = ?auto_19770 ?auto_19772 ) ) ( not ( = ?auto_19770 ?auto_19798 ) ) ( not ( = ?auto_19806 ?auto_19768 ) ) ( not ( = ?auto_19806 ?auto_19773 ) ) ( not ( = ?auto_19806 ?auto_19776 ) ) ( not ( = ?auto_19806 ?auto_19785 ) ) ( not ( = ?auto_19806 ?auto_19781 ) ) ( not ( = ?auto_19806 ?auto_19780 ) ) ( not ( = ?auto_19806 ?auto_19793 ) ) ( not ( = ?auto_19806 ?auto_19784 ) ) ( not ( = ?auto_19806 ?auto_19802 ) ) ( not ( = ?auto_19806 ?auto_19795 ) ) ( not ( = ?auto_19806 ?auto_19783 ) ) ( not ( = ?auto_19806 ?auto_19804 ) ) ( not ( = ?auto_19747 ?auto_19761 ) ) ( not ( = ?auto_19747 ?auto_19767 ) ) ( not ( = ?auto_19748 ?auto_19761 ) ) ( not ( = ?auto_19748 ?auto_19767 ) ) ( not ( = ?auto_19749 ?auto_19761 ) ) ( not ( = ?auto_19749 ?auto_19767 ) ) ( not ( = ?auto_19750 ?auto_19761 ) ) ( not ( = ?auto_19750 ?auto_19767 ) ) ( not ( = ?auto_19751 ?auto_19761 ) ) ( not ( = ?auto_19751 ?auto_19767 ) ) ( not ( = ?auto_19752 ?auto_19761 ) ) ( not ( = ?auto_19752 ?auto_19767 ) ) ( not ( = ?auto_19753 ?auto_19761 ) ) ( not ( = ?auto_19753 ?auto_19767 ) ) ( not ( = ?auto_19754 ?auto_19761 ) ) ( not ( = ?auto_19754 ?auto_19767 ) ) ( not ( = ?auto_19755 ?auto_19761 ) ) ( not ( = ?auto_19755 ?auto_19767 ) ) ( not ( = ?auto_19756 ?auto_19761 ) ) ( not ( = ?auto_19756 ?auto_19767 ) ) ( not ( = ?auto_19757 ?auto_19761 ) ) ( not ( = ?auto_19757 ?auto_19767 ) ) ( not ( = ?auto_19758 ?auto_19761 ) ) ( not ( = ?auto_19758 ?auto_19767 ) ) ( not ( = ?auto_19759 ?auto_19761 ) ) ( not ( = ?auto_19759 ?auto_19767 ) ) ( not ( = ?auto_19761 ?auto_19806 ) ) ( not ( = ?auto_19761 ?auto_19768 ) ) ( not ( = ?auto_19761 ?auto_19773 ) ) ( not ( = ?auto_19761 ?auto_19776 ) ) ( not ( = ?auto_19761 ?auto_19785 ) ) ( not ( = ?auto_19761 ?auto_19781 ) ) ( not ( = ?auto_19761 ?auto_19780 ) ) ( not ( = ?auto_19761 ?auto_19793 ) ) ( not ( = ?auto_19761 ?auto_19784 ) ) ( not ( = ?auto_19761 ?auto_19802 ) ) ( not ( = ?auto_19761 ?auto_19795 ) ) ( not ( = ?auto_19761 ?auto_19783 ) ) ( not ( = ?auto_19761 ?auto_19804 ) ) ( not ( = ?auto_19763 ?auto_19778 ) ) ( not ( = ?auto_19763 ?auto_19791 ) ) ( not ( = ?auto_19763 ?auto_19800 ) ) ( not ( = ?auto_19763 ?auto_19789 ) ) ( not ( = ?auto_19763 ?auto_19771 ) ) ( not ( = ?auto_19763 ?auto_19777 ) ) ( not ( = ?auto_19763 ?auto_19799 ) ) ( not ( = ?auto_19763 ?auto_19769 ) ) ( not ( = ?auto_19763 ?auto_19779 ) ) ( not ( = ?auto_19763 ?auto_19797 ) ) ( not ( = ?auto_19763 ?auto_19801 ) ) ( not ( = ?auto_19763 ?auto_19774 ) ) ( not ( = ?auto_19763 ?auto_19803 ) ) ( not ( = ?auto_19764 ?auto_19770 ) ) ( not ( = ?auto_19764 ?auto_19787 ) ) ( not ( = ?auto_19764 ?auto_19782 ) ) ( not ( = ?auto_19764 ?auto_19805 ) ) ( not ( = ?auto_19764 ?auto_19794 ) ) ( not ( = ?auto_19764 ?auto_19786 ) ) ( not ( = ?auto_19764 ?auto_19788 ) ) ( not ( = ?auto_19764 ?auto_19796 ) ) ( not ( = ?auto_19764 ?auto_19790 ) ) ( not ( = ?auto_19764 ?auto_19775 ) ) ( not ( = ?auto_19764 ?auto_19792 ) ) ( not ( = ?auto_19764 ?auto_19772 ) ) ( not ( = ?auto_19764 ?auto_19798 ) ) ( not ( = ?auto_19767 ?auto_19806 ) ) ( not ( = ?auto_19767 ?auto_19768 ) ) ( not ( = ?auto_19767 ?auto_19773 ) ) ( not ( = ?auto_19767 ?auto_19776 ) ) ( not ( = ?auto_19767 ?auto_19785 ) ) ( not ( = ?auto_19767 ?auto_19781 ) ) ( not ( = ?auto_19767 ?auto_19780 ) ) ( not ( = ?auto_19767 ?auto_19793 ) ) ( not ( = ?auto_19767 ?auto_19784 ) ) ( not ( = ?auto_19767 ?auto_19802 ) ) ( not ( = ?auto_19767 ?auto_19795 ) ) ( not ( = ?auto_19767 ?auto_19783 ) ) ( not ( = ?auto_19767 ?auto_19804 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19747 ?auto_19748 ?auto_19749 ?auto_19750 ?auto_19751 ?auto_19752 ?auto_19753 ?auto_19754 ?auto_19755 ?auto_19756 ?auto_19757 ?auto_19758 ?auto_19759 ?auto_19760 )
      ( MAKE-1CRATE ?auto_19760 ?auto_19761 )
      ( MAKE-14CRATE-VERIFY ?auto_19747 ?auto_19748 ?auto_19749 ?auto_19750 ?auto_19751 ?auto_19752 ?auto_19753 ?auto_19754 ?auto_19755 ?auto_19756 ?auto_19757 ?auto_19758 ?auto_19759 ?auto_19760 ?auto_19761 ) )
  )

)

