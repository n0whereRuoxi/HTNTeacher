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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_183 - SURFACE
      ?auto_184 - SURFACE
    )
    :vars
    (
      ?auto_185 - HOIST
      ?auto_186 - PLACE
      ?auto_188 - PLACE
      ?auto_189 - HOIST
      ?auto_190 - SURFACE
      ?auto_187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_185 ?auto_186 ) ( SURFACE-AT ?auto_183 ?auto_186 ) ( CLEAR ?auto_183 ) ( IS-CRATE ?auto_184 ) ( AVAILABLE ?auto_185 ) ( not ( = ?auto_188 ?auto_186 ) ) ( HOIST-AT ?auto_189 ?auto_188 ) ( AVAILABLE ?auto_189 ) ( SURFACE-AT ?auto_184 ?auto_188 ) ( ON ?auto_184 ?auto_190 ) ( CLEAR ?auto_184 ) ( TRUCK-AT ?auto_187 ?auto_186 ) ( not ( = ?auto_183 ?auto_184 ) ) ( not ( = ?auto_183 ?auto_190 ) ) ( not ( = ?auto_184 ?auto_190 ) ) ( not ( = ?auto_185 ?auto_189 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_187 ?auto_186 ?auto_188 )
      ( !LIFT ?auto_189 ?auto_184 ?auto_190 ?auto_188 )
      ( !LOAD ?auto_189 ?auto_184 ?auto_187 ?auto_188 )
      ( !DRIVE ?auto_187 ?auto_188 ?auto_186 )
      ( !UNLOAD ?auto_185 ?auto_184 ?auto_187 ?auto_186 )
      ( !DROP ?auto_185 ?auto_184 ?auto_183 ?auto_186 )
      ( MAKE-1CRATE-VERIFY ?auto_183 ?auto_184 ) )
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
      ?auto_204 - PLACE
      ?auto_203 - HOIST
      ?auto_205 - SURFACE
      ?auto_199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_197 ?auto_198 ) ( IS-CRATE ?auto_196 ) ( not ( = ?auto_202 ?auto_198 ) ) ( HOIST-AT ?auto_201 ?auto_202 ) ( AVAILABLE ?auto_201 ) ( SURFACE-AT ?auto_196 ?auto_202 ) ( ON ?auto_196 ?auto_200 ) ( CLEAR ?auto_196 ) ( not ( = ?auto_195 ?auto_196 ) ) ( not ( = ?auto_195 ?auto_200 ) ) ( not ( = ?auto_196 ?auto_200 ) ) ( not ( = ?auto_197 ?auto_201 ) ) ( SURFACE-AT ?auto_194 ?auto_198 ) ( CLEAR ?auto_194 ) ( IS-CRATE ?auto_195 ) ( AVAILABLE ?auto_197 ) ( not ( = ?auto_204 ?auto_198 ) ) ( HOIST-AT ?auto_203 ?auto_204 ) ( AVAILABLE ?auto_203 ) ( SURFACE-AT ?auto_195 ?auto_204 ) ( ON ?auto_195 ?auto_205 ) ( CLEAR ?auto_195 ) ( TRUCK-AT ?auto_199 ?auto_198 ) ( not ( = ?auto_194 ?auto_195 ) ) ( not ( = ?auto_194 ?auto_205 ) ) ( not ( = ?auto_195 ?auto_205 ) ) ( not ( = ?auto_197 ?auto_203 ) ) ( not ( = ?auto_194 ?auto_196 ) ) ( not ( = ?auto_194 ?auto_200 ) ) ( not ( = ?auto_196 ?auto_205 ) ) ( not ( = ?auto_202 ?auto_204 ) ) ( not ( = ?auto_201 ?auto_203 ) ) ( not ( = ?auto_200 ?auto_205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_194 ?auto_195 )
      ( MAKE-1CRATE ?auto_195 ?auto_196 )
      ( MAKE-2CRATE-VERIFY ?auto_194 ?auto_195 ?auto_196 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_208 - SURFACE
      ?auto_209 - SURFACE
    )
    :vars
    (
      ?auto_210 - HOIST
      ?auto_211 - PLACE
      ?auto_213 - PLACE
      ?auto_214 - HOIST
      ?auto_215 - SURFACE
      ?auto_212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_210 ?auto_211 ) ( SURFACE-AT ?auto_208 ?auto_211 ) ( CLEAR ?auto_208 ) ( IS-CRATE ?auto_209 ) ( AVAILABLE ?auto_210 ) ( not ( = ?auto_213 ?auto_211 ) ) ( HOIST-AT ?auto_214 ?auto_213 ) ( AVAILABLE ?auto_214 ) ( SURFACE-AT ?auto_209 ?auto_213 ) ( ON ?auto_209 ?auto_215 ) ( CLEAR ?auto_209 ) ( TRUCK-AT ?auto_212 ?auto_211 ) ( not ( = ?auto_208 ?auto_209 ) ) ( not ( = ?auto_208 ?auto_215 ) ) ( not ( = ?auto_209 ?auto_215 ) ) ( not ( = ?auto_210 ?auto_214 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_212 ?auto_211 ?auto_213 )
      ( !LIFT ?auto_214 ?auto_209 ?auto_215 ?auto_213 )
      ( !LOAD ?auto_214 ?auto_209 ?auto_212 ?auto_213 )
      ( !DRIVE ?auto_212 ?auto_213 ?auto_211 )
      ( !UNLOAD ?auto_210 ?auto_209 ?auto_212 ?auto_211 )
      ( !DROP ?auto_210 ?auto_209 ?auto_208 ?auto_211 )
      ( MAKE-1CRATE-VERIFY ?auto_208 ?auto_209 ) )
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
      ?auto_228 - PLACE
      ?auto_227 - PLACE
      ?auto_224 - HOIST
      ?auto_225 - SURFACE
      ?auto_230 - SURFACE
      ?auto_232 - PLACE
      ?auto_231 - HOIST
      ?auto_233 - SURFACE
      ?auto_229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226 ?auto_228 ) ( IS-CRATE ?auto_223 ) ( not ( = ?auto_227 ?auto_228 ) ) ( HOIST-AT ?auto_224 ?auto_227 ) ( SURFACE-AT ?auto_223 ?auto_227 ) ( ON ?auto_223 ?auto_225 ) ( CLEAR ?auto_223 ) ( not ( = ?auto_222 ?auto_223 ) ) ( not ( = ?auto_222 ?auto_225 ) ) ( not ( = ?auto_223 ?auto_225 ) ) ( not ( = ?auto_226 ?auto_224 ) ) ( IS-CRATE ?auto_222 ) ( AVAILABLE ?auto_224 ) ( SURFACE-AT ?auto_222 ?auto_227 ) ( ON ?auto_222 ?auto_230 ) ( CLEAR ?auto_222 ) ( not ( = ?auto_221 ?auto_222 ) ) ( not ( = ?auto_221 ?auto_230 ) ) ( not ( = ?auto_222 ?auto_230 ) ) ( SURFACE-AT ?auto_220 ?auto_228 ) ( CLEAR ?auto_220 ) ( IS-CRATE ?auto_221 ) ( AVAILABLE ?auto_226 ) ( not ( = ?auto_232 ?auto_228 ) ) ( HOIST-AT ?auto_231 ?auto_232 ) ( AVAILABLE ?auto_231 ) ( SURFACE-AT ?auto_221 ?auto_232 ) ( ON ?auto_221 ?auto_233 ) ( CLEAR ?auto_221 ) ( TRUCK-AT ?auto_229 ?auto_228 ) ( not ( = ?auto_220 ?auto_221 ) ) ( not ( = ?auto_220 ?auto_233 ) ) ( not ( = ?auto_221 ?auto_233 ) ) ( not ( = ?auto_226 ?auto_231 ) ) ( not ( = ?auto_220 ?auto_222 ) ) ( not ( = ?auto_220 ?auto_230 ) ) ( not ( = ?auto_222 ?auto_233 ) ) ( not ( = ?auto_227 ?auto_232 ) ) ( not ( = ?auto_224 ?auto_231 ) ) ( not ( = ?auto_230 ?auto_233 ) ) ( not ( = ?auto_220 ?auto_223 ) ) ( not ( = ?auto_220 ?auto_225 ) ) ( not ( = ?auto_221 ?auto_223 ) ) ( not ( = ?auto_221 ?auto_225 ) ) ( not ( = ?auto_223 ?auto_230 ) ) ( not ( = ?auto_223 ?auto_233 ) ) ( not ( = ?auto_225 ?auto_230 ) ) ( not ( = ?auto_225 ?auto_233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_220 ?auto_221 ?auto_222 )
      ( MAKE-1CRATE ?auto_222 ?auto_223 )
      ( MAKE-3CRATE-VERIFY ?auto_220 ?auto_221 ?auto_222 ?auto_223 ) )
  )

)

