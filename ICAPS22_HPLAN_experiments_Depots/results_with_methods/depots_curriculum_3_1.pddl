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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_132 - SURFACE
      ?auto_133 - SURFACE
    )
    :vars
    (
      ?auto_134 - HOIST
      ?auto_135 - PLACE
      ?auto_137 - PLACE
      ?auto_138 - HOIST
      ?auto_139 - SURFACE
      ?auto_136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_134 ?auto_135 ) ( SURFACE-AT ?auto_133 ?auto_135 ) ( CLEAR ?auto_133 ) ( IS-CRATE ?auto_132 ) ( AVAILABLE ?auto_134 ) ( not ( = ?auto_137 ?auto_135 ) ) ( HOIST-AT ?auto_138 ?auto_137 ) ( AVAILABLE ?auto_138 ) ( SURFACE-AT ?auto_132 ?auto_137 ) ( ON ?auto_132 ?auto_139 ) ( CLEAR ?auto_132 ) ( TRUCK-AT ?auto_136 ?auto_135 ) ( not ( = ?auto_132 ?auto_133 ) ) ( not ( = ?auto_132 ?auto_139 ) ) ( not ( = ?auto_133 ?auto_139 ) ) ( not ( = ?auto_134 ?auto_138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_136 ?auto_135 ?auto_137 )
      ( !LIFT ?auto_138 ?auto_132 ?auto_139 ?auto_137 )
      ( !LOAD ?auto_138 ?auto_132 ?auto_136 ?auto_137 )
      ( !DRIVE ?auto_136 ?auto_137 ?auto_135 )
      ( !UNLOAD ?auto_134 ?auto_132 ?auto_136 ?auto_135 )
      ( !DROP ?auto_134 ?auto_132 ?auto_133 ?auto_135 )
      ( MAKE-ON-VERIFY ?auto_132 ?auto_133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_142 - SURFACE
      ?auto_143 - SURFACE
    )
    :vars
    (
      ?auto_144 - HOIST
      ?auto_145 - PLACE
      ?auto_147 - PLACE
      ?auto_148 - HOIST
      ?auto_149 - SURFACE
      ?auto_146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_144 ?auto_145 ) ( SURFACE-AT ?auto_143 ?auto_145 ) ( CLEAR ?auto_143 ) ( IS-CRATE ?auto_142 ) ( AVAILABLE ?auto_144 ) ( not ( = ?auto_147 ?auto_145 ) ) ( HOIST-AT ?auto_148 ?auto_147 ) ( AVAILABLE ?auto_148 ) ( SURFACE-AT ?auto_142 ?auto_147 ) ( ON ?auto_142 ?auto_149 ) ( CLEAR ?auto_142 ) ( TRUCK-AT ?auto_146 ?auto_145 ) ( not ( = ?auto_142 ?auto_143 ) ) ( not ( = ?auto_142 ?auto_149 ) ) ( not ( = ?auto_143 ?auto_149 ) ) ( not ( = ?auto_144 ?auto_148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_146 ?auto_145 ?auto_147 )
      ( !LIFT ?auto_148 ?auto_142 ?auto_149 ?auto_147 )
      ( !LOAD ?auto_148 ?auto_142 ?auto_146 ?auto_147 )
      ( !DRIVE ?auto_146 ?auto_147 ?auto_145 )
      ( !UNLOAD ?auto_144 ?auto_142 ?auto_146 ?auto_145 )
      ( !DROP ?auto_144 ?auto_142 ?auto_143 ?auto_145 )
      ( MAKE-ON-VERIFY ?auto_142 ?auto_143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_152 - SURFACE
      ?auto_153 - SURFACE
    )
    :vars
    (
      ?auto_154 - HOIST
      ?auto_155 - PLACE
      ?auto_157 - PLACE
      ?auto_158 - HOIST
      ?auto_159 - SURFACE
      ?auto_156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_154 ?auto_155 ) ( SURFACE-AT ?auto_153 ?auto_155 ) ( CLEAR ?auto_153 ) ( IS-CRATE ?auto_152 ) ( AVAILABLE ?auto_154 ) ( not ( = ?auto_157 ?auto_155 ) ) ( HOIST-AT ?auto_158 ?auto_157 ) ( AVAILABLE ?auto_158 ) ( SURFACE-AT ?auto_152 ?auto_157 ) ( ON ?auto_152 ?auto_159 ) ( CLEAR ?auto_152 ) ( TRUCK-AT ?auto_156 ?auto_155 ) ( not ( = ?auto_152 ?auto_153 ) ) ( not ( = ?auto_152 ?auto_159 ) ) ( not ( = ?auto_153 ?auto_159 ) ) ( not ( = ?auto_154 ?auto_158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_156 ?auto_155 ?auto_157 )
      ( !LIFT ?auto_158 ?auto_152 ?auto_159 ?auto_157 )
      ( !LOAD ?auto_158 ?auto_152 ?auto_156 ?auto_157 )
      ( !DRIVE ?auto_156 ?auto_157 ?auto_155 )
      ( !UNLOAD ?auto_154 ?auto_152 ?auto_156 ?auto_155 )
      ( !DROP ?auto_154 ?auto_152 ?auto_153 ?auto_155 )
      ( MAKE-ON-VERIFY ?auto_152 ?auto_153 ) )
  )

)

