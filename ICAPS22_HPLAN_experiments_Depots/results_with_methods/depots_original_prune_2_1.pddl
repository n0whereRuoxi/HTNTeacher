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
      ?auto_115 - SURFACE
      ?auto_116 - SURFACE
    )
    :vars
    (
      ?auto_117 - HOIST
      ?auto_118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117 ?auto_118 ) ( SURFACE-AT ?auto_116 ?auto_118 ) ( CLEAR ?auto_116 ) ( LIFTING ?auto_117 ?auto_115 ) ( IS-CRATE ?auto_115 ) ( not ( = ?auto_115 ?auto_116 ) ) )
    :subtasks
    ( ( !DROP ?auto_117 ?auto_115 ?auto_116 ?auto_118 )
      ( MAKE-ON-VERIFY ?auto_115 ?auto_116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_119 - SURFACE
      ?auto_120 - SURFACE
    )
    :vars
    (
      ?auto_122 - HOIST
      ?auto_121 - PLACE
      ?auto_123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_122 ?auto_121 ) ( SURFACE-AT ?auto_120 ?auto_121 ) ( CLEAR ?auto_120 ) ( IS-CRATE ?auto_119 ) ( not ( = ?auto_119 ?auto_120 ) ) ( TRUCK-AT ?auto_123 ?auto_121 ) ( AVAILABLE ?auto_122 ) ( IN ?auto_119 ?auto_123 ) )
    :subtasks
    ( ( !UNLOAD ?auto_122 ?auto_119 ?auto_123 ?auto_121 )
      ( MAKE-ON ?auto_119 ?auto_120 )
      ( MAKE-ON-VERIFY ?auto_119 ?auto_120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_124 - SURFACE
      ?auto_125 - SURFACE
    )
    :vars
    (
      ?auto_126 - HOIST
      ?auto_127 - PLACE
      ?auto_128 - TRUCK
      ?auto_129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_126 ?auto_127 ) ( SURFACE-AT ?auto_125 ?auto_127 ) ( CLEAR ?auto_125 ) ( IS-CRATE ?auto_124 ) ( not ( = ?auto_124 ?auto_125 ) ) ( AVAILABLE ?auto_126 ) ( IN ?auto_124 ?auto_128 ) ( TRUCK-AT ?auto_128 ?auto_129 ) ( not ( = ?auto_129 ?auto_127 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_128 ?auto_129 ?auto_127 )
      ( MAKE-ON ?auto_124 ?auto_125 )
      ( MAKE-ON-VERIFY ?auto_124 ?auto_125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_130 - SURFACE
      ?auto_131 - SURFACE
    )
    :vars
    (
      ?auto_133 - HOIST
      ?auto_135 - PLACE
      ?auto_134 - TRUCK
      ?auto_132 - PLACE
      ?auto_136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_133 ?auto_135 ) ( SURFACE-AT ?auto_131 ?auto_135 ) ( CLEAR ?auto_131 ) ( IS-CRATE ?auto_130 ) ( not ( = ?auto_130 ?auto_131 ) ) ( AVAILABLE ?auto_133 ) ( TRUCK-AT ?auto_134 ?auto_132 ) ( not ( = ?auto_132 ?auto_135 ) ) ( HOIST-AT ?auto_136 ?auto_132 ) ( LIFTING ?auto_136 ?auto_130 ) ( not ( = ?auto_133 ?auto_136 ) ) )
    :subtasks
    ( ( !LOAD ?auto_136 ?auto_130 ?auto_134 ?auto_132 )
      ( MAKE-ON ?auto_130 ?auto_131 )
      ( MAKE-ON-VERIFY ?auto_130 ?auto_131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_137 - SURFACE
      ?auto_138 - SURFACE
    )
    :vars
    (
      ?auto_140 - HOIST
      ?auto_142 - PLACE
      ?auto_139 - TRUCK
      ?auto_141 - PLACE
      ?auto_143 - HOIST
      ?auto_144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140 ?auto_142 ) ( SURFACE-AT ?auto_138 ?auto_142 ) ( CLEAR ?auto_138 ) ( IS-CRATE ?auto_137 ) ( not ( = ?auto_137 ?auto_138 ) ) ( AVAILABLE ?auto_140 ) ( TRUCK-AT ?auto_139 ?auto_141 ) ( not ( = ?auto_141 ?auto_142 ) ) ( HOIST-AT ?auto_143 ?auto_141 ) ( not ( = ?auto_140 ?auto_143 ) ) ( AVAILABLE ?auto_143 ) ( SURFACE-AT ?auto_137 ?auto_141 ) ( ON ?auto_137 ?auto_144 ) ( CLEAR ?auto_137 ) ( not ( = ?auto_137 ?auto_144 ) ) ( not ( = ?auto_138 ?auto_144 ) ) )
    :subtasks
    ( ( !LIFT ?auto_143 ?auto_137 ?auto_144 ?auto_141 )
      ( MAKE-ON ?auto_137 ?auto_138 )
      ( MAKE-ON-VERIFY ?auto_137 ?auto_138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_145 - SURFACE
      ?auto_146 - SURFACE
    )
    :vars
    (
      ?auto_147 - HOIST
      ?auto_150 - PLACE
      ?auto_152 - PLACE
      ?auto_148 - HOIST
      ?auto_151 - SURFACE
      ?auto_149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_147 ?auto_150 ) ( SURFACE-AT ?auto_146 ?auto_150 ) ( CLEAR ?auto_146 ) ( IS-CRATE ?auto_145 ) ( not ( = ?auto_145 ?auto_146 ) ) ( AVAILABLE ?auto_147 ) ( not ( = ?auto_152 ?auto_150 ) ) ( HOIST-AT ?auto_148 ?auto_152 ) ( not ( = ?auto_147 ?auto_148 ) ) ( AVAILABLE ?auto_148 ) ( SURFACE-AT ?auto_145 ?auto_152 ) ( ON ?auto_145 ?auto_151 ) ( CLEAR ?auto_145 ) ( not ( = ?auto_145 ?auto_151 ) ) ( not ( = ?auto_146 ?auto_151 ) ) ( TRUCK-AT ?auto_149 ?auto_150 ) )
    :subtasks
    ( ( !DRIVE ?auto_149 ?auto_150 ?auto_152 )
      ( MAKE-ON ?auto_145 ?auto_146 )
      ( MAKE-ON-VERIFY ?auto_145 ?auto_146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_193 - SURFACE
      ?auto_194 - SURFACE
    )
    :vars
    (
      ?auto_198 - HOIST
      ?auto_195 - PLACE
      ?auto_196 - PLACE
      ?auto_200 - HOIST
      ?auto_197 - SURFACE
      ?auto_199 - TRUCK
      ?auto_201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_198 ?auto_195 ) ( IS-CRATE ?auto_193 ) ( not ( = ?auto_193 ?auto_194 ) ) ( not ( = ?auto_196 ?auto_195 ) ) ( HOIST-AT ?auto_200 ?auto_196 ) ( not ( = ?auto_198 ?auto_200 ) ) ( AVAILABLE ?auto_200 ) ( SURFACE-AT ?auto_193 ?auto_196 ) ( ON ?auto_193 ?auto_197 ) ( CLEAR ?auto_193 ) ( not ( = ?auto_193 ?auto_197 ) ) ( not ( = ?auto_194 ?auto_197 ) ) ( TRUCK-AT ?auto_199 ?auto_195 ) ( SURFACE-AT ?auto_201 ?auto_195 ) ( CLEAR ?auto_201 ) ( LIFTING ?auto_198 ?auto_194 ) ( IS-CRATE ?auto_194 ) ( not ( = ?auto_193 ?auto_201 ) ) ( not ( = ?auto_194 ?auto_201 ) ) ( not ( = ?auto_197 ?auto_201 ) ) )
    :subtasks
    ( ( !DROP ?auto_198 ?auto_194 ?auto_201 ?auto_195 )
      ( MAKE-ON ?auto_193 ?auto_194 )
      ( MAKE-ON-VERIFY ?auto_193 ?auto_194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_202 - SURFACE
      ?auto_203 - SURFACE
    )
    :vars
    (
      ?auto_207 - HOIST
      ?auto_208 - PLACE
      ?auto_206 - PLACE
      ?auto_204 - HOIST
      ?auto_210 - SURFACE
      ?auto_205 - TRUCK
      ?auto_209 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207 ?auto_208 ) ( IS-CRATE ?auto_202 ) ( not ( = ?auto_202 ?auto_203 ) ) ( not ( = ?auto_206 ?auto_208 ) ) ( HOIST-AT ?auto_204 ?auto_206 ) ( not ( = ?auto_207 ?auto_204 ) ) ( AVAILABLE ?auto_204 ) ( SURFACE-AT ?auto_202 ?auto_206 ) ( ON ?auto_202 ?auto_210 ) ( CLEAR ?auto_202 ) ( not ( = ?auto_202 ?auto_210 ) ) ( not ( = ?auto_203 ?auto_210 ) ) ( TRUCK-AT ?auto_205 ?auto_208 ) ( SURFACE-AT ?auto_209 ?auto_208 ) ( CLEAR ?auto_209 ) ( IS-CRATE ?auto_203 ) ( not ( = ?auto_202 ?auto_209 ) ) ( not ( = ?auto_203 ?auto_209 ) ) ( not ( = ?auto_210 ?auto_209 ) ) ( AVAILABLE ?auto_207 ) ( IN ?auto_203 ?auto_205 ) )
    :subtasks
    ( ( !UNLOAD ?auto_207 ?auto_203 ?auto_205 ?auto_208 )
      ( MAKE-ON ?auto_202 ?auto_203 )
      ( MAKE-ON-VERIFY ?auto_202 ?auto_203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_211 - SURFACE
      ?auto_212 - SURFACE
    )
    :vars
    (
      ?auto_214 - HOIST
      ?auto_213 - PLACE
      ?auto_215 - PLACE
      ?auto_219 - HOIST
      ?auto_217 - SURFACE
      ?auto_216 - SURFACE
      ?auto_218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214 ?auto_213 ) ( IS-CRATE ?auto_211 ) ( not ( = ?auto_211 ?auto_212 ) ) ( not ( = ?auto_215 ?auto_213 ) ) ( HOIST-AT ?auto_219 ?auto_215 ) ( not ( = ?auto_214 ?auto_219 ) ) ( AVAILABLE ?auto_219 ) ( SURFACE-AT ?auto_211 ?auto_215 ) ( ON ?auto_211 ?auto_217 ) ( CLEAR ?auto_211 ) ( not ( = ?auto_211 ?auto_217 ) ) ( not ( = ?auto_212 ?auto_217 ) ) ( SURFACE-AT ?auto_216 ?auto_213 ) ( CLEAR ?auto_216 ) ( IS-CRATE ?auto_212 ) ( not ( = ?auto_211 ?auto_216 ) ) ( not ( = ?auto_212 ?auto_216 ) ) ( not ( = ?auto_217 ?auto_216 ) ) ( AVAILABLE ?auto_214 ) ( IN ?auto_212 ?auto_218 ) ( TRUCK-AT ?auto_218 ?auto_215 ) )
    :subtasks
    ( ( !DRIVE ?auto_218 ?auto_215 ?auto_213 )
      ( MAKE-ON ?auto_211 ?auto_212 )
      ( MAKE-ON-VERIFY ?auto_211 ?auto_212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_220 - SURFACE
      ?auto_221 - SURFACE
    )
    :vars
    (
      ?auto_223 - HOIST
      ?auto_222 - PLACE
      ?auto_227 - PLACE
      ?auto_226 - HOIST
      ?auto_224 - SURFACE
      ?auto_225 - SURFACE
      ?auto_228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_223 ?auto_222 ) ( IS-CRATE ?auto_220 ) ( not ( = ?auto_220 ?auto_221 ) ) ( not ( = ?auto_227 ?auto_222 ) ) ( HOIST-AT ?auto_226 ?auto_227 ) ( not ( = ?auto_223 ?auto_226 ) ) ( SURFACE-AT ?auto_220 ?auto_227 ) ( ON ?auto_220 ?auto_224 ) ( CLEAR ?auto_220 ) ( not ( = ?auto_220 ?auto_224 ) ) ( not ( = ?auto_221 ?auto_224 ) ) ( SURFACE-AT ?auto_225 ?auto_222 ) ( CLEAR ?auto_225 ) ( IS-CRATE ?auto_221 ) ( not ( = ?auto_220 ?auto_225 ) ) ( not ( = ?auto_221 ?auto_225 ) ) ( not ( = ?auto_224 ?auto_225 ) ) ( AVAILABLE ?auto_223 ) ( TRUCK-AT ?auto_228 ?auto_227 ) ( LIFTING ?auto_226 ?auto_221 ) )
    :subtasks
    ( ( !LOAD ?auto_226 ?auto_221 ?auto_228 ?auto_227 )
      ( MAKE-ON ?auto_220 ?auto_221 )
      ( MAKE-ON-VERIFY ?auto_220 ?auto_221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_229 - SURFACE
      ?auto_230 - SURFACE
    )
    :vars
    (
      ?auto_234 - HOIST
      ?auto_237 - PLACE
      ?auto_233 - PLACE
      ?auto_236 - HOIST
      ?auto_231 - SURFACE
      ?auto_232 - SURFACE
      ?auto_235 - TRUCK
      ?auto_238 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234 ?auto_237 ) ( IS-CRATE ?auto_229 ) ( not ( = ?auto_229 ?auto_230 ) ) ( not ( = ?auto_233 ?auto_237 ) ) ( HOIST-AT ?auto_236 ?auto_233 ) ( not ( = ?auto_234 ?auto_236 ) ) ( SURFACE-AT ?auto_229 ?auto_233 ) ( ON ?auto_229 ?auto_231 ) ( CLEAR ?auto_229 ) ( not ( = ?auto_229 ?auto_231 ) ) ( not ( = ?auto_230 ?auto_231 ) ) ( SURFACE-AT ?auto_232 ?auto_237 ) ( CLEAR ?auto_232 ) ( IS-CRATE ?auto_230 ) ( not ( = ?auto_229 ?auto_232 ) ) ( not ( = ?auto_230 ?auto_232 ) ) ( not ( = ?auto_231 ?auto_232 ) ) ( AVAILABLE ?auto_234 ) ( TRUCK-AT ?auto_235 ?auto_233 ) ( AVAILABLE ?auto_236 ) ( SURFACE-AT ?auto_230 ?auto_233 ) ( ON ?auto_230 ?auto_238 ) ( CLEAR ?auto_230 ) ( not ( = ?auto_229 ?auto_238 ) ) ( not ( = ?auto_230 ?auto_238 ) ) ( not ( = ?auto_231 ?auto_238 ) ) ( not ( = ?auto_232 ?auto_238 ) ) )
    :subtasks
    ( ( !LIFT ?auto_236 ?auto_230 ?auto_238 ?auto_233 )
      ( MAKE-ON ?auto_229 ?auto_230 )
      ( MAKE-ON-VERIFY ?auto_229 ?auto_230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_239 - SURFACE
      ?auto_240 - SURFACE
    )
    :vars
    (
      ?auto_246 - HOIST
      ?auto_248 - PLACE
      ?auto_244 - PLACE
      ?auto_242 - HOIST
      ?auto_241 - SURFACE
      ?auto_243 - SURFACE
      ?auto_245 - SURFACE
      ?auto_247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_246 ?auto_248 ) ( IS-CRATE ?auto_239 ) ( not ( = ?auto_239 ?auto_240 ) ) ( not ( = ?auto_244 ?auto_248 ) ) ( HOIST-AT ?auto_242 ?auto_244 ) ( not ( = ?auto_246 ?auto_242 ) ) ( SURFACE-AT ?auto_239 ?auto_244 ) ( ON ?auto_239 ?auto_241 ) ( CLEAR ?auto_239 ) ( not ( = ?auto_239 ?auto_241 ) ) ( not ( = ?auto_240 ?auto_241 ) ) ( SURFACE-AT ?auto_243 ?auto_248 ) ( CLEAR ?auto_243 ) ( IS-CRATE ?auto_240 ) ( not ( = ?auto_239 ?auto_243 ) ) ( not ( = ?auto_240 ?auto_243 ) ) ( not ( = ?auto_241 ?auto_243 ) ) ( AVAILABLE ?auto_246 ) ( AVAILABLE ?auto_242 ) ( SURFACE-AT ?auto_240 ?auto_244 ) ( ON ?auto_240 ?auto_245 ) ( CLEAR ?auto_240 ) ( not ( = ?auto_239 ?auto_245 ) ) ( not ( = ?auto_240 ?auto_245 ) ) ( not ( = ?auto_241 ?auto_245 ) ) ( not ( = ?auto_243 ?auto_245 ) ) ( TRUCK-AT ?auto_247 ?auto_248 ) )
    :subtasks
    ( ( !DRIVE ?auto_247 ?auto_248 ?auto_244 )
      ( MAKE-ON ?auto_239 ?auto_240 )
      ( MAKE-ON-VERIFY ?auto_239 ?auto_240 ) )
  )

)

