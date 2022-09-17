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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8134 - SURFACE
      ?auto_8135 - SURFACE
    )
    :vars
    (
      ?auto_8136 - HOIST
      ?auto_8137 - PLACE
      ?auto_8139 - PLACE
      ?auto_8140 - HOIST
      ?auto_8141 - SURFACE
      ?auto_8138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8136 ?auto_8137 ) ( SURFACE-AT ?auto_8134 ?auto_8137 ) ( CLEAR ?auto_8134 ) ( IS-CRATE ?auto_8135 ) ( AVAILABLE ?auto_8136 ) ( not ( = ?auto_8139 ?auto_8137 ) ) ( HOIST-AT ?auto_8140 ?auto_8139 ) ( AVAILABLE ?auto_8140 ) ( SURFACE-AT ?auto_8135 ?auto_8139 ) ( ON ?auto_8135 ?auto_8141 ) ( CLEAR ?auto_8135 ) ( TRUCK-AT ?auto_8138 ?auto_8137 ) ( not ( = ?auto_8134 ?auto_8135 ) ) ( not ( = ?auto_8134 ?auto_8141 ) ) ( not ( = ?auto_8135 ?auto_8141 ) ) ( not ( = ?auto_8136 ?auto_8140 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8138 ?auto_8137 ?auto_8139 )
      ( !LIFT ?auto_8140 ?auto_8135 ?auto_8141 ?auto_8139 )
      ( !LOAD ?auto_8140 ?auto_8135 ?auto_8138 ?auto_8139 )
      ( !DRIVE ?auto_8138 ?auto_8139 ?auto_8137 )
      ( !UNLOAD ?auto_8136 ?auto_8135 ?auto_8138 ?auto_8137 )
      ( !DROP ?auto_8136 ?auto_8135 ?auto_8134 ?auto_8137 )
      ( MAKE-1CRATE-VERIFY ?auto_8134 ?auto_8135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8155 - SURFACE
      ?auto_8156 - SURFACE
      ?auto_8157 - SURFACE
    )
    :vars
    (
      ?auto_8163 - HOIST
      ?auto_8161 - PLACE
      ?auto_8162 - PLACE
      ?auto_8160 - HOIST
      ?auto_8158 - SURFACE
      ?auto_8166 - PLACE
      ?auto_8164 - HOIST
      ?auto_8165 - SURFACE
      ?auto_8159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8163 ?auto_8161 ) ( IS-CRATE ?auto_8157 ) ( not ( = ?auto_8162 ?auto_8161 ) ) ( HOIST-AT ?auto_8160 ?auto_8162 ) ( AVAILABLE ?auto_8160 ) ( SURFACE-AT ?auto_8157 ?auto_8162 ) ( ON ?auto_8157 ?auto_8158 ) ( CLEAR ?auto_8157 ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( not ( = ?auto_8156 ?auto_8158 ) ) ( not ( = ?auto_8157 ?auto_8158 ) ) ( not ( = ?auto_8163 ?auto_8160 ) ) ( SURFACE-AT ?auto_8155 ?auto_8161 ) ( CLEAR ?auto_8155 ) ( IS-CRATE ?auto_8156 ) ( AVAILABLE ?auto_8163 ) ( not ( = ?auto_8166 ?auto_8161 ) ) ( HOIST-AT ?auto_8164 ?auto_8166 ) ( AVAILABLE ?auto_8164 ) ( SURFACE-AT ?auto_8156 ?auto_8166 ) ( ON ?auto_8156 ?auto_8165 ) ( CLEAR ?auto_8156 ) ( TRUCK-AT ?auto_8159 ?auto_8161 ) ( not ( = ?auto_8155 ?auto_8156 ) ) ( not ( = ?auto_8155 ?auto_8165 ) ) ( not ( = ?auto_8156 ?auto_8165 ) ) ( not ( = ?auto_8163 ?auto_8164 ) ) ( not ( = ?auto_8155 ?auto_8157 ) ) ( not ( = ?auto_8155 ?auto_8158 ) ) ( not ( = ?auto_8157 ?auto_8165 ) ) ( not ( = ?auto_8162 ?auto_8166 ) ) ( not ( = ?auto_8160 ?auto_8164 ) ) ( not ( = ?auto_8158 ?auto_8165 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8155 ?auto_8156 )
      ( MAKE-1CRATE ?auto_8156 ?auto_8157 )
      ( MAKE-2CRATE-VERIFY ?auto_8155 ?auto_8156 ?auto_8157 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8181 - SURFACE
      ?auto_8182 - SURFACE
      ?auto_8183 - SURFACE
      ?auto_8184 - SURFACE
    )
    :vars
    (
      ?auto_8190 - HOIST
      ?auto_8189 - PLACE
      ?auto_8185 - PLACE
      ?auto_8187 - HOIST
      ?auto_8188 - SURFACE
      ?auto_8192 - PLACE
      ?auto_8191 - HOIST
      ?auto_8196 - SURFACE
      ?auto_8195 - PLACE
      ?auto_8194 - HOIST
      ?auto_8193 - SURFACE
      ?auto_8186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8190 ?auto_8189 ) ( IS-CRATE ?auto_8184 ) ( not ( = ?auto_8185 ?auto_8189 ) ) ( HOIST-AT ?auto_8187 ?auto_8185 ) ( AVAILABLE ?auto_8187 ) ( SURFACE-AT ?auto_8184 ?auto_8185 ) ( ON ?auto_8184 ?auto_8188 ) ( CLEAR ?auto_8184 ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( not ( = ?auto_8183 ?auto_8188 ) ) ( not ( = ?auto_8184 ?auto_8188 ) ) ( not ( = ?auto_8190 ?auto_8187 ) ) ( IS-CRATE ?auto_8183 ) ( not ( = ?auto_8192 ?auto_8189 ) ) ( HOIST-AT ?auto_8191 ?auto_8192 ) ( AVAILABLE ?auto_8191 ) ( SURFACE-AT ?auto_8183 ?auto_8192 ) ( ON ?auto_8183 ?auto_8196 ) ( CLEAR ?auto_8183 ) ( not ( = ?auto_8182 ?auto_8183 ) ) ( not ( = ?auto_8182 ?auto_8196 ) ) ( not ( = ?auto_8183 ?auto_8196 ) ) ( not ( = ?auto_8190 ?auto_8191 ) ) ( SURFACE-AT ?auto_8181 ?auto_8189 ) ( CLEAR ?auto_8181 ) ( IS-CRATE ?auto_8182 ) ( AVAILABLE ?auto_8190 ) ( not ( = ?auto_8195 ?auto_8189 ) ) ( HOIST-AT ?auto_8194 ?auto_8195 ) ( AVAILABLE ?auto_8194 ) ( SURFACE-AT ?auto_8182 ?auto_8195 ) ( ON ?auto_8182 ?auto_8193 ) ( CLEAR ?auto_8182 ) ( TRUCK-AT ?auto_8186 ?auto_8189 ) ( not ( = ?auto_8181 ?auto_8182 ) ) ( not ( = ?auto_8181 ?auto_8193 ) ) ( not ( = ?auto_8182 ?auto_8193 ) ) ( not ( = ?auto_8190 ?auto_8194 ) ) ( not ( = ?auto_8181 ?auto_8183 ) ) ( not ( = ?auto_8181 ?auto_8196 ) ) ( not ( = ?auto_8183 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8195 ) ) ( not ( = ?auto_8191 ?auto_8194 ) ) ( not ( = ?auto_8196 ?auto_8193 ) ) ( not ( = ?auto_8181 ?auto_8184 ) ) ( not ( = ?auto_8181 ?auto_8188 ) ) ( not ( = ?auto_8182 ?auto_8184 ) ) ( not ( = ?auto_8182 ?auto_8188 ) ) ( not ( = ?auto_8184 ?auto_8196 ) ) ( not ( = ?auto_8184 ?auto_8193 ) ) ( not ( = ?auto_8185 ?auto_8192 ) ) ( not ( = ?auto_8185 ?auto_8195 ) ) ( not ( = ?auto_8187 ?auto_8191 ) ) ( not ( = ?auto_8187 ?auto_8194 ) ) ( not ( = ?auto_8188 ?auto_8196 ) ) ( not ( = ?auto_8188 ?auto_8193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8181 ?auto_8182 ?auto_8183 )
      ( MAKE-1CRATE ?auto_8183 ?auto_8184 )
      ( MAKE-3CRATE-VERIFY ?auto_8181 ?auto_8182 ?auto_8183 ?auto_8184 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8212 - SURFACE
      ?auto_8213 - SURFACE
      ?auto_8214 - SURFACE
      ?auto_8215 - SURFACE
      ?auto_8216 - SURFACE
    )
    :vars
    (
      ?auto_8220 - HOIST
      ?auto_8221 - PLACE
      ?auto_8217 - PLACE
      ?auto_8222 - HOIST
      ?auto_8219 - SURFACE
      ?auto_8226 - PLACE
      ?auto_8223 - HOIST
      ?auto_8229 - SURFACE
      ?auto_8224 - PLACE
      ?auto_8225 - HOIST
      ?auto_8227 - SURFACE
      ?auto_8228 - SURFACE
      ?auto_8218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8220 ?auto_8221 ) ( IS-CRATE ?auto_8216 ) ( not ( = ?auto_8217 ?auto_8221 ) ) ( HOIST-AT ?auto_8222 ?auto_8217 ) ( SURFACE-AT ?auto_8216 ?auto_8217 ) ( ON ?auto_8216 ?auto_8219 ) ( CLEAR ?auto_8216 ) ( not ( = ?auto_8215 ?auto_8216 ) ) ( not ( = ?auto_8215 ?auto_8219 ) ) ( not ( = ?auto_8216 ?auto_8219 ) ) ( not ( = ?auto_8220 ?auto_8222 ) ) ( IS-CRATE ?auto_8215 ) ( not ( = ?auto_8226 ?auto_8221 ) ) ( HOIST-AT ?auto_8223 ?auto_8226 ) ( AVAILABLE ?auto_8223 ) ( SURFACE-AT ?auto_8215 ?auto_8226 ) ( ON ?auto_8215 ?auto_8229 ) ( CLEAR ?auto_8215 ) ( not ( = ?auto_8214 ?auto_8215 ) ) ( not ( = ?auto_8214 ?auto_8229 ) ) ( not ( = ?auto_8215 ?auto_8229 ) ) ( not ( = ?auto_8220 ?auto_8223 ) ) ( IS-CRATE ?auto_8214 ) ( not ( = ?auto_8224 ?auto_8221 ) ) ( HOIST-AT ?auto_8225 ?auto_8224 ) ( AVAILABLE ?auto_8225 ) ( SURFACE-AT ?auto_8214 ?auto_8224 ) ( ON ?auto_8214 ?auto_8227 ) ( CLEAR ?auto_8214 ) ( not ( = ?auto_8213 ?auto_8214 ) ) ( not ( = ?auto_8213 ?auto_8227 ) ) ( not ( = ?auto_8214 ?auto_8227 ) ) ( not ( = ?auto_8220 ?auto_8225 ) ) ( SURFACE-AT ?auto_8212 ?auto_8221 ) ( CLEAR ?auto_8212 ) ( IS-CRATE ?auto_8213 ) ( AVAILABLE ?auto_8220 ) ( AVAILABLE ?auto_8222 ) ( SURFACE-AT ?auto_8213 ?auto_8217 ) ( ON ?auto_8213 ?auto_8228 ) ( CLEAR ?auto_8213 ) ( TRUCK-AT ?auto_8218 ?auto_8221 ) ( not ( = ?auto_8212 ?auto_8213 ) ) ( not ( = ?auto_8212 ?auto_8228 ) ) ( not ( = ?auto_8213 ?auto_8228 ) ) ( not ( = ?auto_8212 ?auto_8214 ) ) ( not ( = ?auto_8212 ?auto_8227 ) ) ( not ( = ?auto_8214 ?auto_8228 ) ) ( not ( = ?auto_8224 ?auto_8217 ) ) ( not ( = ?auto_8225 ?auto_8222 ) ) ( not ( = ?auto_8227 ?auto_8228 ) ) ( not ( = ?auto_8212 ?auto_8215 ) ) ( not ( = ?auto_8212 ?auto_8229 ) ) ( not ( = ?auto_8213 ?auto_8215 ) ) ( not ( = ?auto_8213 ?auto_8229 ) ) ( not ( = ?auto_8215 ?auto_8227 ) ) ( not ( = ?auto_8215 ?auto_8228 ) ) ( not ( = ?auto_8226 ?auto_8224 ) ) ( not ( = ?auto_8226 ?auto_8217 ) ) ( not ( = ?auto_8223 ?auto_8225 ) ) ( not ( = ?auto_8223 ?auto_8222 ) ) ( not ( = ?auto_8229 ?auto_8227 ) ) ( not ( = ?auto_8229 ?auto_8228 ) ) ( not ( = ?auto_8212 ?auto_8216 ) ) ( not ( = ?auto_8212 ?auto_8219 ) ) ( not ( = ?auto_8213 ?auto_8216 ) ) ( not ( = ?auto_8213 ?auto_8219 ) ) ( not ( = ?auto_8214 ?auto_8216 ) ) ( not ( = ?auto_8214 ?auto_8219 ) ) ( not ( = ?auto_8216 ?auto_8229 ) ) ( not ( = ?auto_8216 ?auto_8227 ) ) ( not ( = ?auto_8216 ?auto_8228 ) ) ( not ( = ?auto_8219 ?auto_8229 ) ) ( not ( = ?auto_8219 ?auto_8227 ) ) ( not ( = ?auto_8219 ?auto_8228 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8212 ?auto_8213 ?auto_8214 ?auto_8215 )
      ( MAKE-1CRATE ?auto_8215 ?auto_8216 )
      ( MAKE-4CRATE-VERIFY ?auto_8212 ?auto_8213 ?auto_8214 ?auto_8215 ?auto_8216 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8246 - SURFACE
      ?auto_8247 - SURFACE
      ?auto_8248 - SURFACE
      ?auto_8249 - SURFACE
      ?auto_8250 - SURFACE
      ?auto_8251 - SURFACE
    )
    :vars
    (
      ?auto_8256 - HOIST
      ?auto_8257 - PLACE
      ?auto_8254 - PLACE
      ?auto_8253 - HOIST
      ?auto_8252 - SURFACE
      ?auto_8264 - PLACE
      ?auto_8263 - HOIST
      ?auto_8260 - SURFACE
      ?auto_8258 - PLACE
      ?auto_8262 - HOIST
      ?auto_8261 - SURFACE
      ?auto_8267 - PLACE
      ?auto_8265 - HOIST
      ?auto_8259 - SURFACE
      ?auto_8266 - SURFACE
      ?auto_8255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8256 ?auto_8257 ) ( IS-CRATE ?auto_8251 ) ( not ( = ?auto_8254 ?auto_8257 ) ) ( HOIST-AT ?auto_8253 ?auto_8254 ) ( AVAILABLE ?auto_8253 ) ( SURFACE-AT ?auto_8251 ?auto_8254 ) ( ON ?auto_8251 ?auto_8252 ) ( CLEAR ?auto_8251 ) ( not ( = ?auto_8250 ?auto_8251 ) ) ( not ( = ?auto_8250 ?auto_8252 ) ) ( not ( = ?auto_8251 ?auto_8252 ) ) ( not ( = ?auto_8256 ?auto_8253 ) ) ( IS-CRATE ?auto_8250 ) ( not ( = ?auto_8264 ?auto_8257 ) ) ( HOIST-AT ?auto_8263 ?auto_8264 ) ( SURFACE-AT ?auto_8250 ?auto_8264 ) ( ON ?auto_8250 ?auto_8260 ) ( CLEAR ?auto_8250 ) ( not ( = ?auto_8249 ?auto_8250 ) ) ( not ( = ?auto_8249 ?auto_8260 ) ) ( not ( = ?auto_8250 ?auto_8260 ) ) ( not ( = ?auto_8256 ?auto_8263 ) ) ( IS-CRATE ?auto_8249 ) ( not ( = ?auto_8258 ?auto_8257 ) ) ( HOIST-AT ?auto_8262 ?auto_8258 ) ( AVAILABLE ?auto_8262 ) ( SURFACE-AT ?auto_8249 ?auto_8258 ) ( ON ?auto_8249 ?auto_8261 ) ( CLEAR ?auto_8249 ) ( not ( = ?auto_8248 ?auto_8249 ) ) ( not ( = ?auto_8248 ?auto_8261 ) ) ( not ( = ?auto_8249 ?auto_8261 ) ) ( not ( = ?auto_8256 ?auto_8262 ) ) ( IS-CRATE ?auto_8248 ) ( not ( = ?auto_8267 ?auto_8257 ) ) ( HOIST-AT ?auto_8265 ?auto_8267 ) ( AVAILABLE ?auto_8265 ) ( SURFACE-AT ?auto_8248 ?auto_8267 ) ( ON ?auto_8248 ?auto_8259 ) ( CLEAR ?auto_8248 ) ( not ( = ?auto_8247 ?auto_8248 ) ) ( not ( = ?auto_8247 ?auto_8259 ) ) ( not ( = ?auto_8248 ?auto_8259 ) ) ( not ( = ?auto_8256 ?auto_8265 ) ) ( SURFACE-AT ?auto_8246 ?auto_8257 ) ( CLEAR ?auto_8246 ) ( IS-CRATE ?auto_8247 ) ( AVAILABLE ?auto_8256 ) ( AVAILABLE ?auto_8263 ) ( SURFACE-AT ?auto_8247 ?auto_8264 ) ( ON ?auto_8247 ?auto_8266 ) ( CLEAR ?auto_8247 ) ( TRUCK-AT ?auto_8255 ?auto_8257 ) ( not ( = ?auto_8246 ?auto_8247 ) ) ( not ( = ?auto_8246 ?auto_8266 ) ) ( not ( = ?auto_8247 ?auto_8266 ) ) ( not ( = ?auto_8246 ?auto_8248 ) ) ( not ( = ?auto_8246 ?auto_8259 ) ) ( not ( = ?auto_8248 ?auto_8266 ) ) ( not ( = ?auto_8267 ?auto_8264 ) ) ( not ( = ?auto_8265 ?auto_8263 ) ) ( not ( = ?auto_8259 ?auto_8266 ) ) ( not ( = ?auto_8246 ?auto_8249 ) ) ( not ( = ?auto_8246 ?auto_8261 ) ) ( not ( = ?auto_8247 ?auto_8249 ) ) ( not ( = ?auto_8247 ?auto_8261 ) ) ( not ( = ?auto_8249 ?auto_8259 ) ) ( not ( = ?auto_8249 ?auto_8266 ) ) ( not ( = ?auto_8258 ?auto_8267 ) ) ( not ( = ?auto_8258 ?auto_8264 ) ) ( not ( = ?auto_8262 ?auto_8265 ) ) ( not ( = ?auto_8262 ?auto_8263 ) ) ( not ( = ?auto_8261 ?auto_8259 ) ) ( not ( = ?auto_8261 ?auto_8266 ) ) ( not ( = ?auto_8246 ?auto_8250 ) ) ( not ( = ?auto_8246 ?auto_8260 ) ) ( not ( = ?auto_8247 ?auto_8250 ) ) ( not ( = ?auto_8247 ?auto_8260 ) ) ( not ( = ?auto_8248 ?auto_8250 ) ) ( not ( = ?auto_8248 ?auto_8260 ) ) ( not ( = ?auto_8250 ?auto_8261 ) ) ( not ( = ?auto_8250 ?auto_8259 ) ) ( not ( = ?auto_8250 ?auto_8266 ) ) ( not ( = ?auto_8260 ?auto_8261 ) ) ( not ( = ?auto_8260 ?auto_8259 ) ) ( not ( = ?auto_8260 ?auto_8266 ) ) ( not ( = ?auto_8246 ?auto_8251 ) ) ( not ( = ?auto_8246 ?auto_8252 ) ) ( not ( = ?auto_8247 ?auto_8251 ) ) ( not ( = ?auto_8247 ?auto_8252 ) ) ( not ( = ?auto_8248 ?auto_8251 ) ) ( not ( = ?auto_8248 ?auto_8252 ) ) ( not ( = ?auto_8249 ?auto_8251 ) ) ( not ( = ?auto_8249 ?auto_8252 ) ) ( not ( = ?auto_8251 ?auto_8260 ) ) ( not ( = ?auto_8251 ?auto_8261 ) ) ( not ( = ?auto_8251 ?auto_8259 ) ) ( not ( = ?auto_8251 ?auto_8266 ) ) ( not ( = ?auto_8254 ?auto_8264 ) ) ( not ( = ?auto_8254 ?auto_8258 ) ) ( not ( = ?auto_8254 ?auto_8267 ) ) ( not ( = ?auto_8253 ?auto_8263 ) ) ( not ( = ?auto_8253 ?auto_8262 ) ) ( not ( = ?auto_8253 ?auto_8265 ) ) ( not ( = ?auto_8252 ?auto_8260 ) ) ( not ( = ?auto_8252 ?auto_8261 ) ) ( not ( = ?auto_8252 ?auto_8259 ) ) ( not ( = ?auto_8252 ?auto_8266 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8246 ?auto_8247 ?auto_8248 ?auto_8249 ?auto_8250 )
      ( MAKE-1CRATE ?auto_8250 ?auto_8251 )
      ( MAKE-5CRATE-VERIFY ?auto_8246 ?auto_8247 ?auto_8248 ?auto_8249 ?auto_8250 ?auto_8251 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8285 - SURFACE
      ?auto_8286 - SURFACE
      ?auto_8287 - SURFACE
      ?auto_8288 - SURFACE
      ?auto_8289 - SURFACE
      ?auto_8290 - SURFACE
      ?auto_8291 - SURFACE
    )
    :vars
    (
      ?auto_8293 - HOIST
      ?auto_8296 - PLACE
      ?auto_8292 - PLACE
      ?auto_8297 - HOIST
      ?auto_8294 - SURFACE
      ?auto_8302 - PLACE
      ?auto_8308 - HOIST
      ?auto_8303 - SURFACE
      ?auto_8300 - PLACE
      ?auto_8299 - HOIST
      ?auto_8305 - SURFACE
      ?auto_8304 - PLACE
      ?auto_8301 - HOIST
      ?auto_8310 - SURFACE
      ?auto_8306 - PLACE
      ?auto_8307 - HOIST
      ?auto_8309 - SURFACE
      ?auto_8298 - SURFACE
      ?auto_8295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8293 ?auto_8296 ) ( IS-CRATE ?auto_8291 ) ( not ( = ?auto_8292 ?auto_8296 ) ) ( HOIST-AT ?auto_8297 ?auto_8292 ) ( AVAILABLE ?auto_8297 ) ( SURFACE-AT ?auto_8291 ?auto_8292 ) ( ON ?auto_8291 ?auto_8294 ) ( CLEAR ?auto_8291 ) ( not ( = ?auto_8290 ?auto_8291 ) ) ( not ( = ?auto_8290 ?auto_8294 ) ) ( not ( = ?auto_8291 ?auto_8294 ) ) ( not ( = ?auto_8293 ?auto_8297 ) ) ( IS-CRATE ?auto_8290 ) ( not ( = ?auto_8302 ?auto_8296 ) ) ( HOIST-AT ?auto_8308 ?auto_8302 ) ( AVAILABLE ?auto_8308 ) ( SURFACE-AT ?auto_8290 ?auto_8302 ) ( ON ?auto_8290 ?auto_8303 ) ( CLEAR ?auto_8290 ) ( not ( = ?auto_8289 ?auto_8290 ) ) ( not ( = ?auto_8289 ?auto_8303 ) ) ( not ( = ?auto_8290 ?auto_8303 ) ) ( not ( = ?auto_8293 ?auto_8308 ) ) ( IS-CRATE ?auto_8289 ) ( not ( = ?auto_8300 ?auto_8296 ) ) ( HOIST-AT ?auto_8299 ?auto_8300 ) ( SURFACE-AT ?auto_8289 ?auto_8300 ) ( ON ?auto_8289 ?auto_8305 ) ( CLEAR ?auto_8289 ) ( not ( = ?auto_8288 ?auto_8289 ) ) ( not ( = ?auto_8288 ?auto_8305 ) ) ( not ( = ?auto_8289 ?auto_8305 ) ) ( not ( = ?auto_8293 ?auto_8299 ) ) ( IS-CRATE ?auto_8288 ) ( not ( = ?auto_8304 ?auto_8296 ) ) ( HOIST-AT ?auto_8301 ?auto_8304 ) ( AVAILABLE ?auto_8301 ) ( SURFACE-AT ?auto_8288 ?auto_8304 ) ( ON ?auto_8288 ?auto_8310 ) ( CLEAR ?auto_8288 ) ( not ( = ?auto_8287 ?auto_8288 ) ) ( not ( = ?auto_8287 ?auto_8310 ) ) ( not ( = ?auto_8288 ?auto_8310 ) ) ( not ( = ?auto_8293 ?auto_8301 ) ) ( IS-CRATE ?auto_8287 ) ( not ( = ?auto_8306 ?auto_8296 ) ) ( HOIST-AT ?auto_8307 ?auto_8306 ) ( AVAILABLE ?auto_8307 ) ( SURFACE-AT ?auto_8287 ?auto_8306 ) ( ON ?auto_8287 ?auto_8309 ) ( CLEAR ?auto_8287 ) ( not ( = ?auto_8286 ?auto_8287 ) ) ( not ( = ?auto_8286 ?auto_8309 ) ) ( not ( = ?auto_8287 ?auto_8309 ) ) ( not ( = ?auto_8293 ?auto_8307 ) ) ( SURFACE-AT ?auto_8285 ?auto_8296 ) ( CLEAR ?auto_8285 ) ( IS-CRATE ?auto_8286 ) ( AVAILABLE ?auto_8293 ) ( AVAILABLE ?auto_8299 ) ( SURFACE-AT ?auto_8286 ?auto_8300 ) ( ON ?auto_8286 ?auto_8298 ) ( CLEAR ?auto_8286 ) ( TRUCK-AT ?auto_8295 ?auto_8296 ) ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8285 ?auto_8298 ) ) ( not ( = ?auto_8286 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8287 ) ) ( not ( = ?auto_8285 ?auto_8309 ) ) ( not ( = ?auto_8287 ?auto_8298 ) ) ( not ( = ?auto_8306 ?auto_8300 ) ) ( not ( = ?auto_8307 ?auto_8299 ) ) ( not ( = ?auto_8309 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8288 ) ) ( not ( = ?auto_8285 ?auto_8310 ) ) ( not ( = ?auto_8286 ?auto_8288 ) ) ( not ( = ?auto_8286 ?auto_8310 ) ) ( not ( = ?auto_8288 ?auto_8309 ) ) ( not ( = ?auto_8288 ?auto_8298 ) ) ( not ( = ?auto_8304 ?auto_8306 ) ) ( not ( = ?auto_8304 ?auto_8300 ) ) ( not ( = ?auto_8301 ?auto_8307 ) ) ( not ( = ?auto_8301 ?auto_8299 ) ) ( not ( = ?auto_8310 ?auto_8309 ) ) ( not ( = ?auto_8310 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8289 ) ) ( not ( = ?auto_8285 ?auto_8305 ) ) ( not ( = ?auto_8286 ?auto_8289 ) ) ( not ( = ?auto_8286 ?auto_8305 ) ) ( not ( = ?auto_8287 ?auto_8289 ) ) ( not ( = ?auto_8287 ?auto_8305 ) ) ( not ( = ?auto_8289 ?auto_8310 ) ) ( not ( = ?auto_8289 ?auto_8309 ) ) ( not ( = ?auto_8289 ?auto_8298 ) ) ( not ( = ?auto_8305 ?auto_8310 ) ) ( not ( = ?auto_8305 ?auto_8309 ) ) ( not ( = ?auto_8305 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8290 ) ) ( not ( = ?auto_8285 ?auto_8303 ) ) ( not ( = ?auto_8286 ?auto_8290 ) ) ( not ( = ?auto_8286 ?auto_8303 ) ) ( not ( = ?auto_8287 ?auto_8290 ) ) ( not ( = ?auto_8287 ?auto_8303 ) ) ( not ( = ?auto_8288 ?auto_8290 ) ) ( not ( = ?auto_8288 ?auto_8303 ) ) ( not ( = ?auto_8290 ?auto_8305 ) ) ( not ( = ?auto_8290 ?auto_8310 ) ) ( not ( = ?auto_8290 ?auto_8309 ) ) ( not ( = ?auto_8290 ?auto_8298 ) ) ( not ( = ?auto_8302 ?auto_8300 ) ) ( not ( = ?auto_8302 ?auto_8304 ) ) ( not ( = ?auto_8302 ?auto_8306 ) ) ( not ( = ?auto_8308 ?auto_8299 ) ) ( not ( = ?auto_8308 ?auto_8301 ) ) ( not ( = ?auto_8308 ?auto_8307 ) ) ( not ( = ?auto_8303 ?auto_8305 ) ) ( not ( = ?auto_8303 ?auto_8310 ) ) ( not ( = ?auto_8303 ?auto_8309 ) ) ( not ( = ?auto_8303 ?auto_8298 ) ) ( not ( = ?auto_8285 ?auto_8291 ) ) ( not ( = ?auto_8285 ?auto_8294 ) ) ( not ( = ?auto_8286 ?auto_8291 ) ) ( not ( = ?auto_8286 ?auto_8294 ) ) ( not ( = ?auto_8287 ?auto_8291 ) ) ( not ( = ?auto_8287 ?auto_8294 ) ) ( not ( = ?auto_8288 ?auto_8291 ) ) ( not ( = ?auto_8288 ?auto_8294 ) ) ( not ( = ?auto_8289 ?auto_8291 ) ) ( not ( = ?auto_8289 ?auto_8294 ) ) ( not ( = ?auto_8291 ?auto_8303 ) ) ( not ( = ?auto_8291 ?auto_8305 ) ) ( not ( = ?auto_8291 ?auto_8310 ) ) ( not ( = ?auto_8291 ?auto_8309 ) ) ( not ( = ?auto_8291 ?auto_8298 ) ) ( not ( = ?auto_8292 ?auto_8302 ) ) ( not ( = ?auto_8292 ?auto_8300 ) ) ( not ( = ?auto_8292 ?auto_8304 ) ) ( not ( = ?auto_8292 ?auto_8306 ) ) ( not ( = ?auto_8297 ?auto_8308 ) ) ( not ( = ?auto_8297 ?auto_8299 ) ) ( not ( = ?auto_8297 ?auto_8301 ) ) ( not ( = ?auto_8297 ?auto_8307 ) ) ( not ( = ?auto_8294 ?auto_8303 ) ) ( not ( = ?auto_8294 ?auto_8305 ) ) ( not ( = ?auto_8294 ?auto_8310 ) ) ( not ( = ?auto_8294 ?auto_8309 ) ) ( not ( = ?auto_8294 ?auto_8298 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8285 ?auto_8286 ?auto_8287 ?auto_8288 ?auto_8289 ?auto_8290 )
      ( MAKE-1CRATE ?auto_8290 ?auto_8291 )
      ( MAKE-6CRATE-VERIFY ?auto_8285 ?auto_8286 ?auto_8287 ?auto_8288 ?auto_8289 ?auto_8290 ?auto_8291 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8329 - SURFACE
      ?auto_8330 - SURFACE
      ?auto_8331 - SURFACE
      ?auto_8332 - SURFACE
      ?auto_8333 - SURFACE
      ?auto_8334 - SURFACE
      ?auto_8335 - SURFACE
      ?auto_8336 - SURFACE
    )
    :vars
    (
      ?auto_8342 - HOIST
      ?auto_8339 - PLACE
      ?auto_8340 - PLACE
      ?auto_8338 - HOIST
      ?auto_8337 - SURFACE
      ?auto_8352 - PLACE
      ?auto_8353 - HOIST
      ?auto_8351 - SURFACE
      ?auto_8346 - PLACE
      ?auto_8354 - HOIST
      ?auto_8347 - SURFACE
      ?auto_8345 - PLACE
      ?auto_8348 - HOIST
      ?auto_8350 - SURFACE
      ?auto_8357 - PLACE
      ?auto_8349 - HOIST
      ?auto_8358 - SURFACE
      ?auto_8355 - PLACE
      ?auto_8344 - HOIST
      ?auto_8356 - SURFACE
      ?auto_8343 - SURFACE
      ?auto_8341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8342 ?auto_8339 ) ( IS-CRATE ?auto_8336 ) ( not ( = ?auto_8340 ?auto_8339 ) ) ( HOIST-AT ?auto_8338 ?auto_8340 ) ( AVAILABLE ?auto_8338 ) ( SURFACE-AT ?auto_8336 ?auto_8340 ) ( ON ?auto_8336 ?auto_8337 ) ( CLEAR ?auto_8336 ) ( not ( = ?auto_8335 ?auto_8336 ) ) ( not ( = ?auto_8335 ?auto_8337 ) ) ( not ( = ?auto_8336 ?auto_8337 ) ) ( not ( = ?auto_8342 ?auto_8338 ) ) ( IS-CRATE ?auto_8335 ) ( not ( = ?auto_8352 ?auto_8339 ) ) ( HOIST-AT ?auto_8353 ?auto_8352 ) ( AVAILABLE ?auto_8353 ) ( SURFACE-AT ?auto_8335 ?auto_8352 ) ( ON ?auto_8335 ?auto_8351 ) ( CLEAR ?auto_8335 ) ( not ( = ?auto_8334 ?auto_8335 ) ) ( not ( = ?auto_8334 ?auto_8351 ) ) ( not ( = ?auto_8335 ?auto_8351 ) ) ( not ( = ?auto_8342 ?auto_8353 ) ) ( IS-CRATE ?auto_8334 ) ( not ( = ?auto_8346 ?auto_8339 ) ) ( HOIST-AT ?auto_8354 ?auto_8346 ) ( AVAILABLE ?auto_8354 ) ( SURFACE-AT ?auto_8334 ?auto_8346 ) ( ON ?auto_8334 ?auto_8347 ) ( CLEAR ?auto_8334 ) ( not ( = ?auto_8333 ?auto_8334 ) ) ( not ( = ?auto_8333 ?auto_8347 ) ) ( not ( = ?auto_8334 ?auto_8347 ) ) ( not ( = ?auto_8342 ?auto_8354 ) ) ( IS-CRATE ?auto_8333 ) ( not ( = ?auto_8345 ?auto_8339 ) ) ( HOIST-AT ?auto_8348 ?auto_8345 ) ( SURFACE-AT ?auto_8333 ?auto_8345 ) ( ON ?auto_8333 ?auto_8350 ) ( CLEAR ?auto_8333 ) ( not ( = ?auto_8332 ?auto_8333 ) ) ( not ( = ?auto_8332 ?auto_8350 ) ) ( not ( = ?auto_8333 ?auto_8350 ) ) ( not ( = ?auto_8342 ?auto_8348 ) ) ( IS-CRATE ?auto_8332 ) ( not ( = ?auto_8357 ?auto_8339 ) ) ( HOIST-AT ?auto_8349 ?auto_8357 ) ( AVAILABLE ?auto_8349 ) ( SURFACE-AT ?auto_8332 ?auto_8357 ) ( ON ?auto_8332 ?auto_8358 ) ( CLEAR ?auto_8332 ) ( not ( = ?auto_8331 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8358 ) ) ( not ( = ?auto_8332 ?auto_8358 ) ) ( not ( = ?auto_8342 ?auto_8349 ) ) ( IS-CRATE ?auto_8331 ) ( not ( = ?auto_8355 ?auto_8339 ) ) ( HOIST-AT ?auto_8344 ?auto_8355 ) ( AVAILABLE ?auto_8344 ) ( SURFACE-AT ?auto_8331 ?auto_8355 ) ( ON ?auto_8331 ?auto_8356 ) ( CLEAR ?auto_8331 ) ( not ( = ?auto_8330 ?auto_8331 ) ) ( not ( = ?auto_8330 ?auto_8356 ) ) ( not ( = ?auto_8331 ?auto_8356 ) ) ( not ( = ?auto_8342 ?auto_8344 ) ) ( SURFACE-AT ?auto_8329 ?auto_8339 ) ( CLEAR ?auto_8329 ) ( IS-CRATE ?auto_8330 ) ( AVAILABLE ?auto_8342 ) ( AVAILABLE ?auto_8348 ) ( SURFACE-AT ?auto_8330 ?auto_8345 ) ( ON ?auto_8330 ?auto_8343 ) ( CLEAR ?auto_8330 ) ( TRUCK-AT ?auto_8341 ?auto_8339 ) ( not ( = ?auto_8329 ?auto_8330 ) ) ( not ( = ?auto_8329 ?auto_8343 ) ) ( not ( = ?auto_8330 ?auto_8343 ) ) ( not ( = ?auto_8329 ?auto_8331 ) ) ( not ( = ?auto_8329 ?auto_8356 ) ) ( not ( = ?auto_8331 ?auto_8343 ) ) ( not ( = ?auto_8355 ?auto_8345 ) ) ( not ( = ?auto_8344 ?auto_8348 ) ) ( not ( = ?auto_8356 ?auto_8343 ) ) ( not ( = ?auto_8329 ?auto_8332 ) ) ( not ( = ?auto_8329 ?auto_8358 ) ) ( not ( = ?auto_8330 ?auto_8332 ) ) ( not ( = ?auto_8330 ?auto_8358 ) ) ( not ( = ?auto_8332 ?auto_8356 ) ) ( not ( = ?auto_8332 ?auto_8343 ) ) ( not ( = ?auto_8357 ?auto_8355 ) ) ( not ( = ?auto_8357 ?auto_8345 ) ) ( not ( = ?auto_8349 ?auto_8344 ) ) ( not ( = ?auto_8349 ?auto_8348 ) ) ( not ( = ?auto_8358 ?auto_8356 ) ) ( not ( = ?auto_8358 ?auto_8343 ) ) ( not ( = ?auto_8329 ?auto_8333 ) ) ( not ( = ?auto_8329 ?auto_8350 ) ) ( not ( = ?auto_8330 ?auto_8333 ) ) ( not ( = ?auto_8330 ?auto_8350 ) ) ( not ( = ?auto_8331 ?auto_8333 ) ) ( not ( = ?auto_8331 ?auto_8350 ) ) ( not ( = ?auto_8333 ?auto_8358 ) ) ( not ( = ?auto_8333 ?auto_8356 ) ) ( not ( = ?auto_8333 ?auto_8343 ) ) ( not ( = ?auto_8350 ?auto_8358 ) ) ( not ( = ?auto_8350 ?auto_8356 ) ) ( not ( = ?auto_8350 ?auto_8343 ) ) ( not ( = ?auto_8329 ?auto_8334 ) ) ( not ( = ?auto_8329 ?auto_8347 ) ) ( not ( = ?auto_8330 ?auto_8334 ) ) ( not ( = ?auto_8330 ?auto_8347 ) ) ( not ( = ?auto_8331 ?auto_8334 ) ) ( not ( = ?auto_8331 ?auto_8347 ) ) ( not ( = ?auto_8332 ?auto_8334 ) ) ( not ( = ?auto_8332 ?auto_8347 ) ) ( not ( = ?auto_8334 ?auto_8350 ) ) ( not ( = ?auto_8334 ?auto_8358 ) ) ( not ( = ?auto_8334 ?auto_8356 ) ) ( not ( = ?auto_8334 ?auto_8343 ) ) ( not ( = ?auto_8346 ?auto_8345 ) ) ( not ( = ?auto_8346 ?auto_8357 ) ) ( not ( = ?auto_8346 ?auto_8355 ) ) ( not ( = ?auto_8354 ?auto_8348 ) ) ( not ( = ?auto_8354 ?auto_8349 ) ) ( not ( = ?auto_8354 ?auto_8344 ) ) ( not ( = ?auto_8347 ?auto_8350 ) ) ( not ( = ?auto_8347 ?auto_8358 ) ) ( not ( = ?auto_8347 ?auto_8356 ) ) ( not ( = ?auto_8347 ?auto_8343 ) ) ( not ( = ?auto_8329 ?auto_8335 ) ) ( not ( = ?auto_8329 ?auto_8351 ) ) ( not ( = ?auto_8330 ?auto_8335 ) ) ( not ( = ?auto_8330 ?auto_8351 ) ) ( not ( = ?auto_8331 ?auto_8335 ) ) ( not ( = ?auto_8331 ?auto_8351 ) ) ( not ( = ?auto_8332 ?auto_8335 ) ) ( not ( = ?auto_8332 ?auto_8351 ) ) ( not ( = ?auto_8333 ?auto_8335 ) ) ( not ( = ?auto_8333 ?auto_8351 ) ) ( not ( = ?auto_8335 ?auto_8347 ) ) ( not ( = ?auto_8335 ?auto_8350 ) ) ( not ( = ?auto_8335 ?auto_8358 ) ) ( not ( = ?auto_8335 ?auto_8356 ) ) ( not ( = ?auto_8335 ?auto_8343 ) ) ( not ( = ?auto_8352 ?auto_8346 ) ) ( not ( = ?auto_8352 ?auto_8345 ) ) ( not ( = ?auto_8352 ?auto_8357 ) ) ( not ( = ?auto_8352 ?auto_8355 ) ) ( not ( = ?auto_8353 ?auto_8354 ) ) ( not ( = ?auto_8353 ?auto_8348 ) ) ( not ( = ?auto_8353 ?auto_8349 ) ) ( not ( = ?auto_8353 ?auto_8344 ) ) ( not ( = ?auto_8351 ?auto_8347 ) ) ( not ( = ?auto_8351 ?auto_8350 ) ) ( not ( = ?auto_8351 ?auto_8358 ) ) ( not ( = ?auto_8351 ?auto_8356 ) ) ( not ( = ?auto_8351 ?auto_8343 ) ) ( not ( = ?auto_8329 ?auto_8336 ) ) ( not ( = ?auto_8329 ?auto_8337 ) ) ( not ( = ?auto_8330 ?auto_8336 ) ) ( not ( = ?auto_8330 ?auto_8337 ) ) ( not ( = ?auto_8331 ?auto_8336 ) ) ( not ( = ?auto_8331 ?auto_8337 ) ) ( not ( = ?auto_8332 ?auto_8336 ) ) ( not ( = ?auto_8332 ?auto_8337 ) ) ( not ( = ?auto_8333 ?auto_8336 ) ) ( not ( = ?auto_8333 ?auto_8337 ) ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( not ( = ?auto_8334 ?auto_8337 ) ) ( not ( = ?auto_8336 ?auto_8351 ) ) ( not ( = ?auto_8336 ?auto_8347 ) ) ( not ( = ?auto_8336 ?auto_8350 ) ) ( not ( = ?auto_8336 ?auto_8358 ) ) ( not ( = ?auto_8336 ?auto_8356 ) ) ( not ( = ?auto_8336 ?auto_8343 ) ) ( not ( = ?auto_8340 ?auto_8352 ) ) ( not ( = ?auto_8340 ?auto_8346 ) ) ( not ( = ?auto_8340 ?auto_8345 ) ) ( not ( = ?auto_8340 ?auto_8357 ) ) ( not ( = ?auto_8340 ?auto_8355 ) ) ( not ( = ?auto_8338 ?auto_8353 ) ) ( not ( = ?auto_8338 ?auto_8354 ) ) ( not ( = ?auto_8338 ?auto_8348 ) ) ( not ( = ?auto_8338 ?auto_8349 ) ) ( not ( = ?auto_8338 ?auto_8344 ) ) ( not ( = ?auto_8337 ?auto_8351 ) ) ( not ( = ?auto_8337 ?auto_8347 ) ) ( not ( = ?auto_8337 ?auto_8350 ) ) ( not ( = ?auto_8337 ?auto_8358 ) ) ( not ( = ?auto_8337 ?auto_8356 ) ) ( not ( = ?auto_8337 ?auto_8343 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8329 ?auto_8330 ?auto_8331 ?auto_8332 ?auto_8333 ?auto_8334 ?auto_8335 )
      ( MAKE-1CRATE ?auto_8335 ?auto_8336 )
      ( MAKE-7CRATE-VERIFY ?auto_8329 ?auto_8330 ?auto_8331 ?auto_8332 ?auto_8333 ?auto_8334 ?auto_8335 ?auto_8336 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8378 - SURFACE
      ?auto_8379 - SURFACE
      ?auto_8380 - SURFACE
      ?auto_8381 - SURFACE
      ?auto_8382 - SURFACE
      ?auto_8383 - SURFACE
      ?auto_8384 - SURFACE
      ?auto_8385 - SURFACE
      ?auto_8386 - SURFACE
    )
    :vars
    (
      ?auto_8392 - HOIST
      ?auto_8391 - PLACE
      ?auto_8387 - PLACE
      ?auto_8388 - HOIST
      ?auto_8389 - SURFACE
      ?auto_8400 - PLACE
      ?auto_8411 - HOIST
      ?auto_8407 - SURFACE
      ?auto_8398 - PLACE
      ?auto_8409 - HOIST
      ?auto_8399 - SURFACE
      ?auto_8393 - PLACE
      ?auto_8394 - HOIST
      ?auto_8397 - SURFACE
      ?auto_8404 - PLACE
      ?auto_8401 - HOIST
      ?auto_8406 - SURFACE
      ?auto_8395 - PLACE
      ?auto_8410 - HOIST
      ?auto_8402 - SURFACE
      ?auto_8403 - PLACE
      ?auto_8408 - HOIST
      ?auto_8405 - SURFACE
      ?auto_8396 - SURFACE
      ?auto_8390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8392 ?auto_8391 ) ( IS-CRATE ?auto_8386 ) ( not ( = ?auto_8387 ?auto_8391 ) ) ( HOIST-AT ?auto_8388 ?auto_8387 ) ( AVAILABLE ?auto_8388 ) ( SURFACE-AT ?auto_8386 ?auto_8387 ) ( ON ?auto_8386 ?auto_8389 ) ( CLEAR ?auto_8386 ) ( not ( = ?auto_8385 ?auto_8386 ) ) ( not ( = ?auto_8385 ?auto_8389 ) ) ( not ( = ?auto_8386 ?auto_8389 ) ) ( not ( = ?auto_8392 ?auto_8388 ) ) ( IS-CRATE ?auto_8385 ) ( not ( = ?auto_8400 ?auto_8391 ) ) ( HOIST-AT ?auto_8411 ?auto_8400 ) ( AVAILABLE ?auto_8411 ) ( SURFACE-AT ?auto_8385 ?auto_8400 ) ( ON ?auto_8385 ?auto_8407 ) ( CLEAR ?auto_8385 ) ( not ( = ?auto_8384 ?auto_8385 ) ) ( not ( = ?auto_8384 ?auto_8407 ) ) ( not ( = ?auto_8385 ?auto_8407 ) ) ( not ( = ?auto_8392 ?auto_8411 ) ) ( IS-CRATE ?auto_8384 ) ( not ( = ?auto_8398 ?auto_8391 ) ) ( HOIST-AT ?auto_8409 ?auto_8398 ) ( AVAILABLE ?auto_8409 ) ( SURFACE-AT ?auto_8384 ?auto_8398 ) ( ON ?auto_8384 ?auto_8399 ) ( CLEAR ?auto_8384 ) ( not ( = ?auto_8383 ?auto_8384 ) ) ( not ( = ?auto_8383 ?auto_8399 ) ) ( not ( = ?auto_8384 ?auto_8399 ) ) ( not ( = ?auto_8392 ?auto_8409 ) ) ( IS-CRATE ?auto_8383 ) ( not ( = ?auto_8393 ?auto_8391 ) ) ( HOIST-AT ?auto_8394 ?auto_8393 ) ( AVAILABLE ?auto_8394 ) ( SURFACE-AT ?auto_8383 ?auto_8393 ) ( ON ?auto_8383 ?auto_8397 ) ( CLEAR ?auto_8383 ) ( not ( = ?auto_8382 ?auto_8383 ) ) ( not ( = ?auto_8382 ?auto_8397 ) ) ( not ( = ?auto_8383 ?auto_8397 ) ) ( not ( = ?auto_8392 ?auto_8394 ) ) ( IS-CRATE ?auto_8382 ) ( not ( = ?auto_8404 ?auto_8391 ) ) ( HOIST-AT ?auto_8401 ?auto_8404 ) ( SURFACE-AT ?auto_8382 ?auto_8404 ) ( ON ?auto_8382 ?auto_8406 ) ( CLEAR ?auto_8382 ) ( not ( = ?auto_8381 ?auto_8382 ) ) ( not ( = ?auto_8381 ?auto_8406 ) ) ( not ( = ?auto_8382 ?auto_8406 ) ) ( not ( = ?auto_8392 ?auto_8401 ) ) ( IS-CRATE ?auto_8381 ) ( not ( = ?auto_8395 ?auto_8391 ) ) ( HOIST-AT ?auto_8410 ?auto_8395 ) ( AVAILABLE ?auto_8410 ) ( SURFACE-AT ?auto_8381 ?auto_8395 ) ( ON ?auto_8381 ?auto_8402 ) ( CLEAR ?auto_8381 ) ( not ( = ?auto_8380 ?auto_8381 ) ) ( not ( = ?auto_8380 ?auto_8402 ) ) ( not ( = ?auto_8381 ?auto_8402 ) ) ( not ( = ?auto_8392 ?auto_8410 ) ) ( IS-CRATE ?auto_8380 ) ( not ( = ?auto_8403 ?auto_8391 ) ) ( HOIST-AT ?auto_8408 ?auto_8403 ) ( AVAILABLE ?auto_8408 ) ( SURFACE-AT ?auto_8380 ?auto_8403 ) ( ON ?auto_8380 ?auto_8405 ) ( CLEAR ?auto_8380 ) ( not ( = ?auto_8379 ?auto_8380 ) ) ( not ( = ?auto_8379 ?auto_8405 ) ) ( not ( = ?auto_8380 ?auto_8405 ) ) ( not ( = ?auto_8392 ?auto_8408 ) ) ( SURFACE-AT ?auto_8378 ?auto_8391 ) ( CLEAR ?auto_8378 ) ( IS-CRATE ?auto_8379 ) ( AVAILABLE ?auto_8392 ) ( AVAILABLE ?auto_8401 ) ( SURFACE-AT ?auto_8379 ?auto_8404 ) ( ON ?auto_8379 ?auto_8396 ) ( CLEAR ?auto_8379 ) ( TRUCK-AT ?auto_8390 ?auto_8391 ) ( not ( = ?auto_8378 ?auto_8379 ) ) ( not ( = ?auto_8378 ?auto_8396 ) ) ( not ( = ?auto_8379 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8380 ) ) ( not ( = ?auto_8378 ?auto_8405 ) ) ( not ( = ?auto_8380 ?auto_8396 ) ) ( not ( = ?auto_8403 ?auto_8404 ) ) ( not ( = ?auto_8408 ?auto_8401 ) ) ( not ( = ?auto_8405 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8381 ) ) ( not ( = ?auto_8378 ?auto_8402 ) ) ( not ( = ?auto_8379 ?auto_8381 ) ) ( not ( = ?auto_8379 ?auto_8402 ) ) ( not ( = ?auto_8381 ?auto_8405 ) ) ( not ( = ?auto_8381 ?auto_8396 ) ) ( not ( = ?auto_8395 ?auto_8403 ) ) ( not ( = ?auto_8395 ?auto_8404 ) ) ( not ( = ?auto_8410 ?auto_8408 ) ) ( not ( = ?auto_8410 ?auto_8401 ) ) ( not ( = ?auto_8402 ?auto_8405 ) ) ( not ( = ?auto_8402 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8382 ) ) ( not ( = ?auto_8378 ?auto_8406 ) ) ( not ( = ?auto_8379 ?auto_8382 ) ) ( not ( = ?auto_8379 ?auto_8406 ) ) ( not ( = ?auto_8380 ?auto_8382 ) ) ( not ( = ?auto_8380 ?auto_8406 ) ) ( not ( = ?auto_8382 ?auto_8402 ) ) ( not ( = ?auto_8382 ?auto_8405 ) ) ( not ( = ?auto_8382 ?auto_8396 ) ) ( not ( = ?auto_8406 ?auto_8402 ) ) ( not ( = ?auto_8406 ?auto_8405 ) ) ( not ( = ?auto_8406 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8383 ) ) ( not ( = ?auto_8378 ?auto_8397 ) ) ( not ( = ?auto_8379 ?auto_8383 ) ) ( not ( = ?auto_8379 ?auto_8397 ) ) ( not ( = ?auto_8380 ?auto_8383 ) ) ( not ( = ?auto_8380 ?auto_8397 ) ) ( not ( = ?auto_8381 ?auto_8383 ) ) ( not ( = ?auto_8381 ?auto_8397 ) ) ( not ( = ?auto_8383 ?auto_8406 ) ) ( not ( = ?auto_8383 ?auto_8402 ) ) ( not ( = ?auto_8383 ?auto_8405 ) ) ( not ( = ?auto_8383 ?auto_8396 ) ) ( not ( = ?auto_8393 ?auto_8404 ) ) ( not ( = ?auto_8393 ?auto_8395 ) ) ( not ( = ?auto_8393 ?auto_8403 ) ) ( not ( = ?auto_8394 ?auto_8401 ) ) ( not ( = ?auto_8394 ?auto_8410 ) ) ( not ( = ?auto_8394 ?auto_8408 ) ) ( not ( = ?auto_8397 ?auto_8406 ) ) ( not ( = ?auto_8397 ?auto_8402 ) ) ( not ( = ?auto_8397 ?auto_8405 ) ) ( not ( = ?auto_8397 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8384 ) ) ( not ( = ?auto_8378 ?auto_8399 ) ) ( not ( = ?auto_8379 ?auto_8384 ) ) ( not ( = ?auto_8379 ?auto_8399 ) ) ( not ( = ?auto_8380 ?auto_8384 ) ) ( not ( = ?auto_8380 ?auto_8399 ) ) ( not ( = ?auto_8381 ?auto_8384 ) ) ( not ( = ?auto_8381 ?auto_8399 ) ) ( not ( = ?auto_8382 ?auto_8384 ) ) ( not ( = ?auto_8382 ?auto_8399 ) ) ( not ( = ?auto_8384 ?auto_8397 ) ) ( not ( = ?auto_8384 ?auto_8406 ) ) ( not ( = ?auto_8384 ?auto_8402 ) ) ( not ( = ?auto_8384 ?auto_8405 ) ) ( not ( = ?auto_8384 ?auto_8396 ) ) ( not ( = ?auto_8398 ?auto_8393 ) ) ( not ( = ?auto_8398 ?auto_8404 ) ) ( not ( = ?auto_8398 ?auto_8395 ) ) ( not ( = ?auto_8398 ?auto_8403 ) ) ( not ( = ?auto_8409 ?auto_8394 ) ) ( not ( = ?auto_8409 ?auto_8401 ) ) ( not ( = ?auto_8409 ?auto_8410 ) ) ( not ( = ?auto_8409 ?auto_8408 ) ) ( not ( = ?auto_8399 ?auto_8397 ) ) ( not ( = ?auto_8399 ?auto_8406 ) ) ( not ( = ?auto_8399 ?auto_8402 ) ) ( not ( = ?auto_8399 ?auto_8405 ) ) ( not ( = ?auto_8399 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8385 ) ) ( not ( = ?auto_8378 ?auto_8407 ) ) ( not ( = ?auto_8379 ?auto_8385 ) ) ( not ( = ?auto_8379 ?auto_8407 ) ) ( not ( = ?auto_8380 ?auto_8385 ) ) ( not ( = ?auto_8380 ?auto_8407 ) ) ( not ( = ?auto_8381 ?auto_8385 ) ) ( not ( = ?auto_8381 ?auto_8407 ) ) ( not ( = ?auto_8382 ?auto_8385 ) ) ( not ( = ?auto_8382 ?auto_8407 ) ) ( not ( = ?auto_8383 ?auto_8385 ) ) ( not ( = ?auto_8383 ?auto_8407 ) ) ( not ( = ?auto_8385 ?auto_8399 ) ) ( not ( = ?auto_8385 ?auto_8397 ) ) ( not ( = ?auto_8385 ?auto_8406 ) ) ( not ( = ?auto_8385 ?auto_8402 ) ) ( not ( = ?auto_8385 ?auto_8405 ) ) ( not ( = ?auto_8385 ?auto_8396 ) ) ( not ( = ?auto_8400 ?auto_8398 ) ) ( not ( = ?auto_8400 ?auto_8393 ) ) ( not ( = ?auto_8400 ?auto_8404 ) ) ( not ( = ?auto_8400 ?auto_8395 ) ) ( not ( = ?auto_8400 ?auto_8403 ) ) ( not ( = ?auto_8411 ?auto_8409 ) ) ( not ( = ?auto_8411 ?auto_8394 ) ) ( not ( = ?auto_8411 ?auto_8401 ) ) ( not ( = ?auto_8411 ?auto_8410 ) ) ( not ( = ?auto_8411 ?auto_8408 ) ) ( not ( = ?auto_8407 ?auto_8399 ) ) ( not ( = ?auto_8407 ?auto_8397 ) ) ( not ( = ?auto_8407 ?auto_8406 ) ) ( not ( = ?auto_8407 ?auto_8402 ) ) ( not ( = ?auto_8407 ?auto_8405 ) ) ( not ( = ?auto_8407 ?auto_8396 ) ) ( not ( = ?auto_8378 ?auto_8386 ) ) ( not ( = ?auto_8378 ?auto_8389 ) ) ( not ( = ?auto_8379 ?auto_8386 ) ) ( not ( = ?auto_8379 ?auto_8389 ) ) ( not ( = ?auto_8380 ?auto_8386 ) ) ( not ( = ?auto_8380 ?auto_8389 ) ) ( not ( = ?auto_8381 ?auto_8386 ) ) ( not ( = ?auto_8381 ?auto_8389 ) ) ( not ( = ?auto_8382 ?auto_8386 ) ) ( not ( = ?auto_8382 ?auto_8389 ) ) ( not ( = ?auto_8383 ?auto_8386 ) ) ( not ( = ?auto_8383 ?auto_8389 ) ) ( not ( = ?auto_8384 ?auto_8386 ) ) ( not ( = ?auto_8384 ?auto_8389 ) ) ( not ( = ?auto_8386 ?auto_8407 ) ) ( not ( = ?auto_8386 ?auto_8399 ) ) ( not ( = ?auto_8386 ?auto_8397 ) ) ( not ( = ?auto_8386 ?auto_8406 ) ) ( not ( = ?auto_8386 ?auto_8402 ) ) ( not ( = ?auto_8386 ?auto_8405 ) ) ( not ( = ?auto_8386 ?auto_8396 ) ) ( not ( = ?auto_8387 ?auto_8400 ) ) ( not ( = ?auto_8387 ?auto_8398 ) ) ( not ( = ?auto_8387 ?auto_8393 ) ) ( not ( = ?auto_8387 ?auto_8404 ) ) ( not ( = ?auto_8387 ?auto_8395 ) ) ( not ( = ?auto_8387 ?auto_8403 ) ) ( not ( = ?auto_8388 ?auto_8411 ) ) ( not ( = ?auto_8388 ?auto_8409 ) ) ( not ( = ?auto_8388 ?auto_8394 ) ) ( not ( = ?auto_8388 ?auto_8401 ) ) ( not ( = ?auto_8388 ?auto_8410 ) ) ( not ( = ?auto_8388 ?auto_8408 ) ) ( not ( = ?auto_8389 ?auto_8407 ) ) ( not ( = ?auto_8389 ?auto_8399 ) ) ( not ( = ?auto_8389 ?auto_8397 ) ) ( not ( = ?auto_8389 ?auto_8406 ) ) ( not ( = ?auto_8389 ?auto_8402 ) ) ( not ( = ?auto_8389 ?auto_8405 ) ) ( not ( = ?auto_8389 ?auto_8396 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8378 ?auto_8379 ?auto_8380 ?auto_8381 ?auto_8382 ?auto_8383 ?auto_8384 ?auto_8385 )
      ( MAKE-1CRATE ?auto_8385 ?auto_8386 )
      ( MAKE-8CRATE-VERIFY ?auto_8378 ?auto_8379 ?auto_8380 ?auto_8381 ?auto_8382 ?auto_8383 ?auto_8384 ?auto_8385 ?auto_8386 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8432 - SURFACE
      ?auto_8433 - SURFACE
      ?auto_8434 - SURFACE
      ?auto_8435 - SURFACE
      ?auto_8436 - SURFACE
      ?auto_8437 - SURFACE
      ?auto_8438 - SURFACE
      ?auto_8439 - SURFACE
      ?auto_8440 - SURFACE
      ?auto_8441 - SURFACE
    )
    :vars
    (
      ?auto_8442 - HOIST
      ?auto_8445 - PLACE
      ?auto_8446 - PLACE
      ?auto_8444 - HOIST
      ?auto_8443 - SURFACE
      ?auto_8468 - PLACE
      ?auto_8451 - HOIST
      ?auto_8469 - SURFACE
      ?auto_8460 - PLACE
      ?auto_8463 - HOIST
      ?auto_8467 - SURFACE
      ?auto_8465 - PLACE
      ?auto_8457 - HOIST
      ?auto_8456 - SURFACE
      ?auto_8454 - PLACE
      ?auto_8455 - HOIST
      ?auto_8449 - SURFACE
      ?auto_8458 - PLACE
      ?auto_8450 - HOIST
      ?auto_8453 - SURFACE
      ?auto_8461 - PLACE
      ?auto_8452 - HOIST
      ?auto_8464 - SURFACE
      ?auto_8466 - PLACE
      ?auto_8448 - HOIST
      ?auto_8459 - SURFACE
      ?auto_8462 - SURFACE
      ?auto_8447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8442 ?auto_8445 ) ( IS-CRATE ?auto_8441 ) ( not ( = ?auto_8446 ?auto_8445 ) ) ( HOIST-AT ?auto_8444 ?auto_8446 ) ( AVAILABLE ?auto_8444 ) ( SURFACE-AT ?auto_8441 ?auto_8446 ) ( ON ?auto_8441 ?auto_8443 ) ( CLEAR ?auto_8441 ) ( not ( = ?auto_8440 ?auto_8441 ) ) ( not ( = ?auto_8440 ?auto_8443 ) ) ( not ( = ?auto_8441 ?auto_8443 ) ) ( not ( = ?auto_8442 ?auto_8444 ) ) ( IS-CRATE ?auto_8440 ) ( not ( = ?auto_8468 ?auto_8445 ) ) ( HOIST-AT ?auto_8451 ?auto_8468 ) ( AVAILABLE ?auto_8451 ) ( SURFACE-AT ?auto_8440 ?auto_8468 ) ( ON ?auto_8440 ?auto_8469 ) ( CLEAR ?auto_8440 ) ( not ( = ?auto_8439 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8469 ) ) ( not ( = ?auto_8440 ?auto_8469 ) ) ( not ( = ?auto_8442 ?auto_8451 ) ) ( IS-CRATE ?auto_8439 ) ( not ( = ?auto_8460 ?auto_8445 ) ) ( HOIST-AT ?auto_8463 ?auto_8460 ) ( AVAILABLE ?auto_8463 ) ( SURFACE-AT ?auto_8439 ?auto_8460 ) ( ON ?auto_8439 ?auto_8467 ) ( CLEAR ?auto_8439 ) ( not ( = ?auto_8438 ?auto_8439 ) ) ( not ( = ?auto_8438 ?auto_8467 ) ) ( not ( = ?auto_8439 ?auto_8467 ) ) ( not ( = ?auto_8442 ?auto_8463 ) ) ( IS-CRATE ?auto_8438 ) ( not ( = ?auto_8465 ?auto_8445 ) ) ( HOIST-AT ?auto_8457 ?auto_8465 ) ( AVAILABLE ?auto_8457 ) ( SURFACE-AT ?auto_8438 ?auto_8465 ) ( ON ?auto_8438 ?auto_8456 ) ( CLEAR ?auto_8438 ) ( not ( = ?auto_8437 ?auto_8438 ) ) ( not ( = ?auto_8437 ?auto_8456 ) ) ( not ( = ?auto_8438 ?auto_8456 ) ) ( not ( = ?auto_8442 ?auto_8457 ) ) ( IS-CRATE ?auto_8437 ) ( not ( = ?auto_8454 ?auto_8445 ) ) ( HOIST-AT ?auto_8455 ?auto_8454 ) ( AVAILABLE ?auto_8455 ) ( SURFACE-AT ?auto_8437 ?auto_8454 ) ( ON ?auto_8437 ?auto_8449 ) ( CLEAR ?auto_8437 ) ( not ( = ?auto_8436 ?auto_8437 ) ) ( not ( = ?auto_8436 ?auto_8449 ) ) ( not ( = ?auto_8437 ?auto_8449 ) ) ( not ( = ?auto_8442 ?auto_8455 ) ) ( IS-CRATE ?auto_8436 ) ( not ( = ?auto_8458 ?auto_8445 ) ) ( HOIST-AT ?auto_8450 ?auto_8458 ) ( SURFACE-AT ?auto_8436 ?auto_8458 ) ( ON ?auto_8436 ?auto_8453 ) ( CLEAR ?auto_8436 ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8435 ?auto_8453 ) ) ( not ( = ?auto_8436 ?auto_8453 ) ) ( not ( = ?auto_8442 ?auto_8450 ) ) ( IS-CRATE ?auto_8435 ) ( not ( = ?auto_8461 ?auto_8445 ) ) ( HOIST-AT ?auto_8452 ?auto_8461 ) ( AVAILABLE ?auto_8452 ) ( SURFACE-AT ?auto_8435 ?auto_8461 ) ( ON ?auto_8435 ?auto_8464 ) ( CLEAR ?auto_8435 ) ( not ( = ?auto_8434 ?auto_8435 ) ) ( not ( = ?auto_8434 ?auto_8464 ) ) ( not ( = ?auto_8435 ?auto_8464 ) ) ( not ( = ?auto_8442 ?auto_8452 ) ) ( IS-CRATE ?auto_8434 ) ( not ( = ?auto_8466 ?auto_8445 ) ) ( HOIST-AT ?auto_8448 ?auto_8466 ) ( AVAILABLE ?auto_8448 ) ( SURFACE-AT ?auto_8434 ?auto_8466 ) ( ON ?auto_8434 ?auto_8459 ) ( CLEAR ?auto_8434 ) ( not ( = ?auto_8433 ?auto_8434 ) ) ( not ( = ?auto_8433 ?auto_8459 ) ) ( not ( = ?auto_8434 ?auto_8459 ) ) ( not ( = ?auto_8442 ?auto_8448 ) ) ( SURFACE-AT ?auto_8432 ?auto_8445 ) ( CLEAR ?auto_8432 ) ( IS-CRATE ?auto_8433 ) ( AVAILABLE ?auto_8442 ) ( AVAILABLE ?auto_8450 ) ( SURFACE-AT ?auto_8433 ?auto_8458 ) ( ON ?auto_8433 ?auto_8462 ) ( CLEAR ?auto_8433 ) ( TRUCK-AT ?auto_8447 ?auto_8445 ) ( not ( = ?auto_8432 ?auto_8433 ) ) ( not ( = ?auto_8432 ?auto_8462 ) ) ( not ( = ?auto_8433 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8434 ) ) ( not ( = ?auto_8432 ?auto_8459 ) ) ( not ( = ?auto_8434 ?auto_8462 ) ) ( not ( = ?auto_8466 ?auto_8458 ) ) ( not ( = ?auto_8448 ?auto_8450 ) ) ( not ( = ?auto_8459 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8435 ) ) ( not ( = ?auto_8432 ?auto_8464 ) ) ( not ( = ?auto_8433 ?auto_8435 ) ) ( not ( = ?auto_8433 ?auto_8464 ) ) ( not ( = ?auto_8435 ?auto_8459 ) ) ( not ( = ?auto_8435 ?auto_8462 ) ) ( not ( = ?auto_8461 ?auto_8466 ) ) ( not ( = ?auto_8461 ?auto_8458 ) ) ( not ( = ?auto_8452 ?auto_8448 ) ) ( not ( = ?auto_8452 ?auto_8450 ) ) ( not ( = ?auto_8464 ?auto_8459 ) ) ( not ( = ?auto_8464 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8436 ) ) ( not ( = ?auto_8432 ?auto_8453 ) ) ( not ( = ?auto_8433 ?auto_8436 ) ) ( not ( = ?auto_8433 ?auto_8453 ) ) ( not ( = ?auto_8434 ?auto_8436 ) ) ( not ( = ?auto_8434 ?auto_8453 ) ) ( not ( = ?auto_8436 ?auto_8464 ) ) ( not ( = ?auto_8436 ?auto_8459 ) ) ( not ( = ?auto_8436 ?auto_8462 ) ) ( not ( = ?auto_8453 ?auto_8464 ) ) ( not ( = ?auto_8453 ?auto_8459 ) ) ( not ( = ?auto_8453 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8437 ) ) ( not ( = ?auto_8432 ?auto_8449 ) ) ( not ( = ?auto_8433 ?auto_8437 ) ) ( not ( = ?auto_8433 ?auto_8449 ) ) ( not ( = ?auto_8434 ?auto_8437 ) ) ( not ( = ?auto_8434 ?auto_8449 ) ) ( not ( = ?auto_8435 ?auto_8437 ) ) ( not ( = ?auto_8435 ?auto_8449 ) ) ( not ( = ?auto_8437 ?auto_8453 ) ) ( not ( = ?auto_8437 ?auto_8464 ) ) ( not ( = ?auto_8437 ?auto_8459 ) ) ( not ( = ?auto_8437 ?auto_8462 ) ) ( not ( = ?auto_8454 ?auto_8458 ) ) ( not ( = ?auto_8454 ?auto_8461 ) ) ( not ( = ?auto_8454 ?auto_8466 ) ) ( not ( = ?auto_8455 ?auto_8450 ) ) ( not ( = ?auto_8455 ?auto_8452 ) ) ( not ( = ?auto_8455 ?auto_8448 ) ) ( not ( = ?auto_8449 ?auto_8453 ) ) ( not ( = ?auto_8449 ?auto_8464 ) ) ( not ( = ?auto_8449 ?auto_8459 ) ) ( not ( = ?auto_8449 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8438 ) ) ( not ( = ?auto_8432 ?auto_8456 ) ) ( not ( = ?auto_8433 ?auto_8438 ) ) ( not ( = ?auto_8433 ?auto_8456 ) ) ( not ( = ?auto_8434 ?auto_8438 ) ) ( not ( = ?auto_8434 ?auto_8456 ) ) ( not ( = ?auto_8435 ?auto_8438 ) ) ( not ( = ?auto_8435 ?auto_8456 ) ) ( not ( = ?auto_8436 ?auto_8438 ) ) ( not ( = ?auto_8436 ?auto_8456 ) ) ( not ( = ?auto_8438 ?auto_8449 ) ) ( not ( = ?auto_8438 ?auto_8453 ) ) ( not ( = ?auto_8438 ?auto_8464 ) ) ( not ( = ?auto_8438 ?auto_8459 ) ) ( not ( = ?auto_8438 ?auto_8462 ) ) ( not ( = ?auto_8465 ?auto_8454 ) ) ( not ( = ?auto_8465 ?auto_8458 ) ) ( not ( = ?auto_8465 ?auto_8461 ) ) ( not ( = ?auto_8465 ?auto_8466 ) ) ( not ( = ?auto_8457 ?auto_8455 ) ) ( not ( = ?auto_8457 ?auto_8450 ) ) ( not ( = ?auto_8457 ?auto_8452 ) ) ( not ( = ?auto_8457 ?auto_8448 ) ) ( not ( = ?auto_8456 ?auto_8449 ) ) ( not ( = ?auto_8456 ?auto_8453 ) ) ( not ( = ?auto_8456 ?auto_8464 ) ) ( not ( = ?auto_8456 ?auto_8459 ) ) ( not ( = ?auto_8456 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8439 ) ) ( not ( = ?auto_8432 ?auto_8467 ) ) ( not ( = ?auto_8433 ?auto_8439 ) ) ( not ( = ?auto_8433 ?auto_8467 ) ) ( not ( = ?auto_8434 ?auto_8439 ) ) ( not ( = ?auto_8434 ?auto_8467 ) ) ( not ( = ?auto_8435 ?auto_8439 ) ) ( not ( = ?auto_8435 ?auto_8467 ) ) ( not ( = ?auto_8436 ?auto_8439 ) ) ( not ( = ?auto_8436 ?auto_8467 ) ) ( not ( = ?auto_8437 ?auto_8439 ) ) ( not ( = ?auto_8437 ?auto_8467 ) ) ( not ( = ?auto_8439 ?auto_8456 ) ) ( not ( = ?auto_8439 ?auto_8449 ) ) ( not ( = ?auto_8439 ?auto_8453 ) ) ( not ( = ?auto_8439 ?auto_8464 ) ) ( not ( = ?auto_8439 ?auto_8459 ) ) ( not ( = ?auto_8439 ?auto_8462 ) ) ( not ( = ?auto_8460 ?auto_8465 ) ) ( not ( = ?auto_8460 ?auto_8454 ) ) ( not ( = ?auto_8460 ?auto_8458 ) ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8460 ?auto_8466 ) ) ( not ( = ?auto_8463 ?auto_8457 ) ) ( not ( = ?auto_8463 ?auto_8455 ) ) ( not ( = ?auto_8463 ?auto_8450 ) ) ( not ( = ?auto_8463 ?auto_8452 ) ) ( not ( = ?auto_8463 ?auto_8448 ) ) ( not ( = ?auto_8467 ?auto_8456 ) ) ( not ( = ?auto_8467 ?auto_8449 ) ) ( not ( = ?auto_8467 ?auto_8453 ) ) ( not ( = ?auto_8467 ?auto_8464 ) ) ( not ( = ?auto_8467 ?auto_8459 ) ) ( not ( = ?auto_8467 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8440 ) ) ( not ( = ?auto_8432 ?auto_8469 ) ) ( not ( = ?auto_8433 ?auto_8440 ) ) ( not ( = ?auto_8433 ?auto_8469 ) ) ( not ( = ?auto_8434 ?auto_8440 ) ) ( not ( = ?auto_8434 ?auto_8469 ) ) ( not ( = ?auto_8435 ?auto_8440 ) ) ( not ( = ?auto_8435 ?auto_8469 ) ) ( not ( = ?auto_8436 ?auto_8440 ) ) ( not ( = ?auto_8436 ?auto_8469 ) ) ( not ( = ?auto_8437 ?auto_8440 ) ) ( not ( = ?auto_8437 ?auto_8469 ) ) ( not ( = ?auto_8438 ?auto_8440 ) ) ( not ( = ?auto_8438 ?auto_8469 ) ) ( not ( = ?auto_8440 ?auto_8467 ) ) ( not ( = ?auto_8440 ?auto_8456 ) ) ( not ( = ?auto_8440 ?auto_8449 ) ) ( not ( = ?auto_8440 ?auto_8453 ) ) ( not ( = ?auto_8440 ?auto_8464 ) ) ( not ( = ?auto_8440 ?auto_8459 ) ) ( not ( = ?auto_8440 ?auto_8462 ) ) ( not ( = ?auto_8468 ?auto_8460 ) ) ( not ( = ?auto_8468 ?auto_8465 ) ) ( not ( = ?auto_8468 ?auto_8454 ) ) ( not ( = ?auto_8468 ?auto_8458 ) ) ( not ( = ?auto_8468 ?auto_8461 ) ) ( not ( = ?auto_8468 ?auto_8466 ) ) ( not ( = ?auto_8451 ?auto_8463 ) ) ( not ( = ?auto_8451 ?auto_8457 ) ) ( not ( = ?auto_8451 ?auto_8455 ) ) ( not ( = ?auto_8451 ?auto_8450 ) ) ( not ( = ?auto_8451 ?auto_8452 ) ) ( not ( = ?auto_8451 ?auto_8448 ) ) ( not ( = ?auto_8469 ?auto_8467 ) ) ( not ( = ?auto_8469 ?auto_8456 ) ) ( not ( = ?auto_8469 ?auto_8449 ) ) ( not ( = ?auto_8469 ?auto_8453 ) ) ( not ( = ?auto_8469 ?auto_8464 ) ) ( not ( = ?auto_8469 ?auto_8459 ) ) ( not ( = ?auto_8469 ?auto_8462 ) ) ( not ( = ?auto_8432 ?auto_8441 ) ) ( not ( = ?auto_8432 ?auto_8443 ) ) ( not ( = ?auto_8433 ?auto_8441 ) ) ( not ( = ?auto_8433 ?auto_8443 ) ) ( not ( = ?auto_8434 ?auto_8441 ) ) ( not ( = ?auto_8434 ?auto_8443 ) ) ( not ( = ?auto_8435 ?auto_8441 ) ) ( not ( = ?auto_8435 ?auto_8443 ) ) ( not ( = ?auto_8436 ?auto_8441 ) ) ( not ( = ?auto_8436 ?auto_8443 ) ) ( not ( = ?auto_8437 ?auto_8441 ) ) ( not ( = ?auto_8437 ?auto_8443 ) ) ( not ( = ?auto_8438 ?auto_8441 ) ) ( not ( = ?auto_8438 ?auto_8443 ) ) ( not ( = ?auto_8439 ?auto_8441 ) ) ( not ( = ?auto_8439 ?auto_8443 ) ) ( not ( = ?auto_8441 ?auto_8469 ) ) ( not ( = ?auto_8441 ?auto_8467 ) ) ( not ( = ?auto_8441 ?auto_8456 ) ) ( not ( = ?auto_8441 ?auto_8449 ) ) ( not ( = ?auto_8441 ?auto_8453 ) ) ( not ( = ?auto_8441 ?auto_8464 ) ) ( not ( = ?auto_8441 ?auto_8459 ) ) ( not ( = ?auto_8441 ?auto_8462 ) ) ( not ( = ?auto_8446 ?auto_8468 ) ) ( not ( = ?auto_8446 ?auto_8460 ) ) ( not ( = ?auto_8446 ?auto_8465 ) ) ( not ( = ?auto_8446 ?auto_8454 ) ) ( not ( = ?auto_8446 ?auto_8458 ) ) ( not ( = ?auto_8446 ?auto_8461 ) ) ( not ( = ?auto_8446 ?auto_8466 ) ) ( not ( = ?auto_8444 ?auto_8451 ) ) ( not ( = ?auto_8444 ?auto_8463 ) ) ( not ( = ?auto_8444 ?auto_8457 ) ) ( not ( = ?auto_8444 ?auto_8455 ) ) ( not ( = ?auto_8444 ?auto_8450 ) ) ( not ( = ?auto_8444 ?auto_8452 ) ) ( not ( = ?auto_8444 ?auto_8448 ) ) ( not ( = ?auto_8443 ?auto_8469 ) ) ( not ( = ?auto_8443 ?auto_8467 ) ) ( not ( = ?auto_8443 ?auto_8456 ) ) ( not ( = ?auto_8443 ?auto_8449 ) ) ( not ( = ?auto_8443 ?auto_8453 ) ) ( not ( = ?auto_8443 ?auto_8464 ) ) ( not ( = ?auto_8443 ?auto_8459 ) ) ( not ( = ?auto_8443 ?auto_8462 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8432 ?auto_8433 ?auto_8434 ?auto_8435 ?auto_8436 ?auto_8437 ?auto_8438 ?auto_8439 ?auto_8440 )
      ( MAKE-1CRATE ?auto_8440 ?auto_8441 )
      ( MAKE-9CRATE-VERIFY ?auto_8432 ?auto_8433 ?auto_8434 ?auto_8435 ?auto_8436 ?auto_8437 ?auto_8438 ?auto_8439 ?auto_8440 ?auto_8441 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8491 - SURFACE
      ?auto_8492 - SURFACE
      ?auto_8493 - SURFACE
      ?auto_8494 - SURFACE
      ?auto_8495 - SURFACE
      ?auto_8496 - SURFACE
      ?auto_8497 - SURFACE
      ?auto_8498 - SURFACE
      ?auto_8499 - SURFACE
      ?auto_8500 - SURFACE
      ?auto_8501 - SURFACE
    )
    :vars
    (
      ?auto_8504 - HOIST
      ?auto_8505 - PLACE
      ?auto_8507 - PLACE
      ?auto_8506 - HOIST
      ?auto_8502 - SURFACE
      ?auto_8510 - PLACE
      ?auto_8512 - HOIST
      ?auto_8516 - SURFACE
      ?auto_8520 - PLACE
      ?auto_8521 - HOIST
      ?auto_8525 - SURFACE
      ?auto_8509 - PLACE
      ?auto_8513 - HOIST
      ?auto_8508 - SURFACE
      ?auto_8515 - PLACE
      ?auto_8532 - HOIST
      ?auto_8519 - SURFACE
      ?auto_8514 - PLACE
      ?auto_8529 - HOIST
      ?auto_8518 - SURFACE
      ?auto_8530 - PLACE
      ?auto_8528 - HOIST
      ?auto_8523 - SURFACE
      ?auto_8522 - PLACE
      ?auto_8524 - HOIST
      ?auto_8527 - SURFACE
      ?auto_8526 - PLACE
      ?auto_8517 - HOIST
      ?auto_8531 - SURFACE
      ?auto_8511 - SURFACE
      ?auto_8503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8504 ?auto_8505 ) ( IS-CRATE ?auto_8501 ) ( not ( = ?auto_8507 ?auto_8505 ) ) ( HOIST-AT ?auto_8506 ?auto_8507 ) ( AVAILABLE ?auto_8506 ) ( SURFACE-AT ?auto_8501 ?auto_8507 ) ( ON ?auto_8501 ?auto_8502 ) ( CLEAR ?auto_8501 ) ( not ( = ?auto_8500 ?auto_8501 ) ) ( not ( = ?auto_8500 ?auto_8502 ) ) ( not ( = ?auto_8501 ?auto_8502 ) ) ( not ( = ?auto_8504 ?auto_8506 ) ) ( IS-CRATE ?auto_8500 ) ( not ( = ?auto_8510 ?auto_8505 ) ) ( HOIST-AT ?auto_8512 ?auto_8510 ) ( AVAILABLE ?auto_8512 ) ( SURFACE-AT ?auto_8500 ?auto_8510 ) ( ON ?auto_8500 ?auto_8516 ) ( CLEAR ?auto_8500 ) ( not ( = ?auto_8499 ?auto_8500 ) ) ( not ( = ?auto_8499 ?auto_8516 ) ) ( not ( = ?auto_8500 ?auto_8516 ) ) ( not ( = ?auto_8504 ?auto_8512 ) ) ( IS-CRATE ?auto_8499 ) ( not ( = ?auto_8520 ?auto_8505 ) ) ( HOIST-AT ?auto_8521 ?auto_8520 ) ( AVAILABLE ?auto_8521 ) ( SURFACE-AT ?auto_8499 ?auto_8520 ) ( ON ?auto_8499 ?auto_8525 ) ( CLEAR ?auto_8499 ) ( not ( = ?auto_8498 ?auto_8499 ) ) ( not ( = ?auto_8498 ?auto_8525 ) ) ( not ( = ?auto_8499 ?auto_8525 ) ) ( not ( = ?auto_8504 ?auto_8521 ) ) ( IS-CRATE ?auto_8498 ) ( not ( = ?auto_8509 ?auto_8505 ) ) ( HOIST-AT ?auto_8513 ?auto_8509 ) ( AVAILABLE ?auto_8513 ) ( SURFACE-AT ?auto_8498 ?auto_8509 ) ( ON ?auto_8498 ?auto_8508 ) ( CLEAR ?auto_8498 ) ( not ( = ?auto_8497 ?auto_8498 ) ) ( not ( = ?auto_8497 ?auto_8508 ) ) ( not ( = ?auto_8498 ?auto_8508 ) ) ( not ( = ?auto_8504 ?auto_8513 ) ) ( IS-CRATE ?auto_8497 ) ( not ( = ?auto_8515 ?auto_8505 ) ) ( HOIST-AT ?auto_8532 ?auto_8515 ) ( AVAILABLE ?auto_8532 ) ( SURFACE-AT ?auto_8497 ?auto_8515 ) ( ON ?auto_8497 ?auto_8519 ) ( CLEAR ?auto_8497 ) ( not ( = ?auto_8496 ?auto_8497 ) ) ( not ( = ?auto_8496 ?auto_8519 ) ) ( not ( = ?auto_8497 ?auto_8519 ) ) ( not ( = ?auto_8504 ?auto_8532 ) ) ( IS-CRATE ?auto_8496 ) ( not ( = ?auto_8514 ?auto_8505 ) ) ( HOIST-AT ?auto_8529 ?auto_8514 ) ( AVAILABLE ?auto_8529 ) ( SURFACE-AT ?auto_8496 ?auto_8514 ) ( ON ?auto_8496 ?auto_8518 ) ( CLEAR ?auto_8496 ) ( not ( = ?auto_8495 ?auto_8496 ) ) ( not ( = ?auto_8495 ?auto_8518 ) ) ( not ( = ?auto_8496 ?auto_8518 ) ) ( not ( = ?auto_8504 ?auto_8529 ) ) ( IS-CRATE ?auto_8495 ) ( not ( = ?auto_8530 ?auto_8505 ) ) ( HOIST-AT ?auto_8528 ?auto_8530 ) ( SURFACE-AT ?auto_8495 ?auto_8530 ) ( ON ?auto_8495 ?auto_8523 ) ( CLEAR ?auto_8495 ) ( not ( = ?auto_8494 ?auto_8495 ) ) ( not ( = ?auto_8494 ?auto_8523 ) ) ( not ( = ?auto_8495 ?auto_8523 ) ) ( not ( = ?auto_8504 ?auto_8528 ) ) ( IS-CRATE ?auto_8494 ) ( not ( = ?auto_8522 ?auto_8505 ) ) ( HOIST-AT ?auto_8524 ?auto_8522 ) ( AVAILABLE ?auto_8524 ) ( SURFACE-AT ?auto_8494 ?auto_8522 ) ( ON ?auto_8494 ?auto_8527 ) ( CLEAR ?auto_8494 ) ( not ( = ?auto_8493 ?auto_8494 ) ) ( not ( = ?auto_8493 ?auto_8527 ) ) ( not ( = ?auto_8494 ?auto_8527 ) ) ( not ( = ?auto_8504 ?auto_8524 ) ) ( IS-CRATE ?auto_8493 ) ( not ( = ?auto_8526 ?auto_8505 ) ) ( HOIST-AT ?auto_8517 ?auto_8526 ) ( AVAILABLE ?auto_8517 ) ( SURFACE-AT ?auto_8493 ?auto_8526 ) ( ON ?auto_8493 ?auto_8531 ) ( CLEAR ?auto_8493 ) ( not ( = ?auto_8492 ?auto_8493 ) ) ( not ( = ?auto_8492 ?auto_8531 ) ) ( not ( = ?auto_8493 ?auto_8531 ) ) ( not ( = ?auto_8504 ?auto_8517 ) ) ( SURFACE-AT ?auto_8491 ?auto_8505 ) ( CLEAR ?auto_8491 ) ( IS-CRATE ?auto_8492 ) ( AVAILABLE ?auto_8504 ) ( AVAILABLE ?auto_8528 ) ( SURFACE-AT ?auto_8492 ?auto_8530 ) ( ON ?auto_8492 ?auto_8511 ) ( CLEAR ?auto_8492 ) ( TRUCK-AT ?auto_8503 ?auto_8505 ) ( not ( = ?auto_8491 ?auto_8492 ) ) ( not ( = ?auto_8491 ?auto_8511 ) ) ( not ( = ?auto_8492 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8493 ) ) ( not ( = ?auto_8491 ?auto_8531 ) ) ( not ( = ?auto_8493 ?auto_8511 ) ) ( not ( = ?auto_8526 ?auto_8530 ) ) ( not ( = ?auto_8517 ?auto_8528 ) ) ( not ( = ?auto_8531 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8494 ) ) ( not ( = ?auto_8491 ?auto_8527 ) ) ( not ( = ?auto_8492 ?auto_8494 ) ) ( not ( = ?auto_8492 ?auto_8527 ) ) ( not ( = ?auto_8494 ?auto_8531 ) ) ( not ( = ?auto_8494 ?auto_8511 ) ) ( not ( = ?auto_8522 ?auto_8526 ) ) ( not ( = ?auto_8522 ?auto_8530 ) ) ( not ( = ?auto_8524 ?auto_8517 ) ) ( not ( = ?auto_8524 ?auto_8528 ) ) ( not ( = ?auto_8527 ?auto_8531 ) ) ( not ( = ?auto_8527 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8495 ) ) ( not ( = ?auto_8491 ?auto_8523 ) ) ( not ( = ?auto_8492 ?auto_8495 ) ) ( not ( = ?auto_8492 ?auto_8523 ) ) ( not ( = ?auto_8493 ?auto_8495 ) ) ( not ( = ?auto_8493 ?auto_8523 ) ) ( not ( = ?auto_8495 ?auto_8527 ) ) ( not ( = ?auto_8495 ?auto_8531 ) ) ( not ( = ?auto_8495 ?auto_8511 ) ) ( not ( = ?auto_8523 ?auto_8527 ) ) ( not ( = ?auto_8523 ?auto_8531 ) ) ( not ( = ?auto_8523 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8496 ) ) ( not ( = ?auto_8491 ?auto_8518 ) ) ( not ( = ?auto_8492 ?auto_8496 ) ) ( not ( = ?auto_8492 ?auto_8518 ) ) ( not ( = ?auto_8493 ?auto_8496 ) ) ( not ( = ?auto_8493 ?auto_8518 ) ) ( not ( = ?auto_8494 ?auto_8496 ) ) ( not ( = ?auto_8494 ?auto_8518 ) ) ( not ( = ?auto_8496 ?auto_8523 ) ) ( not ( = ?auto_8496 ?auto_8527 ) ) ( not ( = ?auto_8496 ?auto_8531 ) ) ( not ( = ?auto_8496 ?auto_8511 ) ) ( not ( = ?auto_8514 ?auto_8530 ) ) ( not ( = ?auto_8514 ?auto_8522 ) ) ( not ( = ?auto_8514 ?auto_8526 ) ) ( not ( = ?auto_8529 ?auto_8528 ) ) ( not ( = ?auto_8529 ?auto_8524 ) ) ( not ( = ?auto_8529 ?auto_8517 ) ) ( not ( = ?auto_8518 ?auto_8523 ) ) ( not ( = ?auto_8518 ?auto_8527 ) ) ( not ( = ?auto_8518 ?auto_8531 ) ) ( not ( = ?auto_8518 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8497 ) ) ( not ( = ?auto_8491 ?auto_8519 ) ) ( not ( = ?auto_8492 ?auto_8497 ) ) ( not ( = ?auto_8492 ?auto_8519 ) ) ( not ( = ?auto_8493 ?auto_8497 ) ) ( not ( = ?auto_8493 ?auto_8519 ) ) ( not ( = ?auto_8494 ?auto_8497 ) ) ( not ( = ?auto_8494 ?auto_8519 ) ) ( not ( = ?auto_8495 ?auto_8497 ) ) ( not ( = ?auto_8495 ?auto_8519 ) ) ( not ( = ?auto_8497 ?auto_8518 ) ) ( not ( = ?auto_8497 ?auto_8523 ) ) ( not ( = ?auto_8497 ?auto_8527 ) ) ( not ( = ?auto_8497 ?auto_8531 ) ) ( not ( = ?auto_8497 ?auto_8511 ) ) ( not ( = ?auto_8515 ?auto_8514 ) ) ( not ( = ?auto_8515 ?auto_8530 ) ) ( not ( = ?auto_8515 ?auto_8522 ) ) ( not ( = ?auto_8515 ?auto_8526 ) ) ( not ( = ?auto_8532 ?auto_8529 ) ) ( not ( = ?auto_8532 ?auto_8528 ) ) ( not ( = ?auto_8532 ?auto_8524 ) ) ( not ( = ?auto_8532 ?auto_8517 ) ) ( not ( = ?auto_8519 ?auto_8518 ) ) ( not ( = ?auto_8519 ?auto_8523 ) ) ( not ( = ?auto_8519 ?auto_8527 ) ) ( not ( = ?auto_8519 ?auto_8531 ) ) ( not ( = ?auto_8519 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8498 ) ) ( not ( = ?auto_8491 ?auto_8508 ) ) ( not ( = ?auto_8492 ?auto_8498 ) ) ( not ( = ?auto_8492 ?auto_8508 ) ) ( not ( = ?auto_8493 ?auto_8498 ) ) ( not ( = ?auto_8493 ?auto_8508 ) ) ( not ( = ?auto_8494 ?auto_8498 ) ) ( not ( = ?auto_8494 ?auto_8508 ) ) ( not ( = ?auto_8495 ?auto_8498 ) ) ( not ( = ?auto_8495 ?auto_8508 ) ) ( not ( = ?auto_8496 ?auto_8498 ) ) ( not ( = ?auto_8496 ?auto_8508 ) ) ( not ( = ?auto_8498 ?auto_8519 ) ) ( not ( = ?auto_8498 ?auto_8518 ) ) ( not ( = ?auto_8498 ?auto_8523 ) ) ( not ( = ?auto_8498 ?auto_8527 ) ) ( not ( = ?auto_8498 ?auto_8531 ) ) ( not ( = ?auto_8498 ?auto_8511 ) ) ( not ( = ?auto_8509 ?auto_8515 ) ) ( not ( = ?auto_8509 ?auto_8514 ) ) ( not ( = ?auto_8509 ?auto_8530 ) ) ( not ( = ?auto_8509 ?auto_8522 ) ) ( not ( = ?auto_8509 ?auto_8526 ) ) ( not ( = ?auto_8513 ?auto_8532 ) ) ( not ( = ?auto_8513 ?auto_8529 ) ) ( not ( = ?auto_8513 ?auto_8528 ) ) ( not ( = ?auto_8513 ?auto_8524 ) ) ( not ( = ?auto_8513 ?auto_8517 ) ) ( not ( = ?auto_8508 ?auto_8519 ) ) ( not ( = ?auto_8508 ?auto_8518 ) ) ( not ( = ?auto_8508 ?auto_8523 ) ) ( not ( = ?auto_8508 ?auto_8527 ) ) ( not ( = ?auto_8508 ?auto_8531 ) ) ( not ( = ?auto_8508 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8499 ) ) ( not ( = ?auto_8491 ?auto_8525 ) ) ( not ( = ?auto_8492 ?auto_8499 ) ) ( not ( = ?auto_8492 ?auto_8525 ) ) ( not ( = ?auto_8493 ?auto_8499 ) ) ( not ( = ?auto_8493 ?auto_8525 ) ) ( not ( = ?auto_8494 ?auto_8499 ) ) ( not ( = ?auto_8494 ?auto_8525 ) ) ( not ( = ?auto_8495 ?auto_8499 ) ) ( not ( = ?auto_8495 ?auto_8525 ) ) ( not ( = ?auto_8496 ?auto_8499 ) ) ( not ( = ?auto_8496 ?auto_8525 ) ) ( not ( = ?auto_8497 ?auto_8499 ) ) ( not ( = ?auto_8497 ?auto_8525 ) ) ( not ( = ?auto_8499 ?auto_8508 ) ) ( not ( = ?auto_8499 ?auto_8519 ) ) ( not ( = ?auto_8499 ?auto_8518 ) ) ( not ( = ?auto_8499 ?auto_8523 ) ) ( not ( = ?auto_8499 ?auto_8527 ) ) ( not ( = ?auto_8499 ?auto_8531 ) ) ( not ( = ?auto_8499 ?auto_8511 ) ) ( not ( = ?auto_8520 ?auto_8509 ) ) ( not ( = ?auto_8520 ?auto_8515 ) ) ( not ( = ?auto_8520 ?auto_8514 ) ) ( not ( = ?auto_8520 ?auto_8530 ) ) ( not ( = ?auto_8520 ?auto_8522 ) ) ( not ( = ?auto_8520 ?auto_8526 ) ) ( not ( = ?auto_8521 ?auto_8513 ) ) ( not ( = ?auto_8521 ?auto_8532 ) ) ( not ( = ?auto_8521 ?auto_8529 ) ) ( not ( = ?auto_8521 ?auto_8528 ) ) ( not ( = ?auto_8521 ?auto_8524 ) ) ( not ( = ?auto_8521 ?auto_8517 ) ) ( not ( = ?auto_8525 ?auto_8508 ) ) ( not ( = ?auto_8525 ?auto_8519 ) ) ( not ( = ?auto_8525 ?auto_8518 ) ) ( not ( = ?auto_8525 ?auto_8523 ) ) ( not ( = ?auto_8525 ?auto_8527 ) ) ( not ( = ?auto_8525 ?auto_8531 ) ) ( not ( = ?auto_8525 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8500 ) ) ( not ( = ?auto_8491 ?auto_8516 ) ) ( not ( = ?auto_8492 ?auto_8500 ) ) ( not ( = ?auto_8492 ?auto_8516 ) ) ( not ( = ?auto_8493 ?auto_8500 ) ) ( not ( = ?auto_8493 ?auto_8516 ) ) ( not ( = ?auto_8494 ?auto_8500 ) ) ( not ( = ?auto_8494 ?auto_8516 ) ) ( not ( = ?auto_8495 ?auto_8500 ) ) ( not ( = ?auto_8495 ?auto_8516 ) ) ( not ( = ?auto_8496 ?auto_8500 ) ) ( not ( = ?auto_8496 ?auto_8516 ) ) ( not ( = ?auto_8497 ?auto_8500 ) ) ( not ( = ?auto_8497 ?auto_8516 ) ) ( not ( = ?auto_8498 ?auto_8500 ) ) ( not ( = ?auto_8498 ?auto_8516 ) ) ( not ( = ?auto_8500 ?auto_8525 ) ) ( not ( = ?auto_8500 ?auto_8508 ) ) ( not ( = ?auto_8500 ?auto_8519 ) ) ( not ( = ?auto_8500 ?auto_8518 ) ) ( not ( = ?auto_8500 ?auto_8523 ) ) ( not ( = ?auto_8500 ?auto_8527 ) ) ( not ( = ?auto_8500 ?auto_8531 ) ) ( not ( = ?auto_8500 ?auto_8511 ) ) ( not ( = ?auto_8510 ?auto_8520 ) ) ( not ( = ?auto_8510 ?auto_8509 ) ) ( not ( = ?auto_8510 ?auto_8515 ) ) ( not ( = ?auto_8510 ?auto_8514 ) ) ( not ( = ?auto_8510 ?auto_8530 ) ) ( not ( = ?auto_8510 ?auto_8522 ) ) ( not ( = ?auto_8510 ?auto_8526 ) ) ( not ( = ?auto_8512 ?auto_8521 ) ) ( not ( = ?auto_8512 ?auto_8513 ) ) ( not ( = ?auto_8512 ?auto_8532 ) ) ( not ( = ?auto_8512 ?auto_8529 ) ) ( not ( = ?auto_8512 ?auto_8528 ) ) ( not ( = ?auto_8512 ?auto_8524 ) ) ( not ( = ?auto_8512 ?auto_8517 ) ) ( not ( = ?auto_8516 ?auto_8525 ) ) ( not ( = ?auto_8516 ?auto_8508 ) ) ( not ( = ?auto_8516 ?auto_8519 ) ) ( not ( = ?auto_8516 ?auto_8518 ) ) ( not ( = ?auto_8516 ?auto_8523 ) ) ( not ( = ?auto_8516 ?auto_8527 ) ) ( not ( = ?auto_8516 ?auto_8531 ) ) ( not ( = ?auto_8516 ?auto_8511 ) ) ( not ( = ?auto_8491 ?auto_8501 ) ) ( not ( = ?auto_8491 ?auto_8502 ) ) ( not ( = ?auto_8492 ?auto_8501 ) ) ( not ( = ?auto_8492 ?auto_8502 ) ) ( not ( = ?auto_8493 ?auto_8501 ) ) ( not ( = ?auto_8493 ?auto_8502 ) ) ( not ( = ?auto_8494 ?auto_8501 ) ) ( not ( = ?auto_8494 ?auto_8502 ) ) ( not ( = ?auto_8495 ?auto_8501 ) ) ( not ( = ?auto_8495 ?auto_8502 ) ) ( not ( = ?auto_8496 ?auto_8501 ) ) ( not ( = ?auto_8496 ?auto_8502 ) ) ( not ( = ?auto_8497 ?auto_8501 ) ) ( not ( = ?auto_8497 ?auto_8502 ) ) ( not ( = ?auto_8498 ?auto_8501 ) ) ( not ( = ?auto_8498 ?auto_8502 ) ) ( not ( = ?auto_8499 ?auto_8501 ) ) ( not ( = ?auto_8499 ?auto_8502 ) ) ( not ( = ?auto_8501 ?auto_8516 ) ) ( not ( = ?auto_8501 ?auto_8525 ) ) ( not ( = ?auto_8501 ?auto_8508 ) ) ( not ( = ?auto_8501 ?auto_8519 ) ) ( not ( = ?auto_8501 ?auto_8518 ) ) ( not ( = ?auto_8501 ?auto_8523 ) ) ( not ( = ?auto_8501 ?auto_8527 ) ) ( not ( = ?auto_8501 ?auto_8531 ) ) ( not ( = ?auto_8501 ?auto_8511 ) ) ( not ( = ?auto_8507 ?auto_8510 ) ) ( not ( = ?auto_8507 ?auto_8520 ) ) ( not ( = ?auto_8507 ?auto_8509 ) ) ( not ( = ?auto_8507 ?auto_8515 ) ) ( not ( = ?auto_8507 ?auto_8514 ) ) ( not ( = ?auto_8507 ?auto_8530 ) ) ( not ( = ?auto_8507 ?auto_8522 ) ) ( not ( = ?auto_8507 ?auto_8526 ) ) ( not ( = ?auto_8506 ?auto_8512 ) ) ( not ( = ?auto_8506 ?auto_8521 ) ) ( not ( = ?auto_8506 ?auto_8513 ) ) ( not ( = ?auto_8506 ?auto_8532 ) ) ( not ( = ?auto_8506 ?auto_8529 ) ) ( not ( = ?auto_8506 ?auto_8528 ) ) ( not ( = ?auto_8506 ?auto_8524 ) ) ( not ( = ?auto_8506 ?auto_8517 ) ) ( not ( = ?auto_8502 ?auto_8516 ) ) ( not ( = ?auto_8502 ?auto_8525 ) ) ( not ( = ?auto_8502 ?auto_8508 ) ) ( not ( = ?auto_8502 ?auto_8519 ) ) ( not ( = ?auto_8502 ?auto_8518 ) ) ( not ( = ?auto_8502 ?auto_8523 ) ) ( not ( = ?auto_8502 ?auto_8527 ) ) ( not ( = ?auto_8502 ?auto_8531 ) ) ( not ( = ?auto_8502 ?auto_8511 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8491 ?auto_8492 ?auto_8493 ?auto_8494 ?auto_8495 ?auto_8496 ?auto_8497 ?auto_8498 ?auto_8499 ?auto_8500 )
      ( MAKE-1CRATE ?auto_8500 ?auto_8501 )
      ( MAKE-10CRATE-VERIFY ?auto_8491 ?auto_8492 ?auto_8493 ?auto_8494 ?auto_8495 ?auto_8496 ?auto_8497 ?auto_8498 ?auto_8499 ?auto_8500 ?auto_8501 ) )
  )

)

