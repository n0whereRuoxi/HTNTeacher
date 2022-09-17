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
      ?auto_145 - SURFACE
      ?auto_146 - SURFACE
    )
    :vars
    (
      ?auto_147 - HOIST
      ?auto_148 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_147 ?auto_148 ) ( SURFACE-AT ?auto_146 ?auto_148 ) ( CLEAR ?auto_146 ) ( LIFTING ?auto_147 ?auto_145 ) ( IS-CRATE ?auto_145 ) ( not ( = ?auto_145 ?auto_146 ) ) )
    :subtasks
    ( ( !DROP ?auto_147 ?auto_145 ?auto_146 ?auto_148 )
      ( MAKE-ON-VERIFY ?auto_145 ?auto_146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_149 - SURFACE
      ?auto_150 - SURFACE
    )
    :vars
    (
      ?auto_151 - HOIST
      ?auto_152 - PLACE
      ?auto_153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_151 ?auto_152 ) ( SURFACE-AT ?auto_150 ?auto_152 ) ( CLEAR ?auto_150 ) ( IS-CRATE ?auto_149 ) ( not ( = ?auto_149 ?auto_150 ) ) ( TRUCK-AT ?auto_153 ?auto_152 ) ( AVAILABLE ?auto_151 ) ( IN ?auto_149 ?auto_153 ) )
    :subtasks
    ( ( !UNLOAD ?auto_151 ?auto_149 ?auto_153 ?auto_152 )
      ( MAKE-ON ?auto_149 ?auto_150 )
      ( MAKE-ON-VERIFY ?auto_149 ?auto_150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_154 - SURFACE
      ?auto_155 - SURFACE
    )
    :vars
    (
      ?auto_156 - HOIST
      ?auto_158 - PLACE
      ?auto_157 - TRUCK
      ?auto_159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_156 ?auto_158 ) ( SURFACE-AT ?auto_155 ?auto_158 ) ( CLEAR ?auto_155 ) ( IS-CRATE ?auto_154 ) ( not ( = ?auto_154 ?auto_155 ) ) ( AVAILABLE ?auto_156 ) ( IN ?auto_154 ?auto_157 ) ( TRUCK-AT ?auto_157 ?auto_159 ) ( not ( = ?auto_159 ?auto_158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_157 ?auto_159 ?auto_158 )
      ( MAKE-ON ?auto_154 ?auto_155 )
      ( MAKE-ON-VERIFY ?auto_154 ?auto_155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_160 - SURFACE
      ?auto_161 - SURFACE
    )
    :vars
    (
      ?auto_163 - HOIST
      ?auto_164 - PLACE
      ?auto_162 - TRUCK
      ?auto_165 - PLACE
      ?auto_166 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_163 ?auto_164 ) ( SURFACE-AT ?auto_161 ?auto_164 ) ( CLEAR ?auto_161 ) ( IS-CRATE ?auto_160 ) ( not ( = ?auto_160 ?auto_161 ) ) ( AVAILABLE ?auto_163 ) ( TRUCK-AT ?auto_162 ?auto_165 ) ( not ( = ?auto_165 ?auto_164 ) ) ( HOIST-AT ?auto_166 ?auto_165 ) ( LIFTING ?auto_166 ?auto_160 ) ( not ( = ?auto_163 ?auto_166 ) ) )
    :subtasks
    ( ( !LOAD ?auto_166 ?auto_160 ?auto_162 ?auto_165 )
      ( MAKE-ON ?auto_160 ?auto_161 )
      ( MAKE-ON-VERIFY ?auto_160 ?auto_161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_167 - SURFACE
      ?auto_168 - SURFACE
    )
    :vars
    (
      ?auto_173 - HOIST
      ?auto_169 - PLACE
      ?auto_171 - TRUCK
      ?auto_172 - PLACE
      ?auto_170 - HOIST
      ?auto_174 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_173 ?auto_169 ) ( SURFACE-AT ?auto_168 ?auto_169 ) ( CLEAR ?auto_168 ) ( IS-CRATE ?auto_167 ) ( not ( = ?auto_167 ?auto_168 ) ) ( AVAILABLE ?auto_173 ) ( TRUCK-AT ?auto_171 ?auto_172 ) ( not ( = ?auto_172 ?auto_169 ) ) ( HOIST-AT ?auto_170 ?auto_172 ) ( not ( = ?auto_173 ?auto_170 ) ) ( AVAILABLE ?auto_170 ) ( SURFACE-AT ?auto_167 ?auto_172 ) ( ON ?auto_167 ?auto_174 ) ( CLEAR ?auto_167 ) ( not ( = ?auto_167 ?auto_174 ) ) ( not ( = ?auto_168 ?auto_174 ) ) )
    :subtasks
    ( ( !LIFT ?auto_170 ?auto_167 ?auto_174 ?auto_172 )
      ( MAKE-ON ?auto_167 ?auto_168 )
      ( MAKE-ON-VERIFY ?auto_167 ?auto_168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_175 - SURFACE
      ?auto_176 - SURFACE
    )
    :vars
    (
      ?auto_180 - HOIST
      ?auto_178 - PLACE
      ?auto_177 - PLACE
      ?auto_181 - HOIST
      ?auto_179 - SURFACE
      ?auto_182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_180 ?auto_178 ) ( SURFACE-AT ?auto_176 ?auto_178 ) ( CLEAR ?auto_176 ) ( IS-CRATE ?auto_175 ) ( not ( = ?auto_175 ?auto_176 ) ) ( AVAILABLE ?auto_180 ) ( not ( = ?auto_177 ?auto_178 ) ) ( HOIST-AT ?auto_181 ?auto_177 ) ( not ( = ?auto_180 ?auto_181 ) ) ( AVAILABLE ?auto_181 ) ( SURFACE-AT ?auto_175 ?auto_177 ) ( ON ?auto_175 ?auto_179 ) ( CLEAR ?auto_175 ) ( not ( = ?auto_175 ?auto_179 ) ) ( not ( = ?auto_176 ?auto_179 ) ) ( TRUCK-AT ?auto_182 ?auto_178 ) )
    :subtasks
    ( ( !DRIVE ?auto_182 ?auto_178 ?auto_177 )
      ( MAKE-ON ?auto_175 ?auto_176 )
      ( MAKE-ON-VERIFY ?auto_175 ?auto_176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_185 - SURFACE
      ?auto_186 - SURFACE
    )
    :vars
    (
      ?auto_187 - HOIST
      ?auto_188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_187 ?auto_188 ) ( SURFACE-AT ?auto_186 ?auto_188 ) ( CLEAR ?auto_186 ) ( LIFTING ?auto_187 ?auto_185 ) ( IS-CRATE ?auto_185 ) ( not ( = ?auto_185 ?auto_186 ) ) )
    :subtasks
    ( ( !DROP ?auto_187 ?auto_185 ?auto_186 ?auto_188 )
      ( MAKE-ON-VERIFY ?auto_185 ?auto_186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_189 - SURFACE
      ?auto_190 - SURFACE
    )
    :vars
    (
      ?auto_191 - HOIST
      ?auto_192 - PLACE
      ?auto_193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_191 ?auto_192 ) ( SURFACE-AT ?auto_190 ?auto_192 ) ( CLEAR ?auto_190 ) ( IS-CRATE ?auto_189 ) ( not ( = ?auto_189 ?auto_190 ) ) ( TRUCK-AT ?auto_193 ?auto_192 ) ( AVAILABLE ?auto_191 ) ( IN ?auto_189 ?auto_193 ) )
    :subtasks
    ( ( !UNLOAD ?auto_191 ?auto_189 ?auto_193 ?auto_192 )
      ( MAKE-ON ?auto_189 ?auto_190 )
      ( MAKE-ON-VERIFY ?auto_189 ?auto_190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_194 - SURFACE
      ?auto_195 - SURFACE
    )
    :vars
    (
      ?auto_196 - HOIST
      ?auto_197 - PLACE
      ?auto_198 - TRUCK
      ?auto_199 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_196 ?auto_197 ) ( SURFACE-AT ?auto_195 ?auto_197 ) ( CLEAR ?auto_195 ) ( IS-CRATE ?auto_194 ) ( not ( = ?auto_194 ?auto_195 ) ) ( AVAILABLE ?auto_196 ) ( IN ?auto_194 ?auto_198 ) ( TRUCK-AT ?auto_198 ?auto_199 ) ( not ( = ?auto_199 ?auto_197 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_198 ?auto_199 ?auto_197 )
      ( MAKE-ON ?auto_194 ?auto_195 )
      ( MAKE-ON-VERIFY ?auto_194 ?auto_195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_200 - SURFACE
      ?auto_201 - SURFACE
    )
    :vars
    (
      ?auto_205 - HOIST
      ?auto_204 - PLACE
      ?auto_203 - TRUCK
      ?auto_202 - PLACE
      ?auto_206 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205 ?auto_204 ) ( SURFACE-AT ?auto_201 ?auto_204 ) ( CLEAR ?auto_201 ) ( IS-CRATE ?auto_200 ) ( not ( = ?auto_200 ?auto_201 ) ) ( AVAILABLE ?auto_205 ) ( TRUCK-AT ?auto_203 ?auto_202 ) ( not ( = ?auto_202 ?auto_204 ) ) ( HOIST-AT ?auto_206 ?auto_202 ) ( LIFTING ?auto_206 ?auto_200 ) ( not ( = ?auto_205 ?auto_206 ) ) )
    :subtasks
    ( ( !LOAD ?auto_206 ?auto_200 ?auto_203 ?auto_202 )
      ( MAKE-ON ?auto_200 ?auto_201 )
      ( MAKE-ON-VERIFY ?auto_200 ?auto_201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_207 - SURFACE
      ?auto_208 - SURFACE
    )
    :vars
    (
      ?auto_211 - HOIST
      ?auto_209 - PLACE
      ?auto_210 - TRUCK
      ?auto_212 - PLACE
      ?auto_213 - HOIST
      ?auto_214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211 ?auto_209 ) ( SURFACE-AT ?auto_208 ?auto_209 ) ( CLEAR ?auto_208 ) ( IS-CRATE ?auto_207 ) ( not ( = ?auto_207 ?auto_208 ) ) ( AVAILABLE ?auto_211 ) ( TRUCK-AT ?auto_210 ?auto_212 ) ( not ( = ?auto_212 ?auto_209 ) ) ( HOIST-AT ?auto_213 ?auto_212 ) ( not ( = ?auto_211 ?auto_213 ) ) ( AVAILABLE ?auto_213 ) ( SURFACE-AT ?auto_207 ?auto_212 ) ( ON ?auto_207 ?auto_214 ) ( CLEAR ?auto_207 ) ( not ( = ?auto_207 ?auto_214 ) ) ( not ( = ?auto_208 ?auto_214 ) ) )
    :subtasks
    ( ( !LIFT ?auto_213 ?auto_207 ?auto_214 ?auto_212 )
      ( MAKE-ON ?auto_207 ?auto_208 )
      ( MAKE-ON-VERIFY ?auto_207 ?auto_208 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_215 - SURFACE
      ?auto_216 - SURFACE
    )
    :vars
    (
      ?auto_217 - HOIST
      ?auto_220 - PLACE
      ?auto_221 - PLACE
      ?auto_219 - HOIST
      ?auto_222 - SURFACE
      ?auto_218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_217 ?auto_220 ) ( SURFACE-AT ?auto_216 ?auto_220 ) ( CLEAR ?auto_216 ) ( IS-CRATE ?auto_215 ) ( not ( = ?auto_215 ?auto_216 ) ) ( AVAILABLE ?auto_217 ) ( not ( = ?auto_221 ?auto_220 ) ) ( HOIST-AT ?auto_219 ?auto_221 ) ( not ( = ?auto_217 ?auto_219 ) ) ( AVAILABLE ?auto_219 ) ( SURFACE-AT ?auto_215 ?auto_221 ) ( ON ?auto_215 ?auto_222 ) ( CLEAR ?auto_215 ) ( not ( = ?auto_215 ?auto_222 ) ) ( not ( = ?auto_216 ?auto_222 ) ) ( TRUCK-AT ?auto_218 ?auto_220 ) )
    :subtasks
    ( ( !DRIVE ?auto_218 ?auto_220 ?auto_221 )
      ( MAKE-ON ?auto_215 ?auto_216 )
      ( MAKE-ON-VERIFY ?auto_215 ?auto_216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_223 - SURFACE
      ?auto_224 - SURFACE
    )
    :vars
    (
      ?auto_229 - HOIST
      ?auto_230 - PLACE
      ?auto_226 - PLACE
      ?auto_225 - HOIST
      ?auto_227 - SURFACE
      ?auto_228 - TRUCK
      ?auto_231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_229 ?auto_230 ) ( IS-CRATE ?auto_223 ) ( not ( = ?auto_223 ?auto_224 ) ) ( not ( = ?auto_226 ?auto_230 ) ) ( HOIST-AT ?auto_225 ?auto_226 ) ( not ( = ?auto_229 ?auto_225 ) ) ( AVAILABLE ?auto_225 ) ( SURFACE-AT ?auto_223 ?auto_226 ) ( ON ?auto_223 ?auto_227 ) ( CLEAR ?auto_223 ) ( not ( = ?auto_223 ?auto_227 ) ) ( not ( = ?auto_224 ?auto_227 ) ) ( TRUCK-AT ?auto_228 ?auto_230 ) ( SURFACE-AT ?auto_231 ?auto_230 ) ( CLEAR ?auto_231 ) ( LIFTING ?auto_229 ?auto_224 ) ( IS-CRATE ?auto_224 ) ( not ( = ?auto_223 ?auto_231 ) ) ( not ( = ?auto_224 ?auto_231 ) ) ( not ( = ?auto_227 ?auto_231 ) ) )
    :subtasks
    ( ( !DROP ?auto_229 ?auto_224 ?auto_231 ?auto_230 )
      ( MAKE-ON ?auto_223 ?auto_224 )
      ( MAKE-ON-VERIFY ?auto_223 ?auto_224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_232 - SURFACE
      ?auto_233 - SURFACE
    )
    :vars
    (
      ?auto_239 - HOIST
      ?auto_240 - PLACE
      ?auto_237 - PLACE
      ?auto_234 - HOIST
      ?auto_238 - SURFACE
      ?auto_235 - TRUCK
      ?auto_236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239 ?auto_240 ) ( IS-CRATE ?auto_232 ) ( not ( = ?auto_232 ?auto_233 ) ) ( not ( = ?auto_237 ?auto_240 ) ) ( HOIST-AT ?auto_234 ?auto_237 ) ( not ( = ?auto_239 ?auto_234 ) ) ( AVAILABLE ?auto_234 ) ( SURFACE-AT ?auto_232 ?auto_237 ) ( ON ?auto_232 ?auto_238 ) ( CLEAR ?auto_232 ) ( not ( = ?auto_232 ?auto_238 ) ) ( not ( = ?auto_233 ?auto_238 ) ) ( TRUCK-AT ?auto_235 ?auto_240 ) ( SURFACE-AT ?auto_236 ?auto_240 ) ( CLEAR ?auto_236 ) ( IS-CRATE ?auto_233 ) ( not ( = ?auto_232 ?auto_236 ) ) ( not ( = ?auto_233 ?auto_236 ) ) ( not ( = ?auto_238 ?auto_236 ) ) ( AVAILABLE ?auto_239 ) ( IN ?auto_233 ?auto_235 ) )
    :subtasks
    ( ( !UNLOAD ?auto_239 ?auto_233 ?auto_235 ?auto_240 )
      ( MAKE-ON ?auto_232 ?auto_233 )
      ( MAKE-ON-VERIFY ?auto_232 ?auto_233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_241 - SURFACE
      ?auto_242 - SURFACE
    )
    :vars
    (
      ?auto_249 - HOIST
      ?auto_246 - PLACE
      ?auto_244 - PLACE
      ?auto_245 - HOIST
      ?auto_243 - SURFACE
      ?auto_247 - SURFACE
      ?auto_248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_249 ?auto_246 ) ( IS-CRATE ?auto_241 ) ( not ( = ?auto_241 ?auto_242 ) ) ( not ( = ?auto_244 ?auto_246 ) ) ( HOIST-AT ?auto_245 ?auto_244 ) ( not ( = ?auto_249 ?auto_245 ) ) ( AVAILABLE ?auto_245 ) ( SURFACE-AT ?auto_241 ?auto_244 ) ( ON ?auto_241 ?auto_243 ) ( CLEAR ?auto_241 ) ( not ( = ?auto_241 ?auto_243 ) ) ( not ( = ?auto_242 ?auto_243 ) ) ( SURFACE-AT ?auto_247 ?auto_246 ) ( CLEAR ?auto_247 ) ( IS-CRATE ?auto_242 ) ( not ( = ?auto_241 ?auto_247 ) ) ( not ( = ?auto_242 ?auto_247 ) ) ( not ( = ?auto_243 ?auto_247 ) ) ( AVAILABLE ?auto_249 ) ( IN ?auto_242 ?auto_248 ) ( TRUCK-AT ?auto_248 ?auto_244 ) )
    :subtasks
    ( ( !DRIVE ?auto_248 ?auto_244 ?auto_246 )
      ( MAKE-ON ?auto_241 ?auto_242 )
      ( MAKE-ON-VERIFY ?auto_241 ?auto_242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_250 - SURFACE
      ?auto_251 - SURFACE
    )
    :vars
    (
      ?auto_252 - HOIST
      ?auto_256 - PLACE
      ?auto_254 - PLACE
      ?auto_258 - HOIST
      ?auto_257 - SURFACE
      ?auto_253 - SURFACE
      ?auto_255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_252 ?auto_256 ) ( IS-CRATE ?auto_250 ) ( not ( = ?auto_250 ?auto_251 ) ) ( not ( = ?auto_254 ?auto_256 ) ) ( HOIST-AT ?auto_258 ?auto_254 ) ( not ( = ?auto_252 ?auto_258 ) ) ( SURFACE-AT ?auto_250 ?auto_254 ) ( ON ?auto_250 ?auto_257 ) ( CLEAR ?auto_250 ) ( not ( = ?auto_250 ?auto_257 ) ) ( not ( = ?auto_251 ?auto_257 ) ) ( SURFACE-AT ?auto_253 ?auto_256 ) ( CLEAR ?auto_253 ) ( IS-CRATE ?auto_251 ) ( not ( = ?auto_250 ?auto_253 ) ) ( not ( = ?auto_251 ?auto_253 ) ) ( not ( = ?auto_257 ?auto_253 ) ) ( AVAILABLE ?auto_252 ) ( TRUCK-AT ?auto_255 ?auto_254 ) ( LIFTING ?auto_258 ?auto_251 ) )
    :subtasks
    ( ( !LOAD ?auto_258 ?auto_251 ?auto_255 ?auto_254 )
      ( MAKE-ON ?auto_250 ?auto_251 )
      ( MAKE-ON-VERIFY ?auto_250 ?auto_251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_259 - SURFACE
      ?auto_260 - SURFACE
    )
    :vars
    (
      ?auto_261 - HOIST
      ?auto_266 - PLACE
      ?auto_264 - PLACE
      ?auto_265 - HOIST
      ?auto_267 - SURFACE
      ?auto_263 - SURFACE
      ?auto_262 - TRUCK
      ?auto_268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_261 ?auto_266 ) ( IS-CRATE ?auto_259 ) ( not ( = ?auto_259 ?auto_260 ) ) ( not ( = ?auto_264 ?auto_266 ) ) ( HOIST-AT ?auto_265 ?auto_264 ) ( not ( = ?auto_261 ?auto_265 ) ) ( SURFACE-AT ?auto_259 ?auto_264 ) ( ON ?auto_259 ?auto_267 ) ( CLEAR ?auto_259 ) ( not ( = ?auto_259 ?auto_267 ) ) ( not ( = ?auto_260 ?auto_267 ) ) ( SURFACE-AT ?auto_263 ?auto_266 ) ( CLEAR ?auto_263 ) ( IS-CRATE ?auto_260 ) ( not ( = ?auto_259 ?auto_263 ) ) ( not ( = ?auto_260 ?auto_263 ) ) ( not ( = ?auto_267 ?auto_263 ) ) ( AVAILABLE ?auto_261 ) ( TRUCK-AT ?auto_262 ?auto_264 ) ( AVAILABLE ?auto_265 ) ( SURFACE-AT ?auto_260 ?auto_264 ) ( ON ?auto_260 ?auto_268 ) ( CLEAR ?auto_260 ) ( not ( = ?auto_259 ?auto_268 ) ) ( not ( = ?auto_260 ?auto_268 ) ) ( not ( = ?auto_267 ?auto_268 ) ) ( not ( = ?auto_263 ?auto_268 ) ) )
    :subtasks
    ( ( !LIFT ?auto_265 ?auto_260 ?auto_268 ?auto_264 )
      ( MAKE-ON ?auto_259 ?auto_260 )
      ( MAKE-ON-VERIFY ?auto_259 ?auto_260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_269 - SURFACE
      ?auto_270 - SURFACE
    )
    :vars
    (
      ?auto_278 - HOIST
      ?auto_272 - PLACE
      ?auto_274 - PLACE
      ?auto_275 - HOIST
      ?auto_276 - SURFACE
      ?auto_273 - SURFACE
      ?auto_277 - SURFACE
      ?auto_271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278 ?auto_272 ) ( IS-CRATE ?auto_269 ) ( not ( = ?auto_269 ?auto_270 ) ) ( not ( = ?auto_274 ?auto_272 ) ) ( HOIST-AT ?auto_275 ?auto_274 ) ( not ( = ?auto_278 ?auto_275 ) ) ( SURFACE-AT ?auto_269 ?auto_274 ) ( ON ?auto_269 ?auto_276 ) ( CLEAR ?auto_269 ) ( not ( = ?auto_269 ?auto_276 ) ) ( not ( = ?auto_270 ?auto_276 ) ) ( SURFACE-AT ?auto_273 ?auto_272 ) ( CLEAR ?auto_273 ) ( IS-CRATE ?auto_270 ) ( not ( = ?auto_269 ?auto_273 ) ) ( not ( = ?auto_270 ?auto_273 ) ) ( not ( = ?auto_276 ?auto_273 ) ) ( AVAILABLE ?auto_278 ) ( AVAILABLE ?auto_275 ) ( SURFACE-AT ?auto_270 ?auto_274 ) ( ON ?auto_270 ?auto_277 ) ( CLEAR ?auto_270 ) ( not ( = ?auto_269 ?auto_277 ) ) ( not ( = ?auto_270 ?auto_277 ) ) ( not ( = ?auto_276 ?auto_277 ) ) ( not ( = ?auto_273 ?auto_277 ) ) ( TRUCK-AT ?auto_271 ?auto_272 ) )
    :subtasks
    ( ( !DRIVE ?auto_271 ?auto_272 ?auto_274 )
      ( MAKE-ON ?auto_269 ?auto_270 )
      ( MAKE-ON-VERIFY ?auto_269 ?auto_270 ) )
  )

)

