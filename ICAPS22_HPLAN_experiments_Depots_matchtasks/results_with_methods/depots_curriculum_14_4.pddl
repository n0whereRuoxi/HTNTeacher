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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19094 - SURFACE
      ?auto_19095 - SURFACE
    )
    :vars
    (
      ?auto_19096 - HOIST
      ?auto_19097 - PLACE
      ?auto_19099 - PLACE
      ?auto_19100 - HOIST
      ?auto_19101 - SURFACE
      ?auto_19098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19096 ?auto_19097 ) ( SURFACE-AT ?auto_19094 ?auto_19097 ) ( CLEAR ?auto_19094 ) ( IS-CRATE ?auto_19095 ) ( AVAILABLE ?auto_19096 ) ( not ( = ?auto_19099 ?auto_19097 ) ) ( HOIST-AT ?auto_19100 ?auto_19099 ) ( AVAILABLE ?auto_19100 ) ( SURFACE-AT ?auto_19095 ?auto_19099 ) ( ON ?auto_19095 ?auto_19101 ) ( CLEAR ?auto_19095 ) ( TRUCK-AT ?auto_19098 ?auto_19097 ) ( not ( = ?auto_19094 ?auto_19095 ) ) ( not ( = ?auto_19094 ?auto_19101 ) ) ( not ( = ?auto_19095 ?auto_19101 ) ) ( not ( = ?auto_19096 ?auto_19100 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19098 ?auto_19097 ?auto_19099 )
      ( !LIFT ?auto_19100 ?auto_19095 ?auto_19101 ?auto_19099 )
      ( !LOAD ?auto_19100 ?auto_19095 ?auto_19098 ?auto_19099 )
      ( !DRIVE ?auto_19098 ?auto_19099 ?auto_19097 )
      ( !UNLOAD ?auto_19096 ?auto_19095 ?auto_19098 ?auto_19097 )
      ( !DROP ?auto_19096 ?auto_19095 ?auto_19094 ?auto_19097 )
      ( MAKE-1CRATE-VERIFY ?auto_19094 ?auto_19095 ) )
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
      ?auto_19108 - HOIST
      ?auto_19109 - PLACE
      ?auto_19110 - PLACE
      ?auto_19111 - HOIST
      ?auto_19113 - SURFACE
      ?auto_19114 - PLACE
      ?auto_19116 - HOIST
      ?auto_19115 - SURFACE
      ?auto_19112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19108 ?auto_19109 ) ( IS-CRATE ?auto_19107 ) ( not ( = ?auto_19110 ?auto_19109 ) ) ( HOIST-AT ?auto_19111 ?auto_19110 ) ( AVAILABLE ?auto_19111 ) ( SURFACE-AT ?auto_19107 ?auto_19110 ) ( ON ?auto_19107 ?auto_19113 ) ( CLEAR ?auto_19107 ) ( not ( = ?auto_19106 ?auto_19107 ) ) ( not ( = ?auto_19106 ?auto_19113 ) ) ( not ( = ?auto_19107 ?auto_19113 ) ) ( not ( = ?auto_19108 ?auto_19111 ) ) ( SURFACE-AT ?auto_19105 ?auto_19109 ) ( CLEAR ?auto_19105 ) ( IS-CRATE ?auto_19106 ) ( AVAILABLE ?auto_19108 ) ( not ( = ?auto_19114 ?auto_19109 ) ) ( HOIST-AT ?auto_19116 ?auto_19114 ) ( AVAILABLE ?auto_19116 ) ( SURFACE-AT ?auto_19106 ?auto_19114 ) ( ON ?auto_19106 ?auto_19115 ) ( CLEAR ?auto_19106 ) ( TRUCK-AT ?auto_19112 ?auto_19109 ) ( not ( = ?auto_19105 ?auto_19106 ) ) ( not ( = ?auto_19105 ?auto_19115 ) ) ( not ( = ?auto_19106 ?auto_19115 ) ) ( not ( = ?auto_19108 ?auto_19116 ) ) ( not ( = ?auto_19105 ?auto_19107 ) ) ( not ( = ?auto_19105 ?auto_19113 ) ) ( not ( = ?auto_19107 ?auto_19115 ) ) ( not ( = ?auto_19110 ?auto_19114 ) ) ( not ( = ?auto_19111 ?auto_19116 ) ) ( not ( = ?auto_19113 ?auto_19115 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19105 ?auto_19106 )
      ( MAKE-1CRATE ?auto_19106 ?auto_19107 )
      ( MAKE-2CRATE-VERIFY ?auto_19105 ?auto_19106 ?auto_19107 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19119 - SURFACE
      ?auto_19120 - SURFACE
    )
    :vars
    (
      ?auto_19121 - HOIST
      ?auto_19122 - PLACE
      ?auto_19124 - PLACE
      ?auto_19125 - HOIST
      ?auto_19126 - SURFACE
      ?auto_19123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19121 ?auto_19122 ) ( SURFACE-AT ?auto_19119 ?auto_19122 ) ( CLEAR ?auto_19119 ) ( IS-CRATE ?auto_19120 ) ( AVAILABLE ?auto_19121 ) ( not ( = ?auto_19124 ?auto_19122 ) ) ( HOIST-AT ?auto_19125 ?auto_19124 ) ( AVAILABLE ?auto_19125 ) ( SURFACE-AT ?auto_19120 ?auto_19124 ) ( ON ?auto_19120 ?auto_19126 ) ( CLEAR ?auto_19120 ) ( TRUCK-AT ?auto_19123 ?auto_19122 ) ( not ( = ?auto_19119 ?auto_19120 ) ) ( not ( = ?auto_19119 ?auto_19126 ) ) ( not ( = ?auto_19120 ?auto_19126 ) ) ( not ( = ?auto_19121 ?auto_19125 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19123 ?auto_19122 ?auto_19124 )
      ( !LIFT ?auto_19125 ?auto_19120 ?auto_19126 ?auto_19124 )
      ( !LOAD ?auto_19125 ?auto_19120 ?auto_19123 ?auto_19124 )
      ( !DRIVE ?auto_19123 ?auto_19124 ?auto_19122 )
      ( !UNLOAD ?auto_19121 ?auto_19120 ?auto_19123 ?auto_19122 )
      ( !DROP ?auto_19121 ?auto_19120 ?auto_19119 ?auto_19122 )
      ( MAKE-1CRATE-VERIFY ?auto_19119 ?auto_19120 ) )
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
      ?auto_19138 - HOIST
      ?auto_19136 - PLACE
      ?auto_19140 - PLACE
      ?auto_19137 - HOIST
      ?auto_19139 - SURFACE
      ?auto_19146 - PLACE
      ?auto_19141 - HOIST
      ?auto_19142 - SURFACE
      ?auto_19145 - PLACE
      ?auto_19143 - HOIST
      ?auto_19144 - SURFACE
      ?auto_19135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19138 ?auto_19136 ) ( IS-CRATE ?auto_19134 ) ( not ( = ?auto_19140 ?auto_19136 ) ) ( HOIST-AT ?auto_19137 ?auto_19140 ) ( AVAILABLE ?auto_19137 ) ( SURFACE-AT ?auto_19134 ?auto_19140 ) ( ON ?auto_19134 ?auto_19139 ) ( CLEAR ?auto_19134 ) ( not ( = ?auto_19133 ?auto_19134 ) ) ( not ( = ?auto_19133 ?auto_19139 ) ) ( not ( = ?auto_19134 ?auto_19139 ) ) ( not ( = ?auto_19138 ?auto_19137 ) ) ( IS-CRATE ?auto_19133 ) ( not ( = ?auto_19146 ?auto_19136 ) ) ( HOIST-AT ?auto_19141 ?auto_19146 ) ( AVAILABLE ?auto_19141 ) ( SURFACE-AT ?auto_19133 ?auto_19146 ) ( ON ?auto_19133 ?auto_19142 ) ( CLEAR ?auto_19133 ) ( not ( = ?auto_19132 ?auto_19133 ) ) ( not ( = ?auto_19132 ?auto_19142 ) ) ( not ( = ?auto_19133 ?auto_19142 ) ) ( not ( = ?auto_19138 ?auto_19141 ) ) ( SURFACE-AT ?auto_19131 ?auto_19136 ) ( CLEAR ?auto_19131 ) ( IS-CRATE ?auto_19132 ) ( AVAILABLE ?auto_19138 ) ( not ( = ?auto_19145 ?auto_19136 ) ) ( HOIST-AT ?auto_19143 ?auto_19145 ) ( AVAILABLE ?auto_19143 ) ( SURFACE-AT ?auto_19132 ?auto_19145 ) ( ON ?auto_19132 ?auto_19144 ) ( CLEAR ?auto_19132 ) ( TRUCK-AT ?auto_19135 ?auto_19136 ) ( not ( = ?auto_19131 ?auto_19132 ) ) ( not ( = ?auto_19131 ?auto_19144 ) ) ( not ( = ?auto_19132 ?auto_19144 ) ) ( not ( = ?auto_19138 ?auto_19143 ) ) ( not ( = ?auto_19131 ?auto_19133 ) ) ( not ( = ?auto_19131 ?auto_19142 ) ) ( not ( = ?auto_19133 ?auto_19144 ) ) ( not ( = ?auto_19146 ?auto_19145 ) ) ( not ( = ?auto_19141 ?auto_19143 ) ) ( not ( = ?auto_19142 ?auto_19144 ) ) ( not ( = ?auto_19131 ?auto_19134 ) ) ( not ( = ?auto_19131 ?auto_19139 ) ) ( not ( = ?auto_19132 ?auto_19134 ) ) ( not ( = ?auto_19132 ?auto_19139 ) ) ( not ( = ?auto_19134 ?auto_19142 ) ) ( not ( = ?auto_19134 ?auto_19144 ) ) ( not ( = ?auto_19140 ?auto_19146 ) ) ( not ( = ?auto_19140 ?auto_19145 ) ) ( not ( = ?auto_19137 ?auto_19141 ) ) ( not ( = ?auto_19137 ?auto_19143 ) ) ( not ( = ?auto_19139 ?auto_19142 ) ) ( not ( = ?auto_19139 ?auto_19144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19131 ?auto_19132 ?auto_19133 )
      ( MAKE-1CRATE ?auto_19133 ?auto_19134 )
      ( MAKE-3CRATE-VERIFY ?auto_19131 ?auto_19132 ?auto_19133 ?auto_19134 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19149 - SURFACE
      ?auto_19150 - SURFACE
    )
    :vars
    (
      ?auto_19151 - HOIST
      ?auto_19152 - PLACE
      ?auto_19154 - PLACE
      ?auto_19155 - HOIST
      ?auto_19156 - SURFACE
      ?auto_19153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19151 ?auto_19152 ) ( SURFACE-AT ?auto_19149 ?auto_19152 ) ( CLEAR ?auto_19149 ) ( IS-CRATE ?auto_19150 ) ( AVAILABLE ?auto_19151 ) ( not ( = ?auto_19154 ?auto_19152 ) ) ( HOIST-AT ?auto_19155 ?auto_19154 ) ( AVAILABLE ?auto_19155 ) ( SURFACE-AT ?auto_19150 ?auto_19154 ) ( ON ?auto_19150 ?auto_19156 ) ( CLEAR ?auto_19150 ) ( TRUCK-AT ?auto_19153 ?auto_19152 ) ( not ( = ?auto_19149 ?auto_19150 ) ) ( not ( = ?auto_19149 ?auto_19156 ) ) ( not ( = ?auto_19150 ?auto_19156 ) ) ( not ( = ?auto_19151 ?auto_19155 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19153 ?auto_19152 ?auto_19154 )
      ( !LIFT ?auto_19155 ?auto_19150 ?auto_19156 ?auto_19154 )
      ( !LOAD ?auto_19155 ?auto_19150 ?auto_19153 ?auto_19154 )
      ( !DRIVE ?auto_19153 ?auto_19154 ?auto_19152 )
      ( !UNLOAD ?auto_19151 ?auto_19150 ?auto_19153 ?auto_19152 )
      ( !DROP ?auto_19151 ?auto_19150 ?auto_19149 ?auto_19152 )
      ( MAKE-1CRATE-VERIFY ?auto_19149 ?auto_19150 ) )
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
      ?auto_19170 - HOIST
      ?auto_19172 - PLACE
      ?auto_19169 - PLACE
      ?auto_19168 - HOIST
      ?auto_19167 - SURFACE
      ?auto_19173 - PLACE
      ?auto_19178 - HOIST
      ?auto_19177 - SURFACE
      ?auto_19180 - PLACE
      ?auto_19176 - HOIST
      ?auto_19179 - SURFACE
      ?auto_19174 - PLACE
      ?auto_19175 - HOIST
      ?auto_19181 - SURFACE
      ?auto_19171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19170 ?auto_19172 ) ( IS-CRATE ?auto_19166 ) ( not ( = ?auto_19169 ?auto_19172 ) ) ( HOIST-AT ?auto_19168 ?auto_19169 ) ( AVAILABLE ?auto_19168 ) ( SURFACE-AT ?auto_19166 ?auto_19169 ) ( ON ?auto_19166 ?auto_19167 ) ( CLEAR ?auto_19166 ) ( not ( = ?auto_19165 ?auto_19166 ) ) ( not ( = ?auto_19165 ?auto_19167 ) ) ( not ( = ?auto_19166 ?auto_19167 ) ) ( not ( = ?auto_19170 ?auto_19168 ) ) ( IS-CRATE ?auto_19165 ) ( not ( = ?auto_19173 ?auto_19172 ) ) ( HOIST-AT ?auto_19178 ?auto_19173 ) ( AVAILABLE ?auto_19178 ) ( SURFACE-AT ?auto_19165 ?auto_19173 ) ( ON ?auto_19165 ?auto_19177 ) ( CLEAR ?auto_19165 ) ( not ( = ?auto_19164 ?auto_19165 ) ) ( not ( = ?auto_19164 ?auto_19177 ) ) ( not ( = ?auto_19165 ?auto_19177 ) ) ( not ( = ?auto_19170 ?auto_19178 ) ) ( IS-CRATE ?auto_19164 ) ( not ( = ?auto_19180 ?auto_19172 ) ) ( HOIST-AT ?auto_19176 ?auto_19180 ) ( AVAILABLE ?auto_19176 ) ( SURFACE-AT ?auto_19164 ?auto_19180 ) ( ON ?auto_19164 ?auto_19179 ) ( CLEAR ?auto_19164 ) ( not ( = ?auto_19163 ?auto_19164 ) ) ( not ( = ?auto_19163 ?auto_19179 ) ) ( not ( = ?auto_19164 ?auto_19179 ) ) ( not ( = ?auto_19170 ?auto_19176 ) ) ( SURFACE-AT ?auto_19162 ?auto_19172 ) ( CLEAR ?auto_19162 ) ( IS-CRATE ?auto_19163 ) ( AVAILABLE ?auto_19170 ) ( not ( = ?auto_19174 ?auto_19172 ) ) ( HOIST-AT ?auto_19175 ?auto_19174 ) ( AVAILABLE ?auto_19175 ) ( SURFACE-AT ?auto_19163 ?auto_19174 ) ( ON ?auto_19163 ?auto_19181 ) ( CLEAR ?auto_19163 ) ( TRUCK-AT ?auto_19171 ?auto_19172 ) ( not ( = ?auto_19162 ?auto_19163 ) ) ( not ( = ?auto_19162 ?auto_19181 ) ) ( not ( = ?auto_19163 ?auto_19181 ) ) ( not ( = ?auto_19170 ?auto_19175 ) ) ( not ( = ?auto_19162 ?auto_19164 ) ) ( not ( = ?auto_19162 ?auto_19179 ) ) ( not ( = ?auto_19164 ?auto_19181 ) ) ( not ( = ?auto_19180 ?auto_19174 ) ) ( not ( = ?auto_19176 ?auto_19175 ) ) ( not ( = ?auto_19179 ?auto_19181 ) ) ( not ( = ?auto_19162 ?auto_19165 ) ) ( not ( = ?auto_19162 ?auto_19177 ) ) ( not ( = ?auto_19163 ?auto_19165 ) ) ( not ( = ?auto_19163 ?auto_19177 ) ) ( not ( = ?auto_19165 ?auto_19179 ) ) ( not ( = ?auto_19165 ?auto_19181 ) ) ( not ( = ?auto_19173 ?auto_19180 ) ) ( not ( = ?auto_19173 ?auto_19174 ) ) ( not ( = ?auto_19178 ?auto_19176 ) ) ( not ( = ?auto_19178 ?auto_19175 ) ) ( not ( = ?auto_19177 ?auto_19179 ) ) ( not ( = ?auto_19177 ?auto_19181 ) ) ( not ( = ?auto_19162 ?auto_19166 ) ) ( not ( = ?auto_19162 ?auto_19167 ) ) ( not ( = ?auto_19163 ?auto_19166 ) ) ( not ( = ?auto_19163 ?auto_19167 ) ) ( not ( = ?auto_19164 ?auto_19166 ) ) ( not ( = ?auto_19164 ?auto_19167 ) ) ( not ( = ?auto_19166 ?auto_19177 ) ) ( not ( = ?auto_19166 ?auto_19179 ) ) ( not ( = ?auto_19166 ?auto_19181 ) ) ( not ( = ?auto_19169 ?auto_19173 ) ) ( not ( = ?auto_19169 ?auto_19180 ) ) ( not ( = ?auto_19169 ?auto_19174 ) ) ( not ( = ?auto_19168 ?auto_19178 ) ) ( not ( = ?auto_19168 ?auto_19176 ) ) ( not ( = ?auto_19168 ?auto_19175 ) ) ( not ( = ?auto_19167 ?auto_19177 ) ) ( not ( = ?auto_19167 ?auto_19179 ) ) ( not ( = ?auto_19167 ?auto_19181 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19162 ?auto_19163 ?auto_19164 ?auto_19165 )
      ( MAKE-1CRATE ?auto_19165 ?auto_19166 )
      ( MAKE-4CRATE-VERIFY ?auto_19162 ?auto_19163 ?auto_19164 ?auto_19165 ?auto_19166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19184 - SURFACE
      ?auto_19185 - SURFACE
    )
    :vars
    (
      ?auto_19186 - HOIST
      ?auto_19187 - PLACE
      ?auto_19189 - PLACE
      ?auto_19190 - HOIST
      ?auto_19191 - SURFACE
      ?auto_19188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19186 ?auto_19187 ) ( SURFACE-AT ?auto_19184 ?auto_19187 ) ( CLEAR ?auto_19184 ) ( IS-CRATE ?auto_19185 ) ( AVAILABLE ?auto_19186 ) ( not ( = ?auto_19189 ?auto_19187 ) ) ( HOIST-AT ?auto_19190 ?auto_19189 ) ( AVAILABLE ?auto_19190 ) ( SURFACE-AT ?auto_19185 ?auto_19189 ) ( ON ?auto_19185 ?auto_19191 ) ( CLEAR ?auto_19185 ) ( TRUCK-AT ?auto_19188 ?auto_19187 ) ( not ( = ?auto_19184 ?auto_19185 ) ) ( not ( = ?auto_19184 ?auto_19191 ) ) ( not ( = ?auto_19185 ?auto_19191 ) ) ( not ( = ?auto_19186 ?auto_19190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19188 ?auto_19187 ?auto_19189 )
      ( !LIFT ?auto_19190 ?auto_19185 ?auto_19191 ?auto_19189 )
      ( !LOAD ?auto_19190 ?auto_19185 ?auto_19188 ?auto_19189 )
      ( !DRIVE ?auto_19188 ?auto_19189 ?auto_19187 )
      ( !UNLOAD ?auto_19186 ?auto_19185 ?auto_19188 ?auto_19187 )
      ( !DROP ?auto_19186 ?auto_19185 ?auto_19184 ?auto_19187 )
      ( MAKE-1CRATE-VERIFY ?auto_19184 ?auto_19185 ) )
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
      ?auto_19207 - HOIST
      ?auto_19206 - PLACE
      ?auto_19204 - PLACE
      ?auto_19208 - HOIST
      ?auto_19209 - SURFACE
      ?auto_19211 - PLACE
      ?auto_19213 - HOIST
      ?auto_19220 - SURFACE
      ?auto_19219 - PLACE
      ?auto_19218 - HOIST
      ?auto_19214 - SURFACE
      ?auto_19221 - PLACE
      ?auto_19212 - HOIST
      ?auto_19210 - SURFACE
      ?auto_19216 - PLACE
      ?auto_19215 - HOIST
      ?auto_19217 - SURFACE
      ?auto_19205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19207 ?auto_19206 ) ( IS-CRATE ?auto_19203 ) ( not ( = ?auto_19204 ?auto_19206 ) ) ( HOIST-AT ?auto_19208 ?auto_19204 ) ( AVAILABLE ?auto_19208 ) ( SURFACE-AT ?auto_19203 ?auto_19204 ) ( ON ?auto_19203 ?auto_19209 ) ( CLEAR ?auto_19203 ) ( not ( = ?auto_19202 ?auto_19203 ) ) ( not ( = ?auto_19202 ?auto_19209 ) ) ( not ( = ?auto_19203 ?auto_19209 ) ) ( not ( = ?auto_19207 ?auto_19208 ) ) ( IS-CRATE ?auto_19202 ) ( not ( = ?auto_19211 ?auto_19206 ) ) ( HOIST-AT ?auto_19213 ?auto_19211 ) ( AVAILABLE ?auto_19213 ) ( SURFACE-AT ?auto_19202 ?auto_19211 ) ( ON ?auto_19202 ?auto_19220 ) ( CLEAR ?auto_19202 ) ( not ( = ?auto_19201 ?auto_19202 ) ) ( not ( = ?auto_19201 ?auto_19220 ) ) ( not ( = ?auto_19202 ?auto_19220 ) ) ( not ( = ?auto_19207 ?auto_19213 ) ) ( IS-CRATE ?auto_19201 ) ( not ( = ?auto_19219 ?auto_19206 ) ) ( HOIST-AT ?auto_19218 ?auto_19219 ) ( AVAILABLE ?auto_19218 ) ( SURFACE-AT ?auto_19201 ?auto_19219 ) ( ON ?auto_19201 ?auto_19214 ) ( CLEAR ?auto_19201 ) ( not ( = ?auto_19200 ?auto_19201 ) ) ( not ( = ?auto_19200 ?auto_19214 ) ) ( not ( = ?auto_19201 ?auto_19214 ) ) ( not ( = ?auto_19207 ?auto_19218 ) ) ( IS-CRATE ?auto_19200 ) ( not ( = ?auto_19221 ?auto_19206 ) ) ( HOIST-AT ?auto_19212 ?auto_19221 ) ( AVAILABLE ?auto_19212 ) ( SURFACE-AT ?auto_19200 ?auto_19221 ) ( ON ?auto_19200 ?auto_19210 ) ( CLEAR ?auto_19200 ) ( not ( = ?auto_19199 ?auto_19200 ) ) ( not ( = ?auto_19199 ?auto_19210 ) ) ( not ( = ?auto_19200 ?auto_19210 ) ) ( not ( = ?auto_19207 ?auto_19212 ) ) ( SURFACE-AT ?auto_19198 ?auto_19206 ) ( CLEAR ?auto_19198 ) ( IS-CRATE ?auto_19199 ) ( AVAILABLE ?auto_19207 ) ( not ( = ?auto_19216 ?auto_19206 ) ) ( HOIST-AT ?auto_19215 ?auto_19216 ) ( AVAILABLE ?auto_19215 ) ( SURFACE-AT ?auto_19199 ?auto_19216 ) ( ON ?auto_19199 ?auto_19217 ) ( CLEAR ?auto_19199 ) ( TRUCK-AT ?auto_19205 ?auto_19206 ) ( not ( = ?auto_19198 ?auto_19199 ) ) ( not ( = ?auto_19198 ?auto_19217 ) ) ( not ( = ?auto_19199 ?auto_19217 ) ) ( not ( = ?auto_19207 ?auto_19215 ) ) ( not ( = ?auto_19198 ?auto_19200 ) ) ( not ( = ?auto_19198 ?auto_19210 ) ) ( not ( = ?auto_19200 ?auto_19217 ) ) ( not ( = ?auto_19221 ?auto_19216 ) ) ( not ( = ?auto_19212 ?auto_19215 ) ) ( not ( = ?auto_19210 ?auto_19217 ) ) ( not ( = ?auto_19198 ?auto_19201 ) ) ( not ( = ?auto_19198 ?auto_19214 ) ) ( not ( = ?auto_19199 ?auto_19201 ) ) ( not ( = ?auto_19199 ?auto_19214 ) ) ( not ( = ?auto_19201 ?auto_19210 ) ) ( not ( = ?auto_19201 ?auto_19217 ) ) ( not ( = ?auto_19219 ?auto_19221 ) ) ( not ( = ?auto_19219 ?auto_19216 ) ) ( not ( = ?auto_19218 ?auto_19212 ) ) ( not ( = ?auto_19218 ?auto_19215 ) ) ( not ( = ?auto_19214 ?auto_19210 ) ) ( not ( = ?auto_19214 ?auto_19217 ) ) ( not ( = ?auto_19198 ?auto_19202 ) ) ( not ( = ?auto_19198 ?auto_19220 ) ) ( not ( = ?auto_19199 ?auto_19202 ) ) ( not ( = ?auto_19199 ?auto_19220 ) ) ( not ( = ?auto_19200 ?auto_19202 ) ) ( not ( = ?auto_19200 ?auto_19220 ) ) ( not ( = ?auto_19202 ?auto_19214 ) ) ( not ( = ?auto_19202 ?auto_19210 ) ) ( not ( = ?auto_19202 ?auto_19217 ) ) ( not ( = ?auto_19211 ?auto_19219 ) ) ( not ( = ?auto_19211 ?auto_19221 ) ) ( not ( = ?auto_19211 ?auto_19216 ) ) ( not ( = ?auto_19213 ?auto_19218 ) ) ( not ( = ?auto_19213 ?auto_19212 ) ) ( not ( = ?auto_19213 ?auto_19215 ) ) ( not ( = ?auto_19220 ?auto_19214 ) ) ( not ( = ?auto_19220 ?auto_19210 ) ) ( not ( = ?auto_19220 ?auto_19217 ) ) ( not ( = ?auto_19198 ?auto_19203 ) ) ( not ( = ?auto_19198 ?auto_19209 ) ) ( not ( = ?auto_19199 ?auto_19203 ) ) ( not ( = ?auto_19199 ?auto_19209 ) ) ( not ( = ?auto_19200 ?auto_19203 ) ) ( not ( = ?auto_19200 ?auto_19209 ) ) ( not ( = ?auto_19201 ?auto_19203 ) ) ( not ( = ?auto_19201 ?auto_19209 ) ) ( not ( = ?auto_19203 ?auto_19220 ) ) ( not ( = ?auto_19203 ?auto_19214 ) ) ( not ( = ?auto_19203 ?auto_19210 ) ) ( not ( = ?auto_19203 ?auto_19217 ) ) ( not ( = ?auto_19204 ?auto_19211 ) ) ( not ( = ?auto_19204 ?auto_19219 ) ) ( not ( = ?auto_19204 ?auto_19221 ) ) ( not ( = ?auto_19204 ?auto_19216 ) ) ( not ( = ?auto_19208 ?auto_19213 ) ) ( not ( = ?auto_19208 ?auto_19218 ) ) ( not ( = ?auto_19208 ?auto_19212 ) ) ( not ( = ?auto_19208 ?auto_19215 ) ) ( not ( = ?auto_19209 ?auto_19220 ) ) ( not ( = ?auto_19209 ?auto_19214 ) ) ( not ( = ?auto_19209 ?auto_19210 ) ) ( not ( = ?auto_19209 ?auto_19217 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19198 ?auto_19199 ?auto_19200 ?auto_19201 ?auto_19202 )
      ( MAKE-1CRATE ?auto_19202 ?auto_19203 )
      ( MAKE-5CRATE-VERIFY ?auto_19198 ?auto_19199 ?auto_19200 ?auto_19201 ?auto_19202 ?auto_19203 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19224 - SURFACE
      ?auto_19225 - SURFACE
    )
    :vars
    (
      ?auto_19226 - HOIST
      ?auto_19227 - PLACE
      ?auto_19229 - PLACE
      ?auto_19230 - HOIST
      ?auto_19231 - SURFACE
      ?auto_19228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19226 ?auto_19227 ) ( SURFACE-AT ?auto_19224 ?auto_19227 ) ( CLEAR ?auto_19224 ) ( IS-CRATE ?auto_19225 ) ( AVAILABLE ?auto_19226 ) ( not ( = ?auto_19229 ?auto_19227 ) ) ( HOIST-AT ?auto_19230 ?auto_19229 ) ( AVAILABLE ?auto_19230 ) ( SURFACE-AT ?auto_19225 ?auto_19229 ) ( ON ?auto_19225 ?auto_19231 ) ( CLEAR ?auto_19225 ) ( TRUCK-AT ?auto_19228 ?auto_19227 ) ( not ( = ?auto_19224 ?auto_19225 ) ) ( not ( = ?auto_19224 ?auto_19231 ) ) ( not ( = ?auto_19225 ?auto_19231 ) ) ( not ( = ?auto_19226 ?auto_19230 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19228 ?auto_19227 ?auto_19229 )
      ( !LIFT ?auto_19230 ?auto_19225 ?auto_19231 ?auto_19229 )
      ( !LOAD ?auto_19230 ?auto_19225 ?auto_19228 ?auto_19229 )
      ( !DRIVE ?auto_19228 ?auto_19229 ?auto_19227 )
      ( !UNLOAD ?auto_19226 ?auto_19225 ?auto_19228 ?auto_19227 )
      ( !DROP ?auto_19226 ?auto_19225 ?auto_19224 ?auto_19227 )
      ( MAKE-1CRATE-VERIFY ?auto_19224 ?auto_19225 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_19239 - SURFACE
      ?auto_19240 - SURFACE
      ?auto_19241 - SURFACE
      ?auto_19242 - SURFACE
      ?auto_19243 - SURFACE
      ?auto_19245 - SURFACE
      ?auto_19244 - SURFACE
    )
    :vars
    (
      ?auto_19249 - HOIST
      ?auto_19246 - PLACE
      ?auto_19248 - PLACE
      ?auto_19247 - HOIST
      ?auto_19251 - SURFACE
      ?auto_19256 - PLACE
      ?auto_19252 - HOIST
      ?auto_19266 - SURFACE
      ?auto_19264 - PLACE
      ?auto_19265 - HOIST
      ?auto_19258 - SURFACE
      ?auto_19260 - PLACE
      ?auto_19255 - HOIST
      ?auto_19254 - SURFACE
      ?auto_19261 - PLACE
      ?auto_19263 - HOIST
      ?auto_19259 - SURFACE
      ?auto_19253 - PLACE
      ?auto_19257 - HOIST
      ?auto_19262 - SURFACE
      ?auto_19250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19249 ?auto_19246 ) ( IS-CRATE ?auto_19244 ) ( not ( = ?auto_19248 ?auto_19246 ) ) ( HOIST-AT ?auto_19247 ?auto_19248 ) ( AVAILABLE ?auto_19247 ) ( SURFACE-AT ?auto_19244 ?auto_19248 ) ( ON ?auto_19244 ?auto_19251 ) ( CLEAR ?auto_19244 ) ( not ( = ?auto_19245 ?auto_19244 ) ) ( not ( = ?auto_19245 ?auto_19251 ) ) ( not ( = ?auto_19244 ?auto_19251 ) ) ( not ( = ?auto_19249 ?auto_19247 ) ) ( IS-CRATE ?auto_19245 ) ( not ( = ?auto_19256 ?auto_19246 ) ) ( HOIST-AT ?auto_19252 ?auto_19256 ) ( AVAILABLE ?auto_19252 ) ( SURFACE-AT ?auto_19245 ?auto_19256 ) ( ON ?auto_19245 ?auto_19266 ) ( CLEAR ?auto_19245 ) ( not ( = ?auto_19243 ?auto_19245 ) ) ( not ( = ?auto_19243 ?auto_19266 ) ) ( not ( = ?auto_19245 ?auto_19266 ) ) ( not ( = ?auto_19249 ?auto_19252 ) ) ( IS-CRATE ?auto_19243 ) ( not ( = ?auto_19264 ?auto_19246 ) ) ( HOIST-AT ?auto_19265 ?auto_19264 ) ( AVAILABLE ?auto_19265 ) ( SURFACE-AT ?auto_19243 ?auto_19264 ) ( ON ?auto_19243 ?auto_19258 ) ( CLEAR ?auto_19243 ) ( not ( = ?auto_19242 ?auto_19243 ) ) ( not ( = ?auto_19242 ?auto_19258 ) ) ( not ( = ?auto_19243 ?auto_19258 ) ) ( not ( = ?auto_19249 ?auto_19265 ) ) ( IS-CRATE ?auto_19242 ) ( not ( = ?auto_19260 ?auto_19246 ) ) ( HOIST-AT ?auto_19255 ?auto_19260 ) ( AVAILABLE ?auto_19255 ) ( SURFACE-AT ?auto_19242 ?auto_19260 ) ( ON ?auto_19242 ?auto_19254 ) ( CLEAR ?auto_19242 ) ( not ( = ?auto_19241 ?auto_19242 ) ) ( not ( = ?auto_19241 ?auto_19254 ) ) ( not ( = ?auto_19242 ?auto_19254 ) ) ( not ( = ?auto_19249 ?auto_19255 ) ) ( IS-CRATE ?auto_19241 ) ( not ( = ?auto_19261 ?auto_19246 ) ) ( HOIST-AT ?auto_19263 ?auto_19261 ) ( AVAILABLE ?auto_19263 ) ( SURFACE-AT ?auto_19241 ?auto_19261 ) ( ON ?auto_19241 ?auto_19259 ) ( CLEAR ?auto_19241 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19240 ?auto_19259 ) ) ( not ( = ?auto_19241 ?auto_19259 ) ) ( not ( = ?auto_19249 ?auto_19263 ) ) ( SURFACE-AT ?auto_19239 ?auto_19246 ) ( CLEAR ?auto_19239 ) ( IS-CRATE ?auto_19240 ) ( AVAILABLE ?auto_19249 ) ( not ( = ?auto_19253 ?auto_19246 ) ) ( HOIST-AT ?auto_19257 ?auto_19253 ) ( AVAILABLE ?auto_19257 ) ( SURFACE-AT ?auto_19240 ?auto_19253 ) ( ON ?auto_19240 ?auto_19262 ) ( CLEAR ?auto_19240 ) ( TRUCK-AT ?auto_19250 ?auto_19246 ) ( not ( = ?auto_19239 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19262 ) ) ( not ( = ?auto_19240 ?auto_19262 ) ) ( not ( = ?auto_19249 ?auto_19257 ) ) ( not ( = ?auto_19239 ?auto_19241 ) ) ( not ( = ?auto_19239 ?auto_19259 ) ) ( not ( = ?auto_19241 ?auto_19262 ) ) ( not ( = ?auto_19261 ?auto_19253 ) ) ( not ( = ?auto_19263 ?auto_19257 ) ) ( not ( = ?auto_19259 ?auto_19262 ) ) ( not ( = ?auto_19239 ?auto_19242 ) ) ( not ( = ?auto_19239 ?auto_19254 ) ) ( not ( = ?auto_19240 ?auto_19242 ) ) ( not ( = ?auto_19240 ?auto_19254 ) ) ( not ( = ?auto_19242 ?auto_19259 ) ) ( not ( = ?auto_19242 ?auto_19262 ) ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19260 ?auto_19253 ) ) ( not ( = ?auto_19255 ?auto_19263 ) ) ( not ( = ?auto_19255 ?auto_19257 ) ) ( not ( = ?auto_19254 ?auto_19259 ) ) ( not ( = ?auto_19254 ?auto_19262 ) ) ( not ( = ?auto_19239 ?auto_19243 ) ) ( not ( = ?auto_19239 ?auto_19258 ) ) ( not ( = ?auto_19240 ?auto_19243 ) ) ( not ( = ?auto_19240 ?auto_19258 ) ) ( not ( = ?auto_19241 ?auto_19243 ) ) ( not ( = ?auto_19241 ?auto_19258 ) ) ( not ( = ?auto_19243 ?auto_19254 ) ) ( not ( = ?auto_19243 ?auto_19259 ) ) ( not ( = ?auto_19243 ?auto_19262 ) ) ( not ( = ?auto_19264 ?auto_19260 ) ) ( not ( = ?auto_19264 ?auto_19261 ) ) ( not ( = ?auto_19264 ?auto_19253 ) ) ( not ( = ?auto_19265 ?auto_19255 ) ) ( not ( = ?auto_19265 ?auto_19263 ) ) ( not ( = ?auto_19265 ?auto_19257 ) ) ( not ( = ?auto_19258 ?auto_19254 ) ) ( not ( = ?auto_19258 ?auto_19259 ) ) ( not ( = ?auto_19258 ?auto_19262 ) ) ( not ( = ?auto_19239 ?auto_19245 ) ) ( not ( = ?auto_19239 ?auto_19266 ) ) ( not ( = ?auto_19240 ?auto_19245 ) ) ( not ( = ?auto_19240 ?auto_19266 ) ) ( not ( = ?auto_19241 ?auto_19245 ) ) ( not ( = ?auto_19241 ?auto_19266 ) ) ( not ( = ?auto_19242 ?auto_19245 ) ) ( not ( = ?auto_19242 ?auto_19266 ) ) ( not ( = ?auto_19245 ?auto_19258 ) ) ( not ( = ?auto_19245 ?auto_19254 ) ) ( not ( = ?auto_19245 ?auto_19259 ) ) ( not ( = ?auto_19245 ?auto_19262 ) ) ( not ( = ?auto_19256 ?auto_19264 ) ) ( not ( = ?auto_19256 ?auto_19260 ) ) ( not ( = ?auto_19256 ?auto_19261 ) ) ( not ( = ?auto_19256 ?auto_19253 ) ) ( not ( = ?auto_19252 ?auto_19265 ) ) ( not ( = ?auto_19252 ?auto_19255 ) ) ( not ( = ?auto_19252 ?auto_19263 ) ) ( not ( = ?auto_19252 ?auto_19257 ) ) ( not ( = ?auto_19266 ?auto_19258 ) ) ( not ( = ?auto_19266 ?auto_19254 ) ) ( not ( = ?auto_19266 ?auto_19259 ) ) ( not ( = ?auto_19266 ?auto_19262 ) ) ( not ( = ?auto_19239 ?auto_19244 ) ) ( not ( = ?auto_19239 ?auto_19251 ) ) ( not ( = ?auto_19240 ?auto_19244 ) ) ( not ( = ?auto_19240 ?auto_19251 ) ) ( not ( = ?auto_19241 ?auto_19244 ) ) ( not ( = ?auto_19241 ?auto_19251 ) ) ( not ( = ?auto_19242 ?auto_19244 ) ) ( not ( = ?auto_19242 ?auto_19251 ) ) ( not ( = ?auto_19243 ?auto_19244 ) ) ( not ( = ?auto_19243 ?auto_19251 ) ) ( not ( = ?auto_19244 ?auto_19266 ) ) ( not ( = ?auto_19244 ?auto_19258 ) ) ( not ( = ?auto_19244 ?auto_19254 ) ) ( not ( = ?auto_19244 ?auto_19259 ) ) ( not ( = ?auto_19244 ?auto_19262 ) ) ( not ( = ?auto_19248 ?auto_19256 ) ) ( not ( = ?auto_19248 ?auto_19264 ) ) ( not ( = ?auto_19248 ?auto_19260 ) ) ( not ( = ?auto_19248 ?auto_19261 ) ) ( not ( = ?auto_19248 ?auto_19253 ) ) ( not ( = ?auto_19247 ?auto_19252 ) ) ( not ( = ?auto_19247 ?auto_19265 ) ) ( not ( = ?auto_19247 ?auto_19255 ) ) ( not ( = ?auto_19247 ?auto_19263 ) ) ( not ( = ?auto_19247 ?auto_19257 ) ) ( not ( = ?auto_19251 ?auto_19266 ) ) ( not ( = ?auto_19251 ?auto_19258 ) ) ( not ( = ?auto_19251 ?auto_19254 ) ) ( not ( = ?auto_19251 ?auto_19259 ) ) ( not ( = ?auto_19251 ?auto_19262 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19245 )
      ( MAKE-1CRATE ?auto_19245 ?auto_19244 )
      ( MAKE-6CRATE-VERIFY ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ?auto_19245 ?auto_19244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19269 - SURFACE
      ?auto_19270 - SURFACE
    )
    :vars
    (
      ?auto_19271 - HOIST
      ?auto_19272 - PLACE
      ?auto_19274 - PLACE
      ?auto_19275 - HOIST
      ?auto_19276 - SURFACE
      ?auto_19273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19271 ?auto_19272 ) ( SURFACE-AT ?auto_19269 ?auto_19272 ) ( CLEAR ?auto_19269 ) ( IS-CRATE ?auto_19270 ) ( AVAILABLE ?auto_19271 ) ( not ( = ?auto_19274 ?auto_19272 ) ) ( HOIST-AT ?auto_19275 ?auto_19274 ) ( AVAILABLE ?auto_19275 ) ( SURFACE-AT ?auto_19270 ?auto_19274 ) ( ON ?auto_19270 ?auto_19276 ) ( CLEAR ?auto_19270 ) ( TRUCK-AT ?auto_19273 ?auto_19272 ) ( not ( = ?auto_19269 ?auto_19270 ) ) ( not ( = ?auto_19269 ?auto_19276 ) ) ( not ( = ?auto_19270 ?auto_19276 ) ) ( not ( = ?auto_19271 ?auto_19275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19273 ?auto_19272 ?auto_19274 )
      ( !LIFT ?auto_19275 ?auto_19270 ?auto_19276 ?auto_19274 )
      ( !LOAD ?auto_19275 ?auto_19270 ?auto_19273 ?auto_19274 )
      ( !DRIVE ?auto_19273 ?auto_19274 ?auto_19272 )
      ( !UNLOAD ?auto_19271 ?auto_19270 ?auto_19273 ?auto_19272 )
      ( !DROP ?auto_19271 ?auto_19270 ?auto_19269 ?auto_19272 )
      ( MAKE-1CRATE-VERIFY ?auto_19269 ?auto_19270 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_19285 - SURFACE
      ?auto_19286 - SURFACE
      ?auto_19287 - SURFACE
      ?auto_19288 - SURFACE
      ?auto_19289 - SURFACE
      ?auto_19291 - SURFACE
      ?auto_19290 - SURFACE
      ?auto_19292 - SURFACE
    )
    :vars
    (
      ?auto_19294 - HOIST
      ?auto_19295 - PLACE
      ?auto_19293 - PLACE
      ?auto_19296 - HOIST
      ?auto_19298 - SURFACE
      ?auto_19310 - PLACE
      ?auto_19312 - HOIST
      ?auto_19304 - SURFACE
      ?auto_19301 - PLACE
      ?auto_19308 - HOIST
      ?auto_19307 - SURFACE
      ?auto_19314 - PLACE
      ?auto_19315 - HOIST
      ?auto_19299 - SURFACE
      ?auto_19309 - PLACE
      ?auto_19302 - HOIST
      ?auto_19306 - SURFACE
      ?auto_19311 - PLACE
      ?auto_19313 - HOIST
      ?auto_19316 - SURFACE
      ?auto_19305 - PLACE
      ?auto_19300 - HOIST
      ?auto_19303 - SURFACE
      ?auto_19297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19294 ?auto_19295 ) ( IS-CRATE ?auto_19292 ) ( not ( = ?auto_19293 ?auto_19295 ) ) ( HOIST-AT ?auto_19296 ?auto_19293 ) ( AVAILABLE ?auto_19296 ) ( SURFACE-AT ?auto_19292 ?auto_19293 ) ( ON ?auto_19292 ?auto_19298 ) ( CLEAR ?auto_19292 ) ( not ( = ?auto_19290 ?auto_19292 ) ) ( not ( = ?auto_19290 ?auto_19298 ) ) ( not ( = ?auto_19292 ?auto_19298 ) ) ( not ( = ?auto_19294 ?auto_19296 ) ) ( IS-CRATE ?auto_19290 ) ( not ( = ?auto_19310 ?auto_19295 ) ) ( HOIST-AT ?auto_19312 ?auto_19310 ) ( AVAILABLE ?auto_19312 ) ( SURFACE-AT ?auto_19290 ?auto_19310 ) ( ON ?auto_19290 ?auto_19304 ) ( CLEAR ?auto_19290 ) ( not ( = ?auto_19291 ?auto_19290 ) ) ( not ( = ?auto_19291 ?auto_19304 ) ) ( not ( = ?auto_19290 ?auto_19304 ) ) ( not ( = ?auto_19294 ?auto_19312 ) ) ( IS-CRATE ?auto_19291 ) ( not ( = ?auto_19301 ?auto_19295 ) ) ( HOIST-AT ?auto_19308 ?auto_19301 ) ( AVAILABLE ?auto_19308 ) ( SURFACE-AT ?auto_19291 ?auto_19301 ) ( ON ?auto_19291 ?auto_19307 ) ( CLEAR ?auto_19291 ) ( not ( = ?auto_19289 ?auto_19291 ) ) ( not ( = ?auto_19289 ?auto_19307 ) ) ( not ( = ?auto_19291 ?auto_19307 ) ) ( not ( = ?auto_19294 ?auto_19308 ) ) ( IS-CRATE ?auto_19289 ) ( not ( = ?auto_19314 ?auto_19295 ) ) ( HOIST-AT ?auto_19315 ?auto_19314 ) ( AVAILABLE ?auto_19315 ) ( SURFACE-AT ?auto_19289 ?auto_19314 ) ( ON ?auto_19289 ?auto_19299 ) ( CLEAR ?auto_19289 ) ( not ( = ?auto_19288 ?auto_19289 ) ) ( not ( = ?auto_19288 ?auto_19299 ) ) ( not ( = ?auto_19289 ?auto_19299 ) ) ( not ( = ?auto_19294 ?auto_19315 ) ) ( IS-CRATE ?auto_19288 ) ( not ( = ?auto_19309 ?auto_19295 ) ) ( HOIST-AT ?auto_19302 ?auto_19309 ) ( AVAILABLE ?auto_19302 ) ( SURFACE-AT ?auto_19288 ?auto_19309 ) ( ON ?auto_19288 ?auto_19306 ) ( CLEAR ?auto_19288 ) ( not ( = ?auto_19287 ?auto_19288 ) ) ( not ( = ?auto_19287 ?auto_19306 ) ) ( not ( = ?auto_19288 ?auto_19306 ) ) ( not ( = ?auto_19294 ?auto_19302 ) ) ( IS-CRATE ?auto_19287 ) ( not ( = ?auto_19311 ?auto_19295 ) ) ( HOIST-AT ?auto_19313 ?auto_19311 ) ( AVAILABLE ?auto_19313 ) ( SURFACE-AT ?auto_19287 ?auto_19311 ) ( ON ?auto_19287 ?auto_19316 ) ( CLEAR ?auto_19287 ) ( not ( = ?auto_19286 ?auto_19287 ) ) ( not ( = ?auto_19286 ?auto_19316 ) ) ( not ( = ?auto_19287 ?auto_19316 ) ) ( not ( = ?auto_19294 ?auto_19313 ) ) ( SURFACE-AT ?auto_19285 ?auto_19295 ) ( CLEAR ?auto_19285 ) ( IS-CRATE ?auto_19286 ) ( AVAILABLE ?auto_19294 ) ( not ( = ?auto_19305 ?auto_19295 ) ) ( HOIST-AT ?auto_19300 ?auto_19305 ) ( AVAILABLE ?auto_19300 ) ( SURFACE-AT ?auto_19286 ?auto_19305 ) ( ON ?auto_19286 ?auto_19303 ) ( CLEAR ?auto_19286 ) ( TRUCK-AT ?auto_19297 ?auto_19295 ) ( not ( = ?auto_19285 ?auto_19286 ) ) ( not ( = ?auto_19285 ?auto_19303 ) ) ( not ( = ?auto_19286 ?auto_19303 ) ) ( not ( = ?auto_19294 ?auto_19300 ) ) ( not ( = ?auto_19285 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19316 ) ) ( not ( = ?auto_19287 ?auto_19303 ) ) ( not ( = ?auto_19311 ?auto_19305 ) ) ( not ( = ?auto_19313 ?auto_19300 ) ) ( not ( = ?auto_19316 ?auto_19303 ) ) ( not ( = ?auto_19285 ?auto_19288 ) ) ( not ( = ?auto_19285 ?auto_19306 ) ) ( not ( = ?auto_19286 ?auto_19288 ) ) ( not ( = ?auto_19286 ?auto_19306 ) ) ( not ( = ?auto_19288 ?auto_19316 ) ) ( not ( = ?auto_19288 ?auto_19303 ) ) ( not ( = ?auto_19309 ?auto_19311 ) ) ( not ( = ?auto_19309 ?auto_19305 ) ) ( not ( = ?auto_19302 ?auto_19313 ) ) ( not ( = ?auto_19302 ?auto_19300 ) ) ( not ( = ?auto_19306 ?auto_19316 ) ) ( not ( = ?auto_19306 ?auto_19303 ) ) ( not ( = ?auto_19285 ?auto_19289 ) ) ( not ( = ?auto_19285 ?auto_19299 ) ) ( not ( = ?auto_19286 ?auto_19289 ) ) ( not ( = ?auto_19286 ?auto_19299 ) ) ( not ( = ?auto_19287 ?auto_19289 ) ) ( not ( = ?auto_19287 ?auto_19299 ) ) ( not ( = ?auto_19289 ?auto_19306 ) ) ( not ( = ?auto_19289 ?auto_19316 ) ) ( not ( = ?auto_19289 ?auto_19303 ) ) ( not ( = ?auto_19314 ?auto_19309 ) ) ( not ( = ?auto_19314 ?auto_19311 ) ) ( not ( = ?auto_19314 ?auto_19305 ) ) ( not ( = ?auto_19315 ?auto_19302 ) ) ( not ( = ?auto_19315 ?auto_19313 ) ) ( not ( = ?auto_19315 ?auto_19300 ) ) ( not ( = ?auto_19299 ?auto_19306 ) ) ( not ( = ?auto_19299 ?auto_19316 ) ) ( not ( = ?auto_19299 ?auto_19303 ) ) ( not ( = ?auto_19285 ?auto_19291 ) ) ( not ( = ?auto_19285 ?auto_19307 ) ) ( not ( = ?auto_19286 ?auto_19291 ) ) ( not ( = ?auto_19286 ?auto_19307 ) ) ( not ( = ?auto_19287 ?auto_19291 ) ) ( not ( = ?auto_19287 ?auto_19307 ) ) ( not ( = ?auto_19288 ?auto_19291 ) ) ( not ( = ?auto_19288 ?auto_19307 ) ) ( not ( = ?auto_19291 ?auto_19299 ) ) ( not ( = ?auto_19291 ?auto_19306 ) ) ( not ( = ?auto_19291 ?auto_19316 ) ) ( not ( = ?auto_19291 ?auto_19303 ) ) ( not ( = ?auto_19301 ?auto_19314 ) ) ( not ( = ?auto_19301 ?auto_19309 ) ) ( not ( = ?auto_19301 ?auto_19311 ) ) ( not ( = ?auto_19301 ?auto_19305 ) ) ( not ( = ?auto_19308 ?auto_19315 ) ) ( not ( = ?auto_19308 ?auto_19302 ) ) ( not ( = ?auto_19308 ?auto_19313 ) ) ( not ( = ?auto_19308 ?auto_19300 ) ) ( not ( = ?auto_19307 ?auto_19299 ) ) ( not ( = ?auto_19307 ?auto_19306 ) ) ( not ( = ?auto_19307 ?auto_19316 ) ) ( not ( = ?auto_19307 ?auto_19303 ) ) ( not ( = ?auto_19285 ?auto_19290 ) ) ( not ( = ?auto_19285 ?auto_19304 ) ) ( not ( = ?auto_19286 ?auto_19290 ) ) ( not ( = ?auto_19286 ?auto_19304 ) ) ( not ( = ?auto_19287 ?auto_19290 ) ) ( not ( = ?auto_19287 ?auto_19304 ) ) ( not ( = ?auto_19288 ?auto_19290 ) ) ( not ( = ?auto_19288 ?auto_19304 ) ) ( not ( = ?auto_19289 ?auto_19290 ) ) ( not ( = ?auto_19289 ?auto_19304 ) ) ( not ( = ?auto_19290 ?auto_19307 ) ) ( not ( = ?auto_19290 ?auto_19299 ) ) ( not ( = ?auto_19290 ?auto_19306 ) ) ( not ( = ?auto_19290 ?auto_19316 ) ) ( not ( = ?auto_19290 ?auto_19303 ) ) ( not ( = ?auto_19310 ?auto_19301 ) ) ( not ( = ?auto_19310 ?auto_19314 ) ) ( not ( = ?auto_19310 ?auto_19309 ) ) ( not ( = ?auto_19310 ?auto_19311 ) ) ( not ( = ?auto_19310 ?auto_19305 ) ) ( not ( = ?auto_19312 ?auto_19308 ) ) ( not ( = ?auto_19312 ?auto_19315 ) ) ( not ( = ?auto_19312 ?auto_19302 ) ) ( not ( = ?auto_19312 ?auto_19313 ) ) ( not ( = ?auto_19312 ?auto_19300 ) ) ( not ( = ?auto_19304 ?auto_19307 ) ) ( not ( = ?auto_19304 ?auto_19299 ) ) ( not ( = ?auto_19304 ?auto_19306 ) ) ( not ( = ?auto_19304 ?auto_19316 ) ) ( not ( = ?auto_19304 ?auto_19303 ) ) ( not ( = ?auto_19285 ?auto_19292 ) ) ( not ( = ?auto_19285 ?auto_19298 ) ) ( not ( = ?auto_19286 ?auto_19292 ) ) ( not ( = ?auto_19286 ?auto_19298 ) ) ( not ( = ?auto_19287 ?auto_19292 ) ) ( not ( = ?auto_19287 ?auto_19298 ) ) ( not ( = ?auto_19288 ?auto_19292 ) ) ( not ( = ?auto_19288 ?auto_19298 ) ) ( not ( = ?auto_19289 ?auto_19292 ) ) ( not ( = ?auto_19289 ?auto_19298 ) ) ( not ( = ?auto_19291 ?auto_19292 ) ) ( not ( = ?auto_19291 ?auto_19298 ) ) ( not ( = ?auto_19292 ?auto_19304 ) ) ( not ( = ?auto_19292 ?auto_19307 ) ) ( not ( = ?auto_19292 ?auto_19299 ) ) ( not ( = ?auto_19292 ?auto_19306 ) ) ( not ( = ?auto_19292 ?auto_19316 ) ) ( not ( = ?auto_19292 ?auto_19303 ) ) ( not ( = ?auto_19293 ?auto_19310 ) ) ( not ( = ?auto_19293 ?auto_19301 ) ) ( not ( = ?auto_19293 ?auto_19314 ) ) ( not ( = ?auto_19293 ?auto_19309 ) ) ( not ( = ?auto_19293 ?auto_19311 ) ) ( not ( = ?auto_19293 ?auto_19305 ) ) ( not ( = ?auto_19296 ?auto_19312 ) ) ( not ( = ?auto_19296 ?auto_19308 ) ) ( not ( = ?auto_19296 ?auto_19315 ) ) ( not ( = ?auto_19296 ?auto_19302 ) ) ( not ( = ?auto_19296 ?auto_19313 ) ) ( not ( = ?auto_19296 ?auto_19300 ) ) ( not ( = ?auto_19298 ?auto_19304 ) ) ( not ( = ?auto_19298 ?auto_19307 ) ) ( not ( = ?auto_19298 ?auto_19299 ) ) ( not ( = ?auto_19298 ?auto_19306 ) ) ( not ( = ?auto_19298 ?auto_19316 ) ) ( not ( = ?auto_19298 ?auto_19303 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_19285 ?auto_19286 ?auto_19287 ?auto_19288 ?auto_19289 ?auto_19291 ?auto_19290 )
      ( MAKE-1CRATE ?auto_19290 ?auto_19292 )
      ( MAKE-7CRATE-VERIFY ?auto_19285 ?auto_19286 ?auto_19287 ?auto_19288 ?auto_19289 ?auto_19291 ?auto_19290 ?auto_19292 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19319 - SURFACE
      ?auto_19320 - SURFACE
    )
    :vars
    (
      ?auto_19321 - HOIST
      ?auto_19322 - PLACE
      ?auto_19324 - PLACE
      ?auto_19325 - HOIST
      ?auto_19326 - SURFACE
      ?auto_19323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19321 ?auto_19322 ) ( SURFACE-AT ?auto_19319 ?auto_19322 ) ( CLEAR ?auto_19319 ) ( IS-CRATE ?auto_19320 ) ( AVAILABLE ?auto_19321 ) ( not ( = ?auto_19324 ?auto_19322 ) ) ( HOIST-AT ?auto_19325 ?auto_19324 ) ( AVAILABLE ?auto_19325 ) ( SURFACE-AT ?auto_19320 ?auto_19324 ) ( ON ?auto_19320 ?auto_19326 ) ( CLEAR ?auto_19320 ) ( TRUCK-AT ?auto_19323 ?auto_19322 ) ( not ( = ?auto_19319 ?auto_19320 ) ) ( not ( = ?auto_19319 ?auto_19326 ) ) ( not ( = ?auto_19320 ?auto_19326 ) ) ( not ( = ?auto_19321 ?auto_19325 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19323 ?auto_19322 ?auto_19324 )
      ( !LIFT ?auto_19325 ?auto_19320 ?auto_19326 ?auto_19324 )
      ( !LOAD ?auto_19325 ?auto_19320 ?auto_19323 ?auto_19324 )
      ( !DRIVE ?auto_19323 ?auto_19324 ?auto_19322 )
      ( !UNLOAD ?auto_19321 ?auto_19320 ?auto_19323 ?auto_19322 )
      ( !DROP ?auto_19321 ?auto_19320 ?auto_19319 ?auto_19322 )
      ( MAKE-1CRATE-VERIFY ?auto_19319 ?auto_19320 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_19336 - SURFACE
      ?auto_19337 - SURFACE
      ?auto_19338 - SURFACE
      ?auto_19339 - SURFACE
      ?auto_19340 - SURFACE
      ?auto_19342 - SURFACE
      ?auto_19341 - SURFACE
      ?auto_19344 - SURFACE
      ?auto_19343 - SURFACE
    )
    :vars
    (
      ?auto_19348 - HOIST
      ?auto_19345 - PLACE
      ?auto_19347 - PLACE
      ?auto_19350 - HOIST
      ?auto_19346 - SURFACE
      ?auto_19370 - PLACE
      ?auto_19371 - HOIST
      ?auto_19351 - SURFACE
      ?auto_19364 - PLACE
      ?auto_19366 - HOIST
      ?auto_19369 - SURFACE
      ?auto_19355 - PLACE
      ?auto_19363 - HOIST
      ?auto_19361 - SURFACE
      ?auto_19360 - PLACE
      ?auto_19358 - HOIST
      ?auto_19359 - SURFACE
      ?auto_19362 - PLACE
      ?auto_19353 - HOIST
      ?auto_19367 - SURFACE
      ?auto_19365 - PLACE
      ?auto_19356 - HOIST
      ?auto_19357 - SURFACE
      ?auto_19368 - PLACE
      ?auto_19354 - HOIST
      ?auto_19352 - SURFACE
      ?auto_19349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19348 ?auto_19345 ) ( IS-CRATE ?auto_19343 ) ( not ( = ?auto_19347 ?auto_19345 ) ) ( HOIST-AT ?auto_19350 ?auto_19347 ) ( AVAILABLE ?auto_19350 ) ( SURFACE-AT ?auto_19343 ?auto_19347 ) ( ON ?auto_19343 ?auto_19346 ) ( CLEAR ?auto_19343 ) ( not ( = ?auto_19344 ?auto_19343 ) ) ( not ( = ?auto_19344 ?auto_19346 ) ) ( not ( = ?auto_19343 ?auto_19346 ) ) ( not ( = ?auto_19348 ?auto_19350 ) ) ( IS-CRATE ?auto_19344 ) ( not ( = ?auto_19370 ?auto_19345 ) ) ( HOIST-AT ?auto_19371 ?auto_19370 ) ( AVAILABLE ?auto_19371 ) ( SURFACE-AT ?auto_19344 ?auto_19370 ) ( ON ?auto_19344 ?auto_19351 ) ( CLEAR ?auto_19344 ) ( not ( = ?auto_19341 ?auto_19344 ) ) ( not ( = ?auto_19341 ?auto_19351 ) ) ( not ( = ?auto_19344 ?auto_19351 ) ) ( not ( = ?auto_19348 ?auto_19371 ) ) ( IS-CRATE ?auto_19341 ) ( not ( = ?auto_19364 ?auto_19345 ) ) ( HOIST-AT ?auto_19366 ?auto_19364 ) ( AVAILABLE ?auto_19366 ) ( SURFACE-AT ?auto_19341 ?auto_19364 ) ( ON ?auto_19341 ?auto_19369 ) ( CLEAR ?auto_19341 ) ( not ( = ?auto_19342 ?auto_19341 ) ) ( not ( = ?auto_19342 ?auto_19369 ) ) ( not ( = ?auto_19341 ?auto_19369 ) ) ( not ( = ?auto_19348 ?auto_19366 ) ) ( IS-CRATE ?auto_19342 ) ( not ( = ?auto_19355 ?auto_19345 ) ) ( HOIST-AT ?auto_19363 ?auto_19355 ) ( AVAILABLE ?auto_19363 ) ( SURFACE-AT ?auto_19342 ?auto_19355 ) ( ON ?auto_19342 ?auto_19361 ) ( CLEAR ?auto_19342 ) ( not ( = ?auto_19340 ?auto_19342 ) ) ( not ( = ?auto_19340 ?auto_19361 ) ) ( not ( = ?auto_19342 ?auto_19361 ) ) ( not ( = ?auto_19348 ?auto_19363 ) ) ( IS-CRATE ?auto_19340 ) ( not ( = ?auto_19360 ?auto_19345 ) ) ( HOIST-AT ?auto_19358 ?auto_19360 ) ( AVAILABLE ?auto_19358 ) ( SURFACE-AT ?auto_19340 ?auto_19360 ) ( ON ?auto_19340 ?auto_19359 ) ( CLEAR ?auto_19340 ) ( not ( = ?auto_19339 ?auto_19340 ) ) ( not ( = ?auto_19339 ?auto_19359 ) ) ( not ( = ?auto_19340 ?auto_19359 ) ) ( not ( = ?auto_19348 ?auto_19358 ) ) ( IS-CRATE ?auto_19339 ) ( not ( = ?auto_19362 ?auto_19345 ) ) ( HOIST-AT ?auto_19353 ?auto_19362 ) ( AVAILABLE ?auto_19353 ) ( SURFACE-AT ?auto_19339 ?auto_19362 ) ( ON ?auto_19339 ?auto_19367 ) ( CLEAR ?auto_19339 ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19367 ) ) ( not ( = ?auto_19339 ?auto_19367 ) ) ( not ( = ?auto_19348 ?auto_19353 ) ) ( IS-CRATE ?auto_19338 ) ( not ( = ?auto_19365 ?auto_19345 ) ) ( HOIST-AT ?auto_19356 ?auto_19365 ) ( AVAILABLE ?auto_19356 ) ( SURFACE-AT ?auto_19338 ?auto_19365 ) ( ON ?auto_19338 ?auto_19357 ) ( CLEAR ?auto_19338 ) ( not ( = ?auto_19337 ?auto_19338 ) ) ( not ( = ?auto_19337 ?auto_19357 ) ) ( not ( = ?auto_19338 ?auto_19357 ) ) ( not ( = ?auto_19348 ?auto_19356 ) ) ( SURFACE-AT ?auto_19336 ?auto_19345 ) ( CLEAR ?auto_19336 ) ( IS-CRATE ?auto_19337 ) ( AVAILABLE ?auto_19348 ) ( not ( = ?auto_19368 ?auto_19345 ) ) ( HOIST-AT ?auto_19354 ?auto_19368 ) ( AVAILABLE ?auto_19354 ) ( SURFACE-AT ?auto_19337 ?auto_19368 ) ( ON ?auto_19337 ?auto_19352 ) ( CLEAR ?auto_19337 ) ( TRUCK-AT ?auto_19349 ?auto_19345 ) ( not ( = ?auto_19336 ?auto_19337 ) ) ( not ( = ?auto_19336 ?auto_19352 ) ) ( not ( = ?auto_19337 ?auto_19352 ) ) ( not ( = ?auto_19348 ?auto_19354 ) ) ( not ( = ?auto_19336 ?auto_19338 ) ) ( not ( = ?auto_19336 ?auto_19357 ) ) ( not ( = ?auto_19338 ?auto_19352 ) ) ( not ( = ?auto_19365 ?auto_19368 ) ) ( not ( = ?auto_19356 ?auto_19354 ) ) ( not ( = ?auto_19357 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19339 ) ) ( not ( = ?auto_19336 ?auto_19367 ) ) ( not ( = ?auto_19337 ?auto_19339 ) ) ( not ( = ?auto_19337 ?auto_19367 ) ) ( not ( = ?auto_19339 ?auto_19357 ) ) ( not ( = ?auto_19339 ?auto_19352 ) ) ( not ( = ?auto_19362 ?auto_19365 ) ) ( not ( = ?auto_19362 ?auto_19368 ) ) ( not ( = ?auto_19353 ?auto_19356 ) ) ( not ( = ?auto_19353 ?auto_19354 ) ) ( not ( = ?auto_19367 ?auto_19357 ) ) ( not ( = ?auto_19367 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19340 ) ) ( not ( = ?auto_19336 ?auto_19359 ) ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19337 ?auto_19359 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19338 ?auto_19359 ) ) ( not ( = ?auto_19340 ?auto_19367 ) ) ( not ( = ?auto_19340 ?auto_19357 ) ) ( not ( = ?auto_19340 ?auto_19352 ) ) ( not ( = ?auto_19360 ?auto_19362 ) ) ( not ( = ?auto_19360 ?auto_19365 ) ) ( not ( = ?auto_19360 ?auto_19368 ) ) ( not ( = ?auto_19358 ?auto_19353 ) ) ( not ( = ?auto_19358 ?auto_19356 ) ) ( not ( = ?auto_19358 ?auto_19354 ) ) ( not ( = ?auto_19359 ?auto_19367 ) ) ( not ( = ?auto_19359 ?auto_19357 ) ) ( not ( = ?auto_19359 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19342 ) ) ( not ( = ?auto_19336 ?auto_19361 ) ) ( not ( = ?auto_19337 ?auto_19342 ) ) ( not ( = ?auto_19337 ?auto_19361 ) ) ( not ( = ?auto_19338 ?auto_19342 ) ) ( not ( = ?auto_19338 ?auto_19361 ) ) ( not ( = ?auto_19339 ?auto_19342 ) ) ( not ( = ?auto_19339 ?auto_19361 ) ) ( not ( = ?auto_19342 ?auto_19359 ) ) ( not ( = ?auto_19342 ?auto_19367 ) ) ( not ( = ?auto_19342 ?auto_19357 ) ) ( not ( = ?auto_19342 ?auto_19352 ) ) ( not ( = ?auto_19355 ?auto_19360 ) ) ( not ( = ?auto_19355 ?auto_19362 ) ) ( not ( = ?auto_19355 ?auto_19365 ) ) ( not ( = ?auto_19355 ?auto_19368 ) ) ( not ( = ?auto_19363 ?auto_19358 ) ) ( not ( = ?auto_19363 ?auto_19353 ) ) ( not ( = ?auto_19363 ?auto_19356 ) ) ( not ( = ?auto_19363 ?auto_19354 ) ) ( not ( = ?auto_19361 ?auto_19359 ) ) ( not ( = ?auto_19361 ?auto_19367 ) ) ( not ( = ?auto_19361 ?auto_19357 ) ) ( not ( = ?auto_19361 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19341 ) ) ( not ( = ?auto_19336 ?auto_19369 ) ) ( not ( = ?auto_19337 ?auto_19341 ) ) ( not ( = ?auto_19337 ?auto_19369 ) ) ( not ( = ?auto_19338 ?auto_19341 ) ) ( not ( = ?auto_19338 ?auto_19369 ) ) ( not ( = ?auto_19339 ?auto_19341 ) ) ( not ( = ?auto_19339 ?auto_19369 ) ) ( not ( = ?auto_19340 ?auto_19341 ) ) ( not ( = ?auto_19340 ?auto_19369 ) ) ( not ( = ?auto_19341 ?auto_19361 ) ) ( not ( = ?auto_19341 ?auto_19359 ) ) ( not ( = ?auto_19341 ?auto_19367 ) ) ( not ( = ?auto_19341 ?auto_19357 ) ) ( not ( = ?auto_19341 ?auto_19352 ) ) ( not ( = ?auto_19364 ?auto_19355 ) ) ( not ( = ?auto_19364 ?auto_19360 ) ) ( not ( = ?auto_19364 ?auto_19362 ) ) ( not ( = ?auto_19364 ?auto_19365 ) ) ( not ( = ?auto_19364 ?auto_19368 ) ) ( not ( = ?auto_19366 ?auto_19363 ) ) ( not ( = ?auto_19366 ?auto_19358 ) ) ( not ( = ?auto_19366 ?auto_19353 ) ) ( not ( = ?auto_19366 ?auto_19356 ) ) ( not ( = ?auto_19366 ?auto_19354 ) ) ( not ( = ?auto_19369 ?auto_19361 ) ) ( not ( = ?auto_19369 ?auto_19359 ) ) ( not ( = ?auto_19369 ?auto_19367 ) ) ( not ( = ?auto_19369 ?auto_19357 ) ) ( not ( = ?auto_19369 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19344 ) ) ( not ( = ?auto_19336 ?auto_19351 ) ) ( not ( = ?auto_19337 ?auto_19344 ) ) ( not ( = ?auto_19337 ?auto_19351 ) ) ( not ( = ?auto_19338 ?auto_19344 ) ) ( not ( = ?auto_19338 ?auto_19351 ) ) ( not ( = ?auto_19339 ?auto_19344 ) ) ( not ( = ?auto_19339 ?auto_19351 ) ) ( not ( = ?auto_19340 ?auto_19344 ) ) ( not ( = ?auto_19340 ?auto_19351 ) ) ( not ( = ?auto_19342 ?auto_19344 ) ) ( not ( = ?auto_19342 ?auto_19351 ) ) ( not ( = ?auto_19344 ?auto_19369 ) ) ( not ( = ?auto_19344 ?auto_19361 ) ) ( not ( = ?auto_19344 ?auto_19359 ) ) ( not ( = ?auto_19344 ?auto_19367 ) ) ( not ( = ?auto_19344 ?auto_19357 ) ) ( not ( = ?auto_19344 ?auto_19352 ) ) ( not ( = ?auto_19370 ?auto_19364 ) ) ( not ( = ?auto_19370 ?auto_19355 ) ) ( not ( = ?auto_19370 ?auto_19360 ) ) ( not ( = ?auto_19370 ?auto_19362 ) ) ( not ( = ?auto_19370 ?auto_19365 ) ) ( not ( = ?auto_19370 ?auto_19368 ) ) ( not ( = ?auto_19371 ?auto_19366 ) ) ( not ( = ?auto_19371 ?auto_19363 ) ) ( not ( = ?auto_19371 ?auto_19358 ) ) ( not ( = ?auto_19371 ?auto_19353 ) ) ( not ( = ?auto_19371 ?auto_19356 ) ) ( not ( = ?auto_19371 ?auto_19354 ) ) ( not ( = ?auto_19351 ?auto_19369 ) ) ( not ( = ?auto_19351 ?auto_19361 ) ) ( not ( = ?auto_19351 ?auto_19359 ) ) ( not ( = ?auto_19351 ?auto_19367 ) ) ( not ( = ?auto_19351 ?auto_19357 ) ) ( not ( = ?auto_19351 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19343 ) ) ( not ( = ?auto_19336 ?auto_19346 ) ) ( not ( = ?auto_19337 ?auto_19343 ) ) ( not ( = ?auto_19337 ?auto_19346 ) ) ( not ( = ?auto_19338 ?auto_19343 ) ) ( not ( = ?auto_19338 ?auto_19346 ) ) ( not ( = ?auto_19339 ?auto_19343 ) ) ( not ( = ?auto_19339 ?auto_19346 ) ) ( not ( = ?auto_19340 ?auto_19343 ) ) ( not ( = ?auto_19340 ?auto_19346 ) ) ( not ( = ?auto_19342 ?auto_19343 ) ) ( not ( = ?auto_19342 ?auto_19346 ) ) ( not ( = ?auto_19341 ?auto_19343 ) ) ( not ( = ?auto_19341 ?auto_19346 ) ) ( not ( = ?auto_19343 ?auto_19351 ) ) ( not ( = ?auto_19343 ?auto_19369 ) ) ( not ( = ?auto_19343 ?auto_19361 ) ) ( not ( = ?auto_19343 ?auto_19359 ) ) ( not ( = ?auto_19343 ?auto_19367 ) ) ( not ( = ?auto_19343 ?auto_19357 ) ) ( not ( = ?auto_19343 ?auto_19352 ) ) ( not ( = ?auto_19347 ?auto_19370 ) ) ( not ( = ?auto_19347 ?auto_19364 ) ) ( not ( = ?auto_19347 ?auto_19355 ) ) ( not ( = ?auto_19347 ?auto_19360 ) ) ( not ( = ?auto_19347 ?auto_19362 ) ) ( not ( = ?auto_19347 ?auto_19365 ) ) ( not ( = ?auto_19347 ?auto_19368 ) ) ( not ( = ?auto_19350 ?auto_19371 ) ) ( not ( = ?auto_19350 ?auto_19366 ) ) ( not ( = ?auto_19350 ?auto_19363 ) ) ( not ( = ?auto_19350 ?auto_19358 ) ) ( not ( = ?auto_19350 ?auto_19353 ) ) ( not ( = ?auto_19350 ?auto_19356 ) ) ( not ( = ?auto_19350 ?auto_19354 ) ) ( not ( = ?auto_19346 ?auto_19351 ) ) ( not ( = ?auto_19346 ?auto_19369 ) ) ( not ( = ?auto_19346 ?auto_19361 ) ) ( not ( = ?auto_19346 ?auto_19359 ) ) ( not ( = ?auto_19346 ?auto_19367 ) ) ( not ( = ?auto_19346 ?auto_19357 ) ) ( not ( = ?auto_19346 ?auto_19352 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_19336 ?auto_19337 ?auto_19338 ?auto_19339 ?auto_19340 ?auto_19342 ?auto_19341 ?auto_19344 )
      ( MAKE-1CRATE ?auto_19344 ?auto_19343 )
      ( MAKE-8CRATE-VERIFY ?auto_19336 ?auto_19337 ?auto_19338 ?auto_19339 ?auto_19340 ?auto_19342 ?auto_19341 ?auto_19344 ?auto_19343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19374 - SURFACE
      ?auto_19375 - SURFACE
    )
    :vars
    (
      ?auto_19376 - HOIST
      ?auto_19377 - PLACE
      ?auto_19379 - PLACE
      ?auto_19380 - HOIST
      ?auto_19381 - SURFACE
      ?auto_19378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19376 ?auto_19377 ) ( SURFACE-AT ?auto_19374 ?auto_19377 ) ( CLEAR ?auto_19374 ) ( IS-CRATE ?auto_19375 ) ( AVAILABLE ?auto_19376 ) ( not ( = ?auto_19379 ?auto_19377 ) ) ( HOIST-AT ?auto_19380 ?auto_19379 ) ( AVAILABLE ?auto_19380 ) ( SURFACE-AT ?auto_19375 ?auto_19379 ) ( ON ?auto_19375 ?auto_19381 ) ( CLEAR ?auto_19375 ) ( TRUCK-AT ?auto_19378 ?auto_19377 ) ( not ( = ?auto_19374 ?auto_19375 ) ) ( not ( = ?auto_19374 ?auto_19381 ) ) ( not ( = ?auto_19375 ?auto_19381 ) ) ( not ( = ?auto_19376 ?auto_19380 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19378 ?auto_19377 ?auto_19379 )
      ( !LIFT ?auto_19380 ?auto_19375 ?auto_19381 ?auto_19379 )
      ( !LOAD ?auto_19380 ?auto_19375 ?auto_19378 ?auto_19379 )
      ( !DRIVE ?auto_19378 ?auto_19379 ?auto_19377 )
      ( !UNLOAD ?auto_19376 ?auto_19375 ?auto_19378 ?auto_19377 )
      ( !DROP ?auto_19376 ?auto_19375 ?auto_19374 ?auto_19377 )
      ( MAKE-1CRATE-VERIFY ?auto_19374 ?auto_19375 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_19392 - SURFACE
      ?auto_19393 - SURFACE
      ?auto_19394 - SURFACE
      ?auto_19395 - SURFACE
      ?auto_19396 - SURFACE
      ?auto_19399 - SURFACE
      ?auto_19397 - SURFACE
      ?auto_19401 - SURFACE
      ?auto_19400 - SURFACE
      ?auto_19398 - SURFACE
    )
    :vars
    (
      ?auto_19403 - HOIST
      ?auto_19402 - PLACE
      ?auto_19405 - PLACE
      ?auto_19407 - HOIST
      ?auto_19406 - SURFACE
      ?auto_19410 - PLACE
      ?auto_19409 - HOIST
      ?auto_19408 - SURFACE
      ?auto_19417 - PLACE
      ?auto_19416 - HOIST
      ?auto_19413 - SURFACE
      ?auto_19426 - PLACE
      ?auto_19418 - HOIST
      ?auto_19415 - SURFACE
      ?auto_19425 - PLACE
      ?auto_19423 - HOIST
      ?auto_19420 - SURFACE
      ?auto_19421 - PLACE
      ?auto_19427 - HOIST
      ?auto_19419 - SURFACE
      ?auto_19422 - PLACE
      ?auto_19430 - HOIST
      ?auto_19414 - SURFACE
      ?auto_19411 - PLACE
      ?auto_19424 - HOIST
      ?auto_19428 - SURFACE
      ?auto_19412 - PLACE
      ?auto_19429 - HOIST
      ?auto_19431 - SURFACE
      ?auto_19404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19403 ?auto_19402 ) ( IS-CRATE ?auto_19398 ) ( not ( = ?auto_19405 ?auto_19402 ) ) ( HOIST-AT ?auto_19407 ?auto_19405 ) ( AVAILABLE ?auto_19407 ) ( SURFACE-AT ?auto_19398 ?auto_19405 ) ( ON ?auto_19398 ?auto_19406 ) ( CLEAR ?auto_19398 ) ( not ( = ?auto_19400 ?auto_19398 ) ) ( not ( = ?auto_19400 ?auto_19406 ) ) ( not ( = ?auto_19398 ?auto_19406 ) ) ( not ( = ?auto_19403 ?auto_19407 ) ) ( IS-CRATE ?auto_19400 ) ( not ( = ?auto_19410 ?auto_19402 ) ) ( HOIST-AT ?auto_19409 ?auto_19410 ) ( AVAILABLE ?auto_19409 ) ( SURFACE-AT ?auto_19400 ?auto_19410 ) ( ON ?auto_19400 ?auto_19408 ) ( CLEAR ?auto_19400 ) ( not ( = ?auto_19401 ?auto_19400 ) ) ( not ( = ?auto_19401 ?auto_19408 ) ) ( not ( = ?auto_19400 ?auto_19408 ) ) ( not ( = ?auto_19403 ?auto_19409 ) ) ( IS-CRATE ?auto_19401 ) ( not ( = ?auto_19417 ?auto_19402 ) ) ( HOIST-AT ?auto_19416 ?auto_19417 ) ( AVAILABLE ?auto_19416 ) ( SURFACE-AT ?auto_19401 ?auto_19417 ) ( ON ?auto_19401 ?auto_19413 ) ( CLEAR ?auto_19401 ) ( not ( = ?auto_19397 ?auto_19401 ) ) ( not ( = ?auto_19397 ?auto_19413 ) ) ( not ( = ?auto_19401 ?auto_19413 ) ) ( not ( = ?auto_19403 ?auto_19416 ) ) ( IS-CRATE ?auto_19397 ) ( not ( = ?auto_19426 ?auto_19402 ) ) ( HOIST-AT ?auto_19418 ?auto_19426 ) ( AVAILABLE ?auto_19418 ) ( SURFACE-AT ?auto_19397 ?auto_19426 ) ( ON ?auto_19397 ?auto_19415 ) ( CLEAR ?auto_19397 ) ( not ( = ?auto_19399 ?auto_19397 ) ) ( not ( = ?auto_19399 ?auto_19415 ) ) ( not ( = ?auto_19397 ?auto_19415 ) ) ( not ( = ?auto_19403 ?auto_19418 ) ) ( IS-CRATE ?auto_19399 ) ( not ( = ?auto_19425 ?auto_19402 ) ) ( HOIST-AT ?auto_19423 ?auto_19425 ) ( AVAILABLE ?auto_19423 ) ( SURFACE-AT ?auto_19399 ?auto_19425 ) ( ON ?auto_19399 ?auto_19420 ) ( CLEAR ?auto_19399 ) ( not ( = ?auto_19396 ?auto_19399 ) ) ( not ( = ?auto_19396 ?auto_19420 ) ) ( not ( = ?auto_19399 ?auto_19420 ) ) ( not ( = ?auto_19403 ?auto_19423 ) ) ( IS-CRATE ?auto_19396 ) ( not ( = ?auto_19421 ?auto_19402 ) ) ( HOIST-AT ?auto_19427 ?auto_19421 ) ( AVAILABLE ?auto_19427 ) ( SURFACE-AT ?auto_19396 ?auto_19421 ) ( ON ?auto_19396 ?auto_19419 ) ( CLEAR ?auto_19396 ) ( not ( = ?auto_19395 ?auto_19396 ) ) ( not ( = ?auto_19395 ?auto_19419 ) ) ( not ( = ?auto_19396 ?auto_19419 ) ) ( not ( = ?auto_19403 ?auto_19427 ) ) ( IS-CRATE ?auto_19395 ) ( not ( = ?auto_19422 ?auto_19402 ) ) ( HOIST-AT ?auto_19430 ?auto_19422 ) ( AVAILABLE ?auto_19430 ) ( SURFACE-AT ?auto_19395 ?auto_19422 ) ( ON ?auto_19395 ?auto_19414 ) ( CLEAR ?auto_19395 ) ( not ( = ?auto_19394 ?auto_19395 ) ) ( not ( = ?auto_19394 ?auto_19414 ) ) ( not ( = ?auto_19395 ?auto_19414 ) ) ( not ( = ?auto_19403 ?auto_19430 ) ) ( IS-CRATE ?auto_19394 ) ( not ( = ?auto_19411 ?auto_19402 ) ) ( HOIST-AT ?auto_19424 ?auto_19411 ) ( AVAILABLE ?auto_19424 ) ( SURFACE-AT ?auto_19394 ?auto_19411 ) ( ON ?auto_19394 ?auto_19428 ) ( CLEAR ?auto_19394 ) ( not ( = ?auto_19393 ?auto_19394 ) ) ( not ( = ?auto_19393 ?auto_19428 ) ) ( not ( = ?auto_19394 ?auto_19428 ) ) ( not ( = ?auto_19403 ?auto_19424 ) ) ( SURFACE-AT ?auto_19392 ?auto_19402 ) ( CLEAR ?auto_19392 ) ( IS-CRATE ?auto_19393 ) ( AVAILABLE ?auto_19403 ) ( not ( = ?auto_19412 ?auto_19402 ) ) ( HOIST-AT ?auto_19429 ?auto_19412 ) ( AVAILABLE ?auto_19429 ) ( SURFACE-AT ?auto_19393 ?auto_19412 ) ( ON ?auto_19393 ?auto_19431 ) ( CLEAR ?auto_19393 ) ( TRUCK-AT ?auto_19404 ?auto_19402 ) ( not ( = ?auto_19392 ?auto_19393 ) ) ( not ( = ?auto_19392 ?auto_19431 ) ) ( not ( = ?auto_19393 ?auto_19431 ) ) ( not ( = ?auto_19403 ?auto_19429 ) ) ( not ( = ?auto_19392 ?auto_19394 ) ) ( not ( = ?auto_19392 ?auto_19428 ) ) ( not ( = ?auto_19394 ?auto_19431 ) ) ( not ( = ?auto_19411 ?auto_19412 ) ) ( not ( = ?auto_19424 ?auto_19429 ) ) ( not ( = ?auto_19428 ?auto_19431 ) ) ( not ( = ?auto_19392 ?auto_19395 ) ) ( not ( = ?auto_19392 ?auto_19414 ) ) ( not ( = ?auto_19393 ?auto_19395 ) ) ( not ( = ?auto_19393 ?auto_19414 ) ) ( not ( = ?auto_19395 ?auto_19428 ) ) ( not ( = ?auto_19395 ?auto_19431 ) ) ( not ( = ?auto_19422 ?auto_19411 ) ) ( not ( = ?auto_19422 ?auto_19412 ) ) ( not ( = ?auto_19430 ?auto_19424 ) ) ( not ( = ?auto_19430 ?auto_19429 ) ) ( not ( = ?auto_19414 ?auto_19428 ) ) ( not ( = ?auto_19414 ?auto_19431 ) ) ( not ( = ?auto_19392 ?auto_19396 ) ) ( not ( = ?auto_19392 ?auto_19419 ) ) ( not ( = ?auto_19393 ?auto_19396 ) ) ( not ( = ?auto_19393 ?auto_19419 ) ) ( not ( = ?auto_19394 ?auto_19396 ) ) ( not ( = ?auto_19394 ?auto_19419 ) ) ( not ( = ?auto_19396 ?auto_19414 ) ) ( not ( = ?auto_19396 ?auto_19428 ) ) ( not ( = ?auto_19396 ?auto_19431 ) ) ( not ( = ?auto_19421 ?auto_19422 ) ) ( not ( = ?auto_19421 ?auto_19411 ) ) ( not ( = ?auto_19421 ?auto_19412 ) ) ( not ( = ?auto_19427 ?auto_19430 ) ) ( not ( = ?auto_19427 ?auto_19424 ) ) ( not ( = ?auto_19427 ?auto_19429 ) ) ( not ( = ?auto_19419 ?auto_19414 ) ) ( not ( = ?auto_19419 ?auto_19428 ) ) ( not ( = ?auto_19419 ?auto_19431 ) ) ( not ( = ?auto_19392 ?auto_19399 ) ) ( not ( = ?auto_19392 ?auto_19420 ) ) ( not ( = ?auto_19393 ?auto_19399 ) ) ( not ( = ?auto_19393 ?auto_19420 ) ) ( not ( = ?auto_19394 ?auto_19399 ) ) ( not ( = ?auto_19394 ?auto_19420 ) ) ( not ( = ?auto_19395 ?auto_19399 ) ) ( not ( = ?auto_19395 ?auto_19420 ) ) ( not ( = ?auto_19399 ?auto_19419 ) ) ( not ( = ?auto_19399 ?auto_19414 ) ) ( not ( = ?auto_19399 ?auto_19428 ) ) ( not ( = ?auto_19399 ?auto_19431 ) ) ( not ( = ?auto_19425 ?auto_19421 ) ) ( not ( = ?auto_19425 ?auto_19422 ) ) ( not ( = ?auto_19425 ?auto_19411 ) ) ( not ( = ?auto_19425 ?auto_19412 ) ) ( not ( = ?auto_19423 ?auto_19427 ) ) ( not ( = ?auto_19423 ?auto_19430 ) ) ( not ( = ?auto_19423 ?auto_19424 ) ) ( not ( = ?auto_19423 ?auto_19429 ) ) ( not ( = ?auto_19420 ?auto_19419 ) ) ( not ( = ?auto_19420 ?auto_19414 ) ) ( not ( = ?auto_19420 ?auto_19428 ) ) ( not ( = ?auto_19420 ?auto_19431 ) ) ( not ( = ?auto_19392 ?auto_19397 ) ) ( not ( = ?auto_19392 ?auto_19415 ) ) ( not ( = ?auto_19393 ?auto_19397 ) ) ( not ( = ?auto_19393 ?auto_19415 ) ) ( not ( = ?auto_19394 ?auto_19397 ) ) ( not ( = ?auto_19394 ?auto_19415 ) ) ( not ( = ?auto_19395 ?auto_19397 ) ) ( not ( = ?auto_19395 ?auto_19415 ) ) ( not ( = ?auto_19396 ?auto_19397 ) ) ( not ( = ?auto_19396 ?auto_19415 ) ) ( not ( = ?auto_19397 ?auto_19420 ) ) ( not ( = ?auto_19397 ?auto_19419 ) ) ( not ( = ?auto_19397 ?auto_19414 ) ) ( not ( = ?auto_19397 ?auto_19428 ) ) ( not ( = ?auto_19397 ?auto_19431 ) ) ( not ( = ?auto_19426 ?auto_19425 ) ) ( not ( = ?auto_19426 ?auto_19421 ) ) ( not ( = ?auto_19426 ?auto_19422 ) ) ( not ( = ?auto_19426 ?auto_19411 ) ) ( not ( = ?auto_19426 ?auto_19412 ) ) ( not ( = ?auto_19418 ?auto_19423 ) ) ( not ( = ?auto_19418 ?auto_19427 ) ) ( not ( = ?auto_19418 ?auto_19430 ) ) ( not ( = ?auto_19418 ?auto_19424 ) ) ( not ( = ?auto_19418 ?auto_19429 ) ) ( not ( = ?auto_19415 ?auto_19420 ) ) ( not ( = ?auto_19415 ?auto_19419 ) ) ( not ( = ?auto_19415 ?auto_19414 ) ) ( not ( = ?auto_19415 ?auto_19428 ) ) ( not ( = ?auto_19415 ?auto_19431 ) ) ( not ( = ?auto_19392 ?auto_19401 ) ) ( not ( = ?auto_19392 ?auto_19413 ) ) ( not ( = ?auto_19393 ?auto_19401 ) ) ( not ( = ?auto_19393 ?auto_19413 ) ) ( not ( = ?auto_19394 ?auto_19401 ) ) ( not ( = ?auto_19394 ?auto_19413 ) ) ( not ( = ?auto_19395 ?auto_19401 ) ) ( not ( = ?auto_19395 ?auto_19413 ) ) ( not ( = ?auto_19396 ?auto_19401 ) ) ( not ( = ?auto_19396 ?auto_19413 ) ) ( not ( = ?auto_19399 ?auto_19401 ) ) ( not ( = ?auto_19399 ?auto_19413 ) ) ( not ( = ?auto_19401 ?auto_19415 ) ) ( not ( = ?auto_19401 ?auto_19420 ) ) ( not ( = ?auto_19401 ?auto_19419 ) ) ( not ( = ?auto_19401 ?auto_19414 ) ) ( not ( = ?auto_19401 ?auto_19428 ) ) ( not ( = ?auto_19401 ?auto_19431 ) ) ( not ( = ?auto_19417 ?auto_19426 ) ) ( not ( = ?auto_19417 ?auto_19425 ) ) ( not ( = ?auto_19417 ?auto_19421 ) ) ( not ( = ?auto_19417 ?auto_19422 ) ) ( not ( = ?auto_19417 ?auto_19411 ) ) ( not ( = ?auto_19417 ?auto_19412 ) ) ( not ( = ?auto_19416 ?auto_19418 ) ) ( not ( = ?auto_19416 ?auto_19423 ) ) ( not ( = ?auto_19416 ?auto_19427 ) ) ( not ( = ?auto_19416 ?auto_19430 ) ) ( not ( = ?auto_19416 ?auto_19424 ) ) ( not ( = ?auto_19416 ?auto_19429 ) ) ( not ( = ?auto_19413 ?auto_19415 ) ) ( not ( = ?auto_19413 ?auto_19420 ) ) ( not ( = ?auto_19413 ?auto_19419 ) ) ( not ( = ?auto_19413 ?auto_19414 ) ) ( not ( = ?auto_19413 ?auto_19428 ) ) ( not ( = ?auto_19413 ?auto_19431 ) ) ( not ( = ?auto_19392 ?auto_19400 ) ) ( not ( = ?auto_19392 ?auto_19408 ) ) ( not ( = ?auto_19393 ?auto_19400 ) ) ( not ( = ?auto_19393 ?auto_19408 ) ) ( not ( = ?auto_19394 ?auto_19400 ) ) ( not ( = ?auto_19394 ?auto_19408 ) ) ( not ( = ?auto_19395 ?auto_19400 ) ) ( not ( = ?auto_19395 ?auto_19408 ) ) ( not ( = ?auto_19396 ?auto_19400 ) ) ( not ( = ?auto_19396 ?auto_19408 ) ) ( not ( = ?auto_19399 ?auto_19400 ) ) ( not ( = ?auto_19399 ?auto_19408 ) ) ( not ( = ?auto_19397 ?auto_19400 ) ) ( not ( = ?auto_19397 ?auto_19408 ) ) ( not ( = ?auto_19400 ?auto_19413 ) ) ( not ( = ?auto_19400 ?auto_19415 ) ) ( not ( = ?auto_19400 ?auto_19420 ) ) ( not ( = ?auto_19400 ?auto_19419 ) ) ( not ( = ?auto_19400 ?auto_19414 ) ) ( not ( = ?auto_19400 ?auto_19428 ) ) ( not ( = ?auto_19400 ?auto_19431 ) ) ( not ( = ?auto_19410 ?auto_19417 ) ) ( not ( = ?auto_19410 ?auto_19426 ) ) ( not ( = ?auto_19410 ?auto_19425 ) ) ( not ( = ?auto_19410 ?auto_19421 ) ) ( not ( = ?auto_19410 ?auto_19422 ) ) ( not ( = ?auto_19410 ?auto_19411 ) ) ( not ( = ?auto_19410 ?auto_19412 ) ) ( not ( = ?auto_19409 ?auto_19416 ) ) ( not ( = ?auto_19409 ?auto_19418 ) ) ( not ( = ?auto_19409 ?auto_19423 ) ) ( not ( = ?auto_19409 ?auto_19427 ) ) ( not ( = ?auto_19409 ?auto_19430 ) ) ( not ( = ?auto_19409 ?auto_19424 ) ) ( not ( = ?auto_19409 ?auto_19429 ) ) ( not ( = ?auto_19408 ?auto_19413 ) ) ( not ( = ?auto_19408 ?auto_19415 ) ) ( not ( = ?auto_19408 ?auto_19420 ) ) ( not ( = ?auto_19408 ?auto_19419 ) ) ( not ( = ?auto_19408 ?auto_19414 ) ) ( not ( = ?auto_19408 ?auto_19428 ) ) ( not ( = ?auto_19408 ?auto_19431 ) ) ( not ( = ?auto_19392 ?auto_19398 ) ) ( not ( = ?auto_19392 ?auto_19406 ) ) ( not ( = ?auto_19393 ?auto_19398 ) ) ( not ( = ?auto_19393 ?auto_19406 ) ) ( not ( = ?auto_19394 ?auto_19398 ) ) ( not ( = ?auto_19394 ?auto_19406 ) ) ( not ( = ?auto_19395 ?auto_19398 ) ) ( not ( = ?auto_19395 ?auto_19406 ) ) ( not ( = ?auto_19396 ?auto_19398 ) ) ( not ( = ?auto_19396 ?auto_19406 ) ) ( not ( = ?auto_19399 ?auto_19398 ) ) ( not ( = ?auto_19399 ?auto_19406 ) ) ( not ( = ?auto_19397 ?auto_19398 ) ) ( not ( = ?auto_19397 ?auto_19406 ) ) ( not ( = ?auto_19401 ?auto_19398 ) ) ( not ( = ?auto_19401 ?auto_19406 ) ) ( not ( = ?auto_19398 ?auto_19408 ) ) ( not ( = ?auto_19398 ?auto_19413 ) ) ( not ( = ?auto_19398 ?auto_19415 ) ) ( not ( = ?auto_19398 ?auto_19420 ) ) ( not ( = ?auto_19398 ?auto_19419 ) ) ( not ( = ?auto_19398 ?auto_19414 ) ) ( not ( = ?auto_19398 ?auto_19428 ) ) ( not ( = ?auto_19398 ?auto_19431 ) ) ( not ( = ?auto_19405 ?auto_19410 ) ) ( not ( = ?auto_19405 ?auto_19417 ) ) ( not ( = ?auto_19405 ?auto_19426 ) ) ( not ( = ?auto_19405 ?auto_19425 ) ) ( not ( = ?auto_19405 ?auto_19421 ) ) ( not ( = ?auto_19405 ?auto_19422 ) ) ( not ( = ?auto_19405 ?auto_19411 ) ) ( not ( = ?auto_19405 ?auto_19412 ) ) ( not ( = ?auto_19407 ?auto_19409 ) ) ( not ( = ?auto_19407 ?auto_19416 ) ) ( not ( = ?auto_19407 ?auto_19418 ) ) ( not ( = ?auto_19407 ?auto_19423 ) ) ( not ( = ?auto_19407 ?auto_19427 ) ) ( not ( = ?auto_19407 ?auto_19430 ) ) ( not ( = ?auto_19407 ?auto_19424 ) ) ( not ( = ?auto_19407 ?auto_19429 ) ) ( not ( = ?auto_19406 ?auto_19408 ) ) ( not ( = ?auto_19406 ?auto_19413 ) ) ( not ( = ?auto_19406 ?auto_19415 ) ) ( not ( = ?auto_19406 ?auto_19420 ) ) ( not ( = ?auto_19406 ?auto_19419 ) ) ( not ( = ?auto_19406 ?auto_19414 ) ) ( not ( = ?auto_19406 ?auto_19428 ) ) ( not ( = ?auto_19406 ?auto_19431 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_19392 ?auto_19393 ?auto_19394 ?auto_19395 ?auto_19396 ?auto_19399 ?auto_19397 ?auto_19401 ?auto_19400 )
      ( MAKE-1CRATE ?auto_19400 ?auto_19398 )
      ( MAKE-9CRATE-VERIFY ?auto_19392 ?auto_19393 ?auto_19394 ?auto_19395 ?auto_19396 ?auto_19399 ?auto_19397 ?auto_19401 ?auto_19400 ?auto_19398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19434 - SURFACE
      ?auto_19435 - SURFACE
    )
    :vars
    (
      ?auto_19436 - HOIST
      ?auto_19437 - PLACE
      ?auto_19439 - PLACE
      ?auto_19440 - HOIST
      ?auto_19441 - SURFACE
      ?auto_19438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19436 ?auto_19437 ) ( SURFACE-AT ?auto_19434 ?auto_19437 ) ( CLEAR ?auto_19434 ) ( IS-CRATE ?auto_19435 ) ( AVAILABLE ?auto_19436 ) ( not ( = ?auto_19439 ?auto_19437 ) ) ( HOIST-AT ?auto_19440 ?auto_19439 ) ( AVAILABLE ?auto_19440 ) ( SURFACE-AT ?auto_19435 ?auto_19439 ) ( ON ?auto_19435 ?auto_19441 ) ( CLEAR ?auto_19435 ) ( TRUCK-AT ?auto_19438 ?auto_19437 ) ( not ( = ?auto_19434 ?auto_19435 ) ) ( not ( = ?auto_19434 ?auto_19441 ) ) ( not ( = ?auto_19435 ?auto_19441 ) ) ( not ( = ?auto_19436 ?auto_19440 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19438 ?auto_19437 ?auto_19439 )
      ( !LIFT ?auto_19440 ?auto_19435 ?auto_19441 ?auto_19439 )
      ( !LOAD ?auto_19440 ?auto_19435 ?auto_19438 ?auto_19439 )
      ( !DRIVE ?auto_19438 ?auto_19439 ?auto_19437 )
      ( !UNLOAD ?auto_19436 ?auto_19435 ?auto_19438 ?auto_19437 )
      ( !DROP ?auto_19436 ?auto_19435 ?auto_19434 ?auto_19437 )
      ( MAKE-1CRATE-VERIFY ?auto_19434 ?auto_19435 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_19453 - SURFACE
      ?auto_19454 - SURFACE
      ?auto_19455 - SURFACE
      ?auto_19456 - SURFACE
      ?auto_19457 - SURFACE
      ?auto_19460 - SURFACE
      ?auto_19458 - SURFACE
      ?auto_19462 - SURFACE
      ?auto_19461 - SURFACE
      ?auto_19459 - SURFACE
      ?auto_19463 - SURFACE
    )
    :vars
    (
      ?auto_19467 - HOIST
      ?auto_19464 - PLACE
      ?auto_19469 - PLACE
      ?auto_19466 - HOIST
      ?auto_19468 - SURFACE
      ?auto_19479 - PLACE
      ?auto_19488 - HOIST
      ?auto_19491 - SURFACE
      ?auto_19477 - PLACE
      ?auto_19494 - HOIST
      ?auto_19482 - SURFACE
      ?auto_19474 - PLACE
      ?auto_19473 - HOIST
      ?auto_19486 - SURFACE
      ?auto_19480 - PLACE
      ?auto_19471 - HOIST
      ?auto_19484 - SURFACE
      ?auto_19496 - PLACE
      ?auto_19489 - HOIST
      ?auto_19492 - SURFACE
      ?auto_19483 - PLACE
      ?auto_19476 - HOIST
      ?auto_19475 - SURFACE
      ?auto_19478 - PLACE
      ?auto_19490 - HOIST
      ?auto_19485 - SURFACE
      ?auto_19495 - PLACE
      ?auto_19472 - HOIST
      ?auto_19470 - SURFACE
      ?auto_19487 - PLACE
      ?auto_19493 - HOIST
      ?auto_19481 - SURFACE
      ?auto_19465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19467 ?auto_19464 ) ( IS-CRATE ?auto_19463 ) ( not ( = ?auto_19469 ?auto_19464 ) ) ( HOIST-AT ?auto_19466 ?auto_19469 ) ( AVAILABLE ?auto_19466 ) ( SURFACE-AT ?auto_19463 ?auto_19469 ) ( ON ?auto_19463 ?auto_19468 ) ( CLEAR ?auto_19463 ) ( not ( = ?auto_19459 ?auto_19463 ) ) ( not ( = ?auto_19459 ?auto_19468 ) ) ( not ( = ?auto_19463 ?auto_19468 ) ) ( not ( = ?auto_19467 ?auto_19466 ) ) ( IS-CRATE ?auto_19459 ) ( not ( = ?auto_19479 ?auto_19464 ) ) ( HOIST-AT ?auto_19488 ?auto_19479 ) ( AVAILABLE ?auto_19488 ) ( SURFACE-AT ?auto_19459 ?auto_19479 ) ( ON ?auto_19459 ?auto_19491 ) ( CLEAR ?auto_19459 ) ( not ( = ?auto_19461 ?auto_19459 ) ) ( not ( = ?auto_19461 ?auto_19491 ) ) ( not ( = ?auto_19459 ?auto_19491 ) ) ( not ( = ?auto_19467 ?auto_19488 ) ) ( IS-CRATE ?auto_19461 ) ( not ( = ?auto_19477 ?auto_19464 ) ) ( HOIST-AT ?auto_19494 ?auto_19477 ) ( AVAILABLE ?auto_19494 ) ( SURFACE-AT ?auto_19461 ?auto_19477 ) ( ON ?auto_19461 ?auto_19482 ) ( CLEAR ?auto_19461 ) ( not ( = ?auto_19462 ?auto_19461 ) ) ( not ( = ?auto_19462 ?auto_19482 ) ) ( not ( = ?auto_19461 ?auto_19482 ) ) ( not ( = ?auto_19467 ?auto_19494 ) ) ( IS-CRATE ?auto_19462 ) ( not ( = ?auto_19474 ?auto_19464 ) ) ( HOIST-AT ?auto_19473 ?auto_19474 ) ( AVAILABLE ?auto_19473 ) ( SURFACE-AT ?auto_19462 ?auto_19474 ) ( ON ?auto_19462 ?auto_19486 ) ( CLEAR ?auto_19462 ) ( not ( = ?auto_19458 ?auto_19462 ) ) ( not ( = ?auto_19458 ?auto_19486 ) ) ( not ( = ?auto_19462 ?auto_19486 ) ) ( not ( = ?auto_19467 ?auto_19473 ) ) ( IS-CRATE ?auto_19458 ) ( not ( = ?auto_19480 ?auto_19464 ) ) ( HOIST-AT ?auto_19471 ?auto_19480 ) ( AVAILABLE ?auto_19471 ) ( SURFACE-AT ?auto_19458 ?auto_19480 ) ( ON ?auto_19458 ?auto_19484 ) ( CLEAR ?auto_19458 ) ( not ( = ?auto_19460 ?auto_19458 ) ) ( not ( = ?auto_19460 ?auto_19484 ) ) ( not ( = ?auto_19458 ?auto_19484 ) ) ( not ( = ?auto_19467 ?auto_19471 ) ) ( IS-CRATE ?auto_19460 ) ( not ( = ?auto_19496 ?auto_19464 ) ) ( HOIST-AT ?auto_19489 ?auto_19496 ) ( AVAILABLE ?auto_19489 ) ( SURFACE-AT ?auto_19460 ?auto_19496 ) ( ON ?auto_19460 ?auto_19492 ) ( CLEAR ?auto_19460 ) ( not ( = ?auto_19457 ?auto_19460 ) ) ( not ( = ?auto_19457 ?auto_19492 ) ) ( not ( = ?auto_19460 ?auto_19492 ) ) ( not ( = ?auto_19467 ?auto_19489 ) ) ( IS-CRATE ?auto_19457 ) ( not ( = ?auto_19483 ?auto_19464 ) ) ( HOIST-AT ?auto_19476 ?auto_19483 ) ( AVAILABLE ?auto_19476 ) ( SURFACE-AT ?auto_19457 ?auto_19483 ) ( ON ?auto_19457 ?auto_19475 ) ( CLEAR ?auto_19457 ) ( not ( = ?auto_19456 ?auto_19457 ) ) ( not ( = ?auto_19456 ?auto_19475 ) ) ( not ( = ?auto_19457 ?auto_19475 ) ) ( not ( = ?auto_19467 ?auto_19476 ) ) ( IS-CRATE ?auto_19456 ) ( not ( = ?auto_19478 ?auto_19464 ) ) ( HOIST-AT ?auto_19490 ?auto_19478 ) ( AVAILABLE ?auto_19490 ) ( SURFACE-AT ?auto_19456 ?auto_19478 ) ( ON ?auto_19456 ?auto_19485 ) ( CLEAR ?auto_19456 ) ( not ( = ?auto_19455 ?auto_19456 ) ) ( not ( = ?auto_19455 ?auto_19485 ) ) ( not ( = ?auto_19456 ?auto_19485 ) ) ( not ( = ?auto_19467 ?auto_19490 ) ) ( IS-CRATE ?auto_19455 ) ( not ( = ?auto_19495 ?auto_19464 ) ) ( HOIST-AT ?auto_19472 ?auto_19495 ) ( AVAILABLE ?auto_19472 ) ( SURFACE-AT ?auto_19455 ?auto_19495 ) ( ON ?auto_19455 ?auto_19470 ) ( CLEAR ?auto_19455 ) ( not ( = ?auto_19454 ?auto_19455 ) ) ( not ( = ?auto_19454 ?auto_19470 ) ) ( not ( = ?auto_19455 ?auto_19470 ) ) ( not ( = ?auto_19467 ?auto_19472 ) ) ( SURFACE-AT ?auto_19453 ?auto_19464 ) ( CLEAR ?auto_19453 ) ( IS-CRATE ?auto_19454 ) ( AVAILABLE ?auto_19467 ) ( not ( = ?auto_19487 ?auto_19464 ) ) ( HOIST-AT ?auto_19493 ?auto_19487 ) ( AVAILABLE ?auto_19493 ) ( SURFACE-AT ?auto_19454 ?auto_19487 ) ( ON ?auto_19454 ?auto_19481 ) ( CLEAR ?auto_19454 ) ( TRUCK-AT ?auto_19465 ?auto_19464 ) ( not ( = ?auto_19453 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19481 ) ) ( not ( = ?auto_19454 ?auto_19481 ) ) ( not ( = ?auto_19467 ?auto_19493 ) ) ( not ( = ?auto_19453 ?auto_19455 ) ) ( not ( = ?auto_19453 ?auto_19470 ) ) ( not ( = ?auto_19455 ?auto_19481 ) ) ( not ( = ?auto_19495 ?auto_19487 ) ) ( not ( = ?auto_19472 ?auto_19493 ) ) ( not ( = ?auto_19470 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19456 ) ) ( not ( = ?auto_19453 ?auto_19485 ) ) ( not ( = ?auto_19454 ?auto_19456 ) ) ( not ( = ?auto_19454 ?auto_19485 ) ) ( not ( = ?auto_19456 ?auto_19470 ) ) ( not ( = ?auto_19456 ?auto_19481 ) ) ( not ( = ?auto_19478 ?auto_19495 ) ) ( not ( = ?auto_19478 ?auto_19487 ) ) ( not ( = ?auto_19490 ?auto_19472 ) ) ( not ( = ?auto_19490 ?auto_19493 ) ) ( not ( = ?auto_19485 ?auto_19470 ) ) ( not ( = ?auto_19485 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19475 ) ) ( not ( = ?auto_19454 ?auto_19457 ) ) ( not ( = ?auto_19454 ?auto_19475 ) ) ( not ( = ?auto_19455 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19475 ) ) ( not ( = ?auto_19457 ?auto_19485 ) ) ( not ( = ?auto_19457 ?auto_19470 ) ) ( not ( = ?auto_19457 ?auto_19481 ) ) ( not ( = ?auto_19483 ?auto_19478 ) ) ( not ( = ?auto_19483 ?auto_19495 ) ) ( not ( = ?auto_19483 ?auto_19487 ) ) ( not ( = ?auto_19476 ?auto_19490 ) ) ( not ( = ?auto_19476 ?auto_19472 ) ) ( not ( = ?auto_19476 ?auto_19493 ) ) ( not ( = ?auto_19475 ?auto_19485 ) ) ( not ( = ?auto_19475 ?auto_19470 ) ) ( not ( = ?auto_19475 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19460 ) ) ( not ( = ?auto_19453 ?auto_19492 ) ) ( not ( = ?auto_19454 ?auto_19460 ) ) ( not ( = ?auto_19454 ?auto_19492 ) ) ( not ( = ?auto_19455 ?auto_19460 ) ) ( not ( = ?auto_19455 ?auto_19492 ) ) ( not ( = ?auto_19456 ?auto_19460 ) ) ( not ( = ?auto_19456 ?auto_19492 ) ) ( not ( = ?auto_19460 ?auto_19475 ) ) ( not ( = ?auto_19460 ?auto_19485 ) ) ( not ( = ?auto_19460 ?auto_19470 ) ) ( not ( = ?auto_19460 ?auto_19481 ) ) ( not ( = ?auto_19496 ?auto_19483 ) ) ( not ( = ?auto_19496 ?auto_19478 ) ) ( not ( = ?auto_19496 ?auto_19495 ) ) ( not ( = ?auto_19496 ?auto_19487 ) ) ( not ( = ?auto_19489 ?auto_19476 ) ) ( not ( = ?auto_19489 ?auto_19490 ) ) ( not ( = ?auto_19489 ?auto_19472 ) ) ( not ( = ?auto_19489 ?auto_19493 ) ) ( not ( = ?auto_19492 ?auto_19475 ) ) ( not ( = ?auto_19492 ?auto_19485 ) ) ( not ( = ?auto_19492 ?auto_19470 ) ) ( not ( = ?auto_19492 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19458 ) ) ( not ( = ?auto_19453 ?auto_19484 ) ) ( not ( = ?auto_19454 ?auto_19458 ) ) ( not ( = ?auto_19454 ?auto_19484 ) ) ( not ( = ?auto_19455 ?auto_19458 ) ) ( not ( = ?auto_19455 ?auto_19484 ) ) ( not ( = ?auto_19456 ?auto_19458 ) ) ( not ( = ?auto_19456 ?auto_19484 ) ) ( not ( = ?auto_19457 ?auto_19458 ) ) ( not ( = ?auto_19457 ?auto_19484 ) ) ( not ( = ?auto_19458 ?auto_19492 ) ) ( not ( = ?auto_19458 ?auto_19475 ) ) ( not ( = ?auto_19458 ?auto_19485 ) ) ( not ( = ?auto_19458 ?auto_19470 ) ) ( not ( = ?auto_19458 ?auto_19481 ) ) ( not ( = ?auto_19480 ?auto_19496 ) ) ( not ( = ?auto_19480 ?auto_19483 ) ) ( not ( = ?auto_19480 ?auto_19478 ) ) ( not ( = ?auto_19480 ?auto_19495 ) ) ( not ( = ?auto_19480 ?auto_19487 ) ) ( not ( = ?auto_19471 ?auto_19489 ) ) ( not ( = ?auto_19471 ?auto_19476 ) ) ( not ( = ?auto_19471 ?auto_19490 ) ) ( not ( = ?auto_19471 ?auto_19472 ) ) ( not ( = ?auto_19471 ?auto_19493 ) ) ( not ( = ?auto_19484 ?auto_19492 ) ) ( not ( = ?auto_19484 ?auto_19475 ) ) ( not ( = ?auto_19484 ?auto_19485 ) ) ( not ( = ?auto_19484 ?auto_19470 ) ) ( not ( = ?auto_19484 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19462 ) ) ( not ( = ?auto_19453 ?auto_19486 ) ) ( not ( = ?auto_19454 ?auto_19462 ) ) ( not ( = ?auto_19454 ?auto_19486 ) ) ( not ( = ?auto_19455 ?auto_19462 ) ) ( not ( = ?auto_19455 ?auto_19486 ) ) ( not ( = ?auto_19456 ?auto_19462 ) ) ( not ( = ?auto_19456 ?auto_19486 ) ) ( not ( = ?auto_19457 ?auto_19462 ) ) ( not ( = ?auto_19457 ?auto_19486 ) ) ( not ( = ?auto_19460 ?auto_19462 ) ) ( not ( = ?auto_19460 ?auto_19486 ) ) ( not ( = ?auto_19462 ?auto_19484 ) ) ( not ( = ?auto_19462 ?auto_19492 ) ) ( not ( = ?auto_19462 ?auto_19475 ) ) ( not ( = ?auto_19462 ?auto_19485 ) ) ( not ( = ?auto_19462 ?auto_19470 ) ) ( not ( = ?auto_19462 ?auto_19481 ) ) ( not ( = ?auto_19474 ?auto_19480 ) ) ( not ( = ?auto_19474 ?auto_19496 ) ) ( not ( = ?auto_19474 ?auto_19483 ) ) ( not ( = ?auto_19474 ?auto_19478 ) ) ( not ( = ?auto_19474 ?auto_19495 ) ) ( not ( = ?auto_19474 ?auto_19487 ) ) ( not ( = ?auto_19473 ?auto_19471 ) ) ( not ( = ?auto_19473 ?auto_19489 ) ) ( not ( = ?auto_19473 ?auto_19476 ) ) ( not ( = ?auto_19473 ?auto_19490 ) ) ( not ( = ?auto_19473 ?auto_19472 ) ) ( not ( = ?auto_19473 ?auto_19493 ) ) ( not ( = ?auto_19486 ?auto_19484 ) ) ( not ( = ?auto_19486 ?auto_19492 ) ) ( not ( = ?auto_19486 ?auto_19475 ) ) ( not ( = ?auto_19486 ?auto_19485 ) ) ( not ( = ?auto_19486 ?auto_19470 ) ) ( not ( = ?auto_19486 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19461 ) ) ( not ( = ?auto_19453 ?auto_19482 ) ) ( not ( = ?auto_19454 ?auto_19461 ) ) ( not ( = ?auto_19454 ?auto_19482 ) ) ( not ( = ?auto_19455 ?auto_19461 ) ) ( not ( = ?auto_19455 ?auto_19482 ) ) ( not ( = ?auto_19456 ?auto_19461 ) ) ( not ( = ?auto_19456 ?auto_19482 ) ) ( not ( = ?auto_19457 ?auto_19461 ) ) ( not ( = ?auto_19457 ?auto_19482 ) ) ( not ( = ?auto_19460 ?auto_19461 ) ) ( not ( = ?auto_19460 ?auto_19482 ) ) ( not ( = ?auto_19458 ?auto_19461 ) ) ( not ( = ?auto_19458 ?auto_19482 ) ) ( not ( = ?auto_19461 ?auto_19486 ) ) ( not ( = ?auto_19461 ?auto_19484 ) ) ( not ( = ?auto_19461 ?auto_19492 ) ) ( not ( = ?auto_19461 ?auto_19475 ) ) ( not ( = ?auto_19461 ?auto_19485 ) ) ( not ( = ?auto_19461 ?auto_19470 ) ) ( not ( = ?auto_19461 ?auto_19481 ) ) ( not ( = ?auto_19477 ?auto_19474 ) ) ( not ( = ?auto_19477 ?auto_19480 ) ) ( not ( = ?auto_19477 ?auto_19496 ) ) ( not ( = ?auto_19477 ?auto_19483 ) ) ( not ( = ?auto_19477 ?auto_19478 ) ) ( not ( = ?auto_19477 ?auto_19495 ) ) ( not ( = ?auto_19477 ?auto_19487 ) ) ( not ( = ?auto_19494 ?auto_19473 ) ) ( not ( = ?auto_19494 ?auto_19471 ) ) ( not ( = ?auto_19494 ?auto_19489 ) ) ( not ( = ?auto_19494 ?auto_19476 ) ) ( not ( = ?auto_19494 ?auto_19490 ) ) ( not ( = ?auto_19494 ?auto_19472 ) ) ( not ( = ?auto_19494 ?auto_19493 ) ) ( not ( = ?auto_19482 ?auto_19486 ) ) ( not ( = ?auto_19482 ?auto_19484 ) ) ( not ( = ?auto_19482 ?auto_19492 ) ) ( not ( = ?auto_19482 ?auto_19475 ) ) ( not ( = ?auto_19482 ?auto_19485 ) ) ( not ( = ?auto_19482 ?auto_19470 ) ) ( not ( = ?auto_19482 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19459 ) ) ( not ( = ?auto_19453 ?auto_19491 ) ) ( not ( = ?auto_19454 ?auto_19459 ) ) ( not ( = ?auto_19454 ?auto_19491 ) ) ( not ( = ?auto_19455 ?auto_19459 ) ) ( not ( = ?auto_19455 ?auto_19491 ) ) ( not ( = ?auto_19456 ?auto_19459 ) ) ( not ( = ?auto_19456 ?auto_19491 ) ) ( not ( = ?auto_19457 ?auto_19459 ) ) ( not ( = ?auto_19457 ?auto_19491 ) ) ( not ( = ?auto_19460 ?auto_19459 ) ) ( not ( = ?auto_19460 ?auto_19491 ) ) ( not ( = ?auto_19458 ?auto_19459 ) ) ( not ( = ?auto_19458 ?auto_19491 ) ) ( not ( = ?auto_19462 ?auto_19459 ) ) ( not ( = ?auto_19462 ?auto_19491 ) ) ( not ( = ?auto_19459 ?auto_19482 ) ) ( not ( = ?auto_19459 ?auto_19486 ) ) ( not ( = ?auto_19459 ?auto_19484 ) ) ( not ( = ?auto_19459 ?auto_19492 ) ) ( not ( = ?auto_19459 ?auto_19475 ) ) ( not ( = ?auto_19459 ?auto_19485 ) ) ( not ( = ?auto_19459 ?auto_19470 ) ) ( not ( = ?auto_19459 ?auto_19481 ) ) ( not ( = ?auto_19479 ?auto_19477 ) ) ( not ( = ?auto_19479 ?auto_19474 ) ) ( not ( = ?auto_19479 ?auto_19480 ) ) ( not ( = ?auto_19479 ?auto_19496 ) ) ( not ( = ?auto_19479 ?auto_19483 ) ) ( not ( = ?auto_19479 ?auto_19478 ) ) ( not ( = ?auto_19479 ?auto_19495 ) ) ( not ( = ?auto_19479 ?auto_19487 ) ) ( not ( = ?auto_19488 ?auto_19494 ) ) ( not ( = ?auto_19488 ?auto_19473 ) ) ( not ( = ?auto_19488 ?auto_19471 ) ) ( not ( = ?auto_19488 ?auto_19489 ) ) ( not ( = ?auto_19488 ?auto_19476 ) ) ( not ( = ?auto_19488 ?auto_19490 ) ) ( not ( = ?auto_19488 ?auto_19472 ) ) ( not ( = ?auto_19488 ?auto_19493 ) ) ( not ( = ?auto_19491 ?auto_19482 ) ) ( not ( = ?auto_19491 ?auto_19486 ) ) ( not ( = ?auto_19491 ?auto_19484 ) ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19475 ) ) ( not ( = ?auto_19491 ?auto_19485 ) ) ( not ( = ?auto_19491 ?auto_19470 ) ) ( not ( = ?auto_19491 ?auto_19481 ) ) ( not ( = ?auto_19453 ?auto_19463 ) ) ( not ( = ?auto_19453 ?auto_19468 ) ) ( not ( = ?auto_19454 ?auto_19463 ) ) ( not ( = ?auto_19454 ?auto_19468 ) ) ( not ( = ?auto_19455 ?auto_19463 ) ) ( not ( = ?auto_19455 ?auto_19468 ) ) ( not ( = ?auto_19456 ?auto_19463 ) ) ( not ( = ?auto_19456 ?auto_19468 ) ) ( not ( = ?auto_19457 ?auto_19463 ) ) ( not ( = ?auto_19457 ?auto_19468 ) ) ( not ( = ?auto_19460 ?auto_19463 ) ) ( not ( = ?auto_19460 ?auto_19468 ) ) ( not ( = ?auto_19458 ?auto_19463 ) ) ( not ( = ?auto_19458 ?auto_19468 ) ) ( not ( = ?auto_19462 ?auto_19463 ) ) ( not ( = ?auto_19462 ?auto_19468 ) ) ( not ( = ?auto_19461 ?auto_19463 ) ) ( not ( = ?auto_19461 ?auto_19468 ) ) ( not ( = ?auto_19463 ?auto_19491 ) ) ( not ( = ?auto_19463 ?auto_19482 ) ) ( not ( = ?auto_19463 ?auto_19486 ) ) ( not ( = ?auto_19463 ?auto_19484 ) ) ( not ( = ?auto_19463 ?auto_19492 ) ) ( not ( = ?auto_19463 ?auto_19475 ) ) ( not ( = ?auto_19463 ?auto_19485 ) ) ( not ( = ?auto_19463 ?auto_19470 ) ) ( not ( = ?auto_19463 ?auto_19481 ) ) ( not ( = ?auto_19469 ?auto_19479 ) ) ( not ( = ?auto_19469 ?auto_19477 ) ) ( not ( = ?auto_19469 ?auto_19474 ) ) ( not ( = ?auto_19469 ?auto_19480 ) ) ( not ( = ?auto_19469 ?auto_19496 ) ) ( not ( = ?auto_19469 ?auto_19483 ) ) ( not ( = ?auto_19469 ?auto_19478 ) ) ( not ( = ?auto_19469 ?auto_19495 ) ) ( not ( = ?auto_19469 ?auto_19487 ) ) ( not ( = ?auto_19466 ?auto_19488 ) ) ( not ( = ?auto_19466 ?auto_19494 ) ) ( not ( = ?auto_19466 ?auto_19473 ) ) ( not ( = ?auto_19466 ?auto_19471 ) ) ( not ( = ?auto_19466 ?auto_19489 ) ) ( not ( = ?auto_19466 ?auto_19476 ) ) ( not ( = ?auto_19466 ?auto_19490 ) ) ( not ( = ?auto_19466 ?auto_19472 ) ) ( not ( = ?auto_19466 ?auto_19493 ) ) ( not ( = ?auto_19468 ?auto_19491 ) ) ( not ( = ?auto_19468 ?auto_19482 ) ) ( not ( = ?auto_19468 ?auto_19486 ) ) ( not ( = ?auto_19468 ?auto_19484 ) ) ( not ( = ?auto_19468 ?auto_19492 ) ) ( not ( = ?auto_19468 ?auto_19475 ) ) ( not ( = ?auto_19468 ?auto_19485 ) ) ( not ( = ?auto_19468 ?auto_19470 ) ) ( not ( = ?auto_19468 ?auto_19481 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_19453 ?auto_19454 ?auto_19455 ?auto_19456 ?auto_19457 ?auto_19460 ?auto_19458 ?auto_19462 ?auto_19461 ?auto_19459 )
      ( MAKE-1CRATE ?auto_19459 ?auto_19463 )
      ( MAKE-10CRATE-VERIFY ?auto_19453 ?auto_19454 ?auto_19455 ?auto_19456 ?auto_19457 ?auto_19460 ?auto_19458 ?auto_19462 ?auto_19461 ?auto_19459 ?auto_19463 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19499 - SURFACE
      ?auto_19500 - SURFACE
    )
    :vars
    (
      ?auto_19501 - HOIST
      ?auto_19502 - PLACE
      ?auto_19504 - PLACE
      ?auto_19505 - HOIST
      ?auto_19506 - SURFACE
      ?auto_19503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19501 ?auto_19502 ) ( SURFACE-AT ?auto_19499 ?auto_19502 ) ( CLEAR ?auto_19499 ) ( IS-CRATE ?auto_19500 ) ( AVAILABLE ?auto_19501 ) ( not ( = ?auto_19504 ?auto_19502 ) ) ( HOIST-AT ?auto_19505 ?auto_19504 ) ( AVAILABLE ?auto_19505 ) ( SURFACE-AT ?auto_19500 ?auto_19504 ) ( ON ?auto_19500 ?auto_19506 ) ( CLEAR ?auto_19500 ) ( TRUCK-AT ?auto_19503 ?auto_19502 ) ( not ( = ?auto_19499 ?auto_19500 ) ) ( not ( = ?auto_19499 ?auto_19506 ) ) ( not ( = ?auto_19500 ?auto_19506 ) ) ( not ( = ?auto_19501 ?auto_19505 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19503 ?auto_19502 ?auto_19504 )
      ( !LIFT ?auto_19505 ?auto_19500 ?auto_19506 ?auto_19504 )
      ( !LOAD ?auto_19505 ?auto_19500 ?auto_19503 ?auto_19504 )
      ( !DRIVE ?auto_19503 ?auto_19504 ?auto_19502 )
      ( !UNLOAD ?auto_19501 ?auto_19500 ?auto_19503 ?auto_19502 )
      ( !DROP ?auto_19501 ?auto_19500 ?auto_19499 ?auto_19502 )
      ( MAKE-1CRATE-VERIFY ?auto_19499 ?auto_19500 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_19519 - SURFACE
      ?auto_19520 - SURFACE
      ?auto_19521 - SURFACE
      ?auto_19522 - SURFACE
      ?auto_19523 - SURFACE
      ?auto_19526 - SURFACE
      ?auto_19524 - SURFACE
      ?auto_19528 - SURFACE
      ?auto_19527 - SURFACE
      ?auto_19525 - SURFACE
      ?auto_19530 - SURFACE
      ?auto_19529 - SURFACE
    )
    :vars
    (
      ?auto_19533 - HOIST
      ?auto_19535 - PLACE
      ?auto_19536 - PLACE
      ?auto_19532 - HOIST
      ?auto_19531 - SURFACE
      ?auto_19551 - PLACE
      ?auto_19544 - HOIST
      ?auto_19562 - SURFACE
      ?auto_19561 - PLACE
      ?auto_19555 - HOIST
      ?auto_19542 - SURFACE
      ?auto_19540 - PLACE
      ?auto_19559 - HOIST
      ?auto_19565 - SURFACE
      ?auto_19549 - PLACE
      ?auto_19554 - HOIST
      ?auto_19545 - SURFACE
      ?auto_19560 - PLACE
      ?auto_19550 - HOIST
      ?auto_19566 - SURFACE
      ?auto_19537 - PLACE
      ?auto_19541 - HOIST
      ?auto_19539 - SURFACE
      ?auto_19564 - PLACE
      ?auto_19556 - HOIST
      ?auto_19552 - SURFACE
      ?auto_19538 - PLACE
      ?auto_19543 - HOIST
      ?auto_19557 - SURFACE
      ?auto_19558 - PLACE
      ?auto_19546 - HOIST
      ?auto_19553 - SURFACE
      ?auto_19548 - PLACE
      ?auto_19563 - HOIST
      ?auto_19547 - SURFACE
      ?auto_19534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19533 ?auto_19535 ) ( IS-CRATE ?auto_19529 ) ( not ( = ?auto_19536 ?auto_19535 ) ) ( HOIST-AT ?auto_19532 ?auto_19536 ) ( AVAILABLE ?auto_19532 ) ( SURFACE-AT ?auto_19529 ?auto_19536 ) ( ON ?auto_19529 ?auto_19531 ) ( CLEAR ?auto_19529 ) ( not ( = ?auto_19530 ?auto_19529 ) ) ( not ( = ?auto_19530 ?auto_19531 ) ) ( not ( = ?auto_19529 ?auto_19531 ) ) ( not ( = ?auto_19533 ?auto_19532 ) ) ( IS-CRATE ?auto_19530 ) ( not ( = ?auto_19551 ?auto_19535 ) ) ( HOIST-AT ?auto_19544 ?auto_19551 ) ( AVAILABLE ?auto_19544 ) ( SURFACE-AT ?auto_19530 ?auto_19551 ) ( ON ?auto_19530 ?auto_19562 ) ( CLEAR ?auto_19530 ) ( not ( = ?auto_19525 ?auto_19530 ) ) ( not ( = ?auto_19525 ?auto_19562 ) ) ( not ( = ?auto_19530 ?auto_19562 ) ) ( not ( = ?auto_19533 ?auto_19544 ) ) ( IS-CRATE ?auto_19525 ) ( not ( = ?auto_19561 ?auto_19535 ) ) ( HOIST-AT ?auto_19555 ?auto_19561 ) ( AVAILABLE ?auto_19555 ) ( SURFACE-AT ?auto_19525 ?auto_19561 ) ( ON ?auto_19525 ?auto_19542 ) ( CLEAR ?auto_19525 ) ( not ( = ?auto_19527 ?auto_19525 ) ) ( not ( = ?auto_19527 ?auto_19542 ) ) ( not ( = ?auto_19525 ?auto_19542 ) ) ( not ( = ?auto_19533 ?auto_19555 ) ) ( IS-CRATE ?auto_19527 ) ( not ( = ?auto_19540 ?auto_19535 ) ) ( HOIST-AT ?auto_19559 ?auto_19540 ) ( AVAILABLE ?auto_19559 ) ( SURFACE-AT ?auto_19527 ?auto_19540 ) ( ON ?auto_19527 ?auto_19565 ) ( CLEAR ?auto_19527 ) ( not ( = ?auto_19528 ?auto_19527 ) ) ( not ( = ?auto_19528 ?auto_19565 ) ) ( not ( = ?auto_19527 ?auto_19565 ) ) ( not ( = ?auto_19533 ?auto_19559 ) ) ( IS-CRATE ?auto_19528 ) ( not ( = ?auto_19549 ?auto_19535 ) ) ( HOIST-AT ?auto_19554 ?auto_19549 ) ( AVAILABLE ?auto_19554 ) ( SURFACE-AT ?auto_19528 ?auto_19549 ) ( ON ?auto_19528 ?auto_19545 ) ( CLEAR ?auto_19528 ) ( not ( = ?auto_19524 ?auto_19528 ) ) ( not ( = ?auto_19524 ?auto_19545 ) ) ( not ( = ?auto_19528 ?auto_19545 ) ) ( not ( = ?auto_19533 ?auto_19554 ) ) ( IS-CRATE ?auto_19524 ) ( not ( = ?auto_19560 ?auto_19535 ) ) ( HOIST-AT ?auto_19550 ?auto_19560 ) ( AVAILABLE ?auto_19550 ) ( SURFACE-AT ?auto_19524 ?auto_19560 ) ( ON ?auto_19524 ?auto_19566 ) ( CLEAR ?auto_19524 ) ( not ( = ?auto_19526 ?auto_19524 ) ) ( not ( = ?auto_19526 ?auto_19566 ) ) ( not ( = ?auto_19524 ?auto_19566 ) ) ( not ( = ?auto_19533 ?auto_19550 ) ) ( IS-CRATE ?auto_19526 ) ( not ( = ?auto_19537 ?auto_19535 ) ) ( HOIST-AT ?auto_19541 ?auto_19537 ) ( AVAILABLE ?auto_19541 ) ( SURFACE-AT ?auto_19526 ?auto_19537 ) ( ON ?auto_19526 ?auto_19539 ) ( CLEAR ?auto_19526 ) ( not ( = ?auto_19523 ?auto_19526 ) ) ( not ( = ?auto_19523 ?auto_19539 ) ) ( not ( = ?auto_19526 ?auto_19539 ) ) ( not ( = ?auto_19533 ?auto_19541 ) ) ( IS-CRATE ?auto_19523 ) ( not ( = ?auto_19564 ?auto_19535 ) ) ( HOIST-AT ?auto_19556 ?auto_19564 ) ( AVAILABLE ?auto_19556 ) ( SURFACE-AT ?auto_19523 ?auto_19564 ) ( ON ?auto_19523 ?auto_19552 ) ( CLEAR ?auto_19523 ) ( not ( = ?auto_19522 ?auto_19523 ) ) ( not ( = ?auto_19522 ?auto_19552 ) ) ( not ( = ?auto_19523 ?auto_19552 ) ) ( not ( = ?auto_19533 ?auto_19556 ) ) ( IS-CRATE ?auto_19522 ) ( not ( = ?auto_19538 ?auto_19535 ) ) ( HOIST-AT ?auto_19543 ?auto_19538 ) ( AVAILABLE ?auto_19543 ) ( SURFACE-AT ?auto_19522 ?auto_19538 ) ( ON ?auto_19522 ?auto_19557 ) ( CLEAR ?auto_19522 ) ( not ( = ?auto_19521 ?auto_19522 ) ) ( not ( = ?auto_19521 ?auto_19557 ) ) ( not ( = ?auto_19522 ?auto_19557 ) ) ( not ( = ?auto_19533 ?auto_19543 ) ) ( IS-CRATE ?auto_19521 ) ( not ( = ?auto_19558 ?auto_19535 ) ) ( HOIST-AT ?auto_19546 ?auto_19558 ) ( AVAILABLE ?auto_19546 ) ( SURFACE-AT ?auto_19521 ?auto_19558 ) ( ON ?auto_19521 ?auto_19553 ) ( CLEAR ?auto_19521 ) ( not ( = ?auto_19520 ?auto_19521 ) ) ( not ( = ?auto_19520 ?auto_19553 ) ) ( not ( = ?auto_19521 ?auto_19553 ) ) ( not ( = ?auto_19533 ?auto_19546 ) ) ( SURFACE-AT ?auto_19519 ?auto_19535 ) ( CLEAR ?auto_19519 ) ( IS-CRATE ?auto_19520 ) ( AVAILABLE ?auto_19533 ) ( not ( = ?auto_19548 ?auto_19535 ) ) ( HOIST-AT ?auto_19563 ?auto_19548 ) ( AVAILABLE ?auto_19563 ) ( SURFACE-AT ?auto_19520 ?auto_19548 ) ( ON ?auto_19520 ?auto_19547 ) ( CLEAR ?auto_19520 ) ( TRUCK-AT ?auto_19534 ?auto_19535 ) ( not ( = ?auto_19519 ?auto_19520 ) ) ( not ( = ?auto_19519 ?auto_19547 ) ) ( not ( = ?auto_19520 ?auto_19547 ) ) ( not ( = ?auto_19533 ?auto_19563 ) ) ( not ( = ?auto_19519 ?auto_19521 ) ) ( not ( = ?auto_19519 ?auto_19553 ) ) ( not ( = ?auto_19521 ?auto_19547 ) ) ( not ( = ?auto_19558 ?auto_19548 ) ) ( not ( = ?auto_19546 ?auto_19563 ) ) ( not ( = ?auto_19553 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19522 ) ) ( not ( = ?auto_19519 ?auto_19557 ) ) ( not ( = ?auto_19520 ?auto_19522 ) ) ( not ( = ?auto_19520 ?auto_19557 ) ) ( not ( = ?auto_19522 ?auto_19553 ) ) ( not ( = ?auto_19522 ?auto_19547 ) ) ( not ( = ?auto_19538 ?auto_19558 ) ) ( not ( = ?auto_19538 ?auto_19548 ) ) ( not ( = ?auto_19543 ?auto_19546 ) ) ( not ( = ?auto_19543 ?auto_19563 ) ) ( not ( = ?auto_19557 ?auto_19553 ) ) ( not ( = ?auto_19557 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19523 ) ) ( not ( = ?auto_19519 ?auto_19552 ) ) ( not ( = ?auto_19520 ?auto_19523 ) ) ( not ( = ?auto_19520 ?auto_19552 ) ) ( not ( = ?auto_19521 ?auto_19523 ) ) ( not ( = ?auto_19521 ?auto_19552 ) ) ( not ( = ?auto_19523 ?auto_19557 ) ) ( not ( = ?auto_19523 ?auto_19553 ) ) ( not ( = ?auto_19523 ?auto_19547 ) ) ( not ( = ?auto_19564 ?auto_19538 ) ) ( not ( = ?auto_19564 ?auto_19558 ) ) ( not ( = ?auto_19564 ?auto_19548 ) ) ( not ( = ?auto_19556 ?auto_19543 ) ) ( not ( = ?auto_19556 ?auto_19546 ) ) ( not ( = ?auto_19556 ?auto_19563 ) ) ( not ( = ?auto_19552 ?auto_19557 ) ) ( not ( = ?auto_19552 ?auto_19553 ) ) ( not ( = ?auto_19552 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19526 ) ) ( not ( = ?auto_19519 ?auto_19539 ) ) ( not ( = ?auto_19520 ?auto_19526 ) ) ( not ( = ?auto_19520 ?auto_19539 ) ) ( not ( = ?auto_19521 ?auto_19526 ) ) ( not ( = ?auto_19521 ?auto_19539 ) ) ( not ( = ?auto_19522 ?auto_19526 ) ) ( not ( = ?auto_19522 ?auto_19539 ) ) ( not ( = ?auto_19526 ?auto_19552 ) ) ( not ( = ?auto_19526 ?auto_19557 ) ) ( not ( = ?auto_19526 ?auto_19553 ) ) ( not ( = ?auto_19526 ?auto_19547 ) ) ( not ( = ?auto_19537 ?auto_19564 ) ) ( not ( = ?auto_19537 ?auto_19538 ) ) ( not ( = ?auto_19537 ?auto_19558 ) ) ( not ( = ?auto_19537 ?auto_19548 ) ) ( not ( = ?auto_19541 ?auto_19556 ) ) ( not ( = ?auto_19541 ?auto_19543 ) ) ( not ( = ?auto_19541 ?auto_19546 ) ) ( not ( = ?auto_19541 ?auto_19563 ) ) ( not ( = ?auto_19539 ?auto_19552 ) ) ( not ( = ?auto_19539 ?auto_19557 ) ) ( not ( = ?auto_19539 ?auto_19553 ) ) ( not ( = ?auto_19539 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19524 ) ) ( not ( = ?auto_19519 ?auto_19566 ) ) ( not ( = ?auto_19520 ?auto_19524 ) ) ( not ( = ?auto_19520 ?auto_19566 ) ) ( not ( = ?auto_19521 ?auto_19524 ) ) ( not ( = ?auto_19521 ?auto_19566 ) ) ( not ( = ?auto_19522 ?auto_19524 ) ) ( not ( = ?auto_19522 ?auto_19566 ) ) ( not ( = ?auto_19523 ?auto_19524 ) ) ( not ( = ?auto_19523 ?auto_19566 ) ) ( not ( = ?auto_19524 ?auto_19539 ) ) ( not ( = ?auto_19524 ?auto_19552 ) ) ( not ( = ?auto_19524 ?auto_19557 ) ) ( not ( = ?auto_19524 ?auto_19553 ) ) ( not ( = ?auto_19524 ?auto_19547 ) ) ( not ( = ?auto_19560 ?auto_19537 ) ) ( not ( = ?auto_19560 ?auto_19564 ) ) ( not ( = ?auto_19560 ?auto_19538 ) ) ( not ( = ?auto_19560 ?auto_19558 ) ) ( not ( = ?auto_19560 ?auto_19548 ) ) ( not ( = ?auto_19550 ?auto_19541 ) ) ( not ( = ?auto_19550 ?auto_19556 ) ) ( not ( = ?auto_19550 ?auto_19543 ) ) ( not ( = ?auto_19550 ?auto_19546 ) ) ( not ( = ?auto_19550 ?auto_19563 ) ) ( not ( = ?auto_19566 ?auto_19539 ) ) ( not ( = ?auto_19566 ?auto_19552 ) ) ( not ( = ?auto_19566 ?auto_19557 ) ) ( not ( = ?auto_19566 ?auto_19553 ) ) ( not ( = ?auto_19566 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19528 ) ) ( not ( = ?auto_19519 ?auto_19545 ) ) ( not ( = ?auto_19520 ?auto_19528 ) ) ( not ( = ?auto_19520 ?auto_19545 ) ) ( not ( = ?auto_19521 ?auto_19528 ) ) ( not ( = ?auto_19521 ?auto_19545 ) ) ( not ( = ?auto_19522 ?auto_19528 ) ) ( not ( = ?auto_19522 ?auto_19545 ) ) ( not ( = ?auto_19523 ?auto_19528 ) ) ( not ( = ?auto_19523 ?auto_19545 ) ) ( not ( = ?auto_19526 ?auto_19528 ) ) ( not ( = ?auto_19526 ?auto_19545 ) ) ( not ( = ?auto_19528 ?auto_19566 ) ) ( not ( = ?auto_19528 ?auto_19539 ) ) ( not ( = ?auto_19528 ?auto_19552 ) ) ( not ( = ?auto_19528 ?auto_19557 ) ) ( not ( = ?auto_19528 ?auto_19553 ) ) ( not ( = ?auto_19528 ?auto_19547 ) ) ( not ( = ?auto_19549 ?auto_19560 ) ) ( not ( = ?auto_19549 ?auto_19537 ) ) ( not ( = ?auto_19549 ?auto_19564 ) ) ( not ( = ?auto_19549 ?auto_19538 ) ) ( not ( = ?auto_19549 ?auto_19558 ) ) ( not ( = ?auto_19549 ?auto_19548 ) ) ( not ( = ?auto_19554 ?auto_19550 ) ) ( not ( = ?auto_19554 ?auto_19541 ) ) ( not ( = ?auto_19554 ?auto_19556 ) ) ( not ( = ?auto_19554 ?auto_19543 ) ) ( not ( = ?auto_19554 ?auto_19546 ) ) ( not ( = ?auto_19554 ?auto_19563 ) ) ( not ( = ?auto_19545 ?auto_19566 ) ) ( not ( = ?auto_19545 ?auto_19539 ) ) ( not ( = ?auto_19545 ?auto_19552 ) ) ( not ( = ?auto_19545 ?auto_19557 ) ) ( not ( = ?auto_19545 ?auto_19553 ) ) ( not ( = ?auto_19545 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19527 ) ) ( not ( = ?auto_19519 ?auto_19565 ) ) ( not ( = ?auto_19520 ?auto_19527 ) ) ( not ( = ?auto_19520 ?auto_19565 ) ) ( not ( = ?auto_19521 ?auto_19527 ) ) ( not ( = ?auto_19521 ?auto_19565 ) ) ( not ( = ?auto_19522 ?auto_19527 ) ) ( not ( = ?auto_19522 ?auto_19565 ) ) ( not ( = ?auto_19523 ?auto_19527 ) ) ( not ( = ?auto_19523 ?auto_19565 ) ) ( not ( = ?auto_19526 ?auto_19527 ) ) ( not ( = ?auto_19526 ?auto_19565 ) ) ( not ( = ?auto_19524 ?auto_19527 ) ) ( not ( = ?auto_19524 ?auto_19565 ) ) ( not ( = ?auto_19527 ?auto_19545 ) ) ( not ( = ?auto_19527 ?auto_19566 ) ) ( not ( = ?auto_19527 ?auto_19539 ) ) ( not ( = ?auto_19527 ?auto_19552 ) ) ( not ( = ?auto_19527 ?auto_19557 ) ) ( not ( = ?auto_19527 ?auto_19553 ) ) ( not ( = ?auto_19527 ?auto_19547 ) ) ( not ( = ?auto_19540 ?auto_19549 ) ) ( not ( = ?auto_19540 ?auto_19560 ) ) ( not ( = ?auto_19540 ?auto_19537 ) ) ( not ( = ?auto_19540 ?auto_19564 ) ) ( not ( = ?auto_19540 ?auto_19538 ) ) ( not ( = ?auto_19540 ?auto_19558 ) ) ( not ( = ?auto_19540 ?auto_19548 ) ) ( not ( = ?auto_19559 ?auto_19554 ) ) ( not ( = ?auto_19559 ?auto_19550 ) ) ( not ( = ?auto_19559 ?auto_19541 ) ) ( not ( = ?auto_19559 ?auto_19556 ) ) ( not ( = ?auto_19559 ?auto_19543 ) ) ( not ( = ?auto_19559 ?auto_19546 ) ) ( not ( = ?auto_19559 ?auto_19563 ) ) ( not ( = ?auto_19565 ?auto_19545 ) ) ( not ( = ?auto_19565 ?auto_19566 ) ) ( not ( = ?auto_19565 ?auto_19539 ) ) ( not ( = ?auto_19565 ?auto_19552 ) ) ( not ( = ?auto_19565 ?auto_19557 ) ) ( not ( = ?auto_19565 ?auto_19553 ) ) ( not ( = ?auto_19565 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19525 ) ) ( not ( = ?auto_19519 ?auto_19542 ) ) ( not ( = ?auto_19520 ?auto_19525 ) ) ( not ( = ?auto_19520 ?auto_19542 ) ) ( not ( = ?auto_19521 ?auto_19525 ) ) ( not ( = ?auto_19521 ?auto_19542 ) ) ( not ( = ?auto_19522 ?auto_19525 ) ) ( not ( = ?auto_19522 ?auto_19542 ) ) ( not ( = ?auto_19523 ?auto_19525 ) ) ( not ( = ?auto_19523 ?auto_19542 ) ) ( not ( = ?auto_19526 ?auto_19525 ) ) ( not ( = ?auto_19526 ?auto_19542 ) ) ( not ( = ?auto_19524 ?auto_19525 ) ) ( not ( = ?auto_19524 ?auto_19542 ) ) ( not ( = ?auto_19528 ?auto_19525 ) ) ( not ( = ?auto_19528 ?auto_19542 ) ) ( not ( = ?auto_19525 ?auto_19565 ) ) ( not ( = ?auto_19525 ?auto_19545 ) ) ( not ( = ?auto_19525 ?auto_19566 ) ) ( not ( = ?auto_19525 ?auto_19539 ) ) ( not ( = ?auto_19525 ?auto_19552 ) ) ( not ( = ?auto_19525 ?auto_19557 ) ) ( not ( = ?auto_19525 ?auto_19553 ) ) ( not ( = ?auto_19525 ?auto_19547 ) ) ( not ( = ?auto_19561 ?auto_19540 ) ) ( not ( = ?auto_19561 ?auto_19549 ) ) ( not ( = ?auto_19561 ?auto_19560 ) ) ( not ( = ?auto_19561 ?auto_19537 ) ) ( not ( = ?auto_19561 ?auto_19564 ) ) ( not ( = ?auto_19561 ?auto_19538 ) ) ( not ( = ?auto_19561 ?auto_19558 ) ) ( not ( = ?auto_19561 ?auto_19548 ) ) ( not ( = ?auto_19555 ?auto_19559 ) ) ( not ( = ?auto_19555 ?auto_19554 ) ) ( not ( = ?auto_19555 ?auto_19550 ) ) ( not ( = ?auto_19555 ?auto_19541 ) ) ( not ( = ?auto_19555 ?auto_19556 ) ) ( not ( = ?auto_19555 ?auto_19543 ) ) ( not ( = ?auto_19555 ?auto_19546 ) ) ( not ( = ?auto_19555 ?auto_19563 ) ) ( not ( = ?auto_19542 ?auto_19565 ) ) ( not ( = ?auto_19542 ?auto_19545 ) ) ( not ( = ?auto_19542 ?auto_19566 ) ) ( not ( = ?auto_19542 ?auto_19539 ) ) ( not ( = ?auto_19542 ?auto_19552 ) ) ( not ( = ?auto_19542 ?auto_19557 ) ) ( not ( = ?auto_19542 ?auto_19553 ) ) ( not ( = ?auto_19542 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19530 ) ) ( not ( = ?auto_19519 ?auto_19562 ) ) ( not ( = ?auto_19520 ?auto_19530 ) ) ( not ( = ?auto_19520 ?auto_19562 ) ) ( not ( = ?auto_19521 ?auto_19530 ) ) ( not ( = ?auto_19521 ?auto_19562 ) ) ( not ( = ?auto_19522 ?auto_19530 ) ) ( not ( = ?auto_19522 ?auto_19562 ) ) ( not ( = ?auto_19523 ?auto_19530 ) ) ( not ( = ?auto_19523 ?auto_19562 ) ) ( not ( = ?auto_19526 ?auto_19530 ) ) ( not ( = ?auto_19526 ?auto_19562 ) ) ( not ( = ?auto_19524 ?auto_19530 ) ) ( not ( = ?auto_19524 ?auto_19562 ) ) ( not ( = ?auto_19528 ?auto_19530 ) ) ( not ( = ?auto_19528 ?auto_19562 ) ) ( not ( = ?auto_19527 ?auto_19530 ) ) ( not ( = ?auto_19527 ?auto_19562 ) ) ( not ( = ?auto_19530 ?auto_19542 ) ) ( not ( = ?auto_19530 ?auto_19565 ) ) ( not ( = ?auto_19530 ?auto_19545 ) ) ( not ( = ?auto_19530 ?auto_19566 ) ) ( not ( = ?auto_19530 ?auto_19539 ) ) ( not ( = ?auto_19530 ?auto_19552 ) ) ( not ( = ?auto_19530 ?auto_19557 ) ) ( not ( = ?auto_19530 ?auto_19553 ) ) ( not ( = ?auto_19530 ?auto_19547 ) ) ( not ( = ?auto_19551 ?auto_19561 ) ) ( not ( = ?auto_19551 ?auto_19540 ) ) ( not ( = ?auto_19551 ?auto_19549 ) ) ( not ( = ?auto_19551 ?auto_19560 ) ) ( not ( = ?auto_19551 ?auto_19537 ) ) ( not ( = ?auto_19551 ?auto_19564 ) ) ( not ( = ?auto_19551 ?auto_19538 ) ) ( not ( = ?auto_19551 ?auto_19558 ) ) ( not ( = ?auto_19551 ?auto_19548 ) ) ( not ( = ?auto_19544 ?auto_19555 ) ) ( not ( = ?auto_19544 ?auto_19559 ) ) ( not ( = ?auto_19544 ?auto_19554 ) ) ( not ( = ?auto_19544 ?auto_19550 ) ) ( not ( = ?auto_19544 ?auto_19541 ) ) ( not ( = ?auto_19544 ?auto_19556 ) ) ( not ( = ?auto_19544 ?auto_19543 ) ) ( not ( = ?auto_19544 ?auto_19546 ) ) ( not ( = ?auto_19544 ?auto_19563 ) ) ( not ( = ?auto_19562 ?auto_19542 ) ) ( not ( = ?auto_19562 ?auto_19565 ) ) ( not ( = ?auto_19562 ?auto_19545 ) ) ( not ( = ?auto_19562 ?auto_19566 ) ) ( not ( = ?auto_19562 ?auto_19539 ) ) ( not ( = ?auto_19562 ?auto_19552 ) ) ( not ( = ?auto_19562 ?auto_19557 ) ) ( not ( = ?auto_19562 ?auto_19553 ) ) ( not ( = ?auto_19562 ?auto_19547 ) ) ( not ( = ?auto_19519 ?auto_19529 ) ) ( not ( = ?auto_19519 ?auto_19531 ) ) ( not ( = ?auto_19520 ?auto_19529 ) ) ( not ( = ?auto_19520 ?auto_19531 ) ) ( not ( = ?auto_19521 ?auto_19529 ) ) ( not ( = ?auto_19521 ?auto_19531 ) ) ( not ( = ?auto_19522 ?auto_19529 ) ) ( not ( = ?auto_19522 ?auto_19531 ) ) ( not ( = ?auto_19523 ?auto_19529 ) ) ( not ( = ?auto_19523 ?auto_19531 ) ) ( not ( = ?auto_19526 ?auto_19529 ) ) ( not ( = ?auto_19526 ?auto_19531 ) ) ( not ( = ?auto_19524 ?auto_19529 ) ) ( not ( = ?auto_19524 ?auto_19531 ) ) ( not ( = ?auto_19528 ?auto_19529 ) ) ( not ( = ?auto_19528 ?auto_19531 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19527 ?auto_19531 ) ) ( not ( = ?auto_19525 ?auto_19529 ) ) ( not ( = ?auto_19525 ?auto_19531 ) ) ( not ( = ?auto_19529 ?auto_19562 ) ) ( not ( = ?auto_19529 ?auto_19542 ) ) ( not ( = ?auto_19529 ?auto_19565 ) ) ( not ( = ?auto_19529 ?auto_19545 ) ) ( not ( = ?auto_19529 ?auto_19566 ) ) ( not ( = ?auto_19529 ?auto_19539 ) ) ( not ( = ?auto_19529 ?auto_19552 ) ) ( not ( = ?auto_19529 ?auto_19557 ) ) ( not ( = ?auto_19529 ?auto_19553 ) ) ( not ( = ?auto_19529 ?auto_19547 ) ) ( not ( = ?auto_19536 ?auto_19551 ) ) ( not ( = ?auto_19536 ?auto_19561 ) ) ( not ( = ?auto_19536 ?auto_19540 ) ) ( not ( = ?auto_19536 ?auto_19549 ) ) ( not ( = ?auto_19536 ?auto_19560 ) ) ( not ( = ?auto_19536 ?auto_19537 ) ) ( not ( = ?auto_19536 ?auto_19564 ) ) ( not ( = ?auto_19536 ?auto_19538 ) ) ( not ( = ?auto_19536 ?auto_19558 ) ) ( not ( = ?auto_19536 ?auto_19548 ) ) ( not ( = ?auto_19532 ?auto_19544 ) ) ( not ( = ?auto_19532 ?auto_19555 ) ) ( not ( = ?auto_19532 ?auto_19559 ) ) ( not ( = ?auto_19532 ?auto_19554 ) ) ( not ( = ?auto_19532 ?auto_19550 ) ) ( not ( = ?auto_19532 ?auto_19541 ) ) ( not ( = ?auto_19532 ?auto_19556 ) ) ( not ( = ?auto_19532 ?auto_19543 ) ) ( not ( = ?auto_19532 ?auto_19546 ) ) ( not ( = ?auto_19532 ?auto_19563 ) ) ( not ( = ?auto_19531 ?auto_19562 ) ) ( not ( = ?auto_19531 ?auto_19542 ) ) ( not ( = ?auto_19531 ?auto_19565 ) ) ( not ( = ?auto_19531 ?auto_19545 ) ) ( not ( = ?auto_19531 ?auto_19566 ) ) ( not ( = ?auto_19531 ?auto_19539 ) ) ( not ( = ?auto_19531 ?auto_19552 ) ) ( not ( = ?auto_19531 ?auto_19557 ) ) ( not ( = ?auto_19531 ?auto_19553 ) ) ( not ( = ?auto_19531 ?auto_19547 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_19519 ?auto_19520 ?auto_19521 ?auto_19522 ?auto_19523 ?auto_19526 ?auto_19524 ?auto_19528 ?auto_19527 ?auto_19525 ?auto_19530 )
      ( MAKE-1CRATE ?auto_19530 ?auto_19529 )
      ( MAKE-11CRATE-VERIFY ?auto_19519 ?auto_19520 ?auto_19521 ?auto_19522 ?auto_19523 ?auto_19526 ?auto_19524 ?auto_19528 ?auto_19527 ?auto_19525 ?auto_19530 ?auto_19529 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19569 - SURFACE
      ?auto_19570 - SURFACE
    )
    :vars
    (
      ?auto_19571 - HOIST
      ?auto_19572 - PLACE
      ?auto_19574 - PLACE
      ?auto_19575 - HOIST
      ?auto_19576 - SURFACE
      ?auto_19573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19571 ?auto_19572 ) ( SURFACE-AT ?auto_19569 ?auto_19572 ) ( CLEAR ?auto_19569 ) ( IS-CRATE ?auto_19570 ) ( AVAILABLE ?auto_19571 ) ( not ( = ?auto_19574 ?auto_19572 ) ) ( HOIST-AT ?auto_19575 ?auto_19574 ) ( AVAILABLE ?auto_19575 ) ( SURFACE-AT ?auto_19570 ?auto_19574 ) ( ON ?auto_19570 ?auto_19576 ) ( CLEAR ?auto_19570 ) ( TRUCK-AT ?auto_19573 ?auto_19572 ) ( not ( = ?auto_19569 ?auto_19570 ) ) ( not ( = ?auto_19569 ?auto_19576 ) ) ( not ( = ?auto_19570 ?auto_19576 ) ) ( not ( = ?auto_19571 ?auto_19575 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19573 ?auto_19572 ?auto_19574 )
      ( !LIFT ?auto_19575 ?auto_19570 ?auto_19576 ?auto_19574 )
      ( !LOAD ?auto_19575 ?auto_19570 ?auto_19573 ?auto_19574 )
      ( !DRIVE ?auto_19573 ?auto_19574 ?auto_19572 )
      ( !UNLOAD ?auto_19571 ?auto_19570 ?auto_19573 ?auto_19572 )
      ( !DROP ?auto_19571 ?auto_19570 ?auto_19569 ?auto_19572 )
      ( MAKE-1CRATE-VERIFY ?auto_19569 ?auto_19570 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_19590 - SURFACE
      ?auto_19591 - SURFACE
      ?auto_19592 - SURFACE
      ?auto_19593 - SURFACE
      ?auto_19594 - SURFACE
      ?auto_19597 - SURFACE
      ?auto_19595 - SURFACE
      ?auto_19599 - SURFACE
      ?auto_19598 - SURFACE
      ?auto_19596 - SURFACE
      ?auto_19601 - SURFACE
      ?auto_19600 - SURFACE
      ?auto_19602 - SURFACE
    )
    :vars
    (
      ?auto_19604 - HOIST
      ?auto_19608 - PLACE
      ?auto_19605 - PLACE
      ?auto_19603 - HOIST
      ?auto_19606 - SURFACE
      ?auto_19625 - PLACE
      ?auto_19630 - HOIST
      ?auto_19615 - SURFACE
      ?auto_19613 - PLACE
      ?auto_19610 - HOIST
      ?auto_19611 - SURFACE
      ?auto_19620 - PLACE
      ?auto_19636 - HOIST
      ?auto_19632 - SURFACE
      ?auto_19635 - PLACE
      ?auto_19634 - HOIST
      ?auto_19609 - SURFACE
      ?auto_19612 - PLACE
      ?auto_19624 - HOIST
      ?auto_19627 - SURFACE
      ?auto_19621 - PLACE
      ?auto_19619 - HOIST
      ?auto_19637 - SURFACE
      ?auto_19633 - PLACE
      ?auto_19618 - HOIST
      ?auto_19622 - SURFACE
      ?auto_19631 - PLACE
      ?auto_19641 - HOIST
      ?auto_19629 - SURFACE
      ?auto_19639 - PLACE
      ?auto_19638 - HOIST
      ?auto_19614 - SURFACE
      ?auto_19628 - PLACE
      ?auto_19617 - HOIST
      ?auto_19623 - SURFACE
      ?auto_19640 - PLACE
      ?auto_19626 - HOIST
      ?auto_19616 - SURFACE
      ?auto_19607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19604 ?auto_19608 ) ( IS-CRATE ?auto_19602 ) ( not ( = ?auto_19605 ?auto_19608 ) ) ( HOIST-AT ?auto_19603 ?auto_19605 ) ( AVAILABLE ?auto_19603 ) ( SURFACE-AT ?auto_19602 ?auto_19605 ) ( ON ?auto_19602 ?auto_19606 ) ( CLEAR ?auto_19602 ) ( not ( = ?auto_19600 ?auto_19602 ) ) ( not ( = ?auto_19600 ?auto_19606 ) ) ( not ( = ?auto_19602 ?auto_19606 ) ) ( not ( = ?auto_19604 ?auto_19603 ) ) ( IS-CRATE ?auto_19600 ) ( not ( = ?auto_19625 ?auto_19608 ) ) ( HOIST-AT ?auto_19630 ?auto_19625 ) ( AVAILABLE ?auto_19630 ) ( SURFACE-AT ?auto_19600 ?auto_19625 ) ( ON ?auto_19600 ?auto_19615 ) ( CLEAR ?auto_19600 ) ( not ( = ?auto_19601 ?auto_19600 ) ) ( not ( = ?auto_19601 ?auto_19615 ) ) ( not ( = ?auto_19600 ?auto_19615 ) ) ( not ( = ?auto_19604 ?auto_19630 ) ) ( IS-CRATE ?auto_19601 ) ( not ( = ?auto_19613 ?auto_19608 ) ) ( HOIST-AT ?auto_19610 ?auto_19613 ) ( AVAILABLE ?auto_19610 ) ( SURFACE-AT ?auto_19601 ?auto_19613 ) ( ON ?auto_19601 ?auto_19611 ) ( CLEAR ?auto_19601 ) ( not ( = ?auto_19596 ?auto_19601 ) ) ( not ( = ?auto_19596 ?auto_19611 ) ) ( not ( = ?auto_19601 ?auto_19611 ) ) ( not ( = ?auto_19604 ?auto_19610 ) ) ( IS-CRATE ?auto_19596 ) ( not ( = ?auto_19620 ?auto_19608 ) ) ( HOIST-AT ?auto_19636 ?auto_19620 ) ( AVAILABLE ?auto_19636 ) ( SURFACE-AT ?auto_19596 ?auto_19620 ) ( ON ?auto_19596 ?auto_19632 ) ( CLEAR ?auto_19596 ) ( not ( = ?auto_19598 ?auto_19596 ) ) ( not ( = ?auto_19598 ?auto_19632 ) ) ( not ( = ?auto_19596 ?auto_19632 ) ) ( not ( = ?auto_19604 ?auto_19636 ) ) ( IS-CRATE ?auto_19598 ) ( not ( = ?auto_19635 ?auto_19608 ) ) ( HOIST-AT ?auto_19634 ?auto_19635 ) ( AVAILABLE ?auto_19634 ) ( SURFACE-AT ?auto_19598 ?auto_19635 ) ( ON ?auto_19598 ?auto_19609 ) ( CLEAR ?auto_19598 ) ( not ( = ?auto_19599 ?auto_19598 ) ) ( not ( = ?auto_19599 ?auto_19609 ) ) ( not ( = ?auto_19598 ?auto_19609 ) ) ( not ( = ?auto_19604 ?auto_19634 ) ) ( IS-CRATE ?auto_19599 ) ( not ( = ?auto_19612 ?auto_19608 ) ) ( HOIST-AT ?auto_19624 ?auto_19612 ) ( AVAILABLE ?auto_19624 ) ( SURFACE-AT ?auto_19599 ?auto_19612 ) ( ON ?auto_19599 ?auto_19627 ) ( CLEAR ?auto_19599 ) ( not ( = ?auto_19595 ?auto_19599 ) ) ( not ( = ?auto_19595 ?auto_19627 ) ) ( not ( = ?auto_19599 ?auto_19627 ) ) ( not ( = ?auto_19604 ?auto_19624 ) ) ( IS-CRATE ?auto_19595 ) ( not ( = ?auto_19621 ?auto_19608 ) ) ( HOIST-AT ?auto_19619 ?auto_19621 ) ( AVAILABLE ?auto_19619 ) ( SURFACE-AT ?auto_19595 ?auto_19621 ) ( ON ?auto_19595 ?auto_19637 ) ( CLEAR ?auto_19595 ) ( not ( = ?auto_19597 ?auto_19595 ) ) ( not ( = ?auto_19597 ?auto_19637 ) ) ( not ( = ?auto_19595 ?auto_19637 ) ) ( not ( = ?auto_19604 ?auto_19619 ) ) ( IS-CRATE ?auto_19597 ) ( not ( = ?auto_19633 ?auto_19608 ) ) ( HOIST-AT ?auto_19618 ?auto_19633 ) ( AVAILABLE ?auto_19618 ) ( SURFACE-AT ?auto_19597 ?auto_19633 ) ( ON ?auto_19597 ?auto_19622 ) ( CLEAR ?auto_19597 ) ( not ( = ?auto_19594 ?auto_19597 ) ) ( not ( = ?auto_19594 ?auto_19622 ) ) ( not ( = ?auto_19597 ?auto_19622 ) ) ( not ( = ?auto_19604 ?auto_19618 ) ) ( IS-CRATE ?auto_19594 ) ( not ( = ?auto_19631 ?auto_19608 ) ) ( HOIST-AT ?auto_19641 ?auto_19631 ) ( AVAILABLE ?auto_19641 ) ( SURFACE-AT ?auto_19594 ?auto_19631 ) ( ON ?auto_19594 ?auto_19629 ) ( CLEAR ?auto_19594 ) ( not ( = ?auto_19593 ?auto_19594 ) ) ( not ( = ?auto_19593 ?auto_19629 ) ) ( not ( = ?auto_19594 ?auto_19629 ) ) ( not ( = ?auto_19604 ?auto_19641 ) ) ( IS-CRATE ?auto_19593 ) ( not ( = ?auto_19639 ?auto_19608 ) ) ( HOIST-AT ?auto_19638 ?auto_19639 ) ( AVAILABLE ?auto_19638 ) ( SURFACE-AT ?auto_19593 ?auto_19639 ) ( ON ?auto_19593 ?auto_19614 ) ( CLEAR ?auto_19593 ) ( not ( = ?auto_19592 ?auto_19593 ) ) ( not ( = ?auto_19592 ?auto_19614 ) ) ( not ( = ?auto_19593 ?auto_19614 ) ) ( not ( = ?auto_19604 ?auto_19638 ) ) ( IS-CRATE ?auto_19592 ) ( not ( = ?auto_19628 ?auto_19608 ) ) ( HOIST-AT ?auto_19617 ?auto_19628 ) ( AVAILABLE ?auto_19617 ) ( SURFACE-AT ?auto_19592 ?auto_19628 ) ( ON ?auto_19592 ?auto_19623 ) ( CLEAR ?auto_19592 ) ( not ( = ?auto_19591 ?auto_19592 ) ) ( not ( = ?auto_19591 ?auto_19623 ) ) ( not ( = ?auto_19592 ?auto_19623 ) ) ( not ( = ?auto_19604 ?auto_19617 ) ) ( SURFACE-AT ?auto_19590 ?auto_19608 ) ( CLEAR ?auto_19590 ) ( IS-CRATE ?auto_19591 ) ( AVAILABLE ?auto_19604 ) ( not ( = ?auto_19640 ?auto_19608 ) ) ( HOIST-AT ?auto_19626 ?auto_19640 ) ( AVAILABLE ?auto_19626 ) ( SURFACE-AT ?auto_19591 ?auto_19640 ) ( ON ?auto_19591 ?auto_19616 ) ( CLEAR ?auto_19591 ) ( TRUCK-AT ?auto_19607 ?auto_19608 ) ( not ( = ?auto_19590 ?auto_19591 ) ) ( not ( = ?auto_19590 ?auto_19616 ) ) ( not ( = ?auto_19591 ?auto_19616 ) ) ( not ( = ?auto_19604 ?auto_19626 ) ) ( not ( = ?auto_19590 ?auto_19592 ) ) ( not ( = ?auto_19590 ?auto_19623 ) ) ( not ( = ?auto_19592 ?auto_19616 ) ) ( not ( = ?auto_19628 ?auto_19640 ) ) ( not ( = ?auto_19617 ?auto_19626 ) ) ( not ( = ?auto_19623 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19593 ) ) ( not ( = ?auto_19590 ?auto_19614 ) ) ( not ( = ?auto_19591 ?auto_19593 ) ) ( not ( = ?auto_19591 ?auto_19614 ) ) ( not ( = ?auto_19593 ?auto_19623 ) ) ( not ( = ?auto_19593 ?auto_19616 ) ) ( not ( = ?auto_19639 ?auto_19628 ) ) ( not ( = ?auto_19639 ?auto_19640 ) ) ( not ( = ?auto_19638 ?auto_19617 ) ) ( not ( = ?auto_19638 ?auto_19626 ) ) ( not ( = ?auto_19614 ?auto_19623 ) ) ( not ( = ?auto_19614 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19594 ) ) ( not ( = ?auto_19590 ?auto_19629 ) ) ( not ( = ?auto_19591 ?auto_19594 ) ) ( not ( = ?auto_19591 ?auto_19629 ) ) ( not ( = ?auto_19592 ?auto_19594 ) ) ( not ( = ?auto_19592 ?auto_19629 ) ) ( not ( = ?auto_19594 ?auto_19614 ) ) ( not ( = ?auto_19594 ?auto_19623 ) ) ( not ( = ?auto_19594 ?auto_19616 ) ) ( not ( = ?auto_19631 ?auto_19639 ) ) ( not ( = ?auto_19631 ?auto_19628 ) ) ( not ( = ?auto_19631 ?auto_19640 ) ) ( not ( = ?auto_19641 ?auto_19638 ) ) ( not ( = ?auto_19641 ?auto_19617 ) ) ( not ( = ?auto_19641 ?auto_19626 ) ) ( not ( = ?auto_19629 ?auto_19614 ) ) ( not ( = ?auto_19629 ?auto_19623 ) ) ( not ( = ?auto_19629 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19597 ) ) ( not ( = ?auto_19590 ?auto_19622 ) ) ( not ( = ?auto_19591 ?auto_19597 ) ) ( not ( = ?auto_19591 ?auto_19622 ) ) ( not ( = ?auto_19592 ?auto_19597 ) ) ( not ( = ?auto_19592 ?auto_19622 ) ) ( not ( = ?auto_19593 ?auto_19597 ) ) ( not ( = ?auto_19593 ?auto_19622 ) ) ( not ( = ?auto_19597 ?auto_19629 ) ) ( not ( = ?auto_19597 ?auto_19614 ) ) ( not ( = ?auto_19597 ?auto_19623 ) ) ( not ( = ?auto_19597 ?auto_19616 ) ) ( not ( = ?auto_19633 ?auto_19631 ) ) ( not ( = ?auto_19633 ?auto_19639 ) ) ( not ( = ?auto_19633 ?auto_19628 ) ) ( not ( = ?auto_19633 ?auto_19640 ) ) ( not ( = ?auto_19618 ?auto_19641 ) ) ( not ( = ?auto_19618 ?auto_19638 ) ) ( not ( = ?auto_19618 ?auto_19617 ) ) ( not ( = ?auto_19618 ?auto_19626 ) ) ( not ( = ?auto_19622 ?auto_19629 ) ) ( not ( = ?auto_19622 ?auto_19614 ) ) ( not ( = ?auto_19622 ?auto_19623 ) ) ( not ( = ?auto_19622 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19595 ) ) ( not ( = ?auto_19590 ?auto_19637 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19637 ) ) ( not ( = ?auto_19592 ?auto_19595 ) ) ( not ( = ?auto_19592 ?auto_19637 ) ) ( not ( = ?auto_19593 ?auto_19595 ) ) ( not ( = ?auto_19593 ?auto_19637 ) ) ( not ( = ?auto_19594 ?auto_19595 ) ) ( not ( = ?auto_19594 ?auto_19637 ) ) ( not ( = ?auto_19595 ?auto_19622 ) ) ( not ( = ?auto_19595 ?auto_19629 ) ) ( not ( = ?auto_19595 ?auto_19614 ) ) ( not ( = ?auto_19595 ?auto_19623 ) ) ( not ( = ?auto_19595 ?auto_19616 ) ) ( not ( = ?auto_19621 ?auto_19633 ) ) ( not ( = ?auto_19621 ?auto_19631 ) ) ( not ( = ?auto_19621 ?auto_19639 ) ) ( not ( = ?auto_19621 ?auto_19628 ) ) ( not ( = ?auto_19621 ?auto_19640 ) ) ( not ( = ?auto_19619 ?auto_19618 ) ) ( not ( = ?auto_19619 ?auto_19641 ) ) ( not ( = ?auto_19619 ?auto_19638 ) ) ( not ( = ?auto_19619 ?auto_19617 ) ) ( not ( = ?auto_19619 ?auto_19626 ) ) ( not ( = ?auto_19637 ?auto_19622 ) ) ( not ( = ?auto_19637 ?auto_19629 ) ) ( not ( = ?auto_19637 ?auto_19614 ) ) ( not ( = ?auto_19637 ?auto_19623 ) ) ( not ( = ?auto_19637 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19599 ) ) ( not ( = ?auto_19590 ?auto_19627 ) ) ( not ( = ?auto_19591 ?auto_19599 ) ) ( not ( = ?auto_19591 ?auto_19627 ) ) ( not ( = ?auto_19592 ?auto_19599 ) ) ( not ( = ?auto_19592 ?auto_19627 ) ) ( not ( = ?auto_19593 ?auto_19599 ) ) ( not ( = ?auto_19593 ?auto_19627 ) ) ( not ( = ?auto_19594 ?auto_19599 ) ) ( not ( = ?auto_19594 ?auto_19627 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19597 ?auto_19627 ) ) ( not ( = ?auto_19599 ?auto_19637 ) ) ( not ( = ?auto_19599 ?auto_19622 ) ) ( not ( = ?auto_19599 ?auto_19629 ) ) ( not ( = ?auto_19599 ?auto_19614 ) ) ( not ( = ?auto_19599 ?auto_19623 ) ) ( not ( = ?auto_19599 ?auto_19616 ) ) ( not ( = ?auto_19612 ?auto_19621 ) ) ( not ( = ?auto_19612 ?auto_19633 ) ) ( not ( = ?auto_19612 ?auto_19631 ) ) ( not ( = ?auto_19612 ?auto_19639 ) ) ( not ( = ?auto_19612 ?auto_19628 ) ) ( not ( = ?auto_19612 ?auto_19640 ) ) ( not ( = ?auto_19624 ?auto_19619 ) ) ( not ( = ?auto_19624 ?auto_19618 ) ) ( not ( = ?auto_19624 ?auto_19641 ) ) ( not ( = ?auto_19624 ?auto_19638 ) ) ( not ( = ?auto_19624 ?auto_19617 ) ) ( not ( = ?auto_19624 ?auto_19626 ) ) ( not ( = ?auto_19627 ?auto_19637 ) ) ( not ( = ?auto_19627 ?auto_19622 ) ) ( not ( = ?auto_19627 ?auto_19629 ) ) ( not ( = ?auto_19627 ?auto_19614 ) ) ( not ( = ?auto_19627 ?auto_19623 ) ) ( not ( = ?auto_19627 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19598 ) ) ( not ( = ?auto_19590 ?auto_19609 ) ) ( not ( = ?auto_19591 ?auto_19598 ) ) ( not ( = ?auto_19591 ?auto_19609 ) ) ( not ( = ?auto_19592 ?auto_19598 ) ) ( not ( = ?auto_19592 ?auto_19609 ) ) ( not ( = ?auto_19593 ?auto_19598 ) ) ( not ( = ?auto_19593 ?auto_19609 ) ) ( not ( = ?auto_19594 ?auto_19598 ) ) ( not ( = ?auto_19594 ?auto_19609 ) ) ( not ( = ?auto_19597 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19609 ) ) ( not ( = ?auto_19595 ?auto_19598 ) ) ( not ( = ?auto_19595 ?auto_19609 ) ) ( not ( = ?auto_19598 ?auto_19627 ) ) ( not ( = ?auto_19598 ?auto_19637 ) ) ( not ( = ?auto_19598 ?auto_19622 ) ) ( not ( = ?auto_19598 ?auto_19629 ) ) ( not ( = ?auto_19598 ?auto_19614 ) ) ( not ( = ?auto_19598 ?auto_19623 ) ) ( not ( = ?auto_19598 ?auto_19616 ) ) ( not ( = ?auto_19635 ?auto_19612 ) ) ( not ( = ?auto_19635 ?auto_19621 ) ) ( not ( = ?auto_19635 ?auto_19633 ) ) ( not ( = ?auto_19635 ?auto_19631 ) ) ( not ( = ?auto_19635 ?auto_19639 ) ) ( not ( = ?auto_19635 ?auto_19628 ) ) ( not ( = ?auto_19635 ?auto_19640 ) ) ( not ( = ?auto_19634 ?auto_19624 ) ) ( not ( = ?auto_19634 ?auto_19619 ) ) ( not ( = ?auto_19634 ?auto_19618 ) ) ( not ( = ?auto_19634 ?auto_19641 ) ) ( not ( = ?auto_19634 ?auto_19638 ) ) ( not ( = ?auto_19634 ?auto_19617 ) ) ( not ( = ?auto_19634 ?auto_19626 ) ) ( not ( = ?auto_19609 ?auto_19627 ) ) ( not ( = ?auto_19609 ?auto_19637 ) ) ( not ( = ?auto_19609 ?auto_19622 ) ) ( not ( = ?auto_19609 ?auto_19629 ) ) ( not ( = ?auto_19609 ?auto_19614 ) ) ( not ( = ?auto_19609 ?auto_19623 ) ) ( not ( = ?auto_19609 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19596 ) ) ( not ( = ?auto_19590 ?auto_19632 ) ) ( not ( = ?auto_19591 ?auto_19596 ) ) ( not ( = ?auto_19591 ?auto_19632 ) ) ( not ( = ?auto_19592 ?auto_19596 ) ) ( not ( = ?auto_19592 ?auto_19632 ) ) ( not ( = ?auto_19593 ?auto_19596 ) ) ( not ( = ?auto_19593 ?auto_19632 ) ) ( not ( = ?auto_19594 ?auto_19596 ) ) ( not ( = ?auto_19594 ?auto_19632 ) ) ( not ( = ?auto_19597 ?auto_19596 ) ) ( not ( = ?auto_19597 ?auto_19632 ) ) ( not ( = ?auto_19595 ?auto_19596 ) ) ( not ( = ?auto_19595 ?auto_19632 ) ) ( not ( = ?auto_19599 ?auto_19596 ) ) ( not ( = ?auto_19599 ?auto_19632 ) ) ( not ( = ?auto_19596 ?auto_19609 ) ) ( not ( = ?auto_19596 ?auto_19627 ) ) ( not ( = ?auto_19596 ?auto_19637 ) ) ( not ( = ?auto_19596 ?auto_19622 ) ) ( not ( = ?auto_19596 ?auto_19629 ) ) ( not ( = ?auto_19596 ?auto_19614 ) ) ( not ( = ?auto_19596 ?auto_19623 ) ) ( not ( = ?auto_19596 ?auto_19616 ) ) ( not ( = ?auto_19620 ?auto_19635 ) ) ( not ( = ?auto_19620 ?auto_19612 ) ) ( not ( = ?auto_19620 ?auto_19621 ) ) ( not ( = ?auto_19620 ?auto_19633 ) ) ( not ( = ?auto_19620 ?auto_19631 ) ) ( not ( = ?auto_19620 ?auto_19639 ) ) ( not ( = ?auto_19620 ?auto_19628 ) ) ( not ( = ?auto_19620 ?auto_19640 ) ) ( not ( = ?auto_19636 ?auto_19634 ) ) ( not ( = ?auto_19636 ?auto_19624 ) ) ( not ( = ?auto_19636 ?auto_19619 ) ) ( not ( = ?auto_19636 ?auto_19618 ) ) ( not ( = ?auto_19636 ?auto_19641 ) ) ( not ( = ?auto_19636 ?auto_19638 ) ) ( not ( = ?auto_19636 ?auto_19617 ) ) ( not ( = ?auto_19636 ?auto_19626 ) ) ( not ( = ?auto_19632 ?auto_19609 ) ) ( not ( = ?auto_19632 ?auto_19627 ) ) ( not ( = ?auto_19632 ?auto_19637 ) ) ( not ( = ?auto_19632 ?auto_19622 ) ) ( not ( = ?auto_19632 ?auto_19629 ) ) ( not ( = ?auto_19632 ?auto_19614 ) ) ( not ( = ?auto_19632 ?auto_19623 ) ) ( not ( = ?auto_19632 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19601 ) ) ( not ( = ?auto_19590 ?auto_19611 ) ) ( not ( = ?auto_19591 ?auto_19601 ) ) ( not ( = ?auto_19591 ?auto_19611 ) ) ( not ( = ?auto_19592 ?auto_19601 ) ) ( not ( = ?auto_19592 ?auto_19611 ) ) ( not ( = ?auto_19593 ?auto_19601 ) ) ( not ( = ?auto_19593 ?auto_19611 ) ) ( not ( = ?auto_19594 ?auto_19601 ) ) ( not ( = ?auto_19594 ?auto_19611 ) ) ( not ( = ?auto_19597 ?auto_19601 ) ) ( not ( = ?auto_19597 ?auto_19611 ) ) ( not ( = ?auto_19595 ?auto_19601 ) ) ( not ( = ?auto_19595 ?auto_19611 ) ) ( not ( = ?auto_19599 ?auto_19601 ) ) ( not ( = ?auto_19599 ?auto_19611 ) ) ( not ( = ?auto_19598 ?auto_19601 ) ) ( not ( = ?auto_19598 ?auto_19611 ) ) ( not ( = ?auto_19601 ?auto_19632 ) ) ( not ( = ?auto_19601 ?auto_19609 ) ) ( not ( = ?auto_19601 ?auto_19627 ) ) ( not ( = ?auto_19601 ?auto_19637 ) ) ( not ( = ?auto_19601 ?auto_19622 ) ) ( not ( = ?auto_19601 ?auto_19629 ) ) ( not ( = ?auto_19601 ?auto_19614 ) ) ( not ( = ?auto_19601 ?auto_19623 ) ) ( not ( = ?auto_19601 ?auto_19616 ) ) ( not ( = ?auto_19613 ?auto_19620 ) ) ( not ( = ?auto_19613 ?auto_19635 ) ) ( not ( = ?auto_19613 ?auto_19612 ) ) ( not ( = ?auto_19613 ?auto_19621 ) ) ( not ( = ?auto_19613 ?auto_19633 ) ) ( not ( = ?auto_19613 ?auto_19631 ) ) ( not ( = ?auto_19613 ?auto_19639 ) ) ( not ( = ?auto_19613 ?auto_19628 ) ) ( not ( = ?auto_19613 ?auto_19640 ) ) ( not ( = ?auto_19610 ?auto_19636 ) ) ( not ( = ?auto_19610 ?auto_19634 ) ) ( not ( = ?auto_19610 ?auto_19624 ) ) ( not ( = ?auto_19610 ?auto_19619 ) ) ( not ( = ?auto_19610 ?auto_19618 ) ) ( not ( = ?auto_19610 ?auto_19641 ) ) ( not ( = ?auto_19610 ?auto_19638 ) ) ( not ( = ?auto_19610 ?auto_19617 ) ) ( not ( = ?auto_19610 ?auto_19626 ) ) ( not ( = ?auto_19611 ?auto_19632 ) ) ( not ( = ?auto_19611 ?auto_19609 ) ) ( not ( = ?auto_19611 ?auto_19627 ) ) ( not ( = ?auto_19611 ?auto_19637 ) ) ( not ( = ?auto_19611 ?auto_19622 ) ) ( not ( = ?auto_19611 ?auto_19629 ) ) ( not ( = ?auto_19611 ?auto_19614 ) ) ( not ( = ?auto_19611 ?auto_19623 ) ) ( not ( = ?auto_19611 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19600 ) ) ( not ( = ?auto_19590 ?auto_19615 ) ) ( not ( = ?auto_19591 ?auto_19600 ) ) ( not ( = ?auto_19591 ?auto_19615 ) ) ( not ( = ?auto_19592 ?auto_19600 ) ) ( not ( = ?auto_19592 ?auto_19615 ) ) ( not ( = ?auto_19593 ?auto_19600 ) ) ( not ( = ?auto_19593 ?auto_19615 ) ) ( not ( = ?auto_19594 ?auto_19600 ) ) ( not ( = ?auto_19594 ?auto_19615 ) ) ( not ( = ?auto_19597 ?auto_19600 ) ) ( not ( = ?auto_19597 ?auto_19615 ) ) ( not ( = ?auto_19595 ?auto_19600 ) ) ( not ( = ?auto_19595 ?auto_19615 ) ) ( not ( = ?auto_19599 ?auto_19600 ) ) ( not ( = ?auto_19599 ?auto_19615 ) ) ( not ( = ?auto_19598 ?auto_19600 ) ) ( not ( = ?auto_19598 ?auto_19615 ) ) ( not ( = ?auto_19596 ?auto_19600 ) ) ( not ( = ?auto_19596 ?auto_19615 ) ) ( not ( = ?auto_19600 ?auto_19611 ) ) ( not ( = ?auto_19600 ?auto_19632 ) ) ( not ( = ?auto_19600 ?auto_19609 ) ) ( not ( = ?auto_19600 ?auto_19627 ) ) ( not ( = ?auto_19600 ?auto_19637 ) ) ( not ( = ?auto_19600 ?auto_19622 ) ) ( not ( = ?auto_19600 ?auto_19629 ) ) ( not ( = ?auto_19600 ?auto_19614 ) ) ( not ( = ?auto_19600 ?auto_19623 ) ) ( not ( = ?auto_19600 ?auto_19616 ) ) ( not ( = ?auto_19625 ?auto_19613 ) ) ( not ( = ?auto_19625 ?auto_19620 ) ) ( not ( = ?auto_19625 ?auto_19635 ) ) ( not ( = ?auto_19625 ?auto_19612 ) ) ( not ( = ?auto_19625 ?auto_19621 ) ) ( not ( = ?auto_19625 ?auto_19633 ) ) ( not ( = ?auto_19625 ?auto_19631 ) ) ( not ( = ?auto_19625 ?auto_19639 ) ) ( not ( = ?auto_19625 ?auto_19628 ) ) ( not ( = ?auto_19625 ?auto_19640 ) ) ( not ( = ?auto_19630 ?auto_19610 ) ) ( not ( = ?auto_19630 ?auto_19636 ) ) ( not ( = ?auto_19630 ?auto_19634 ) ) ( not ( = ?auto_19630 ?auto_19624 ) ) ( not ( = ?auto_19630 ?auto_19619 ) ) ( not ( = ?auto_19630 ?auto_19618 ) ) ( not ( = ?auto_19630 ?auto_19641 ) ) ( not ( = ?auto_19630 ?auto_19638 ) ) ( not ( = ?auto_19630 ?auto_19617 ) ) ( not ( = ?auto_19630 ?auto_19626 ) ) ( not ( = ?auto_19615 ?auto_19611 ) ) ( not ( = ?auto_19615 ?auto_19632 ) ) ( not ( = ?auto_19615 ?auto_19609 ) ) ( not ( = ?auto_19615 ?auto_19627 ) ) ( not ( = ?auto_19615 ?auto_19637 ) ) ( not ( = ?auto_19615 ?auto_19622 ) ) ( not ( = ?auto_19615 ?auto_19629 ) ) ( not ( = ?auto_19615 ?auto_19614 ) ) ( not ( = ?auto_19615 ?auto_19623 ) ) ( not ( = ?auto_19615 ?auto_19616 ) ) ( not ( = ?auto_19590 ?auto_19602 ) ) ( not ( = ?auto_19590 ?auto_19606 ) ) ( not ( = ?auto_19591 ?auto_19602 ) ) ( not ( = ?auto_19591 ?auto_19606 ) ) ( not ( = ?auto_19592 ?auto_19602 ) ) ( not ( = ?auto_19592 ?auto_19606 ) ) ( not ( = ?auto_19593 ?auto_19602 ) ) ( not ( = ?auto_19593 ?auto_19606 ) ) ( not ( = ?auto_19594 ?auto_19602 ) ) ( not ( = ?auto_19594 ?auto_19606 ) ) ( not ( = ?auto_19597 ?auto_19602 ) ) ( not ( = ?auto_19597 ?auto_19606 ) ) ( not ( = ?auto_19595 ?auto_19602 ) ) ( not ( = ?auto_19595 ?auto_19606 ) ) ( not ( = ?auto_19599 ?auto_19602 ) ) ( not ( = ?auto_19599 ?auto_19606 ) ) ( not ( = ?auto_19598 ?auto_19602 ) ) ( not ( = ?auto_19598 ?auto_19606 ) ) ( not ( = ?auto_19596 ?auto_19602 ) ) ( not ( = ?auto_19596 ?auto_19606 ) ) ( not ( = ?auto_19601 ?auto_19602 ) ) ( not ( = ?auto_19601 ?auto_19606 ) ) ( not ( = ?auto_19602 ?auto_19615 ) ) ( not ( = ?auto_19602 ?auto_19611 ) ) ( not ( = ?auto_19602 ?auto_19632 ) ) ( not ( = ?auto_19602 ?auto_19609 ) ) ( not ( = ?auto_19602 ?auto_19627 ) ) ( not ( = ?auto_19602 ?auto_19637 ) ) ( not ( = ?auto_19602 ?auto_19622 ) ) ( not ( = ?auto_19602 ?auto_19629 ) ) ( not ( = ?auto_19602 ?auto_19614 ) ) ( not ( = ?auto_19602 ?auto_19623 ) ) ( not ( = ?auto_19602 ?auto_19616 ) ) ( not ( = ?auto_19605 ?auto_19625 ) ) ( not ( = ?auto_19605 ?auto_19613 ) ) ( not ( = ?auto_19605 ?auto_19620 ) ) ( not ( = ?auto_19605 ?auto_19635 ) ) ( not ( = ?auto_19605 ?auto_19612 ) ) ( not ( = ?auto_19605 ?auto_19621 ) ) ( not ( = ?auto_19605 ?auto_19633 ) ) ( not ( = ?auto_19605 ?auto_19631 ) ) ( not ( = ?auto_19605 ?auto_19639 ) ) ( not ( = ?auto_19605 ?auto_19628 ) ) ( not ( = ?auto_19605 ?auto_19640 ) ) ( not ( = ?auto_19603 ?auto_19630 ) ) ( not ( = ?auto_19603 ?auto_19610 ) ) ( not ( = ?auto_19603 ?auto_19636 ) ) ( not ( = ?auto_19603 ?auto_19634 ) ) ( not ( = ?auto_19603 ?auto_19624 ) ) ( not ( = ?auto_19603 ?auto_19619 ) ) ( not ( = ?auto_19603 ?auto_19618 ) ) ( not ( = ?auto_19603 ?auto_19641 ) ) ( not ( = ?auto_19603 ?auto_19638 ) ) ( not ( = ?auto_19603 ?auto_19617 ) ) ( not ( = ?auto_19603 ?auto_19626 ) ) ( not ( = ?auto_19606 ?auto_19615 ) ) ( not ( = ?auto_19606 ?auto_19611 ) ) ( not ( = ?auto_19606 ?auto_19632 ) ) ( not ( = ?auto_19606 ?auto_19609 ) ) ( not ( = ?auto_19606 ?auto_19627 ) ) ( not ( = ?auto_19606 ?auto_19637 ) ) ( not ( = ?auto_19606 ?auto_19622 ) ) ( not ( = ?auto_19606 ?auto_19629 ) ) ( not ( = ?auto_19606 ?auto_19614 ) ) ( not ( = ?auto_19606 ?auto_19623 ) ) ( not ( = ?auto_19606 ?auto_19616 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_19590 ?auto_19591 ?auto_19592 ?auto_19593 ?auto_19594 ?auto_19597 ?auto_19595 ?auto_19599 ?auto_19598 ?auto_19596 ?auto_19601 ?auto_19600 )
      ( MAKE-1CRATE ?auto_19600 ?auto_19602 )
      ( MAKE-12CRATE-VERIFY ?auto_19590 ?auto_19591 ?auto_19592 ?auto_19593 ?auto_19594 ?auto_19597 ?auto_19595 ?auto_19599 ?auto_19598 ?auto_19596 ?auto_19601 ?auto_19600 ?auto_19602 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19644 - SURFACE
      ?auto_19645 - SURFACE
    )
    :vars
    (
      ?auto_19646 - HOIST
      ?auto_19647 - PLACE
      ?auto_19649 - PLACE
      ?auto_19650 - HOIST
      ?auto_19651 - SURFACE
      ?auto_19648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19646 ?auto_19647 ) ( SURFACE-AT ?auto_19644 ?auto_19647 ) ( CLEAR ?auto_19644 ) ( IS-CRATE ?auto_19645 ) ( AVAILABLE ?auto_19646 ) ( not ( = ?auto_19649 ?auto_19647 ) ) ( HOIST-AT ?auto_19650 ?auto_19649 ) ( AVAILABLE ?auto_19650 ) ( SURFACE-AT ?auto_19645 ?auto_19649 ) ( ON ?auto_19645 ?auto_19651 ) ( CLEAR ?auto_19645 ) ( TRUCK-AT ?auto_19648 ?auto_19647 ) ( not ( = ?auto_19644 ?auto_19645 ) ) ( not ( = ?auto_19644 ?auto_19651 ) ) ( not ( = ?auto_19645 ?auto_19651 ) ) ( not ( = ?auto_19646 ?auto_19650 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19648 ?auto_19647 ?auto_19649 )
      ( !LIFT ?auto_19650 ?auto_19645 ?auto_19651 ?auto_19649 )
      ( !LOAD ?auto_19650 ?auto_19645 ?auto_19648 ?auto_19649 )
      ( !DRIVE ?auto_19648 ?auto_19649 ?auto_19647 )
      ( !UNLOAD ?auto_19646 ?auto_19645 ?auto_19648 ?auto_19647 )
      ( !DROP ?auto_19646 ?auto_19645 ?auto_19644 ?auto_19647 )
      ( MAKE-1CRATE-VERIFY ?auto_19644 ?auto_19645 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_19666 - SURFACE
      ?auto_19667 - SURFACE
      ?auto_19668 - SURFACE
      ?auto_19669 - SURFACE
      ?auto_19670 - SURFACE
      ?auto_19673 - SURFACE
      ?auto_19671 - SURFACE
      ?auto_19675 - SURFACE
      ?auto_19674 - SURFACE
      ?auto_19672 - SURFACE
      ?auto_19677 - SURFACE
      ?auto_19676 - SURFACE
      ?auto_19678 - SURFACE
      ?auto_19679 - SURFACE
    )
    :vars
    (
      ?auto_19681 - HOIST
      ?auto_19685 - PLACE
      ?auto_19680 - PLACE
      ?auto_19684 - HOIST
      ?auto_19682 - SURFACE
      ?auto_19699 - PLACE
      ?auto_19698 - HOIST
      ?auto_19708 - SURFACE
      ?auto_19714 - PLACE
      ?auto_19719 - HOIST
      ?auto_19695 - SURFACE
      ?auto_19712 - PLACE
      ?auto_19693 - HOIST
      ?auto_19716 - SURFACE
      ?auto_19704 - PLACE
      ?auto_19694 - HOIST
      ?auto_19690 - SURFACE
      ?auto_19687 - PLACE
      ?auto_19697 - HOIST
      ?auto_19721 - SURFACE
      ?auto_19715 - PLACE
      ?auto_19705 - HOIST
      ?auto_19720 - SURFACE
      ?auto_19692 - PLACE
      ?auto_19691 - HOIST
      ?auto_19703 - SURFACE
      ?auto_19700 - PLACE
      ?auto_19718 - HOIST
      ?auto_19688 - SURFACE
      ?auto_19710 - PLACE
      ?auto_19696 - HOIST
      ?auto_19706 - SURFACE
      ?auto_19701 - PLACE
      ?auto_19702 - HOIST
      ?auto_19717 - SURFACE
      ?auto_19711 - PLACE
      ?auto_19707 - HOIST
      ?auto_19709 - SURFACE
      ?auto_19713 - PLACE
      ?auto_19689 - HOIST
      ?auto_19686 - SURFACE
      ?auto_19683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19681 ?auto_19685 ) ( IS-CRATE ?auto_19679 ) ( not ( = ?auto_19680 ?auto_19685 ) ) ( HOIST-AT ?auto_19684 ?auto_19680 ) ( AVAILABLE ?auto_19684 ) ( SURFACE-AT ?auto_19679 ?auto_19680 ) ( ON ?auto_19679 ?auto_19682 ) ( CLEAR ?auto_19679 ) ( not ( = ?auto_19678 ?auto_19679 ) ) ( not ( = ?auto_19678 ?auto_19682 ) ) ( not ( = ?auto_19679 ?auto_19682 ) ) ( not ( = ?auto_19681 ?auto_19684 ) ) ( IS-CRATE ?auto_19678 ) ( not ( = ?auto_19699 ?auto_19685 ) ) ( HOIST-AT ?auto_19698 ?auto_19699 ) ( AVAILABLE ?auto_19698 ) ( SURFACE-AT ?auto_19678 ?auto_19699 ) ( ON ?auto_19678 ?auto_19708 ) ( CLEAR ?auto_19678 ) ( not ( = ?auto_19676 ?auto_19678 ) ) ( not ( = ?auto_19676 ?auto_19708 ) ) ( not ( = ?auto_19678 ?auto_19708 ) ) ( not ( = ?auto_19681 ?auto_19698 ) ) ( IS-CRATE ?auto_19676 ) ( not ( = ?auto_19714 ?auto_19685 ) ) ( HOIST-AT ?auto_19719 ?auto_19714 ) ( AVAILABLE ?auto_19719 ) ( SURFACE-AT ?auto_19676 ?auto_19714 ) ( ON ?auto_19676 ?auto_19695 ) ( CLEAR ?auto_19676 ) ( not ( = ?auto_19677 ?auto_19676 ) ) ( not ( = ?auto_19677 ?auto_19695 ) ) ( not ( = ?auto_19676 ?auto_19695 ) ) ( not ( = ?auto_19681 ?auto_19719 ) ) ( IS-CRATE ?auto_19677 ) ( not ( = ?auto_19712 ?auto_19685 ) ) ( HOIST-AT ?auto_19693 ?auto_19712 ) ( AVAILABLE ?auto_19693 ) ( SURFACE-AT ?auto_19677 ?auto_19712 ) ( ON ?auto_19677 ?auto_19716 ) ( CLEAR ?auto_19677 ) ( not ( = ?auto_19672 ?auto_19677 ) ) ( not ( = ?auto_19672 ?auto_19716 ) ) ( not ( = ?auto_19677 ?auto_19716 ) ) ( not ( = ?auto_19681 ?auto_19693 ) ) ( IS-CRATE ?auto_19672 ) ( not ( = ?auto_19704 ?auto_19685 ) ) ( HOIST-AT ?auto_19694 ?auto_19704 ) ( AVAILABLE ?auto_19694 ) ( SURFACE-AT ?auto_19672 ?auto_19704 ) ( ON ?auto_19672 ?auto_19690 ) ( CLEAR ?auto_19672 ) ( not ( = ?auto_19674 ?auto_19672 ) ) ( not ( = ?auto_19674 ?auto_19690 ) ) ( not ( = ?auto_19672 ?auto_19690 ) ) ( not ( = ?auto_19681 ?auto_19694 ) ) ( IS-CRATE ?auto_19674 ) ( not ( = ?auto_19687 ?auto_19685 ) ) ( HOIST-AT ?auto_19697 ?auto_19687 ) ( AVAILABLE ?auto_19697 ) ( SURFACE-AT ?auto_19674 ?auto_19687 ) ( ON ?auto_19674 ?auto_19721 ) ( CLEAR ?auto_19674 ) ( not ( = ?auto_19675 ?auto_19674 ) ) ( not ( = ?auto_19675 ?auto_19721 ) ) ( not ( = ?auto_19674 ?auto_19721 ) ) ( not ( = ?auto_19681 ?auto_19697 ) ) ( IS-CRATE ?auto_19675 ) ( not ( = ?auto_19715 ?auto_19685 ) ) ( HOIST-AT ?auto_19705 ?auto_19715 ) ( AVAILABLE ?auto_19705 ) ( SURFACE-AT ?auto_19675 ?auto_19715 ) ( ON ?auto_19675 ?auto_19720 ) ( CLEAR ?auto_19675 ) ( not ( = ?auto_19671 ?auto_19675 ) ) ( not ( = ?auto_19671 ?auto_19720 ) ) ( not ( = ?auto_19675 ?auto_19720 ) ) ( not ( = ?auto_19681 ?auto_19705 ) ) ( IS-CRATE ?auto_19671 ) ( not ( = ?auto_19692 ?auto_19685 ) ) ( HOIST-AT ?auto_19691 ?auto_19692 ) ( AVAILABLE ?auto_19691 ) ( SURFACE-AT ?auto_19671 ?auto_19692 ) ( ON ?auto_19671 ?auto_19703 ) ( CLEAR ?auto_19671 ) ( not ( = ?auto_19673 ?auto_19671 ) ) ( not ( = ?auto_19673 ?auto_19703 ) ) ( not ( = ?auto_19671 ?auto_19703 ) ) ( not ( = ?auto_19681 ?auto_19691 ) ) ( IS-CRATE ?auto_19673 ) ( not ( = ?auto_19700 ?auto_19685 ) ) ( HOIST-AT ?auto_19718 ?auto_19700 ) ( AVAILABLE ?auto_19718 ) ( SURFACE-AT ?auto_19673 ?auto_19700 ) ( ON ?auto_19673 ?auto_19688 ) ( CLEAR ?auto_19673 ) ( not ( = ?auto_19670 ?auto_19673 ) ) ( not ( = ?auto_19670 ?auto_19688 ) ) ( not ( = ?auto_19673 ?auto_19688 ) ) ( not ( = ?auto_19681 ?auto_19718 ) ) ( IS-CRATE ?auto_19670 ) ( not ( = ?auto_19710 ?auto_19685 ) ) ( HOIST-AT ?auto_19696 ?auto_19710 ) ( AVAILABLE ?auto_19696 ) ( SURFACE-AT ?auto_19670 ?auto_19710 ) ( ON ?auto_19670 ?auto_19706 ) ( CLEAR ?auto_19670 ) ( not ( = ?auto_19669 ?auto_19670 ) ) ( not ( = ?auto_19669 ?auto_19706 ) ) ( not ( = ?auto_19670 ?auto_19706 ) ) ( not ( = ?auto_19681 ?auto_19696 ) ) ( IS-CRATE ?auto_19669 ) ( not ( = ?auto_19701 ?auto_19685 ) ) ( HOIST-AT ?auto_19702 ?auto_19701 ) ( AVAILABLE ?auto_19702 ) ( SURFACE-AT ?auto_19669 ?auto_19701 ) ( ON ?auto_19669 ?auto_19717 ) ( CLEAR ?auto_19669 ) ( not ( = ?auto_19668 ?auto_19669 ) ) ( not ( = ?auto_19668 ?auto_19717 ) ) ( not ( = ?auto_19669 ?auto_19717 ) ) ( not ( = ?auto_19681 ?auto_19702 ) ) ( IS-CRATE ?auto_19668 ) ( not ( = ?auto_19711 ?auto_19685 ) ) ( HOIST-AT ?auto_19707 ?auto_19711 ) ( AVAILABLE ?auto_19707 ) ( SURFACE-AT ?auto_19668 ?auto_19711 ) ( ON ?auto_19668 ?auto_19709 ) ( CLEAR ?auto_19668 ) ( not ( = ?auto_19667 ?auto_19668 ) ) ( not ( = ?auto_19667 ?auto_19709 ) ) ( not ( = ?auto_19668 ?auto_19709 ) ) ( not ( = ?auto_19681 ?auto_19707 ) ) ( SURFACE-AT ?auto_19666 ?auto_19685 ) ( CLEAR ?auto_19666 ) ( IS-CRATE ?auto_19667 ) ( AVAILABLE ?auto_19681 ) ( not ( = ?auto_19713 ?auto_19685 ) ) ( HOIST-AT ?auto_19689 ?auto_19713 ) ( AVAILABLE ?auto_19689 ) ( SURFACE-AT ?auto_19667 ?auto_19713 ) ( ON ?auto_19667 ?auto_19686 ) ( CLEAR ?auto_19667 ) ( TRUCK-AT ?auto_19683 ?auto_19685 ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19666 ?auto_19686 ) ) ( not ( = ?auto_19667 ?auto_19686 ) ) ( not ( = ?auto_19681 ?auto_19689 ) ) ( not ( = ?auto_19666 ?auto_19668 ) ) ( not ( = ?auto_19666 ?auto_19709 ) ) ( not ( = ?auto_19668 ?auto_19686 ) ) ( not ( = ?auto_19711 ?auto_19713 ) ) ( not ( = ?auto_19707 ?auto_19689 ) ) ( not ( = ?auto_19709 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19669 ) ) ( not ( = ?auto_19666 ?auto_19717 ) ) ( not ( = ?auto_19667 ?auto_19669 ) ) ( not ( = ?auto_19667 ?auto_19717 ) ) ( not ( = ?auto_19669 ?auto_19709 ) ) ( not ( = ?auto_19669 ?auto_19686 ) ) ( not ( = ?auto_19701 ?auto_19711 ) ) ( not ( = ?auto_19701 ?auto_19713 ) ) ( not ( = ?auto_19702 ?auto_19707 ) ) ( not ( = ?auto_19702 ?auto_19689 ) ) ( not ( = ?auto_19717 ?auto_19709 ) ) ( not ( = ?auto_19717 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19670 ) ) ( not ( = ?auto_19666 ?auto_19706 ) ) ( not ( = ?auto_19667 ?auto_19670 ) ) ( not ( = ?auto_19667 ?auto_19706 ) ) ( not ( = ?auto_19668 ?auto_19670 ) ) ( not ( = ?auto_19668 ?auto_19706 ) ) ( not ( = ?auto_19670 ?auto_19717 ) ) ( not ( = ?auto_19670 ?auto_19709 ) ) ( not ( = ?auto_19670 ?auto_19686 ) ) ( not ( = ?auto_19710 ?auto_19701 ) ) ( not ( = ?auto_19710 ?auto_19711 ) ) ( not ( = ?auto_19710 ?auto_19713 ) ) ( not ( = ?auto_19696 ?auto_19702 ) ) ( not ( = ?auto_19696 ?auto_19707 ) ) ( not ( = ?auto_19696 ?auto_19689 ) ) ( not ( = ?auto_19706 ?auto_19717 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19673 ) ) ( not ( = ?auto_19666 ?auto_19688 ) ) ( not ( = ?auto_19667 ?auto_19673 ) ) ( not ( = ?auto_19667 ?auto_19688 ) ) ( not ( = ?auto_19668 ?auto_19673 ) ) ( not ( = ?auto_19668 ?auto_19688 ) ) ( not ( = ?auto_19669 ?auto_19673 ) ) ( not ( = ?auto_19669 ?auto_19688 ) ) ( not ( = ?auto_19673 ?auto_19706 ) ) ( not ( = ?auto_19673 ?auto_19717 ) ) ( not ( = ?auto_19673 ?auto_19709 ) ) ( not ( = ?auto_19673 ?auto_19686 ) ) ( not ( = ?auto_19700 ?auto_19710 ) ) ( not ( = ?auto_19700 ?auto_19701 ) ) ( not ( = ?auto_19700 ?auto_19711 ) ) ( not ( = ?auto_19700 ?auto_19713 ) ) ( not ( = ?auto_19718 ?auto_19696 ) ) ( not ( = ?auto_19718 ?auto_19702 ) ) ( not ( = ?auto_19718 ?auto_19707 ) ) ( not ( = ?auto_19718 ?auto_19689 ) ) ( not ( = ?auto_19688 ?auto_19706 ) ) ( not ( = ?auto_19688 ?auto_19717 ) ) ( not ( = ?auto_19688 ?auto_19709 ) ) ( not ( = ?auto_19688 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19671 ) ) ( not ( = ?auto_19666 ?auto_19703 ) ) ( not ( = ?auto_19667 ?auto_19671 ) ) ( not ( = ?auto_19667 ?auto_19703 ) ) ( not ( = ?auto_19668 ?auto_19671 ) ) ( not ( = ?auto_19668 ?auto_19703 ) ) ( not ( = ?auto_19669 ?auto_19671 ) ) ( not ( = ?auto_19669 ?auto_19703 ) ) ( not ( = ?auto_19670 ?auto_19671 ) ) ( not ( = ?auto_19670 ?auto_19703 ) ) ( not ( = ?auto_19671 ?auto_19688 ) ) ( not ( = ?auto_19671 ?auto_19706 ) ) ( not ( = ?auto_19671 ?auto_19717 ) ) ( not ( = ?auto_19671 ?auto_19709 ) ) ( not ( = ?auto_19671 ?auto_19686 ) ) ( not ( = ?auto_19692 ?auto_19700 ) ) ( not ( = ?auto_19692 ?auto_19710 ) ) ( not ( = ?auto_19692 ?auto_19701 ) ) ( not ( = ?auto_19692 ?auto_19711 ) ) ( not ( = ?auto_19692 ?auto_19713 ) ) ( not ( = ?auto_19691 ?auto_19718 ) ) ( not ( = ?auto_19691 ?auto_19696 ) ) ( not ( = ?auto_19691 ?auto_19702 ) ) ( not ( = ?auto_19691 ?auto_19707 ) ) ( not ( = ?auto_19691 ?auto_19689 ) ) ( not ( = ?auto_19703 ?auto_19688 ) ) ( not ( = ?auto_19703 ?auto_19706 ) ) ( not ( = ?auto_19703 ?auto_19717 ) ) ( not ( = ?auto_19703 ?auto_19709 ) ) ( not ( = ?auto_19703 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19675 ) ) ( not ( = ?auto_19666 ?auto_19720 ) ) ( not ( = ?auto_19667 ?auto_19675 ) ) ( not ( = ?auto_19667 ?auto_19720 ) ) ( not ( = ?auto_19668 ?auto_19675 ) ) ( not ( = ?auto_19668 ?auto_19720 ) ) ( not ( = ?auto_19669 ?auto_19675 ) ) ( not ( = ?auto_19669 ?auto_19720 ) ) ( not ( = ?auto_19670 ?auto_19675 ) ) ( not ( = ?auto_19670 ?auto_19720 ) ) ( not ( = ?auto_19673 ?auto_19675 ) ) ( not ( = ?auto_19673 ?auto_19720 ) ) ( not ( = ?auto_19675 ?auto_19703 ) ) ( not ( = ?auto_19675 ?auto_19688 ) ) ( not ( = ?auto_19675 ?auto_19706 ) ) ( not ( = ?auto_19675 ?auto_19717 ) ) ( not ( = ?auto_19675 ?auto_19709 ) ) ( not ( = ?auto_19675 ?auto_19686 ) ) ( not ( = ?auto_19715 ?auto_19692 ) ) ( not ( = ?auto_19715 ?auto_19700 ) ) ( not ( = ?auto_19715 ?auto_19710 ) ) ( not ( = ?auto_19715 ?auto_19701 ) ) ( not ( = ?auto_19715 ?auto_19711 ) ) ( not ( = ?auto_19715 ?auto_19713 ) ) ( not ( = ?auto_19705 ?auto_19691 ) ) ( not ( = ?auto_19705 ?auto_19718 ) ) ( not ( = ?auto_19705 ?auto_19696 ) ) ( not ( = ?auto_19705 ?auto_19702 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19689 ) ) ( not ( = ?auto_19720 ?auto_19703 ) ) ( not ( = ?auto_19720 ?auto_19688 ) ) ( not ( = ?auto_19720 ?auto_19706 ) ) ( not ( = ?auto_19720 ?auto_19717 ) ) ( not ( = ?auto_19720 ?auto_19709 ) ) ( not ( = ?auto_19720 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19674 ) ) ( not ( = ?auto_19666 ?auto_19721 ) ) ( not ( = ?auto_19667 ?auto_19674 ) ) ( not ( = ?auto_19667 ?auto_19721 ) ) ( not ( = ?auto_19668 ?auto_19674 ) ) ( not ( = ?auto_19668 ?auto_19721 ) ) ( not ( = ?auto_19669 ?auto_19674 ) ) ( not ( = ?auto_19669 ?auto_19721 ) ) ( not ( = ?auto_19670 ?auto_19674 ) ) ( not ( = ?auto_19670 ?auto_19721 ) ) ( not ( = ?auto_19673 ?auto_19674 ) ) ( not ( = ?auto_19673 ?auto_19721 ) ) ( not ( = ?auto_19671 ?auto_19674 ) ) ( not ( = ?auto_19671 ?auto_19721 ) ) ( not ( = ?auto_19674 ?auto_19720 ) ) ( not ( = ?auto_19674 ?auto_19703 ) ) ( not ( = ?auto_19674 ?auto_19688 ) ) ( not ( = ?auto_19674 ?auto_19706 ) ) ( not ( = ?auto_19674 ?auto_19717 ) ) ( not ( = ?auto_19674 ?auto_19709 ) ) ( not ( = ?auto_19674 ?auto_19686 ) ) ( not ( = ?auto_19687 ?auto_19715 ) ) ( not ( = ?auto_19687 ?auto_19692 ) ) ( not ( = ?auto_19687 ?auto_19700 ) ) ( not ( = ?auto_19687 ?auto_19710 ) ) ( not ( = ?auto_19687 ?auto_19701 ) ) ( not ( = ?auto_19687 ?auto_19711 ) ) ( not ( = ?auto_19687 ?auto_19713 ) ) ( not ( = ?auto_19697 ?auto_19705 ) ) ( not ( = ?auto_19697 ?auto_19691 ) ) ( not ( = ?auto_19697 ?auto_19718 ) ) ( not ( = ?auto_19697 ?auto_19696 ) ) ( not ( = ?auto_19697 ?auto_19702 ) ) ( not ( = ?auto_19697 ?auto_19707 ) ) ( not ( = ?auto_19697 ?auto_19689 ) ) ( not ( = ?auto_19721 ?auto_19720 ) ) ( not ( = ?auto_19721 ?auto_19703 ) ) ( not ( = ?auto_19721 ?auto_19688 ) ) ( not ( = ?auto_19721 ?auto_19706 ) ) ( not ( = ?auto_19721 ?auto_19717 ) ) ( not ( = ?auto_19721 ?auto_19709 ) ) ( not ( = ?auto_19721 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19672 ) ) ( not ( = ?auto_19666 ?auto_19690 ) ) ( not ( = ?auto_19667 ?auto_19672 ) ) ( not ( = ?auto_19667 ?auto_19690 ) ) ( not ( = ?auto_19668 ?auto_19672 ) ) ( not ( = ?auto_19668 ?auto_19690 ) ) ( not ( = ?auto_19669 ?auto_19672 ) ) ( not ( = ?auto_19669 ?auto_19690 ) ) ( not ( = ?auto_19670 ?auto_19672 ) ) ( not ( = ?auto_19670 ?auto_19690 ) ) ( not ( = ?auto_19673 ?auto_19672 ) ) ( not ( = ?auto_19673 ?auto_19690 ) ) ( not ( = ?auto_19671 ?auto_19672 ) ) ( not ( = ?auto_19671 ?auto_19690 ) ) ( not ( = ?auto_19675 ?auto_19672 ) ) ( not ( = ?auto_19675 ?auto_19690 ) ) ( not ( = ?auto_19672 ?auto_19721 ) ) ( not ( = ?auto_19672 ?auto_19720 ) ) ( not ( = ?auto_19672 ?auto_19703 ) ) ( not ( = ?auto_19672 ?auto_19688 ) ) ( not ( = ?auto_19672 ?auto_19706 ) ) ( not ( = ?auto_19672 ?auto_19717 ) ) ( not ( = ?auto_19672 ?auto_19709 ) ) ( not ( = ?auto_19672 ?auto_19686 ) ) ( not ( = ?auto_19704 ?auto_19687 ) ) ( not ( = ?auto_19704 ?auto_19715 ) ) ( not ( = ?auto_19704 ?auto_19692 ) ) ( not ( = ?auto_19704 ?auto_19700 ) ) ( not ( = ?auto_19704 ?auto_19710 ) ) ( not ( = ?auto_19704 ?auto_19701 ) ) ( not ( = ?auto_19704 ?auto_19711 ) ) ( not ( = ?auto_19704 ?auto_19713 ) ) ( not ( = ?auto_19694 ?auto_19697 ) ) ( not ( = ?auto_19694 ?auto_19705 ) ) ( not ( = ?auto_19694 ?auto_19691 ) ) ( not ( = ?auto_19694 ?auto_19718 ) ) ( not ( = ?auto_19694 ?auto_19696 ) ) ( not ( = ?auto_19694 ?auto_19702 ) ) ( not ( = ?auto_19694 ?auto_19707 ) ) ( not ( = ?auto_19694 ?auto_19689 ) ) ( not ( = ?auto_19690 ?auto_19721 ) ) ( not ( = ?auto_19690 ?auto_19720 ) ) ( not ( = ?auto_19690 ?auto_19703 ) ) ( not ( = ?auto_19690 ?auto_19688 ) ) ( not ( = ?auto_19690 ?auto_19706 ) ) ( not ( = ?auto_19690 ?auto_19717 ) ) ( not ( = ?auto_19690 ?auto_19709 ) ) ( not ( = ?auto_19690 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19677 ) ) ( not ( = ?auto_19666 ?auto_19716 ) ) ( not ( = ?auto_19667 ?auto_19677 ) ) ( not ( = ?auto_19667 ?auto_19716 ) ) ( not ( = ?auto_19668 ?auto_19677 ) ) ( not ( = ?auto_19668 ?auto_19716 ) ) ( not ( = ?auto_19669 ?auto_19677 ) ) ( not ( = ?auto_19669 ?auto_19716 ) ) ( not ( = ?auto_19670 ?auto_19677 ) ) ( not ( = ?auto_19670 ?auto_19716 ) ) ( not ( = ?auto_19673 ?auto_19677 ) ) ( not ( = ?auto_19673 ?auto_19716 ) ) ( not ( = ?auto_19671 ?auto_19677 ) ) ( not ( = ?auto_19671 ?auto_19716 ) ) ( not ( = ?auto_19675 ?auto_19677 ) ) ( not ( = ?auto_19675 ?auto_19716 ) ) ( not ( = ?auto_19674 ?auto_19677 ) ) ( not ( = ?auto_19674 ?auto_19716 ) ) ( not ( = ?auto_19677 ?auto_19690 ) ) ( not ( = ?auto_19677 ?auto_19721 ) ) ( not ( = ?auto_19677 ?auto_19720 ) ) ( not ( = ?auto_19677 ?auto_19703 ) ) ( not ( = ?auto_19677 ?auto_19688 ) ) ( not ( = ?auto_19677 ?auto_19706 ) ) ( not ( = ?auto_19677 ?auto_19717 ) ) ( not ( = ?auto_19677 ?auto_19709 ) ) ( not ( = ?auto_19677 ?auto_19686 ) ) ( not ( = ?auto_19712 ?auto_19704 ) ) ( not ( = ?auto_19712 ?auto_19687 ) ) ( not ( = ?auto_19712 ?auto_19715 ) ) ( not ( = ?auto_19712 ?auto_19692 ) ) ( not ( = ?auto_19712 ?auto_19700 ) ) ( not ( = ?auto_19712 ?auto_19710 ) ) ( not ( = ?auto_19712 ?auto_19701 ) ) ( not ( = ?auto_19712 ?auto_19711 ) ) ( not ( = ?auto_19712 ?auto_19713 ) ) ( not ( = ?auto_19693 ?auto_19694 ) ) ( not ( = ?auto_19693 ?auto_19697 ) ) ( not ( = ?auto_19693 ?auto_19705 ) ) ( not ( = ?auto_19693 ?auto_19691 ) ) ( not ( = ?auto_19693 ?auto_19718 ) ) ( not ( = ?auto_19693 ?auto_19696 ) ) ( not ( = ?auto_19693 ?auto_19702 ) ) ( not ( = ?auto_19693 ?auto_19707 ) ) ( not ( = ?auto_19693 ?auto_19689 ) ) ( not ( = ?auto_19716 ?auto_19690 ) ) ( not ( = ?auto_19716 ?auto_19721 ) ) ( not ( = ?auto_19716 ?auto_19720 ) ) ( not ( = ?auto_19716 ?auto_19703 ) ) ( not ( = ?auto_19716 ?auto_19688 ) ) ( not ( = ?auto_19716 ?auto_19706 ) ) ( not ( = ?auto_19716 ?auto_19717 ) ) ( not ( = ?auto_19716 ?auto_19709 ) ) ( not ( = ?auto_19716 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19676 ) ) ( not ( = ?auto_19666 ?auto_19695 ) ) ( not ( = ?auto_19667 ?auto_19676 ) ) ( not ( = ?auto_19667 ?auto_19695 ) ) ( not ( = ?auto_19668 ?auto_19676 ) ) ( not ( = ?auto_19668 ?auto_19695 ) ) ( not ( = ?auto_19669 ?auto_19676 ) ) ( not ( = ?auto_19669 ?auto_19695 ) ) ( not ( = ?auto_19670 ?auto_19676 ) ) ( not ( = ?auto_19670 ?auto_19695 ) ) ( not ( = ?auto_19673 ?auto_19676 ) ) ( not ( = ?auto_19673 ?auto_19695 ) ) ( not ( = ?auto_19671 ?auto_19676 ) ) ( not ( = ?auto_19671 ?auto_19695 ) ) ( not ( = ?auto_19675 ?auto_19676 ) ) ( not ( = ?auto_19675 ?auto_19695 ) ) ( not ( = ?auto_19674 ?auto_19676 ) ) ( not ( = ?auto_19674 ?auto_19695 ) ) ( not ( = ?auto_19672 ?auto_19676 ) ) ( not ( = ?auto_19672 ?auto_19695 ) ) ( not ( = ?auto_19676 ?auto_19716 ) ) ( not ( = ?auto_19676 ?auto_19690 ) ) ( not ( = ?auto_19676 ?auto_19721 ) ) ( not ( = ?auto_19676 ?auto_19720 ) ) ( not ( = ?auto_19676 ?auto_19703 ) ) ( not ( = ?auto_19676 ?auto_19688 ) ) ( not ( = ?auto_19676 ?auto_19706 ) ) ( not ( = ?auto_19676 ?auto_19717 ) ) ( not ( = ?auto_19676 ?auto_19709 ) ) ( not ( = ?auto_19676 ?auto_19686 ) ) ( not ( = ?auto_19714 ?auto_19712 ) ) ( not ( = ?auto_19714 ?auto_19704 ) ) ( not ( = ?auto_19714 ?auto_19687 ) ) ( not ( = ?auto_19714 ?auto_19715 ) ) ( not ( = ?auto_19714 ?auto_19692 ) ) ( not ( = ?auto_19714 ?auto_19700 ) ) ( not ( = ?auto_19714 ?auto_19710 ) ) ( not ( = ?auto_19714 ?auto_19701 ) ) ( not ( = ?auto_19714 ?auto_19711 ) ) ( not ( = ?auto_19714 ?auto_19713 ) ) ( not ( = ?auto_19719 ?auto_19693 ) ) ( not ( = ?auto_19719 ?auto_19694 ) ) ( not ( = ?auto_19719 ?auto_19697 ) ) ( not ( = ?auto_19719 ?auto_19705 ) ) ( not ( = ?auto_19719 ?auto_19691 ) ) ( not ( = ?auto_19719 ?auto_19718 ) ) ( not ( = ?auto_19719 ?auto_19696 ) ) ( not ( = ?auto_19719 ?auto_19702 ) ) ( not ( = ?auto_19719 ?auto_19707 ) ) ( not ( = ?auto_19719 ?auto_19689 ) ) ( not ( = ?auto_19695 ?auto_19716 ) ) ( not ( = ?auto_19695 ?auto_19690 ) ) ( not ( = ?auto_19695 ?auto_19721 ) ) ( not ( = ?auto_19695 ?auto_19720 ) ) ( not ( = ?auto_19695 ?auto_19703 ) ) ( not ( = ?auto_19695 ?auto_19688 ) ) ( not ( = ?auto_19695 ?auto_19706 ) ) ( not ( = ?auto_19695 ?auto_19717 ) ) ( not ( = ?auto_19695 ?auto_19709 ) ) ( not ( = ?auto_19695 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19678 ) ) ( not ( = ?auto_19666 ?auto_19708 ) ) ( not ( = ?auto_19667 ?auto_19678 ) ) ( not ( = ?auto_19667 ?auto_19708 ) ) ( not ( = ?auto_19668 ?auto_19678 ) ) ( not ( = ?auto_19668 ?auto_19708 ) ) ( not ( = ?auto_19669 ?auto_19678 ) ) ( not ( = ?auto_19669 ?auto_19708 ) ) ( not ( = ?auto_19670 ?auto_19678 ) ) ( not ( = ?auto_19670 ?auto_19708 ) ) ( not ( = ?auto_19673 ?auto_19678 ) ) ( not ( = ?auto_19673 ?auto_19708 ) ) ( not ( = ?auto_19671 ?auto_19678 ) ) ( not ( = ?auto_19671 ?auto_19708 ) ) ( not ( = ?auto_19675 ?auto_19678 ) ) ( not ( = ?auto_19675 ?auto_19708 ) ) ( not ( = ?auto_19674 ?auto_19678 ) ) ( not ( = ?auto_19674 ?auto_19708 ) ) ( not ( = ?auto_19672 ?auto_19678 ) ) ( not ( = ?auto_19672 ?auto_19708 ) ) ( not ( = ?auto_19677 ?auto_19678 ) ) ( not ( = ?auto_19677 ?auto_19708 ) ) ( not ( = ?auto_19678 ?auto_19695 ) ) ( not ( = ?auto_19678 ?auto_19716 ) ) ( not ( = ?auto_19678 ?auto_19690 ) ) ( not ( = ?auto_19678 ?auto_19721 ) ) ( not ( = ?auto_19678 ?auto_19720 ) ) ( not ( = ?auto_19678 ?auto_19703 ) ) ( not ( = ?auto_19678 ?auto_19688 ) ) ( not ( = ?auto_19678 ?auto_19706 ) ) ( not ( = ?auto_19678 ?auto_19717 ) ) ( not ( = ?auto_19678 ?auto_19709 ) ) ( not ( = ?auto_19678 ?auto_19686 ) ) ( not ( = ?auto_19699 ?auto_19714 ) ) ( not ( = ?auto_19699 ?auto_19712 ) ) ( not ( = ?auto_19699 ?auto_19704 ) ) ( not ( = ?auto_19699 ?auto_19687 ) ) ( not ( = ?auto_19699 ?auto_19715 ) ) ( not ( = ?auto_19699 ?auto_19692 ) ) ( not ( = ?auto_19699 ?auto_19700 ) ) ( not ( = ?auto_19699 ?auto_19710 ) ) ( not ( = ?auto_19699 ?auto_19701 ) ) ( not ( = ?auto_19699 ?auto_19711 ) ) ( not ( = ?auto_19699 ?auto_19713 ) ) ( not ( = ?auto_19698 ?auto_19719 ) ) ( not ( = ?auto_19698 ?auto_19693 ) ) ( not ( = ?auto_19698 ?auto_19694 ) ) ( not ( = ?auto_19698 ?auto_19697 ) ) ( not ( = ?auto_19698 ?auto_19705 ) ) ( not ( = ?auto_19698 ?auto_19691 ) ) ( not ( = ?auto_19698 ?auto_19718 ) ) ( not ( = ?auto_19698 ?auto_19696 ) ) ( not ( = ?auto_19698 ?auto_19702 ) ) ( not ( = ?auto_19698 ?auto_19707 ) ) ( not ( = ?auto_19698 ?auto_19689 ) ) ( not ( = ?auto_19708 ?auto_19695 ) ) ( not ( = ?auto_19708 ?auto_19716 ) ) ( not ( = ?auto_19708 ?auto_19690 ) ) ( not ( = ?auto_19708 ?auto_19721 ) ) ( not ( = ?auto_19708 ?auto_19720 ) ) ( not ( = ?auto_19708 ?auto_19703 ) ) ( not ( = ?auto_19708 ?auto_19688 ) ) ( not ( = ?auto_19708 ?auto_19706 ) ) ( not ( = ?auto_19708 ?auto_19717 ) ) ( not ( = ?auto_19708 ?auto_19709 ) ) ( not ( = ?auto_19708 ?auto_19686 ) ) ( not ( = ?auto_19666 ?auto_19679 ) ) ( not ( = ?auto_19666 ?auto_19682 ) ) ( not ( = ?auto_19667 ?auto_19679 ) ) ( not ( = ?auto_19667 ?auto_19682 ) ) ( not ( = ?auto_19668 ?auto_19679 ) ) ( not ( = ?auto_19668 ?auto_19682 ) ) ( not ( = ?auto_19669 ?auto_19679 ) ) ( not ( = ?auto_19669 ?auto_19682 ) ) ( not ( = ?auto_19670 ?auto_19679 ) ) ( not ( = ?auto_19670 ?auto_19682 ) ) ( not ( = ?auto_19673 ?auto_19679 ) ) ( not ( = ?auto_19673 ?auto_19682 ) ) ( not ( = ?auto_19671 ?auto_19679 ) ) ( not ( = ?auto_19671 ?auto_19682 ) ) ( not ( = ?auto_19675 ?auto_19679 ) ) ( not ( = ?auto_19675 ?auto_19682 ) ) ( not ( = ?auto_19674 ?auto_19679 ) ) ( not ( = ?auto_19674 ?auto_19682 ) ) ( not ( = ?auto_19672 ?auto_19679 ) ) ( not ( = ?auto_19672 ?auto_19682 ) ) ( not ( = ?auto_19677 ?auto_19679 ) ) ( not ( = ?auto_19677 ?auto_19682 ) ) ( not ( = ?auto_19676 ?auto_19679 ) ) ( not ( = ?auto_19676 ?auto_19682 ) ) ( not ( = ?auto_19679 ?auto_19708 ) ) ( not ( = ?auto_19679 ?auto_19695 ) ) ( not ( = ?auto_19679 ?auto_19716 ) ) ( not ( = ?auto_19679 ?auto_19690 ) ) ( not ( = ?auto_19679 ?auto_19721 ) ) ( not ( = ?auto_19679 ?auto_19720 ) ) ( not ( = ?auto_19679 ?auto_19703 ) ) ( not ( = ?auto_19679 ?auto_19688 ) ) ( not ( = ?auto_19679 ?auto_19706 ) ) ( not ( = ?auto_19679 ?auto_19717 ) ) ( not ( = ?auto_19679 ?auto_19709 ) ) ( not ( = ?auto_19679 ?auto_19686 ) ) ( not ( = ?auto_19680 ?auto_19699 ) ) ( not ( = ?auto_19680 ?auto_19714 ) ) ( not ( = ?auto_19680 ?auto_19712 ) ) ( not ( = ?auto_19680 ?auto_19704 ) ) ( not ( = ?auto_19680 ?auto_19687 ) ) ( not ( = ?auto_19680 ?auto_19715 ) ) ( not ( = ?auto_19680 ?auto_19692 ) ) ( not ( = ?auto_19680 ?auto_19700 ) ) ( not ( = ?auto_19680 ?auto_19710 ) ) ( not ( = ?auto_19680 ?auto_19701 ) ) ( not ( = ?auto_19680 ?auto_19711 ) ) ( not ( = ?auto_19680 ?auto_19713 ) ) ( not ( = ?auto_19684 ?auto_19698 ) ) ( not ( = ?auto_19684 ?auto_19719 ) ) ( not ( = ?auto_19684 ?auto_19693 ) ) ( not ( = ?auto_19684 ?auto_19694 ) ) ( not ( = ?auto_19684 ?auto_19697 ) ) ( not ( = ?auto_19684 ?auto_19705 ) ) ( not ( = ?auto_19684 ?auto_19691 ) ) ( not ( = ?auto_19684 ?auto_19718 ) ) ( not ( = ?auto_19684 ?auto_19696 ) ) ( not ( = ?auto_19684 ?auto_19702 ) ) ( not ( = ?auto_19684 ?auto_19707 ) ) ( not ( = ?auto_19684 ?auto_19689 ) ) ( not ( = ?auto_19682 ?auto_19708 ) ) ( not ( = ?auto_19682 ?auto_19695 ) ) ( not ( = ?auto_19682 ?auto_19716 ) ) ( not ( = ?auto_19682 ?auto_19690 ) ) ( not ( = ?auto_19682 ?auto_19721 ) ) ( not ( = ?auto_19682 ?auto_19720 ) ) ( not ( = ?auto_19682 ?auto_19703 ) ) ( not ( = ?auto_19682 ?auto_19688 ) ) ( not ( = ?auto_19682 ?auto_19706 ) ) ( not ( = ?auto_19682 ?auto_19717 ) ) ( not ( = ?auto_19682 ?auto_19709 ) ) ( not ( = ?auto_19682 ?auto_19686 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19666 ?auto_19667 ?auto_19668 ?auto_19669 ?auto_19670 ?auto_19673 ?auto_19671 ?auto_19675 ?auto_19674 ?auto_19672 ?auto_19677 ?auto_19676 ?auto_19678 )
      ( MAKE-1CRATE ?auto_19678 ?auto_19679 )
      ( MAKE-13CRATE-VERIFY ?auto_19666 ?auto_19667 ?auto_19668 ?auto_19669 ?auto_19670 ?auto_19673 ?auto_19671 ?auto_19675 ?auto_19674 ?auto_19672 ?auto_19677 ?auto_19676 ?auto_19678 ?auto_19679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19724 - SURFACE
      ?auto_19725 - SURFACE
    )
    :vars
    (
      ?auto_19726 - HOIST
      ?auto_19727 - PLACE
      ?auto_19729 - PLACE
      ?auto_19730 - HOIST
      ?auto_19731 - SURFACE
      ?auto_19728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19726 ?auto_19727 ) ( SURFACE-AT ?auto_19724 ?auto_19727 ) ( CLEAR ?auto_19724 ) ( IS-CRATE ?auto_19725 ) ( AVAILABLE ?auto_19726 ) ( not ( = ?auto_19729 ?auto_19727 ) ) ( HOIST-AT ?auto_19730 ?auto_19729 ) ( AVAILABLE ?auto_19730 ) ( SURFACE-AT ?auto_19725 ?auto_19729 ) ( ON ?auto_19725 ?auto_19731 ) ( CLEAR ?auto_19725 ) ( TRUCK-AT ?auto_19728 ?auto_19727 ) ( not ( = ?auto_19724 ?auto_19725 ) ) ( not ( = ?auto_19724 ?auto_19731 ) ) ( not ( = ?auto_19725 ?auto_19731 ) ) ( not ( = ?auto_19726 ?auto_19730 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19728 ?auto_19727 ?auto_19729 )
      ( !LIFT ?auto_19730 ?auto_19725 ?auto_19731 ?auto_19729 )
      ( !LOAD ?auto_19730 ?auto_19725 ?auto_19728 ?auto_19729 )
      ( !DRIVE ?auto_19728 ?auto_19729 ?auto_19727 )
      ( !UNLOAD ?auto_19726 ?auto_19725 ?auto_19728 ?auto_19727 )
      ( !DROP ?auto_19726 ?auto_19725 ?auto_19724 ?auto_19727 )
      ( MAKE-1CRATE-VERIFY ?auto_19724 ?auto_19725 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_19747 - SURFACE
      ?auto_19748 - SURFACE
      ?auto_19749 - SURFACE
      ?auto_19750 - SURFACE
      ?auto_19751 - SURFACE
      ?auto_19754 - SURFACE
      ?auto_19752 - SURFACE
      ?auto_19756 - SURFACE
      ?auto_19755 - SURFACE
      ?auto_19753 - SURFACE
      ?auto_19758 - SURFACE
      ?auto_19757 - SURFACE
      ?auto_19759 - SURFACE
      ?auto_19760 - SURFACE
      ?auto_19761 - SURFACE
    )
    :vars
    (
      ?auto_19765 - HOIST
      ?auto_19762 - PLACE
      ?auto_19766 - PLACE
      ?auto_19767 - HOIST
      ?auto_19763 - SURFACE
      ?auto_19776 - PLACE
      ?auto_19784 - HOIST
      ?auto_19783 - SURFACE
      ?auto_19801 - PLACE
      ?auto_19777 - HOIST
      ?auto_19773 - SURFACE
      ?auto_19771 - PLACE
      ?auto_19802 - HOIST
      ?auto_19791 - SURFACE
      ?auto_19768 - PLACE
      ?auto_19790 - HOIST
      ?auto_19792 - SURFACE
      ?auto_19780 - PLACE
      ?auto_19803 - HOIST
      ?auto_19795 - SURFACE
      ?auto_19794 - PLACE
      ?auto_19779 - HOIST
      ?auto_19772 - SURFACE
      ?auto_19770 - PLACE
      ?auto_19804 - HOIST
      ?auto_19806 - SURFACE
      ?auto_19797 - PLACE
      ?auto_19785 - HOIST
      ?auto_19788 - SURFACE
      ?auto_19781 - PLACE
      ?auto_19786 - HOIST
      ?auto_19782 - SURFACE
      ?auto_19774 - PLACE
      ?auto_19778 - HOIST
      ?auto_19775 - SURFACE
      ?auto_19800 - PLACE
      ?auto_19799 - HOIST
      ?auto_19796 - SURFACE
      ?auto_19769 - PLACE
      ?auto_19798 - HOIST
      ?auto_19787 - SURFACE
      ?auto_19789 - PLACE
      ?auto_19793 - HOIST
      ?auto_19805 - SURFACE
      ?auto_19764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19765 ?auto_19762 ) ( IS-CRATE ?auto_19761 ) ( not ( = ?auto_19766 ?auto_19762 ) ) ( HOIST-AT ?auto_19767 ?auto_19766 ) ( AVAILABLE ?auto_19767 ) ( SURFACE-AT ?auto_19761 ?auto_19766 ) ( ON ?auto_19761 ?auto_19763 ) ( CLEAR ?auto_19761 ) ( not ( = ?auto_19760 ?auto_19761 ) ) ( not ( = ?auto_19760 ?auto_19763 ) ) ( not ( = ?auto_19761 ?auto_19763 ) ) ( not ( = ?auto_19765 ?auto_19767 ) ) ( IS-CRATE ?auto_19760 ) ( not ( = ?auto_19776 ?auto_19762 ) ) ( HOIST-AT ?auto_19784 ?auto_19776 ) ( AVAILABLE ?auto_19784 ) ( SURFACE-AT ?auto_19760 ?auto_19776 ) ( ON ?auto_19760 ?auto_19783 ) ( CLEAR ?auto_19760 ) ( not ( = ?auto_19759 ?auto_19760 ) ) ( not ( = ?auto_19759 ?auto_19783 ) ) ( not ( = ?auto_19760 ?auto_19783 ) ) ( not ( = ?auto_19765 ?auto_19784 ) ) ( IS-CRATE ?auto_19759 ) ( not ( = ?auto_19801 ?auto_19762 ) ) ( HOIST-AT ?auto_19777 ?auto_19801 ) ( AVAILABLE ?auto_19777 ) ( SURFACE-AT ?auto_19759 ?auto_19801 ) ( ON ?auto_19759 ?auto_19773 ) ( CLEAR ?auto_19759 ) ( not ( = ?auto_19757 ?auto_19759 ) ) ( not ( = ?auto_19757 ?auto_19773 ) ) ( not ( = ?auto_19759 ?auto_19773 ) ) ( not ( = ?auto_19765 ?auto_19777 ) ) ( IS-CRATE ?auto_19757 ) ( not ( = ?auto_19771 ?auto_19762 ) ) ( HOIST-AT ?auto_19802 ?auto_19771 ) ( AVAILABLE ?auto_19802 ) ( SURFACE-AT ?auto_19757 ?auto_19771 ) ( ON ?auto_19757 ?auto_19791 ) ( CLEAR ?auto_19757 ) ( not ( = ?auto_19758 ?auto_19757 ) ) ( not ( = ?auto_19758 ?auto_19791 ) ) ( not ( = ?auto_19757 ?auto_19791 ) ) ( not ( = ?auto_19765 ?auto_19802 ) ) ( IS-CRATE ?auto_19758 ) ( not ( = ?auto_19768 ?auto_19762 ) ) ( HOIST-AT ?auto_19790 ?auto_19768 ) ( AVAILABLE ?auto_19790 ) ( SURFACE-AT ?auto_19758 ?auto_19768 ) ( ON ?auto_19758 ?auto_19792 ) ( CLEAR ?auto_19758 ) ( not ( = ?auto_19753 ?auto_19758 ) ) ( not ( = ?auto_19753 ?auto_19792 ) ) ( not ( = ?auto_19758 ?auto_19792 ) ) ( not ( = ?auto_19765 ?auto_19790 ) ) ( IS-CRATE ?auto_19753 ) ( not ( = ?auto_19780 ?auto_19762 ) ) ( HOIST-AT ?auto_19803 ?auto_19780 ) ( AVAILABLE ?auto_19803 ) ( SURFACE-AT ?auto_19753 ?auto_19780 ) ( ON ?auto_19753 ?auto_19795 ) ( CLEAR ?auto_19753 ) ( not ( = ?auto_19755 ?auto_19753 ) ) ( not ( = ?auto_19755 ?auto_19795 ) ) ( not ( = ?auto_19753 ?auto_19795 ) ) ( not ( = ?auto_19765 ?auto_19803 ) ) ( IS-CRATE ?auto_19755 ) ( not ( = ?auto_19794 ?auto_19762 ) ) ( HOIST-AT ?auto_19779 ?auto_19794 ) ( AVAILABLE ?auto_19779 ) ( SURFACE-AT ?auto_19755 ?auto_19794 ) ( ON ?auto_19755 ?auto_19772 ) ( CLEAR ?auto_19755 ) ( not ( = ?auto_19756 ?auto_19755 ) ) ( not ( = ?auto_19756 ?auto_19772 ) ) ( not ( = ?auto_19755 ?auto_19772 ) ) ( not ( = ?auto_19765 ?auto_19779 ) ) ( IS-CRATE ?auto_19756 ) ( not ( = ?auto_19770 ?auto_19762 ) ) ( HOIST-AT ?auto_19804 ?auto_19770 ) ( AVAILABLE ?auto_19804 ) ( SURFACE-AT ?auto_19756 ?auto_19770 ) ( ON ?auto_19756 ?auto_19806 ) ( CLEAR ?auto_19756 ) ( not ( = ?auto_19752 ?auto_19756 ) ) ( not ( = ?auto_19752 ?auto_19806 ) ) ( not ( = ?auto_19756 ?auto_19806 ) ) ( not ( = ?auto_19765 ?auto_19804 ) ) ( IS-CRATE ?auto_19752 ) ( not ( = ?auto_19797 ?auto_19762 ) ) ( HOIST-AT ?auto_19785 ?auto_19797 ) ( AVAILABLE ?auto_19785 ) ( SURFACE-AT ?auto_19752 ?auto_19797 ) ( ON ?auto_19752 ?auto_19788 ) ( CLEAR ?auto_19752 ) ( not ( = ?auto_19754 ?auto_19752 ) ) ( not ( = ?auto_19754 ?auto_19788 ) ) ( not ( = ?auto_19752 ?auto_19788 ) ) ( not ( = ?auto_19765 ?auto_19785 ) ) ( IS-CRATE ?auto_19754 ) ( not ( = ?auto_19781 ?auto_19762 ) ) ( HOIST-AT ?auto_19786 ?auto_19781 ) ( AVAILABLE ?auto_19786 ) ( SURFACE-AT ?auto_19754 ?auto_19781 ) ( ON ?auto_19754 ?auto_19782 ) ( CLEAR ?auto_19754 ) ( not ( = ?auto_19751 ?auto_19754 ) ) ( not ( = ?auto_19751 ?auto_19782 ) ) ( not ( = ?auto_19754 ?auto_19782 ) ) ( not ( = ?auto_19765 ?auto_19786 ) ) ( IS-CRATE ?auto_19751 ) ( not ( = ?auto_19774 ?auto_19762 ) ) ( HOIST-AT ?auto_19778 ?auto_19774 ) ( AVAILABLE ?auto_19778 ) ( SURFACE-AT ?auto_19751 ?auto_19774 ) ( ON ?auto_19751 ?auto_19775 ) ( CLEAR ?auto_19751 ) ( not ( = ?auto_19750 ?auto_19751 ) ) ( not ( = ?auto_19750 ?auto_19775 ) ) ( not ( = ?auto_19751 ?auto_19775 ) ) ( not ( = ?auto_19765 ?auto_19778 ) ) ( IS-CRATE ?auto_19750 ) ( not ( = ?auto_19800 ?auto_19762 ) ) ( HOIST-AT ?auto_19799 ?auto_19800 ) ( AVAILABLE ?auto_19799 ) ( SURFACE-AT ?auto_19750 ?auto_19800 ) ( ON ?auto_19750 ?auto_19796 ) ( CLEAR ?auto_19750 ) ( not ( = ?auto_19749 ?auto_19750 ) ) ( not ( = ?auto_19749 ?auto_19796 ) ) ( not ( = ?auto_19750 ?auto_19796 ) ) ( not ( = ?auto_19765 ?auto_19799 ) ) ( IS-CRATE ?auto_19749 ) ( not ( = ?auto_19769 ?auto_19762 ) ) ( HOIST-AT ?auto_19798 ?auto_19769 ) ( AVAILABLE ?auto_19798 ) ( SURFACE-AT ?auto_19749 ?auto_19769 ) ( ON ?auto_19749 ?auto_19787 ) ( CLEAR ?auto_19749 ) ( not ( = ?auto_19748 ?auto_19749 ) ) ( not ( = ?auto_19748 ?auto_19787 ) ) ( not ( = ?auto_19749 ?auto_19787 ) ) ( not ( = ?auto_19765 ?auto_19798 ) ) ( SURFACE-AT ?auto_19747 ?auto_19762 ) ( CLEAR ?auto_19747 ) ( IS-CRATE ?auto_19748 ) ( AVAILABLE ?auto_19765 ) ( not ( = ?auto_19789 ?auto_19762 ) ) ( HOIST-AT ?auto_19793 ?auto_19789 ) ( AVAILABLE ?auto_19793 ) ( SURFACE-AT ?auto_19748 ?auto_19789 ) ( ON ?auto_19748 ?auto_19805 ) ( CLEAR ?auto_19748 ) ( TRUCK-AT ?auto_19764 ?auto_19762 ) ( not ( = ?auto_19747 ?auto_19748 ) ) ( not ( = ?auto_19747 ?auto_19805 ) ) ( not ( = ?auto_19748 ?auto_19805 ) ) ( not ( = ?auto_19765 ?auto_19793 ) ) ( not ( = ?auto_19747 ?auto_19749 ) ) ( not ( = ?auto_19747 ?auto_19787 ) ) ( not ( = ?auto_19749 ?auto_19805 ) ) ( not ( = ?auto_19769 ?auto_19789 ) ) ( not ( = ?auto_19798 ?auto_19793 ) ) ( not ( = ?auto_19787 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19750 ) ) ( not ( = ?auto_19747 ?auto_19796 ) ) ( not ( = ?auto_19748 ?auto_19750 ) ) ( not ( = ?auto_19748 ?auto_19796 ) ) ( not ( = ?auto_19750 ?auto_19787 ) ) ( not ( = ?auto_19750 ?auto_19805 ) ) ( not ( = ?auto_19800 ?auto_19769 ) ) ( not ( = ?auto_19800 ?auto_19789 ) ) ( not ( = ?auto_19799 ?auto_19798 ) ) ( not ( = ?auto_19799 ?auto_19793 ) ) ( not ( = ?auto_19796 ?auto_19787 ) ) ( not ( = ?auto_19796 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19751 ) ) ( not ( = ?auto_19747 ?auto_19775 ) ) ( not ( = ?auto_19748 ?auto_19751 ) ) ( not ( = ?auto_19748 ?auto_19775 ) ) ( not ( = ?auto_19749 ?auto_19751 ) ) ( not ( = ?auto_19749 ?auto_19775 ) ) ( not ( = ?auto_19751 ?auto_19796 ) ) ( not ( = ?auto_19751 ?auto_19787 ) ) ( not ( = ?auto_19751 ?auto_19805 ) ) ( not ( = ?auto_19774 ?auto_19800 ) ) ( not ( = ?auto_19774 ?auto_19769 ) ) ( not ( = ?auto_19774 ?auto_19789 ) ) ( not ( = ?auto_19778 ?auto_19799 ) ) ( not ( = ?auto_19778 ?auto_19798 ) ) ( not ( = ?auto_19778 ?auto_19793 ) ) ( not ( = ?auto_19775 ?auto_19796 ) ) ( not ( = ?auto_19775 ?auto_19787 ) ) ( not ( = ?auto_19775 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19754 ) ) ( not ( = ?auto_19747 ?auto_19782 ) ) ( not ( = ?auto_19748 ?auto_19754 ) ) ( not ( = ?auto_19748 ?auto_19782 ) ) ( not ( = ?auto_19749 ?auto_19754 ) ) ( not ( = ?auto_19749 ?auto_19782 ) ) ( not ( = ?auto_19750 ?auto_19754 ) ) ( not ( = ?auto_19750 ?auto_19782 ) ) ( not ( = ?auto_19754 ?auto_19775 ) ) ( not ( = ?auto_19754 ?auto_19796 ) ) ( not ( = ?auto_19754 ?auto_19787 ) ) ( not ( = ?auto_19754 ?auto_19805 ) ) ( not ( = ?auto_19781 ?auto_19774 ) ) ( not ( = ?auto_19781 ?auto_19800 ) ) ( not ( = ?auto_19781 ?auto_19769 ) ) ( not ( = ?auto_19781 ?auto_19789 ) ) ( not ( = ?auto_19786 ?auto_19778 ) ) ( not ( = ?auto_19786 ?auto_19799 ) ) ( not ( = ?auto_19786 ?auto_19798 ) ) ( not ( = ?auto_19786 ?auto_19793 ) ) ( not ( = ?auto_19782 ?auto_19775 ) ) ( not ( = ?auto_19782 ?auto_19796 ) ) ( not ( = ?auto_19782 ?auto_19787 ) ) ( not ( = ?auto_19782 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19752 ) ) ( not ( = ?auto_19747 ?auto_19788 ) ) ( not ( = ?auto_19748 ?auto_19752 ) ) ( not ( = ?auto_19748 ?auto_19788 ) ) ( not ( = ?auto_19749 ?auto_19752 ) ) ( not ( = ?auto_19749 ?auto_19788 ) ) ( not ( = ?auto_19750 ?auto_19752 ) ) ( not ( = ?auto_19750 ?auto_19788 ) ) ( not ( = ?auto_19751 ?auto_19752 ) ) ( not ( = ?auto_19751 ?auto_19788 ) ) ( not ( = ?auto_19752 ?auto_19782 ) ) ( not ( = ?auto_19752 ?auto_19775 ) ) ( not ( = ?auto_19752 ?auto_19796 ) ) ( not ( = ?auto_19752 ?auto_19787 ) ) ( not ( = ?auto_19752 ?auto_19805 ) ) ( not ( = ?auto_19797 ?auto_19781 ) ) ( not ( = ?auto_19797 ?auto_19774 ) ) ( not ( = ?auto_19797 ?auto_19800 ) ) ( not ( = ?auto_19797 ?auto_19769 ) ) ( not ( = ?auto_19797 ?auto_19789 ) ) ( not ( = ?auto_19785 ?auto_19786 ) ) ( not ( = ?auto_19785 ?auto_19778 ) ) ( not ( = ?auto_19785 ?auto_19799 ) ) ( not ( = ?auto_19785 ?auto_19798 ) ) ( not ( = ?auto_19785 ?auto_19793 ) ) ( not ( = ?auto_19788 ?auto_19782 ) ) ( not ( = ?auto_19788 ?auto_19775 ) ) ( not ( = ?auto_19788 ?auto_19796 ) ) ( not ( = ?auto_19788 ?auto_19787 ) ) ( not ( = ?auto_19788 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19756 ) ) ( not ( = ?auto_19747 ?auto_19806 ) ) ( not ( = ?auto_19748 ?auto_19756 ) ) ( not ( = ?auto_19748 ?auto_19806 ) ) ( not ( = ?auto_19749 ?auto_19756 ) ) ( not ( = ?auto_19749 ?auto_19806 ) ) ( not ( = ?auto_19750 ?auto_19756 ) ) ( not ( = ?auto_19750 ?auto_19806 ) ) ( not ( = ?auto_19751 ?auto_19756 ) ) ( not ( = ?auto_19751 ?auto_19806 ) ) ( not ( = ?auto_19754 ?auto_19756 ) ) ( not ( = ?auto_19754 ?auto_19806 ) ) ( not ( = ?auto_19756 ?auto_19788 ) ) ( not ( = ?auto_19756 ?auto_19782 ) ) ( not ( = ?auto_19756 ?auto_19775 ) ) ( not ( = ?auto_19756 ?auto_19796 ) ) ( not ( = ?auto_19756 ?auto_19787 ) ) ( not ( = ?auto_19756 ?auto_19805 ) ) ( not ( = ?auto_19770 ?auto_19797 ) ) ( not ( = ?auto_19770 ?auto_19781 ) ) ( not ( = ?auto_19770 ?auto_19774 ) ) ( not ( = ?auto_19770 ?auto_19800 ) ) ( not ( = ?auto_19770 ?auto_19769 ) ) ( not ( = ?auto_19770 ?auto_19789 ) ) ( not ( = ?auto_19804 ?auto_19785 ) ) ( not ( = ?auto_19804 ?auto_19786 ) ) ( not ( = ?auto_19804 ?auto_19778 ) ) ( not ( = ?auto_19804 ?auto_19799 ) ) ( not ( = ?auto_19804 ?auto_19798 ) ) ( not ( = ?auto_19804 ?auto_19793 ) ) ( not ( = ?auto_19806 ?auto_19788 ) ) ( not ( = ?auto_19806 ?auto_19782 ) ) ( not ( = ?auto_19806 ?auto_19775 ) ) ( not ( = ?auto_19806 ?auto_19796 ) ) ( not ( = ?auto_19806 ?auto_19787 ) ) ( not ( = ?auto_19806 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19755 ) ) ( not ( = ?auto_19747 ?auto_19772 ) ) ( not ( = ?auto_19748 ?auto_19755 ) ) ( not ( = ?auto_19748 ?auto_19772 ) ) ( not ( = ?auto_19749 ?auto_19755 ) ) ( not ( = ?auto_19749 ?auto_19772 ) ) ( not ( = ?auto_19750 ?auto_19755 ) ) ( not ( = ?auto_19750 ?auto_19772 ) ) ( not ( = ?auto_19751 ?auto_19755 ) ) ( not ( = ?auto_19751 ?auto_19772 ) ) ( not ( = ?auto_19754 ?auto_19755 ) ) ( not ( = ?auto_19754 ?auto_19772 ) ) ( not ( = ?auto_19752 ?auto_19755 ) ) ( not ( = ?auto_19752 ?auto_19772 ) ) ( not ( = ?auto_19755 ?auto_19806 ) ) ( not ( = ?auto_19755 ?auto_19788 ) ) ( not ( = ?auto_19755 ?auto_19782 ) ) ( not ( = ?auto_19755 ?auto_19775 ) ) ( not ( = ?auto_19755 ?auto_19796 ) ) ( not ( = ?auto_19755 ?auto_19787 ) ) ( not ( = ?auto_19755 ?auto_19805 ) ) ( not ( = ?auto_19794 ?auto_19770 ) ) ( not ( = ?auto_19794 ?auto_19797 ) ) ( not ( = ?auto_19794 ?auto_19781 ) ) ( not ( = ?auto_19794 ?auto_19774 ) ) ( not ( = ?auto_19794 ?auto_19800 ) ) ( not ( = ?auto_19794 ?auto_19769 ) ) ( not ( = ?auto_19794 ?auto_19789 ) ) ( not ( = ?auto_19779 ?auto_19804 ) ) ( not ( = ?auto_19779 ?auto_19785 ) ) ( not ( = ?auto_19779 ?auto_19786 ) ) ( not ( = ?auto_19779 ?auto_19778 ) ) ( not ( = ?auto_19779 ?auto_19799 ) ) ( not ( = ?auto_19779 ?auto_19798 ) ) ( not ( = ?auto_19779 ?auto_19793 ) ) ( not ( = ?auto_19772 ?auto_19806 ) ) ( not ( = ?auto_19772 ?auto_19788 ) ) ( not ( = ?auto_19772 ?auto_19782 ) ) ( not ( = ?auto_19772 ?auto_19775 ) ) ( not ( = ?auto_19772 ?auto_19796 ) ) ( not ( = ?auto_19772 ?auto_19787 ) ) ( not ( = ?auto_19772 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19753 ) ) ( not ( = ?auto_19747 ?auto_19795 ) ) ( not ( = ?auto_19748 ?auto_19753 ) ) ( not ( = ?auto_19748 ?auto_19795 ) ) ( not ( = ?auto_19749 ?auto_19753 ) ) ( not ( = ?auto_19749 ?auto_19795 ) ) ( not ( = ?auto_19750 ?auto_19753 ) ) ( not ( = ?auto_19750 ?auto_19795 ) ) ( not ( = ?auto_19751 ?auto_19753 ) ) ( not ( = ?auto_19751 ?auto_19795 ) ) ( not ( = ?auto_19754 ?auto_19753 ) ) ( not ( = ?auto_19754 ?auto_19795 ) ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19795 ) ) ( not ( = ?auto_19756 ?auto_19753 ) ) ( not ( = ?auto_19756 ?auto_19795 ) ) ( not ( = ?auto_19753 ?auto_19772 ) ) ( not ( = ?auto_19753 ?auto_19806 ) ) ( not ( = ?auto_19753 ?auto_19788 ) ) ( not ( = ?auto_19753 ?auto_19782 ) ) ( not ( = ?auto_19753 ?auto_19775 ) ) ( not ( = ?auto_19753 ?auto_19796 ) ) ( not ( = ?auto_19753 ?auto_19787 ) ) ( not ( = ?auto_19753 ?auto_19805 ) ) ( not ( = ?auto_19780 ?auto_19794 ) ) ( not ( = ?auto_19780 ?auto_19770 ) ) ( not ( = ?auto_19780 ?auto_19797 ) ) ( not ( = ?auto_19780 ?auto_19781 ) ) ( not ( = ?auto_19780 ?auto_19774 ) ) ( not ( = ?auto_19780 ?auto_19800 ) ) ( not ( = ?auto_19780 ?auto_19769 ) ) ( not ( = ?auto_19780 ?auto_19789 ) ) ( not ( = ?auto_19803 ?auto_19779 ) ) ( not ( = ?auto_19803 ?auto_19804 ) ) ( not ( = ?auto_19803 ?auto_19785 ) ) ( not ( = ?auto_19803 ?auto_19786 ) ) ( not ( = ?auto_19803 ?auto_19778 ) ) ( not ( = ?auto_19803 ?auto_19799 ) ) ( not ( = ?auto_19803 ?auto_19798 ) ) ( not ( = ?auto_19803 ?auto_19793 ) ) ( not ( = ?auto_19795 ?auto_19772 ) ) ( not ( = ?auto_19795 ?auto_19806 ) ) ( not ( = ?auto_19795 ?auto_19788 ) ) ( not ( = ?auto_19795 ?auto_19782 ) ) ( not ( = ?auto_19795 ?auto_19775 ) ) ( not ( = ?auto_19795 ?auto_19796 ) ) ( not ( = ?auto_19795 ?auto_19787 ) ) ( not ( = ?auto_19795 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19758 ) ) ( not ( = ?auto_19747 ?auto_19792 ) ) ( not ( = ?auto_19748 ?auto_19758 ) ) ( not ( = ?auto_19748 ?auto_19792 ) ) ( not ( = ?auto_19749 ?auto_19758 ) ) ( not ( = ?auto_19749 ?auto_19792 ) ) ( not ( = ?auto_19750 ?auto_19758 ) ) ( not ( = ?auto_19750 ?auto_19792 ) ) ( not ( = ?auto_19751 ?auto_19758 ) ) ( not ( = ?auto_19751 ?auto_19792 ) ) ( not ( = ?auto_19754 ?auto_19758 ) ) ( not ( = ?auto_19754 ?auto_19792 ) ) ( not ( = ?auto_19752 ?auto_19758 ) ) ( not ( = ?auto_19752 ?auto_19792 ) ) ( not ( = ?auto_19756 ?auto_19758 ) ) ( not ( = ?auto_19756 ?auto_19792 ) ) ( not ( = ?auto_19755 ?auto_19758 ) ) ( not ( = ?auto_19755 ?auto_19792 ) ) ( not ( = ?auto_19758 ?auto_19795 ) ) ( not ( = ?auto_19758 ?auto_19772 ) ) ( not ( = ?auto_19758 ?auto_19806 ) ) ( not ( = ?auto_19758 ?auto_19788 ) ) ( not ( = ?auto_19758 ?auto_19782 ) ) ( not ( = ?auto_19758 ?auto_19775 ) ) ( not ( = ?auto_19758 ?auto_19796 ) ) ( not ( = ?auto_19758 ?auto_19787 ) ) ( not ( = ?auto_19758 ?auto_19805 ) ) ( not ( = ?auto_19768 ?auto_19780 ) ) ( not ( = ?auto_19768 ?auto_19794 ) ) ( not ( = ?auto_19768 ?auto_19770 ) ) ( not ( = ?auto_19768 ?auto_19797 ) ) ( not ( = ?auto_19768 ?auto_19781 ) ) ( not ( = ?auto_19768 ?auto_19774 ) ) ( not ( = ?auto_19768 ?auto_19800 ) ) ( not ( = ?auto_19768 ?auto_19769 ) ) ( not ( = ?auto_19768 ?auto_19789 ) ) ( not ( = ?auto_19790 ?auto_19803 ) ) ( not ( = ?auto_19790 ?auto_19779 ) ) ( not ( = ?auto_19790 ?auto_19804 ) ) ( not ( = ?auto_19790 ?auto_19785 ) ) ( not ( = ?auto_19790 ?auto_19786 ) ) ( not ( = ?auto_19790 ?auto_19778 ) ) ( not ( = ?auto_19790 ?auto_19799 ) ) ( not ( = ?auto_19790 ?auto_19798 ) ) ( not ( = ?auto_19790 ?auto_19793 ) ) ( not ( = ?auto_19792 ?auto_19795 ) ) ( not ( = ?auto_19792 ?auto_19772 ) ) ( not ( = ?auto_19792 ?auto_19806 ) ) ( not ( = ?auto_19792 ?auto_19788 ) ) ( not ( = ?auto_19792 ?auto_19782 ) ) ( not ( = ?auto_19792 ?auto_19775 ) ) ( not ( = ?auto_19792 ?auto_19796 ) ) ( not ( = ?auto_19792 ?auto_19787 ) ) ( not ( = ?auto_19792 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19757 ) ) ( not ( = ?auto_19747 ?auto_19791 ) ) ( not ( = ?auto_19748 ?auto_19757 ) ) ( not ( = ?auto_19748 ?auto_19791 ) ) ( not ( = ?auto_19749 ?auto_19757 ) ) ( not ( = ?auto_19749 ?auto_19791 ) ) ( not ( = ?auto_19750 ?auto_19757 ) ) ( not ( = ?auto_19750 ?auto_19791 ) ) ( not ( = ?auto_19751 ?auto_19757 ) ) ( not ( = ?auto_19751 ?auto_19791 ) ) ( not ( = ?auto_19754 ?auto_19757 ) ) ( not ( = ?auto_19754 ?auto_19791 ) ) ( not ( = ?auto_19752 ?auto_19757 ) ) ( not ( = ?auto_19752 ?auto_19791 ) ) ( not ( = ?auto_19756 ?auto_19757 ) ) ( not ( = ?auto_19756 ?auto_19791 ) ) ( not ( = ?auto_19755 ?auto_19757 ) ) ( not ( = ?auto_19755 ?auto_19791 ) ) ( not ( = ?auto_19753 ?auto_19757 ) ) ( not ( = ?auto_19753 ?auto_19791 ) ) ( not ( = ?auto_19757 ?auto_19792 ) ) ( not ( = ?auto_19757 ?auto_19795 ) ) ( not ( = ?auto_19757 ?auto_19772 ) ) ( not ( = ?auto_19757 ?auto_19806 ) ) ( not ( = ?auto_19757 ?auto_19788 ) ) ( not ( = ?auto_19757 ?auto_19782 ) ) ( not ( = ?auto_19757 ?auto_19775 ) ) ( not ( = ?auto_19757 ?auto_19796 ) ) ( not ( = ?auto_19757 ?auto_19787 ) ) ( not ( = ?auto_19757 ?auto_19805 ) ) ( not ( = ?auto_19771 ?auto_19768 ) ) ( not ( = ?auto_19771 ?auto_19780 ) ) ( not ( = ?auto_19771 ?auto_19794 ) ) ( not ( = ?auto_19771 ?auto_19770 ) ) ( not ( = ?auto_19771 ?auto_19797 ) ) ( not ( = ?auto_19771 ?auto_19781 ) ) ( not ( = ?auto_19771 ?auto_19774 ) ) ( not ( = ?auto_19771 ?auto_19800 ) ) ( not ( = ?auto_19771 ?auto_19769 ) ) ( not ( = ?auto_19771 ?auto_19789 ) ) ( not ( = ?auto_19802 ?auto_19790 ) ) ( not ( = ?auto_19802 ?auto_19803 ) ) ( not ( = ?auto_19802 ?auto_19779 ) ) ( not ( = ?auto_19802 ?auto_19804 ) ) ( not ( = ?auto_19802 ?auto_19785 ) ) ( not ( = ?auto_19802 ?auto_19786 ) ) ( not ( = ?auto_19802 ?auto_19778 ) ) ( not ( = ?auto_19802 ?auto_19799 ) ) ( not ( = ?auto_19802 ?auto_19798 ) ) ( not ( = ?auto_19802 ?auto_19793 ) ) ( not ( = ?auto_19791 ?auto_19792 ) ) ( not ( = ?auto_19791 ?auto_19795 ) ) ( not ( = ?auto_19791 ?auto_19772 ) ) ( not ( = ?auto_19791 ?auto_19806 ) ) ( not ( = ?auto_19791 ?auto_19788 ) ) ( not ( = ?auto_19791 ?auto_19782 ) ) ( not ( = ?auto_19791 ?auto_19775 ) ) ( not ( = ?auto_19791 ?auto_19796 ) ) ( not ( = ?auto_19791 ?auto_19787 ) ) ( not ( = ?auto_19791 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19759 ) ) ( not ( = ?auto_19747 ?auto_19773 ) ) ( not ( = ?auto_19748 ?auto_19759 ) ) ( not ( = ?auto_19748 ?auto_19773 ) ) ( not ( = ?auto_19749 ?auto_19759 ) ) ( not ( = ?auto_19749 ?auto_19773 ) ) ( not ( = ?auto_19750 ?auto_19759 ) ) ( not ( = ?auto_19750 ?auto_19773 ) ) ( not ( = ?auto_19751 ?auto_19759 ) ) ( not ( = ?auto_19751 ?auto_19773 ) ) ( not ( = ?auto_19754 ?auto_19759 ) ) ( not ( = ?auto_19754 ?auto_19773 ) ) ( not ( = ?auto_19752 ?auto_19759 ) ) ( not ( = ?auto_19752 ?auto_19773 ) ) ( not ( = ?auto_19756 ?auto_19759 ) ) ( not ( = ?auto_19756 ?auto_19773 ) ) ( not ( = ?auto_19755 ?auto_19759 ) ) ( not ( = ?auto_19755 ?auto_19773 ) ) ( not ( = ?auto_19753 ?auto_19759 ) ) ( not ( = ?auto_19753 ?auto_19773 ) ) ( not ( = ?auto_19758 ?auto_19759 ) ) ( not ( = ?auto_19758 ?auto_19773 ) ) ( not ( = ?auto_19759 ?auto_19791 ) ) ( not ( = ?auto_19759 ?auto_19792 ) ) ( not ( = ?auto_19759 ?auto_19795 ) ) ( not ( = ?auto_19759 ?auto_19772 ) ) ( not ( = ?auto_19759 ?auto_19806 ) ) ( not ( = ?auto_19759 ?auto_19788 ) ) ( not ( = ?auto_19759 ?auto_19782 ) ) ( not ( = ?auto_19759 ?auto_19775 ) ) ( not ( = ?auto_19759 ?auto_19796 ) ) ( not ( = ?auto_19759 ?auto_19787 ) ) ( not ( = ?auto_19759 ?auto_19805 ) ) ( not ( = ?auto_19801 ?auto_19771 ) ) ( not ( = ?auto_19801 ?auto_19768 ) ) ( not ( = ?auto_19801 ?auto_19780 ) ) ( not ( = ?auto_19801 ?auto_19794 ) ) ( not ( = ?auto_19801 ?auto_19770 ) ) ( not ( = ?auto_19801 ?auto_19797 ) ) ( not ( = ?auto_19801 ?auto_19781 ) ) ( not ( = ?auto_19801 ?auto_19774 ) ) ( not ( = ?auto_19801 ?auto_19800 ) ) ( not ( = ?auto_19801 ?auto_19769 ) ) ( not ( = ?auto_19801 ?auto_19789 ) ) ( not ( = ?auto_19777 ?auto_19802 ) ) ( not ( = ?auto_19777 ?auto_19790 ) ) ( not ( = ?auto_19777 ?auto_19803 ) ) ( not ( = ?auto_19777 ?auto_19779 ) ) ( not ( = ?auto_19777 ?auto_19804 ) ) ( not ( = ?auto_19777 ?auto_19785 ) ) ( not ( = ?auto_19777 ?auto_19786 ) ) ( not ( = ?auto_19777 ?auto_19778 ) ) ( not ( = ?auto_19777 ?auto_19799 ) ) ( not ( = ?auto_19777 ?auto_19798 ) ) ( not ( = ?auto_19777 ?auto_19793 ) ) ( not ( = ?auto_19773 ?auto_19791 ) ) ( not ( = ?auto_19773 ?auto_19792 ) ) ( not ( = ?auto_19773 ?auto_19795 ) ) ( not ( = ?auto_19773 ?auto_19772 ) ) ( not ( = ?auto_19773 ?auto_19806 ) ) ( not ( = ?auto_19773 ?auto_19788 ) ) ( not ( = ?auto_19773 ?auto_19782 ) ) ( not ( = ?auto_19773 ?auto_19775 ) ) ( not ( = ?auto_19773 ?auto_19796 ) ) ( not ( = ?auto_19773 ?auto_19787 ) ) ( not ( = ?auto_19773 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19760 ) ) ( not ( = ?auto_19747 ?auto_19783 ) ) ( not ( = ?auto_19748 ?auto_19760 ) ) ( not ( = ?auto_19748 ?auto_19783 ) ) ( not ( = ?auto_19749 ?auto_19760 ) ) ( not ( = ?auto_19749 ?auto_19783 ) ) ( not ( = ?auto_19750 ?auto_19760 ) ) ( not ( = ?auto_19750 ?auto_19783 ) ) ( not ( = ?auto_19751 ?auto_19760 ) ) ( not ( = ?auto_19751 ?auto_19783 ) ) ( not ( = ?auto_19754 ?auto_19760 ) ) ( not ( = ?auto_19754 ?auto_19783 ) ) ( not ( = ?auto_19752 ?auto_19760 ) ) ( not ( = ?auto_19752 ?auto_19783 ) ) ( not ( = ?auto_19756 ?auto_19760 ) ) ( not ( = ?auto_19756 ?auto_19783 ) ) ( not ( = ?auto_19755 ?auto_19760 ) ) ( not ( = ?auto_19755 ?auto_19783 ) ) ( not ( = ?auto_19753 ?auto_19760 ) ) ( not ( = ?auto_19753 ?auto_19783 ) ) ( not ( = ?auto_19758 ?auto_19760 ) ) ( not ( = ?auto_19758 ?auto_19783 ) ) ( not ( = ?auto_19757 ?auto_19760 ) ) ( not ( = ?auto_19757 ?auto_19783 ) ) ( not ( = ?auto_19760 ?auto_19773 ) ) ( not ( = ?auto_19760 ?auto_19791 ) ) ( not ( = ?auto_19760 ?auto_19792 ) ) ( not ( = ?auto_19760 ?auto_19795 ) ) ( not ( = ?auto_19760 ?auto_19772 ) ) ( not ( = ?auto_19760 ?auto_19806 ) ) ( not ( = ?auto_19760 ?auto_19788 ) ) ( not ( = ?auto_19760 ?auto_19782 ) ) ( not ( = ?auto_19760 ?auto_19775 ) ) ( not ( = ?auto_19760 ?auto_19796 ) ) ( not ( = ?auto_19760 ?auto_19787 ) ) ( not ( = ?auto_19760 ?auto_19805 ) ) ( not ( = ?auto_19776 ?auto_19801 ) ) ( not ( = ?auto_19776 ?auto_19771 ) ) ( not ( = ?auto_19776 ?auto_19768 ) ) ( not ( = ?auto_19776 ?auto_19780 ) ) ( not ( = ?auto_19776 ?auto_19794 ) ) ( not ( = ?auto_19776 ?auto_19770 ) ) ( not ( = ?auto_19776 ?auto_19797 ) ) ( not ( = ?auto_19776 ?auto_19781 ) ) ( not ( = ?auto_19776 ?auto_19774 ) ) ( not ( = ?auto_19776 ?auto_19800 ) ) ( not ( = ?auto_19776 ?auto_19769 ) ) ( not ( = ?auto_19776 ?auto_19789 ) ) ( not ( = ?auto_19784 ?auto_19777 ) ) ( not ( = ?auto_19784 ?auto_19802 ) ) ( not ( = ?auto_19784 ?auto_19790 ) ) ( not ( = ?auto_19784 ?auto_19803 ) ) ( not ( = ?auto_19784 ?auto_19779 ) ) ( not ( = ?auto_19784 ?auto_19804 ) ) ( not ( = ?auto_19784 ?auto_19785 ) ) ( not ( = ?auto_19784 ?auto_19786 ) ) ( not ( = ?auto_19784 ?auto_19778 ) ) ( not ( = ?auto_19784 ?auto_19799 ) ) ( not ( = ?auto_19784 ?auto_19798 ) ) ( not ( = ?auto_19784 ?auto_19793 ) ) ( not ( = ?auto_19783 ?auto_19773 ) ) ( not ( = ?auto_19783 ?auto_19791 ) ) ( not ( = ?auto_19783 ?auto_19792 ) ) ( not ( = ?auto_19783 ?auto_19795 ) ) ( not ( = ?auto_19783 ?auto_19772 ) ) ( not ( = ?auto_19783 ?auto_19806 ) ) ( not ( = ?auto_19783 ?auto_19788 ) ) ( not ( = ?auto_19783 ?auto_19782 ) ) ( not ( = ?auto_19783 ?auto_19775 ) ) ( not ( = ?auto_19783 ?auto_19796 ) ) ( not ( = ?auto_19783 ?auto_19787 ) ) ( not ( = ?auto_19783 ?auto_19805 ) ) ( not ( = ?auto_19747 ?auto_19761 ) ) ( not ( = ?auto_19747 ?auto_19763 ) ) ( not ( = ?auto_19748 ?auto_19761 ) ) ( not ( = ?auto_19748 ?auto_19763 ) ) ( not ( = ?auto_19749 ?auto_19761 ) ) ( not ( = ?auto_19749 ?auto_19763 ) ) ( not ( = ?auto_19750 ?auto_19761 ) ) ( not ( = ?auto_19750 ?auto_19763 ) ) ( not ( = ?auto_19751 ?auto_19761 ) ) ( not ( = ?auto_19751 ?auto_19763 ) ) ( not ( = ?auto_19754 ?auto_19761 ) ) ( not ( = ?auto_19754 ?auto_19763 ) ) ( not ( = ?auto_19752 ?auto_19761 ) ) ( not ( = ?auto_19752 ?auto_19763 ) ) ( not ( = ?auto_19756 ?auto_19761 ) ) ( not ( = ?auto_19756 ?auto_19763 ) ) ( not ( = ?auto_19755 ?auto_19761 ) ) ( not ( = ?auto_19755 ?auto_19763 ) ) ( not ( = ?auto_19753 ?auto_19761 ) ) ( not ( = ?auto_19753 ?auto_19763 ) ) ( not ( = ?auto_19758 ?auto_19761 ) ) ( not ( = ?auto_19758 ?auto_19763 ) ) ( not ( = ?auto_19757 ?auto_19761 ) ) ( not ( = ?auto_19757 ?auto_19763 ) ) ( not ( = ?auto_19759 ?auto_19761 ) ) ( not ( = ?auto_19759 ?auto_19763 ) ) ( not ( = ?auto_19761 ?auto_19783 ) ) ( not ( = ?auto_19761 ?auto_19773 ) ) ( not ( = ?auto_19761 ?auto_19791 ) ) ( not ( = ?auto_19761 ?auto_19792 ) ) ( not ( = ?auto_19761 ?auto_19795 ) ) ( not ( = ?auto_19761 ?auto_19772 ) ) ( not ( = ?auto_19761 ?auto_19806 ) ) ( not ( = ?auto_19761 ?auto_19788 ) ) ( not ( = ?auto_19761 ?auto_19782 ) ) ( not ( = ?auto_19761 ?auto_19775 ) ) ( not ( = ?auto_19761 ?auto_19796 ) ) ( not ( = ?auto_19761 ?auto_19787 ) ) ( not ( = ?auto_19761 ?auto_19805 ) ) ( not ( = ?auto_19766 ?auto_19776 ) ) ( not ( = ?auto_19766 ?auto_19801 ) ) ( not ( = ?auto_19766 ?auto_19771 ) ) ( not ( = ?auto_19766 ?auto_19768 ) ) ( not ( = ?auto_19766 ?auto_19780 ) ) ( not ( = ?auto_19766 ?auto_19794 ) ) ( not ( = ?auto_19766 ?auto_19770 ) ) ( not ( = ?auto_19766 ?auto_19797 ) ) ( not ( = ?auto_19766 ?auto_19781 ) ) ( not ( = ?auto_19766 ?auto_19774 ) ) ( not ( = ?auto_19766 ?auto_19800 ) ) ( not ( = ?auto_19766 ?auto_19769 ) ) ( not ( = ?auto_19766 ?auto_19789 ) ) ( not ( = ?auto_19767 ?auto_19784 ) ) ( not ( = ?auto_19767 ?auto_19777 ) ) ( not ( = ?auto_19767 ?auto_19802 ) ) ( not ( = ?auto_19767 ?auto_19790 ) ) ( not ( = ?auto_19767 ?auto_19803 ) ) ( not ( = ?auto_19767 ?auto_19779 ) ) ( not ( = ?auto_19767 ?auto_19804 ) ) ( not ( = ?auto_19767 ?auto_19785 ) ) ( not ( = ?auto_19767 ?auto_19786 ) ) ( not ( = ?auto_19767 ?auto_19778 ) ) ( not ( = ?auto_19767 ?auto_19799 ) ) ( not ( = ?auto_19767 ?auto_19798 ) ) ( not ( = ?auto_19767 ?auto_19793 ) ) ( not ( = ?auto_19763 ?auto_19783 ) ) ( not ( = ?auto_19763 ?auto_19773 ) ) ( not ( = ?auto_19763 ?auto_19791 ) ) ( not ( = ?auto_19763 ?auto_19792 ) ) ( not ( = ?auto_19763 ?auto_19795 ) ) ( not ( = ?auto_19763 ?auto_19772 ) ) ( not ( = ?auto_19763 ?auto_19806 ) ) ( not ( = ?auto_19763 ?auto_19788 ) ) ( not ( = ?auto_19763 ?auto_19782 ) ) ( not ( = ?auto_19763 ?auto_19775 ) ) ( not ( = ?auto_19763 ?auto_19796 ) ) ( not ( = ?auto_19763 ?auto_19787 ) ) ( not ( = ?auto_19763 ?auto_19805 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19747 ?auto_19748 ?auto_19749 ?auto_19750 ?auto_19751 ?auto_19754 ?auto_19752 ?auto_19756 ?auto_19755 ?auto_19753 ?auto_19758 ?auto_19757 ?auto_19759 ?auto_19760 )
      ( MAKE-1CRATE ?auto_19760 ?auto_19761 )
      ( MAKE-14CRATE-VERIFY ?auto_19747 ?auto_19748 ?auto_19749 ?auto_19750 ?auto_19751 ?auto_19754 ?auto_19752 ?auto_19756 ?auto_19755 ?auto_19753 ?auto_19758 ?auto_19757 ?auto_19759 ?auto_19760 ?auto_19761 ) )
  )

)

