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
      ?auto_65189 - SURFACE
      ?auto_65190 - SURFACE
    )
    :vars
    (
      ?auto_65191 - HOIST
      ?auto_65192 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65191 ?auto_65192 ) ( SURFACE-AT ?auto_65190 ?auto_65192 ) ( CLEAR ?auto_65190 ) ( LIFTING ?auto_65191 ?auto_65189 ) ( IS-CRATE ?auto_65189 ) ( not ( = ?auto_65189 ?auto_65190 ) ) )
    :subtasks
    ( ( !DROP ?auto_65191 ?auto_65189 ?auto_65190 ?auto_65192 )
      ( MAKE-ON-VERIFY ?auto_65189 ?auto_65190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65193 - SURFACE
      ?auto_65194 - SURFACE
    )
    :vars
    (
      ?auto_65196 - HOIST
      ?auto_65195 - PLACE
      ?auto_65197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65196 ?auto_65195 ) ( SURFACE-AT ?auto_65194 ?auto_65195 ) ( CLEAR ?auto_65194 ) ( IS-CRATE ?auto_65193 ) ( not ( = ?auto_65193 ?auto_65194 ) ) ( TRUCK-AT ?auto_65197 ?auto_65195 ) ( AVAILABLE ?auto_65196 ) ( IN ?auto_65193 ?auto_65197 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65196 ?auto_65193 ?auto_65197 ?auto_65195 )
      ( MAKE-ON ?auto_65193 ?auto_65194 )
      ( MAKE-ON-VERIFY ?auto_65193 ?auto_65194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65198 - SURFACE
      ?auto_65199 - SURFACE
    )
    :vars
    (
      ?auto_65200 - HOIST
      ?auto_65202 - PLACE
      ?auto_65201 - TRUCK
      ?auto_65203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65200 ?auto_65202 ) ( SURFACE-AT ?auto_65199 ?auto_65202 ) ( CLEAR ?auto_65199 ) ( IS-CRATE ?auto_65198 ) ( not ( = ?auto_65198 ?auto_65199 ) ) ( AVAILABLE ?auto_65200 ) ( IN ?auto_65198 ?auto_65201 ) ( TRUCK-AT ?auto_65201 ?auto_65203 ) ( not ( = ?auto_65203 ?auto_65202 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65201 ?auto_65203 ?auto_65202 )
      ( MAKE-ON ?auto_65198 ?auto_65199 )
      ( MAKE-ON-VERIFY ?auto_65198 ?auto_65199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65204 - SURFACE
      ?auto_65205 - SURFACE
    )
    :vars
    (
      ?auto_65207 - HOIST
      ?auto_65206 - PLACE
      ?auto_65209 - TRUCK
      ?auto_65208 - PLACE
      ?auto_65210 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65207 ?auto_65206 ) ( SURFACE-AT ?auto_65205 ?auto_65206 ) ( CLEAR ?auto_65205 ) ( IS-CRATE ?auto_65204 ) ( not ( = ?auto_65204 ?auto_65205 ) ) ( AVAILABLE ?auto_65207 ) ( TRUCK-AT ?auto_65209 ?auto_65208 ) ( not ( = ?auto_65208 ?auto_65206 ) ) ( HOIST-AT ?auto_65210 ?auto_65208 ) ( LIFTING ?auto_65210 ?auto_65204 ) ( not ( = ?auto_65207 ?auto_65210 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65210 ?auto_65204 ?auto_65209 ?auto_65208 )
      ( MAKE-ON ?auto_65204 ?auto_65205 )
      ( MAKE-ON-VERIFY ?auto_65204 ?auto_65205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65211 - SURFACE
      ?auto_65212 - SURFACE
    )
    :vars
    (
      ?auto_65214 - HOIST
      ?auto_65217 - PLACE
      ?auto_65215 - TRUCK
      ?auto_65216 - PLACE
      ?auto_65213 - HOIST
      ?auto_65218 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65214 ?auto_65217 ) ( SURFACE-AT ?auto_65212 ?auto_65217 ) ( CLEAR ?auto_65212 ) ( IS-CRATE ?auto_65211 ) ( not ( = ?auto_65211 ?auto_65212 ) ) ( AVAILABLE ?auto_65214 ) ( TRUCK-AT ?auto_65215 ?auto_65216 ) ( not ( = ?auto_65216 ?auto_65217 ) ) ( HOIST-AT ?auto_65213 ?auto_65216 ) ( not ( = ?auto_65214 ?auto_65213 ) ) ( AVAILABLE ?auto_65213 ) ( SURFACE-AT ?auto_65211 ?auto_65216 ) ( ON ?auto_65211 ?auto_65218 ) ( CLEAR ?auto_65211 ) ( not ( = ?auto_65211 ?auto_65218 ) ) ( not ( = ?auto_65212 ?auto_65218 ) ) )
    :subtasks
    ( ( !LIFT ?auto_65213 ?auto_65211 ?auto_65218 ?auto_65216 )
      ( MAKE-ON ?auto_65211 ?auto_65212 )
      ( MAKE-ON-VERIFY ?auto_65211 ?auto_65212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65219 - SURFACE
      ?auto_65220 - SURFACE
    )
    :vars
    (
      ?auto_65223 - HOIST
      ?auto_65225 - PLACE
      ?auto_65226 - PLACE
      ?auto_65221 - HOIST
      ?auto_65222 - SURFACE
      ?auto_65224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65223 ?auto_65225 ) ( SURFACE-AT ?auto_65220 ?auto_65225 ) ( CLEAR ?auto_65220 ) ( IS-CRATE ?auto_65219 ) ( not ( = ?auto_65219 ?auto_65220 ) ) ( AVAILABLE ?auto_65223 ) ( not ( = ?auto_65226 ?auto_65225 ) ) ( HOIST-AT ?auto_65221 ?auto_65226 ) ( not ( = ?auto_65223 ?auto_65221 ) ) ( AVAILABLE ?auto_65221 ) ( SURFACE-AT ?auto_65219 ?auto_65226 ) ( ON ?auto_65219 ?auto_65222 ) ( CLEAR ?auto_65219 ) ( not ( = ?auto_65219 ?auto_65222 ) ) ( not ( = ?auto_65220 ?auto_65222 ) ) ( TRUCK-AT ?auto_65224 ?auto_65225 ) )
    :subtasks
    ( ( !DRIVE ?auto_65224 ?auto_65225 ?auto_65226 )
      ( MAKE-ON ?auto_65219 ?auto_65220 )
      ( MAKE-ON-VERIFY ?auto_65219 ?auto_65220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65267 - SURFACE
      ?auto_65268 - SURFACE
    )
    :vars
    (
      ?auto_65273 - HOIST
      ?auto_65269 - PLACE
      ?auto_65274 - PLACE
      ?auto_65271 - HOIST
      ?auto_65272 - SURFACE
      ?auto_65270 - TRUCK
      ?auto_65275 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65273 ?auto_65269 ) ( IS-CRATE ?auto_65267 ) ( not ( = ?auto_65267 ?auto_65268 ) ) ( not ( = ?auto_65274 ?auto_65269 ) ) ( HOIST-AT ?auto_65271 ?auto_65274 ) ( not ( = ?auto_65273 ?auto_65271 ) ) ( AVAILABLE ?auto_65271 ) ( SURFACE-AT ?auto_65267 ?auto_65274 ) ( ON ?auto_65267 ?auto_65272 ) ( CLEAR ?auto_65267 ) ( not ( = ?auto_65267 ?auto_65272 ) ) ( not ( = ?auto_65268 ?auto_65272 ) ) ( TRUCK-AT ?auto_65270 ?auto_65269 ) ( SURFACE-AT ?auto_65275 ?auto_65269 ) ( CLEAR ?auto_65275 ) ( LIFTING ?auto_65273 ?auto_65268 ) ( IS-CRATE ?auto_65268 ) ( not ( = ?auto_65267 ?auto_65275 ) ) ( not ( = ?auto_65268 ?auto_65275 ) ) ( not ( = ?auto_65272 ?auto_65275 ) ) )
    :subtasks
    ( ( !DROP ?auto_65273 ?auto_65268 ?auto_65275 ?auto_65269 )
      ( MAKE-ON ?auto_65267 ?auto_65268 )
      ( MAKE-ON-VERIFY ?auto_65267 ?auto_65268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65276 - SURFACE
      ?auto_65277 - SURFACE
    )
    :vars
    (
      ?auto_65281 - HOIST
      ?auto_65282 - PLACE
      ?auto_65284 - PLACE
      ?auto_65283 - HOIST
      ?auto_65280 - SURFACE
      ?auto_65278 - TRUCK
      ?auto_65279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65281 ?auto_65282 ) ( IS-CRATE ?auto_65276 ) ( not ( = ?auto_65276 ?auto_65277 ) ) ( not ( = ?auto_65284 ?auto_65282 ) ) ( HOIST-AT ?auto_65283 ?auto_65284 ) ( not ( = ?auto_65281 ?auto_65283 ) ) ( AVAILABLE ?auto_65283 ) ( SURFACE-AT ?auto_65276 ?auto_65284 ) ( ON ?auto_65276 ?auto_65280 ) ( CLEAR ?auto_65276 ) ( not ( = ?auto_65276 ?auto_65280 ) ) ( not ( = ?auto_65277 ?auto_65280 ) ) ( TRUCK-AT ?auto_65278 ?auto_65282 ) ( SURFACE-AT ?auto_65279 ?auto_65282 ) ( CLEAR ?auto_65279 ) ( IS-CRATE ?auto_65277 ) ( not ( = ?auto_65276 ?auto_65279 ) ) ( not ( = ?auto_65277 ?auto_65279 ) ) ( not ( = ?auto_65280 ?auto_65279 ) ) ( AVAILABLE ?auto_65281 ) ( IN ?auto_65277 ?auto_65278 ) )
    :subtasks
    ( ( !UNLOAD ?auto_65281 ?auto_65277 ?auto_65278 ?auto_65282 )
      ( MAKE-ON ?auto_65276 ?auto_65277 )
      ( MAKE-ON-VERIFY ?auto_65276 ?auto_65277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65291 - SURFACE
      ?auto_65292 - SURFACE
    )
    :vars
    (
      ?auto_65294 - HOIST
      ?auto_65296 - PLACE
      ?auto_65298 - PLACE
      ?auto_65293 - HOIST
      ?auto_65297 - SURFACE
      ?auto_65295 - TRUCK
      ?auto_65299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65294 ?auto_65296 ) ( SURFACE-AT ?auto_65292 ?auto_65296 ) ( CLEAR ?auto_65292 ) ( IS-CRATE ?auto_65291 ) ( not ( = ?auto_65291 ?auto_65292 ) ) ( AVAILABLE ?auto_65294 ) ( not ( = ?auto_65298 ?auto_65296 ) ) ( HOIST-AT ?auto_65293 ?auto_65298 ) ( not ( = ?auto_65294 ?auto_65293 ) ) ( AVAILABLE ?auto_65293 ) ( SURFACE-AT ?auto_65291 ?auto_65298 ) ( ON ?auto_65291 ?auto_65297 ) ( CLEAR ?auto_65291 ) ( not ( = ?auto_65291 ?auto_65297 ) ) ( not ( = ?auto_65292 ?auto_65297 ) ) ( TRUCK-AT ?auto_65295 ?auto_65299 ) ( not ( = ?auto_65299 ?auto_65296 ) ) ( not ( = ?auto_65298 ?auto_65299 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_65295 ?auto_65299 ?auto_65296 )
      ( MAKE-ON ?auto_65291 ?auto_65292 )
      ( MAKE-ON-VERIFY ?auto_65291 ?auto_65292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65815 - SURFACE
      ?auto_65816 - SURFACE
    )
    :vars
    (
      ?auto_65820 - HOIST
      ?auto_65821 - PLACE
      ?auto_65818 - TRUCK
      ?auto_65819 - PLACE
      ?auto_65822 - HOIST
      ?auto_65817 - SURFACE
      ?auto_65823 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65820 ?auto_65821 ) ( SURFACE-AT ?auto_65816 ?auto_65821 ) ( CLEAR ?auto_65816 ) ( IS-CRATE ?auto_65815 ) ( not ( = ?auto_65815 ?auto_65816 ) ) ( AVAILABLE ?auto_65820 ) ( TRUCK-AT ?auto_65818 ?auto_65819 ) ( not ( = ?auto_65819 ?auto_65821 ) ) ( HOIST-AT ?auto_65822 ?auto_65819 ) ( not ( = ?auto_65820 ?auto_65822 ) ) ( SURFACE-AT ?auto_65815 ?auto_65819 ) ( ON ?auto_65815 ?auto_65817 ) ( CLEAR ?auto_65815 ) ( not ( = ?auto_65815 ?auto_65817 ) ) ( not ( = ?auto_65816 ?auto_65817 ) ) ( LIFTING ?auto_65822 ?auto_65823 ) ( IS-CRATE ?auto_65823 ) ( not ( = ?auto_65815 ?auto_65823 ) ) ( not ( = ?auto_65816 ?auto_65823 ) ) ( not ( = ?auto_65817 ?auto_65823 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65822 ?auto_65823 ?auto_65818 ?auto_65819 )
      ( MAKE-ON ?auto_65815 ?auto_65816 )
      ( MAKE-ON-VERIFY ?auto_65815 ?auto_65816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_65967 - SURFACE
      ?auto_65968 - SURFACE
    )
    :vars
    (
      ?auto_65969 - HOIST
      ?auto_65972 - PLACE
      ?auto_65970 - PLACE
      ?auto_65974 - HOIST
      ?auto_65973 - SURFACE
      ?auto_65971 - TRUCK
      ?auto_65975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65969 ?auto_65972 ) ( SURFACE-AT ?auto_65968 ?auto_65972 ) ( CLEAR ?auto_65968 ) ( IS-CRATE ?auto_65967 ) ( not ( = ?auto_65967 ?auto_65968 ) ) ( not ( = ?auto_65970 ?auto_65972 ) ) ( HOIST-AT ?auto_65974 ?auto_65970 ) ( not ( = ?auto_65969 ?auto_65974 ) ) ( AVAILABLE ?auto_65974 ) ( SURFACE-AT ?auto_65967 ?auto_65970 ) ( ON ?auto_65967 ?auto_65973 ) ( CLEAR ?auto_65967 ) ( not ( = ?auto_65967 ?auto_65973 ) ) ( not ( = ?auto_65968 ?auto_65973 ) ) ( TRUCK-AT ?auto_65971 ?auto_65972 ) ( LIFTING ?auto_65969 ?auto_65975 ) ( IS-CRATE ?auto_65975 ) ( not ( = ?auto_65967 ?auto_65975 ) ) ( not ( = ?auto_65968 ?auto_65975 ) ) ( not ( = ?auto_65973 ?auto_65975 ) ) )
    :subtasks
    ( ( !LOAD ?auto_65969 ?auto_65975 ?auto_65971 ?auto_65972 )
      ( MAKE-ON ?auto_65967 ?auto_65968 )
      ( MAKE-ON-VERIFY ?auto_65967 ?auto_65968 ) )
  )

)

