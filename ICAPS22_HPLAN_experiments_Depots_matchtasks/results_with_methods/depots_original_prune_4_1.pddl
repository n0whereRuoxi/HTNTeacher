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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6164 - SURFACE
      ?auto_6165 - SURFACE
    )
    :vars
    (
      ?auto_6166 - HOIST
      ?auto_6167 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6166 ?auto_6167 ) ( SURFACE-AT ?auto_6164 ?auto_6167 ) ( CLEAR ?auto_6164 ) ( LIFTING ?auto_6166 ?auto_6165 ) ( IS-CRATE ?auto_6165 ) ( not ( = ?auto_6164 ?auto_6165 ) ) )
    :subtasks
    ( ( !DROP ?auto_6166 ?auto_6165 ?auto_6164 ?auto_6167 )
      ( MAKE-1CRATE-VERIFY ?auto_6164 ?auto_6165 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6168 - SURFACE
      ?auto_6169 - SURFACE
    )
    :vars
    (
      ?auto_6170 - HOIST
      ?auto_6171 - PLACE
      ?auto_6172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6170 ?auto_6171 ) ( SURFACE-AT ?auto_6168 ?auto_6171 ) ( CLEAR ?auto_6168 ) ( IS-CRATE ?auto_6169 ) ( not ( = ?auto_6168 ?auto_6169 ) ) ( TRUCK-AT ?auto_6172 ?auto_6171 ) ( AVAILABLE ?auto_6170 ) ( IN ?auto_6169 ?auto_6172 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6170 ?auto_6169 ?auto_6172 ?auto_6171 )
      ( MAKE-1CRATE ?auto_6168 ?auto_6169 )
      ( MAKE-1CRATE-VERIFY ?auto_6168 ?auto_6169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6173 - SURFACE
      ?auto_6174 - SURFACE
    )
    :vars
    (
      ?auto_6177 - HOIST
      ?auto_6176 - PLACE
      ?auto_6175 - TRUCK
      ?auto_6178 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6177 ?auto_6176 ) ( SURFACE-AT ?auto_6173 ?auto_6176 ) ( CLEAR ?auto_6173 ) ( IS-CRATE ?auto_6174 ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( AVAILABLE ?auto_6177 ) ( IN ?auto_6174 ?auto_6175 ) ( TRUCK-AT ?auto_6175 ?auto_6178 ) ( not ( = ?auto_6178 ?auto_6176 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6175 ?auto_6178 ?auto_6176 )
      ( MAKE-1CRATE ?auto_6173 ?auto_6174 )
      ( MAKE-1CRATE-VERIFY ?auto_6173 ?auto_6174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6179 - SURFACE
      ?auto_6180 - SURFACE
    )
    :vars
    (
      ?auto_6184 - HOIST
      ?auto_6182 - PLACE
      ?auto_6181 - TRUCK
      ?auto_6183 - PLACE
      ?auto_6185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6184 ?auto_6182 ) ( SURFACE-AT ?auto_6179 ?auto_6182 ) ( CLEAR ?auto_6179 ) ( IS-CRATE ?auto_6180 ) ( not ( = ?auto_6179 ?auto_6180 ) ) ( AVAILABLE ?auto_6184 ) ( TRUCK-AT ?auto_6181 ?auto_6183 ) ( not ( = ?auto_6183 ?auto_6182 ) ) ( HOIST-AT ?auto_6185 ?auto_6183 ) ( LIFTING ?auto_6185 ?auto_6180 ) ( not ( = ?auto_6184 ?auto_6185 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6185 ?auto_6180 ?auto_6181 ?auto_6183 )
      ( MAKE-1CRATE ?auto_6179 ?auto_6180 )
      ( MAKE-1CRATE-VERIFY ?auto_6179 ?auto_6180 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6186 - SURFACE
      ?auto_6187 - SURFACE
    )
    :vars
    (
      ?auto_6190 - HOIST
      ?auto_6191 - PLACE
      ?auto_6189 - TRUCK
      ?auto_6188 - PLACE
      ?auto_6192 - HOIST
      ?auto_6193 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6190 ?auto_6191 ) ( SURFACE-AT ?auto_6186 ?auto_6191 ) ( CLEAR ?auto_6186 ) ( IS-CRATE ?auto_6187 ) ( not ( = ?auto_6186 ?auto_6187 ) ) ( AVAILABLE ?auto_6190 ) ( TRUCK-AT ?auto_6189 ?auto_6188 ) ( not ( = ?auto_6188 ?auto_6191 ) ) ( HOIST-AT ?auto_6192 ?auto_6188 ) ( not ( = ?auto_6190 ?auto_6192 ) ) ( AVAILABLE ?auto_6192 ) ( SURFACE-AT ?auto_6187 ?auto_6188 ) ( ON ?auto_6187 ?auto_6193 ) ( CLEAR ?auto_6187 ) ( not ( = ?auto_6186 ?auto_6193 ) ) ( not ( = ?auto_6187 ?auto_6193 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6192 ?auto_6187 ?auto_6193 ?auto_6188 )
      ( MAKE-1CRATE ?auto_6186 ?auto_6187 )
      ( MAKE-1CRATE-VERIFY ?auto_6186 ?auto_6187 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6194 - SURFACE
      ?auto_6195 - SURFACE
    )
    :vars
    (
      ?auto_6198 - HOIST
      ?auto_6200 - PLACE
      ?auto_6197 - PLACE
      ?auto_6196 - HOIST
      ?auto_6201 - SURFACE
      ?auto_6199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6198 ?auto_6200 ) ( SURFACE-AT ?auto_6194 ?auto_6200 ) ( CLEAR ?auto_6194 ) ( IS-CRATE ?auto_6195 ) ( not ( = ?auto_6194 ?auto_6195 ) ) ( AVAILABLE ?auto_6198 ) ( not ( = ?auto_6197 ?auto_6200 ) ) ( HOIST-AT ?auto_6196 ?auto_6197 ) ( not ( = ?auto_6198 ?auto_6196 ) ) ( AVAILABLE ?auto_6196 ) ( SURFACE-AT ?auto_6195 ?auto_6197 ) ( ON ?auto_6195 ?auto_6201 ) ( CLEAR ?auto_6195 ) ( not ( = ?auto_6194 ?auto_6201 ) ) ( not ( = ?auto_6195 ?auto_6201 ) ) ( TRUCK-AT ?auto_6199 ?auto_6200 ) )
    :subtasks
    ( ( !DRIVE ?auto_6199 ?auto_6200 ?auto_6197 )
      ( MAKE-1CRATE ?auto_6194 ?auto_6195 )
      ( MAKE-1CRATE-VERIFY ?auto_6194 ?auto_6195 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6211 - SURFACE
      ?auto_6212 - SURFACE
      ?auto_6213 - SURFACE
    )
    :vars
    (
      ?auto_6215 - HOIST
      ?auto_6214 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6215 ?auto_6214 ) ( SURFACE-AT ?auto_6212 ?auto_6214 ) ( CLEAR ?auto_6212 ) ( LIFTING ?auto_6215 ?auto_6213 ) ( IS-CRATE ?auto_6213 ) ( not ( = ?auto_6212 ?auto_6213 ) ) ( ON ?auto_6212 ?auto_6211 ) ( not ( = ?auto_6211 ?auto_6212 ) ) ( not ( = ?auto_6211 ?auto_6213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6212 ?auto_6213 )
      ( MAKE-2CRATE-VERIFY ?auto_6211 ?auto_6212 ?auto_6213 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6221 - SURFACE
      ?auto_6222 - SURFACE
      ?auto_6223 - SURFACE
    )
    :vars
    (
      ?auto_6225 - HOIST
      ?auto_6226 - PLACE
      ?auto_6224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6225 ?auto_6226 ) ( SURFACE-AT ?auto_6222 ?auto_6226 ) ( CLEAR ?auto_6222 ) ( IS-CRATE ?auto_6223 ) ( not ( = ?auto_6222 ?auto_6223 ) ) ( TRUCK-AT ?auto_6224 ?auto_6226 ) ( AVAILABLE ?auto_6225 ) ( IN ?auto_6223 ?auto_6224 ) ( ON ?auto_6222 ?auto_6221 ) ( not ( = ?auto_6221 ?auto_6222 ) ) ( not ( = ?auto_6221 ?auto_6223 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6222 ?auto_6223 )
      ( MAKE-2CRATE-VERIFY ?auto_6221 ?auto_6222 ?auto_6223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6227 - SURFACE
      ?auto_6228 - SURFACE
    )
    :vars
    (
      ?auto_6229 - HOIST
      ?auto_6232 - PLACE
      ?auto_6231 - TRUCK
      ?auto_6230 - SURFACE
      ?auto_6233 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6229 ?auto_6232 ) ( SURFACE-AT ?auto_6227 ?auto_6232 ) ( CLEAR ?auto_6227 ) ( IS-CRATE ?auto_6228 ) ( not ( = ?auto_6227 ?auto_6228 ) ) ( AVAILABLE ?auto_6229 ) ( IN ?auto_6228 ?auto_6231 ) ( ON ?auto_6227 ?auto_6230 ) ( not ( = ?auto_6230 ?auto_6227 ) ) ( not ( = ?auto_6230 ?auto_6228 ) ) ( TRUCK-AT ?auto_6231 ?auto_6233 ) ( not ( = ?auto_6233 ?auto_6232 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6231 ?auto_6233 ?auto_6232 )
      ( MAKE-2CRATE ?auto_6230 ?auto_6227 ?auto_6228 )
      ( MAKE-1CRATE-VERIFY ?auto_6227 ?auto_6228 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6234 - SURFACE
      ?auto_6235 - SURFACE
      ?auto_6236 - SURFACE
    )
    :vars
    (
      ?auto_6238 - HOIST
      ?auto_6239 - PLACE
      ?auto_6237 - TRUCK
      ?auto_6240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6238 ?auto_6239 ) ( SURFACE-AT ?auto_6235 ?auto_6239 ) ( CLEAR ?auto_6235 ) ( IS-CRATE ?auto_6236 ) ( not ( = ?auto_6235 ?auto_6236 ) ) ( AVAILABLE ?auto_6238 ) ( IN ?auto_6236 ?auto_6237 ) ( ON ?auto_6235 ?auto_6234 ) ( not ( = ?auto_6234 ?auto_6235 ) ) ( not ( = ?auto_6234 ?auto_6236 ) ) ( TRUCK-AT ?auto_6237 ?auto_6240 ) ( not ( = ?auto_6240 ?auto_6239 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6235 ?auto_6236 )
      ( MAKE-2CRATE-VERIFY ?auto_6234 ?auto_6235 ?auto_6236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6241 - SURFACE
      ?auto_6242 - SURFACE
    )
    :vars
    (
      ?auto_6247 - HOIST
      ?auto_6244 - PLACE
      ?auto_6243 - SURFACE
      ?auto_6245 - TRUCK
      ?auto_6246 - PLACE
      ?auto_6248 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6247 ?auto_6244 ) ( SURFACE-AT ?auto_6241 ?auto_6244 ) ( CLEAR ?auto_6241 ) ( IS-CRATE ?auto_6242 ) ( not ( = ?auto_6241 ?auto_6242 ) ) ( AVAILABLE ?auto_6247 ) ( ON ?auto_6241 ?auto_6243 ) ( not ( = ?auto_6243 ?auto_6241 ) ) ( not ( = ?auto_6243 ?auto_6242 ) ) ( TRUCK-AT ?auto_6245 ?auto_6246 ) ( not ( = ?auto_6246 ?auto_6244 ) ) ( HOIST-AT ?auto_6248 ?auto_6246 ) ( LIFTING ?auto_6248 ?auto_6242 ) ( not ( = ?auto_6247 ?auto_6248 ) ) )
    :subtasks
    ( ( !LOAD ?auto_6248 ?auto_6242 ?auto_6245 ?auto_6246 )
      ( MAKE-2CRATE ?auto_6243 ?auto_6241 ?auto_6242 )
      ( MAKE-1CRATE-VERIFY ?auto_6241 ?auto_6242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6249 - SURFACE
      ?auto_6250 - SURFACE
      ?auto_6251 - SURFACE
    )
    :vars
    (
      ?auto_6252 - HOIST
      ?auto_6255 - PLACE
      ?auto_6256 - TRUCK
      ?auto_6254 - PLACE
      ?auto_6253 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6252 ?auto_6255 ) ( SURFACE-AT ?auto_6250 ?auto_6255 ) ( CLEAR ?auto_6250 ) ( IS-CRATE ?auto_6251 ) ( not ( = ?auto_6250 ?auto_6251 ) ) ( AVAILABLE ?auto_6252 ) ( ON ?auto_6250 ?auto_6249 ) ( not ( = ?auto_6249 ?auto_6250 ) ) ( not ( = ?auto_6249 ?auto_6251 ) ) ( TRUCK-AT ?auto_6256 ?auto_6254 ) ( not ( = ?auto_6254 ?auto_6255 ) ) ( HOIST-AT ?auto_6253 ?auto_6254 ) ( LIFTING ?auto_6253 ?auto_6251 ) ( not ( = ?auto_6252 ?auto_6253 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6250 ?auto_6251 )
      ( MAKE-2CRATE-VERIFY ?auto_6249 ?auto_6250 ?auto_6251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6257 - SURFACE
      ?auto_6258 - SURFACE
    )
    :vars
    (
      ?auto_6264 - HOIST
      ?auto_6262 - PLACE
      ?auto_6260 - SURFACE
      ?auto_6259 - TRUCK
      ?auto_6263 - PLACE
      ?auto_6261 - HOIST
      ?auto_6265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6264 ?auto_6262 ) ( SURFACE-AT ?auto_6257 ?auto_6262 ) ( CLEAR ?auto_6257 ) ( IS-CRATE ?auto_6258 ) ( not ( = ?auto_6257 ?auto_6258 ) ) ( AVAILABLE ?auto_6264 ) ( ON ?auto_6257 ?auto_6260 ) ( not ( = ?auto_6260 ?auto_6257 ) ) ( not ( = ?auto_6260 ?auto_6258 ) ) ( TRUCK-AT ?auto_6259 ?auto_6263 ) ( not ( = ?auto_6263 ?auto_6262 ) ) ( HOIST-AT ?auto_6261 ?auto_6263 ) ( not ( = ?auto_6264 ?auto_6261 ) ) ( AVAILABLE ?auto_6261 ) ( SURFACE-AT ?auto_6258 ?auto_6263 ) ( ON ?auto_6258 ?auto_6265 ) ( CLEAR ?auto_6258 ) ( not ( = ?auto_6257 ?auto_6265 ) ) ( not ( = ?auto_6258 ?auto_6265 ) ) ( not ( = ?auto_6260 ?auto_6265 ) ) )
    :subtasks
    ( ( !LIFT ?auto_6261 ?auto_6258 ?auto_6265 ?auto_6263 )
      ( MAKE-2CRATE ?auto_6260 ?auto_6257 ?auto_6258 )
      ( MAKE-1CRATE-VERIFY ?auto_6257 ?auto_6258 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6266 - SURFACE
      ?auto_6267 - SURFACE
      ?auto_6268 - SURFACE
    )
    :vars
    (
      ?auto_6274 - HOIST
      ?auto_6273 - PLACE
      ?auto_6270 - TRUCK
      ?auto_6271 - PLACE
      ?auto_6269 - HOIST
      ?auto_6272 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6274 ?auto_6273 ) ( SURFACE-AT ?auto_6267 ?auto_6273 ) ( CLEAR ?auto_6267 ) ( IS-CRATE ?auto_6268 ) ( not ( = ?auto_6267 ?auto_6268 ) ) ( AVAILABLE ?auto_6274 ) ( ON ?auto_6267 ?auto_6266 ) ( not ( = ?auto_6266 ?auto_6267 ) ) ( not ( = ?auto_6266 ?auto_6268 ) ) ( TRUCK-AT ?auto_6270 ?auto_6271 ) ( not ( = ?auto_6271 ?auto_6273 ) ) ( HOIST-AT ?auto_6269 ?auto_6271 ) ( not ( = ?auto_6274 ?auto_6269 ) ) ( AVAILABLE ?auto_6269 ) ( SURFACE-AT ?auto_6268 ?auto_6271 ) ( ON ?auto_6268 ?auto_6272 ) ( CLEAR ?auto_6268 ) ( not ( = ?auto_6267 ?auto_6272 ) ) ( not ( = ?auto_6268 ?auto_6272 ) ) ( not ( = ?auto_6266 ?auto_6272 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6267 ?auto_6268 )
      ( MAKE-2CRATE-VERIFY ?auto_6266 ?auto_6267 ?auto_6268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6275 - SURFACE
      ?auto_6276 - SURFACE
    )
    :vars
    (
      ?auto_6280 - HOIST
      ?auto_6281 - PLACE
      ?auto_6278 - SURFACE
      ?auto_6283 - PLACE
      ?auto_6277 - HOIST
      ?auto_6279 - SURFACE
      ?auto_6282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6280 ?auto_6281 ) ( SURFACE-AT ?auto_6275 ?auto_6281 ) ( CLEAR ?auto_6275 ) ( IS-CRATE ?auto_6276 ) ( not ( = ?auto_6275 ?auto_6276 ) ) ( AVAILABLE ?auto_6280 ) ( ON ?auto_6275 ?auto_6278 ) ( not ( = ?auto_6278 ?auto_6275 ) ) ( not ( = ?auto_6278 ?auto_6276 ) ) ( not ( = ?auto_6283 ?auto_6281 ) ) ( HOIST-AT ?auto_6277 ?auto_6283 ) ( not ( = ?auto_6280 ?auto_6277 ) ) ( AVAILABLE ?auto_6277 ) ( SURFACE-AT ?auto_6276 ?auto_6283 ) ( ON ?auto_6276 ?auto_6279 ) ( CLEAR ?auto_6276 ) ( not ( = ?auto_6275 ?auto_6279 ) ) ( not ( = ?auto_6276 ?auto_6279 ) ) ( not ( = ?auto_6278 ?auto_6279 ) ) ( TRUCK-AT ?auto_6282 ?auto_6281 ) )
    :subtasks
    ( ( !DRIVE ?auto_6282 ?auto_6281 ?auto_6283 )
      ( MAKE-2CRATE ?auto_6278 ?auto_6275 ?auto_6276 )
      ( MAKE-1CRATE-VERIFY ?auto_6275 ?auto_6276 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6284 - SURFACE
      ?auto_6285 - SURFACE
      ?auto_6286 - SURFACE
    )
    :vars
    (
      ?auto_6291 - HOIST
      ?auto_6288 - PLACE
      ?auto_6292 - PLACE
      ?auto_6287 - HOIST
      ?auto_6290 - SURFACE
      ?auto_6289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6291 ?auto_6288 ) ( SURFACE-AT ?auto_6285 ?auto_6288 ) ( CLEAR ?auto_6285 ) ( IS-CRATE ?auto_6286 ) ( not ( = ?auto_6285 ?auto_6286 ) ) ( AVAILABLE ?auto_6291 ) ( ON ?auto_6285 ?auto_6284 ) ( not ( = ?auto_6284 ?auto_6285 ) ) ( not ( = ?auto_6284 ?auto_6286 ) ) ( not ( = ?auto_6292 ?auto_6288 ) ) ( HOIST-AT ?auto_6287 ?auto_6292 ) ( not ( = ?auto_6291 ?auto_6287 ) ) ( AVAILABLE ?auto_6287 ) ( SURFACE-AT ?auto_6286 ?auto_6292 ) ( ON ?auto_6286 ?auto_6290 ) ( CLEAR ?auto_6286 ) ( not ( = ?auto_6285 ?auto_6290 ) ) ( not ( = ?auto_6286 ?auto_6290 ) ) ( not ( = ?auto_6284 ?auto_6290 ) ) ( TRUCK-AT ?auto_6289 ?auto_6288 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6285 ?auto_6286 )
      ( MAKE-2CRATE-VERIFY ?auto_6284 ?auto_6285 ?auto_6286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6293 - SURFACE
      ?auto_6294 - SURFACE
    )
    :vars
    (
      ?auto_6297 - HOIST
      ?auto_6298 - PLACE
      ?auto_6296 - SURFACE
      ?auto_6299 - PLACE
      ?auto_6295 - HOIST
      ?auto_6301 - SURFACE
      ?auto_6300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6297 ?auto_6298 ) ( IS-CRATE ?auto_6294 ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( not ( = ?auto_6296 ?auto_6293 ) ) ( not ( = ?auto_6296 ?auto_6294 ) ) ( not ( = ?auto_6299 ?auto_6298 ) ) ( HOIST-AT ?auto_6295 ?auto_6299 ) ( not ( = ?auto_6297 ?auto_6295 ) ) ( AVAILABLE ?auto_6295 ) ( SURFACE-AT ?auto_6294 ?auto_6299 ) ( ON ?auto_6294 ?auto_6301 ) ( CLEAR ?auto_6294 ) ( not ( = ?auto_6293 ?auto_6301 ) ) ( not ( = ?auto_6294 ?auto_6301 ) ) ( not ( = ?auto_6296 ?auto_6301 ) ) ( TRUCK-AT ?auto_6300 ?auto_6298 ) ( SURFACE-AT ?auto_6296 ?auto_6298 ) ( CLEAR ?auto_6296 ) ( LIFTING ?auto_6297 ?auto_6293 ) ( IS-CRATE ?auto_6293 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6296 ?auto_6293 )
      ( MAKE-2CRATE ?auto_6296 ?auto_6293 ?auto_6294 )
      ( MAKE-1CRATE-VERIFY ?auto_6293 ?auto_6294 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6302 - SURFACE
      ?auto_6303 - SURFACE
      ?auto_6304 - SURFACE
    )
    :vars
    (
      ?auto_6305 - HOIST
      ?auto_6309 - PLACE
      ?auto_6310 - PLACE
      ?auto_6307 - HOIST
      ?auto_6306 - SURFACE
      ?auto_6308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6305 ?auto_6309 ) ( IS-CRATE ?auto_6304 ) ( not ( = ?auto_6303 ?auto_6304 ) ) ( not ( = ?auto_6302 ?auto_6303 ) ) ( not ( = ?auto_6302 ?auto_6304 ) ) ( not ( = ?auto_6310 ?auto_6309 ) ) ( HOIST-AT ?auto_6307 ?auto_6310 ) ( not ( = ?auto_6305 ?auto_6307 ) ) ( AVAILABLE ?auto_6307 ) ( SURFACE-AT ?auto_6304 ?auto_6310 ) ( ON ?auto_6304 ?auto_6306 ) ( CLEAR ?auto_6304 ) ( not ( = ?auto_6303 ?auto_6306 ) ) ( not ( = ?auto_6304 ?auto_6306 ) ) ( not ( = ?auto_6302 ?auto_6306 ) ) ( TRUCK-AT ?auto_6308 ?auto_6309 ) ( SURFACE-AT ?auto_6302 ?auto_6309 ) ( CLEAR ?auto_6302 ) ( LIFTING ?auto_6305 ?auto_6303 ) ( IS-CRATE ?auto_6303 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6303 ?auto_6304 )
      ( MAKE-2CRATE-VERIFY ?auto_6302 ?auto_6303 ?auto_6304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6311 - SURFACE
      ?auto_6312 - SURFACE
    )
    :vars
    (
      ?auto_6313 - HOIST
      ?auto_6317 - PLACE
      ?auto_6315 - SURFACE
      ?auto_6316 - PLACE
      ?auto_6319 - HOIST
      ?auto_6314 - SURFACE
      ?auto_6318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6313 ?auto_6317 ) ( IS-CRATE ?auto_6312 ) ( not ( = ?auto_6311 ?auto_6312 ) ) ( not ( = ?auto_6315 ?auto_6311 ) ) ( not ( = ?auto_6315 ?auto_6312 ) ) ( not ( = ?auto_6316 ?auto_6317 ) ) ( HOIST-AT ?auto_6319 ?auto_6316 ) ( not ( = ?auto_6313 ?auto_6319 ) ) ( AVAILABLE ?auto_6319 ) ( SURFACE-AT ?auto_6312 ?auto_6316 ) ( ON ?auto_6312 ?auto_6314 ) ( CLEAR ?auto_6312 ) ( not ( = ?auto_6311 ?auto_6314 ) ) ( not ( = ?auto_6312 ?auto_6314 ) ) ( not ( = ?auto_6315 ?auto_6314 ) ) ( TRUCK-AT ?auto_6318 ?auto_6317 ) ( SURFACE-AT ?auto_6315 ?auto_6317 ) ( CLEAR ?auto_6315 ) ( IS-CRATE ?auto_6311 ) ( AVAILABLE ?auto_6313 ) ( IN ?auto_6311 ?auto_6318 ) )
    :subtasks
    ( ( !UNLOAD ?auto_6313 ?auto_6311 ?auto_6318 ?auto_6317 )
      ( MAKE-2CRATE ?auto_6315 ?auto_6311 ?auto_6312 )
      ( MAKE-1CRATE-VERIFY ?auto_6311 ?auto_6312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6320 - SURFACE
      ?auto_6321 - SURFACE
      ?auto_6322 - SURFACE
    )
    :vars
    (
      ?auto_6325 - HOIST
      ?auto_6324 - PLACE
      ?auto_6328 - PLACE
      ?auto_6323 - HOIST
      ?auto_6327 - SURFACE
      ?auto_6326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6325 ?auto_6324 ) ( IS-CRATE ?auto_6322 ) ( not ( = ?auto_6321 ?auto_6322 ) ) ( not ( = ?auto_6320 ?auto_6321 ) ) ( not ( = ?auto_6320 ?auto_6322 ) ) ( not ( = ?auto_6328 ?auto_6324 ) ) ( HOIST-AT ?auto_6323 ?auto_6328 ) ( not ( = ?auto_6325 ?auto_6323 ) ) ( AVAILABLE ?auto_6323 ) ( SURFACE-AT ?auto_6322 ?auto_6328 ) ( ON ?auto_6322 ?auto_6327 ) ( CLEAR ?auto_6322 ) ( not ( = ?auto_6321 ?auto_6327 ) ) ( not ( = ?auto_6322 ?auto_6327 ) ) ( not ( = ?auto_6320 ?auto_6327 ) ) ( TRUCK-AT ?auto_6326 ?auto_6324 ) ( SURFACE-AT ?auto_6320 ?auto_6324 ) ( CLEAR ?auto_6320 ) ( IS-CRATE ?auto_6321 ) ( AVAILABLE ?auto_6325 ) ( IN ?auto_6321 ?auto_6326 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6321 ?auto_6322 )
      ( MAKE-2CRATE-VERIFY ?auto_6320 ?auto_6321 ?auto_6322 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6365 - SURFACE
      ?auto_6366 - SURFACE
    )
    :vars
    (
      ?auto_6367 - HOIST
      ?auto_6372 - PLACE
      ?auto_6369 - SURFACE
      ?auto_6368 - PLACE
      ?auto_6373 - HOIST
      ?auto_6371 - SURFACE
      ?auto_6370 - TRUCK
      ?auto_6374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6367 ?auto_6372 ) ( SURFACE-AT ?auto_6365 ?auto_6372 ) ( CLEAR ?auto_6365 ) ( IS-CRATE ?auto_6366 ) ( not ( = ?auto_6365 ?auto_6366 ) ) ( AVAILABLE ?auto_6367 ) ( ON ?auto_6365 ?auto_6369 ) ( not ( = ?auto_6369 ?auto_6365 ) ) ( not ( = ?auto_6369 ?auto_6366 ) ) ( not ( = ?auto_6368 ?auto_6372 ) ) ( HOIST-AT ?auto_6373 ?auto_6368 ) ( not ( = ?auto_6367 ?auto_6373 ) ) ( AVAILABLE ?auto_6373 ) ( SURFACE-AT ?auto_6366 ?auto_6368 ) ( ON ?auto_6366 ?auto_6371 ) ( CLEAR ?auto_6366 ) ( not ( = ?auto_6365 ?auto_6371 ) ) ( not ( = ?auto_6366 ?auto_6371 ) ) ( not ( = ?auto_6369 ?auto_6371 ) ) ( TRUCK-AT ?auto_6370 ?auto_6374 ) ( not ( = ?auto_6374 ?auto_6372 ) ) ( not ( = ?auto_6368 ?auto_6374 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6370 ?auto_6374 ?auto_6372 )
      ( MAKE-1CRATE ?auto_6365 ?auto_6366 )
      ( MAKE-1CRATE-VERIFY ?auto_6365 ?auto_6366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6405 - SURFACE
      ?auto_6406 - SURFACE
      ?auto_6407 - SURFACE
      ?auto_6404 - SURFACE
    )
    :vars
    (
      ?auto_6409 - HOIST
      ?auto_6408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6409 ?auto_6408 ) ( SURFACE-AT ?auto_6407 ?auto_6408 ) ( CLEAR ?auto_6407 ) ( LIFTING ?auto_6409 ?auto_6404 ) ( IS-CRATE ?auto_6404 ) ( not ( = ?auto_6407 ?auto_6404 ) ) ( ON ?auto_6406 ?auto_6405 ) ( ON ?auto_6407 ?auto_6406 ) ( not ( = ?auto_6405 ?auto_6406 ) ) ( not ( = ?auto_6405 ?auto_6407 ) ) ( not ( = ?auto_6405 ?auto_6404 ) ) ( not ( = ?auto_6406 ?auto_6407 ) ) ( not ( = ?auto_6406 ?auto_6404 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6407 ?auto_6404 )
      ( MAKE-3CRATE-VERIFY ?auto_6405 ?auto_6406 ?auto_6407 ?auto_6404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6422 - SURFACE
      ?auto_6423 - SURFACE
      ?auto_6424 - SURFACE
      ?auto_6421 - SURFACE
    )
    :vars
    (
      ?auto_6426 - HOIST
      ?auto_6427 - PLACE
      ?auto_6425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6426 ?auto_6427 ) ( SURFACE-AT ?auto_6424 ?auto_6427 ) ( CLEAR ?auto_6424 ) ( IS-CRATE ?auto_6421 ) ( not ( = ?auto_6424 ?auto_6421 ) ) ( TRUCK-AT ?auto_6425 ?auto_6427 ) ( AVAILABLE ?auto_6426 ) ( IN ?auto_6421 ?auto_6425 ) ( ON ?auto_6424 ?auto_6423 ) ( not ( = ?auto_6423 ?auto_6424 ) ) ( not ( = ?auto_6423 ?auto_6421 ) ) ( ON ?auto_6423 ?auto_6422 ) ( not ( = ?auto_6422 ?auto_6423 ) ) ( not ( = ?auto_6422 ?auto_6424 ) ) ( not ( = ?auto_6422 ?auto_6421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6423 ?auto_6424 ?auto_6421 )
      ( MAKE-3CRATE-VERIFY ?auto_6422 ?auto_6423 ?auto_6424 ?auto_6421 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6443 - SURFACE
      ?auto_6444 - SURFACE
      ?auto_6445 - SURFACE
      ?auto_6442 - SURFACE
    )
    :vars
    (
      ?auto_6446 - HOIST
      ?auto_6448 - PLACE
      ?auto_6449 - TRUCK
      ?auto_6447 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6446 ?auto_6448 ) ( SURFACE-AT ?auto_6445 ?auto_6448 ) ( CLEAR ?auto_6445 ) ( IS-CRATE ?auto_6442 ) ( not ( = ?auto_6445 ?auto_6442 ) ) ( AVAILABLE ?auto_6446 ) ( IN ?auto_6442 ?auto_6449 ) ( ON ?auto_6445 ?auto_6444 ) ( not ( = ?auto_6444 ?auto_6445 ) ) ( not ( = ?auto_6444 ?auto_6442 ) ) ( TRUCK-AT ?auto_6449 ?auto_6447 ) ( not ( = ?auto_6447 ?auto_6448 ) ) ( ON ?auto_6444 ?auto_6443 ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6445 ) ) ( not ( = ?auto_6443 ?auto_6442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6444 ?auto_6445 ?auto_6442 )
      ( MAKE-3CRATE-VERIFY ?auto_6443 ?auto_6444 ?auto_6445 ?auto_6442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6467 - SURFACE
      ?auto_6468 - SURFACE
      ?auto_6469 - SURFACE
      ?auto_6466 - SURFACE
    )
    :vars
    (
      ?auto_6473 - HOIST
      ?auto_6472 - PLACE
      ?auto_6474 - TRUCK
      ?auto_6471 - PLACE
      ?auto_6470 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6473 ?auto_6472 ) ( SURFACE-AT ?auto_6469 ?auto_6472 ) ( CLEAR ?auto_6469 ) ( IS-CRATE ?auto_6466 ) ( not ( = ?auto_6469 ?auto_6466 ) ) ( AVAILABLE ?auto_6473 ) ( ON ?auto_6469 ?auto_6468 ) ( not ( = ?auto_6468 ?auto_6469 ) ) ( not ( = ?auto_6468 ?auto_6466 ) ) ( TRUCK-AT ?auto_6474 ?auto_6471 ) ( not ( = ?auto_6471 ?auto_6472 ) ) ( HOIST-AT ?auto_6470 ?auto_6471 ) ( LIFTING ?auto_6470 ?auto_6466 ) ( not ( = ?auto_6473 ?auto_6470 ) ) ( ON ?auto_6468 ?auto_6467 ) ( not ( = ?auto_6467 ?auto_6468 ) ) ( not ( = ?auto_6467 ?auto_6469 ) ) ( not ( = ?auto_6467 ?auto_6466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6468 ?auto_6469 ?auto_6466 )
      ( MAKE-3CRATE-VERIFY ?auto_6467 ?auto_6468 ?auto_6469 ?auto_6466 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6494 - SURFACE
      ?auto_6495 - SURFACE
      ?auto_6496 - SURFACE
      ?auto_6493 - SURFACE
    )
    :vars
    (
      ?auto_6501 - HOIST
      ?auto_6502 - PLACE
      ?auto_6498 - TRUCK
      ?auto_6497 - PLACE
      ?auto_6499 - HOIST
      ?auto_6500 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6501 ?auto_6502 ) ( SURFACE-AT ?auto_6496 ?auto_6502 ) ( CLEAR ?auto_6496 ) ( IS-CRATE ?auto_6493 ) ( not ( = ?auto_6496 ?auto_6493 ) ) ( AVAILABLE ?auto_6501 ) ( ON ?auto_6496 ?auto_6495 ) ( not ( = ?auto_6495 ?auto_6496 ) ) ( not ( = ?auto_6495 ?auto_6493 ) ) ( TRUCK-AT ?auto_6498 ?auto_6497 ) ( not ( = ?auto_6497 ?auto_6502 ) ) ( HOIST-AT ?auto_6499 ?auto_6497 ) ( not ( = ?auto_6501 ?auto_6499 ) ) ( AVAILABLE ?auto_6499 ) ( SURFACE-AT ?auto_6493 ?auto_6497 ) ( ON ?auto_6493 ?auto_6500 ) ( CLEAR ?auto_6493 ) ( not ( = ?auto_6496 ?auto_6500 ) ) ( not ( = ?auto_6493 ?auto_6500 ) ) ( not ( = ?auto_6495 ?auto_6500 ) ) ( ON ?auto_6495 ?auto_6494 ) ( not ( = ?auto_6494 ?auto_6495 ) ) ( not ( = ?auto_6494 ?auto_6496 ) ) ( not ( = ?auto_6494 ?auto_6493 ) ) ( not ( = ?auto_6494 ?auto_6500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6495 ?auto_6496 ?auto_6493 )
      ( MAKE-3CRATE-VERIFY ?auto_6494 ?auto_6495 ?auto_6496 ?auto_6493 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6522 - SURFACE
      ?auto_6523 - SURFACE
      ?auto_6524 - SURFACE
      ?auto_6521 - SURFACE
    )
    :vars
    (
      ?auto_6528 - HOIST
      ?auto_6529 - PLACE
      ?auto_6530 - PLACE
      ?auto_6526 - HOIST
      ?auto_6525 - SURFACE
      ?auto_6527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6528 ?auto_6529 ) ( SURFACE-AT ?auto_6524 ?auto_6529 ) ( CLEAR ?auto_6524 ) ( IS-CRATE ?auto_6521 ) ( not ( = ?auto_6524 ?auto_6521 ) ) ( AVAILABLE ?auto_6528 ) ( ON ?auto_6524 ?auto_6523 ) ( not ( = ?auto_6523 ?auto_6524 ) ) ( not ( = ?auto_6523 ?auto_6521 ) ) ( not ( = ?auto_6530 ?auto_6529 ) ) ( HOIST-AT ?auto_6526 ?auto_6530 ) ( not ( = ?auto_6528 ?auto_6526 ) ) ( AVAILABLE ?auto_6526 ) ( SURFACE-AT ?auto_6521 ?auto_6530 ) ( ON ?auto_6521 ?auto_6525 ) ( CLEAR ?auto_6521 ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( not ( = ?auto_6521 ?auto_6525 ) ) ( not ( = ?auto_6523 ?auto_6525 ) ) ( TRUCK-AT ?auto_6527 ?auto_6529 ) ( ON ?auto_6523 ?auto_6522 ) ( not ( = ?auto_6522 ?auto_6523 ) ) ( not ( = ?auto_6522 ?auto_6524 ) ) ( not ( = ?auto_6522 ?auto_6521 ) ) ( not ( = ?auto_6522 ?auto_6525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6523 ?auto_6524 ?auto_6521 )
      ( MAKE-3CRATE-VERIFY ?auto_6522 ?auto_6523 ?auto_6524 ?auto_6521 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6550 - SURFACE
      ?auto_6551 - SURFACE
      ?auto_6552 - SURFACE
      ?auto_6549 - SURFACE
    )
    :vars
    (
      ?auto_6555 - HOIST
      ?auto_6557 - PLACE
      ?auto_6556 - PLACE
      ?auto_6553 - HOIST
      ?auto_6554 - SURFACE
      ?auto_6558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6555 ?auto_6557 ) ( IS-CRATE ?auto_6549 ) ( not ( = ?auto_6552 ?auto_6549 ) ) ( not ( = ?auto_6551 ?auto_6552 ) ) ( not ( = ?auto_6551 ?auto_6549 ) ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( HOIST-AT ?auto_6553 ?auto_6556 ) ( not ( = ?auto_6555 ?auto_6553 ) ) ( AVAILABLE ?auto_6553 ) ( SURFACE-AT ?auto_6549 ?auto_6556 ) ( ON ?auto_6549 ?auto_6554 ) ( CLEAR ?auto_6549 ) ( not ( = ?auto_6552 ?auto_6554 ) ) ( not ( = ?auto_6549 ?auto_6554 ) ) ( not ( = ?auto_6551 ?auto_6554 ) ) ( TRUCK-AT ?auto_6558 ?auto_6557 ) ( SURFACE-AT ?auto_6551 ?auto_6557 ) ( CLEAR ?auto_6551 ) ( LIFTING ?auto_6555 ?auto_6552 ) ( IS-CRATE ?auto_6552 ) ( ON ?auto_6551 ?auto_6550 ) ( not ( = ?auto_6550 ?auto_6551 ) ) ( not ( = ?auto_6550 ?auto_6552 ) ) ( not ( = ?auto_6550 ?auto_6549 ) ) ( not ( = ?auto_6550 ?auto_6554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6551 ?auto_6552 ?auto_6549 )
      ( MAKE-3CRATE-VERIFY ?auto_6550 ?auto_6551 ?auto_6552 ?auto_6549 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6578 - SURFACE
      ?auto_6579 - SURFACE
      ?auto_6580 - SURFACE
      ?auto_6577 - SURFACE
    )
    :vars
    (
      ?auto_6584 - HOIST
      ?auto_6581 - PLACE
      ?auto_6586 - PLACE
      ?auto_6585 - HOIST
      ?auto_6582 - SURFACE
      ?auto_6583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6584 ?auto_6581 ) ( IS-CRATE ?auto_6577 ) ( not ( = ?auto_6580 ?auto_6577 ) ) ( not ( = ?auto_6579 ?auto_6580 ) ) ( not ( = ?auto_6579 ?auto_6577 ) ) ( not ( = ?auto_6586 ?auto_6581 ) ) ( HOIST-AT ?auto_6585 ?auto_6586 ) ( not ( = ?auto_6584 ?auto_6585 ) ) ( AVAILABLE ?auto_6585 ) ( SURFACE-AT ?auto_6577 ?auto_6586 ) ( ON ?auto_6577 ?auto_6582 ) ( CLEAR ?auto_6577 ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( not ( = ?auto_6577 ?auto_6582 ) ) ( not ( = ?auto_6579 ?auto_6582 ) ) ( TRUCK-AT ?auto_6583 ?auto_6581 ) ( SURFACE-AT ?auto_6579 ?auto_6581 ) ( CLEAR ?auto_6579 ) ( IS-CRATE ?auto_6580 ) ( AVAILABLE ?auto_6584 ) ( IN ?auto_6580 ?auto_6583 ) ( ON ?auto_6579 ?auto_6578 ) ( not ( = ?auto_6578 ?auto_6579 ) ) ( not ( = ?auto_6578 ?auto_6580 ) ) ( not ( = ?auto_6578 ?auto_6577 ) ) ( not ( = ?auto_6578 ?auto_6582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6579 ?auto_6580 ?auto_6577 )
      ( MAKE-3CRATE-VERIFY ?auto_6578 ?auto_6579 ?auto_6580 ?auto_6577 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6869 - SURFACE
      ?auto_6870 - SURFACE
      ?auto_6871 - SURFACE
      ?auto_6868 - SURFACE
      ?auto_6872 - SURFACE
    )
    :vars
    (
      ?auto_6874 - HOIST
      ?auto_6873 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6874 ?auto_6873 ) ( SURFACE-AT ?auto_6868 ?auto_6873 ) ( CLEAR ?auto_6868 ) ( LIFTING ?auto_6874 ?auto_6872 ) ( IS-CRATE ?auto_6872 ) ( not ( = ?auto_6868 ?auto_6872 ) ) ( ON ?auto_6870 ?auto_6869 ) ( ON ?auto_6871 ?auto_6870 ) ( ON ?auto_6868 ?auto_6871 ) ( not ( = ?auto_6869 ?auto_6870 ) ) ( not ( = ?auto_6869 ?auto_6871 ) ) ( not ( = ?auto_6869 ?auto_6868 ) ) ( not ( = ?auto_6869 ?auto_6872 ) ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6870 ?auto_6868 ) ) ( not ( = ?auto_6870 ?auto_6872 ) ) ( not ( = ?auto_6871 ?auto_6868 ) ) ( not ( = ?auto_6871 ?auto_6872 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6868 ?auto_6872 )
      ( MAKE-4CRATE-VERIFY ?auto_6869 ?auto_6870 ?auto_6871 ?auto_6868 ?auto_6872 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6894 - SURFACE
      ?auto_6895 - SURFACE
      ?auto_6896 - SURFACE
      ?auto_6893 - SURFACE
      ?auto_6897 - SURFACE
    )
    :vars
    (
      ?auto_6898 - HOIST
      ?auto_6899 - PLACE
      ?auto_6900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6898 ?auto_6899 ) ( SURFACE-AT ?auto_6893 ?auto_6899 ) ( CLEAR ?auto_6893 ) ( IS-CRATE ?auto_6897 ) ( not ( = ?auto_6893 ?auto_6897 ) ) ( TRUCK-AT ?auto_6900 ?auto_6899 ) ( AVAILABLE ?auto_6898 ) ( IN ?auto_6897 ?auto_6900 ) ( ON ?auto_6893 ?auto_6896 ) ( not ( = ?auto_6896 ?auto_6893 ) ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( ON ?auto_6895 ?auto_6894 ) ( ON ?auto_6896 ?auto_6895 ) ( not ( = ?auto_6894 ?auto_6895 ) ) ( not ( = ?auto_6894 ?auto_6896 ) ) ( not ( = ?auto_6894 ?auto_6893 ) ) ( not ( = ?auto_6894 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6896 ) ) ( not ( = ?auto_6895 ?auto_6893 ) ) ( not ( = ?auto_6895 ?auto_6897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6896 ?auto_6893 ?auto_6897 )
      ( MAKE-4CRATE-VERIFY ?auto_6894 ?auto_6895 ?auto_6896 ?auto_6893 ?auto_6897 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6924 - SURFACE
      ?auto_6925 - SURFACE
      ?auto_6926 - SURFACE
      ?auto_6923 - SURFACE
      ?auto_6927 - SURFACE
    )
    :vars
    (
      ?auto_6928 - HOIST
      ?auto_6929 - PLACE
      ?auto_6930 - TRUCK
      ?auto_6931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_6928 ?auto_6929 ) ( SURFACE-AT ?auto_6923 ?auto_6929 ) ( CLEAR ?auto_6923 ) ( IS-CRATE ?auto_6927 ) ( not ( = ?auto_6923 ?auto_6927 ) ) ( AVAILABLE ?auto_6928 ) ( IN ?auto_6927 ?auto_6930 ) ( ON ?auto_6923 ?auto_6926 ) ( not ( = ?auto_6926 ?auto_6923 ) ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( TRUCK-AT ?auto_6930 ?auto_6931 ) ( not ( = ?auto_6931 ?auto_6929 ) ) ( ON ?auto_6925 ?auto_6924 ) ( ON ?auto_6926 ?auto_6925 ) ( not ( = ?auto_6924 ?auto_6925 ) ) ( not ( = ?auto_6924 ?auto_6926 ) ) ( not ( = ?auto_6924 ?auto_6923 ) ) ( not ( = ?auto_6924 ?auto_6927 ) ) ( not ( = ?auto_6925 ?auto_6926 ) ) ( not ( = ?auto_6925 ?auto_6923 ) ) ( not ( = ?auto_6925 ?auto_6927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6926 ?auto_6923 ?auto_6927 )
      ( MAKE-4CRATE-VERIFY ?auto_6924 ?auto_6925 ?auto_6926 ?auto_6923 ?auto_6927 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6958 - SURFACE
      ?auto_6959 - SURFACE
      ?auto_6960 - SURFACE
      ?auto_6957 - SURFACE
      ?auto_6961 - SURFACE
    )
    :vars
    (
      ?auto_6965 - HOIST
      ?auto_6966 - PLACE
      ?auto_6962 - TRUCK
      ?auto_6963 - PLACE
      ?auto_6964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_6965 ?auto_6966 ) ( SURFACE-AT ?auto_6957 ?auto_6966 ) ( CLEAR ?auto_6957 ) ( IS-CRATE ?auto_6961 ) ( not ( = ?auto_6957 ?auto_6961 ) ) ( AVAILABLE ?auto_6965 ) ( ON ?auto_6957 ?auto_6960 ) ( not ( = ?auto_6960 ?auto_6957 ) ) ( not ( = ?auto_6960 ?auto_6961 ) ) ( TRUCK-AT ?auto_6962 ?auto_6963 ) ( not ( = ?auto_6963 ?auto_6966 ) ) ( HOIST-AT ?auto_6964 ?auto_6963 ) ( LIFTING ?auto_6964 ?auto_6961 ) ( not ( = ?auto_6965 ?auto_6964 ) ) ( ON ?auto_6959 ?auto_6958 ) ( ON ?auto_6960 ?auto_6959 ) ( not ( = ?auto_6958 ?auto_6959 ) ) ( not ( = ?auto_6958 ?auto_6960 ) ) ( not ( = ?auto_6958 ?auto_6957 ) ) ( not ( = ?auto_6958 ?auto_6961 ) ) ( not ( = ?auto_6959 ?auto_6960 ) ) ( not ( = ?auto_6959 ?auto_6957 ) ) ( not ( = ?auto_6959 ?auto_6961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6960 ?auto_6957 ?auto_6961 )
      ( MAKE-4CRATE-VERIFY ?auto_6958 ?auto_6959 ?auto_6960 ?auto_6957 ?auto_6961 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6996 - SURFACE
      ?auto_6997 - SURFACE
      ?auto_6998 - SURFACE
      ?auto_6995 - SURFACE
      ?auto_6999 - SURFACE
    )
    :vars
    (
      ?auto_7005 - HOIST
      ?auto_7001 - PLACE
      ?auto_7002 - TRUCK
      ?auto_7004 - PLACE
      ?auto_7000 - HOIST
      ?auto_7003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7005 ?auto_7001 ) ( SURFACE-AT ?auto_6995 ?auto_7001 ) ( CLEAR ?auto_6995 ) ( IS-CRATE ?auto_6999 ) ( not ( = ?auto_6995 ?auto_6999 ) ) ( AVAILABLE ?auto_7005 ) ( ON ?auto_6995 ?auto_6998 ) ( not ( = ?auto_6998 ?auto_6995 ) ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( TRUCK-AT ?auto_7002 ?auto_7004 ) ( not ( = ?auto_7004 ?auto_7001 ) ) ( HOIST-AT ?auto_7000 ?auto_7004 ) ( not ( = ?auto_7005 ?auto_7000 ) ) ( AVAILABLE ?auto_7000 ) ( SURFACE-AT ?auto_6999 ?auto_7004 ) ( ON ?auto_6999 ?auto_7003 ) ( CLEAR ?auto_6999 ) ( not ( = ?auto_6995 ?auto_7003 ) ) ( not ( = ?auto_6999 ?auto_7003 ) ) ( not ( = ?auto_6998 ?auto_7003 ) ) ( ON ?auto_6997 ?auto_6996 ) ( ON ?auto_6998 ?auto_6997 ) ( not ( = ?auto_6996 ?auto_6997 ) ) ( not ( = ?auto_6996 ?auto_6998 ) ) ( not ( = ?auto_6996 ?auto_6995 ) ) ( not ( = ?auto_6996 ?auto_6999 ) ) ( not ( = ?auto_6996 ?auto_7003 ) ) ( not ( = ?auto_6997 ?auto_6998 ) ) ( not ( = ?auto_6997 ?auto_6995 ) ) ( not ( = ?auto_6997 ?auto_6999 ) ) ( not ( = ?auto_6997 ?auto_7003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6998 ?auto_6995 ?auto_6999 )
      ( MAKE-4CRATE-VERIFY ?auto_6996 ?auto_6997 ?auto_6998 ?auto_6995 ?auto_6999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7035 - SURFACE
      ?auto_7036 - SURFACE
      ?auto_7037 - SURFACE
      ?auto_7034 - SURFACE
      ?auto_7038 - SURFACE
    )
    :vars
    (
      ?auto_7039 - HOIST
      ?auto_7041 - PLACE
      ?auto_7044 - PLACE
      ?auto_7042 - HOIST
      ?auto_7043 - SURFACE
      ?auto_7040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7039 ?auto_7041 ) ( SURFACE-AT ?auto_7034 ?auto_7041 ) ( CLEAR ?auto_7034 ) ( IS-CRATE ?auto_7038 ) ( not ( = ?auto_7034 ?auto_7038 ) ) ( AVAILABLE ?auto_7039 ) ( ON ?auto_7034 ?auto_7037 ) ( not ( = ?auto_7037 ?auto_7034 ) ) ( not ( = ?auto_7037 ?auto_7038 ) ) ( not ( = ?auto_7044 ?auto_7041 ) ) ( HOIST-AT ?auto_7042 ?auto_7044 ) ( not ( = ?auto_7039 ?auto_7042 ) ) ( AVAILABLE ?auto_7042 ) ( SURFACE-AT ?auto_7038 ?auto_7044 ) ( ON ?auto_7038 ?auto_7043 ) ( CLEAR ?auto_7038 ) ( not ( = ?auto_7034 ?auto_7043 ) ) ( not ( = ?auto_7038 ?auto_7043 ) ) ( not ( = ?auto_7037 ?auto_7043 ) ) ( TRUCK-AT ?auto_7040 ?auto_7041 ) ( ON ?auto_7036 ?auto_7035 ) ( ON ?auto_7037 ?auto_7036 ) ( not ( = ?auto_7035 ?auto_7036 ) ) ( not ( = ?auto_7035 ?auto_7037 ) ) ( not ( = ?auto_7035 ?auto_7034 ) ) ( not ( = ?auto_7035 ?auto_7038 ) ) ( not ( = ?auto_7035 ?auto_7043 ) ) ( not ( = ?auto_7036 ?auto_7037 ) ) ( not ( = ?auto_7036 ?auto_7034 ) ) ( not ( = ?auto_7036 ?auto_7038 ) ) ( not ( = ?auto_7036 ?auto_7043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7037 ?auto_7034 ?auto_7038 )
      ( MAKE-4CRATE-VERIFY ?auto_7035 ?auto_7036 ?auto_7037 ?auto_7034 ?auto_7038 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7074 - SURFACE
      ?auto_7075 - SURFACE
      ?auto_7076 - SURFACE
      ?auto_7073 - SURFACE
      ?auto_7077 - SURFACE
    )
    :vars
    (
      ?auto_7079 - HOIST
      ?auto_7083 - PLACE
      ?auto_7080 - PLACE
      ?auto_7081 - HOIST
      ?auto_7082 - SURFACE
      ?auto_7078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7079 ?auto_7083 ) ( IS-CRATE ?auto_7077 ) ( not ( = ?auto_7073 ?auto_7077 ) ) ( not ( = ?auto_7076 ?auto_7073 ) ) ( not ( = ?auto_7076 ?auto_7077 ) ) ( not ( = ?auto_7080 ?auto_7083 ) ) ( HOIST-AT ?auto_7081 ?auto_7080 ) ( not ( = ?auto_7079 ?auto_7081 ) ) ( AVAILABLE ?auto_7081 ) ( SURFACE-AT ?auto_7077 ?auto_7080 ) ( ON ?auto_7077 ?auto_7082 ) ( CLEAR ?auto_7077 ) ( not ( = ?auto_7073 ?auto_7082 ) ) ( not ( = ?auto_7077 ?auto_7082 ) ) ( not ( = ?auto_7076 ?auto_7082 ) ) ( TRUCK-AT ?auto_7078 ?auto_7083 ) ( SURFACE-AT ?auto_7076 ?auto_7083 ) ( CLEAR ?auto_7076 ) ( LIFTING ?auto_7079 ?auto_7073 ) ( IS-CRATE ?auto_7073 ) ( ON ?auto_7075 ?auto_7074 ) ( ON ?auto_7076 ?auto_7075 ) ( not ( = ?auto_7074 ?auto_7075 ) ) ( not ( = ?auto_7074 ?auto_7076 ) ) ( not ( = ?auto_7074 ?auto_7073 ) ) ( not ( = ?auto_7074 ?auto_7077 ) ) ( not ( = ?auto_7074 ?auto_7082 ) ) ( not ( = ?auto_7075 ?auto_7076 ) ) ( not ( = ?auto_7075 ?auto_7073 ) ) ( not ( = ?auto_7075 ?auto_7077 ) ) ( not ( = ?auto_7075 ?auto_7082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7076 ?auto_7073 ?auto_7077 )
      ( MAKE-4CRATE-VERIFY ?auto_7074 ?auto_7075 ?auto_7076 ?auto_7073 ?auto_7077 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7113 - SURFACE
      ?auto_7114 - SURFACE
      ?auto_7115 - SURFACE
      ?auto_7112 - SURFACE
      ?auto_7116 - SURFACE
    )
    :vars
    (
      ?auto_7117 - HOIST
      ?auto_7121 - PLACE
      ?auto_7120 - PLACE
      ?auto_7122 - HOIST
      ?auto_7118 - SURFACE
      ?auto_7119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7117 ?auto_7121 ) ( IS-CRATE ?auto_7116 ) ( not ( = ?auto_7112 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7112 ) ) ( not ( = ?auto_7115 ?auto_7116 ) ) ( not ( = ?auto_7120 ?auto_7121 ) ) ( HOIST-AT ?auto_7122 ?auto_7120 ) ( not ( = ?auto_7117 ?auto_7122 ) ) ( AVAILABLE ?auto_7122 ) ( SURFACE-AT ?auto_7116 ?auto_7120 ) ( ON ?auto_7116 ?auto_7118 ) ( CLEAR ?auto_7116 ) ( not ( = ?auto_7112 ?auto_7118 ) ) ( not ( = ?auto_7116 ?auto_7118 ) ) ( not ( = ?auto_7115 ?auto_7118 ) ) ( TRUCK-AT ?auto_7119 ?auto_7121 ) ( SURFACE-AT ?auto_7115 ?auto_7121 ) ( CLEAR ?auto_7115 ) ( IS-CRATE ?auto_7112 ) ( AVAILABLE ?auto_7117 ) ( IN ?auto_7112 ?auto_7119 ) ( ON ?auto_7114 ?auto_7113 ) ( ON ?auto_7115 ?auto_7114 ) ( not ( = ?auto_7113 ?auto_7114 ) ) ( not ( = ?auto_7113 ?auto_7115 ) ) ( not ( = ?auto_7113 ?auto_7112 ) ) ( not ( = ?auto_7113 ?auto_7116 ) ) ( not ( = ?auto_7113 ?auto_7118 ) ) ( not ( = ?auto_7114 ?auto_7115 ) ) ( not ( = ?auto_7114 ?auto_7112 ) ) ( not ( = ?auto_7114 ?auto_7116 ) ) ( not ( = ?auto_7114 ?auto_7118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7115 ?auto_7112 ?auto_7116 )
      ( MAKE-4CRATE-VERIFY ?auto_7113 ?auto_7114 ?auto_7115 ?auto_7112 ?auto_7116 ) )
  )

)

