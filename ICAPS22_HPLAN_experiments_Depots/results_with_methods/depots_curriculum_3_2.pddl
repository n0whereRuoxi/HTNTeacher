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
      ?auto_162 - SURFACE
      ?auto_163 - SURFACE
    )
    :vars
    (
      ?auto_164 - HOIST
      ?auto_165 - PLACE
      ?auto_167 - PLACE
      ?auto_168 - HOIST
      ?auto_169 - SURFACE
      ?auto_166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_164 ?auto_165 ) ( SURFACE-AT ?auto_163 ?auto_165 ) ( CLEAR ?auto_163 ) ( IS-CRATE ?auto_162 ) ( AVAILABLE ?auto_164 ) ( not ( = ?auto_167 ?auto_165 ) ) ( HOIST-AT ?auto_168 ?auto_167 ) ( AVAILABLE ?auto_168 ) ( SURFACE-AT ?auto_162 ?auto_167 ) ( ON ?auto_162 ?auto_169 ) ( CLEAR ?auto_162 ) ( TRUCK-AT ?auto_166 ?auto_165 ) ( not ( = ?auto_162 ?auto_163 ) ) ( not ( = ?auto_162 ?auto_169 ) ) ( not ( = ?auto_163 ?auto_169 ) ) ( not ( = ?auto_164 ?auto_168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_166 ?auto_165 ?auto_167 )
      ( !LIFT ?auto_168 ?auto_162 ?auto_169 ?auto_167 )
      ( !LOAD ?auto_168 ?auto_162 ?auto_166 ?auto_167 )
      ( !DRIVE ?auto_166 ?auto_167 ?auto_165 )
      ( !UNLOAD ?auto_164 ?auto_162 ?auto_166 ?auto_165 )
      ( !DROP ?auto_164 ?auto_162 ?auto_163 ?auto_165 )
      ( MAKE-ON-VERIFY ?auto_162 ?auto_163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_172 - SURFACE
      ?auto_173 - SURFACE
    )
    :vars
    (
      ?auto_174 - HOIST
      ?auto_175 - PLACE
      ?auto_177 - PLACE
      ?auto_178 - HOIST
      ?auto_179 - SURFACE
      ?auto_176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_174 ?auto_175 ) ( SURFACE-AT ?auto_173 ?auto_175 ) ( CLEAR ?auto_173 ) ( IS-CRATE ?auto_172 ) ( AVAILABLE ?auto_174 ) ( not ( = ?auto_177 ?auto_175 ) ) ( HOIST-AT ?auto_178 ?auto_177 ) ( AVAILABLE ?auto_178 ) ( SURFACE-AT ?auto_172 ?auto_177 ) ( ON ?auto_172 ?auto_179 ) ( CLEAR ?auto_172 ) ( TRUCK-AT ?auto_176 ?auto_175 ) ( not ( = ?auto_172 ?auto_173 ) ) ( not ( = ?auto_172 ?auto_179 ) ) ( not ( = ?auto_173 ?auto_179 ) ) ( not ( = ?auto_174 ?auto_178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_176 ?auto_175 ?auto_177 )
      ( !LIFT ?auto_178 ?auto_172 ?auto_179 ?auto_177 )
      ( !LOAD ?auto_178 ?auto_172 ?auto_176 ?auto_177 )
      ( !DRIVE ?auto_176 ?auto_177 ?auto_175 )
      ( !UNLOAD ?auto_174 ?auto_172 ?auto_176 ?auto_175 )
      ( !DROP ?auto_174 ?auto_172 ?auto_173 ?auto_175 )
      ( MAKE-ON-VERIFY ?auto_172 ?auto_173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_182 - SURFACE
      ?auto_183 - SURFACE
    )
    :vars
    (
      ?auto_184 - HOIST
      ?auto_185 - PLACE
      ?auto_187 - PLACE
      ?auto_188 - HOIST
      ?auto_189 - SURFACE
      ?auto_186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_184 ?auto_185 ) ( SURFACE-AT ?auto_183 ?auto_185 ) ( CLEAR ?auto_183 ) ( IS-CRATE ?auto_182 ) ( AVAILABLE ?auto_184 ) ( not ( = ?auto_187 ?auto_185 ) ) ( HOIST-AT ?auto_188 ?auto_187 ) ( AVAILABLE ?auto_188 ) ( SURFACE-AT ?auto_182 ?auto_187 ) ( ON ?auto_182 ?auto_189 ) ( CLEAR ?auto_182 ) ( TRUCK-AT ?auto_186 ?auto_185 ) ( not ( = ?auto_182 ?auto_183 ) ) ( not ( = ?auto_182 ?auto_189 ) ) ( not ( = ?auto_183 ?auto_189 ) ) ( not ( = ?auto_184 ?auto_188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_186 ?auto_185 ?auto_187 )
      ( !LIFT ?auto_188 ?auto_182 ?auto_189 ?auto_187 )
      ( !LOAD ?auto_188 ?auto_182 ?auto_186 ?auto_187 )
      ( !DRIVE ?auto_186 ?auto_187 ?auto_185 )
      ( !UNLOAD ?auto_184 ?auto_182 ?auto_186 ?auto_185 )
      ( !DROP ?auto_184 ?auto_182 ?auto_183 ?auto_185 )
      ( MAKE-ON-VERIFY ?auto_182 ?auto_183 ) )
  )

)

