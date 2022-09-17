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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_105 - SURFACE
      ?auto_106 - SURFACE
    )
    :vars
    (
      ?auto_107 - HOIST
      ?auto_108 - PLACE
      ?auto_110 - PLACE
      ?auto_111 - HOIST
      ?auto_112 - SURFACE
      ?auto_109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_107 ?auto_108 ) ( SURFACE-AT ?auto_105 ?auto_108 ) ( CLEAR ?auto_105 ) ( IS-CRATE ?auto_106 ) ( AVAILABLE ?auto_107 ) ( not ( = ?auto_110 ?auto_108 ) ) ( HOIST-AT ?auto_111 ?auto_110 ) ( AVAILABLE ?auto_111 ) ( SURFACE-AT ?auto_106 ?auto_110 ) ( ON ?auto_106 ?auto_112 ) ( CLEAR ?auto_106 ) ( TRUCK-AT ?auto_109 ?auto_108 ) ( not ( = ?auto_105 ?auto_106 ) ) ( not ( = ?auto_105 ?auto_112 ) ) ( not ( = ?auto_106 ?auto_112 ) ) ( not ( = ?auto_107 ?auto_111 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_109 ?auto_108 ?auto_110 )
      ( !LIFT ?auto_111 ?auto_106 ?auto_112 ?auto_110 )
      ( !LOAD ?auto_111 ?auto_106 ?auto_109 ?auto_110 )
      ( !DRIVE ?auto_109 ?auto_110 ?auto_108 )
      ( !UNLOAD ?auto_107 ?auto_106 ?auto_109 ?auto_108 )
      ( !DROP ?auto_107 ?auto_106 ?auto_105 ?auto_108 )
      ( MAKE-1CRATE-VERIFY ?auto_105 ?auto_106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_115 - SURFACE
      ?auto_116 - SURFACE
    )
    :vars
    (
      ?auto_117 - HOIST
      ?auto_118 - PLACE
      ?auto_120 - PLACE
      ?auto_121 - HOIST
      ?auto_122 - SURFACE
      ?auto_119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_117 ?auto_118 ) ( SURFACE-AT ?auto_115 ?auto_118 ) ( CLEAR ?auto_115 ) ( IS-CRATE ?auto_116 ) ( AVAILABLE ?auto_117 ) ( not ( = ?auto_120 ?auto_118 ) ) ( HOIST-AT ?auto_121 ?auto_120 ) ( AVAILABLE ?auto_121 ) ( SURFACE-AT ?auto_116 ?auto_120 ) ( ON ?auto_116 ?auto_122 ) ( CLEAR ?auto_116 ) ( TRUCK-AT ?auto_119 ?auto_118 ) ( not ( = ?auto_115 ?auto_116 ) ) ( not ( = ?auto_115 ?auto_122 ) ) ( not ( = ?auto_116 ?auto_122 ) ) ( not ( = ?auto_117 ?auto_121 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_119 ?auto_118 ?auto_120 )
      ( !LIFT ?auto_121 ?auto_116 ?auto_122 ?auto_120 )
      ( !LOAD ?auto_121 ?auto_116 ?auto_119 ?auto_120 )
      ( !DRIVE ?auto_119 ?auto_120 ?auto_118 )
      ( !UNLOAD ?auto_117 ?auto_116 ?auto_119 ?auto_118 )
      ( !DROP ?auto_117 ?auto_116 ?auto_115 ?auto_118 )
      ( MAKE-1CRATE-VERIFY ?auto_115 ?auto_116 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_126 - SURFACE
      ?auto_127 - SURFACE
      ?auto_128 - SURFACE
    )
    :vars
    (
      ?auto_133 - HOIST
      ?auto_132 - PLACE
      ?auto_130 - PLACE
      ?auto_134 - HOIST
      ?auto_131 - SURFACE
      ?auto_135 - PLACE
      ?auto_136 - HOIST
      ?auto_137 - SURFACE
      ?auto_129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_133 ?auto_132 ) ( IS-CRATE ?auto_128 ) ( not ( = ?auto_130 ?auto_132 ) ) ( HOIST-AT ?auto_134 ?auto_130 ) ( AVAILABLE ?auto_134 ) ( SURFACE-AT ?auto_128 ?auto_130 ) ( ON ?auto_128 ?auto_131 ) ( CLEAR ?auto_128 ) ( not ( = ?auto_127 ?auto_128 ) ) ( not ( = ?auto_127 ?auto_131 ) ) ( not ( = ?auto_128 ?auto_131 ) ) ( not ( = ?auto_133 ?auto_134 ) ) ( SURFACE-AT ?auto_126 ?auto_132 ) ( CLEAR ?auto_126 ) ( IS-CRATE ?auto_127 ) ( AVAILABLE ?auto_133 ) ( not ( = ?auto_135 ?auto_132 ) ) ( HOIST-AT ?auto_136 ?auto_135 ) ( AVAILABLE ?auto_136 ) ( SURFACE-AT ?auto_127 ?auto_135 ) ( ON ?auto_127 ?auto_137 ) ( CLEAR ?auto_127 ) ( TRUCK-AT ?auto_129 ?auto_132 ) ( not ( = ?auto_126 ?auto_127 ) ) ( not ( = ?auto_126 ?auto_137 ) ) ( not ( = ?auto_127 ?auto_137 ) ) ( not ( = ?auto_133 ?auto_136 ) ) ( not ( = ?auto_126 ?auto_128 ) ) ( not ( = ?auto_126 ?auto_131 ) ) ( not ( = ?auto_128 ?auto_137 ) ) ( not ( = ?auto_130 ?auto_135 ) ) ( not ( = ?auto_134 ?auto_136 ) ) ( not ( = ?auto_131 ?auto_137 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_126 ?auto_127 )
      ( MAKE-1CRATE ?auto_127 ?auto_128 )
      ( MAKE-2CRATE-VERIFY ?auto_126 ?auto_127 ?auto_128 ) )
  )

)

