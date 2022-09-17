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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_173 - SURFACE
      ?auto_174 - SURFACE
    )
    :vars
    (
      ?auto_175 - HOIST
      ?auto_176 - PLACE
      ?auto_178 - PLACE
      ?auto_179 - HOIST
      ?auto_180 - SURFACE
      ?auto_177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_175 ?auto_176 ) ( SURFACE-AT ?auto_173 ?auto_176 ) ( CLEAR ?auto_173 ) ( IS-CRATE ?auto_174 ) ( AVAILABLE ?auto_175 ) ( not ( = ?auto_178 ?auto_176 ) ) ( HOIST-AT ?auto_179 ?auto_178 ) ( AVAILABLE ?auto_179 ) ( SURFACE-AT ?auto_174 ?auto_178 ) ( ON ?auto_174 ?auto_180 ) ( CLEAR ?auto_174 ) ( TRUCK-AT ?auto_177 ?auto_176 ) ( not ( = ?auto_173 ?auto_174 ) ) ( not ( = ?auto_173 ?auto_180 ) ) ( not ( = ?auto_174 ?auto_180 ) ) ( not ( = ?auto_175 ?auto_179 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_177 ?auto_176 ?auto_178 )
      ( !LIFT ?auto_179 ?auto_174 ?auto_180 ?auto_178 )
      ( !LOAD ?auto_179 ?auto_174 ?auto_177 ?auto_178 )
      ( !DRIVE ?auto_177 ?auto_178 ?auto_176 )
      ( !UNLOAD ?auto_175 ?auto_174 ?auto_177 ?auto_176 )
      ( !DROP ?auto_175 ?auto_174 ?auto_173 ?auto_176 )
      ( MAKE-1CRATE-VERIFY ?auto_173 ?auto_174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_194 - SURFACE
      ?auto_195 - SURFACE
      ?auto_196 - SURFACE
    )
    :vars
    (
      ?auto_197 - HOIST
      ?auto_198 - PLACE
      ?auto_202 - PLACE
      ?auto_201 - HOIST
      ?auto_200 - SURFACE
      ?auto_203 - PLACE
      ?auto_205 - HOIST
      ?auto_204 - SURFACE
      ?auto_199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_197 ?auto_198 ) ( IS-CRATE ?auto_196 ) ( not ( = ?auto_202 ?auto_198 ) ) ( HOIST-AT ?auto_201 ?auto_202 ) ( AVAILABLE ?auto_201 ) ( SURFACE-AT ?auto_196 ?auto_202 ) ( ON ?auto_196 ?auto_200 ) ( CLEAR ?auto_196 ) ( not ( = ?auto_195 ?auto_196 ) ) ( not ( = ?auto_195 ?auto_200 ) ) ( not ( = ?auto_196 ?auto_200 ) ) ( not ( = ?auto_197 ?auto_201 ) ) ( SURFACE-AT ?auto_194 ?auto_198 ) ( CLEAR ?auto_194 ) ( IS-CRATE ?auto_195 ) ( AVAILABLE ?auto_197 ) ( not ( = ?auto_203 ?auto_198 ) ) ( HOIST-AT ?auto_205 ?auto_203 ) ( AVAILABLE ?auto_205 ) ( SURFACE-AT ?auto_195 ?auto_203 ) ( ON ?auto_195 ?auto_204 ) ( CLEAR ?auto_195 ) ( TRUCK-AT ?auto_199 ?auto_198 ) ( not ( = ?auto_194 ?auto_195 ) ) ( not ( = ?auto_194 ?auto_204 ) ) ( not ( = ?auto_195 ?auto_204 ) ) ( not ( = ?auto_197 ?auto_205 ) ) ( not ( = ?auto_194 ?auto_196 ) ) ( not ( = ?auto_194 ?auto_200 ) ) ( not ( = ?auto_196 ?auto_204 ) ) ( not ( = ?auto_202 ?auto_203 ) ) ( not ( = ?auto_201 ?auto_205 ) ) ( not ( = ?auto_200 ?auto_204 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_194 ?auto_195 )
      ( MAKE-1CRATE ?auto_195 ?auto_196 )
      ( MAKE-2CRATE-VERIFY ?auto_194 ?auto_195 ?auto_196 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_220 - SURFACE
      ?auto_221 - SURFACE
      ?auto_222 - SURFACE
      ?auto_223 - SURFACE
    )
    :vars
    (
      ?auto_226 - HOIST
      ?auto_224 - PLACE
      ?auto_228 - PLACE
      ?auto_227 - HOIST
      ?auto_225 - SURFACE
      ?auto_230 - SURFACE
      ?auto_231 - PLACE
      ?auto_233 - HOIST
      ?auto_232 - SURFACE
      ?auto_229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226 ?auto_224 ) ( IS-CRATE ?auto_223 ) ( not ( = ?auto_228 ?auto_224 ) ) ( HOIST-AT ?auto_227 ?auto_228 ) ( SURFACE-AT ?auto_223 ?auto_228 ) ( ON ?auto_223 ?auto_225 ) ( CLEAR ?auto_223 ) ( not ( = ?auto_222 ?auto_223 ) ) ( not ( = ?auto_222 ?auto_225 ) ) ( not ( = ?auto_223 ?auto_225 ) ) ( not ( = ?auto_226 ?auto_227 ) ) ( IS-CRATE ?auto_222 ) ( AVAILABLE ?auto_227 ) ( SURFACE-AT ?auto_222 ?auto_228 ) ( ON ?auto_222 ?auto_230 ) ( CLEAR ?auto_222 ) ( not ( = ?auto_221 ?auto_222 ) ) ( not ( = ?auto_221 ?auto_230 ) ) ( not ( = ?auto_222 ?auto_230 ) ) ( SURFACE-AT ?auto_220 ?auto_224 ) ( CLEAR ?auto_220 ) ( IS-CRATE ?auto_221 ) ( AVAILABLE ?auto_226 ) ( not ( = ?auto_231 ?auto_224 ) ) ( HOIST-AT ?auto_233 ?auto_231 ) ( AVAILABLE ?auto_233 ) ( SURFACE-AT ?auto_221 ?auto_231 ) ( ON ?auto_221 ?auto_232 ) ( CLEAR ?auto_221 ) ( TRUCK-AT ?auto_229 ?auto_224 ) ( not ( = ?auto_220 ?auto_221 ) ) ( not ( = ?auto_220 ?auto_232 ) ) ( not ( = ?auto_221 ?auto_232 ) ) ( not ( = ?auto_226 ?auto_233 ) ) ( not ( = ?auto_220 ?auto_222 ) ) ( not ( = ?auto_220 ?auto_230 ) ) ( not ( = ?auto_222 ?auto_232 ) ) ( not ( = ?auto_228 ?auto_231 ) ) ( not ( = ?auto_227 ?auto_233 ) ) ( not ( = ?auto_230 ?auto_232 ) ) ( not ( = ?auto_220 ?auto_223 ) ) ( not ( = ?auto_220 ?auto_225 ) ) ( not ( = ?auto_221 ?auto_223 ) ) ( not ( = ?auto_221 ?auto_225 ) ) ( not ( = ?auto_223 ?auto_230 ) ) ( not ( = ?auto_223 ?auto_232 ) ) ( not ( = ?auto_225 ?auto_230 ) ) ( not ( = ?auto_225 ?auto_232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_220 ?auto_221 ?auto_222 )
      ( MAKE-1CRATE ?auto_222 ?auto_223 )
      ( MAKE-3CRATE-VERIFY ?auto_220 ?auto_221 ?auto_222 ?auto_223 ) )
  )

)

