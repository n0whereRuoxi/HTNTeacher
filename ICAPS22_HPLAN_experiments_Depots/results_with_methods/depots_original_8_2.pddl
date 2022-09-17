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
      ?auto_36132 - SURFACE
      ?auto_36133 - SURFACE
    )
    :vars
    (
      ?auto_36134 - HOIST
      ?auto_36135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36134 ?auto_36135 ) ( SURFACE-AT ?auto_36133 ?auto_36135 ) ( CLEAR ?auto_36133 ) ( LIFTING ?auto_36134 ?auto_36132 ) ( IS-CRATE ?auto_36132 ) ( not ( = ?auto_36132 ?auto_36133 ) ) )
    :subtasks
    ( ( !DROP ?auto_36134 ?auto_36132 ?auto_36133 ?auto_36135 )
      ( MAKE-ON-VERIFY ?auto_36132 ?auto_36133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36136 - SURFACE
      ?auto_36137 - SURFACE
    )
    :vars
    (
      ?auto_36139 - HOIST
      ?auto_36138 - PLACE
      ?auto_36140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36139 ?auto_36138 ) ( SURFACE-AT ?auto_36137 ?auto_36138 ) ( CLEAR ?auto_36137 ) ( IS-CRATE ?auto_36136 ) ( not ( = ?auto_36136 ?auto_36137 ) ) ( TRUCK-AT ?auto_36140 ?auto_36138 ) ( AVAILABLE ?auto_36139 ) ( IN ?auto_36136 ?auto_36140 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36139 ?auto_36136 ?auto_36140 ?auto_36138 )
      ( MAKE-ON ?auto_36136 ?auto_36137 )
      ( MAKE-ON-VERIFY ?auto_36136 ?auto_36137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36141 - SURFACE
      ?auto_36142 - SURFACE
    )
    :vars
    (
      ?auto_36145 - HOIST
      ?auto_36143 - PLACE
      ?auto_36144 - TRUCK
      ?auto_36146 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36145 ?auto_36143 ) ( SURFACE-AT ?auto_36142 ?auto_36143 ) ( CLEAR ?auto_36142 ) ( IS-CRATE ?auto_36141 ) ( not ( = ?auto_36141 ?auto_36142 ) ) ( AVAILABLE ?auto_36145 ) ( IN ?auto_36141 ?auto_36144 ) ( TRUCK-AT ?auto_36144 ?auto_36146 ) ( not ( = ?auto_36146 ?auto_36143 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36144 ?auto_36146 ?auto_36143 )
      ( MAKE-ON ?auto_36141 ?auto_36142 )
      ( MAKE-ON-VERIFY ?auto_36141 ?auto_36142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36147 - SURFACE
      ?auto_36148 - SURFACE
    )
    :vars
    (
      ?auto_36151 - HOIST
      ?auto_36149 - PLACE
      ?auto_36150 - TRUCK
      ?auto_36152 - PLACE
      ?auto_36153 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36151 ?auto_36149 ) ( SURFACE-AT ?auto_36148 ?auto_36149 ) ( CLEAR ?auto_36148 ) ( IS-CRATE ?auto_36147 ) ( not ( = ?auto_36147 ?auto_36148 ) ) ( AVAILABLE ?auto_36151 ) ( TRUCK-AT ?auto_36150 ?auto_36152 ) ( not ( = ?auto_36152 ?auto_36149 ) ) ( HOIST-AT ?auto_36153 ?auto_36152 ) ( LIFTING ?auto_36153 ?auto_36147 ) ( not ( = ?auto_36151 ?auto_36153 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36153 ?auto_36147 ?auto_36150 ?auto_36152 )
      ( MAKE-ON ?auto_36147 ?auto_36148 )
      ( MAKE-ON-VERIFY ?auto_36147 ?auto_36148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36154 - SURFACE
      ?auto_36155 - SURFACE
    )
    :vars
    (
      ?auto_36156 - HOIST
      ?auto_36157 - PLACE
      ?auto_36158 - TRUCK
      ?auto_36159 - PLACE
      ?auto_36160 - HOIST
      ?auto_36161 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36156 ?auto_36157 ) ( SURFACE-AT ?auto_36155 ?auto_36157 ) ( CLEAR ?auto_36155 ) ( IS-CRATE ?auto_36154 ) ( not ( = ?auto_36154 ?auto_36155 ) ) ( AVAILABLE ?auto_36156 ) ( TRUCK-AT ?auto_36158 ?auto_36159 ) ( not ( = ?auto_36159 ?auto_36157 ) ) ( HOIST-AT ?auto_36160 ?auto_36159 ) ( not ( = ?auto_36156 ?auto_36160 ) ) ( AVAILABLE ?auto_36160 ) ( SURFACE-AT ?auto_36154 ?auto_36159 ) ( ON ?auto_36154 ?auto_36161 ) ( CLEAR ?auto_36154 ) ( not ( = ?auto_36154 ?auto_36161 ) ) ( not ( = ?auto_36155 ?auto_36161 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36160 ?auto_36154 ?auto_36161 ?auto_36159 )
      ( MAKE-ON ?auto_36154 ?auto_36155 )
      ( MAKE-ON-VERIFY ?auto_36154 ?auto_36155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36162 - SURFACE
      ?auto_36163 - SURFACE
    )
    :vars
    (
      ?auto_36167 - HOIST
      ?auto_36168 - PLACE
      ?auto_36165 - PLACE
      ?auto_36164 - HOIST
      ?auto_36169 - SURFACE
      ?auto_36166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36167 ?auto_36168 ) ( SURFACE-AT ?auto_36163 ?auto_36168 ) ( CLEAR ?auto_36163 ) ( IS-CRATE ?auto_36162 ) ( not ( = ?auto_36162 ?auto_36163 ) ) ( AVAILABLE ?auto_36167 ) ( not ( = ?auto_36165 ?auto_36168 ) ) ( HOIST-AT ?auto_36164 ?auto_36165 ) ( not ( = ?auto_36167 ?auto_36164 ) ) ( AVAILABLE ?auto_36164 ) ( SURFACE-AT ?auto_36162 ?auto_36165 ) ( ON ?auto_36162 ?auto_36169 ) ( CLEAR ?auto_36162 ) ( not ( = ?auto_36162 ?auto_36169 ) ) ( not ( = ?auto_36163 ?auto_36169 ) ) ( TRUCK-AT ?auto_36166 ?auto_36168 ) )
    :subtasks
    ( ( !DRIVE ?auto_36166 ?auto_36168 ?auto_36165 )
      ( MAKE-ON ?auto_36162 ?auto_36163 )
      ( MAKE-ON-VERIFY ?auto_36162 ?auto_36163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36172 - SURFACE
      ?auto_36173 - SURFACE
    )
    :vars
    (
      ?auto_36174 - HOIST
      ?auto_36175 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36174 ?auto_36175 ) ( SURFACE-AT ?auto_36173 ?auto_36175 ) ( CLEAR ?auto_36173 ) ( LIFTING ?auto_36174 ?auto_36172 ) ( IS-CRATE ?auto_36172 ) ( not ( = ?auto_36172 ?auto_36173 ) ) )
    :subtasks
    ( ( !DROP ?auto_36174 ?auto_36172 ?auto_36173 ?auto_36175 )
      ( MAKE-ON-VERIFY ?auto_36172 ?auto_36173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36176 - SURFACE
      ?auto_36177 - SURFACE
    )
    :vars
    (
      ?auto_36179 - HOIST
      ?auto_36178 - PLACE
      ?auto_36180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36179 ?auto_36178 ) ( SURFACE-AT ?auto_36177 ?auto_36178 ) ( CLEAR ?auto_36177 ) ( IS-CRATE ?auto_36176 ) ( not ( = ?auto_36176 ?auto_36177 ) ) ( TRUCK-AT ?auto_36180 ?auto_36178 ) ( AVAILABLE ?auto_36179 ) ( IN ?auto_36176 ?auto_36180 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36179 ?auto_36176 ?auto_36180 ?auto_36178 )
      ( MAKE-ON ?auto_36176 ?auto_36177 )
      ( MAKE-ON-VERIFY ?auto_36176 ?auto_36177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36181 - SURFACE
      ?auto_36182 - SURFACE
    )
    :vars
    (
      ?auto_36185 - HOIST
      ?auto_36183 - PLACE
      ?auto_36184 - TRUCK
      ?auto_36186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36185 ?auto_36183 ) ( SURFACE-AT ?auto_36182 ?auto_36183 ) ( CLEAR ?auto_36182 ) ( IS-CRATE ?auto_36181 ) ( not ( = ?auto_36181 ?auto_36182 ) ) ( AVAILABLE ?auto_36185 ) ( IN ?auto_36181 ?auto_36184 ) ( TRUCK-AT ?auto_36184 ?auto_36186 ) ( not ( = ?auto_36186 ?auto_36183 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36184 ?auto_36186 ?auto_36183 )
      ( MAKE-ON ?auto_36181 ?auto_36182 )
      ( MAKE-ON-VERIFY ?auto_36181 ?auto_36182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36187 - SURFACE
      ?auto_36188 - SURFACE
    )
    :vars
    (
      ?auto_36190 - HOIST
      ?auto_36191 - PLACE
      ?auto_36192 - TRUCK
      ?auto_36189 - PLACE
      ?auto_36193 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36190 ?auto_36191 ) ( SURFACE-AT ?auto_36188 ?auto_36191 ) ( CLEAR ?auto_36188 ) ( IS-CRATE ?auto_36187 ) ( not ( = ?auto_36187 ?auto_36188 ) ) ( AVAILABLE ?auto_36190 ) ( TRUCK-AT ?auto_36192 ?auto_36189 ) ( not ( = ?auto_36189 ?auto_36191 ) ) ( HOIST-AT ?auto_36193 ?auto_36189 ) ( LIFTING ?auto_36193 ?auto_36187 ) ( not ( = ?auto_36190 ?auto_36193 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36193 ?auto_36187 ?auto_36192 ?auto_36189 )
      ( MAKE-ON ?auto_36187 ?auto_36188 )
      ( MAKE-ON-VERIFY ?auto_36187 ?auto_36188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36194 - SURFACE
      ?auto_36195 - SURFACE
    )
    :vars
    (
      ?auto_36198 - HOIST
      ?auto_36196 - PLACE
      ?auto_36197 - TRUCK
      ?auto_36199 - PLACE
      ?auto_36200 - HOIST
      ?auto_36201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36198 ?auto_36196 ) ( SURFACE-AT ?auto_36195 ?auto_36196 ) ( CLEAR ?auto_36195 ) ( IS-CRATE ?auto_36194 ) ( not ( = ?auto_36194 ?auto_36195 ) ) ( AVAILABLE ?auto_36198 ) ( TRUCK-AT ?auto_36197 ?auto_36199 ) ( not ( = ?auto_36199 ?auto_36196 ) ) ( HOIST-AT ?auto_36200 ?auto_36199 ) ( not ( = ?auto_36198 ?auto_36200 ) ) ( AVAILABLE ?auto_36200 ) ( SURFACE-AT ?auto_36194 ?auto_36199 ) ( ON ?auto_36194 ?auto_36201 ) ( CLEAR ?auto_36194 ) ( not ( = ?auto_36194 ?auto_36201 ) ) ( not ( = ?auto_36195 ?auto_36201 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36200 ?auto_36194 ?auto_36201 ?auto_36199 )
      ( MAKE-ON ?auto_36194 ?auto_36195 )
      ( MAKE-ON-VERIFY ?auto_36194 ?auto_36195 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36202 - SURFACE
      ?auto_36203 - SURFACE
    )
    :vars
    (
      ?auto_36208 - HOIST
      ?auto_36209 - PLACE
      ?auto_36206 - PLACE
      ?auto_36204 - HOIST
      ?auto_36205 - SURFACE
      ?auto_36207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36208 ?auto_36209 ) ( SURFACE-AT ?auto_36203 ?auto_36209 ) ( CLEAR ?auto_36203 ) ( IS-CRATE ?auto_36202 ) ( not ( = ?auto_36202 ?auto_36203 ) ) ( AVAILABLE ?auto_36208 ) ( not ( = ?auto_36206 ?auto_36209 ) ) ( HOIST-AT ?auto_36204 ?auto_36206 ) ( not ( = ?auto_36208 ?auto_36204 ) ) ( AVAILABLE ?auto_36204 ) ( SURFACE-AT ?auto_36202 ?auto_36206 ) ( ON ?auto_36202 ?auto_36205 ) ( CLEAR ?auto_36202 ) ( not ( = ?auto_36202 ?auto_36205 ) ) ( not ( = ?auto_36203 ?auto_36205 ) ) ( TRUCK-AT ?auto_36207 ?auto_36209 ) )
    :subtasks
    ( ( !DRIVE ?auto_36207 ?auto_36209 ?auto_36206 )
      ( MAKE-ON ?auto_36202 ?auto_36203 )
      ( MAKE-ON-VERIFY ?auto_36202 ?auto_36203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36210 - SURFACE
      ?auto_36211 - SURFACE
    )
    :vars
    (
      ?auto_36214 - HOIST
      ?auto_36212 - PLACE
      ?auto_36215 - PLACE
      ?auto_36217 - HOIST
      ?auto_36216 - SURFACE
      ?auto_36213 - TRUCK
      ?auto_36218 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36214 ?auto_36212 ) ( IS-CRATE ?auto_36210 ) ( not ( = ?auto_36210 ?auto_36211 ) ) ( not ( = ?auto_36215 ?auto_36212 ) ) ( HOIST-AT ?auto_36217 ?auto_36215 ) ( not ( = ?auto_36214 ?auto_36217 ) ) ( AVAILABLE ?auto_36217 ) ( SURFACE-AT ?auto_36210 ?auto_36215 ) ( ON ?auto_36210 ?auto_36216 ) ( CLEAR ?auto_36210 ) ( not ( = ?auto_36210 ?auto_36216 ) ) ( not ( = ?auto_36211 ?auto_36216 ) ) ( TRUCK-AT ?auto_36213 ?auto_36212 ) ( SURFACE-AT ?auto_36218 ?auto_36212 ) ( CLEAR ?auto_36218 ) ( LIFTING ?auto_36214 ?auto_36211 ) ( IS-CRATE ?auto_36211 ) ( not ( = ?auto_36210 ?auto_36218 ) ) ( not ( = ?auto_36211 ?auto_36218 ) ) ( not ( = ?auto_36216 ?auto_36218 ) ) )
    :subtasks
    ( ( !DROP ?auto_36214 ?auto_36211 ?auto_36218 ?auto_36212 )
      ( MAKE-ON ?auto_36210 ?auto_36211 )
      ( MAKE-ON-VERIFY ?auto_36210 ?auto_36211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36219 - SURFACE
      ?auto_36220 - SURFACE
    )
    :vars
    (
      ?auto_36224 - HOIST
      ?auto_36221 - PLACE
      ?auto_36223 - PLACE
      ?auto_36222 - HOIST
      ?auto_36226 - SURFACE
      ?auto_36225 - TRUCK
      ?auto_36227 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36224 ?auto_36221 ) ( IS-CRATE ?auto_36219 ) ( not ( = ?auto_36219 ?auto_36220 ) ) ( not ( = ?auto_36223 ?auto_36221 ) ) ( HOIST-AT ?auto_36222 ?auto_36223 ) ( not ( = ?auto_36224 ?auto_36222 ) ) ( AVAILABLE ?auto_36222 ) ( SURFACE-AT ?auto_36219 ?auto_36223 ) ( ON ?auto_36219 ?auto_36226 ) ( CLEAR ?auto_36219 ) ( not ( = ?auto_36219 ?auto_36226 ) ) ( not ( = ?auto_36220 ?auto_36226 ) ) ( TRUCK-AT ?auto_36225 ?auto_36221 ) ( SURFACE-AT ?auto_36227 ?auto_36221 ) ( CLEAR ?auto_36227 ) ( IS-CRATE ?auto_36220 ) ( not ( = ?auto_36219 ?auto_36227 ) ) ( not ( = ?auto_36220 ?auto_36227 ) ) ( not ( = ?auto_36226 ?auto_36227 ) ) ( AVAILABLE ?auto_36224 ) ( IN ?auto_36220 ?auto_36225 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36224 ?auto_36220 ?auto_36225 ?auto_36221 )
      ( MAKE-ON ?auto_36219 ?auto_36220 )
      ( MAKE-ON-VERIFY ?auto_36219 ?auto_36220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36228 - SURFACE
      ?auto_36229 - SURFACE
    )
    :vars
    (
      ?auto_36236 - HOIST
      ?auto_36231 - PLACE
      ?auto_36232 - PLACE
      ?auto_36235 - HOIST
      ?auto_36230 - SURFACE
      ?auto_36233 - SURFACE
      ?auto_36234 - TRUCK
      ?auto_36237 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36236 ?auto_36231 ) ( IS-CRATE ?auto_36228 ) ( not ( = ?auto_36228 ?auto_36229 ) ) ( not ( = ?auto_36232 ?auto_36231 ) ) ( HOIST-AT ?auto_36235 ?auto_36232 ) ( not ( = ?auto_36236 ?auto_36235 ) ) ( AVAILABLE ?auto_36235 ) ( SURFACE-AT ?auto_36228 ?auto_36232 ) ( ON ?auto_36228 ?auto_36230 ) ( CLEAR ?auto_36228 ) ( not ( = ?auto_36228 ?auto_36230 ) ) ( not ( = ?auto_36229 ?auto_36230 ) ) ( SURFACE-AT ?auto_36233 ?auto_36231 ) ( CLEAR ?auto_36233 ) ( IS-CRATE ?auto_36229 ) ( not ( = ?auto_36228 ?auto_36233 ) ) ( not ( = ?auto_36229 ?auto_36233 ) ) ( not ( = ?auto_36230 ?auto_36233 ) ) ( AVAILABLE ?auto_36236 ) ( IN ?auto_36229 ?auto_36234 ) ( TRUCK-AT ?auto_36234 ?auto_36237 ) ( not ( = ?auto_36237 ?auto_36231 ) ) ( not ( = ?auto_36232 ?auto_36237 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36234 ?auto_36237 ?auto_36231 )
      ( MAKE-ON ?auto_36228 ?auto_36229 )
      ( MAKE-ON-VERIFY ?auto_36228 ?auto_36229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36238 - SURFACE
      ?auto_36239 - SURFACE
    )
    :vars
    (
      ?auto_36246 - HOIST
      ?auto_36240 - PLACE
      ?auto_36243 - PLACE
      ?auto_36241 - HOIST
      ?auto_36245 - SURFACE
      ?auto_36247 - SURFACE
      ?auto_36244 - TRUCK
      ?auto_36242 - PLACE
      ?auto_36248 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36246 ?auto_36240 ) ( IS-CRATE ?auto_36238 ) ( not ( = ?auto_36238 ?auto_36239 ) ) ( not ( = ?auto_36243 ?auto_36240 ) ) ( HOIST-AT ?auto_36241 ?auto_36243 ) ( not ( = ?auto_36246 ?auto_36241 ) ) ( AVAILABLE ?auto_36241 ) ( SURFACE-AT ?auto_36238 ?auto_36243 ) ( ON ?auto_36238 ?auto_36245 ) ( CLEAR ?auto_36238 ) ( not ( = ?auto_36238 ?auto_36245 ) ) ( not ( = ?auto_36239 ?auto_36245 ) ) ( SURFACE-AT ?auto_36247 ?auto_36240 ) ( CLEAR ?auto_36247 ) ( IS-CRATE ?auto_36239 ) ( not ( = ?auto_36238 ?auto_36247 ) ) ( not ( = ?auto_36239 ?auto_36247 ) ) ( not ( = ?auto_36245 ?auto_36247 ) ) ( AVAILABLE ?auto_36246 ) ( TRUCK-AT ?auto_36244 ?auto_36242 ) ( not ( = ?auto_36242 ?auto_36240 ) ) ( not ( = ?auto_36243 ?auto_36242 ) ) ( HOIST-AT ?auto_36248 ?auto_36242 ) ( LIFTING ?auto_36248 ?auto_36239 ) ( not ( = ?auto_36246 ?auto_36248 ) ) ( not ( = ?auto_36241 ?auto_36248 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36248 ?auto_36239 ?auto_36244 ?auto_36242 )
      ( MAKE-ON ?auto_36238 ?auto_36239 )
      ( MAKE-ON-VERIFY ?auto_36238 ?auto_36239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36249 - SURFACE
      ?auto_36250 - SURFACE
    )
    :vars
    (
      ?auto_36251 - HOIST
      ?auto_36256 - PLACE
      ?auto_36257 - PLACE
      ?auto_36259 - HOIST
      ?auto_36252 - SURFACE
      ?auto_36255 - SURFACE
      ?auto_36258 - TRUCK
      ?auto_36254 - PLACE
      ?auto_36253 - HOIST
      ?auto_36260 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36251 ?auto_36256 ) ( IS-CRATE ?auto_36249 ) ( not ( = ?auto_36249 ?auto_36250 ) ) ( not ( = ?auto_36257 ?auto_36256 ) ) ( HOIST-AT ?auto_36259 ?auto_36257 ) ( not ( = ?auto_36251 ?auto_36259 ) ) ( AVAILABLE ?auto_36259 ) ( SURFACE-AT ?auto_36249 ?auto_36257 ) ( ON ?auto_36249 ?auto_36252 ) ( CLEAR ?auto_36249 ) ( not ( = ?auto_36249 ?auto_36252 ) ) ( not ( = ?auto_36250 ?auto_36252 ) ) ( SURFACE-AT ?auto_36255 ?auto_36256 ) ( CLEAR ?auto_36255 ) ( IS-CRATE ?auto_36250 ) ( not ( = ?auto_36249 ?auto_36255 ) ) ( not ( = ?auto_36250 ?auto_36255 ) ) ( not ( = ?auto_36252 ?auto_36255 ) ) ( AVAILABLE ?auto_36251 ) ( TRUCK-AT ?auto_36258 ?auto_36254 ) ( not ( = ?auto_36254 ?auto_36256 ) ) ( not ( = ?auto_36257 ?auto_36254 ) ) ( HOIST-AT ?auto_36253 ?auto_36254 ) ( not ( = ?auto_36251 ?auto_36253 ) ) ( not ( = ?auto_36259 ?auto_36253 ) ) ( AVAILABLE ?auto_36253 ) ( SURFACE-AT ?auto_36250 ?auto_36254 ) ( ON ?auto_36250 ?auto_36260 ) ( CLEAR ?auto_36250 ) ( not ( = ?auto_36249 ?auto_36260 ) ) ( not ( = ?auto_36250 ?auto_36260 ) ) ( not ( = ?auto_36252 ?auto_36260 ) ) ( not ( = ?auto_36255 ?auto_36260 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36253 ?auto_36250 ?auto_36260 ?auto_36254 )
      ( MAKE-ON ?auto_36249 ?auto_36250 )
      ( MAKE-ON-VERIFY ?auto_36249 ?auto_36250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36261 - SURFACE
      ?auto_36262 - SURFACE
    )
    :vars
    (
      ?auto_36271 - HOIST
      ?auto_36267 - PLACE
      ?auto_36272 - PLACE
      ?auto_36268 - HOIST
      ?auto_36269 - SURFACE
      ?auto_36265 - SURFACE
      ?auto_36270 - PLACE
      ?auto_36263 - HOIST
      ?auto_36266 - SURFACE
      ?auto_36264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36271 ?auto_36267 ) ( IS-CRATE ?auto_36261 ) ( not ( = ?auto_36261 ?auto_36262 ) ) ( not ( = ?auto_36272 ?auto_36267 ) ) ( HOIST-AT ?auto_36268 ?auto_36272 ) ( not ( = ?auto_36271 ?auto_36268 ) ) ( AVAILABLE ?auto_36268 ) ( SURFACE-AT ?auto_36261 ?auto_36272 ) ( ON ?auto_36261 ?auto_36269 ) ( CLEAR ?auto_36261 ) ( not ( = ?auto_36261 ?auto_36269 ) ) ( not ( = ?auto_36262 ?auto_36269 ) ) ( SURFACE-AT ?auto_36265 ?auto_36267 ) ( CLEAR ?auto_36265 ) ( IS-CRATE ?auto_36262 ) ( not ( = ?auto_36261 ?auto_36265 ) ) ( not ( = ?auto_36262 ?auto_36265 ) ) ( not ( = ?auto_36269 ?auto_36265 ) ) ( AVAILABLE ?auto_36271 ) ( not ( = ?auto_36270 ?auto_36267 ) ) ( not ( = ?auto_36272 ?auto_36270 ) ) ( HOIST-AT ?auto_36263 ?auto_36270 ) ( not ( = ?auto_36271 ?auto_36263 ) ) ( not ( = ?auto_36268 ?auto_36263 ) ) ( AVAILABLE ?auto_36263 ) ( SURFACE-AT ?auto_36262 ?auto_36270 ) ( ON ?auto_36262 ?auto_36266 ) ( CLEAR ?auto_36262 ) ( not ( = ?auto_36261 ?auto_36266 ) ) ( not ( = ?auto_36262 ?auto_36266 ) ) ( not ( = ?auto_36269 ?auto_36266 ) ) ( not ( = ?auto_36265 ?auto_36266 ) ) ( TRUCK-AT ?auto_36264 ?auto_36267 ) )
    :subtasks
    ( ( !DRIVE ?auto_36264 ?auto_36267 ?auto_36270 )
      ( MAKE-ON ?auto_36261 ?auto_36262 )
      ( MAKE-ON-VERIFY ?auto_36261 ?auto_36262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36275 - SURFACE
      ?auto_36276 - SURFACE
    )
    :vars
    (
      ?auto_36277 - HOIST
      ?auto_36278 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36277 ?auto_36278 ) ( SURFACE-AT ?auto_36276 ?auto_36278 ) ( CLEAR ?auto_36276 ) ( LIFTING ?auto_36277 ?auto_36275 ) ( IS-CRATE ?auto_36275 ) ( not ( = ?auto_36275 ?auto_36276 ) ) )
    :subtasks
    ( ( !DROP ?auto_36277 ?auto_36275 ?auto_36276 ?auto_36278 )
      ( MAKE-ON-VERIFY ?auto_36275 ?auto_36276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36279 - SURFACE
      ?auto_36280 - SURFACE
    )
    :vars
    (
      ?auto_36282 - HOIST
      ?auto_36281 - PLACE
      ?auto_36283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36282 ?auto_36281 ) ( SURFACE-AT ?auto_36280 ?auto_36281 ) ( CLEAR ?auto_36280 ) ( IS-CRATE ?auto_36279 ) ( not ( = ?auto_36279 ?auto_36280 ) ) ( TRUCK-AT ?auto_36283 ?auto_36281 ) ( AVAILABLE ?auto_36282 ) ( IN ?auto_36279 ?auto_36283 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36282 ?auto_36279 ?auto_36283 ?auto_36281 )
      ( MAKE-ON ?auto_36279 ?auto_36280 )
      ( MAKE-ON-VERIFY ?auto_36279 ?auto_36280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36284 - SURFACE
      ?auto_36285 - SURFACE
    )
    :vars
    (
      ?auto_36287 - HOIST
      ?auto_36288 - PLACE
      ?auto_36286 - TRUCK
      ?auto_36289 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36287 ?auto_36288 ) ( SURFACE-AT ?auto_36285 ?auto_36288 ) ( CLEAR ?auto_36285 ) ( IS-CRATE ?auto_36284 ) ( not ( = ?auto_36284 ?auto_36285 ) ) ( AVAILABLE ?auto_36287 ) ( IN ?auto_36284 ?auto_36286 ) ( TRUCK-AT ?auto_36286 ?auto_36289 ) ( not ( = ?auto_36289 ?auto_36288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36286 ?auto_36289 ?auto_36288 )
      ( MAKE-ON ?auto_36284 ?auto_36285 )
      ( MAKE-ON-VERIFY ?auto_36284 ?auto_36285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36290 - SURFACE
      ?auto_36291 - SURFACE
    )
    :vars
    (
      ?auto_36294 - HOIST
      ?auto_36293 - PLACE
      ?auto_36295 - TRUCK
      ?auto_36292 - PLACE
      ?auto_36296 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36294 ?auto_36293 ) ( SURFACE-AT ?auto_36291 ?auto_36293 ) ( CLEAR ?auto_36291 ) ( IS-CRATE ?auto_36290 ) ( not ( = ?auto_36290 ?auto_36291 ) ) ( AVAILABLE ?auto_36294 ) ( TRUCK-AT ?auto_36295 ?auto_36292 ) ( not ( = ?auto_36292 ?auto_36293 ) ) ( HOIST-AT ?auto_36296 ?auto_36292 ) ( LIFTING ?auto_36296 ?auto_36290 ) ( not ( = ?auto_36294 ?auto_36296 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36296 ?auto_36290 ?auto_36295 ?auto_36292 )
      ( MAKE-ON ?auto_36290 ?auto_36291 )
      ( MAKE-ON-VERIFY ?auto_36290 ?auto_36291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36297 - SURFACE
      ?auto_36298 - SURFACE
    )
    :vars
    (
      ?auto_36301 - HOIST
      ?auto_36303 - PLACE
      ?auto_36299 - TRUCK
      ?auto_36302 - PLACE
      ?auto_36300 - HOIST
      ?auto_36304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36301 ?auto_36303 ) ( SURFACE-AT ?auto_36298 ?auto_36303 ) ( CLEAR ?auto_36298 ) ( IS-CRATE ?auto_36297 ) ( not ( = ?auto_36297 ?auto_36298 ) ) ( AVAILABLE ?auto_36301 ) ( TRUCK-AT ?auto_36299 ?auto_36302 ) ( not ( = ?auto_36302 ?auto_36303 ) ) ( HOIST-AT ?auto_36300 ?auto_36302 ) ( not ( = ?auto_36301 ?auto_36300 ) ) ( AVAILABLE ?auto_36300 ) ( SURFACE-AT ?auto_36297 ?auto_36302 ) ( ON ?auto_36297 ?auto_36304 ) ( CLEAR ?auto_36297 ) ( not ( = ?auto_36297 ?auto_36304 ) ) ( not ( = ?auto_36298 ?auto_36304 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36300 ?auto_36297 ?auto_36304 ?auto_36302 )
      ( MAKE-ON ?auto_36297 ?auto_36298 )
      ( MAKE-ON-VERIFY ?auto_36297 ?auto_36298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36305 - SURFACE
      ?auto_36306 - SURFACE
    )
    :vars
    (
      ?auto_36308 - HOIST
      ?auto_36309 - PLACE
      ?auto_36311 - PLACE
      ?auto_36312 - HOIST
      ?auto_36310 - SURFACE
      ?auto_36307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36308 ?auto_36309 ) ( SURFACE-AT ?auto_36306 ?auto_36309 ) ( CLEAR ?auto_36306 ) ( IS-CRATE ?auto_36305 ) ( not ( = ?auto_36305 ?auto_36306 ) ) ( AVAILABLE ?auto_36308 ) ( not ( = ?auto_36311 ?auto_36309 ) ) ( HOIST-AT ?auto_36312 ?auto_36311 ) ( not ( = ?auto_36308 ?auto_36312 ) ) ( AVAILABLE ?auto_36312 ) ( SURFACE-AT ?auto_36305 ?auto_36311 ) ( ON ?auto_36305 ?auto_36310 ) ( CLEAR ?auto_36305 ) ( not ( = ?auto_36305 ?auto_36310 ) ) ( not ( = ?auto_36306 ?auto_36310 ) ) ( TRUCK-AT ?auto_36307 ?auto_36309 ) )
    :subtasks
    ( ( !DRIVE ?auto_36307 ?auto_36309 ?auto_36311 )
      ( MAKE-ON ?auto_36305 ?auto_36306 )
      ( MAKE-ON-VERIFY ?auto_36305 ?auto_36306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36313 - SURFACE
      ?auto_36314 - SURFACE
    )
    :vars
    (
      ?auto_36316 - HOIST
      ?auto_36319 - PLACE
      ?auto_36320 - PLACE
      ?auto_36317 - HOIST
      ?auto_36318 - SURFACE
      ?auto_36315 - TRUCK
      ?auto_36321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36316 ?auto_36319 ) ( IS-CRATE ?auto_36313 ) ( not ( = ?auto_36313 ?auto_36314 ) ) ( not ( = ?auto_36320 ?auto_36319 ) ) ( HOIST-AT ?auto_36317 ?auto_36320 ) ( not ( = ?auto_36316 ?auto_36317 ) ) ( AVAILABLE ?auto_36317 ) ( SURFACE-AT ?auto_36313 ?auto_36320 ) ( ON ?auto_36313 ?auto_36318 ) ( CLEAR ?auto_36313 ) ( not ( = ?auto_36313 ?auto_36318 ) ) ( not ( = ?auto_36314 ?auto_36318 ) ) ( TRUCK-AT ?auto_36315 ?auto_36319 ) ( SURFACE-AT ?auto_36321 ?auto_36319 ) ( CLEAR ?auto_36321 ) ( LIFTING ?auto_36316 ?auto_36314 ) ( IS-CRATE ?auto_36314 ) ( not ( = ?auto_36313 ?auto_36321 ) ) ( not ( = ?auto_36314 ?auto_36321 ) ) ( not ( = ?auto_36318 ?auto_36321 ) ) )
    :subtasks
    ( ( !DROP ?auto_36316 ?auto_36314 ?auto_36321 ?auto_36319 )
      ( MAKE-ON ?auto_36313 ?auto_36314 )
      ( MAKE-ON-VERIFY ?auto_36313 ?auto_36314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36322 - SURFACE
      ?auto_36323 - SURFACE
    )
    :vars
    (
      ?auto_36326 - HOIST
      ?auto_36324 - PLACE
      ?auto_36325 - PLACE
      ?auto_36329 - HOIST
      ?auto_36330 - SURFACE
      ?auto_36328 - TRUCK
      ?auto_36327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36326 ?auto_36324 ) ( IS-CRATE ?auto_36322 ) ( not ( = ?auto_36322 ?auto_36323 ) ) ( not ( = ?auto_36325 ?auto_36324 ) ) ( HOIST-AT ?auto_36329 ?auto_36325 ) ( not ( = ?auto_36326 ?auto_36329 ) ) ( AVAILABLE ?auto_36329 ) ( SURFACE-AT ?auto_36322 ?auto_36325 ) ( ON ?auto_36322 ?auto_36330 ) ( CLEAR ?auto_36322 ) ( not ( = ?auto_36322 ?auto_36330 ) ) ( not ( = ?auto_36323 ?auto_36330 ) ) ( TRUCK-AT ?auto_36328 ?auto_36324 ) ( SURFACE-AT ?auto_36327 ?auto_36324 ) ( CLEAR ?auto_36327 ) ( IS-CRATE ?auto_36323 ) ( not ( = ?auto_36322 ?auto_36327 ) ) ( not ( = ?auto_36323 ?auto_36327 ) ) ( not ( = ?auto_36330 ?auto_36327 ) ) ( AVAILABLE ?auto_36326 ) ( IN ?auto_36323 ?auto_36328 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36326 ?auto_36323 ?auto_36328 ?auto_36324 )
      ( MAKE-ON ?auto_36322 ?auto_36323 )
      ( MAKE-ON-VERIFY ?auto_36322 ?auto_36323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36331 - SURFACE
      ?auto_36332 - SURFACE
    )
    :vars
    (
      ?auto_36337 - HOIST
      ?auto_36339 - PLACE
      ?auto_36336 - PLACE
      ?auto_36335 - HOIST
      ?auto_36338 - SURFACE
      ?auto_36333 - SURFACE
      ?auto_36334 - TRUCK
      ?auto_36340 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36337 ?auto_36339 ) ( IS-CRATE ?auto_36331 ) ( not ( = ?auto_36331 ?auto_36332 ) ) ( not ( = ?auto_36336 ?auto_36339 ) ) ( HOIST-AT ?auto_36335 ?auto_36336 ) ( not ( = ?auto_36337 ?auto_36335 ) ) ( AVAILABLE ?auto_36335 ) ( SURFACE-AT ?auto_36331 ?auto_36336 ) ( ON ?auto_36331 ?auto_36338 ) ( CLEAR ?auto_36331 ) ( not ( = ?auto_36331 ?auto_36338 ) ) ( not ( = ?auto_36332 ?auto_36338 ) ) ( SURFACE-AT ?auto_36333 ?auto_36339 ) ( CLEAR ?auto_36333 ) ( IS-CRATE ?auto_36332 ) ( not ( = ?auto_36331 ?auto_36333 ) ) ( not ( = ?auto_36332 ?auto_36333 ) ) ( not ( = ?auto_36338 ?auto_36333 ) ) ( AVAILABLE ?auto_36337 ) ( IN ?auto_36332 ?auto_36334 ) ( TRUCK-AT ?auto_36334 ?auto_36340 ) ( not ( = ?auto_36340 ?auto_36339 ) ) ( not ( = ?auto_36336 ?auto_36340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36334 ?auto_36340 ?auto_36339 )
      ( MAKE-ON ?auto_36331 ?auto_36332 )
      ( MAKE-ON-VERIFY ?auto_36331 ?auto_36332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36341 - SURFACE
      ?auto_36342 - SURFACE
    )
    :vars
    (
      ?auto_36344 - HOIST
      ?auto_36349 - PLACE
      ?auto_36347 - PLACE
      ?auto_36350 - HOIST
      ?auto_36345 - SURFACE
      ?auto_36346 - SURFACE
      ?auto_36348 - TRUCK
      ?auto_36343 - PLACE
      ?auto_36351 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36344 ?auto_36349 ) ( IS-CRATE ?auto_36341 ) ( not ( = ?auto_36341 ?auto_36342 ) ) ( not ( = ?auto_36347 ?auto_36349 ) ) ( HOIST-AT ?auto_36350 ?auto_36347 ) ( not ( = ?auto_36344 ?auto_36350 ) ) ( AVAILABLE ?auto_36350 ) ( SURFACE-AT ?auto_36341 ?auto_36347 ) ( ON ?auto_36341 ?auto_36345 ) ( CLEAR ?auto_36341 ) ( not ( = ?auto_36341 ?auto_36345 ) ) ( not ( = ?auto_36342 ?auto_36345 ) ) ( SURFACE-AT ?auto_36346 ?auto_36349 ) ( CLEAR ?auto_36346 ) ( IS-CRATE ?auto_36342 ) ( not ( = ?auto_36341 ?auto_36346 ) ) ( not ( = ?auto_36342 ?auto_36346 ) ) ( not ( = ?auto_36345 ?auto_36346 ) ) ( AVAILABLE ?auto_36344 ) ( TRUCK-AT ?auto_36348 ?auto_36343 ) ( not ( = ?auto_36343 ?auto_36349 ) ) ( not ( = ?auto_36347 ?auto_36343 ) ) ( HOIST-AT ?auto_36351 ?auto_36343 ) ( LIFTING ?auto_36351 ?auto_36342 ) ( not ( = ?auto_36344 ?auto_36351 ) ) ( not ( = ?auto_36350 ?auto_36351 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36351 ?auto_36342 ?auto_36348 ?auto_36343 )
      ( MAKE-ON ?auto_36341 ?auto_36342 )
      ( MAKE-ON-VERIFY ?auto_36341 ?auto_36342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36352 - SURFACE
      ?auto_36353 - SURFACE
    )
    :vars
    (
      ?auto_36354 - HOIST
      ?auto_36355 - PLACE
      ?auto_36361 - PLACE
      ?auto_36357 - HOIST
      ?auto_36360 - SURFACE
      ?auto_36356 - SURFACE
      ?auto_36362 - TRUCK
      ?auto_36359 - PLACE
      ?auto_36358 - HOIST
      ?auto_36363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36354 ?auto_36355 ) ( IS-CRATE ?auto_36352 ) ( not ( = ?auto_36352 ?auto_36353 ) ) ( not ( = ?auto_36361 ?auto_36355 ) ) ( HOIST-AT ?auto_36357 ?auto_36361 ) ( not ( = ?auto_36354 ?auto_36357 ) ) ( AVAILABLE ?auto_36357 ) ( SURFACE-AT ?auto_36352 ?auto_36361 ) ( ON ?auto_36352 ?auto_36360 ) ( CLEAR ?auto_36352 ) ( not ( = ?auto_36352 ?auto_36360 ) ) ( not ( = ?auto_36353 ?auto_36360 ) ) ( SURFACE-AT ?auto_36356 ?auto_36355 ) ( CLEAR ?auto_36356 ) ( IS-CRATE ?auto_36353 ) ( not ( = ?auto_36352 ?auto_36356 ) ) ( not ( = ?auto_36353 ?auto_36356 ) ) ( not ( = ?auto_36360 ?auto_36356 ) ) ( AVAILABLE ?auto_36354 ) ( TRUCK-AT ?auto_36362 ?auto_36359 ) ( not ( = ?auto_36359 ?auto_36355 ) ) ( not ( = ?auto_36361 ?auto_36359 ) ) ( HOIST-AT ?auto_36358 ?auto_36359 ) ( not ( = ?auto_36354 ?auto_36358 ) ) ( not ( = ?auto_36357 ?auto_36358 ) ) ( AVAILABLE ?auto_36358 ) ( SURFACE-AT ?auto_36353 ?auto_36359 ) ( ON ?auto_36353 ?auto_36363 ) ( CLEAR ?auto_36353 ) ( not ( = ?auto_36352 ?auto_36363 ) ) ( not ( = ?auto_36353 ?auto_36363 ) ) ( not ( = ?auto_36360 ?auto_36363 ) ) ( not ( = ?auto_36356 ?auto_36363 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36358 ?auto_36353 ?auto_36363 ?auto_36359 )
      ( MAKE-ON ?auto_36352 ?auto_36353 )
      ( MAKE-ON-VERIFY ?auto_36352 ?auto_36353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36364 - SURFACE
      ?auto_36365 - SURFACE
    )
    :vars
    (
      ?auto_36368 - HOIST
      ?auto_36369 - PLACE
      ?auto_36375 - PLACE
      ?auto_36366 - HOIST
      ?auto_36371 - SURFACE
      ?auto_36373 - SURFACE
      ?auto_36370 - PLACE
      ?auto_36374 - HOIST
      ?auto_36372 - SURFACE
      ?auto_36367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36368 ?auto_36369 ) ( IS-CRATE ?auto_36364 ) ( not ( = ?auto_36364 ?auto_36365 ) ) ( not ( = ?auto_36375 ?auto_36369 ) ) ( HOIST-AT ?auto_36366 ?auto_36375 ) ( not ( = ?auto_36368 ?auto_36366 ) ) ( AVAILABLE ?auto_36366 ) ( SURFACE-AT ?auto_36364 ?auto_36375 ) ( ON ?auto_36364 ?auto_36371 ) ( CLEAR ?auto_36364 ) ( not ( = ?auto_36364 ?auto_36371 ) ) ( not ( = ?auto_36365 ?auto_36371 ) ) ( SURFACE-AT ?auto_36373 ?auto_36369 ) ( CLEAR ?auto_36373 ) ( IS-CRATE ?auto_36365 ) ( not ( = ?auto_36364 ?auto_36373 ) ) ( not ( = ?auto_36365 ?auto_36373 ) ) ( not ( = ?auto_36371 ?auto_36373 ) ) ( AVAILABLE ?auto_36368 ) ( not ( = ?auto_36370 ?auto_36369 ) ) ( not ( = ?auto_36375 ?auto_36370 ) ) ( HOIST-AT ?auto_36374 ?auto_36370 ) ( not ( = ?auto_36368 ?auto_36374 ) ) ( not ( = ?auto_36366 ?auto_36374 ) ) ( AVAILABLE ?auto_36374 ) ( SURFACE-AT ?auto_36365 ?auto_36370 ) ( ON ?auto_36365 ?auto_36372 ) ( CLEAR ?auto_36365 ) ( not ( = ?auto_36364 ?auto_36372 ) ) ( not ( = ?auto_36365 ?auto_36372 ) ) ( not ( = ?auto_36371 ?auto_36372 ) ) ( not ( = ?auto_36373 ?auto_36372 ) ) ( TRUCK-AT ?auto_36367 ?auto_36369 ) )
    :subtasks
    ( ( !DRIVE ?auto_36367 ?auto_36369 ?auto_36370 )
      ( MAKE-ON ?auto_36364 ?auto_36365 )
      ( MAKE-ON-VERIFY ?auto_36364 ?auto_36365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36376 - SURFACE
      ?auto_36377 - SURFACE
    )
    :vars
    (
      ?auto_36384 - HOIST
      ?auto_36379 - PLACE
      ?auto_36380 - PLACE
      ?auto_36381 - HOIST
      ?auto_36383 - SURFACE
      ?auto_36385 - SURFACE
      ?auto_36382 - PLACE
      ?auto_36386 - HOIST
      ?auto_36387 - SURFACE
      ?auto_36378 - TRUCK
      ?auto_36388 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36384 ?auto_36379 ) ( IS-CRATE ?auto_36376 ) ( not ( = ?auto_36376 ?auto_36377 ) ) ( not ( = ?auto_36380 ?auto_36379 ) ) ( HOIST-AT ?auto_36381 ?auto_36380 ) ( not ( = ?auto_36384 ?auto_36381 ) ) ( AVAILABLE ?auto_36381 ) ( SURFACE-AT ?auto_36376 ?auto_36380 ) ( ON ?auto_36376 ?auto_36383 ) ( CLEAR ?auto_36376 ) ( not ( = ?auto_36376 ?auto_36383 ) ) ( not ( = ?auto_36377 ?auto_36383 ) ) ( IS-CRATE ?auto_36377 ) ( not ( = ?auto_36376 ?auto_36385 ) ) ( not ( = ?auto_36377 ?auto_36385 ) ) ( not ( = ?auto_36383 ?auto_36385 ) ) ( not ( = ?auto_36382 ?auto_36379 ) ) ( not ( = ?auto_36380 ?auto_36382 ) ) ( HOIST-AT ?auto_36386 ?auto_36382 ) ( not ( = ?auto_36384 ?auto_36386 ) ) ( not ( = ?auto_36381 ?auto_36386 ) ) ( AVAILABLE ?auto_36386 ) ( SURFACE-AT ?auto_36377 ?auto_36382 ) ( ON ?auto_36377 ?auto_36387 ) ( CLEAR ?auto_36377 ) ( not ( = ?auto_36376 ?auto_36387 ) ) ( not ( = ?auto_36377 ?auto_36387 ) ) ( not ( = ?auto_36383 ?auto_36387 ) ) ( not ( = ?auto_36385 ?auto_36387 ) ) ( TRUCK-AT ?auto_36378 ?auto_36379 ) ( SURFACE-AT ?auto_36388 ?auto_36379 ) ( CLEAR ?auto_36388 ) ( LIFTING ?auto_36384 ?auto_36385 ) ( IS-CRATE ?auto_36385 ) ( not ( = ?auto_36376 ?auto_36388 ) ) ( not ( = ?auto_36377 ?auto_36388 ) ) ( not ( = ?auto_36383 ?auto_36388 ) ) ( not ( = ?auto_36385 ?auto_36388 ) ) ( not ( = ?auto_36387 ?auto_36388 ) ) )
    :subtasks
    ( ( !DROP ?auto_36384 ?auto_36385 ?auto_36388 ?auto_36379 )
      ( MAKE-ON ?auto_36376 ?auto_36377 )
      ( MAKE-ON-VERIFY ?auto_36376 ?auto_36377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36389 - SURFACE
      ?auto_36390 - SURFACE
    )
    :vars
    (
      ?auto_36391 - HOIST
      ?auto_36394 - PLACE
      ?auto_36392 - PLACE
      ?auto_36395 - HOIST
      ?auto_36397 - SURFACE
      ?auto_36399 - SURFACE
      ?auto_36401 - PLACE
      ?auto_36393 - HOIST
      ?auto_36398 - SURFACE
      ?auto_36400 - TRUCK
      ?auto_36396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36391 ?auto_36394 ) ( IS-CRATE ?auto_36389 ) ( not ( = ?auto_36389 ?auto_36390 ) ) ( not ( = ?auto_36392 ?auto_36394 ) ) ( HOIST-AT ?auto_36395 ?auto_36392 ) ( not ( = ?auto_36391 ?auto_36395 ) ) ( AVAILABLE ?auto_36395 ) ( SURFACE-AT ?auto_36389 ?auto_36392 ) ( ON ?auto_36389 ?auto_36397 ) ( CLEAR ?auto_36389 ) ( not ( = ?auto_36389 ?auto_36397 ) ) ( not ( = ?auto_36390 ?auto_36397 ) ) ( IS-CRATE ?auto_36390 ) ( not ( = ?auto_36389 ?auto_36399 ) ) ( not ( = ?auto_36390 ?auto_36399 ) ) ( not ( = ?auto_36397 ?auto_36399 ) ) ( not ( = ?auto_36401 ?auto_36394 ) ) ( not ( = ?auto_36392 ?auto_36401 ) ) ( HOIST-AT ?auto_36393 ?auto_36401 ) ( not ( = ?auto_36391 ?auto_36393 ) ) ( not ( = ?auto_36395 ?auto_36393 ) ) ( AVAILABLE ?auto_36393 ) ( SURFACE-AT ?auto_36390 ?auto_36401 ) ( ON ?auto_36390 ?auto_36398 ) ( CLEAR ?auto_36390 ) ( not ( = ?auto_36389 ?auto_36398 ) ) ( not ( = ?auto_36390 ?auto_36398 ) ) ( not ( = ?auto_36397 ?auto_36398 ) ) ( not ( = ?auto_36399 ?auto_36398 ) ) ( TRUCK-AT ?auto_36400 ?auto_36394 ) ( SURFACE-AT ?auto_36396 ?auto_36394 ) ( CLEAR ?auto_36396 ) ( IS-CRATE ?auto_36399 ) ( not ( = ?auto_36389 ?auto_36396 ) ) ( not ( = ?auto_36390 ?auto_36396 ) ) ( not ( = ?auto_36397 ?auto_36396 ) ) ( not ( = ?auto_36399 ?auto_36396 ) ) ( not ( = ?auto_36398 ?auto_36396 ) ) ( AVAILABLE ?auto_36391 ) ( IN ?auto_36399 ?auto_36400 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36391 ?auto_36399 ?auto_36400 ?auto_36394 )
      ( MAKE-ON ?auto_36389 ?auto_36390 )
      ( MAKE-ON-VERIFY ?auto_36389 ?auto_36390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36402 - SURFACE
      ?auto_36403 - SURFACE
    )
    :vars
    (
      ?auto_36409 - HOIST
      ?auto_36404 - PLACE
      ?auto_36412 - PLACE
      ?auto_36411 - HOIST
      ?auto_36405 - SURFACE
      ?auto_36407 - SURFACE
      ?auto_36414 - PLACE
      ?auto_36406 - HOIST
      ?auto_36413 - SURFACE
      ?auto_36410 - SURFACE
      ?auto_36408 - TRUCK
      ?auto_36415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36409 ?auto_36404 ) ( IS-CRATE ?auto_36402 ) ( not ( = ?auto_36402 ?auto_36403 ) ) ( not ( = ?auto_36412 ?auto_36404 ) ) ( HOIST-AT ?auto_36411 ?auto_36412 ) ( not ( = ?auto_36409 ?auto_36411 ) ) ( AVAILABLE ?auto_36411 ) ( SURFACE-AT ?auto_36402 ?auto_36412 ) ( ON ?auto_36402 ?auto_36405 ) ( CLEAR ?auto_36402 ) ( not ( = ?auto_36402 ?auto_36405 ) ) ( not ( = ?auto_36403 ?auto_36405 ) ) ( IS-CRATE ?auto_36403 ) ( not ( = ?auto_36402 ?auto_36407 ) ) ( not ( = ?auto_36403 ?auto_36407 ) ) ( not ( = ?auto_36405 ?auto_36407 ) ) ( not ( = ?auto_36414 ?auto_36404 ) ) ( not ( = ?auto_36412 ?auto_36414 ) ) ( HOIST-AT ?auto_36406 ?auto_36414 ) ( not ( = ?auto_36409 ?auto_36406 ) ) ( not ( = ?auto_36411 ?auto_36406 ) ) ( AVAILABLE ?auto_36406 ) ( SURFACE-AT ?auto_36403 ?auto_36414 ) ( ON ?auto_36403 ?auto_36413 ) ( CLEAR ?auto_36403 ) ( not ( = ?auto_36402 ?auto_36413 ) ) ( not ( = ?auto_36403 ?auto_36413 ) ) ( not ( = ?auto_36405 ?auto_36413 ) ) ( not ( = ?auto_36407 ?auto_36413 ) ) ( SURFACE-AT ?auto_36410 ?auto_36404 ) ( CLEAR ?auto_36410 ) ( IS-CRATE ?auto_36407 ) ( not ( = ?auto_36402 ?auto_36410 ) ) ( not ( = ?auto_36403 ?auto_36410 ) ) ( not ( = ?auto_36405 ?auto_36410 ) ) ( not ( = ?auto_36407 ?auto_36410 ) ) ( not ( = ?auto_36413 ?auto_36410 ) ) ( AVAILABLE ?auto_36409 ) ( IN ?auto_36407 ?auto_36408 ) ( TRUCK-AT ?auto_36408 ?auto_36415 ) ( not ( = ?auto_36415 ?auto_36404 ) ) ( not ( = ?auto_36412 ?auto_36415 ) ) ( not ( = ?auto_36414 ?auto_36415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36408 ?auto_36415 ?auto_36404 )
      ( MAKE-ON ?auto_36402 ?auto_36403 )
      ( MAKE-ON-VERIFY ?auto_36402 ?auto_36403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36416 - SURFACE
      ?auto_36417 - SURFACE
    )
    :vars
    (
      ?auto_36420 - HOIST
      ?auto_36429 - PLACE
      ?auto_36428 - PLACE
      ?auto_36421 - HOIST
      ?auto_36426 - SURFACE
      ?auto_36418 - SURFACE
      ?auto_36423 - PLACE
      ?auto_36425 - HOIST
      ?auto_36424 - SURFACE
      ?auto_36419 - SURFACE
      ?auto_36422 - TRUCK
      ?auto_36427 - PLACE
      ?auto_36430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36420 ?auto_36429 ) ( IS-CRATE ?auto_36416 ) ( not ( = ?auto_36416 ?auto_36417 ) ) ( not ( = ?auto_36428 ?auto_36429 ) ) ( HOIST-AT ?auto_36421 ?auto_36428 ) ( not ( = ?auto_36420 ?auto_36421 ) ) ( AVAILABLE ?auto_36421 ) ( SURFACE-AT ?auto_36416 ?auto_36428 ) ( ON ?auto_36416 ?auto_36426 ) ( CLEAR ?auto_36416 ) ( not ( = ?auto_36416 ?auto_36426 ) ) ( not ( = ?auto_36417 ?auto_36426 ) ) ( IS-CRATE ?auto_36417 ) ( not ( = ?auto_36416 ?auto_36418 ) ) ( not ( = ?auto_36417 ?auto_36418 ) ) ( not ( = ?auto_36426 ?auto_36418 ) ) ( not ( = ?auto_36423 ?auto_36429 ) ) ( not ( = ?auto_36428 ?auto_36423 ) ) ( HOIST-AT ?auto_36425 ?auto_36423 ) ( not ( = ?auto_36420 ?auto_36425 ) ) ( not ( = ?auto_36421 ?auto_36425 ) ) ( AVAILABLE ?auto_36425 ) ( SURFACE-AT ?auto_36417 ?auto_36423 ) ( ON ?auto_36417 ?auto_36424 ) ( CLEAR ?auto_36417 ) ( not ( = ?auto_36416 ?auto_36424 ) ) ( not ( = ?auto_36417 ?auto_36424 ) ) ( not ( = ?auto_36426 ?auto_36424 ) ) ( not ( = ?auto_36418 ?auto_36424 ) ) ( SURFACE-AT ?auto_36419 ?auto_36429 ) ( CLEAR ?auto_36419 ) ( IS-CRATE ?auto_36418 ) ( not ( = ?auto_36416 ?auto_36419 ) ) ( not ( = ?auto_36417 ?auto_36419 ) ) ( not ( = ?auto_36426 ?auto_36419 ) ) ( not ( = ?auto_36418 ?auto_36419 ) ) ( not ( = ?auto_36424 ?auto_36419 ) ) ( AVAILABLE ?auto_36420 ) ( TRUCK-AT ?auto_36422 ?auto_36427 ) ( not ( = ?auto_36427 ?auto_36429 ) ) ( not ( = ?auto_36428 ?auto_36427 ) ) ( not ( = ?auto_36423 ?auto_36427 ) ) ( HOIST-AT ?auto_36430 ?auto_36427 ) ( LIFTING ?auto_36430 ?auto_36418 ) ( not ( = ?auto_36420 ?auto_36430 ) ) ( not ( = ?auto_36421 ?auto_36430 ) ) ( not ( = ?auto_36425 ?auto_36430 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36430 ?auto_36418 ?auto_36422 ?auto_36427 )
      ( MAKE-ON ?auto_36416 ?auto_36417 )
      ( MAKE-ON-VERIFY ?auto_36416 ?auto_36417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36431 - SURFACE
      ?auto_36432 - SURFACE
    )
    :vars
    (
      ?auto_36444 - HOIST
      ?auto_36433 - PLACE
      ?auto_36439 - PLACE
      ?auto_36445 - HOIST
      ?auto_36440 - SURFACE
      ?auto_36441 - SURFACE
      ?auto_36435 - PLACE
      ?auto_36437 - HOIST
      ?auto_36442 - SURFACE
      ?auto_36436 - SURFACE
      ?auto_36443 - TRUCK
      ?auto_36434 - PLACE
      ?auto_36438 - HOIST
      ?auto_36446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36444 ?auto_36433 ) ( IS-CRATE ?auto_36431 ) ( not ( = ?auto_36431 ?auto_36432 ) ) ( not ( = ?auto_36439 ?auto_36433 ) ) ( HOIST-AT ?auto_36445 ?auto_36439 ) ( not ( = ?auto_36444 ?auto_36445 ) ) ( AVAILABLE ?auto_36445 ) ( SURFACE-AT ?auto_36431 ?auto_36439 ) ( ON ?auto_36431 ?auto_36440 ) ( CLEAR ?auto_36431 ) ( not ( = ?auto_36431 ?auto_36440 ) ) ( not ( = ?auto_36432 ?auto_36440 ) ) ( IS-CRATE ?auto_36432 ) ( not ( = ?auto_36431 ?auto_36441 ) ) ( not ( = ?auto_36432 ?auto_36441 ) ) ( not ( = ?auto_36440 ?auto_36441 ) ) ( not ( = ?auto_36435 ?auto_36433 ) ) ( not ( = ?auto_36439 ?auto_36435 ) ) ( HOIST-AT ?auto_36437 ?auto_36435 ) ( not ( = ?auto_36444 ?auto_36437 ) ) ( not ( = ?auto_36445 ?auto_36437 ) ) ( AVAILABLE ?auto_36437 ) ( SURFACE-AT ?auto_36432 ?auto_36435 ) ( ON ?auto_36432 ?auto_36442 ) ( CLEAR ?auto_36432 ) ( not ( = ?auto_36431 ?auto_36442 ) ) ( not ( = ?auto_36432 ?auto_36442 ) ) ( not ( = ?auto_36440 ?auto_36442 ) ) ( not ( = ?auto_36441 ?auto_36442 ) ) ( SURFACE-AT ?auto_36436 ?auto_36433 ) ( CLEAR ?auto_36436 ) ( IS-CRATE ?auto_36441 ) ( not ( = ?auto_36431 ?auto_36436 ) ) ( not ( = ?auto_36432 ?auto_36436 ) ) ( not ( = ?auto_36440 ?auto_36436 ) ) ( not ( = ?auto_36441 ?auto_36436 ) ) ( not ( = ?auto_36442 ?auto_36436 ) ) ( AVAILABLE ?auto_36444 ) ( TRUCK-AT ?auto_36443 ?auto_36434 ) ( not ( = ?auto_36434 ?auto_36433 ) ) ( not ( = ?auto_36439 ?auto_36434 ) ) ( not ( = ?auto_36435 ?auto_36434 ) ) ( HOIST-AT ?auto_36438 ?auto_36434 ) ( not ( = ?auto_36444 ?auto_36438 ) ) ( not ( = ?auto_36445 ?auto_36438 ) ) ( not ( = ?auto_36437 ?auto_36438 ) ) ( AVAILABLE ?auto_36438 ) ( SURFACE-AT ?auto_36441 ?auto_36434 ) ( ON ?auto_36441 ?auto_36446 ) ( CLEAR ?auto_36441 ) ( not ( = ?auto_36431 ?auto_36446 ) ) ( not ( = ?auto_36432 ?auto_36446 ) ) ( not ( = ?auto_36440 ?auto_36446 ) ) ( not ( = ?auto_36441 ?auto_36446 ) ) ( not ( = ?auto_36442 ?auto_36446 ) ) ( not ( = ?auto_36436 ?auto_36446 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36438 ?auto_36441 ?auto_36446 ?auto_36434 )
      ( MAKE-ON ?auto_36431 ?auto_36432 )
      ( MAKE-ON-VERIFY ?auto_36431 ?auto_36432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36447 - SURFACE
      ?auto_36448 - SURFACE
    )
    :vars
    (
      ?auto_36456 - HOIST
      ?auto_36461 - PLACE
      ?auto_36450 - PLACE
      ?auto_36458 - HOIST
      ?auto_36460 - SURFACE
      ?auto_36452 - SURFACE
      ?auto_36454 - PLACE
      ?auto_36459 - HOIST
      ?auto_36462 - SURFACE
      ?auto_36451 - SURFACE
      ?auto_36449 - PLACE
      ?auto_36453 - HOIST
      ?auto_36455 - SURFACE
      ?auto_36457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36456 ?auto_36461 ) ( IS-CRATE ?auto_36447 ) ( not ( = ?auto_36447 ?auto_36448 ) ) ( not ( = ?auto_36450 ?auto_36461 ) ) ( HOIST-AT ?auto_36458 ?auto_36450 ) ( not ( = ?auto_36456 ?auto_36458 ) ) ( AVAILABLE ?auto_36458 ) ( SURFACE-AT ?auto_36447 ?auto_36450 ) ( ON ?auto_36447 ?auto_36460 ) ( CLEAR ?auto_36447 ) ( not ( = ?auto_36447 ?auto_36460 ) ) ( not ( = ?auto_36448 ?auto_36460 ) ) ( IS-CRATE ?auto_36448 ) ( not ( = ?auto_36447 ?auto_36452 ) ) ( not ( = ?auto_36448 ?auto_36452 ) ) ( not ( = ?auto_36460 ?auto_36452 ) ) ( not ( = ?auto_36454 ?auto_36461 ) ) ( not ( = ?auto_36450 ?auto_36454 ) ) ( HOIST-AT ?auto_36459 ?auto_36454 ) ( not ( = ?auto_36456 ?auto_36459 ) ) ( not ( = ?auto_36458 ?auto_36459 ) ) ( AVAILABLE ?auto_36459 ) ( SURFACE-AT ?auto_36448 ?auto_36454 ) ( ON ?auto_36448 ?auto_36462 ) ( CLEAR ?auto_36448 ) ( not ( = ?auto_36447 ?auto_36462 ) ) ( not ( = ?auto_36448 ?auto_36462 ) ) ( not ( = ?auto_36460 ?auto_36462 ) ) ( not ( = ?auto_36452 ?auto_36462 ) ) ( SURFACE-AT ?auto_36451 ?auto_36461 ) ( CLEAR ?auto_36451 ) ( IS-CRATE ?auto_36452 ) ( not ( = ?auto_36447 ?auto_36451 ) ) ( not ( = ?auto_36448 ?auto_36451 ) ) ( not ( = ?auto_36460 ?auto_36451 ) ) ( not ( = ?auto_36452 ?auto_36451 ) ) ( not ( = ?auto_36462 ?auto_36451 ) ) ( AVAILABLE ?auto_36456 ) ( not ( = ?auto_36449 ?auto_36461 ) ) ( not ( = ?auto_36450 ?auto_36449 ) ) ( not ( = ?auto_36454 ?auto_36449 ) ) ( HOIST-AT ?auto_36453 ?auto_36449 ) ( not ( = ?auto_36456 ?auto_36453 ) ) ( not ( = ?auto_36458 ?auto_36453 ) ) ( not ( = ?auto_36459 ?auto_36453 ) ) ( AVAILABLE ?auto_36453 ) ( SURFACE-AT ?auto_36452 ?auto_36449 ) ( ON ?auto_36452 ?auto_36455 ) ( CLEAR ?auto_36452 ) ( not ( = ?auto_36447 ?auto_36455 ) ) ( not ( = ?auto_36448 ?auto_36455 ) ) ( not ( = ?auto_36460 ?auto_36455 ) ) ( not ( = ?auto_36452 ?auto_36455 ) ) ( not ( = ?auto_36462 ?auto_36455 ) ) ( not ( = ?auto_36451 ?auto_36455 ) ) ( TRUCK-AT ?auto_36457 ?auto_36461 ) )
    :subtasks
    ( ( !DRIVE ?auto_36457 ?auto_36461 ?auto_36449 )
      ( MAKE-ON ?auto_36447 ?auto_36448 )
      ( MAKE-ON-VERIFY ?auto_36447 ?auto_36448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36465 - SURFACE
      ?auto_36466 - SURFACE
    )
    :vars
    (
      ?auto_36467 - HOIST
      ?auto_36468 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36467 ?auto_36468 ) ( SURFACE-AT ?auto_36466 ?auto_36468 ) ( CLEAR ?auto_36466 ) ( LIFTING ?auto_36467 ?auto_36465 ) ( IS-CRATE ?auto_36465 ) ( not ( = ?auto_36465 ?auto_36466 ) ) )
    :subtasks
    ( ( !DROP ?auto_36467 ?auto_36465 ?auto_36466 ?auto_36468 )
      ( MAKE-ON-VERIFY ?auto_36465 ?auto_36466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36469 - SURFACE
      ?auto_36470 - SURFACE
    )
    :vars
    (
      ?auto_36472 - HOIST
      ?auto_36471 - PLACE
      ?auto_36473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36472 ?auto_36471 ) ( SURFACE-AT ?auto_36470 ?auto_36471 ) ( CLEAR ?auto_36470 ) ( IS-CRATE ?auto_36469 ) ( not ( = ?auto_36469 ?auto_36470 ) ) ( TRUCK-AT ?auto_36473 ?auto_36471 ) ( AVAILABLE ?auto_36472 ) ( IN ?auto_36469 ?auto_36473 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36472 ?auto_36469 ?auto_36473 ?auto_36471 )
      ( MAKE-ON ?auto_36469 ?auto_36470 )
      ( MAKE-ON-VERIFY ?auto_36469 ?auto_36470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36474 - SURFACE
      ?auto_36475 - SURFACE
    )
    :vars
    (
      ?auto_36476 - HOIST
      ?auto_36478 - PLACE
      ?auto_36477 - TRUCK
      ?auto_36479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36476 ?auto_36478 ) ( SURFACE-AT ?auto_36475 ?auto_36478 ) ( CLEAR ?auto_36475 ) ( IS-CRATE ?auto_36474 ) ( not ( = ?auto_36474 ?auto_36475 ) ) ( AVAILABLE ?auto_36476 ) ( IN ?auto_36474 ?auto_36477 ) ( TRUCK-AT ?auto_36477 ?auto_36479 ) ( not ( = ?auto_36479 ?auto_36478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36477 ?auto_36479 ?auto_36478 )
      ( MAKE-ON ?auto_36474 ?auto_36475 )
      ( MAKE-ON-VERIFY ?auto_36474 ?auto_36475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36480 - SURFACE
      ?auto_36481 - SURFACE
    )
    :vars
    (
      ?auto_36484 - HOIST
      ?auto_36482 - PLACE
      ?auto_36485 - TRUCK
      ?auto_36483 - PLACE
      ?auto_36486 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36484 ?auto_36482 ) ( SURFACE-AT ?auto_36481 ?auto_36482 ) ( CLEAR ?auto_36481 ) ( IS-CRATE ?auto_36480 ) ( not ( = ?auto_36480 ?auto_36481 ) ) ( AVAILABLE ?auto_36484 ) ( TRUCK-AT ?auto_36485 ?auto_36483 ) ( not ( = ?auto_36483 ?auto_36482 ) ) ( HOIST-AT ?auto_36486 ?auto_36483 ) ( LIFTING ?auto_36486 ?auto_36480 ) ( not ( = ?auto_36484 ?auto_36486 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36486 ?auto_36480 ?auto_36485 ?auto_36483 )
      ( MAKE-ON ?auto_36480 ?auto_36481 )
      ( MAKE-ON-VERIFY ?auto_36480 ?auto_36481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36487 - SURFACE
      ?auto_36488 - SURFACE
    )
    :vars
    (
      ?auto_36490 - HOIST
      ?auto_36492 - PLACE
      ?auto_36491 - TRUCK
      ?auto_36493 - PLACE
      ?auto_36489 - HOIST
      ?auto_36494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36490 ?auto_36492 ) ( SURFACE-AT ?auto_36488 ?auto_36492 ) ( CLEAR ?auto_36488 ) ( IS-CRATE ?auto_36487 ) ( not ( = ?auto_36487 ?auto_36488 ) ) ( AVAILABLE ?auto_36490 ) ( TRUCK-AT ?auto_36491 ?auto_36493 ) ( not ( = ?auto_36493 ?auto_36492 ) ) ( HOIST-AT ?auto_36489 ?auto_36493 ) ( not ( = ?auto_36490 ?auto_36489 ) ) ( AVAILABLE ?auto_36489 ) ( SURFACE-AT ?auto_36487 ?auto_36493 ) ( ON ?auto_36487 ?auto_36494 ) ( CLEAR ?auto_36487 ) ( not ( = ?auto_36487 ?auto_36494 ) ) ( not ( = ?auto_36488 ?auto_36494 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36489 ?auto_36487 ?auto_36494 ?auto_36493 )
      ( MAKE-ON ?auto_36487 ?auto_36488 )
      ( MAKE-ON-VERIFY ?auto_36487 ?auto_36488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36495 - SURFACE
      ?auto_36496 - SURFACE
    )
    :vars
    (
      ?auto_36498 - HOIST
      ?auto_36500 - PLACE
      ?auto_36502 - PLACE
      ?auto_36501 - HOIST
      ?auto_36497 - SURFACE
      ?auto_36499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36498 ?auto_36500 ) ( SURFACE-AT ?auto_36496 ?auto_36500 ) ( CLEAR ?auto_36496 ) ( IS-CRATE ?auto_36495 ) ( not ( = ?auto_36495 ?auto_36496 ) ) ( AVAILABLE ?auto_36498 ) ( not ( = ?auto_36502 ?auto_36500 ) ) ( HOIST-AT ?auto_36501 ?auto_36502 ) ( not ( = ?auto_36498 ?auto_36501 ) ) ( AVAILABLE ?auto_36501 ) ( SURFACE-AT ?auto_36495 ?auto_36502 ) ( ON ?auto_36495 ?auto_36497 ) ( CLEAR ?auto_36495 ) ( not ( = ?auto_36495 ?auto_36497 ) ) ( not ( = ?auto_36496 ?auto_36497 ) ) ( TRUCK-AT ?auto_36499 ?auto_36500 ) )
    :subtasks
    ( ( !DRIVE ?auto_36499 ?auto_36500 ?auto_36502 )
      ( MAKE-ON ?auto_36495 ?auto_36496 )
      ( MAKE-ON-VERIFY ?auto_36495 ?auto_36496 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36503 - SURFACE
      ?auto_36504 - SURFACE
    )
    :vars
    (
      ?auto_36509 - HOIST
      ?auto_36508 - PLACE
      ?auto_36506 - PLACE
      ?auto_36507 - HOIST
      ?auto_36505 - SURFACE
      ?auto_36510 - TRUCK
      ?auto_36511 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36509 ?auto_36508 ) ( IS-CRATE ?auto_36503 ) ( not ( = ?auto_36503 ?auto_36504 ) ) ( not ( = ?auto_36506 ?auto_36508 ) ) ( HOIST-AT ?auto_36507 ?auto_36506 ) ( not ( = ?auto_36509 ?auto_36507 ) ) ( AVAILABLE ?auto_36507 ) ( SURFACE-AT ?auto_36503 ?auto_36506 ) ( ON ?auto_36503 ?auto_36505 ) ( CLEAR ?auto_36503 ) ( not ( = ?auto_36503 ?auto_36505 ) ) ( not ( = ?auto_36504 ?auto_36505 ) ) ( TRUCK-AT ?auto_36510 ?auto_36508 ) ( SURFACE-AT ?auto_36511 ?auto_36508 ) ( CLEAR ?auto_36511 ) ( LIFTING ?auto_36509 ?auto_36504 ) ( IS-CRATE ?auto_36504 ) ( not ( = ?auto_36503 ?auto_36511 ) ) ( not ( = ?auto_36504 ?auto_36511 ) ) ( not ( = ?auto_36505 ?auto_36511 ) ) )
    :subtasks
    ( ( !DROP ?auto_36509 ?auto_36504 ?auto_36511 ?auto_36508 )
      ( MAKE-ON ?auto_36503 ?auto_36504 )
      ( MAKE-ON-VERIFY ?auto_36503 ?auto_36504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36512 - SURFACE
      ?auto_36513 - SURFACE
    )
    :vars
    (
      ?auto_36520 - HOIST
      ?auto_36519 - PLACE
      ?auto_36515 - PLACE
      ?auto_36514 - HOIST
      ?auto_36517 - SURFACE
      ?auto_36518 - TRUCK
      ?auto_36516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36520 ?auto_36519 ) ( IS-CRATE ?auto_36512 ) ( not ( = ?auto_36512 ?auto_36513 ) ) ( not ( = ?auto_36515 ?auto_36519 ) ) ( HOIST-AT ?auto_36514 ?auto_36515 ) ( not ( = ?auto_36520 ?auto_36514 ) ) ( AVAILABLE ?auto_36514 ) ( SURFACE-AT ?auto_36512 ?auto_36515 ) ( ON ?auto_36512 ?auto_36517 ) ( CLEAR ?auto_36512 ) ( not ( = ?auto_36512 ?auto_36517 ) ) ( not ( = ?auto_36513 ?auto_36517 ) ) ( TRUCK-AT ?auto_36518 ?auto_36519 ) ( SURFACE-AT ?auto_36516 ?auto_36519 ) ( CLEAR ?auto_36516 ) ( IS-CRATE ?auto_36513 ) ( not ( = ?auto_36512 ?auto_36516 ) ) ( not ( = ?auto_36513 ?auto_36516 ) ) ( not ( = ?auto_36517 ?auto_36516 ) ) ( AVAILABLE ?auto_36520 ) ( IN ?auto_36513 ?auto_36518 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36520 ?auto_36513 ?auto_36518 ?auto_36519 )
      ( MAKE-ON ?auto_36512 ?auto_36513 )
      ( MAKE-ON-VERIFY ?auto_36512 ?auto_36513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36521 - SURFACE
      ?auto_36522 - SURFACE
    )
    :vars
    (
      ?auto_36529 - HOIST
      ?auto_36523 - PLACE
      ?auto_36524 - PLACE
      ?auto_36527 - HOIST
      ?auto_36525 - SURFACE
      ?auto_36528 - SURFACE
      ?auto_36526 - TRUCK
      ?auto_36530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36529 ?auto_36523 ) ( IS-CRATE ?auto_36521 ) ( not ( = ?auto_36521 ?auto_36522 ) ) ( not ( = ?auto_36524 ?auto_36523 ) ) ( HOIST-AT ?auto_36527 ?auto_36524 ) ( not ( = ?auto_36529 ?auto_36527 ) ) ( AVAILABLE ?auto_36527 ) ( SURFACE-AT ?auto_36521 ?auto_36524 ) ( ON ?auto_36521 ?auto_36525 ) ( CLEAR ?auto_36521 ) ( not ( = ?auto_36521 ?auto_36525 ) ) ( not ( = ?auto_36522 ?auto_36525 ) ) ( SURFACE-AT ?auto_36528 ?auto_36523 ) ( CLEAR ?auto_36528 ) ( IS-CRATE ?auto_36522 ) ( not ( = ?auto_36521 ?auto_36528 ) ) ( not ( = ?auto_36522 ?auto_36528 ) ) ( not ( = ?auto_36525 ?auto_36528 ) ) ( AVAILABLE ?auto_36529 ) ( IN ?auto_36522 ?auto_36526 ) ( TRUCK-AT ?auto_36526 ?auto_36530 ) ( not ( = ?auto_36530 ?auto_36523 ) ) ( not ( = ?auto_36524 ?auto_36530 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36526 ?auto_36530 ?auto_36523 )
      ( MAKE-ON ?auto_36521 ?auto_36522 )
      ( MAKE-ON-VERIFY ?auto_36521 ?auto_36522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36531 - SURFACE
      ?auto_36532 - SURFACE
    )
    :vars
    (
      ?auto_36533 - HOIST
      ?auto_36534 - PLACE
      ?auto_36538 - PLACE
      ?auto_36537 - HOIST
      ?auto_36540 - SURFACE
      ?auto_36539 - SURFACE
      ?auto_36536 - TRUCK
      ?auto_36535 - PLACE
      ?auto_36541 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36533 ?auto_36534 ) ( IS-CRATE ?auto_36531 ) ( not ( = ?auto_36531 ?auto_36532 ) ) ( not ( = ?auto_36538 ?auto_36534 ) ) ( HOIST-AT ?auto_36537 ?auto_36538 ) ( not ( = ?auto_36533 ?auto_36537 ) ) ( AVAILABLE ?auto_36537 ) ( SURFACE-AT ?auto_36531 ?auto_36538 ) ( ON ?auto_36531 ?auto_36540 ) ( CLEAR ?auto_36531 ) ( not ( = ?auto_36531 ?auto_36540 ) ) ( not ( = ?auto_36532 ?auto_36540 ) ) ( SURFACE-AT ?auto_36539 ?auto_36534 ) ( CLEAR ?auto_36539 ) ( IS-CRATE ?auto_36532 ) ( not ( = ?auto_36531 ?auto_36539 ) ) ( not ( = ?auto_36532 ?auto_36539 ) ) ( not ( = ?auto_36540 ?auto_36539 ) ) ( AVAILABLE ?auto_36533 ) ( TRUCK-AT ?auto_36536 ?auto_36535 ) ( not ( = ?auto_36535 ?auto_36534 ) ) ( not ( = ?auto_36538 ?auto_36535 ) ) ( HOIST-AT ?auto_36541 ?auto_36535 ) ( LIFTING ?auto_36541 ?auto_36532 ) ( not ( = ?auto_36533 ?auto_36541 ) ) ( not ( = ?auto_36537 ?auto_36541 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36541 ?auto_36532 ?auto_36536 ?auto_36535 )
      ( MAKE-ON ?auto_36531 ?auto_36532 )
      ( MAKE-ON-VERIFY ?auto_36531 ?auto_36532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36542 - SURFACE
      ?auto_36543 - SURFACE
    )
    :vars
    (
      ?auto_36550 - HOIST
      ?auto_36551 - PLACE
      ?auto_36547 - PLACE
      ?auto_36549 - HOIST
      ?auto_36544 - SURFACE
      ?auto_36548 - SURFACE
      ?auto_36546 - TRUCK
      ?auto_36545 - PLACE
      ?auto_36552 - HOIST
      ?auto_36553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36550 ?auto_36551 ) ( IS-CRATE ?auto_36542 ) ( not ( = ?auto_36542 ?auto_36543 ) ) ( not ( = ?auto_36547 ?auto_36551 ) ) ( HOIST-AT ?auto_36549 ?auto_36547 ) ( not ( = ?auto_36550 ?auto_36549 ) ) ( AVAILABLE ?auto_36549 ) ( SURFACE-AT ?auto_36542 ?auto_36547 ) ( ON ?auto_36542 ?auto_36544 ) ( CLEAR ?auto_36542 ) ( not ( = ?auto_36542 ?auto_36544 ) ) ( not ( = ?auto_36543 ?auto_36544 ) ) ( SURFACE-AT ?auto_36548 ?auto_36551 ) ( CLEAR ?auto_36548 ) ( IS-CRATE ?auto_36543 ) ( not ( = ?auto_36542 ?auto_36548 ) ) ( not ( = ?auto_36543 ?auto_36548 ) ) ( not ( = ?auto_36544 ?auto_36548 ) ) ( AVAILABLE ?auto_36550 ) ( TRUCK-AT ?auto_36546 ?auto_36545 ) ( not ( = ?auto_36545 ?auto_36551 ) ) ( not ( = ?auto_36547 ?auto_36545 ) ) ( HOIST-AT ?auto_36552 ?auto_36545 ) ( not ( = ?auto_36550 ?auto_36552 ) ) ( not ( = ?auto_36549 ?auto_36552 ) ) ( AVAILABLE ?auto_36552 ) ( SURFACE-AT ?auto_36543 ?auto_36545 ) ( ON ?auto_36543 ?auto_36553 ) ( CLEAR ?auto_36543 ) ( not ( = ?auto_36542 ?auto_36553 ) ) ( not ( = ?auto_36543 ?auto_36553 ) ) ( not ( = ?auto_36544 ?auto_36553 ) ) ( not ( = ?auto_36548 ?auto_36553 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36552 ?auto_36543 ?auto_36553 ?auto_36545 )
      ( MAKE-ON ?auto_36542 ?auto_36543 )
      ( MAKE-ON-VERIFY ?auto_36542 ?auto_36543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36554 - SURFACE
      ?auto_36555 - SURFACE
    )
    :vars
    (
      ?auto_36562 - HOIST
      ?auto_36560 - PLACE
      ?auto_36563 - PLACE
      ?auto_36565 - HOIST
      ?auto_36559 - SURFACE
      ?auto_36557 - SURFACE
      ?auto_36561 - PLACE
      ?auto_36558 - HOIST
      ?auto_36564 - SURFACE
      ?auto_36556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36562 ?auto_36560 ) ( IS-CRATE ?auto_36554 ) ( not ( = ?auto_36554 ?auto_36555 ) ) ( not ( = ?auto_36563 ?auto_36560 ) ) ( HOIST-AT ?auto_36565 ?auto_36563 ) ( not ( = ?auto_36562 ?auto_36565 ) ) ( AVAILABLE ?auto_36565 ) ( SURFACE-AT ?auto_36554 ?auto_36563 ) ( ON ?auto_36554 ?auto_36559 ) ( CLEAR ?auto_36554 ) ( not ( = ?auto_36554 ?auto_36559 ) ) ( not ( = ?auto_36555 ?auto_36559 ) ) ( SURFACE-AT ?auto_36557 ?auto_36560 ) ( CLEAR ?auto_36557 ) ( IS-CRATE ?auto_36555 ) ( not ( = ?auto_36554 ?auto_36557 ) ) ( not ( = ?auto_36555 ?auto_36557 ) ) ( not ( = ?auto_36559 ?auto_36557 ) ) ( AVAILABLE ?auto_36562 ) ( not ( = ?auto_36561 ?auto_36560 ) ) ( not ( = ?auto_36563 ?auto_36561 ) ) ( HOIST-AT ?auto_36558 ?auto_36561 ) ( not ( = ?auto_36562 ?auto_36558 ) ) ( not ( = ?auto_36565 ?auto_36558 ) ) ( AVAILABLE ?auto_36558 ) ( SURFACE-AT ?auto_36555 ?auto_36561 ) ( ON ?auto_36555 ?auto_36564 ) ( CLEAR ?auto_36555 ) ( not ( = ?auto_36554 ?auto_36564 ) ) ( not ( = ?auto_36555 ?auto_36564 ) ) ( not ( = ?auto_36559 ?auto_36564 ) ) ( not ( = ?auto_36557 ?auto_36564 ) ) ( TRUCK-AT ?auto_36556 ?auto_36560 ) )
    :subtasks
    ( ( !DRIVE ?auto_36556 ?auto_36560 ?auto_36561 )
      ( MAKE-ON ?auto_36554 ?auto_36555 )
      ( MAKE-ON-VERIFY ?auto_36554 ?auto_36555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36566 - SURFACE
      ?auto_36567 - SURFACE
    )
    :vars
    (
      ?auto_36574 - HOIST
      ?auto_36577 - PLACE
      ?auto_36573 - PLACE
      ?auto_36569 - HOIST
      ?auto_36572 - SURFACE
      ?auto_36571 - SURFACE
      ?auto_36570 - PLACE
      ?auto_36575 - HOIST
      ?auto_36576 - SURFACE
      ?auto_36568 - TRUCK
      ?auto_36578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36574 ?auto_36577 ) ( IS-CRATE ?auto_36566 ) ( not ( = ?auto_36566 ?auto_36567 ) ) ( not ( = ?auto_36573 ?auto_36577 ) ) ( HOIST-AT ?auto_36569 ?auto_36573 ) ( not ( = ?auto_36574 ?auto_36569 ) ) ( AVAILABLE ?auto_36569 ) ( SURFACE-AT ?auto_36566 ?auto_36573 ) ( ON ?auto_36566 ?auto_36572 ) ( CLEAR ?auto_36566 ) ( not ( = ?auto_36566 ?auto_36572 ) ) ( not ( = ?auto_36567 ?auto_36572 ) ) ( IS-CRATE ?auto_36567 ) ( not ( = ?auto_36566 ?auto_36571 ) ) ( not ( = ?auto_36567 ?auto_36571 ) ) ( not ( = ?auto_36572 ?auto_36571 ) ) ( not ( = ?auto_36570 ?auto_36577 ) ) ( not ( = ?auto_36573 ?auto_36570 ) ) ( HOIST-AT ?auto_36575 ?auto_36570 ) ( not ( = ?auto_36574 ?auto_36575 ) ) ( not ( = ?auto_36569 ?auto_36575 ) ) ( AVAILABLE ?auto_36575 ) ( SURFACE-AT ?auto_36567 ?auto_36570 ) ( ON ?auto_36567 ?auto_36576 ) ( CLEAR ?auto_36567 ) ( not ( = ?auto_36566 ?auto_36576 ) ) ( not ( = ?auto_36567 ?auto_36576 ) ) ( not ( = ?auto_36572 ?auto_36576 ) ) ( not ( = ?auto_36571 ?auto_36576 ) ) ( TRUCK-AT ?auto_36568 ?auto_36577 ) ( SURFACE-AT ?auto_36578 ?auto_36577 ) ( CLEAR ?auto_36578 ) ( LIFTING ?auto_36574 ?auto_36571 ) ( IS-CRATE ?auto_36571 ) ( not ( = ?auto_36566 ?auto_36578 ) ) ( not ( = ?auto_36567 ?auto_36578 ) ) ( not ( = ?auto_36572 ?auto_36578 ) ) ( not ( = ?auto_36571 ?auto_36578 ) ) ( not ( = ?auto_36576 ?auto_36578 ) ) )
    :subtasks
    ( ( !DROP ?auto_36574 ?auto_36571 ?auto_36578 ?auto_36577 )
      ( MAKE-ON ?auto_36566 ?auto_36567 )
      ( MAKE-ON-VERIFY ?auto_36566 ?auto_36567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36579 - SURFACE
      ?auto_36580 - SURFACE
    )
    :vars
    (
      ?auto_36583 - HOIST
      ?auto_36591 - PLACE
      ?auto_36584 - PLACE
      ?auto_36589 - HOIST
      ?auto_36587 - SURFACE
      ?auto_36590 - SURFACE
      ?auto_36586 - PLACE
      ?auto_36588 - HOIST
      ?auto_36582 - SURFACE
      ?auto_36585 - TRUCK
      ?auto_36581 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36583 ?auto_36591 ) ( IS-CRATE ?auto_36579 ) ( not ( = ?auto_36579 ?auto_36580 ) ) ( not ( = ?auto_36584 ?auto_36591 ) ) ( HOIST-AT ?auto_36589 ?auto_36584 ) ( not ( = ?auto_36583 ?auto_36589 ) ) ( AVAILABLE ?auto_36589 ) ( SURFACE-AT ?auto_36579 ?auto_36584 ) ( ON ?auto_36579 ?auto_36587 ) ( CLEAR ?auto_36579 ) ( not ( = ?auto_36579 ?auto_36587 ) ) ( not ( = ?auto_36580 ?auto_36587 ) ) ( IS-CRATE ?auto_36580 ) ( not ( = ?auto_36579 ?auto_36590 ) ) ( not ( = ?auto_36580 ?auto_36590 ) ) ( not ( = ?auto_36587 ?auto_36590 ) ) ( not ( = ?auto_36586 ?auto_36591 ) ) ( not ( = ?auto_36584 ?auto_36586 ) ) ( HOIST-AT ?auto_36588 ?auto_36586 ) ( not ( = ?auto_36583 ?auto_36588 ) ) ( not ( = ?auto_36589 ?auto_36588 ) ) ( AVAILABLE ?auto_36588 ) ( SURFACE-AT ?auto_36580 ?auto_36586 ) ( ON ?auto_36580 ?auto_36582 ) ( CLEAR ?auto_36580 ) ( not ( = ?auto_36579 ?auto_36582 ) ) ( not ( = ?auto_36580 ?auto_36582 ) ) ( not ( = ?auto_36587 ?auto_36582 ) ) ( not ( = ?auto_36590 ?auto_36582 ) ) ( TRUCK-AT ?auto_36585 ?auto_36591 ) ( SURFACE-AT ?auto_36581 ?auto_36591 ) ( CLEAR ?auto_36581 ) ( IS-CRATE ?auto_36590 ) ( not ( = ?auto_36579 ?auto_36581 ) ) ( not ( = ?auto_36580 ?auto_36581 ) ) ( not ( = ?auto_36587 ?auto_36581 ) ) ( not ( = ?auto_36590 ?auto_36581 ) ) ( not ( = ?auto_36582 ?auto_36581 ) ) ( AVAILABLE ?auto_36583 ) ( IN ?auto_36590 ?auto_36585 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36583 ?auto_36590 ?auto_36585 ?auto_36591 )
      ( MAKE-ON ?auto_36579 ?auto_36580 )
      ( MAKE-ON-VERIFY ?auto_36579 ?auto_36580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36592 - SURFACE
      ?auto_36593 - SURFACE
    )
    :vars
    (
      ?auto_36600 - HOIST
      ?auto_36602 - PLACE
      ?auto_36595 - PLACE
      ?auto_36599 - HOIST
      ?auto_36603 - SURFACE
      ?auto_36597 - SURFACE
      ?auto_36604 - PLACE
      ?auto_36598 - HOIST
      ?auto_36596 - SURFACE
      ?auto_36594 - SURFACE
      ?auto_36601 - TRUCK
      ?auto_36605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36600 ?auto_36602 ) ( IS-CRATE ?auto_36592 ) ( not ( = ?auto_36592 ?auto_36593 ) ) ( not ( = ?auto_36595 ?auto_36602 ) ) ( HOIST-AT ?auto_36599 ?auto_36595 ) ( not ( = ?auto_36600 ?auto_36599 ) ) ( AVAILABLE ?auto_36599 ) ( SURFACE-AT ?auto_36592 ?auto_36595 ) ( ON ?auto_36592 ?auto_36603 ) ( CLEAR ?auto_36592 ) ( not ( = ?auto_36592 ?auto_36603 ) ) ( not ( = ?auto_36593 ?auto_36603 ) ) ( IS-CRATE ?auto_36593 ) ( not ( = ?auto_36592 ?auto_36597 ) ) ( not ( = ?auto_36593 ?auto_36597 ) ) ( not ( = ?auto_36603 ?auto_36597 ) ) ( not ( = ?auto_36604 ?auto_36602 ) ) ( not ( = ?auto_36595 ?auto_36604 ) ) ( HOIST-AT ?auto_36598 ?auto_36604 ) ( not ( = ?auto_36600 ?auto_36598 ) ) ( not ( = ?auto_36599 ?auto_36598 ) ) ( AVAILABLE ?auto_36598 ) ( SURFACE-AT ?auto_36593 ?auto_36604 ) ( ON ?auto_36593 ?auto_36596 ) ( CLEAR ?auto_36593 ) ( not ( = ?auto_36592 ?auto_36596 ) ) ( not ( = ?auto_36593 ?auto_36596 ) ) ( not ( = ?auto_36603 ?auto_36596 ) ) ( not ( = ?auto_36597 ?auto_36596 ) ) ( SURFACE-AT ?auto_36594 ?auto_36602 ) ( CLEAR ?auto_36594 ) ( IS-CRATE ?auto_36597 ) ( not ( = ?auto_36592 ?auto_36594 ) ) ( not ( = ?auto_36593 ?auto_36594 ) ) ( not ( = ?auto_36603 ?auto_36594 ) ) ( not ( = ?auto_36597 ?auto_36594 ) ) ( not ( = ?auto_36596 ?auto_36594 ) ) ( AVAILABLE ?auto_36600 ) ( IN ?auto_36597 ?auto_36601 ) ( TRUCK-AT ?auto_36601 ?auto_36605 ) ( not ( = ?auto_36605 ?auto_36602 ) ) ( not ( = ?auto_36595 ?auto_36605 ) ) ( not ( = ?auto_36604 ?auto_36605 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36601 ?auto_36605 ?auto_36602 )
      ( MAKE-ON ?auto_36592 ?auto_36593 )
      ( MAKE-ON-VERIFY ?auto_36592 ?auto_36593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36606 - SURFACE
      ?auto_36607 - SURFACE
    )
    :vars
    (
      ?auto_36618 - HOIST
      ?auto_36619 - PLACE
      ?auto_36611 - PLACE
      ?auto_36615 - HOIST
      ?auto_36608 - SURFACE
      ?auto_36616 - SURFACE
      ?auto_36613 - PLACE
      ?auto_36614 - HOIST
      ?auto_36609 - SURFACE
      ?auto_36612 - SURFACE
      ?auto_36610 - TRUCK
      ?auto_36617 - PLACE
      ?auto_36620 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36618 ?auto_36619 ) ( IS-CRATE ?auto_36606 ) ( not ( = ?auto_36606 ?auto_36607 ) ) ( not ( = ?auto_36611 ?auto_36619 ) ) ( HOIST-AT ?auto_36615 ?auto_36611 ) ( not ( = ?auto_36618 ?auto_36615 ) ) ( AVAILABLE ?auto_36615 ) ( SURFACE-AT ?auto_36606 ?auto_36611 ) ( ON ?auto_36606 ?auto_36608 ) ( CLEAR ?auto_36606 ) ( not ( = ?auto_36606 ?auto_36608 ) ) ( not ( = ?auto_36607 ?auto_36608 ) ) ( IS-CRATE ?auto_36607 ) ( not ( = ?auto_36606 ?auto_36616 ) ) ( not ( = ?auto_36607 ?auto_36616 ) ) ( not ( = ?auto_36608 ?auto_36616 ) ) ( not ( = ?auto_36613 ?auto_36619 ) ) ( not ( = ?auto_36611 ?auto_36613 ) ) ( HOIST-AT ?auto_36614 ?auto_36613 ) ( not ( = ?auto_36618 ?auto_36614 ) ) ( not ( = ?auto_36615 ?auto_36614 ) ) ( AVAILABLE ?auto_36614 ) ( SURFACE-AT ?auto_36607 ?auto_36613 ) ( ON ?auto_36607 ?auto_36609 ) ( CLEAR ?auto_36607 ) ( not ( = ?auto_36606 ?auto_36609 ) ) ( not ( = ?auto_36607 ?auto_36609 ) ) ( not ( = ?auto_36608 ?auto_36609 ) ) ( not ( = ?auto_36616 ?auto_36609 ) ) ( SURFACE-AT ?auto_36612 ?auto_36619 ) ( CLEAR ?auto_36612 ) ( IS-CRATE ?auto_36616 ) ( not ( = ?auto_36606 ?auto_36612 ) ) ( not ( = ?auto_36607 ?auto_36612 ) ) ( not ( = ?auto_36608 ?auto_36612 ) ) ( not ( = ?auto_36616 ?auto_36612 ) ) ( not ( = ?auto_36609 ?auto_36612 ) ) ( AVAILABLE ?auto_36618 ) ( TRUCK-AT ?auto_36610 ?auto_36617 ) ( not ( = ?auto_36617 ?auto_36619 ) ) ( not ( = ?auto_36611 ?auto_36617 ) ) ( not ( = ?auto_36613 ?auto_36617 ) ) ( HOIST-AT ?auto_36620 ?auto_36617 ) ( LIFTING ?auto_36620 ?auto_36616 ) ( not ( = ?auto_36618 ?auto_36620 ) ) ( not ( = ?auto_36615 ?auto_36620 ) ) ( not ( = ?auto_36614 ?auto_36620 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36620 ?auto_36616 ?auto_36610 ?auto_36617 )
      ( MAKE-ON ?auto_36606 ?auto_36607 )
      ( MAKE-ON-VERIFY ?auto_36606 ?auto_36607 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36621 - SURFACE
      ?auto_36622 - SURFACE
    )
    :vars
    (
      ?auto_36630 - HOIST
      ?auto_36627 - PLACE
      ?auto_36631 - PLACE
      ?auto_36628 - HOIST
      ?auto_36632 - SURFACE
      ?auto_36634 - SURFACE
      ?auto_36624 - PLACE
      ?auto_36633 - HOIST
      ?auto_36635 - SURFACE
      ?auto_36629 - SURFACE
      ?auto_36626 - TRUCK
      ?auto_36625 - PLACE
      ?auto_36623 - HOIST
      ?auto_36636 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36630 ?auto_36627 ) ( IS-CRATE ?auto_36621 ) ( not ( = ?auto_36621 ?auto_36622 ) ) ( not ( = ?auto_36631 ?auto_36627 ) ) ( HOIST-AT ?auto_36628 ?auto_36631 ) ( not ( = ?auto_36630 ?auto_36628 ) ) ( AVAILABLE ?auto_36628 ) ( SURFACE-AT ?auto_36621 ?auto_36631 ) ( ON ?auto_36621 ?auto_36632 ) ( CLEAR ?auto_36621 ) ( not ( = ?auto_36621 ?auto_36632 ) ) ( not ( = ?auto_36622 ?auto_36632 ) ) ( IS-CRATE ?auto_36622 ) ( not ( = ?auto_36621 ?auto_36634 ) ) ( not ( = ?auto_36622 ?auto_36634 ) ) ( not ( = ?auto_36632 ?auto_36634 ) ) ( not ( = ?auto_36624 ?auto_36627 ) ) ( not ( = ?auto_36631 ?auto_36624 ) ) ( HOIST-AT ?auto_36633 ?auto_36624 ) ( not ( = ?auto_36630 ?auto_36633 ) ) ( not ( = ?auto_36628 ?auto_36633 ) ) ( AVAILABLE ?auto_36633 ) ( SURFACE-AT ?auto_36622 ?auto_36624 ) ( ON ?auto_36622 ?auto_36635 ) ( CLEAR ?auto_36622 ) ( not ( = ?auto_36621 ?auto_36635 ) ) ( not ( = ?auto_36622 ?auto_36635 ) ) ( not ( = ?auto_36632 ?auto_36635 ) ) ( not ( = ?auto_36634 ?auto_36635 ) ) ( SURFACE-AT ?auto_36629 ?auto_36627 ) ( CLEAR ?auto_36629 ) ( IS-CRATE ?auto_36634 ) ( not ( = ?auto_36621 ?auto_36629 ) ) ( not ( = ?auto_36622 ?auto_36629 ) ) ( not ( = ?auto_36632 ?auto_36629 ) ) ( not ( = ?auto_36634 ?auto_36629 ) ) ( not ( = ?auto_36635 ?auto_36629 ) ) ( AVAILABLE ?auto_36630 ) ( TRUCK-AT ?auto_36626 ?auto_36625 ) ( not ( = ?auto_36625 ?auto_36627 ) ) ( not ( = ?auto_36631 ?auto_36625 ) ) ( not ( = ?auto_36624 ?auto_36625 ) ) ( HOIST-AT ?auto_36623 ?auto_36625 ) ( not ( = ?auto_36630 ?auto_36623 ) ) ( not ( = ?auto_36628 ?auto_36623 ) ) ( not ( = ?auto_36633 ?auto_36623 ) ) ( AVAILABLE ?auto_36623 ) ( SURFACE-AT ?auto_36634 ?auto_36625 ) ( ON ?auto_36634 ?auto_36636 ) ( CLEAR ?auto_36634 ) ( not ( = ?auto_36621 ?auto_36636 ) ) ( not ( = ?auto_36622 ?auto_36636 ) ) ( not ( = ?auto_36632 ?auto_36636 ) ) ( not ( = ?auto_36634 ?auto_36636 ) ) ( not ( = ?auto_36635 ?auto_36636 ) ) ( not ( = ?auto_36629 ?auto_36636 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36623 ?auto_36634 ?auto_36636 ?auto_36625 )
      ( MAKE-ON ?auto_36621 ?auto_36622 )
      ( MAKE-ON-VERIFY ?auto_36621 ?auto_36622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36637 - SURFACE
      ?auto_36638 - SURFACE
    )
    :vars
    (
      ?auto_36645 - HOIST
      ?auto_36646 - PLACE
      ?auto_36644 - PLACE
      ?auto_36643 - HOIST
      ?auto_36642 - SURFACE
      ?auto_36651 - SURFACE
      ?auto_36650 - PLACE
      ?auto_36647 - HOIST
      ?auto_36639 - SURFACE
      ?auto_36648 - SURFACE
      ?auto_36641 - PLACE
      ?auto_36649 - HOIST
      ?auto_36652 - SURFACE
      ?auto_36640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36645 ?auto_36646 ) ( IS-CRATE ?auto_36637 ) ( not ( = ?auto_36637 ?auto_36638 ) ) ( not ( = ?auto_36644 ?auto_36646 ) ) ( HOIST-AT ?auto_36643 ?auto_36644 ) ( not ( = ?auto_36645 ?auto_36643 ) ) ( AVAILABLE ?auto_36643 ) ( SURFACE-AT ?auto_36637 ?auto_36644 ) ( ON ?auto_36637 ?auto_36642 ) ( CLEAR ?auto_36637 ) ( not ( = ?auto_36637 ?auto_36642 ) ) ( not ( = ?auto_36638 ?auto_36642 ) ) ( IS-CRATE ?auto_36638 ) ( not ( = ?auto_36637 ?auto_36651 ) ) ( not ( = ?auto_36638 ?auto_36651 ) ) ( not ( = ?auto_36642 ?auto_36651 ) ) ( not ( = ?auto_36650 ?auto_36646 ) ) ( not ( = ?auto_36644 ?auto_36650 ) ) ( HOIST-AT ?auto_36647 ?auto_36650 ) ( not ( = ?auto_36645 ?auto_36647 ) ) ( not ( = ?auto_36643 ?auto_36647 ) ) ( AVAILABLE ?auto_36647 ) ( SURFACE-AT ?auto_36638 ?auto_36650 ) ( ON ?auto_36638 ?auto_36639 ) ( CLEAR ?auto_36638 ) ( not ( = ?auto_36637 ?auto_36639 ) ) ( not ( = ?auto_36638 ?auto_36639 ) ) ( not ( = ?auto_36642 ?auto_36639 ) ) ( not ( = ?auto_36651 ?auto_36639 ) ) ( SURFACE-AT ?auto_36648 ?auto_36646 ) ( CLEAR ?auto_36648 ) ( IS-CRATE ?auto_36651 ) ( not ( = ?auto_36637 ?auto_36648 ) ) ( not ( = ?auto_36638 ?auto_36648 ) ) ( not ( = ?auto_36642 ?auto_36648 ) ) ( not ( = ?auto_36651 ?auto_36648 ) ) ( not ( = ?auto_36639 ?auto_36648 ) ) ( AVAILABLE ?auto_36645 ) ( not ( = ?auto_36641 ?auto_36646 ) ) ( not ( = ?auto_36644 ?auto_36641 ) ) ( not ( = ?auto_36650 ?auto_36641 ) ) ( HOIST-AT ?auto_36649 ?auto_36641 ) ( not ( = ?auto_36645 ?auto_36649 ) ) ( not ( = ?auto_36643 ?auto_36649 ) ) ( not ( = ?auto_36647 ?auto_36649 ) ) ( AVAILABLE ?auto_36649 ) ( SURFACE-AT ?auto_36651 ?auto_36641 ) ( ON ?auto_36651 ?auto_36652 ) ( CLEAR ?auto_36651 ) ( not ( = ?auto_36637 ?auto_36652 ) ) ( not ( = ?auto_36638 ?auto_36652 ) ) ( not ( = ?auto_36642 ?auto_36652 ) ) ( not ( = ?auto_36651 ?auto_36652 ) ) ( not ( = ?auto_36639 ?auto_36652 ) ) ( not ( = ?auto_36648 ?auto_36652 ) ) ( TRUCK-AT ?auto_36640 ?auto_36646 ) )
    :subtasks
    ( ( !DRIVE ?auto_36640 ?auto_36646 ?auto_36641 )
      ( MAKE-ON ?auto_36637 ?auto_36638 )
      ( MAKE-ON-VERIFY ?auto_36637 ?auto_36638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36653 - SURFACE
      ?auto_36654 - SURFACE
    )
    :vars
    (
      ?auto_36659 - HOIST
      ?auto_36667 - PLACE
      ?auto_36663 - PLACE
      ?auto_36662 - HOIST
      ?auto_36661 - SURFACE
      ?auto_36664 - SURFACE
      ?auto_36668 - PLACE
      ?auto_36658 - HOIST
      ?auto_36665 - SURFACE
      ?auto_36656 - SURFACE
      ?auto_36655 - PLACE
      ?auto_36657 - HOIST
      ?auto_36666 - SURFACE
      ?auto_36660 - TRUCK
      ?auto_36669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36659 ?auto_36667 ) ( IS-CRATE ?auto_36653 ) ( not ( = ?auto_36653 ?auto_36654 ) ) ( not ( = ?auto_36663 ?auto_36667 ) ) ( HOIST-AT ?auto_36662 ?auto_36663 ) ( not ( = ?auto_36659 ?auto_36662 ) ) ( AVAILABLE ?auto_36662 ) ( SURFACE-AT ?auto_36653 ?auto_36663 ) ( ON ?auto_36653 ?auto_36661 ) ( CLEAR ?auto_36653 ) ( not ( = ?auto_36653 ?auto_36661 ) ) ( not ( = ?auto_36654 ?auto_36661 ) ) ( IS-CRATE ?auto_36654 ) ( not ( = ?auto_36653 ?auto_36664 ) ) ( not ( = ?auto_36654 ?auto_36664 ) ) ( not ( = ?auto_36661 ?auto_36664 ) ) ( not ( = ?auto_36668 ?auto_36667 ) ) ( not ( = ?auto_36663 ?auto_36668 ) ) ( HOIST-AT ?auto_36658 ?auto_36668 ) ( not ( = ?auto_36659 ?auto_36658 ) ) ( not ( = ?auto_36662 ?auto_36658 ) ) ( AVAILABLE ?auto_36658 ) ( SURFACE-AT ?auto_36654 ?auto_36668 ) ( ON ?auto_36654 ?auto_36665 ) ( CLEAR ?auto_36654 ) ( not ( = ?auto_36653 ?auto_36665 ) ) ( not ( = ?auto_36654 ?auto_36665 ) ) ( not ( = ?auto_36661 ?auto_36665 ) ) ( not ( = ?auto_36664 ?auto_36665 ) ) ( IS-CRATE ?auto_36664 ) ( not ( = ?auto_36653 ?auto_36656 ) ) ( not ( = ?auto_36654 ?auto_36656 ) ) ( not ( = ?auto_36661 ?auto_36656 ) ) ( not ( = ?auto_36664 ?auto_36656 ) ) ( not ( = ?auto_36665 ?auto_36656 ) ) ( not ( = ?auto_36655 ?auto_36667 ) ) ( not ( = ?auto_36663 ?auto_36655 ) ) ( not ( = ?auto_36668 ?auto_36655 ) ) ( HOIST-AT ?auto_36657 ?auto_36655 ) ( not ( = ?auto_36659 ?auto_36657 ) ) ( not ( = ?auto_36662 ?auto_36657 ) ) ( not ( = ?auto_36658 ?auto_36657 ) ) ( AVAILABLE ?auto_36657 ) ( SURFACE-AT ?auto_36664 ?auto_36655 ) ( ON ?auto_36664 ?auto_36666 ) ( CLEAR ?auto_36664 ) ( not ( = ?auto_36653 ?auto_36666 ) ) ( not ( = ?auto_36654 ?auto_36666 ) ) ( not ( = ?auto_36661 ?auto_36666 ) ) ( not ( = ?auto_36664 ?auto_36666 ) ) ( not ( = ?auto_36665 ?auto_36666 ) ) ( not ( = ?auto_36656 ?auto_36666 ) ) ( TRUCK-AT ?auto_36660 ?auto_36667 ) ( SURFACE-AT ?auto_36669 ?auto_36667 ) ( CLEAR ?auto_36669 ) ( LIFTING ?auto_36659 ?auto_36656 ) ( IS-CRATE ?auto_36656 ) ( not ( = ?auto_36653 ?auto_36669 ) ) ( not ( = ?auto_36654 ?auto_36669 ) ) ( not ( = ?auto_36661 ?auto_36669 ) ) ( not ( = ?auto_36664 ?auto_36669 ) ) ( not ( = ?auto_36665 ?auto_36669 ) ) ( not ( = ?auto_36656 ?auto_36669 ) ) ( not ( = ?auto_36666 ?auto_36669 ) ) )
    :subtasks
    ( ( !DROP ?auto_36659 ?auto_36656 ?auto_36669 ?auto_36667 )
      ( MAKE-ON ?auto_36653 ?auto_36654 )
      ( MAKE-ON-VERIFY ?auto_36653 ?auto_36654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36670 - SURFACE
      ?auto_36671 - SURFACE
    )
    :vars
    (
      ?auto_36686 - HOIST
      ?auto_36672 - PLACE
      ?auto_36684 - PLACE
      ?auto_36678 - HOIST
      ?auto_36685 - SURFACE
      ?auto_36682 - SURFACE
      ?auto_36679 - PLACE
      ?auto_36680 - HOIST
      ?auto_36676 - SURFACE
      ?auto_36675 - SURFACE
      ?auto_36681 - PLACE
      ?auto_36674 - HOIST
      ?auto_36673 - SURFACE
      ?auto_36677 - TRUCK
      ?auto_36683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36686 ?auto_36672 ) ( IS-CRATE ?auto_36670 ) ( not ( = ?auto_36670 ?auto_36671 ) ) ( not ( = ?auto_36684 ?auto_36672 ) ) ( HOIST-AT ?auto_36678 ?auto_36684 ) ( not ( = ?auto_36686 ?auto_36678 ) ) ( AVAILABLE ?auto_36678 ) ( SURFACE-AT ?auto_36670 ?auto_36684 ) ( ON ?auto_36670 ?auto_36685 ) ( CLEAR ?auto_36670 ) ( not ( = ?auto_36670 ?auto_36685 ) ) ( not ( = ?auto_36671 ?auto_36685 ) ) ( IS-CRATE ?auto_36671 ) ( not ( = ?auto_36670 ?auto_36682 ) ) ( not ( = ?auto_36671 ?auto_36682 ) ) ( not ( = ?auto_36685 ?auto_36682 ) ) ( not ( = ?auto_36679 ?auto_36672 ) ) ( not ( = ?auto_36684 ?auto_36679 ) ) ( HOIST-AT ?auto_36680 ?auto_36679 ) ( not ( = ?auto_36686 ?auto_36680 ) ) ( not ( = ?auto_36678 ?auto_36680 ) ) ( AVAILABLE ?auto_36680 ) ( SURFACE-AT ?auto_36671 ?auto_36679 ) ( ON ?auto_36671 ?auto_36676 ) ( CLEAR ?auto_36671 ) ( not ( = ?auto_36670 ?auto_36676 ) ) ( not ( = ?auto_36671 ?auto_36676 ) ) ( not ( = ?auto_36685 ?auto_36676 ) ) ( not ( = ?auto_36682 ?auto_36676 ) ) ( IS-CRATE ?auto_36682 ) ( not ( = ?auto_36670 ?auto_36675 ) ) ( not ( = ?auto_36671 ?auto_36675 ) ) ( not ( = ?auto_36685 ?auto_36675 ) ) ( not ( = ?auto_36682 ?auto_36675 ) ) ( not ( = ?auto_36676 ?auto_36675 ) ) ( not ( = ?auto_36681 ?auto_36672 ) ) ( not ( = ?auto_36684 ?auto_36681 ) ) ( not ( = ?auto_36679 ?auto_36681 ) ) ( HOIST-AT ?auto_36674 ?auto_36681 ) ( not ( = ?auto_36686 ?auto_36674 ) ) ( not ( = ?auto_36678 ?auto_36674 ) ) ( not ( = ?auto_36680 ?auto_36674 ) ) ( AVAILABLE ?auto_36674 ) ( SURFACE-AT ?auto_36682 ?auto_36681 ) ( ON ?auto_36682 ?auto_36673 ) ( CLEAR ?auto_36682 ) ( not ( = ?auto_36670 ?auto_36673 ) ) ( not ( = ?auto_36671 ?auto_36673 ) ) ( not ( = ?auto_36685 ?auto_36673 ) ) ( not ( = ?auto_36682 ?auto_36673 ) ) ( not ( = ?auto_36676 ?auto_36673 ) ) ( not ( = ?auto_36675 ?auto_36673 ) ) ( TRUCK-AT ?auto_36677 ?auto_36672 ) ( SURFACE-AT ?auto_36683 ?auto_36672 ) ( CLEAR ?auto_36683 ) ( IS-CRATE ?auto_36675 ) ( not ( = ?auto_36670 ?auto_36683 ) ) ( not ( = ?auto_36671 ?auto_36683 ) ) ( not ( = ?auto_36685 ?auto_36683 ) ) ( not ( = ?auto_36682 ?auto_36683 ) ) ( not ( = ?auto_36676 ?auto_36683 ) ) ( not ( = ?auto_36675 ?auto_36683 ) ) ( not ( = ?auto_36673 ?auto_36683 ) ) ( AVAILABLE ?auto_36686 ) ( IN ?auto_36675 ?auto_36677 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36686 ?auto_36675 ?auto_36677 ?auto_36672 )
      ( MAKE-ON ?auto_36670 ?auto_36671 )
      ( MAKE-ON-VERIFY ?auto_36670 ?auto_36671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36687 - SURFACE
      ?auto_36688 - SURFACE
    )
    :vars
    (
      ?auto_36699 - HOIST
      ?auto_36703 - PLACE
      ?auto_36702 - PLACE
      ?auto_36696 - HOIST
      ?auto_36698 - SURFACE
      ?auto_36701 - SURFACE
      ?auto_36700 - PLACE
      ?auto_36689 - HOIST
      ?auto_36695 - SURFACE
      ?auto_36691 - SURFACE
      ?auto_36694 - PLACE
      ?auto_36690 - HOIST
      ?auto_36693 - SURFACE
      ?auto_36692 - SURFACE
      ?auto_36697 - TRUCK
      ?auto_36704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36699 ?auto_36703 ) ( IS-CRATE ?auto_36687 ) ( not ( = ?auto_36687 ?auto_36688 ) ) ( not ( = ?auto_36702 ?auto_36703 ) ) ( HOIST-AT ?auto_36696 ?auto_36702 ) ( not ( = ?auto_36699 ?auto_36696 ) ) ( AVAILABLE ?auto_36696 ) ( SURFACE-AT ?auto_36687 ?auto_36702 ) ( ON ?auto_36687 ?auto_36698 ) ( CLEAR ?auto_36687 ) ( not ( = ?auto_36687 ?auto_36698 ) ) ( not ( = ?auto_36688 ?auto_36698 ) ) ( IS-CRATE ?auto_36688 ) ( not ( = ?auto_36687 ?auto_36701 ) ) ( not ( = ?auto_36688 ?auto_36701 ) ) ( not ( = ?auto_36698 ?auto_36701 ) ) ( not ( = ?auto_36700 ?auto_36703 ) ) ( not ( = ?auto_36702 ?auto_36700 ) ) ( HOIST-AT ?auto_36689 ?auto_36700 ) ( not ( = ?auto_36699 ?auto_36689 ) ) ( not ( = ?auto_36696 ?auto_36689 ) ) ( AVAILABLE ?auto_36689 ) ( SURFACE-AT ?auto_36688 ?auto_36700 ) ( ON ?auto_36688 ?auto_36695 ) ( CLEAR ?auto_36688 ) ( not ( = ?auto_36687 ?auto_36695 ) ) ( not ( = ?auto_36688 ?auto_36695 ) ) ( not ( = ?auto_36698 ?auto_36695 ) ) ( not ( = ?auto_36701 ?auto_36695 ) ) ( IS-CRATE ?auto_36701 ) ( not ( = ?auto_36687 ?auto_36691 ) ) ( not ( = ?auto_36688 ?auto_36691 ) ) ( not ( = ?auto_36698 ?auto_36691 ) ) ( not ( = ?auto_36701 ?auto_36691 ) ) ( not ( = ?auto_36695 ?auto_36691 ) ) ( not ( = ?auto_36694 ?auto_36703 ) ) ( not ( = ?auto_36702 ?auto_36694 ) ) ( not ( = ?auto_36700 ?auto_36694 ) ) ( HOIST-AT ?auto_36690 ?auto_36694 ) ( not ( = ?auto_36699 ?auto_36690 ) ) ( not ( = ?auto_36696 ?auto_36690 ) ) ( not ( = ?auto_36689 ?auto_36690 ) ) ( AVAILABLE ?auto_36690 ) ( SURFACE-AT ?auto_36701 ?auto_36694 ) ( ON ?auto_36701 ?auto_36693 ) ( CLEAR ?auto_36701 ) ( not ( = ?auto_36687 ?auto_36693 ) ) ( not ( = ?auto_36688 ?auto_36693 ) ) ( not ( = ?auto_36698 ?auto_36693 ) ) ( not ( = ?auto_36701 ?auto_36693 ) ) ( not ( = ?auto_36695 ?auto_36693 ) ) ( not ( = ?auto_36691 ?auto_36693 ) ) ( SURFACE-AT ?auto_36692 ?auto_36703 ) ( CLEAR ?auto_36692 ) ( IS-CRATE ?auto_36691 ) ( not ( = ?auto_36687 ?auto_36692 ) ) ( not ( = ?auto_36688 ?auto_36692 ) ) ( not ( = ?auto_36698 ?auto_36692 ) ) ( not ( = ?auto_36701 ?auto_36692 ) ) ( not ( = ?auto_36695 ?auto_36692 ) ) ( not ( = ?auto_36691 ?auto_36692 ) ) ( not ( = ?auto_36693 ?auto_36692 ) ) ( AVAILABLE ?auto_36699 ) ( IN ?auto_36691 ?auto_36697 ) ( TRUCK-AT ?auto_36697 ?auto_36704 ) ( not ( = ?auto_36704 ?auto_36703 ) ) ( not ( = ?auto_36702 ?auto_36704 ) ) ( not ( = ?auto_36700 ?auto_36704 ) ) ( not ( = ?auto_36694 ?auto_36704 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36697 ?auto_36704 ?auto_36703 )
      ( MAKE-ON ?auto_36687 ?auto_36688 )
      ( MAKE-ON-VERIFY ?auto_36687 ?auto_36688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36705 - SURFACE
      ?auto_36706 - SURFACE
    )
    :vars
    (
      ?auto_36715 - HOIST
      ?auto_36721 - PLACE
      ?auto_36722 - PLACE
      ?auto_36717 - HOIST
      ?auto_36711 - SURFACE
      ?auto_36720 - SURFACE
      ?auto_36713 - PLACE
      ?auto_36712 - HOIST
      ?auto_36709 - SURFACE
      ?auto_36714 - SURFACE
      ?auto_36718 - PLACE
      ?auto_36719 - HOIST
      ?auto_36707 - SURFACE
      ?auto_36710 - SURFACE
      ?auto_36716 - TRUCK
      ?auto_36708 - PLACE
      ?auto_36723 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36715 ?auto_36721 ) ( IS-CRATE ?auto_36705 ) ( not ( = ?auto_36705 ?auto_36706 ) ) ( not ( = ?auto_36722 ?auto_36721 ) ) ( HOIST-AT ?auto_36717 ?auto_36722 ) ( not ( = ?auto_36715 ?auto_36717 ) ) ( AVAILABLE ?auto_36717 ) ( SURFACE-AT ?auto_36705 ?auto_36722 ) ( ON ?auto_36705 ?auto_36711 ) ( CLEAR ?auto_36705 ) ( not ( = ?auto_36705 ?auto_36711 ) ) ( not ( = ?auto_36706 ?auto_36711 ) ) ( IS-CRATE ?auto_36706 ) ( not ( = ?auto_36705 ?auto_36720 ) ) ( not ( = ?auto_36706 ?auto_36720 ) ) ( not ( = ?auto_36711 ?auto_36720 ) ) ( not ( = ?auto_36713 ?auto_36721 ) ) ( not ( = ?auto_36722 ?auto_36713 ) ) ( HOIST-AT ?auto_36712 ?auto_36713 ) ( not ( = ?auto_36715 ?auto_36712 ) ) ( not ( = ?auto_36717 ?auto_36712 ) ) ( AVAILABLE ?auto_36712 ) ( SURFACE-AT ?auto_36706 ?auto_36713 ) ( ON ?auto_36706 ?auto_36709 ) ( CLEAR ?auto_36706 ) ( not ( = ?auto_36705 ?auto_36709 ) ) ( not ( = ?auto_36706 ?auto_36709 ) ) ( not ( = ?auto_36711 ?auto_36709 ) ) ( not ( = ?auto_36720 ?auto_36709 ) ) ( IS-CRATE ?auto_36720 ) ( not ( = ?auto_36705 ?auto_36714 ) ) ( not ( = ?auto_36706 ?auto_36714 ) ) ( not ( = ?auto_36711 ?auto_36714 ) ) ( not ( = ?auto_36720 ?auto_36714 ) ) ( not ( = ?auto_36709 ?auto_36714 ) ) ( not ( = ?auto_36718 ?auto_36721 ) ) ( not ( = ?auto_36722 ?auto_36718 ) ) ( not ( = ?auto_36713 ?auto_36718 ) ) ( HOIST-AT ?auto_36719 ?auto_36718 ) ( not ( = ?auto_36715 ?auto_36719 ) ) ( not ( = ?auto_36717 ?auto_36719 ) ) ( not ( = ?auto_36712 ?auto_36719 ) ) ( AVAILABLE ?auto_36719 ) ( SURFACE-AT ?auto_36720 ?auto_36718 ) ( ON ?auto_36720 ?auto_36707 ) ( CLEAR ?auto_36720 ) ( not ( = ?auto_36705 ?auto_36707 ) ) ( not ( = ?auto_36706 ?auto_36707 ) ) ( not ( = ?auto_36711 ?auto_36707 ) ) ( not ( = ?auto_36720 ?auto_36707 ) ) ( not ( = ?auto_36709 ?auto_36707 ) ) ( not ( = ?auto_36714 ?auto_36707 ) ) ( SURFACE-AT ?auto_36710 ?auto_36721 ) ( CLEAR ?auto_36710 ) ( IS-CRATE ?auto_36714 ) ( not ( = ?auto_36705 ?auto_36710 ) ) ( not ( = ?auto_36706 ?auto_36710 ) ) ( not ( = ?auto_36711 ?auto_36710 ) ) ( not ( = ?auto_36720 ?auto_36710 ) ) ( not ( = ?auto_36709 ?auto_36710 ) ) ( not ( = ?auto_36714 ?auto_36710 ) ) ( not ( = ?auto_36707 ?auto_36710 ) ) ( AVAILABLE ?auto_36715 ) ( TRUCK-AT ?auto_36716 ?auto_36708 ) ( not ( = ?auto_36708 ?auto_36721 ) ) ( not ( = ?auto_36722 ?auto_36708 ) ) ( not ( = ?auto_36713 ?auto_36708 ) ) ( not ( = ?auto_36718 ?auto_36708 ) ) ( HOIST-AT ?auto_36723 ?auto_36708 ) ( LIFTING ?auto_36723 ?auto_36714 ) ( not ( = ?auto_36715 ?auto_36723 ) ) ( not ( = ?auto_36717 ?auto_36723 ) ) ( not ( = ?auto_36712 ?auto_36723 ) ) ( not ( = ?auto_36719 ?auto_36723 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36723 ?auto_36714 ?auto_36716 ?auto_36708 )
      ( MAKE-ON ?auto_36705 ?auto_36706 )
      ( MAKE-ON-VERIFY ?auto_36705 ?auto_36706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36724 - SURFACE
      ?auto_36725 - SURFACE
    )
    :vars
    (
      ?auto_36737 - HOIST
      ?auto_36742 - PLACE
      ?auto_36731 - PLACE
      ?auto_36736 - HOIST
      ?auto_36728 - SURFACE
      ?auto_36740 - SURFACE
      ?auto_36730 - PLACE
      ?auto_36732 - HOIST
      ?auto_36726 - SURFACE
      ?auto_36727 - SURFACE
      ?auto_36741 - PLACE
      ?auto_36739 - HOIST
      ?auto_36734 - SURFACE
      ?auto_36735 - SURFACE
      ?auto_36733 - TRUCK
      ?auto_36738 - PLACE
      ?auto_36729 - HOIST
      ?auto_36743 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36737 ?auto_36742 ) ( IS-CRATE ?auto_36724 ) ( not ( = ?auto_36724 ?auto_36725 ) ) ( not ( = ?auto_36731 ?auto_36742 ) ) ( HOIST-AT ?auto_36736 ?auto_36731 ) ( not ( = ?auto_36737 ?auto_36736 ) ) ( AVAILABLE ?auto_36736 ) ( SURFACE-AT ?auto_36724 ?auto_36731 ) ( ON ?auto_36724 ?auto_36728 ) ( CLEAR ?auto_36724 ) ( not ( = ?auto_36724 ?auto_36728 ) ) ( not ( = ?auto_36725 ?auto_36728 ) ) ( IS-CRATE ?auto_36725 ) ( not ( = ?auto_36724 ?auto_36740 ) ) ( not ( = ?auto_36725 ?auto_36740 ) ) ( not ( = ?auto_36728 ?auto_36740 ) ) ( not ( = ?auto_36730 ?auto_36742 ) ) ( not ( = ?auto_36731 ?auto_36730 ) ) ( HOIST-AT ?auto_36732 ?auto_36730 ) ( not ( = ?auto_36737 ?auto_36732 ) ) ( not ( = ?auto_36736 ?auto_36732 ) ) ( AVAILABLE ?auto_36732 ) ( SURFACE-AT ?auto_36725 ?auto_36730 ) ( ON ?auto_36725 ?auto_36726 ) ( CLEAR ?auto_36725 ) ( not ( = ?auto_36724 ?auto_36726 ) ) ( not ( = ?auto_36725 ?auto_36726 ) ) ( not ( = ?auto_36728 ?auto_36726 ) ) ( not ( = ?auto_36740 ?auto_36726 ) ) ( IS-CRATE ?auto_36740 ) ( not ( = ?auto_36724 ?auto_36727 ) ) ( not ( = ?auto_36725 ?auto_36727 ) ) ( not ( = ?auto_36728 ?auto_36727 ) ) ( not ( = ?auto_36740 ?auto_36727 ) ) ( not ( = ?auto_36726 ?auto_36727 ) ) ( not ( = ?auto_36741 ?auto_36742 ) ) ( not ( = ?auto_36731 ?auto_36741 ) ) ( not ( = ?auto_36730 ?auto_36741 ) ) ( HOIST-AT ?auto_36739 ?auto_36741 ) ( not ( = ?auto_36737 ?auto_36739 ) ) ( not ( = ?auto_36736 ?auto_36739 ) ) ( not ( = ?auto_36732 ?auto_36739 ) ) ( AVAILABLE ?auto_36739 ) ( SURFACE-AT ?auto_36740 ?auto_36741 ) ( ON ?auto_36740 ?auto_36734 ) ( CLEAR ?auto_36740 ) ( not ( = ?auto_36724 ?auto_36734 ) ) ( not ( = ?auto_36725 ?auto_36734 ) ) ( not ( = ?auto_36728 ?auto_36734 ) ) ( not ( = ?auto_36740 ?auto_36734 ) ) ( not ( = ?auto_36726 ?auto_36734 ) ) ( not ( = ?auto_36727 ?auto_36734 ) ) ( SURFACE-AT ?auto_36735 ?auto_36742 ) ( CLEAR ?auto_36735 ) ( IS-CRATE ?auto_36727 ) ( not ( = ?auto_36724 ?auto_36735 ) ) ( not ( = ?auto_36725 ?auto_36735 ) ) ( not ( = ?auto_36728 ?auto_36735 ) ) ( not ( = ?auto_36740 ?auto_36735 ) ) ( not ( = ?auto_36726 ?auto_36735 ) ) ( not ( = ?auto_36727 ?auto_36735 ) ) ( not ( = ?auto_36734 ?auto_36735 ) ) ( AVAILABLE ?auto_36737 ) ( TRUCK-AT ?auto_36733 ?auto_36738 ) ( not ( = ?auto_36738 ?auto_36742 ) ) ( not ( = ?auto_36731 ?auto_36738 ) ) ( not ( = ?auto_36730 ?auto_36738 ) ) ( not ( = ?auto_36741 ?auto_36738 ) ) ( HOIST-AT ?auto_36729 ?auto_36738 ) ( not ( = ?auto_36737 ?auto_36729 ) ) ( not ( = ?auto_36736 ?auto_36729 ) ) ( not ( = ?auto_36732 ?auto_36729 ) ) ( not ( = ?auto_36739 ?auto_36729 ) ) ( AVAILABLE ?auto_36729 ) ( SURFACE-AT ?auto_36727 ?auto_36738 ) ( ON ?auto_36727 ?auto_36743 ) ( CLEAR ?auto_36727 ) ( not ( = ?auto_36724 ?auto_36743 ) ) ( not ( = ?auto_36725 ?auto_36743 ) ) ( not ( = ?auto_36728 ?auto_36743 ) ) ( not ( = ?auto_36740 ?auto_36743 ) ) ( not ( = ?auto_36726 ?auto_36743 ) ) ( not ( = ?auto_36727 ?auto_36743 ) ) ( not ( = ?auto_36734 ?auto_36743 ) ) ( not ( = ?auto_36735 ?auto_36743 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36729 ?auto_36727 ?auto_36743 ?auto_36738 )
      ( MAKE-ON ?auto_36724 ?auto_36725 )
      ( MAKE-ON-VERIFY ?auto_36724 ?auto_36725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36744 - SURFACE
      ?auto_36745 - SURFACE
    )
    :vars
    (
      ?auto_36763 - HOIST
      ?auto_36760 - PLACE
      ?auto_36757 - PLACE
      ?auto_36751 - HOIST
      ?auto_36746 - SURFACE
      ?auto_36754 - SURFACE
      ?auto_36758 - PLACE
      ?auto_36755 - HOIST
      ?auto_36748 - SURFACE
      ?auto_36747 - SURFACE
      ?auto_36750 - PLACE
      ?auto_36749 - HOIST
      ?auto_36753 - SURFACE
      ?auto_36752 - SURFACE
      ?auto_36762 - PLACE
      ?auto_36761 - HOIST
      ?auto_36756 - SURFACE
      ?auto_36759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36763 ?auto_36760 ) ( IS-CRATE ?auto_36744 ) ( not ( = ?auto_36744 ?auto_36745 ) ) ( not ( = ?auto_36757 ?auto_36760 ) ) ( HOIST-AT ?auto_36751 ?auto_36757 ) ( not ( = ?auto_36763 ?auto_36751 ) ) ( AVAILABLE ?auto_36751 ) ( SURFACE-AT ?auto_36744 ?auto_36757 ) ( ON ?auto_36744 ?auto_36746 ) ( CLEAR ?auto_36744 ) ( not ( = ?auto_36744 ?auto_36746 ) ) ( not ( = ?auto_36745 ?auto_36746 ) ) ( IS-CRATE ?auto_36745 ) ( not ( = ?auto_36744 ?auto_36754 ) ) ( not ( = ?auto_36745 ?auto_36754 ) ) ( not ( = ?auto_36746 ?auto_36754 ) ) ( not ( = ?auto_36758 ?auto_36760 ) ) ( not ( = ?auto_36757 ?auto_36758 ) ) ( HOIST-AT ?auto_36755 ?auto_36758 ) ( not ( = ?auto_36763 ?auto_36755 ) ) ( not ( = ?auto_36751 ?auto_36755 ) ) ( AVAILABLE ?auto_36755 ) ( SURFACE-AT ?auto_36745 ?auto_36758 ) ( ON ?auto_36745 ?auto_36748 ) ( CLEAR ?auto_36745 ) ( not ( = ?auto_36744 ?auto_36748 ) ) ( not ( = ?auto_36745 ?auto_36748 ) ) ( not ( = ?auto_36746 ?auto_36748 ) ) ( not ( = ?auto_36754 ?auto_36748 ) ) ( IS-CRATE ?auto_36754 ) ( not ( = ?auto_36744 ?auto_36747 ) ) ( not ( = ?auto_36745 ?auto_36747 ) ) ( not ( = ?auto_36746 ?auto_36747 ) ) ( not ( = ?auto_36754 ?auto_36747 ) ) ( not ( = ?auto_36748 ?auto_36747 ) ) ( not ( = ?auto_36750 ?auto_36760 ) ) ( not ( = ?auto_36757 ?auto_36750 ) ) ( not ( = ?auto_36758 ?auto_36750 ) ) ( HOIST-AT ?auto_36749 ?auto_36750 ) ( not ( = ?auto_36763 ?auto_36749 ) ) ( not ( = ?auto_36751 ?auto_36749 ) ) ( not ( = ?auto_36755 ?auto_36749 ) ) ( AVAILABLE ?auto_36749 ) ( SURFACE-AT ?auto_36754 ?auto_36750 ) ( ON ?auto_36754 ?auto_36753 ) ( CLEAR ?auto_36754 ) ( not ( = ?auto_36744 ?auto_36753 ) ) ( not ( = ?auto_36745 ?auto_36753 ) ) ( not ( = ?auto_36746 ?auto_36753 ) ) ( not ( = ?auto_36754 ?auto_36753 ) ) ( not ( = ?auto_36748 ?auto_36753 ) ) ( not ( = ?auto_36747 ?auto_36753 ) ) ( SURFACE-AT ?auto_36752 ?auto_36760 ) ( CLEAR ?auto_36752 ) ( IS-CRATE ?auto_36747 ) ( not ( = ?auto_36744 ?auto_36752 ) ) ( not ( = ?auto_36745 ?auto_36752 ) ) ( not ( = ?auto_36746 ?auto_36752 ) ) ( not ( = ?auto_36754 ?auto_36752 ) ) ( not ( = ?auto_36748 ?auto_36752 ) ) ( not ( = ?auto_36747 ?auto_36752 ) ) ( not ( = ?auto_36753 ?auto_36752 ) ) ( AVAILABLE ?auto_36763 ) ( not ( = ?auto_36762 ?auto_36760 ) ) ( not ( = ?auto_36757 ?auto_36762 ) ) ( not ( = ?auto_36758 ?auto_36762 ) ) ( not ( = ?auto_36750 ?auto_36762 ) ) ( HOIST-AT ?auto_36761 ?auto_36762 ) ( not ( = ?auto_36763 ?auto_36761 ) ) ( not ( = ?auto_36751 ?auto_36761 ) ) ( not ( = ?auto_36755 ?auto_36761 ) ) ( not ( = ?auto_36749 ?auto_36761 ) ) ( AVAILABLE ?auto_36761 ) ( SURFACE-AT ?auto_36747 ?auto_36762 ) ( ON ?auto_36747 ?auto_36756 ) ( CLEAR ?auto_36747 ) ( not ( = ?auto_36744 ?auto_36756 ) ) ( not ( = ?auto_36745 ?auto_36756 ) ) ( not ( = ?auto_36746 ?auto_36756 ) ) ( not ( = ?auto_36754 ?auto_36756 ) ) ( not ( = ?auto_36748 ?auto_36756 ) ) ( not ( = ?auto_36747 ?auto_36756 ) ) ( not ( = ?auto_36753 ?auto_36756 ) ) ( not ( = ?auto_36752 ?auto_36756 ) ) ( TRUCK-AT ?auto_36759 ?auto_36760 ) )
    :subtasks
    ( ( !DRIVE ?auto_36759 ?auto_36760 ?auto_36762 )
      ( MAKE-ON ?auto_36744 ?auto_36745 )
      ( MAKE-ON-VERIFY ?auto_36744 ?auto_36745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36766 - SURFACE
      ?auto_36767 - SURFACE
    )
    :vars
    (
      ?auto_36768 - HOIST
      ?auto_36769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36768 ?auto_36769 ) ( SURFACE-AT ?auto_36767 ?auto_36769 ) ( CLEAR ?auto_36767 ) ( LIFTING ?auto_36768 ?auto_36766 ) ( IS-CRATE ?auto_36766 ) ( not ( = ?auto_36766 ?auto_36767 ) ) )
    :subtasks
    ( ( !DROP ?auto_36768 ?auto_36766 ?auto_36767 ?auto_36769 )
      ( MAKE-ON-VERIFY ?auto_36766 ?auto_36767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36770 - SURFACE
      ?auto_36771 - SURFACE
    )
    :vars
    (
      ?auto_36773 - HOIST
      ?auto_36772 - PLACE
      ?auto_36774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36773 ?auto_36772 ) ( SURFACE-AT ?auto_36771 ?auto_36772 ) ( CLEAR ?auto_36771 ) ( IS-CRATE ?auto_36770 ) ( not ( = ?auto_36770 ?auto_36771 ) ) ( TRUCK-AT ?auto_36774 ?auto_36772 ) ( AVAILABLE ?auto_36773 ) ( IN ?auto_36770 ?auto_36774 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36773 ?auto_36770 ?auto_36774 ?auto_36772 )
      ( MAKE-ON ?auto_36770 ?auto_36771 )
      ( MAKE-ON-VERIFY ?auto_36770 ?auto_36771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36775 - SURFACE
      ?auto_36776 - SURFACE
    )
    :vars
    (
      ?auto_36779 - HOIST
      ?auto_36777 - PLACE
      ?auto_36778 - TRUCK
      ?auto_36780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36779 ?auto_36777 ) ( SURFACE-AT ?auto_36776 ?auto_36777 ) ( CLEAR ?auto_36776 ) ( IS-CRATE ?auto_36775 ) ( not ( = ?auto_36775 ?auto_36776 ) ) ( AVAILABLE ?auto_36779 ) ( IN ?auto_36775 ?auto_36778 ) ( TRUCK-AT ?auto_36778 ?auto_36780 ) ( not ( = ?auto_36780 ?auto_36777 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36778 ?auto_36780 ?auto_36777 )
      ( MAKE-ON ?auto_36775 ?auto_36776 )
      ( MAKE-ON-VERIFY ?auto_36775 ?auto_36776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36781 - SURFACE
      ?auto_36782 - SURFACE
    )
    :vars
    (
      ?auto_36786 - HOIST
      ?auto_36785 - PLACE
      ?auto_36783 - TRUCK
      ?auto_36784 - PLACE
      ?auto_36787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36786 ?auto_36785 ) ( SURFACE-AT ?auto_36782 ?auto_36785 ) ( CLEAR ?auto_36782 ) ( IS-CRATE ?auto_36781 ) ( not ( = ?auto_36781 ?auto_36782 ) ) ( AVAILABLE ?auto_36786 ) ( TRUCK-AT ?auto_36783 ?auto_36784 ) ( not ( = ?auto_36784 ?auto_36785 ) ) ( HOIST-AT ?auto_36787 ?auto_36784 ) ( LIFTING ?auto_36787 ?auto_36781 ) ( not ( = ?auto_36786 ?auto_36787 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36787 ?auto_36781 ?auto_36783 ?auto_36784 )
      ( MAKE-ON ?auto_36781 ?auto_36782 )
      ( MAKE-ON-VERIFY ?auto_36781 ?auto_36782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36788 - SURFACE
      ?auto_36789 - SURFACE
    )
    :vars
    (
      ?auto_36791 - HOIST
      ?auto_36792 - PLACE
      ?auto_36793 - TRUCK
      ?auto_36790 - PLACE
      ?auto_36794 - HOIST
      ?auto_36795 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36791 ?auto_36792 ) ( SURFACE-AT ?auto_36789 ?auto_36792 ) ( CLEAR ?auto_36789 ) ( IS-CRATE ?auto_36788 ) ( not ( = ?auto_36788 ?auto_36789 ) ) ( AVAILABLE ?auto_36791 ) ( TRUCK-AT ?auto_36793 ?auto_36790 ) ( not ( = ?auto_36790 ?auto_36792 ) ) ( HOIST-AT ?auto_36794 ?auto_36790 ) ( not ( = ?auto_36791 ?auto_36794 ) ) ( AVAILABLE ?auto_36794 ) ( SURFACE-AT ?auto_36788 ?auto_36790 ) ( ON ?auto_36788 ?auto_36795 ) ( CLEAR ?auto_36788 ) ( not ( = ?auto_36788 ?auto_36795 ) ) ( not ( = ?auto_36789 ?auto_36795 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36794 ?auto_36788 ?auto_36795 ?auto_36790 )
      ( MAKE-ON ?auto_36788 ?auto_36789 )
      ( MAKE-ON-VERIFY ?auto_36788 ?auto_36789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36796 - SURFACE
      ?auto_36797 - SURFACE
    )
    :vars
    (
      ?auto_36798 - HOIST
      ?auto_36800 - PLACE
      ?auto_36799 - PLACE
      ?auto_36803 - HOIST
      ?auto_36801 - SURFACE
      ?auto_36802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36798 ?auto_36800 ) ( SURFACE-AT ?auto_36797 ?auto_36800 ) ( CLEAR ?auto_36797 ) ( IS-CRATE ?auto_36796 ) ( not ( = ?auto_36796 ?auto_36797 ) ) ( AVAILABLE ?auto_36798 ) ( not ( = ?auto_36799 ?auto_36800 ) ) ( HOIST-AT ?auto_36803 ?auto_36799 ) ( not ( = ?auto_36798 ?auto_36803 ) ) ( AVAILABLE ?auto_36803 ) ( SURFACE-AT ?auto_36796 ?auto_36799 ) ( ON ?auto_36796 ?auto_36801 ) ( CLEAR ?auto_36796 ) ( not ( = ?auto_36796 ?auto_36801 ) ) ( not ( = ?auto_36797 ?auto_36801 ) ) ( TRUCK-AT ?auto_36802 ?auto_36800 ) )
    :subtasks
    ( ( !DRIVE ?auto_36802 ?auto_36800 ?auto_36799 )
      ( MAKE-ON ?auto_36796 ?auto_36797 )
      ( MAKE-ON-VERIFY ?auto_36796 ?auto_36797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36804 - SURFACE
      ?auto_36805 - SURFACE
    )
    :vars
    (
      ?auto_36806 - HOIST
      ?auto_36807 - PLACE
      ?auto_36810 - PLACE
      ?auto_36808 - HOIST
      ?auto_36809 - SURFACE
      ?auto_36811 - TRUCK
      ?auto_36812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36806 ?auto_36807 ) ( IS-CRATE ?auto_36804 ) ( not ( = ?auto_36804 ?auto_36805 ) ) ( not ( = ?auto_36810 ?auto_36807 ) ) ( HOIST-AT ?auto_36808 ?auto_36810 ) ( not ( = ?auto_36806 ?auto_36808 ) ) ( AVAILABLE ?auto_36808 ) ( SURFACE-AT ?auto_36804 ?auto_36810 ) ( ON ?auto_36804 ?auto_36809 ) ( CLEAR ?auto_36804 ) ( not ( = ?auto_36804 ?auto_36809 ) ) ( not ( = ?auto_36805 ?auto_36809 ) ) ( TRUCK-AT ?auto_36811 ?auto_36807 ) ( SURFACE-AT ?auto_36812 ?auto_36807 ) ( CLEAR ?auto_36812 ) ( LIFTING ?auto_36806 ?auto_36805 ) ( IS-CRATE ?auto_36805 ) ( not ( = ?auto_36804 ?auto_36812 ) ) ( not ( = ?auto_36805 ?auto_36812 ) ) ( not ( = ?auto_36809 ?auto_36812 ) ) )
    :subtasks
    ( ( !DROP ?auto_36806 ?auto_36805 ?auto_36812 ?auto_36807 )
      ( MAKE-ON ?auto_36804 ?auto_36805 )
      ( MAKE-ON-VERIFY ?auto_36804 ?auto_36805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36813 - SURFACE
      ?auto_36814 - SURFACE
    )
    :vars
    (
      ?auto_36817 - HOIST
      ?auto_36815 - PLACE
      ?auto_36820 - PLACE
      ?auto_36821 - HOIST
      ?auto_36818 - SURFACE
      ?auto_36819 - TRUCK
      ?auto_36816 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36817 ?auto_36815 ) ( IS-CRATE ?auto_36813 ) ( not ( = ?auto_36813 ?auto_36814 ) ) ( not ( = ?auto_36820 ?auto_36815 ) ) ( HOIST-AT ?auto_36821 ?auto_36820 ) ( not ( = ?auto_36817 ?auto_36821 ) ) ( AVAILABLE ?auto_36821 ) ( SURFACE-AT ?auto_36813 ?auto_36820 ) ( ON ?auto_36813 ?auto_36818 ) ( CLEAR ?auto_36813 ) ( not ( = ?auto_36813 ?auto_36818 ) ) ( not ( = ?auto_36814 ?auto_36818 ) ) ( TRUCK-AT ?auto_36819 ?auto_36815 ) ( SURFACE-AT ?auto_36816 ?auto_36815 ) ( CLEAR ?auto_36816 ) ( IS-CRATE ?auto_36814 ) ( not ( = ?auto_36813 ?auto_36816 ) ) ( not ( = ?auto_36814 ?auto_36816 ) ) ( not ( = ?auto_36818 ?auto_36816 ) ) ( AVAILABLE ?auto_36817 ) ( IN ?auto_36814 ?auto_36819 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36817 ?auto_36814 ?auto_36819 ?auto_36815 )
      ( MAKE-ON ?auto_36813 ?auto_36814 )
      ( MAKE-ON-VERIFY ?auto_36813 ?auto_36814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36822 - SURFACE
      ?auto_36823 - SURFACE
    )
    :vars
    (
      ?auto_36830 - HOIST
      ?auto_36828 - PLACE
      ?auto_36827 - PLACE
      ?auto_36829 - HOIST
      ?auto_36825 - SURFACE
      ?auto_36826 - SURFACE
      ?auto_36824 - TRUCK
      ?auto_36831 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36830 ?auto_36828 ) ( IS-CRATE ?auto_36822 ) ( not ( = ?auto_36822 ?auto_36823 ) ) ( not ( = ?auto_36827 ?auto_36828 ) ) ( HOIST-AT ?auto_36829 ?auto_36827 ) ( not ( = ?auto_36830 ?auto_36829 ) ) ( AVAILABLE ?auto_36829 ) ( SURFACE-AT ?auto_36822 ?auto_36827 ) ( ON ?auto_36822 ?auto_36825 ) ( CLEAR ?auto_36822 ) ( not ( = ?auto_36822 ?auto_36825 ) ) ( not ( = ?auto_36823 ?auto_36825 ) ) ( SURFACE-AT ?auto_36826 ?auto_36828 ) ( CLEAR ?auto_36826 ) ( IS-CRATE ?auto_36823 ) ( not ( = ?auto_36822 ?auto_36826 ) ) ( not ( = ?auto_36823 ?auto_36826 ) ) ( not ( = ?auto_36825 ?auto_36826 ) ) ( AVAILABLE ?auto_36830 ) ( IN ?auto_36823 ?auto_36824 ) ( TRUCK-AT ?auto_36824 ?auto_36831 ) ( not ( = ?auto_36831 ?auto_36828 ) ) ( not ( = ?auto_36827 ?auto_36831 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36824 ?auto_36831 ?auto_36828 )
      ( MAKE-ON ?auto_36822 ?auto_36823 )
      ( MAKE-ON-VERIFY ?auto_36822 ?auto_36823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36832 - SURFACE
      ?auto_36833 - SURFACE
    )
    :vars
    (
      ?auto_36834 - HOIST
      ?auto_36838 - PLACE
      ?auto_36841 - PLACE
      ?auto_36839 - HOIST
      ?auto_36835 - SURFACE
      ?auto_36837 - SURFACE
      ?auto_36840 - TRUCK
      ?auto_36836 - PLACE
      ?auto_36842 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36834 ?auto_36838 ) ( IS-CRATE ?auto_36832 ) ( not ( = ?auto_36832 ?auto_36833 ) ) ( not ( = ?auto_36841 ?auto_36838 ) ) ( HOIST-AT ?auto_36839 ?auto_36841 ) ( not ( = ?auto_36834 ?auto_36839 ) ) ( AVAILABLE ?auto_36839 ) ( SURFACE-AT ?auto_36832 ?auto_36841 ) ( ON ?auto_36832 ?auto_36835 ) ( CLEAR ?auto_36832 ) ( not ( = ?auto_36832 ?auto_36835 ) ) ( not ( = ?auto_36833 ?auto_36835 ) ) ( SURFACE-AT ?auto_36837 ?auto_36838 ) ( CLEAR ?auto_36837 ) ( IS-CRATE ?auto_36833 ) ( not ( = ?auto_36832 ?auto_36837 ) ) ( not ( = ?auto_36833 ?auto_36837 ) ) ( not ( = ?auto_36835 ?auto_36837 ) ) ( AVAILABLE ?auto_36834 ) ( TRUCK-AT ?auto_36840 ?auto_36836 ) ( not ( = ?auto_36836 ?auto_36838 ) ) ( not ( = ?auto_36841 ?auto_36836 ) ) ( HOIST-AT ?auto_36842 ?auto_36836 ) ( LIFTING ?auto_36842 ?auto_36833 ) ( not ( = ?auto_36834 ?auto_36842 ) ) ( not ( = ?auto_36839 ?auto_36842 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36842 ?auto_36833 ?auto_36840 ?auto_36836 )
      ( MAKE-ON ?auto_36832 ?auto_36833 )
      ( MAKE-ON-VERIFY ?auto_36832 ?auto_36833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36843 - SURFACE
      ?auto_36844 - SURFACE
    )
    :vars
    (
      ?auto_36850 - HOIST
      ?auto_36847 - PLACE
      ?auto_36846 - PLACE
      ?auto_36852 - HOIST
      ?auto_36848 - SURFACE
      ?auto_36853 - SURFACE
      ?auto_36845 - TRUCK
      ?auto_36849 - PLACE
      ?auto_36851 - HOIST
      ?auto_36854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36850 ?auto_36847 ) ( IS-CRATE ?auto_36843 ) ( not ( = ?auto_36843 ?auto_36844 ) ) ( not ( = ?auto_36846 ?auto_36847 ) ) ( HOIST-AT ?auto_36852 ?auto_36846 ) ( not ( = ?auto_36850 ?auto_36852 ) ) ( AVAILABLE ?auto_36852 ) ( SURFACE-AT ?auto_36843 ?auto_36846 ) ( ON ?auto_36843 ?auto_36848 ) ( CLEAR ?auto_36843 ) ( not ( = ?auto_36843 ?auto_36848 ) ) ( not ( = ?auto_36844 ?auto_36848 ) ) ( SURFACE-AT ?auto_36853 ?auto_36847 ) ( CLEAR ?auto_36853 ) ( IS-CRATE ?auto_36844 ) ( not ( = ?auto_36843 ?auto_36853 ) ) ( not ( = ?auto_36844 ?auto_36853 ) ) ( not ( = ?auto_36848 ?auto_36853 ) ) ( AVAILABLE ?auto_36850 ) ( TRUCK-AT ?auto_36845 ?auto_36849 ) ( not ( = ?auto_36849 ?auto_36847 ) ) ( not ( = ?auto_36846 ?auto_36849 ) ) ( HOIST-AT ?auto_36851 ?auto_36849 ) ( not ( = ?auto_36850 ?auto_36851 ) ) ( not ( = ?auto_36852 ?auto_36851 ) ) ( AVAILABLE ?auto_36851 ) ( SURFACE-AT ?auto_36844 ?auto_36849 ) ( ON ?auto_36844 ?auto_36854 ) ( CLEAR ?auto_36844 ) ( not ( = ?auto_36843 ?auto_36854 ) ) ( not ( = ?auto_36844 ?auto_36854 ) ) ( not ( = ?auto_36848 ?auto_36854 ) ) ( not ( = ?auto_36853 ?auto_36854 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36851 ?auto_36844 ?auto_36854 ?auto_36849 )
      ( MAKE-ON ?auto_36843 ?auto_36844 )
      ( MAKE-ON-VERIFY ?auto_36843 ?auto_36844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36855 - SURFACE
      ?auto_36856 - SURFACE
    )
    :vars
    (
      ?auto_36859 - HOIST
      ?auto_36857 - PLACE
      ?auto_36865 - PLACE
      ?auto_36866 - HOIST
      ?auto_36864 - SURFACE
      ?auto_36861 - SURFACE
      ?auto_36862 - PLACE
      ?auto_36858 - HOIST
      ?auto_36860 - SURFACE
      ?auto_36863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36859 ?auto_36857 ) ( IS-CRATE ?auto_36855 ) ( not ( = ?auto_36855 ?auto_36856 ) ) ( not ( = ?auto_36865 ?auto_36857 ) ) ( HOIST-AT ?auto_36866 ?auto_36865 ) ( not ( = ?auto_36859 ?auto_36866 ) ) ( AVAILABLE ?auto_36866 ) ( SURFACE-AT ?auto_36855 ?auto_36865 ) ( ON ?auto_36855 ?auto_36864 ) ( CLEAR ?auto_36855 ) ( not ( = ?auto_36855 ?auto_36864 ) ) ( not ( = ?auto_36856 ?auto_36864 ) ) ( SURFACE-AT ?auto_36861 ?auto_36857 ) ( CLEAR ?auto_36861 ) ( IS-CRATE ?auto_36856 ) ( not ( = ?auto_36855 ?auto_36861 ) ) ( not ( = ?auto_36856 ?auto_36861 ) ) ( not ( = ?auto_36864 ?auto_36861 ) ) ( AVAILABLE ?auto_36859 ) ( not ( = ?auto_36862 ?auto_36857 ) ) ( not ( = ?auto_36865 ?auto_36862 ) ) ( HOIST-AT ?auto_36858 ?auto_36862 ) ( not ( = ?auto_36859 ?auto_36858 ) ) ( not ( = ?auto_36866 ?auto_36858 ) ) ( AVAILABLE ?auto_36858 ) ( SURFACE-AT ?auto_36856 ?auto_36862 ) ( ON ?auto_36856 ?auto_36860 ) ( CLEAR ?auto_36856 ) ( not ( = ?auto_36855 ?auto_36860 ) ) ( not ( = ?auto_36856 ?auto_36860 ) ) ( not ( = ?auto_36864 ?auto_36860 ) ) ( not ( = ?auto_36861 ?auto_36860 ) ) ( TRUCK-AT ?auto_36863 ?auto_36857 ) )
    :subtasks
    ( ( !DRIVE ?auto_36863 ?auto_36857 ?auto_36862 )
      ( MAKE-ON ?auto_36855 ?auto_36856 )
      ( MAKE-ON-VERIFY ?auto_36855 ?auto_36856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36867 - SURFACE
      ?auto_36868 - SURFACE
    )
    :vars
    (
      ?auto_36869 - HOIST
      ?auto_36871 - PLACE
      ?auto_36872 - PLACE
      ?auto_36877 - HOIST
      ?auto_36873 - SURFACE
      ?auto_36875 - SURFACE
      ?auto_36870 - PLACE
      ?auto_36874 - HOIST
      ?auto_36878 - SURFACE
      ?auto_36876 - TRUCK
      ?auto_36879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36869 ?auto_36871 ) ( IS-CRATE ?auto_36867 ) ( not ( = ?auto_36867 ?auto_36868 ) ) ( not ( = ?auto_36872 ?auto_36871 ) ) ( HOIST-AT ?auto_36877 ?auto_36872 ) ( not ( = ?auto_36869 ?auto_36877 ) ) ( AVAILABLE ?auto_36877 ) ( SURFACE-AT ?auto_36867 ?auto_36872 ) ( ON ?auto_36867 ?auto_36873 ) ( CLEAR ?auto_36867 ) ( not ( = ?auto_36867 ?auto_36873 ) ) ( not ( = ?auto_36868 ?auto_36873 ) ) ( IS-CRATE ?auto_36868 ) ( not ( = ?auto_36867 ?auto_36875 ) ) ( not ( = ?auto_36868 ?auto_36875 ) ) ( not ( = ?auto_36873 ?auto_36875 ) ) ( not ( = ?auto_36870 ?auto_36871 ) ) ( not ( = ?auto_36872 ?auto_36870 ) ) ( HOIST-AT ?auto_36874 ?auto_36870 ) ( not ( = ?auto_36869 ?auto_36874 ) ) ( not ( = ?auto_36877 ?auto_36874 ) ) ( AVAILABLE ?auto_36874 ) ( SURFACE-AT ?auto_36868 ?auto_36870 ) ( ON ?auto_36868 ?auto_36878 ) ( CLEAR ?auto_36868 ) ( not ( = ?auto_36867 ?auto_36878 ) ) ( not ( = ?auto_36868 ?auto_36878 ) ) ( not ( = ?auto_36873 ?auto_36878 ) ) ( not ( = ?auto_36875 ?auto_36878 ) ) ( TRUCK-AT ?auto_36876 ?auto_36871 ) ( SURFACE-AT ?auto_36879 ?auto_36871 ) ( CLEAR ?auto_36879 ) ( LIFTING ?auto_36869 ?auto_36875 ) ( IS-CRATE ?auto_36875 ) ( not ( = ?auto_36867 ?auto_36879 ) ) ( not ( = ?auto_36868 ?auto_36879 ) ) ( not ( = ?auto_36873 ?auto_36879 ) ) ( not ( = ?auto_36875 ?auto_36879 ) ) ( not ( = ?auto_36878 ?auto_36879 ) ) )
    :subtasks
    ( ( !DROP ?auto_36869 ?auto_36875 ?auto_36879 ?auto_36871 )
      ( MAKE-ON ?auto_36867 ?auto_36868 )
      ( MAKE-ON-VERIFY ?auto_36867 ?auto_36868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36880 - SURFACE
      ?auto_36881 - SURFACE
    )
    :vars
    (
      ?auto_36890 - HOIST
      ?auto_36889 - PLACE
      ?auto_36882 - PLACE
      ?auto_36886 - HOIST
      ?auto_36892 - SURFACE
      ?auto_36883 - SURFACE
      ?auto_36891 - PLACE
      ?auto_36884 - HOIST
      ?auto_36888 - SURFACE
      ?auto_36887 - TRUCK
      ?auto_36885 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36890 ?auto_36889 ) ( IS-CRATE ?auto_36880 ) ( not ( = ?auto_36880 ?auto_36881 ) ) ( not ( = ?auto_36882 ?auto_36889 ) ) ( HOIST-AT ?auto_36886 ?auto_36882 ) ( not ( = ?auto_36890 ?auto_36886 ) ) ( AVAILABLE ?auto_36886 ) ( SURFACE-AT ?auto_36880 ?auto_36882 ) ( ON ?auto_36880 ?auto_36892 ) ( CLEAR ?auto_36880 ) ( not ( = ?auto_36880 ?auto_36892 ) ) ( not ( = ?auto_36881 ?auto_36892 ) ) ( IS-CRATE ?auto_36881 ) ( not ( = ?auto_36880 ?auto_36883 ) ) ( not ( = ?auto_36881 ?auto_36883 ) ) ( not ( = ?auto_36892 ?auto_36883 ) ) ( not ( = ?auto_36891 ?auto_36889 ) ) ( not ( = ?auto_36882 ?auto_36891 ) ) ( HOIST-AT ?auto_36884 ?auto_36891 ) ( not ( = ?auto_36890 ?auto_36884 ) ) ( not ( = ?auto_36886 ?auto_36884 ) ) ( AVAILABLE ?auto_36884 ) ( SURFACE-AT ?auto_36881 ?auto_36891 ) ( ON ?auto_36881 ?auto_36888 ) ( CLEAR ?auto_36881 ) ( not ( = ?auto_36880 ?auto_36888 ) ) ( not ( = ?auto_36881 ?auto_36888 ) ) ( not ( = ?auto_36892 ?auto_36888 ) ) ( not ( = ?auto_36883 ?auto_36888 ) ) ( TRUCK-AT ?auto_36887 ?auto_36889 ) ( SURFACE-AT ?auto_36885 ?auto_36889 ) ( CLEAR ?auto_36885 ) ( IS-CRATE ?auto_36883 ) ( not ( = ?auto_36880 ?auto_36885 ) ) ( not ( = ?auto_36881 ?auto_36885 ) ) ( not ( = ?auto_36892 ?auto_36885 ) ) ( not ( = ?auto_36883 ?auto_36885 ) ) ( not ( = ?auto_36888 ?auto_36885 ) ) ( AVAILABLE ?auto_36890 ) ( IN ?auto_36883 ?auto_36887 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36890 ?auto_36883 ?auto_36887 ?auto_36889 )
      ( MAKE-ON ?auto_36880 ?auto_36881 )
      ( MAKE-ON-VERIFY ?auto_36880 ?auto_36881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36893 - SURFACE
      ?auto_36894 - SURFACE
    )
    :vars
    (
      ?auto_36904 - HOIST
      ?auto_36897 - PLACE
      ?auto_36900 - PLACE
      ?auto_36896 - HOIST
      ?auto_36902 - SURFACE
      ?auto_36905 - SURFACE
      ?auto_36895 - PLACE
      ?auto_36899 - HOIST
      ?auto_36898 - SURFACE
      ?auto_36903 - SURFACE
      ?auto_36901 - TRUCK
      ?auto_36906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36904 ?auto_36897 ) ( IS-CRATE ?auto_36893 ) ( not ( = ?auto_36893 ?auto_36894 ) ) ( not ( = ?auto_36900 ?auto_36897 ) ) ( HOIST-AT ?auto_36896 ?auto_36900 ) ( not ( = ?auto_36904 ?auto_36896 ) ) ( AVAILABLE ?auto_36896 ) ( SURFACE-AT ?auto_36893 ?auto_36900 ) ( ON ?auto_36893 ?auto_36902 ) ( CLEAR ?auto_36893 ) ( not ( = ?auto_36893 ?auto_36902 ) ) ( not ( = ?auto_36894 ?auto_36902 ) ) ( IS-CRATE ?auto_36894 ) ( not ( = ?auto_36893 ?auto_36905 ) ) ( not ( = ?auto_36894 ?auto_36905 ) ) ( not ( = ?auto_36902 ?auto_36905 ) ) ( not ( = ?auto_36895 ?auto_36897 ) ) ( not ( = ?auto_36900 ?auto_36895 ) ) ( HOIST-AT ?auto_36899 ?auto_36895 ) ( not ( = ?auto_36904 ?auto_36899 ) ) ( not ( = ?auto_36896 ?auto_36899 ) ) ( AVAILABLE ?auto_36899 ) ( SURFACE-AT ?auto_36894 ?auto_36895 ) ( ON ?auto_36894 ?auto_36898 ) ( CLEAR ?auto_36894 ) ( not ( = ?auto_36893 ?auto_36898 ) ) ( not ( = ?auto_36894 ?auto_36898 ) ) ( not ( = ?auto_36902 ?auto_36898 ) ) ( not ( = ?auto_36905 ?auto_36898 ) ) ( SURFACE-AT ?auto_36903 ?auto_36897 ) ( CLEAR ?auto_36903 ) ( IS-CRATE ?auto_36905 ) ( not ( = ?auto_36893 ?auto_36903 ) ) ( not ( = ?auto_36894 ?auto_36903 ) ) ( not ( = ?auto_36902 ?auto_36903 ) ) ( not ( = ?auto_36905 ?auto_36903 ) ) ( not ( = ?auto_36898 ?auto_36903 ) ) ( AVAILABLE ?auto_36904 ) ( IN ?auto_36905 ?auto_36901 ) ( TRUCK-AT ?auto_36901 ?auto_36906 ) ( not ( = ?auto_36906 ?auto_36897 ) ) ( not ( = ?auto_36900 ?auto_36906 ) ) ( not ( = ?auto_36895 ?auto_36906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36901 ?auto_36906 ?auto_36897 )
      ( MAKE-ON ?auto_36893 ?auto_36894 )
      ( MAKE-ON-VERIFY ?auto_36893 ?auto_36894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36907 - SURFACE
      ?auto_36908 - SURFACE
    )
    :vars
    (
      ?auto_36914 - HOIST
      ?auto_36911 - PLACE
      ?auto_36910 - PLACE
      ?auto_36915 - HOIST
      ?auto_36916 - SURFACE
      ?auto_36918 - SURFACE
      ?auto_36920 - PLACE
      ?auto_36912 - HOIST
      ?auto_36917 - SURFACE
      ?auto_36913 - SURFACE
      ?auto_36909 - TRUCK
      ?auto_36919 - PLACE
      ?auto_36921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_36914 ?auto_36911 ) ( IS-CRATE ?auto_36907 ) ( not ( = ?auto_36907 ?auto_36908 ) ) ( not ( = ?auto_36910 ?auto_36911 ) ) ( HOIST-AT ?auto_36915 ?auto_36910 ) ( not ( = ?auto_36914 ?auto_36915 ) ) ( AVAILABLE ?auto_36915 ) ( SURFACE-AT ?auto_36907 ?auto_36910 ) ( ON ?auto_36907 ?auto_36916 ) ( CLEAR ?auto_36907 ) ( not ( = ?auto_36907 ?auto_36916 ) ) ( not ( = ?auto_36908 ?auto_36916 ) ) ( IS-CRATE ?auto_36908 ) ( not ( = ?auto_36907 ?auto_36918 ) ) ( not ( = ?auto_36908 ?auto_36918 ) ) ( not ( = ?auto_36916 ?auto_36918 ) ) ( not ( = ?auto_36920 ?auto_36911 ) ) ( not ( = ?auto_36910 ?auto_36920 ) ) ( HOIST-AT ?auto_36912 ?auto_36920 ) ( not ( = ?auto_36914 ?auto_36912 ) ) ( not ( = ?auto_36915 ?auto_36912 ) ) ( AVAILABLE ?auto_36912 ) ( SURFACE-AT ?auto_36908 ?auto_36920 ) ( ON ?auto_36908 ?auto_36917 ) ( CLEAR ?auto_36908 ) ( not ( = ?auto_36907 ?auto_36917 ) ) ( not ( = ?auto_36908 ?auto_36917 ) ) ( not ( = ?auto_36916 ?auto_36917 ) ) ( not ( = ?auto_36918 ?auto_36917 ) ) ( SURFACE-AT ?auto_36913 ?auto_36911 ) ( CLEAR ?auto_36913 ) ( IS-CRATE ?auto_36918 ) ( not ( = ?auto_36907 ?auto_36913 ) ) ( not ( = ?auto_36908 ?auto_36913 ) ) ( not ( = ?auto_36916 ?auto_36913 ) ) ( not ( = ?auto_36918 ?auto_36913 ) ) ( not ( = ?auto_36917 ?auto_36913 ) ) ( AVAILABLE ?auto_36914 ) ( TRUCK-AT ?auto_36909 ?auto_36919 ) ( not ( = ?auto_36919 ?auto_36911 ) ) ( not ( = ?auto_36910 ?auto_36919 ) ) ( not ( = ?auto_36920 ?auto_36919 ) ) ( HOIST-AT ?auto_36921 ?auto_36919 ) ( LIFTING ?auto_36921 ?auto_36918 ) ( not ( = ?auto_36914 ?auto_36921 ) ) ( not ( = ?auto_36915 ?auto_36921 ) ) ( not ( = ?auto_36912 ?auto_36921 ) ) )
    :subtasks
    ( ( !LOAD ?auto_36921 ?auto_36918 ?auto_36909 ?auto_36919 )
      ( MAKE-ON ?auto_36907 ?auto_36908 )
      ( MAKE-ON-VERIFY ?auto_36907 ?auto_36908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36922 - SURFACE
      ?auto_36923 - SURFACE
    )
    :vars
    (
      ?auto_36931 - HOIST
      ?auto_36930 - PLACE
      ?auto_36927 - PLACE
      ?auto_36928 - HOIST
      ?auto_36933 - SURFACE
      ?auto_36929 - SURFACE
      ?auto_36932 - PLACE
      ?auto_36926 - HOIST
      ?auto_36924 - SURFACE
      ?auto_36935 - SURFACE
      ?auto_36936 - TRUCK
      ?auto_36925 - PLACE
      ?auto_36934 - HOIST
      ?auto_36937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36931 ?auto_36930 ) ( IS-CRATE ?auto_36922 ) ( not ( = ?auto_36922 ?auto_36923 ) ) ( not ( = ?auto_36927 ?auto_36930 ) ) ( HOIST-AT ?auto_36928 ?auto_36927 ) ( not ( = ?auto_36931 ?auto_36928 ) ) ( AVAILABLE ?auto_36928 ) ( SURFACE-AT ?auto_36922 ?auto_36927 ) ( ON ?auto_36922 ?auto_36933 ) ( CLEAR ?auto_36922 ) ( not ( = ?auto_36922 ?auto_36933 ) ) ( not ( = ?auto_36923 ?auto_36933 ) ) ( IS-CRATE ?auto_36923 ) ( not ( = ?auto_36922 ?auto_36929 ) ) ( not ( = ?auto_36923 ?auto_36929 ) ) ( not ( = ?auto_36933 ?auto_36929 ) ) ( not ( = ?auto_36932 ?auto_36930 ) ) ( not ( = ?auto_36927 ?auto_36932 ) ) ( HOIST-AT ?auto_36926 ?auto_36932 ) ( not ( = ?auto_36931 ?auto_36926 ) ) ( not ( = ?auto_36928 ?auto_36926 ) ) ( AVAILABLE ?auto_36926 ) ( SURFACE-AT ?auto_36923 ?auto_36932 ) ( ON ?auto_36923 ?auto_36924 ) ( CLEAR ?auto_36923 ) ( not ( = ?auto_36922 ?auto_36924 ) ) ( not ( = ?auto_36923 ?auto_36924 ) ) ( not ( = ?auto_36933 ?auto_36924 ) ) ( not ( = ?auto_36929 ?auto_36924 ) ) ( SURFACE-AT ?auto_36935 ?auto_36930 ) ( CLEAR ?auto_36935 ) ( IS-CRATE ?auto_36929 ) ( not ( = ?auto_36922 ?auto_36935 ) ) ( not ( = ?auto_36923 ?auto_36935 ) ) ( not ( = ?auto_36933 ?auto_36935 ) ) ( not ( = ?auto_36929 ?auto_36935 ) ) ( not ( = ?auto_36924 ?auto_36935 ) ) ( AVAILABLE ?auto_36931 ) ( TRUCK-AT ?auto_36936 ?auto_36925 ) ( not ( = ?auto_36925 ?auto_36930 ) ) ( not ( = ?auto_36927 ?auto_36925 ) ) ( not ( = ?auto_36932 ?auto_36925 ) ) ( HOIST-AT ?auto_36934 ?auto_36925 ) ( not ( = ?auto_36931 ?auto_36934 ) ) ( not ( = ?auto_36928 ?auto_36934 ) ) ( not ( = ?auto_36926 ?auto_36934 ) ) ( AVAILABLE ?auto_36934 ) ( SURFACE-AT ?auto_36929 ?auto_36925 ) ( ON ?auto_36929 ?auto_36937 ) ( CLEAR ?auto_36929 ) ( not ( = ?auto_36922 ?auto_36937 ) ) ( not ( = ?auto_36923 ?auto_36937 ) ) ( not ( = ?auto_36933 ?auto_36937 ) ) ( not ( = ?auto_36929 ?auto_36937 ) ) ( not ( = ?auto_36924 ?auto_36937 ) ) ( not ( = ?auto_36935 ?auto_36937 ) ) )
    :subtasks
    ( ( !LIFT ?auto_36934 ?auto_36929 ?auto_36937 ?auto_36925 )
      ( MAKE-ON ?auto_36922 ?auto_36923 )
      ( MAKE-ON-VERIFY ?auto_36922 ?auto_36923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36938 - SURFACE
      ?auto_36939 - SURFACE
    )
    :vars
    (
      ?auto_36951 - HOIST
      ?auto_36952 - PLACE
      ?auto_36942 - PLACE
      ?auto_36953 - HOIST
      ?auto_36949 - SURFACE
      ?auto_36945 - SURFACE
      ?auto_36940 - PLACE
      ?auto_36950 - HOIST
      ?auto_36946 - SURFACE
      ?auto_36943 - SURFACE
      ?auto_36948 - PLACE
      ?auto_36944 - HOIST
      ?auto_36947 - SURFACE
      ?auto_36941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36951 ?auto_36952 ) ( IS-CRATE ?auto_36938 ) ( not ( = ?auto_36938 ?auto_36939 ) ) ( not ( = ?auto_36942 ?auto_36952 ) ) ( HOIST-AT ?auto_36953 ?auto_36942 ) ( not ( = ?auto_36951 ?auto_36953 ) ) ( AVAILABLE ?auto_36953 ) ( SURFACE-AT ?auto_36938 ?auto_36942 ) ( ON ?auto_36938 ?auto_36949 ) ( CLEAR ?auto_36938 ) ( not ( = ?auto_36938 ?auto_36949 ) ) ( not ( = ?auto_36939 ?auto_36949 ) ) ( IS-CRATE ?auto_36939 ) ( not ( = ?auto_36938 ?auto_36945 ) ) ( not ( = ?auto_36939 ?auto_36945 ) ) ( not ( = ?auto_36949 ?auto_36945 ) ) ( not ( = ?auto_36940 ?auto_36952 ) ) ( not ( = ?auto_36942 ?auto_36940 ) ) ( HOIST-AT ?auto_36950 ?auto_36940 ) ( not ( = ?auto_36951 ?auto_36950 ) ) ( not ( = ?auto_36953 ?auto_36950 ) ) ( AVAILABLE ?auto_36950 ) ( SURFACE-AT ?auto_36939 ?auto_36940 ) ( ON ?auto_36939 ?auto_36946 ) ( CLEAR ?auto_36939 ) ( not ( = ?auto_36938 ?auto_36946 ) ) ( not ( = ?auto_36939 ?auto_36946 ) ) ( not ( = ?auto_36949 ?auto_36946 ) ) ( not ( = ?auto_36945 ?auto_36946 ) ) ( SURFACE-AT ?auto_36943 ?auto_36952 ) ( CLEAR ?auto_36943 ) ( IS-CRATE ?auto_36945 ) ( not ( = ?auto_36938 ?auto_36943 ) ) ( not ( = ?auto_36939 ?auto_36943 ) ) ( not ( = ?auto_36949 ?auto_36943 ) ) ( not ( = ?auto_36945 ?auto_36943 ) ) ( not ( = ?auto_36946 ?auto_36943 ) ) ( AVAILABLE ?auto_36951 ) ( not ( = ?auto_36948 ?auto_36952 ) ) ( not ( = ?auto_36942 ?auto_36948 ) ) ( not ( = ?auto_36940 ?auto_36948 ) ) ( HOIST-AT ?auto_36944 ?auto_36948 ) ( not ( = ?auto_36951 ?auto_36944 ) ) ( not ( = ?auto_36953 ?auto_36944 ) ) ( not ( = ?auto_36950 ?auto_36944 ) ) ( AVAILABLE ?auto_36944 ) ( SURFACE-AT ?auto_36945 ?auto_36948 ) ( ON ?auto_36945 ?auto_36947 ) ( CLEAR ?auto_36945 ) ( not ( = ?auto_36938 ?auto_36947 ) ) ( not ( = ?auto_36939 ?auto_36947 ) ) ( not ( = ?auto_36949 ?auto_36947 ) ) ( not ( = ?auto_36945 ?auto_36947 ) ) ( not ( = ?auto_36946 ?auto_36947 ) ) ( not ( = ?auto_36943 ?auto_36947 ) ) ( TRUCK-AT ?auto_36941 ?auto_36952 ) )
    :subtasks
    ( ( !DRIVE ?auto_36941 ?auto_36952 ?auto_36948 )
      ( MAKE-ON ?auto_36938 ?auto_36939 )
      ( MAKE-ON-VERIFY ?auto_36938 ?auto_36939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36954 - SURFACE
      ?auto_36955 - SURFACE
    )
    :vars
    (
      ?auto_36956 - HOIST
      ?auto_36967 - PLACE
      ?auto_36960 - PLACE
      ?auto_36962 - HOIST
      ?auto_36957 - SURFACE
      ?auto_36968 - SURFACE
      ?auto_36966 - PLACE
      ?auto_36965 - HOIST
      ?auto_36959 - SURFACE
      ?auto_36963 - SURFACE
      ?auto_36969 - PLACE
      ?auto_36964 - HOIST
      ?auto_36961 - SURFACE
      ?auto_36958 - TRUCK
      ?auto_36970 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36956 ?auto_36967 ) ( IS-CRATE ?auto_36954 ) ( not ( = ?auto_36954 ?auto_36955 ) ) ( not ( = ?auto_36960 ?auto_36967 ) ) ( HOIST-AT ?auto_36962 ?auto_36960 ) ( not ( = ?auto_36956 ?auto_36962 ) ) ( AVAILABLE ?auto_36962 ) ( SURFACE-AT ?auto_36954 ?auto_36960 ) ( ON ?auto_36954 ?auto_36957 ) ( CLEAR ?auto_36954 ) ( not ( = ?auto_36954 ?auto_36957 ) ) ( not ( = ?auto_36955 ?auto_36957 ) ) ( IS-CRATE ?auto_36955 ) ( not ( = ?auto_36954 ?auto_36968 ) ) ( not ( = ?auto_36955 ?auto_36968 ) ) ( not ( = ?auto_36957 ?auto_36968 ) ) ( not ( = ?auto_36966 ?auto_36967 ) ) ( not ( = ?auto_36960 ?auto_36966 ) ) ( HOIST-AT ?auto_36965 ?auto_36966 ) ( not ( = ?auto_36956 ?auto_36965 ) ) ( not ( = ?auto_36962 ?auto_36965 ) ) ( AVAILABLE ?auto_36965 ) ( SURFACE-AT ?auto_36955 ?auto_36966 ) ( ON ?auto_36955 ?auto_36959 ) ( CLEAR ?auto_36955 ) ( not ( = ?auto_36954 ?auto_36959 ) ) ( not ( = ?auto_36955 ?auto_36959 ) ) ( not ( = ?auto_36957 ?auto_36959 ) ) ( not ( = ?auto_36968 ?auto_36959 ) ) ( IS-CRATE ?auto_36968 ) ( not ( = ?auto_36954 ?auto_36963 ) ) ( not ( = ?auto_36955 ?auto_36963 ) ) ( not ( = ?auto_36957 ?auto_36963 ) ) ( not ( = ?auto_36968 ?auto_36963 ) ) ( not ( = ?auto_36959 ?auto_36963 ) ) ( not ( = ?auto_36969 ?auto_36967 ) ) ( not ( = ?auto_36960 ?auto_36969 ) ) ( not ( = ?auto_36966 ?auto_36969 ) ) ( HOIST-AT ?auto_36964 ?auto_36969 ) ( not ( = ?auto_36956 ?auto_36964 ) ) ( not ( = ?auto_36962 ?auto_36964 ) ) ( not ( = ?auto_36965 ?auto_36964 ) ) ( AVAILABLE ?auto_36964 ) ( SURFACE-AT ?auto_36968 ?auto_36969 ) ( ON ?auto_36968 ?auto_36961 ) ( CLEAR ?auto_36968 ) ( not ( = ?auto_36954 ?auto_36961 ) ) ( not ( = ?auto_36955 ?auto_36961 ) ) ( not ( = ?auto_36957 ?auto_36961 ) ) ( not ( = ?auto_36968 ?auto_36961 ) ) ( not ( = ?auto_36959 ?auto_36961 ) ) ( not ( = ?auto_36963 ?auto_36961 ) ) ( TRUCK-AT ?auto_36958 ?auto_36967 ) ( SURFACE-AT ?auto_36970 ?auto_36967 ) ( CLEAR ?auto_36970 ) ( LIFTING ?auto_36956 ?auto_36963 ) ( IS-CRATE ?auto_36963 ) ( not ( = ?auto_36954 ?auto_36970 ) ) ( not ( = ?auto_36955 ?auto_36970 ) ) ( not ( = ?auto_36957 ?auto_36970 ) ) ( not ( = ?auto_36968 ?auto_36970 ) ) ( not ( = ?auto_36959 ?auto_36970 ) ) ( not ( = ?auto_36963 ?auto_36970 ) ) ( not ( = ?auto_36961 ?auto_36970 ) ) )
    :subtasks
    ( ( !DROP ?auto_36956 ?auto_36963 ?auto_36970 ?auto_36967 )
      ( MAKE-ON ?auto_36954 ?auto_36955 )
      ( MAKE-ON-VERIFY ?auto_36954 ?auto_36955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36971 - SURFACE
      ?auto_36972 - SURFACE
    )
    :vars
    (
      ?auto_36982 - HOIST
      ?auto_36978 - PLACE
      ?auto_36973 - PLACE
      ?auto_36986 - HOIST
      ?auto_36974 - SURFACE
      ?auto_36980 - SURFACE
      ?auto_36977 - PLACE
      ?auto_36987 - HOIST
      ?auto_36976 - SURFACE
      ?auto_36983 - SURFACE
      ?auto_36985 - PLACE
      ?auto_36979 - HOIST
      ?auto_36984 - SURFACE
      ?auto_36981 - TRUCK
      ?auto_36975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_36982 ?auto_36978 ) ( IS-CRATE ?auto_36971 ) ( not ( = ?auto_36971 ?auto_36972 ) ) ( not ( = ?auto_36973 ?auto_36978 ) ) ( HOIST-AT ?auto_36986 ?auto_36973 ) ( not ( = ?auto_36982 ?auto_36986 ) ) ( AVAILABLE ?auto_36986 ) ( SURFACE-AT ?auto_36971 ?auto_36973 ) ( ON ?auto_36971 ?auto_36974 ) ( CLEAR ?auto_36971 ) ( not ( = ?auto_36971 ?auto_36974 ) ) ( not ( = ?auto_36972 ?auto_36974 ) ) ( IS-CRATE ?auto_36972 ) ( not ( = ?auto_36971 ?auto_36980 ) ) ( not ( = ?auto_36972 ?auto_36980 ) ) ( not ( = ?auto_36974 ?auto_36980 ) ) ( not ( = ?auto_36977 ?auto_36978 ) ) ( not ( = ?auto_36973 ?auto_36977 ) ) ( HOIST-AT ?auto_36987 ?auto_36977 ) ( not ( = ?auto_36982 ?auto_36987 ) ) ( not ( = ?auto_36986 ?auto_36987 ) ) ( AVAILABLE ?auto_36987 ) ( SURFACE-AT ?auto_36972 ?auto_36977 ) ( ON ?auto_36972 ?auto_36976 ) ( CLEAR ?auto_36972 ) ( not ( = ?auto_36971 ?auto_36976 ) ) ( not ( = ?auto_36972 ?auto_36976 ) ) ( not ( = ?auto_36974 ?auto_36976 ) ) ( not ( = ?auto_36980 ?auto_36976 ) ) ( IS-CRATE ?auto_36980 ) ( not ( = ?auto_36971 ?auto_36983 ) ) ( not ( = ?auto_36972 ?auto_36983 ) ) ( not ( = ?auto_36974 ?auto_36983 ) ) ( not ( = ?auto_36980 ?auto_36983 ) ) ( not ( = ?auto_36976 ?auto_36983 ) ) ( not ( = ?auto_36985 ?auto_36978 ) ) ( not ( = ?auto_36973 ?auto_36985 ) ) ( not ( = ?auto_36977 ?auto_36985 ) ) ( HOIST-AT ?auto_36979 ?auto_36985 ) ( not ( = ?auto_36982 ?auto_36979 ) ) ( not ( = ?auto_36986 ?auto_36979 ) ) ( not ( = ?auto_36987 ?auto_36979 ) ) ( AVAILABLE ?auto_36979 ) ( SURFACE-AT ?auto_36980 ?auto_36985 ) ( ON ?auto_36980 ?auto_36984 ) ( CLEAR ?auto_36980 ) ( not ( = ?auto_36971 ?auto_36984 ) ) ( not ( = ?auto_36972 ?auto_36984 ) ) ( not ( = ?auto_36974 ?auto_36984 ) ) ( not ( = ?auto_36980 ?auto_36984 ) ) ( not ( = ?auto_36976 ?auto_36984 ) ) ( not ( = ?auto_36983 ?auto_36984 ) ) ( TRUCK-AT ?auto_36981 ?auto_36978 ) ( SURFACE-AT ?auto_36975 ?auto_36978 ) ( CLEAR ?auto_36975 ) ( IS-CRATE ?auto_36983 ) ( not ( = ?auto_36971 ?auto_36975 ) ) ( not ( = ?auto_36972 ?auto_36975 ) ) ( not ( = ?auto_36974 ?auto_36975 ) ) ( not ( = ?auto_36980 ?auto_36975 ) ) ( not ( = ?auto_36976 ?auto_36975 ) ) ( not ( = ?auto_36983 ?auto_36975 ) ) ( not ( = ?auto_36984 ?auto_36975 ) ) ( AVAILABLE ?auto_36982 ) ( IN ?auto_36983 ?auto_36981 ) )
    :subtasks
    ( ( !UNLOAD ?auto_36982 ?auto_36983 ?auto_36981 ?auto_36978 )
      ( MAKE-ON ?auto_36971 ?auto_36972 )
      ( MAKE-ON-VERIFY ?auto_36971 ?auto_36972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36988 - SURFACE
      ?auto_36989 - SURFACE
    )
    :vars
    (
      ?auto_36993 - HOIST
      ?auto_37000 - PLACE
      ?auto_37002 - PLACE
      ?auto_36995 - HOIST
      ?auto_36999 - SURFACE
      ?auto_36997 - SURFACE
      ?auto_36994 - PLACE
      ?auto_37001 - HOIST
      ?auto_37003 - SURFACE
      ?auto_36996 - SURFACE
      ?auto_37004 - PLACE
      ?auto_36991 - HOIST
      ?auto_36998 - SURFACE
      ?auto_36992 - SURFACE
      ?auto_36990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_36993 ?auto_37000 ) ( IS-CRATE ?auto_36988 ) ( not ( = ?auto_36988 ?auto_36989 ) ) ( not ( = ?auto_37002 ?auto_37000 ) ) ( HOIST-AT ?auto_36995 ?auto_37002 ) ( not ( = ?auto_36993 ?auto_36995 ) ) ( AVAILABLE ?auto_36995 ) ( SURFACE-AT ?auto_36988 ?auto_37002 ) ( ON ?auto_36988 ?auto_36999 ) ( CLEAR ?auto_36988 ) ( not ( = ?auto_36988 ?auto_36999 ) ) ( not ( = ?auto_36989 ?auto_36999 ) ) ( IS-CRATE ?auto_36989 ) ( not ( = ?auto_36988 ?auto_36997 ) ) ( not ( = ?auto_36989 ?auto_36997 ) ) ( not ( = ?auto_36999 ?auto_36997 ) ) ( not ( = ?auto_36994 ?auto_37000 ) ) ( not ( = ?auto_37002 ?auto_36994 ) ) ( HOIST-AT ?auto_37001 ?auto_36994 ) ( not ( = ?auto_36993 ?auto_37001 ) ) ( not ( = ?auto_36995 ?auto_37001 ) ) ( AVAILABLE ?auto_37001 ) ( SURFACE-AT ?auto_36989 ?auto_36994 ) ( ON ?auto_36989 ?auto_37003 ) ( CLEAR ?auto_36989 ) ( not ( = ?auto_36988 ?auto_37003 ) ) ( not ( = ?auto_36989 ?auto_37003 ) ) ( not ( = ?auto_36999 ?auto_37003 ) ) ( not ( = ?auto_36997 ?auto_37003 ) ) ( IS-CRATE ?auto_36997 ) ( not ( = ?auto_36988 ?auto_36996 ) ) ( not ( = ?auto_36989 ?auto_36996 ) ) ( not ( = ?auto_36999 ?auto_36996 ) ) ( not ( = ?auto_36997 ?auto_36996 ) ) ( not ( = ?auto_37003 ?auto_36996 ) ) ( not ( = ?auto_37004 ?auto_37000 ) ) ( not ( = ?auto_37002 ?auto_37004 ) ) ( not ( = ?auto_36994 ?auto_37004 ) ) ( HOIST-AT ?auto_36991 ?auto_37004 ) ( not ( = ?auto_36993 ?auto_36991 ) ) ( not ( = ?auto_36995 ?auto_36991 ) ) ( not ( = ?auto_37001 ?auto_36991 ) ) ( AVAILABLE ?auto_36991 ) ( SURFACE-AT ?auto_36997 ?auto_37004 ) ( ON ?auto_36997 ?auto_36998 ) ( CLEAR ?auto_36997 ) ( not ( = ?auto_36988 ?auto_36998 ) ) ( not ( = ?auto_36989 ?auto_36998 ) ) ( not ( = ?auto_36999 ?auto_36998 ) ) ( not ( = ?auto_36997 ?auto_36998 ) ) ( not ( = ?auto_37003 ?auto_36998 ) ) ( not ( = ?auto_36996 ?auto_36998 ) ) ( SURFACE-AT ?auto_36992 ?auto_37000 ) ( CLEAR ?auto_36992 ) ( IS-CRATE ?auto_36996 ) ( not ( = ?auto_36988 ?auto_36992 ) ) ( not ( = ?auto_36989 ?auto_36992 ) ) ( not ( = ?auto_36999 ?auto_36992 ) ) ( not ( = ?auto_36997 ?auto_36992 ) ) ( not ( = ?auto_37003 ?auto_36992 ) ) ( not ( = ?auto_36996 ?auto_36992 ) ) ( not ( = ?auto_36998 ?auto_36992 ) ) ( AVAILABLE ?auto_36993 ) ( IN ?auto_36996 ?auto_36990 ) ( TRUCK-AT ?auto_36990 ?auto_37002 ) )
    :subtasks
    ( ( !DRIVE ?auto_36990 ?auto_37002 ?auto_37000 )
      ( MAKE-ON ?auto_36988 ?auto_36989 )
      ( MAKE-ON-VERIFY ?auto_36988 ?auto_36989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37005 - SURFACE
      ?auto_37006 - SURFACE
    )
    :vars
    (
      ?auto_37011 - HOIST
      ?auto_37016 - PLACE
      ?auto_37009 - PLACE
      ?auto_37021 - HOIST
      ?auto_37008 - SURFACE
      ?auto_37013 - SURFACE
      ?auto_37020 - PLACE
      ?auto_37019 - HOIST
      ?auto_37014 - SURFACE
      ?auto_37018 - SURFACE
      ?auto_37015 - PLACE
      ?auto_37012 - HOIST
      ?auto_37010 - SURFACE
      ?auto_37017 - SURFACE
      ?auto_37007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37011 ?auto_37016 ) ( IS-CRATE ?auto_37005 ) ( not ( = ?auto_37005 ?auto_37006 ) ) ( not ( = ?auto_37009 ?auto_37016 ) ) ( HOIST-AT ?auto_37021 ?auto_37009 ) ( not ( = ?auto_37011 ?auto_37021 ) ) ( SURFACE-AT ?auto_37005 ?auto_37009 ) ( ON ?auto_37005 ?auto_37008 ) ( CLEAR ?auto_37005 ) ( not ( = ?auto_37005 ?auto_37008 ) ) ( not ( = ?auto_37006 ?auto_37008 ) ) ( IS-CRATE ?auto_37006 ) ( not ( = ?auto_37005 ?auto_37013 ) ) ( not ( = ?auto_37006 ?auto_37013 ) ) ( not ( = ?auto_37008 ?auto_37013 ) ) ( not ( = ?auto_37020 ?auto_37016 ) ) ( not ( = ?auto_37009 ?auto_37020 ) ) ( HOIST-AT ?auto_37019 ?auto_37020 ) ( not ( = ?auto_37011 ?auto_37019 ) ) ( not ( = ?auto_37021 ?auto_37019 ) ) ( AVAILABLE ?auto_37019 ) ( SURFACE-AT ?auto_37006 ?auto_37020 ) ( ON ?auto_37006 ?auto_37014 ) ( CLEAR ?auto_37006 ) ( not ( = ?auto_37005 ?auto_37014 ) ) ( not ( = ?auto_37006 ?auto_37014 ) ) ( not ( = ?auto_37008 ?auto_37014 ) ) ( not ( = ?auto_37013 ?auto_37014 ) ) ( IS-CRATE ?auto_37013 ) ( not ( = ?auto_37005 ?auto_37018 ) ) ( not ( = ?auto_37006 ?auto_37018 ) ) ( not ( = ?auto_37008 ?auto_37018 ) ) ( not ( = ?auto_37013 ?auto_37018 ) ) ( not ( = ?auto_37014 ?auto_37018 ) ) ( not ( = ?auto_37015 ?auto_37016 ) ) ( not ( = ?auto_37009 ?auto_37015 ) ) ( not ( = ?auto_37020 ?auto_37015 ) ) ( HOIST-AT ?auto_37012 ?auto_37015 ) ( not ( = ?auto_37011 ?auto_37012 ) ) ( not ( = ?auto_37021 ?auto_37012 ) ) ( not ( = ?auto_37019 ?auto_37012 ) ) ( AVAILABLE ?auto_37012 ) ( SURFACE-AT ?auto_37013 ?auto_37015 ) ( ON ?auto_37013 ?auto_37010 ) ( CLEAR ?auto_37013 ) ( not ( = ?auto_37005 ?auto_37010 ) ) ( not ( = ?auto_37006 ?auto_37010 ) ) ( not ( = ?auto_37008 ?auto_37010 ) ) ( not ( = ?auto_37013 ?auto_37010 ) ) ( not ( = ?auto_37014 ?auto_37010 ) ) ( not ( = ?auto_37018 ?auto_37010 ) ) ( SURFACE-AT ?auto_37017 ?auto_37016 ) ( CLEAR ?auto_37017 ) ( IS-CRATE ?auto_37018 ) ( not ( = ?auto_37005 ?auto_37017 ) ) ( not ( = ?auto_37006 ?auto_37017 ) ) ( not ( = ?auto_37008 ?auto_37017 ) ) ( not ( = ?auto_37013 ?auto_37017 ) ) ( not ( = ?auto_37014 ?auto_37017 ) ) ( not ( = ?auto_37018 ?auto_37017 ) ) ( not ( = ?auto_37010 ?auto_37017 ) ) ( AVAILABLE ?auto_37011 ) ( TRUCK-AT ?auto_37007 ?auto_37009 ) ( LIFTING ?auto_37021 ?auto_37018 ) )
    :subtasks
    ( ( !LOAD ?auto_37021 ?auto_37018 ?auto_37007 ?auto_37009 )
      ( MAKE-ON ?auto_37005 ?auto_37006 )
      ( MAKE-ON-VERIFY ?auto_37005 ?auto_37006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37022 - SURFACE
      ?auto_37023 - SURFACE
    )
    :vars
    (
      ?auto_37028 - HOIST
      ?auto_37034 - PLACE
      ?auto_37030 - PLACE
      ?auto_37031 - HOIST
      ?auto_37037 - SURFACE
      ?auto_37038 - SURFACE
      ?auto_37025 - PLACE
      ?auto_37036 - HOIST
      ?auto_37027 - SURFACE
      ?auto_37035 - SURFACE
      ?auto_37024 - PLACE
      ?auto_37033 - HOIST
      ?auto_37032 - SURFACE
      ?auto_37029 - SURFACE
      ?auto_37026 - TRUCK
      ?auto_37039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37028 ?auto_37034 ) ( IS-CRATE ?auto_37022 ) ( not ( = ?auto_37022 ?auto_37023 ) ) ( not ( = ?auto_37030 ?auto_37034 ) ) ( HOIST-AT ?auto_37031 ?auto_37030 ) ( not ( = ?auto_37028 ?auto_37031 ) ) ( SURFACE-AT ?auto_37022 ?auto_37030 ) ( ON ?auto_37022 ?auto_37037 ) ( CLEAR ?auto_37022 ) ( not ( = ?auto_37022 ?auto_37037 ) ) ( not ( = ?auto_37023 ?auto_37037 ) ) ( IS-CRATE ?auto_37023 ) ( not ( = ?auto_37022 ?auto_37038 ) ) ( not ( = ?auto_37023 ?auto_37038 ) ) ( not ( = ?auto_37037 ?auto_37038 ) ) ( not ( = ?auto_37025 ?auto_37034 ) ) ( not ( = ?auto_37030 ?auto_37025 ) ) ( HOIST-AT ?auto_37036 ?auto_37025 ) ( not ( = ?auto_37028 ?auto_37036 ) ) ( not ( = ?auto_37031 ?auto_37036 ) ) ( AVAILABLE ?auto_37036 ) ( SURFACE-AT ?auto_37023 ?auto_37025 ) ( ON ?auto_37023 ?auto_37027 ) ( CLEAR ?auto_37023 ) ( not ( = ?auto_37022 ?auto_37027 ) ) ( not ( = ?auto_37023 ?auto_37027 ) ) ( not ( = ?auto_37037 ?auto_37027 ) ) ( not ( = ?auto_37038 ?auto_37027 ) ) ( IS-CRATE ?auto_37038 ) ( not ( = ?auto_37022 ?auto_37035 ) ) ( not ( = ?auto_37023 ?auto_37035 ) ) ( not ( = ?auto_37037 ?auto_37035 ) ) ( not ( = ?auto_37038 ?auto_37035 ) ) ( not ( = ?auto_37027 ?auto_37035 ) ) ( not ( = ?auto_37024 ?auto_37034 ) ) ( not ( = ?auto_37030 ?auto_37024 ) ) ( not ( = ?auto_37025 ?auto_37024 ) ) ( HOIST-AT ?auto_37033 ?auto_37024 ) ( not ( = ?auto_37028 ?auto_37033 ) ) ( not ( = ?auto_37031 ?auto_37033 ) ) ( not ( = ?auto_37036 ?auto_37033 ) ) ( AVAILABLE ?auto_37033 ) ( SURFACE-AT ?auto_37038 ?auto_37024 ) ( ON ?auto_37038 ?auto_37032 ) ( CLEAR ?auto_37038 ) ( not ( = ?auto_37022 ?auto_37032 ) ) ( not ( = ?auto_37023 ?auto_37032 ) ) ( not ( = ?auto_37037 ?auto_37032 ) ) ( not ( = ?auto_37038 ?auto_37032 ) ) ( not ( = ?auto_37027 ?auto_37032 ) ) ( not ( = ?auto_37035 ?auto_37032 ) ) ( SURFACE-AT ?auto_37029 ?auto_37034 ) ( CLEAR ?auto_37029 ) ( IS-CRATE ?auto_37035 ) ( not ( = ?auto_37022 ?auto_37029 ) ) ( not ( = ?auto_37023 ?auto_37029 ) ) ( not ( = ?auto_37037 ?auto_37029 ) ) ( not ( = ?auto_37038 ?auto_37029 ) ) ( not ( = ?auto_37027 ?auto_37029 ) ) ( not ( = ?auto_37035 ?auto_37029 ) ) ( not ( = ?auto_37032 ?auto_37029 ) ) ( AVAILABLE ?auto_37028 ) ( TRUCK-AT ?auto_37026 ?auto_37030 ) ( AVAILABLE ?auto_37031 ) ( SURFACE-AT ?auto_37035 ?auto_37030 ) ( ON ?auto_37035 ?auto_37039 ) ( CLEAR ?auto_37035 ) ( not ( = ?auto_37022 ?auto_37039 ) ) ( not ( = ?auto_37023 ?auto_37039 ) ) ( not ( = ?auto_37037 ?auto_37039 ) ) ( not ( = ?auto_37038 ?auto_37039 ) ) ( not ( = ?auto_37027 ?auto_37039 ) ) ( not ( = ?auto_37035 ?auto_37039 ) ) ( not ( = ?auto_37032 ?auto_37039 ) ) ( not ( = ?auto_37029 ?auto_37039 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37031 ?auto_37035 ?auto_37039 ?auto_37030 )
      ( MAKE-ON ?auto_37022 ?auto_37023 )
      ( MAKE-ON-VERIFY ?auto_37022 ?auto_37023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37040 - SURFACE
      ?auto_37041 - SURFACE
    )
    :vars
    (
      ?auto_37042 - HOIST
      ?auto_37055 - PLACE
      ?auto_37045 - PLACE
      ?auto_37051 - HOIST
      ?auto_37057 - SURFACE
      ?auto_37046 - SURFACE
      ?auto_37056 - PLACE
      ?auto_37053 - HOIST
      ?auto_37050 - SURFACE
      ?auto_37054 - SURFACE
      ?auto_37049 - PLACE
      ?auto_37043 - HOIST
      ?auto_37048 - SURFACE
      ?auto_37044 - SURFACE
      ?auto_37047 - SURFACE
      ?auto_37052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37042 ?auto_37055 ) ( IS-CRATE ?auto_37040 ) ( not ( = ?auto_37040 ?auto_37041 ) ) ( not ( = ?auto_37045 ?auto_37055 ) ) ( HOIST-AT ?auto_37051 ?auto_37045 ) ( not ( = ?auto_37042 ?auto_37051 ) ) ( SURFACE-AT ?auto_37040 ?auto_37045 ) ( ON ?auto_37040 ?auto_37057 ) ( CLEAR ?auto_37040 ) ( not ( = ?auto_37040 ?auto_37057 ) ) ( not ( = ?auto_37041 ?auto_37057 ) ) ( IS-CRATE ?auto_37041 ) ( not ( = ?auto_37040 ?auto_37046 ) ) ( not ( = ?auto_37041 ?auto_37046 ) ) ( not ( = ?auto_37057 ?auto_37046 ) ) ( not ( = ?auto_37056 ?auto_37055 ) ) ( not ( = ?auto_37045 ?auto_37056 ) ) ( HOIST-AT ?auto_37053 ?auto_37056 ) ( not ( = ?auto_37042 ?auto_37053 ) ) ( not ( = ?auto_37051 ?auto_37053 ) ) ( AVAILABLE ?auto_37053 ) ( SURFACE-AT ?auto_37041 ?auto_37056 ) ( ON ?auto_37041 ?auto_37050 ) ( CLEAR ?auto_37041 ) ( not ( = ?auto_37040 ?auto_37050 ) ) ( not ( = ?auto_37041 ?auto_37050 ) ) ( not ( = ?auto_37057 ?auto_37050 ) ) ( not ( = ?auto_37046 ?auto_37050 ) ) ( IS-CRATE ?auto_37046 ) ( not ( = ?auto_37040 ?auto_37054 ) ) ( not ( = ?auto_37041 ?auto_37054 ) ) ( not ( = ?auto_37057 ?auto_37054 ) ) ( not ( = ?auto_37046 ?auto_37054 ) ) ( not ( = ?auto_37050 ?auto_37054 ) ) ( not ( = ?auto_37049 ?auto_37055 ) ) ( not ( = ?auto_37045 ?auto_37049 ) ) ( not ( = ?auto_37056 ?auto_37049 ) ) ( HOIST-AT ?auto_37043 ?auto_37049 ) ( not ( = ?auto_37042 ?auto_37043 ) ) ( not ( = ?auto_37051 ?auto_37043 ) ) ( not ( = ?auto_37053 ?auto_37043 ) ) ( AVAILABLE ?auto_37043 ) ( SURFACE-AT ?auto_37046 ?auto_37049 ) ( ON ?auto_37046 ?auto_37048 ) ( CLEAR ?auto_37046 ) ( not ( = ?auto_37040 ?auto_37048 ) ) ( not ( = ?auto_37041 ?auto_37048 ) ) ( not ( = ?auto_37057 ?auto_37048 ) ) ( not ( = ?auto_37046 ?auto_37048 ) ) ( not ( = ?auto_37050 ?auto_37048 ) ) ( not ( = ?auto_37054 ?auto_37048 ) ) ( SURFACE-AT ?auto_37044 ?auto_37055 ) ( CLEAR ?auto_37044 ) ( IS-CRATE ?auto_37054 ) ( not ( = ?auto_37040 ?auto_37044 ) ) ( not ( = ?auto_37041 ?auto_37044 ) ) ( not ( = ?auto_37057 ?auto_37044 ) ) ( not ( = ?auto_37046 ?auto_37044 ) ) ( not ( = ?auto_37050 ?auto_37044 ) ) ( not ( = ?auto_37054 ?auto_37044 ) ) ( not ( = ?auto_37048 ?auto_37044 ) ) ( AVAILABLE ?auto_37042 ) ( AVAILABLE ?auto_37051 ) ( SURFACE-AT ?auto_37054 ?auto_37045 ) ( ON ?auto_37054 ?auto_37047 ) ( CLEAR ?auto_37054 ) ( not ( = ?auto_37040 ?auto_37047 ) ) ( not ( = ?auto_37041 ?auto_37047 ) ) ( not ( = ?auto_37057 ?auto_37047 ) ) ( not ( = ?auto_37046 ?auto_37047 ) ) ( not ( = ?auto_37050 ?auto_37047 ) ) ( not ( = ?auto_37054 ?auto_37047 ) ) ( not ( = ?auto_37048 ?auto_37047 ) ) ( not ( = ?auto_37044 ?auto_37047 ) ) ( TRUCK-AT ?auto_37052 ?auto_37055 ) )
    :subtasks
    ( ( !DRIVE ?auto_37052 ?auto_37055 ?auto_37045 )
      ( MAKE-ON ?auto_37040 ?auto_37041 )
      ( MAKE-ON-VERIFY ?auto_37040 ?auto_37041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37058 - SURFACE
      ?auto_37059 - SURFACE
    )
    :vars
    (
      ?auto_37062 - HOIST
      ?auto_37066 - PLACE
      ?auto_37069 - PLACE
      ?auto_37073 - HOIST
      ?auto_37072 - SURFACE
      ?auto_37068 - SURFACE
      ?auto_37064 - PLACE
      ?auto_37074 - HOIST
      ?auto_37065 - SURFACE
      ?auto_37071 - SURFACE
      ?auto_37075 - PLACE
      ?auto_37063 - HOIST
      ?auto_37061 - SURFACE
      ?auto_37070 - SURFACE
      ?auto_37067 - SURFACE
      ?auto_37060 - TRUCK
      ?auto_37076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37062 ?auto_37066 ) ( IS-CRATE ?auto_37058 ) ( not ( = ?auto_37058 ?auto_37059 ) ) ( not ( = ?auto_37069 ?auto_37066 ) ) ( HOIST-AT ?auto_37073 ?auto_37069 ) ( not ( = ?auto_37062 ?auto_37073 ) ) ( SURFACE-AT ?auto_37058 ?auto_37069 ) ( ON ?auto_37058 ?auto_37072 ) ( CLEAR ?auto_37058 ) ( not ( = ?auto_37058 ?auto_37072 ) ) ( not ( = ?auto_37059 ?auto_37072 ) ) ( IS-CRATE ?auto_37059 ) ( not ( = ?auto_37058 ?auto_37068 ) ) ( not ( = ?auto_37059 ?auto_37068 ) ) ( not ( = ?auto_37072 ?auto_37068 ) ) ( not ( = ?auto_37064 ?auto_37066 ) ) ( not ( = ?auto_37069 ?auto_37064 ) ) ( HOIST-AT ?auto_37074 ?auto_37064 ) ( not ( = ?auto_37062 ?auto_37074 ) ) ( not ( = ?auto_37073 ?auto_37074 ) ) ( AVAILABLE ?auto_37074 ) ( SURFACE-AT ?auto_37059 ?auto_37064 ) ( ON ?auto_37059 ?auto_37065 ) ( CLEAR ?auto_37059 ) ( not ( = ?auto_37058 ?auto_37065 ) ) ( not ( = ?auto_37059 ?auto_37065 ) ) ( not ( = ?auto_37072 ?auto_37065 ) ) ( not ( = ?auto_37068 ?auto_37065 ) ) ( IS-CRATE ?auto_37068 ) ( not ( = ?auto_37058 ?auto_37071 ) ) ( not ( = ?auto_37059 ?auto_37071 ) ) ( not ( = ?auto_37072 ?auto_37071 ) ) ( not ( = ?auto_37068 ?auto_37071 ) ) ( not ( = ?auto_37065 ?auto_37071 ) ) ( not ( = ?auto_37075 ?auto_37066 ) ) ( not ( = ?auto_37069 ?auto_37075 ) ) ( not ( = ?auto_37064 ?auto_37075 ) ) ( HOIST-AT ?auto_37063 ?auto_37075 ) ( not ( = ?auto_37062 ?auto_37063 ) ) ( not ( = ?auto_37073 ?auto_37063 ) ) ( not ( = ?auto_37074 ?auto_37063 ) ) ( AVAILABLE ?auto_37063 ) ( SURFACE-AT ?auto_37068 ?auto_37075 ) ( ON ?auto_37068 ?auto_37061 ) ( CLEAR ?auto_37068 ) ( not ( = ?auto_37058 ?auto_37061 ) ) ( not ( = ?auto_37059 ?auto_37061 ) ) ( not ( = ?auto_37072 ?auto_37061 ) ) ( not ( = ?auto_37068 ?auto_37061 ) ) ( not ( = ?auto_37065 ?auto_37061 ) ) ( not ( = ?auto_37071 ?auto_37061 ) ) ( IS-CRATE ?auto_37071 ) ( not ( = ?auto_37058 ?auto_37070 ) ) ( not ( = ?auto_37059 ?auto_37070 ) ) ( not ( = ?auto_37072 ?auto_37070 ) ) ( not ( = ?auto_37068 ?auto_37070 ) ) ( not ( = ?auto_37065 ?auto_37070 ) ) ( not ( = ?auto_37071 ?auto_37070 ) ) ( not ( = ?auto_37061 ?auto_37070 ) ) ( AVAILABLE ?auto_37073 ) ( SURFACE-AT ?auto_37071 ?auto_37069 ) ( ON ?auto_37071 ?auto_37067 ) ( CLEAR ?auto_37071 ) ( not ( = ?auto_37058 ?auto_37067 ) ) ( not ( = ?auto_37059 ?auto_37067 ) ) ( not ( = ?auto_37072 ?auto_37067 ) ) ( not ( = ?auto_37068 ?auto_37067 ) ) ( not ( = ?auto_37065 ?auto_37067 ) ) ( not ( = ?auto_37071 ?auto_37067 ) ) ( not ( = ?auto_37061 ?auto_37067 ) ) ( not ( = ?auto_37070 ?auto_37067 ) ) ( TRUCK-AT ?auto_37060 ?auto_37066 ) ( SURFACE-AT ?auto_37076 ?auto_37066 ) ( CLEAR ?auto_37076 ) ( LIFTING ?auto_37062 ?auto_37070 ) ( IS-CRATE ?auto_37070 ) ( not ( = ?auto_37058 ?auto_37076 ) ) ( not ( = ?auto_37059 ?auto_37076 ) ) ( not ( = ?auto_37072 ?auto_37076 ) ) ( not ( = ?auto_37068 ?auto_37076 ) ) ( not ( = ?auto_37065 ?auto_37076 ) ) ( not ( = ?auto_37071 ?auto_37076 ) ) ( not ( = ?auto_37061 ?auto_37076 ) ) ( not ( = ?auto_37070 ?auto_37076 ) ) ( not ( = ?auto_37067 ?auto_37076 ) ) )
    :subtasks
    ( ( !DROP ?auto_37062 ?auto_37070 ?auto_37076 ?auto_37066 )
      ( MAKE-ON ?auto_37058 ?auto_37059 )
      ( MAKE-ON-VERIFY ?auto_37058 ?auto_37059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37077 - SURFACE
      ?auto_37078 - SURFACE
    )
    :vars
    (
      ?auto_37085 - HOIST
      ?auto_37087 - PLACE
      ?auto_37092 - PLACE
      ?auto_37094 - HOIST
      ?auto_37091 - SURFACE
      ?auto_37095 - SURFACE
      ?auto_37083 - PLACE
      ?auto_37093 - HOIST
      ?auto_37089 - SURFACE
      ?auto_37080 - SURFACE
      ?auto_37081 - PLACE
      ?auto_37082 - HOIST
      ?auto_37086 - SURFACE
      ?auto_37084 - SURFACE
      ?auto_37088 - SURFACE
      ?auto_37079 - TRUCK
      ?auto_37090 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37085 ?auto_37087 ) ( IS-CRATE ?auto_37077 ) ( not ( = ?auto_37077 ?auto_37078 ) ) ( not ( = ?auto_37092 ?auto_37087 ) ) ( HOIST-AT ?auto_37094 ?auto_37092 ) ( not ( = ?auto_37085 ?auto_37094 ) ) ( SURFACE-AT ?auto_37077 ?auto_37092 ) ( ON ?auto_37077 ?auto_37091 ) ( CLEAR ?auto_37077 ) ( not ( = ?auto_37077 ?auto_37091 ) ) ( not ( = ?auto_37078 ?auto_37091 ) ) ( IS-CRATE ?auto_37078 ) ( not ( = ?auto_37077 ?auto_37095 ) ) ( not ( = ?auto_37078 ?auto_37095 ) ) ( not ( = ?auto_37091 ?auto_37095 ) ) ( not ( = ?auto_37083 ?auto_37087 ) ) ( not ( = ?auto_37092 ?auto_37083 ) ) ( HOIST-AT ?auto_37093 ?auto_37083 ) ( not ( = ?auto_37085 ?auto_37093 ) ) ( not ( = ?auto_37094 ?auto_37093 ) ) ( AVAILABLE ?auto_37093 ) ( SURFACE-AT ?auto_37078 ?auto_37083 ) ( ON ?auto_37078 ?auto_37089 ) ( CLEAR ?auto_37078 ) ( not ( = ?auto_37077 ?auto_37089 ) ) ( not ( = ?auto_37078 ?auto_37089 ) ) ( not ( = ?auto_37091 ?auto_37089 ) ) ( not ( = ?auto_37095 ?auto_37089 ) ) ( IS-CRATE ?auto_37095 ) ( not ( = ?auto_37077 ?auto_37080 ) ) ( not ( = ?auto_37078 ?auto_37080 ) ) ( not ( = ?auto_37091 ?auto_37080 ) ) ( not ( = ?auto_37095 ?auto_37080 ) ) ( not ( = ?auto_37089 ?auto_37080 ) ) ( not ( = ?auto_37081 ?auto_37087 ) ) ( not ( = ?auto_37092 ?auto_37081 ) ) ( not ( = ?auto_37083 ?auto_37081 ) ) ( HOIST-AT ?auto_37082 ?auto_37081 ) ( not ( = ?auto_37085 ?auto_37082 ) ) ( not ( = ?auto_37094 ?auto_37082 ) ) ( not ( = ?auto_37093 ?auto_37082 ) ) ( AVAILABLE ?auto_37082 ) ( SURFACE-AT ?auto_37095 ?auto_37081 ) ( ON ?auto_37095 ?auto_37086 ) ( CLEAR ?auto_37095 ) ( not ( = ?auto_37077 ?auto_37086 ) ) ( not ( = ?auto_37078 ?auto_37086 ) ) ( not ( = ?auto_37091 ?auto_37086 ) ) ( not ( = ?auto_37095 ?auto_37086 ) ) ( not ( = ?auto_37089 ?auto_37086 ) ) ( not ( = ?auto_37080 ?auto_37086 ) ) ( IS-CRATE ?auto_37080 ) ( not ( = ?auto_37077 ?auto_37084 ) ) ( not ( = ?auto_37078 ?auto_37084 ) ) ( not ( = ?auto_37091 ?auto_37084 ) ) ( not ( = ?auto_37095 ?auto_37084 ) ) ( not ( = ?auto_37089 ?auto_37084 ) ) ( not ( = ?auto_37080 ?auto_37084 ) ) ( not ( = ?auto_37086 ?auto_37084 ) ) ( AVAILABLE ?auto_37094 ) ( SURFACE-AT ?auto_37080 ?auto_37092 ) ( ON ?auto_37080 ?auto_37088 ) ( CLEAR ?auto_37080 ) ( not ( = ?auto_37077 ?auto_37088 ) ) ( not ( = ?auto_37078 ?auto_37088 ) ) ( not ( = ?auto_37091 ?auto_37088 ) ) ( not ( = ?auto_37095 ?auto_37088 ) ) ( not ( = ?auto_37089 ?auto_37088 ) ) ( not ( = ?auto_37080 ?auto_37088 ) ) ( not ( = ?auto_37086 ?auto_37088 ) ) ( not ( = ?auto_37084 ?auto_37088 ) ) ( TRUCK-AT ?auto_37079 ?auto_37087 ) ( SURFACE-AT ?auto_37090 ?auto_37087 ) ( CLEAR ?auto_37090 ) ( IS-CRATE ?auto_37084 ) ( not ( = ?auto_37077 ?auto_37090 ) ) ( not ( = ?auto_37078 ?auto_37090 ) ) ( not ( = ?auto_37091 ?auto_37090 ) ) ( not ( = ?auto_37095 ?auto_37090 ) ) ( not ( = ?auto_37089 ?auto_37090 ) ) ( not ( = ?auto_37080 ?auto_37090 ) ) ( not ( = ?auto_37086 ?auto_37090 ) ) ( not ( = ?auto_37084 ?auto_37090 ) ) ( not ( = ?auto_37088 ?auto_37090 ) ) ( AVAILABLE ?auto_37085 ) ( IN ?auto_37084 ?auto_37079 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37085 ?auto_37084 ?auto_37079 ?auto_37087 )
      ( MAKE-ON ?auto_37077 ?auto_37078 )
      ( MAKE-ON-VERIFY ?auto_37077 ?auto_37078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37096 - SURFACE
      ?auto_37097 - SURFACE
    )
    :vars
    (
      ?auto_37100 - HOIST
      ?auto_37112 - PLACE
      ?auto_37103 - PLACE
      ?auto_37098 - HOIST
      ?auto_37109 - SURFACE
      ?auto_37099 - SURFACE
      ?auto_37104 - PLACE
      ?auto_37105 - HOIST
      ?auto_37108 - SURFACE
      ?auto_37102 - SURFACE
      ?auto_37101 - PLACE
      ?auto_37113 - HOIST
      ?auto_37106 - SURFACE
      ?auto_37110 - SURFACE
      ?auto_37114 - SURFACE
      ?auto_37111 - SURFACE
      ?auto_37107 - TRUCK
      ?auto_37115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37100 ?auto_37112 ) ( IS-CRATE ?auto_37096 ) ( not ( = ?auto_37096 ?auto_37097 ) ) ( not ( = ?auto_37103 ?auto_37112 ) ) ( HOIST-AT ?auto_37098 ?auto_37103 ) ( not ( = ?auto_37100 ?auto_37098 ) ) ( SURFACE-AT ?auto_37096 ?auto_37103 ) ( ON ?auto_37096 ?auto_37109 ) ( CLEAR ?auto_37096 ) ( not ( = ?auto_37096 ?auto_37109 ) ) ( not ( = ?auto_37097 ?auto_37109 ) ) ( IS-CRATE ?auto_37097 ) ( not ( = ?auto_37096 ?auto_37099 ) ) ( not ( = ?auto_37097 ?auto_37099 ) ) ( not ( = ?auto_37109 ?auto_37099 ) ) ( not ( = ?auto_37104 ?auto_37112 ) ) ( not ( = ?auto_37103 ?auto_37104 ) ) ( HOIST-AT ?auto_37105 ?auto_37104 ) ( not ( = ?auto_37100 ?auto_37105 ) ) ( not ( = ?auto_37098 ?auto_37105 ) ) ( AVAILABLE ?auto_37105 ) ( SURFACE-AT ?auto_37097 ?auto_37104 ) ( ON ?auto_37097 ?auto_37108 ) ( CLEAR ?auto_37097 ) ( not ( = ?auto_37096 ?auto_37108 ) ) ( not ( = ?auto_37097 ?auto_37108 ) ) ( not ( = ?auto_37109 ?auto_37108 ) ) ( not ( = ?auto_37099 ?auto_37108 ) ) ( IS-CRATE ?auto_37099 ) ( not ( = ?auto_37096 ?auto_37102 ) ) ( not ( = ?auto_37097 ?auto_37102 ) ) ( not ( = ?auto_37109 ?auto_37102 ) ) ( not ( = ?auto_37099 ?auto_37102 ) ) ( not ( = ?auto_37108 ?auto_37102 ) ) ( not ( = ?auto_37101 ?auto_37112 ) ) ( not ( = ?auto_37103 ?auto_37101 ) ) ( not ( = ?auto_37104 ?auto_37101 ) ) ( HOIST-AT ?auto_37113 ?auto_37101 ) ( not ( = ?auto_37100 ?auto_37113 ) ) ( not ( = ?auto_37098 ?auto_37113 ) ) ( not ( = ?auto_37105 ?auto_37113 ) ) ( AVAILABLE ?auto_37113 ) ( SURFACE-AT ?auto_37099 ?auto_37101 ) ( ON ?auto_37099 ?auto_37106 ) ( CLEAR ?auto_37099 ) ( not ( = ?auto_37096 ?auto_37106 ) ) ( not ( = ?auto_37097 ?auto_37106 ) ) ( not ( = ?auto_37109 ?auto_37106 ) ) ( not ( = ?auto_37099 ?auto_37106 ) ) ( not ( = ?auto_37108 ?auto_37106 ) ) ( not ( = ?auto_37102 ?auto_37106 ) ) ( IS-CRATE ?auto_37102 ) ( not ( = ?auto_37096 ?auto_37110 ) ) ( not ( = ?auto_37097 ?auto_37110 ) ) ( not ( = ?auto_37109 ?auto_37110 ) ) ( not ( = ?auto_37099 ?auto_37110 ) ) ( not ( = ?auto_37108 ?auto_37110 ) ) ( not ( = ?auto_37102 ?auto_37110 ) ) ( not ( = ?auto_37106 ?auto_37110 ) ) ( AVAILABLE ?auto_37098 ) ( SURFACE-AT ?auto_37102 ?auto_37103 ) ( ON ?auto_37102 ?auto_37114 ) ( CLEAR ?auto_37102 ) ( not ( = ?auto_37096 ?auto_37114 ) ) ( not ( = ?auto_37097 ?auto_37114 ) ) ( not ( = ?auto_37109 ?auto_37114 ) ) ( not ( = ?auto_37099 ?auto_37114 ) ) ( not ( = ?auto_37108 ?auto_37114 ) ) ( not ( = ?auto_37102 ?auto_37114 ) ) ( not ( = ?auto_37106 ?auto_37114 ) ) ( not ( = ?auto_37110 ?auto_37114 ) ) ( SURFACE-AT ?auto_37111 ?auto_37112 ) ( CLEAR ?auto_37111 ) ( IS-CRATE ?auto_37110 ) ( not ( = ?auto_37096 ?auto_37111 ) ) ( not ( = ?auto_37097 ?auto_37111 ) ) ( not ( = ?auto_37109 ?auto_37111 ) ) ( not ( = ?auto_37099 ?auto_37111 ) ) ( not ( = ?auto_37108 ?auto_37111 ) ) ( not ( = ?auto_37102 ?auto_37111 ) ) ( not ( = ?auto_37106 ?auto_37111 ) ) ( not ( = ?auto_37110 ?auto_37111 ) ) ( not ( = ?auto_37114 ?auto_37111 ) ) ( AVAILABLE ?auto_37100 ) ( IN ?auto_37110 ?auto_37107 ) ( TRUCK-AT ?auto_37107 ?auto_37115 ) ( not ( = ?auto_37115 ?auto_37112 ) ) ( not ( = ?auto_37103 ?auto_37115 ) ) ( not ( = ?auto_37104 ?auto_37115 ) ) ( not ( = ?auto_37101 ?auto_37115 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37107 ?auto_37115 ?auto_37112 )
      ( MAKE-ON ?auto_37096 ?auto_37097 )
      ( MAKE-ON-VERIFY ?auto_37096 ?auto_37097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37116 - SURFACE
      ?auto_37117 - SURFACE
    )
    :vars
    (
      ?auto_37124 - HOIST
      ?auto_37130 - PLACE
      ?auto_37126 - PLACE
      ?auto_37120 - HOIST
      ?auto_37131 - SURFACE
      ?auto_37128 - SURFACE
      ?auto_37122 - PLACE
      ?auto_37133 - HOIST
      ?auto_37127 - SURFACE
      ?auto_37118 - SURFACE
      ?auto_37119 - PLACE
      ?auto_37135 - HOIST
      ?auto_37123 - SURFACE
      ?auto_37121 - SURFACE
      ?auto_37129 - SURFACE
      ?auto_37125 - SURFACE
      ?auto_37132 - TRUCK
      ?auto_37134 - PLACE
      ?auto_37136 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37124 ?auto_37130 ) ( IS-CRATE ?auto_37116 ) ( not ( = ?auto_37116 ?auto_37117 ) ) ( not ( = ?auto_37126 ?auto_37130 ) ) ( HOIST-AT ?auto_37120 ?auto_37126 ) ( not ( = ?auto_37124 ?auto_37120 ) ) ( SURFACE-AT ?auto_37116 ?auto_37126 ) ( ON ?auto_37116 ?auto_37131 ) ( CLEAR ?auto_37116 ) ( not ( = ?auto_37116 ?auto_37131 ) ) ( not ( = ?auto_37117 ?auto_37131 ) ) ( IS-CRATE ?auto_37117 ) ( not ( = ?auto_37116 ?auto_37128 ) ) ( not ( = ?auto_37117 ?auto_37128 ) ) ( not ( = ?auto_37131 ?auto_37128 ) ) ( not ( = ?auto_37122 ?auto_37130 ) ) ( not ( = ?auto_37126 ?auto_37122 ) ) ( HOIST-AT ?auto_37133 ?auto_37122 ) ( not ( = ?auto_37124 ?auto_37133 ) ) ( not ( = ?auto_37120 ?auto_37133 ) ) ( AVAILABLE ?auto_37133 ) ( SURFACE-AT ?auto_37117 ?auto_37122 ) ( ON ?auto_37117 ?auto_37127 ) ( CLEAR ?auto_37117 ) ( not ( = ?auto_37116 ?auto_37127 ) ) ( not ( = ?auto_37117 ?auto_37127 ) ) ( not ( = ?auto_37131 ?auto_37127 ) ) ( not ( = ?auto_37128 ?auto_37127 ) ) ( IS-CRATE ?auto_37128 ) ( not ( = ?auto_37116 ?auto_37118 ) ) ( not ( = ?auto_37117 ?auto_37118 ) ) ( not ( = ?auto_37131 ?auto_37118 ) ) ( not ( = ?auto_37128 ?auto_37118 ) ) ( not ( = ?auto_37127 ?auto_37118 ) ) ( not ( = ?auto_37119 ?auto_37130 ) ) ( not ( = ?auto_37126 ?auto_37119 ) ) ( not ( = ?auto_37122 ?auto_37119 ) ) ( HOIST-AT ?auto_37135 ?auto_37119 ) ( not ( = ?auto_37124 ?auto_37135 ) ) ( not ( = ?auto_37120 ?auto_37135 ) ) ( not ( = ?auto_37133 ?auto_37135 ) ) ( AVAILABLE ?auto_37135 ) ( SURFACE-AT ?auto_37128 ?auto_37119 ) ( ON ?auto_37128 ?auto_37123 ) ( CLEAR ?auto_37128 ) ( not ( = ?auto_37116 ?auto_37123 ) ) ( not ( = ?auto_37117 ?auto_37123 ) ) ( not ( = ?auto_37131 ?auto_37123 ) ) ( not ( = ?auto_37128 ?auto_37123 ) ) ( not ( = ?auto_37127 ?auto_37123 ) ) ( not ( = ?auto_37118 ?auto_37123 ) ) ( IS-CRATE ?auto_37118 ) ( not ( = ?auto_37116 ?auto_37121 ) ) ( not ( = ?auto_37117 ?auto_37121 ) ) ( not ( = ?auto_37131 ?auto_37121 ) ) ( not ( = ?auto_37128 ?auto_37121 ) ) ( not ( = ?auto_37127 ?auto_37121 ) ) ( not ( = ?auto_37118 ?auto_37121 ) ) ( not ( = ?auto_37123 ?auto_37121 ) ) ( AVAILABLE ?auto_37120 ) ( SURFACE-AT ?auto_37118 ?auto_37126 ) ( ON ?auto_37118 ?auto_37129 ) ( CLEAR ?auto_37118 ) ( not ( = ?auto_37116 ?auto_37129 ) ) ( not ( = ?auto_37117 ?auto_37129 ) ) ( not ( = ?auto_37131 ?auto_37129 ) ) ( not ( = ?auto_37128 ?auto_37129 ) ) ( not ( = ?auto_37127 ?auto_37129 ) ) ( not ( = ?auto_37118 ?auto_37129 ) ) ( not ( = ?auto_37123 ?auto_37129 ) ) ( not ( = ?auto_37121 ?auto_37129 ) ) ( SURFACE-AT ?auto_37125 ?auto_37130 ) ( CLEAR ?auto_37125 ) ( IS-CRATE ?auto_37121 ) ( not ( = ?auto_37116 ?auto_37125 ) ) ( not ( = ?auto_37117 ?auto_37125 ) ) ( not ( = ?auto_37131 ?auto_37125 ) ) ( not ( = ?auto_37128 ?auto_37125 ) ) ( not ( = ?auto_37127 ?auto_37125 ) ) ( not ( = ?auto_37118 ?auto_37125 ) ) ( not ( = ?auto_37123 ?auto_37125 ) ) ( not ( = ?auto_37121 ?auto_37125 ) ) ( not ( = ?auto_37129 ?auto_37125 ) ) ( AVAILABLE ?auto_37124 ) ( TRUCK-AT ?auto_37132 ?auto_37134 ) ( not ( = ?auto_37134 ?auto_37130 ) ) ( not ( = ?auto_37126 ?auto_37134 ) ) ( not ( = ?auto_37122 ?auto_37134 ) ) ( not ( = ?auto_37119 ?auto_37134 ) ) ( HOIST-AT ?auto_37136 ?auto_37134 ) ( LIFTING ?auto_37136 ?auto_37121 ) ( not ( = ?auto_37124 ?auto_37136 ) ) ( not ( = ?auto_37120 ?auto_37136 ) ) ( not ( = ?auto_37133 ?auto_37136 ) ) ( not ( = ?auto_37135 ?auto_37136 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37136 ?auto_37121 ?auto_37132 ?auto_37134 )
      ( MAKE-ON ?auto_37116 ?auto_37117 )
      ( MAKE-ON-VERIFY ?auto_37116 ?auto_37117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37137 - SURFACE
      ?auto_37138 - SURFACE
    )
    :vars
    (
      ?auto_37154 - HOIST
      ?auto_37140 - PLACE
      ?auto_37152 - PLACE
      ?auto_37147 - HOIST
      ?auto_37141 - SURFACE
      ?auto_37153 - SURFACE
      ?auto_37143 - PLACE
      ?auto_37156 - HOIST
      ?auto_37139 - SURFACE
      ?auto_37150 - SURFACE
      ?auto_37145 - PLACE
      ?auto_37155 - HOIST
      ?auto_37144 - SURFACE
      ?auto_37148 - SURFACE
      ?auto_37146 - SURFACE
      ?auto_37149 - SURFACE
      ?auto_37157 - TRUCK
      ?auto_37151 - PLACE
      ?auto_37142 - HOIST
      ?auto_37158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37154 ?auto_37140 ) ( IS-CRATE ?auto_37137 ) ( not ( = ?auto_37137 ?auto_37138 ) ) ( not ( = ?auto_37152 ?auto_37140 ) ) ( HOIST-AT ?auto_37147 ?auto_37152 ) ( not ( = ?auto_37154 ?auto_37147 ) ) ( SURFACE-AT ?auto_37137 ?auto_37152 ) ( ON ?auto_37137 ?auto_37141 ) ( CLEAR ?auto_37137 ) ( not ( = ?auto_37137 ?auto_37141 ) ) ( not ( = ?auto_37138 ?auto_37141 ) ) ( IS-CRATE ?auto_37138 ) ( not ( = ?auto_37137 ?auto_37153 ) ) ( not ( = ?auto_37138 ?auto_37153 ) ) ( not ( = ?auto_37141 ?auto_37153 ) ) ( not ( = ?auto_37143 ?auto_37140 ) ) ( not ( = ?auto_37152 ?auto_37143 ) ) ( HOIST-AT ?auto_37156 ?auto_37143 ) ( not ( = ?auto_37154 ?auto_37156 ) ) ( not ( = ?auto_37147 ?auto_37156 ) ) ( AVAILABLE ?auto_37156 ) ( SURFACE-AT ?auto_37138 ?auto_37143 ) ( ON ?auto_37138 ?auto_37139 ) ( CLEAR ?auto_37138 ) ( not ( = ?auto_37137 ?auto_37139 ) ) ( not ( = ?auto_37138 ?auto_37139 ) ) ( not ( = ?auto_37141 ?auto_37139 ) ) ( not ( = ?auto_37153 ?auto_37139 ) ) ( IS-CRATE ?auto_37153 ) ( not ( = ?auto_37137 ?auto_37150 ) ) ( not ( = ?auto_37138 ?auto_37150 ) ) ( not ( = ?auto_37141 ?auto_37150 ) ) ( not ( = ?auto_37153 ?auto_37150 ) ) ( not ( = ?auto_37139 ?auto_37150 ) ) ( not ( = ?auto_37145 ?auto_37140 ) ) ( not ( = ?auto_37152 ?auto_37145 ) ) ( not ( = ?auto_37143 ?auto_37145 ) ) ( HOIST-AT ?auto_37155 ?auto_37145 ) ( not ( = ?auto_37154 ?auto_37155 ) ) ( not ( = ?auto_37147 ?auto_37155 ) ) ( not ( = ?auto_37156 ?auto_37155 ) ) ( AVAILABLE ?auto_37155 ) ( SURFACE-AT ?auto_37153 ?auto_37145 ) ( ON ?auto_37153 ?auto_37144 ) ( CLEAR ?auto_37153 ) ( not ( = ?auto_37137 ?auto_37144 ) ) ( not ( = ?auto_37138 ?auto_37144 ) ) ( not ( = ?auto_37141 ?auto_37144 ) ) ( not ( = ?auto_37153 ?auto_37144 ) ) ( not ( = ?auto_37139 ?auto_37144 ) ) ( not ( = ?auto_37150 ?auto_37144 ) ) ( IS-CRATE ?auto_37150 ) ( not ( = ?auto_37137 ?auto_37148 ) ) ( not ( = ?auto_37138 ?auto_37148 ) ) ( not ( = ?auto_37141 ?auto_37148 ) ) ( not ( = ?auto_37153 ?auto_37148 ) ) ( not ( = ?auto_37139 ?auto_37148 ) ) ( not ( = ?auto_37150 ?auto_37148 ) ) ( not ( = ?auto_37144 ?auto_37148 ) ) ( AVAILABLE ?auto_37147 ) ( SURFACE-AT ?auto_37150 ?auto_37152 ) ( ON ?auto_37150 ?auto_37146 ) ( CLEAR ?auto_37150 ) ( not ( = ?auto_37137 ?auto_37146 ) ) ( not ( = ?auto_37138 ?auto_37146 ) ) ( not ( = ?auto_37141 ?auto_37146 ) ) ( not ( = ?auto_37153 ?auto_37146 ) ) ( not ( = ?auto_37139 ?auto_37146 ) ) ( not ( = ?auto_37150 ?auto_37146 ) ) ( not ( = ?auto_37144 ?auto_37146 ) ) ( not ( = ?auto_37148 ?auto_37146 ) ) ( SURFACE-AT ?auto_37149 ?auto_37140 ) ( CLEAR ?auto_37149 ) ( IS-CRATE ?auto_37148 ) ( not ( = ?auto_37137 ?auto_37149 ) ) ( not ( = ?auto_37138 ?auto_37149 ) ) ( not ( = ?auto_37141 ?auto_37149 ) ) ( not ( = ?auto_37153 ?auto_37149 ) ) ( not ( = ?auto_37139 ?auto_37149 ) ) ( not ( = ?auto_37150 ?auto_37149 ) ) ( not ( = ?auto_37144 ?auto_37149 ) ) ( not ( = ?auto_37148 ?auto_37149 ) ) ( not ( = ?auto_37146 ?auto_37149 ) ) ( AVAILABLE ?auto_37154 ) ( TRUCK-AT ?auto_37157 ?auto_37151 ) ( not ( = ?auto_37151 ?auto_37140 ) ) ( not ( = ?auto_37152 ?auto_37151 ) ) ( not ( = ?auto_37143 ?auto_37151 ) ) ( not ( = ?auto_37145 ?auto_37151 ) ) ( HOIST-AT ?auto_37142 ?auto_37151 ) ( not ( = ?auto_37154 ?auto_37142 ) ) ( not ( = ?auto_37147 ?auto_37142 ) ) ( not ( = ?auto_37156 ?auto_37142 ) ) ( not ( = ?auto_37155 ?auto_37142 ) ) ( AVAILABLE ?auto_37142 ) ( SURFACE-AT ?auto_37148 ?auto_37151 ) ( ON ?auto_37148 ?auto_37158 ) ( CLEAR ?auto_37148 ) ( not ( = ?auto_37137 ?auto_37158 ) ) ( not ( = ?auto_37138 ?auto_37158 ) ) ( not ( = ?auto_37141 ?auto_37158 ) ) ( not ( = ?auto_37153 ?auto_37158 ) ) ( not ( = ?auto_37139 ?auto_37158 ) ) ( not ( = ?auto_37150 ?auto_37158 ) ) ( not ( = ?auto_37144 ?auto_37158 ) ) ( not ( = ?auto_37148 ?auto_37158 ) ) ( not ( = ?auto_37146 ?auto_37158 ) ) ( not ( = ?auto_37149 ?auto_37158 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37142 ?auto_37148 ?auto_37158 ?auto_37151 )
      ( MAKE-ON ?auto_37137 ?auto_37138 )
      ( MAKE-ON-VERIFY ?auto_37137 ?auto_37138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37159 - SURFACE
      ?auto_37160 - SURFACE
    )
    :vars
    (
      ?auto_37180 - HOIST
      ?auto_37165 - PLACE
      ?auto_37173 - PLACE
      ?auto_37176 - HOIST
      ?auto_37166 - SURFACE
      ?auto_37167 - SURFACE
      ?auto_37163 - PLACE
      ?auto_37162 - HOIST
      ?auto_37175 - SURFACE
      ?auto_37171 - SURFACE
      ?auto_37168 - PLACE
      ?auto_37170 - HOIST
      ?auto_37164 - SURFACE
      ?auto_37179 - SURFACE
      ?auto_37172 - SURFACE
      ?auto_37161 - SURFACE
      ?auto_37178 - PLACE
      ?auto_37177 - HOIST
      ?auto_37174 - SURFACE
      ?auto_37169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37180 ?auto_37165 ) ( IS-CRATE ?auto_37159 ) ( not ( = ?auto_37159 ?auto_37160 ) ) ( not ( = ?auto_37173 ?auto_37165 ) ) ( HOIST-AT ?auto_37176 ?auto_37173 ) ( not ( = ?auto_37180 ?auto_37176 ) ) ( SURFACE-AT ?auto_37159 ?auto_37173 ) ( ON ?auto_37159 ?auto_37166 ) ( CLEAR ?auto_37159 ) ( not ( = ?auto_37159 ?auto_37166 ) ) ( not ( = ?auto_37160 ?auto_37166 ) ) ( IS-CRATE ?auto_37160 ) ( not ( = ?auto_37159 ?auto_37167 ) ) ( not ( = ?auto_37160 ?auto_37167 ) ) ( not ( = ?auto_37166 ?auto_37167 ) ) ( not ( = ?auto_37163 ?auto_37165 ) ) ( not ( = ?auto_37173 ?auto_37163 ) ) ( HOIST-AT ?auto_37162 ?auto_37163 ) ( not ( = ?auto_37180 ?auto_37162 ) ) ( not ( = ?auto_37176 ?auto_37162 ) ) ( AVAILABLE ?auto_37162 ) ( SURFACE-AT ?auto_37160 ?auto_37163 ) ( ON ?auto_37160 ?auto_37175 ) ( CLEAR ?auto_37160 ) ( not ( = ?auto_37159 ?auto_37175 ) ) ( not ( = ?auto_37160 ?auto_37175 ) ) ( not ( = ?auto_37166 ?auto_37175 ) ) ( not ( = ?auto_37167 ?auto_37175 ) ) ( IS-CRATE ?auto_37167 ) ( not ( = ?auto_37159 ?auto_37171 ) ) ( not ( = ?auto_37160 ?auto_37171 ) ) ( not ( = ?auto_37166 ?auto_37171 ) ) ( not ( = ?auto_37167 ?auto_37171 ) ) ( not ( = ?auto_37175 ?auto_37171 ) ) ( not ( = ?auto_37168 ?auto_37165 ) ) ( not ( = ?auto_37173 ?auto_37168 ) ) ( not ( = ?auto_37163 ?auto_37168 ) ) ( HOIST-AT ?auto_37170 ?auto_37168 ) ( not ( = ?auto_37180 ?auto_37170 ) ) ( not ( = ?auto_37176 ?auto_37170 ) ) ( not ( = ?auto_37162 ?auto_37170 ) ) ( AVAILABLE ?auto_37170 ) ( SURFACE-AT ?auto_37167 ?auto_37168 ) ( ON ?auto_37167 ?auto_37164 ) ( CLEAR ?auto_37167 ) ( not ( = ?auto_37159 ?auto_37164 ) ) ( not ( = ?auto_37160 ?auto_37164 ) ) ( not ( = ?auto_37166 ?auto_37164 ) ) ( not ( = ?auto_37167 ?auto_37164 ) ) ( not ( = ?auto_37175 ?auto_37164 ) ) ( not ( = ?auto_37171 ?auto_37164 ) ) ( IS-CRATE ?auto_37171 ) ( not ( = ?auto_37159 ?auto_37179 ) ) ( not ( = ?auto_37160 ?auto_37179 ) ) ( not ( = ?auto_37166 ?auto_37179 ) ) ( not ( = ?auto_37167 ?auto_37179 ) ) ( not ( = ?auto_37175 ?auto_37179 ) ) ( not ( = ?auto_37171 ?auto_37179 ) ) ( not ( = ?auto_37164 ?auto_37179 ) ) ( AVAILABLE ?auto_37176 ) ( SURFACE-AT ?auto_37171 ?auto_37173 ) ( ON ?auto_37171 ?auto_37172 ) ( CLEAR ?auto_37171 ) ( not ( = ?auto_37159 ?auto_37172 ) ) ( not ( = ?auto_37160 ?auto_37172 ) ) ( not ( = ?auto_37166 ?auto_37172 ) ) ( not ( = ?auto_37167 ?auto_37172 ) ) ( not ( = ?auto_37175 ?auto_37172 ) ) ( not ( = ?auto_37171 ?auto_37172 ) ) ( not ( = ?auto_37164 ?auto_37172 ) ) ( not ( = ?auto_37179 ?auto_37172 ) ) ( SURFACE-AT ?auto_37161 ?auto_37165 ) ( CLEAR ?auto_37161 ) ( IS-CRATE ?auto_37179 ) ( not ( = ?auto_37159 ?auto_37161 ) ) ( not ( = ?auto_37160 ?auto_37161 ) ) ( not ( = ?auto_37166 ?auto_37161 ) ) ( not ( = ?auto_37167 ?auto_37161 ) ) ( not ( = ?auto_37175 ?auto_37161 ) ) ( not ( = ?auto_37171 ?auto_37161 ) ) ( not ( = ?auto_37164 ?auto_37161 ) ) ( not ( = ?auto_37179 ?auto_37161 ) ) ( not ( = ?auto_37172 ?auto_37161 ) ) ( AVAILABLE ?auto_37180 ) ( not ( = ?auto_37178 ?auto_37165 ) ) ( not ( = ?auto_37173 ?auto_37178 ) ) ( not ( = ?auto_37163 ?auto_37178 ) ) ( not ( = ?auto_37168 ?auto_37178 ) ) ( HOIST-AT ?auto_37177 ?auto_37178 ) ( not ( = ?auto_37180 ?auto_37177 ) ) ( not ( = ?auto_37176 ?auto_37177 ) ) ( not ( = ?auto_37162 ?auto_37177 ) ) ( not ( = ?auto_37170 ?auto_37177 ) ) ( AVAILABLE ?auto_37177 ) ( SURFACE-AT ?auto_37179 ?auto_37178 ) ( ON ?auto_37179 ?auto_37174 ) ( CLEAR ?auto_37179 ) ( not ( = ?auto_37159 ?auto_37174 ) ) ( not ( = ?auto_37160 ?auto_37174 ) ) ( not ( = ?auto_37166 ?auto_37174 ) ) ( not ( = ?auto_37167 ?auto_37174 ) ) ( not ( = ?auto_37175 ?auto_37174 ) ) ( not ( = ?auto_37171 ?auto_37174 ) ) ( not ( = ?auto_37164 ?auto_37174 ) ) ( not ( = ?auto_37179 ?auto_37174 ) ) ( not ( = ?auto_37172 ?auto_37174 ) ) ( not ( = ?auto_37161 ?auto_37174 ) ) ( TRUCK-AT ?auto_37169 ?auto_37165 ) )
    :subtasks
    ( ( !DRIVE ?auto_37169 ?auto_37165 ?auto_37178 )
      ( MAKE-ON ?auto_37159 ?auto_37160 )
      ( MAKE-ON-VERIFY ?auto_37159 ?auto_37160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37183 - SURFACE
      ?auto_37184 - SURFACE
    )
    :vars
    (
      ?auto_37185 - HOIST
      ?auto_37186 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37185 ?auto_37186 ) ( SURFACE-AT ?auto_37184 ?auto_37186 ) ( CLEAR ?auto_37184 ) ( LIFTING ?auto_37185 ?auto_37183 ) ( IS-CRATE ?auto_37183 ) ( not ( = ?auto_37183 ?auto_37184 ) ) )
    :subtasks
    ( ( !DROP ?auto_37185 ?auto_37183 ?auto_37184 ?auto_37186 )
      ( MAKE-ON-VERIFY ?auto_37183 ?auto_37184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37187 - SURFACE
      ?auto_37188 - SURFACE
    )
    :vars
    (
      ?auto_37190 - HOIST
      ?auto_37189 - PLACE
      ?auto_37191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37190 ?auto_37189 ) ( SURFACE-AT ?auto_37188 ?auto_37189 ) ( CLEAR ?auto_37188 ) ( IS-CRATE ?auto_37187 ) ( not ( = ?auto_37187 ?auto_37188 ) ) ( TRUCK-AT ?auto_37191 ?auto_37189 ) ( AVAILABLE ?auto_37190 ) ( IN ?auto_37187 ?auto_37191 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37190 ?auto_37187 ?auto_37191 ?auto_37189 )
      ( MAKE-ON ?auto_37187 ?auto_37188 )
      ( MAKE-ON-VERIFY ?auto_37187 ?auto_37188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37192 - SURFACE
      ?auto_37193 - SURFACE
    )
    :vars
    (
      ?auto_37194 - HOIST
      ?auto_37195 - PLACE
      ?auto_37196 - TRUCK
      ?auto_37197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37194 ?auto_37195 ) ( SURFACE-AT ?auto_37193 ?auto_37195 ) ( CLEAR ?auto_37193 ) ( IS-CRATE ?auto_37192 ) ( not ( = ?auto_37192 ?auto_37193 ) ) ( AVAILABLE ?auto_37194 ) ( IN ?auto_37192 ?auto_37196 ) ( TRUCK-AT ?auto_37196 ?auto_37197 ) ( not ( = ?auto_37197 ?auto_37195 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37196 ?auto_37197 ?auto_37195 )
      ( MAKE-ON ?auto_37192 ?auto_37193 )
      ( MAKE-ON-VERIFY ?auto_37192 ?auto_37193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37198 - SURFACE
      ?auto_37199 - SURFACE
    )
    :vars
    (
      ?auto_37201 - HOIST
      ?auto_37202 - PLACE
      ?auto_37200 - TRUCK
      ?auto_37203 - PLACE
      ?auto_37204 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37201 ?auto_37202 ) ( SURFACE-AT ?auto_37199 ?auto_37202 ) ( CLEAR ?auto_37199 ) ( IS-CRATE ?auto_37198 ) ( not ( = ?auto_37198 ?auto_37199 ) ) ( AVAILABLE ?auto_37201 ) ( TRUCK-AT ?auto_37200 ?auto_37203 ) ( not ( = ?auto_37203 ?auto_37202 ) ) ( HOIST-AT ?auto_37204 ?auto_37203 ) ( LIFTING ?auto_37204 ?auto_37198 ) ( not ( = ?auto_37201 ?auto_37204 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37204 ?auto_37198 ?auto_37200 ?auto_37203 )
      ( MAKE-ON ?auto_37198 ?auto_37199 )
      ( MAKE-ON-VERIFY ?auto_37198 ?auto_37199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37205 - SURFACE
      ?auto_37206 - SURFACE
    )
    :vars
    (
      ?auto_37208 - HOIST
      ?auto_37209 - PLACE
      ?auto_37210 - TRUCK
      ?auto_37211 - PLACE
      ?auto_37207 - HOIST
      ?auto_37212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37208 ?auto_37209 ) ( SURFACE-AT ?auto_37206 ?auto_37209 ) ( CLEAR ?auto_37206 ) ( IS-CRATE ?auto_37205 ) ( not ( = ?auto_37205 ?auto_37206 ) ) ( AVAILABLE ?auto_37208 ) ( TRUCK-AT ?auto_37210 ?auto_37211 ) ( not ( = ?auto_37211 ?auto_37209 ) ) ( HOIST-AT ?auto_37207 ?auto_37211 ) ( not ( = ?auto_37208 ?auto_37207 ) ) ( AVAILABLE ?auto_37207 ) ( SURFACE-AT ?auto_37205 ?auto_37211 ) ( ON ?auto_37205 ?auto_37212 ) ( CLEAR ?auto_37205 ) ( not ( = ?auto_37205 ?auto_37212 ) ) ( not ( = ?auto_37206 ?auto_37212 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37207 ?auto_37205 ?auto_37212 ?auto_37211 )
      ( MAKE-ON ?auto_37205 ?auto_37206 )
      ( MAKE-ON-VERIFY ?auto_37205 ?auto_37206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37213 - SURFACE
      ?auto_37214 - SURFACE
    )
    :vars
    (
      ?auto_37216 - HOIST
      ?auto_37218 - PLACE
      ?auto_37217 - PLACE
      ?auto_37220 - HOIST
      ?auto_37215 - SURFACE
      ?auto_37219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37216 ?auto_37218 ) ( SURFACE-AT ?auto_37214 ?auto_37218 ) ( CLEAR ?auto_37214 ) ( IS-CRATE ?auto_37213 ) ( not ( = ?auto_37213 ?auto_37214 ) ) ( AVAILABLE ?auto_37216 ) ( not ( = ?auto_37217 ?auto_37218 ) ) ( HOIST-AT ?auto_37220 ?auto_37217 ) ( not ( = ?auto_37216 ?auto_37220 ) ) ( AVAILABLE ?auto_37220 ) ( SURFACE-AT ?auto_37213 ?auto_37217 ) ( ON ?auto_37213 ?auto_37215 ) ( CLEAR ?auto_37213 ) ( not ( = ?auto_37213 ?auto_37215 ) ) ( not ( = ?auto_37214 ?auto_37215 ) ) ( TRUCK-AT ?auto_37219 ?auto_37218 ) )
    :subtasks
    ( ( !DRIVE ?auto_37219 ?auto_37218 ?auto_37217 )
      ( MAKE-ON ?auto_37213 ?auto_37214 )
      ( MAKE-ON-VERIFY ?auto_37213 ?auto_37214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37221 - SURFACE
      ?auto_37222 - SURFACE
    )
    :vars
    (
      ?auto_37226 - HOIST
      ?auto_37227 - PLACE
      ?auto_37223 - PLACE
      ?auto_37228 - HOIST
      ?auto_37225 - SURFACE
      ?auto_37224 - TRUCK
      ?auto_37229 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37226 ?auto_37227 ) ( IS-CRATE ?auto_37221 ) ( not ( = ?auto_37221 ?auto_37222 ) ) ( not ( = ?auto_37223 ?auto_37227 ) ) ( HOIST-AT ?auto_37228 ?auto_37223 ) ( not ( = ?auto_37226 ?auto_37228 ) ) ( AVAILABLE ?auto_37228 ) ( SURFACE-AT ?auto_37221 ?auto_37223 ) ( ON ?auto_37221 ?auto_37225 ) ( CLEAR ?auto_37221 ) ( not ( = ?auto_37221 ?auto_37225 ) ) ( not ( = ?auto_37222 ?auto_37225 ) ) ( TRUCK-AT ?auto_37224 ?auto_37227 ) ( SURFACE-AT ?auto_37229 ?auto_37227 ) ( CLEAR ?auto_37229 ) ( LIFTING ?auto_37226 ?auto_37222 ) ( IS-CRATE ?auto_37222 ) ( not ( = ?auto_37221 ?auto_37229 ) ) ( not ( = ?auto_37222 ?auto_37229 ) ) ( not ( = ?auto_37225 ?auto_37229 ) ) )
    :subtasks
    ( ( !DROP ?auto_37226 ?auto_37222 ?auto_37229 ?auto_37227 )
      ( MAKE-ON ?auto_37221 ?auto_37222 )
      ( MAKE-ON-VERIFY ?auto_37221 ?auto_37222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37230 - SURFACE
      ?auto_37231 - SURFACE
    )
    :vars
    (
      ?auto_37235 - HOIST
      ?auto_37237 - PLACE
      ?auto_37236 - PLACE
      ?auto_37232 - HOIST
      ?auto_37233 - SURFACE
      ?auto_37238 - TRUCK
      ?auto_37234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37235 ?auto_37237 ) ( IS-CRATE ?auto_37230 ) ( not ( = ?auto_37230 ?auto_37231 ) ) ( not ( = ?auto_37236 ?auto_37237 ) ) ( HOIST-AT ?auto_37232 ?auto_37236 ) ( not ( = ?auto_37235 ?auto_37232 ) ) ( AVAILABLE ?auto_37232 ) ( SURFACE-AT ?auto_37230 ?auto_37236 ) ( ON ?auto_37230 ?auto_37233 ) ( CLEAR ?auto_37230 ) ( not ( = ?auto_37230 ?auto_37233 ) ) ( not ( = ?auto_37231 ?auto_37233 ) ) ( TRUCK-AT ?auto_37238 ?auto_37237 ) ( SURFACE-AT ?auto_37234 ?auto_37237 ) ( CLEAR ?auto_37234 ) ( IS-CRATE ?auto_37231 ) ( not ( = ?auto_37230 ?auto_37234 ) ) ( not ( = ?auto_37231 ?auto_37234 ) ) ( not ( = ?auto_37233 ?auto_37234 ) ) ( AVAILABLE ?auto_37235 ) ( IN ?auto_37231 ?auto_37238 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37235 ?auto_37231 ?auto_37238 ?auto_37237 )
      ( MAKE-ON ?auto_37230 ?auto_37231 )
      ( MAKE-ON-VERIFY ?auto_37230 ?auto_37231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37239 - SURFACE
      ?auto_37240 - SURFACE
    )
    :vars
    (
      ?auto_37242 - HOIST
      ?auto_37245 - PLACE
      ?auto_37241 - PLACE
      ?auto_37247 - HOIST
      ?auto_37246 - SURFACE
      ?auto_37243 - SURFACE
      ?auto_37244 - TRUCK
      ?auto_37248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37242 ?auto_37245 ) ( IS-CRATE ?auto_37239 ) ( not ( = ?auto_37239 ?auto_37240 ) ) ( not ( = ?auto_37241 ?auto_37245 ) ) ( HOIST-AT ?auto_37247 ?auto_37241 ) ( not ( = ?auto_37242 ?auto_37247 ) ) ( AVAILABLE ?auto_37247 ) ( SURFACE-AT ?auto_37239 ?auto_37241 ) ( ON ?auto_37239 ?auto_37246 ) ( CLEAR ?auto_37239 ) ( not ( = ?auto_37239 ?auto_37246 ) ) ( not ( = ?auto_37240 ?auto_37246 ) ) ( SURFACE-AT ?auto_37243 ?auto_37245 ) ( CLEAR ?auto_37243 ) ( IS-CRATE ?auto_37240 ) ( not ( = ?auto_37239 ?auto_37243 ) ) ( not ( = ?auto_37240 ?auto_37243 ) ) ( not ( = ?auto_37246 ?auto_37243 ) ) ( AVAILABLE ?auto_37242 ) ( IN ?auto_37240 ?auto_37244 ) ( TRUCK-AT ?auto_37244 ?auto_37248 ) ( not ( = ?auto_37248 ?auto_37245 ) ) ( not ( = ?auto_37241 ?auto_37248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37244 ?auto_37248 ?auto_37245 )
      ( MAKE-ON ?auto_37239 ?auto_37240 )
      ( MAKE-ON-VERIFY ?auto_37239 ?auto_37240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37249 - SURFACE
      ?auto_37250 - SURFACE
    )
    :vars
    (
      ?auto_37253 - HOIST
      ?auto_37254 - PLACE
      ?auto_37251 - PLACE
      ?auto_37256 - HOIST
      ?auto_37255 - SURFACE
      ?auto_37258 - SURFACE
      ?auto_37257 - TRUCK
      ?auto_37252 - PLACE
      ?auto_37259 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37253 ?auto_37254 ) ( IS-CRATE ?auto_37249 ) ( not ( = ?auto_37249 ?auto_37250 ) ) ( not ( = ?auto_37251 ?auto_37254 ) ) ( HOIST-AT ?auto_37256 ?auto_37251 ) ( not ( = ?auto_37253 ?auto_37256 ) ) ( AVAILABLE ?auto_37256 ) ( SURFACE-AT ?auto_37249 ?auto_37251 ) ( ON ?auto_37249 ?auto_37255 ) ( CLEAR ?auto_37249 ) ( not ( = ?auto_37249 ?auto_37255 ) ) ( not ( = ?auto_37250 ?auto_37255 ) ) ( SURFACE-AT ?auto_37258 ?auto_37254 ) ( CLEAR ?auto_37258 ) ( IS-CRATE ?auto_37250 ) ( not ( = ?auto_37249 ?auto_37258 ) ) ( not ( = ?auto_37250 ?auto_37258 ) ) ( not ( = ?auto_37255 ?auto_37258 ) ) ( AVAILABLE ?auto_37253 ) ( TRUCK-AT ?auto_37257 ?auto_37252 ) ( not ( = ?auto_37252 ?auto_37254 ) ) ( not ( = ?auto_37251 ?auto_37252 ) ) ( HOIST-AT ?auto_37259 ?auto_37252 ) ( LIFTING ?auto_37259 ?auto_37250 ) ( not ( = ?auto_37253 ?auto_37259 ) ) ( not ( = ?auto_37256 ?auto_37259 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37259 ?auto_37250 ?auto_37257 ?auto_37252 )
      ( MAKE-ON ?auto_37249 ?auto_37250 )
      ( MAKE-ON-VERIFY ?auto_37249 ?auto_37250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37260 - SURFACE
      ?auto_37261 - SURFACE
    )
    :vars
    (
      ?auto_37263 - HOIST
      ?auto_37269 - PLACE
      ?auto_37264 - PLACE
      ?auto_37267 - HOIST
      ?auto_37268 - SURFACE
      ?auto_37265 - SURFACE
      ?auto_37262 - TRUCK
      ?auto_37266 - PLACE
      ?auto_37270 - HOIST
      ?auto_37271 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37263 ?auto_37269 ) ( IS-CRATE ?auto_37260 ) ( not ( = ?auto_37260 ?auto_37261 ) ) ( not ( = ?auto_37264 ?auto_37269 ) ) ( HOIST-AT ?auto_37267 ?auto_37264 ) ( not ( = ?auto_37263 ?auto_37267 ) ) ( AVAILABLE ?auto_37267 ) ( SURFACE-AT ?auto_37260 ?auto_37264 ) ( ON ?auto_37260 ?auto_37268 ) ( CLEAR ?auto_37260 ) ( not ( = ?auto_37260 ?auto_37268 ) ) ( not ( = ?auto_37261 ?auto_37268 ) ) ( SURFACE-AT ?auto_37265 ?auto_37269 ) ( CLEAR ?auto_37265 ) ( IS-CRATE ?auto_37261 ) ( not ( = ?auto_37260 ?auto_37265 ) ) ( not ( = ?auto_37261 ?auto_37265 ) ) ( not ( = ?auto_37268 ?auto_37265 ) ) ( AVAILABLE ?auto_37263 ) ( TRUCK-AT ?auto_37262 ?auto_37266 ) ( not ( = ?auto_37266 ?auto_37269 ) ) ( not ( = ?auto_37264 ?auto_37266 ) ) ( HOIST-AT ?auto_37270 ?auto_37266 ) ( not ( = ?auto_37263 ?auto_37270 ) ) ( not ( = ?auto_37267 ?auto_37270 ) ) ( AVAILABLE ?auto_37270 ) ( SURFACE-AT ?auto_37261 ?auto_37266 ) ( ON ?auto_37261 ?auto_37271 ) ( CLEAR ?auto_37261 ) ( not ( = ?auto_37260 ?auto_37271 ) ) ( not ( = ?auto_37261 ?auto_37271 ) ) ( not ( = ?auto_37268 ?auto_37271 ) ) ( not ( = ?auto_37265 ?auto_37271 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37270 ?auto_37261 ?auto_37271 ?auto_37266 )
      ( MAKE-ON ?auto_37260 ?auto_37261 )
      ( MAKE-ON-VERIFY ?auto_37260 ?auto_37261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37272 - SURFACE
      ?auto_37273 - SURFACE
    )
    :vars
    (
      ?auto_37282 - HOIST
      ?auto_37274 - PLACE
      ?auto_37281 - PLACE
      ?auto_37276 - HOIST
      ?auto_37280 - SURFACE
      ?auto_37278 - SURFACE
      ?auto_37279 - PLACE
      ?auto_37283 - HOIST
      ?auto_37277 - SURFACE
      ?auto_37275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37282 ?auto_37274 ) ( IS-CRATE ?auto_37272 ) ( not ( = ?auto_37272 ?auto_37273 ) ) ( not ( = ?auto_37281 ?auto_37274 ) ) ( HOIST-AT ?auto_37276 ?auto_37281 ) ( not ( = ?auto_37282 ?auto_37276 ) ) ( AVAILABLE ?auto_37276 ) ( SURFACE-AT ?auto_37272 ?auto_37281 ) ( ON ?auto_37272 ?auto_37280 ) ( CLEAR ?auto_37272 ) ( not ( = ?auto_37272 ?auto_37280 ) ) ( not ( = ?auto_37273 ?auto_37280 ) ) ( SURFACE-AT ?auto_37278 ?auto_37274 ) ( CLEAR ?auto_37278 ) ( IS-CRATE ?auto_37273 ) ( not ( = ?auto_37272 ?auto_37278 ) ) ( not ( = ?auto_37273 ?auto_37278 ) ) ( not ( = ?auto_37280 ?auto_37278 ) ) ( AVAILABLE ?auto_37282 ) ( not ( = ?auto_37279 ?auto_37274 ) ) ( not ( = ?auto_37281 ?auto_37279 ) ) ( HOIST-AT ?auto_37283 ?auto_37279 ) ( not ( = ?auto_37282 ?auto_37283 ) ) ( not ( = ?auto_37276 ?auto_37283 ) ) ( AVAILABLE ?auto_37283 ) ( SURFACE-AT ?auto_37273 ?auto_37279 ) ( ON ?auto_37273 ?auto_37277 ) ( CLEAR ?auto_37273 ) ( not ( = ?auto_37272 ?auto_37277 ) ) ( not ( = ?auto_37273 ?auto_37277 ) ) ( not ( = ?auto_37280 ?auto_37277 ) ) ( not ( = ?auto_37278 ?auto_37277 ) ) ( TRUCK-AT ?auto_37275 ?auto_37274 ) )
    :subtasks
    ( ( !DRIVE ?auto_37275 ?auto_37274 ?auto_37279 )
      ( MAKE-ON ?auto_37272 ?auto_37273 )
      ( MAKE-ON-VERIFY ?auto_37272 ?auto_37273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37284 - SURFACE
      ?auto_37285 - SURFACE
    )
    :vars
    (
      ?auto_37295 - HOIST
      ?auto_37294 - PLACE
      ?auto_37289 - PLACE
      ?auto_37293 - HOIST
      ?auto_37291 - SURFACE
      ?auto_37287 - SURFACE
      ?auto_37288 - PLACE
      ?auto_37290 - HOIST
      ?auto_37286 - SURFACE
      ?auto_37292 - TRUCK
      ?auto_37296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37295 ?auto_37294 ) ( IS-CRATE ?auto_37284 ) ( not ( = ?auto_37284 ?auto_37285 ) ) ( not ( = ?auto_37289 ?auto_37294 ) ) ( HOIST-AT ?auto_37293 ?auto_37289 ) ( not ( = ?auto_37295 ?auto_37293 ) ) ( AVAILABLE ?auto_37293 ) ( SURFACE-AT ?auto_37284 ?auto_37289 ) ( ON ?auto_37284 ?auto_37291 ) ( CLEAR ?auto_37284 ) ( not ( = ?auto_37284 ?auto_37291 ) ) ( not ( = ?auto_37285 ?auto_37291 ) ) ( IS-CRATE ?auto_37285 ) ( not ( = ?auto_37284 ?auto_37287 ) ) ( not ( = ?auto_37285 ?auto_37287 ) ) ( not ( = ?auto_37291 ?auto_37287 ) ) ( not ( = ?auto_37288 ?auto_37294 ) ) ( not ( = ?auto_37289 ?auto_37288 ) ) ( HOIST-AT ?auto_37290 ?auto_37288 ) ( not ( = ?auto_37295 ?auto_37290 ) ) ( not ( = ?auto_37293 ?auto_37290 ) ) ( AVAILABLE ?auto_37290 ) ( SURFACE-AT ?auto_37285 ?auto_37288 ) ( ON ?auto_37285 ?auto_37286 ) ( CLEAR ?auto_37285 ) ( not ( = ?auto_37284 ?auto_37286 ) ) ( not ( = ?auto_37285 ?auto_37286 ) ) ( not ( = ?auto_37291 ?auto_37286 ) ) ( not ( = ?auto_37287 ?auto_37286 ) ) ( TRUCK-AT ?auto_37292 ?auto_37294 ) ( SURFACE-AT ?auto_37296 ?auto_37294 ) ( CLEAR ?auto_37296 ) ( LIFTING ?auto_37295 ?auto_37287 ) ( IS-CRATE ?auto_37287 ) ( not ( = ?auto_37284 ?auto_37296 ) ) ( not ( = ?auto_37285 ?auto_37296 ) ) ( not ( = ?auto_37291 ?auto_37296 ) ) ( not ( = ?auto_37287 ?auto_37296 ) ) ( not ( = ?auto_37286 ?auto_37296 ) ) )
    :subtasks
    ( ( !DROP ?auto_37295 ?auto_37287 ?auto_37296 ?auto_37294 )
      ( MAKE-ON ?auto_37284 ?auto_37285 )
      ( MAKE-ON-VERIFY ?auto_37284 ?auto_37285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37297 - SURFACE
      ?auto_37298 - SURFACE
    )
    :vars
    (
      ?auto_37305 - HOIST
      ?auto_37307 - PLACE
      ?auto_37299 - PLACE
      ?auto_37308 - HOIST
      ?auto_37301 - SURFACE
      ?auto_37303 - SURFACE
      ?auto_37309 - PLACE
      ?auto_37300 - HOIST
      ?auto_37304 - SURFACE
      ?auto_37306 - TRUCK
      ?auto_37302 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37305 ?auto_37307 ) ( IS-CRATE ?auto_37297 ) ( not ( = ?auto_37297 ?auto_37298 ) ) ( not ( = ?auto_37299 ?auto_37307 ) ) ( HOIST-AT ?auto_37308 ?auto_37299 ) ( not ( = ?auto_37305 ?auto_37308 ) ) ( AVAILABLE ?auto_37308 ) ( SURFACE-AT ?auto_37297 ?auto_37299 ) ( ON ?auto_37297 ?auto_37301 ) ( CLEAR ?auto_37297 ) ( not ( = ?auto_37297 ?auto_37301 ) ) ( not ( = ?auto_37298 ?auto_37301 ) ) ( IS-CRATE ?auto_37298 ) ( not ( = ?auto_37297 ?auto_37303 ) ) ( not ( = ?auto_37298 ?auto_37303 ) ) ( not ( = ?auto_37301 ?auto_37303 ) ) ( not ( = ?auto_37309 ?auto_37307 ) ) ( not ( = ?auto_37299 ?auto_37309 ) ) ( HOIST-AT ?auto_37300 ?auto_37309 ) ( not ( = ?auto_37305 ?auto_37300 ) ) ( not ( = ?auto_37308 ?auto_37300 ) ) ( AVAILABLE ?auto_37300 ) ( SURFACE-AT ?auto_37298 ?auto_37309 ) ( ON ?auto_37298 ?auto_37304 ) ( CLEAR ?auto_37298 ) ( not ( = ?auto_37297 ?auto_37304 ) ) ( not ( = ?auto_37298 ?auto_37304 ) ) ( not ( = ?auto_37301 ?auto_37304 ) ) ( not ( = ?auto_37303 ?auto_37304 ) ) ( TRUCK-AT ?auto_37306 ?auto_37307 ) ( SURFACE-AT ?auto_37302 ?auto_37307 ) ( CLEAR ?auto_37302 ) ( IS-CRATE ?auto_37303 ) ( not ( = ?auto_37297 ?auto_37302 ) ) ( not ( = ?auto_37298 ?auto_37302 ) ) ( not ( = ?auto_37301 ?auto_37302 ) ) ( not ( = ?auto_37303 ?auto_37302 ) ) ( not ( = ?auto_37304 ?auto_37302 ) ) ( AVAILABLE ?auto_37305 ) ( IN ?auto_37303 ?auto_37306 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37305 ?auto_37303 ?auto_37306 ?auto_37307 )
      ( MAKE-ON ?auto_37297 ?auto_37298 )
      ( MAKE-ON-VERIFY ?auto_37297 ?auto_37298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37310 - SURFACE
      ?auto_37311 - SURFACE
    )
    :vars
    (
      ?auto_37317 - HOIST
      ?auto_37314 - PLACE
      ?auto_37312 - PLACE
      ?auto_37318 - HOIST
      ?auto_37313 - SURFACE
      ?auto_37322 - SURFACE
      ?auto_37320 - PLACE
      ?auto_37316 - HOIST
      ?auto_37315 - SURFACE
      ?auto_37321 - SURFACE
      ?auto_37319 - TRUCK
      ?auto_37323 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37317 ?auto_37314 ) ( IS-CRATE ?auto_37310 ) ( not ( = ?auto_37310 ?auto_37311 ) ) ( not ( = ?auto_37312 ?auto_37314 ) ) ( HOIST-AT ?auto_37318 ?auto_37312 ) ( not ( = ?auto_37317 ?auto_37318 ) ) ( AVAILABLE ?auto_37318 ) ( SURFACE-AT ?auto_37310 ?auto_37312 ) ( ON ?auto_37310 ?auto_37313 ) ( CLEAR ?auto_37310 ) ( not ( = ?auto_37310 ?auto_37313 ) ) ( not ( = ?auto_37311 ?auto_37313 ) ) ( IS-CRATE ?auto_37311 ) ( not ( = ?auto_37310 ?auto_37322 ) ) ( not ( = ?auto_37311 ?auto_37322 ) ) ( not ( = ?auto_37313 ?auto_37322 ) ) ( not ( = ?auto_37320 ?auto_37314 ) ) ( not ( = ?auto_37312 ?auto_37320 ) ) ( HOIST-AT ?auto_37316 ?auto_37320 ) ( not ( = ?auto_37317 ?auto_37316 ) ) ( not ( = ?auto_37318 ?auto_37316 ) ) ( AVAILABLE ?auto_37316 ) ( SURFACE-AT ?auto_37311 ?auto_37320 ) ( ON ?auto_37311 ?auto_37315 ) ( CLEAR ?auto_37311 ) ( not ( = ?auto_37310 ?auto_37315 ) ) ( not ( = ?auto_37311 ?auto_37315 ) ) ( not ( = ?auto_37313 ?auto_37315 ) ) ( not ( = ?auto_37322 ?auto_37315 ) ) ( SURFACE-AT ?auto_37321 ?auto_37314 ) ( CLEAR ?auto_37321 ) ( IS-CRATE ?auto_37322 ) ( not ( = ?auto_37310 ?auto_37321 ) ) ( not ( = ?auto_37311 ?auto_37321 ) ) ( not ( = ?auto_37313 ?auto_37321 ) ) ( not ( = ?auto_37322 ?auto_37321 ) ) ( not ( = ?auto_37315 ?auto_37321 ) ) ( AVAILABLE ?auto_37317 ) ( IN ?auto_37322 ?auto_37319 ) ( TRUCK-AT ?auto_37319 ?auto_37323 ) ( not ( = ?auto_37323 ?auto_37314 ) ) ( not ( = ?auto_37312 ?auto_37323 ) ) ( not ( = ?auto_37320 ?auto_37323 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37319 ?auto_37323 ?auto_37314 )
      ( MAKE-ON ?auto_37310 ?auto_37311 )
      ( MAKE-ON-VERIFY ?auto_37310 ?auto_37311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37324 - SURFACE
      ?auto_37325 - SURFACE
    )
    :vars
    (
      ?auto_37329 - HOIST
      ?auto_37328 - PLACE
      ?auto_37335 - PLACE
      ?auto_37327 - HOIST
      ?auto_37326 - SURFACE
      ?auto_37336 - SURFACE
      ?auto_37332 - PLACE
      ?auto_37331 - HOIST
      ?auto_37337 - SURFACE
      ?auto_37333 - SURFACE
      ?auto_37330 - TRUCK
      ?auto_37334 - PLACE
      ?auto_37338 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37329 ?auto_37328 ) ( IS-CRATE ?auto_37324 ) ( not ( = ?auto_37324 ?auto_37325 ) ) ( not ( = ?auto_37335 ?auto_37328 ) ) ( HOIST-AT ?auto_37327 ?auto_37335 ) ( not ( = ?auto_37329 ?auto_37327 ) ) ( AVAILABLE ?auto_37327 ) ( SURFACE-AT ?auto_37324 ?auto_37335 ) ( ON ?auto_37324 ?auto_37326 ) ( CLEAR ?auto_37324 ) ( not ( = ?auto_37324 ?auto_37326 ) ) ( not ( = ?auto_37325 ?auto_37326 ) ) ( IS-CRATE ?auto_37325 ) ( not ( = ?auto_37324 ?auto_37336 ) ) ( not ( = ?auto_37325 ?auto_37336 ) ) ( not ( = ?auto_37326 ?auto_37336 ) ) ( not ( = ?auto_37332 ?auto_37328 ) ) ( not ( = ?auto_37335 ?auto_37332 ) ) ( HOIST-AT ?auto_37331 ?auto_37332 ) ( not ( = ?auto_37329 ?auto_37331 ) ) ( not ( = ?auto_37327 ?auto_37331 ) ) ( AVAILABLE ?auto_37331 ) ( SURFACE-AT ?auto_37325 ?auto_37332 ) ( ON ?auto_37325 ?auto_37337 ) ( CLEAR ?auto_37325 ) ( not ( = ?auto_37324 ?auto_37337 ) ) ( not ( = ?auto_37325 ?auto_37337 ) ) ( not ( = ?auto_37326 ?auto_37337 ) ) ( not ( = ?auto_37336 ?auto_37337 ) ) ( SURFACE-AT ?auto_37333 ?auto_37328 ) ( CLEAR ?auto_37333 ) ( IS-CRATE ?auto_37336 ) ( not ( = ?auto_37324 ?auto_37333 ) ) ( not ( = ?auto_37325 ?auto_37333 ) ) ( not ( = ?auto_37326 ?auto_37333 ) ) ( not ( = ?auto_37336 ?auto_37333 ) ) ( not ( = ?auto_37337 ?auto_37333 ) ) ( AVAILABLE ?auto_37329 ) ( TRUCK-AT ?auto_37330 ?auto_37334 ) ( not ( = ?auto_37334 ?auto_37328 ) ) ( not ( = ?auto_37335 ?auto_37334 ) ) ( not ( = ?auto_37332 ?auto_37334 ) ) ( HOIST-AT ?auto_37338 ?auto_37334 ) ( LIFTING ?auto_37338 ?auto_37336 ) ( not ( = ?auto_37329 ?auto_37338 ) ) ( not ( = ?auto_37327 ?auto_37338 ) ) ( not ( = ?auto_37331 ?auto_37338 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37338 ?auto_37336 ?auto_37330 ?auto_37334 )
      ( MAKE-ON ?auto_37324 ?auto_37325 )
      ( MAKE-ON-VERIFY ?auto_37324 ?auto_37325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37339 - SURFACE
      ?auto_37340 - SURFACE
    )
    :vars
    (
      ?auto_37350 - HOIST
      ?auto_37345 - PLACE
      ?auto_37344 - PLACE
      ?auto_37351 - HOIST
      ?auto_37349 - SURFACE
      ?auto_37353 - SURFACE
      ?auto_37347 - PLACE
      ?auto_37348 - HOIST
      ?auto_37343 - SURFACE
      ?auto_37342 - SURFACE
      ?auto_37352 - TRUCK
      ?auto_37341 - PLACE
      ?auto_37346 - HOIST
      ?auto_37354 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37350 ?auto_37345 ) ( IS-CRATE ?auto_37339 ) ( not ( = ?auto_37339 ?auto_37340 ) ) ( not ( = ?auto_37344 ?auto_37345 ) ) ( HOIST-AT ?auto_37351 ?auto_37344 ) ( not ( = ?auto_37350 ?auto_37351 ) ) ( AVAILABLE ?auto_37351 ) ( SURFACE-AT ?auto_37339 ?auto_37344 ) ( ON ?auto_37339 ?auto_37349 ) ( CLEAR ?auto_37339 ) ( not ( = ?auto_37339 ?auto_37349 ) ) ( not ( = ?auto_37340 ?auto_37349 ) ) ( IS-CRATE ?auto_37340 ) ( not ( = ?auto_37339 ?auto_37353 ) ) ( not ( = ?auto_37340 ?auto_37353 ) ) ( not ( = ?auto_37349 ?auto_37353 ) ) ( not ( = ?auto_37347 ?auto_37345 ) ) ( not ( = ?auto_37344 ?auto_37347 ) ) ( HOIST-AT ?auto_37348 ?auto_37347 ) ( not ( = ?auto_37350 ?auto_37348 ) ) ( not ( = ?auto_37351 ?auto_37348 ) ) ( AVAILABLE ?auto_37348 ) ( SURFACE-AT ?auto_37340 ?auto_37347 ) ( ON ?auto_37340 ?auto_37343 ) ( CLEAR ?auto_37340 ) ( not ( = ?auto_37339 ?auto_37343 ) ) ( not ( = ?auto_37340 ?auto_37343 ) ) ( not ( = ?auto_37349 ?auto_37343 ) ) ( not ( = ?auto_37353 ?auto_37343 ) ) ( SURFACE-AT ?auto_37342 ?auto_37345 ) ( CLEAR ?auto_37342 ) ( IS-CRATE ?auto_37353 ) ( not ( = ?auto_37339 ?auto_37342 ) ) ( not ( = ?auto_37340 ?auto_37342 ) ) ( not ( = ?auto_37349 ?auto_37342 ) ) ( not ( = ?auto_37353 ?auto_37342 ) ) ( not ( = ?auto_37343 ?auto_37342 ) ) ( AVAILABLE ?auto_37350 ) ( TRUCK-AT ?auto_37352 ?auto_37341 ) ( not ( = ?auto_37341 ?auto_37345 ) ) ( not ( = ?auto_37344 ?auto_37341 ) ) ( not ( = ?auto_37347 ?auto_37341 ) ) ( HOIST-AT ?auto_37346 ?auto_37341 ) ( not ( = ?auto_37350 ?auto_37346 ) ) ( not ( = ?auto_37351 ?auto_37346 ) ) ( not ( = ?auto_37348 ?auto_37346 ) ) ( AVAILABLE ?auto_37346 ) ( SURFACE-AT ?auto_37353 ?auto_37341 ) ( ON ?auto_37353 ?auto_37354 ) ( CLEAR ?auto_37353 ) ( not ( = ?auto_37339 ?auto_37354 ) ) ( not ( = ?auto_37340 ?auto_37354 ) ) ( not ( = ?auto_37349 ?auto_37354 ) ) ( not ( = ?auto_37353 ?auto_37354 ) ) ( not ( = ?auto_37343 ?auto_37354 ) ) ( not ( = ?auto_37342 ?auto_37354 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37346 ?auto_37353 ?auto_37354 ?auto_37341 )
      ( MAKE-ON ?auto_37339 ?auto_37340 )
      ( MAKE-ON-VERIFY ?auto_37339 ?auto_37340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37355 - SURFACE
      ?auto_37356 - SURFACE
    )
    :vars
    (
      ?auto_37362 - HOIST
      ?auto_37368 - PLACE
      ?auto_37370 - PLACE
      ?auto_37357 - HOIST
      ?auto_37366 - SURFACE
      ?auto_37363 - SURFACE
      ?auto_37364 - PLACE
      ?auto_37365 - HOIST
      ?auto_37361 - SURFACE
      ?auto_37369 - SURFACE
      ?auto_37359 - PLACE
      ?auto_37367 - HOIST
      ?auto_37360 - SURFACE
      ?auto_37358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37362 ?auto_37368 ) ( IS-CRATE ?auto_37355 ) ( not ( = ?auto_37355 ?auto_37356 ) ) ( not ( = ?auto_37370 ?auto_37368 ) ) ( HOIST-AT ?auto_37357 ?auto_37370 ) ( not ( = ?auto_37362 ?auto_37357 ) ) ( AVAILABLE ?auto_37357 ) ( SURFACE-AT ?auto_37355 ?auto_37370 ) ( ON ?auto_37355 ?auto_37366 ) ( CLEAR ?auto_37355 ) ( not ( = ?auto_37355 ?auto_37366 ) ) ( not ( = ?auto_37356 ?auto_37366 ) ) ( IS-CRATE ?auto_37356 ) ( not ( = ?auto_37355 ?auto_37363 ) ) ( not ( = ?auto_37356 ?auto_37363 ) ) ( not ( = ?auto_37366 ?auto_37363 ) ) ( not ( = ?auto_37364 ?auto_37368 ) ) ( not ( = ?auto_37370 ?auto_37364 ) ) ( HOIST-AT ?auto_37365 ?auto_37364 ) ( not ( = ?auto_37362 ?auto_37365 ) ) ( not ( = ?auto_37357 ?auto_37365 ) ) ( AVAILABLE ?auto_37365 ) ( SURFACE-AT ?auto_37356 ?auto_37364 ) ( ON ?auto_37356 ?auto_37361 ) ( CLEAR ?auto_37356 ) ( not ( = ?auto_37355 ?auto_37361 ) ) ( not ( = ?auto_37356 ?auto_37361 ) ) ( not ( = ?auto_37366 ?auto_37361 ) ) ( not ( = ?auto_37363 ?auto_37361 ) ) ( SURFACE-AT ?auto_37369 ?auto_37368 ) ( CLEAR ?auto_37369 ) ( IS-CRATE ?auto_37363 ) ( not ( = ?auto_37355 ?auto_37369 ) ) ( not ( = ?auto_37356 ?auto_37369 ) ) ( not ( = ?auto_37366 ?auto_37369 ) ) ( not ( = ?auto_37363 ?auto_37369 ) ) ( not ( = ?auto_37361 ?auto_37369 ) ) ( AVAILABLE ?auto_37362 ) ( not ( = ?auto_37359 ?auto_37368 ) ) ( not ( = ?auto_37370 ?auto_37359 ) ) ( not ( = ?auto_37364 ?auto_37359 ) ) ( HOIST-AT ?auto_37367 ?auto_37359 ) ( not ( = ?auto_37362 ?auto_37367 ) ) ( not ( = ?auto_37357 ?auto_37367 ) ) ( not ( = ?auto_37365 ?auto_37367 ) ) ( AVAILABLE ?auto_37367 ) ( SURFACE-AT ?auto_37363 ?auto_37359 ) ( ON ?auto_37363 ?auto_37360 ) ( CLEAR ?auto_37363 ) ( not ( = ?auto_37355 ?auto_37360 ) ) ( not ( = ?auto_37356 ?auto_37360 ) ) ( not ( = ?auto_37366 ?auto_37360 ) ) ( not ( = ?auto_37363 ?auto_37360 ) ) ( not ( = ?auto_37361 ?auto_37360 ) ) ( not ( = ?auto_37369 ?auto_37360 ) ) ( TRUCK-AT ?auto_37358 ?auto_37368 ) )
    :subtasks
    ( ( !DRIVE ?auto_37358 ?auto_37368 ?auto_37359 )
      ( MAKE-ON ?auto_37355 ?auto_37356 )
      ( MAKE-ON-VERIFY ?auto_37355 ?auto_37356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37371 - SURFACE
      ?auto_37372 - SURFACE
    )
    :vars
    (
      ?auto_37386 - HOIST
      ?auto_37379 - PLACE
      ?auto_37380 - PLACE
      ?auto_37373 - HOIST
      ?auto_37375 - SURFACE
      ?auto_37384 - SURFACE
      ?auto_37385 - PLACE
      ?auto_37382 - HOIST
      ?auto_37376 - SURFACE
      ?auto_37377 - SURFACE
      ?auto_37383 - PLACE
      ?auto_37374 - HOIST
      ?auto_37381 - SURFACE
      ?auto_37378 - TRUCK
      ?auto_37387 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37386 ?auto_37379 ) ( IS-CRATE ?auto_37371 ) ( not ( = ?auto_37371 ?auto_37372 ) ) ( not ( = ?auto_37380 ?auto_37379 ) ) ( HOIST-AT ?auto_37373 ?auto_37380 ) ( not ( = ?auto_37386 ?auto_37373 ) ) ( AVAILABLE ?auto_37373 ) ( SURFACE-AT ?auto_37371 ?auto_37380 ) ( ON ?auto_37371 ?auto_37375 ) ( CLEAR ?auto_37371 ) ( not ( = ?auto_37371 ?auto_37375 ) ) ( not ( = ?auto_37372 ?auto_37375 ) ) ( IS-CRATE ?auto_37372 ) ( not ( = ?auto_37371 ?auto_37384 ) ) ( not ( = ?auto_37372 ?auto_37384 ) ) ( not ( = ?auto_37375 ?auto_37384 ) ) ( not ( = ?auto_37385 ?auto_37379 ) ) ( not ( = ?auto_37380 ?auto_37385 ) ) ( HOIST-AT ?auto_37382 ?auto_37385 ) ( not ( = ?auto_37386 ?auto_37382 ) ) ( not ( = ?auto_37373 ?auto_37382 ) ) ( AVAILABLE ?auto_37382 ) ( SURFACE-AT ?auto_37372 ?auto_37385 ) ( ON ?auto_37372 ?auto_37376 ) ( CLEAR ?auto_37372 ) ( not ( = ?auto_37371 ?auto_37376 ) ) ( not ( = ?auto_37372 ?auto_37376 ) ) ( not ( = ?auto_37375 ?auto_37376 ) ) ( not ( = ?auto_37384 ?auto_37376 ) ) ( IS-CRATE ?auto_37384 ) ( not ( = ?auto_37371 ?auto_37377 ) ) ( not ( = ?auto_37372 ?auto_37377 ) ) ( not ( = ?auto_37375 ?auto_37377 ) ) ( not ( = ?auto_37384 ?auto_37377 ) ) ( not ( = ?auto_37376 ?auto_37377 ) ) ( not ( = ?auto_37383 ?auto_37379 ) ) ( not ( = ?auto_37380 ?auto_37383 ) ) ( not ( = ?auto_37385 ?auto_37383 ) ) ( HOIST-AT ?auto_37374 ?auto_37383 ) ( not ( = ?auto_37386 ?auto_37374 ) ) ( not ( = ?auto_37373 ?auto_37374 ) ) ( not ( = ?auto_37382 ?auto_37374 ) ) ( AVAILABLE ?auto_37374 ) ( SURFACE-AT ?auto_37384 ?auto_37383 ) ( ON ?auto_37384 ?auto_37381 ) ( CLEAR ?auto_37384 ) ( not ( = ?auto_37371 ?auto_37381 ) ) ( not ( = ?auto_37372 ?auto_37381 ) ) ( not ( = ?auto_37375 ?auto_37381 ) ) ( not ( = ?auto_37384 ?auto_37381 ) ) ( not ( = ?auto_37376 ?auto_37381 ) ) ( not ( = ?auto_37377 ?auto_37381 ) ) ( TRUCK-AT ?auto_37378 ?auto_37379 ) ( SURFACE-AT ?auto_37387 ?auto_37379 ) ( CLEAR ?auto_37387 ) ( LIFTING ?auto_37386 ?auto_37377 ) ( IS-CRATE ?auto_37377 ) ( not ( = ?auto_37371 ?auto_37387 ) ) ( not ( = ?auto_37372 ?auto_37387 ) ) ( not ( = ?auto_37375 ?auto_37387 ) ) ( not ( = ?auto_37384 ?auto_37387 ) ) ( not ( = ?auto_37376 ?auto_37387 ) ) ( not ( = ?auto_37377 ?auto_37387 ) ) ( not ( = ?auto_37381 ?auto_37387 ) ) )
    :subtasks
    ( ( !DROP ?auto_37386 ?auto_37377 ?auto_37387 ?auto_37379 )
      ( MAKE-ON ?auto_37371 ?auto_37372 )
      ( MAKE-ON-VERIFY ?auto_37371 ?auto_37372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37388 - SURFACE
      ?auto_37389 - SURFACE
    )
    :vars
    (
      ?auto_37393 - HOIST
      ?auto_37400 - PLACE
      ?auto_37391 - PLACE
      ?auto_37402 - HOIST
      ?auto_37403 - SURFACE
      ?auto_37399 - SURFACE
      ?auto_37404 - PLACE
      ?auto_37401 - HOIST
      ?auto_37396 - SURFACE
      ?auto_37398 - SURFACE
      ?auto_37397 - PLACE
      ?auto_37394 - HOIST
      ?auto_37395 - SURFACE
      ?auto_37392 - TRUCK
      ?auto_37390 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37393 ?auto_37400 ) ( IS-CRATE ?auto_37388 ) ( not ( = ?auto_37388 ?auto_37389 ) ) ( not ( = ?auto_37391 ?auto_37400 ) ) ( HOIST-AT ?auto_37402 ?auto_37391 ) ( not ( = ?auto_37393 ?auto_37402 ) ) ( AVAILABLE ?auto_37402 ) ( SURFACE-AT ?auto_37388 ?auto_37391 ) ( ON ?auto_37388 ?auto_37403 ) ( CLEAR ?auto_37388 ) ( not ( = ?auto_37388 ?auto_37403 ) ) ( not ( = ?auto_37389 ?auto_37403 ) ) ( IS-CRATE ?auto_37389 ) ( not ( = ?auto_37388 ?auto_37399 ) ) ( not ( = ?auto_37389 ?auto_37399 ) ) ( not ( = ?auto_37403 ?auto_37399 ) ) ( not ( = ?auto_37404 ?auto_37400 ) ) ( not ( = ?auto_37391 ?auto_37404 ) ) ( HOIST-AT ?auto_37401 ?auto_37404 ) ( not ( = ?auto_37393 ?auto_37401 ) ) ( not ( = ?auto_37402 ?auto_37401 ) ) ( AVAILABLE ?auto_37401 ) ( SURFACE-AT ?auto_37389 ?auto_37404 ) ( ON ?auto_37389 ?auto_37396 ) ( CLEAR ?auto_37389 ) ( not ( = ?auto_37388 ?auto_37396 ) ) ( not ( = ?auto_37389 ?auto_37396 ) ) ( not ( = ?auto_37403 ?auto_37396 ) ) ( not ( = ?auto_37399 ?auto_37396 ) ) ( IS-CRATE ?auto_37399 ) ( not ( = ?auto_37388 ?auto_37398 ) ) ( not ( = ?auto_37389 ?auto_37398 ) ) ( not ( = ?auto_37403 ?auto_37398 ) ) ( not ( = ?auto_37399 ?auto_37398 ) ) ( not ( = ?auto_37396 ?auto_37398 ) ) ( not ( = ?auto_37397 ?auto_37400 ) ) ( not ( = ?auto_37391 ?auto_37397 ) ) ( not ( = ?auto_37404 ?auto_37397 ) ) ( HOIST-AT ?auto_37394 ?auto_37397 ) ( not ( = ?auto_37393 ?auto_37394 ) ) ( not ( = ?auto_37402 ?auto_37394 ) ) ( not ( = ?auto_37401 ?auto_37394 ) ) ( AVAILABLE ?auto_37394 ) ( SURFACE-AT ?auto_37399 ?auto_37397 ) ( ON ?auto_37399 ?auto_37395 ) ( CLEAR ?auto_37399 ) ( not ( = ?auto_37388 ?auto_37395 ) ) ( not ( = ?auto_37389 ?auto_37395 ) ) ( not ( = ?auto_37403 ?auto_37395 ) ) ( not ( = ?auto_37399 ?auto_37395 ) ) ( not ( = ?auto_37396 ?auto_37395 ) ) ( not ( = ?auto_37398 ?auto_37395 ) ) ( TRUCK-AT ?auto_37392 ?auto_37400 ) ( SURFACE-AT ?auto_37390 ?auto_37400 ) ( CLEAR ?auto_37390 ) ( IS-CRATE ?auto_37398 ) ( not ( = ?auto_37388 ?auto_37390 ) ) ( not ( = ?auto_37389 ?auto_37390 ) ) ( not ( = ?auto_37403 ?auto_37390 ) ) ( not ( = ?auto_37399 ?auto_37390 ) ) ( not ( = ?auto_37396 ?auto_37390 ) ) ( not ( = ?auto_37398 ?auto_37390 ) ) ( not ( = ?auto_37395 ?auto_37390 ) ) ( AVAILABLE ?auto_37393 ) ( IN ?auto_37398 ?auto_37392 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37393 ?auto_37398 ?auto_37392 ?auto_37400 )
      ( MAKE-ON ?auto_37388 ?auto_37389 )
      ( MAKE-ON-VERIFY ?auto_37388 ?auto_37389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37405 - SURFACE
      ?auto_37406 - SURFACE
    )
    :vars
    (
      ?auto_37417 - HOIST
      ?auto_37408 - PLACE
      ?auto_37407 - PLACE
      ?auto_37421 - HOIST
      ?auto_37409 - SURFACE
      ?auto_37420 - SURFACE
      ?auto_37412 - PLACE
      ?auto_37411 - HOIST
      ?auto_37414 - SURFACE
      ?auto_37415 - SURFACE
      ?auto_37410 - PLACE
      ?auto_37413 - HOIST
      ?auto_37419 - SURFACE
      ?auto_37418 - SURFACE
      ?auto_37416 - TRUCK
      ?auto_37422 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37417 ?auto_37408 ) ( IS-CRATE ?auto_37405 ) ( not ( = ?auto_37405 ?auto_37406 ) ) ( not ( = ?auto_37407 ?auto_37408 ) ) ( HOIST-AT ?auto_37421 ?auto_37407 ) ( not ( = ?auto_37417 ?auto_37421 ) ) ( AVAILABLE ?auto_37421 ) ( SURFACE-AT ?auto_37405 ?auto_37407 ) ( ON ?auto_37405 ?auto_37409 ) ( CLEAR ?auto_37405 ) ( not ( = ?auto_37405 ?auto_37409 ) ) ( not ( = ?auto_37406 ?auto_37409 ) ) ( IS-CRATE ?auto_37406 ) ( not ( = ?auto_37405 ?auto_37420 ) ) ( not ( = ?auto_37406 ?auto_37420 ) ) ( not ( = ?auto_37409 ?auto_37420 ) ) ( not ( = ?auto_37412 ?auto_37408 ) ) ( not ( = ?auto_37407 ?auto_37412 ) ) ( HOIST-AT ?auto_37411 ?auto_37412 ) ( not ( = ?auto_37417 ?auto_37411 ) ) ( not ( = ?auto_37421 ?auto_37411 ) ) ( AVAILABLE ?auto_37411 ) ( SURFACE-AT ?auto_37406 ?auto_37412 ) ( ON ?auto_37406 ?auto_37414 ) ( CLEAR ?auto_37406 ) ( not ( = ?auto_37405 ?auto_37414 ) ) ( not ( = ?auto_37406 ?auto_37414 ) ) ( not ( = ?auto_37409 ?auto_37414 ) ) ( not ( = ?auto_37420 ?auto_37414 ) ) ( IS-CRATE ?auto_37420 ) ( not ( = ?auto_37405 ?auto_37415 ) ) ( not ( = ?auto_37406 ?auto_37415 ) ) ( not ( = ?auto_37409 ?auto_37415 ) ) ( not ( = ?auto_37420 ?auto_37415 ) ) ( not ( = ?auto_37414 ?auto_37415 ) ) ( not ( = ?auto_37410 ?auto_37408 ) ) ( not ( = ?auto_37407 ?auto_37410 ) ) ( not ( = ?auto_37412 ?auto_37410 ) ) ( HOIST-AT ?auto_37413 ?auto_37410 ) ( not ( = ?auto_37417 ?auto_37413 ) ) ( not ( = ?auto_37421 ?auto_37413 ) ) ( not ( = ?auto_37411 ?auto_37413 ) ) ( AVAILABLE ?auto_37413 ) ( SURFACE-AT ?auto_37420 ?auto_37410 ) ( ON ?auto_37420 ?auto_37419 ) ( CLEAR ?auto_37420 ) ( not ( = ?auto_37405 ?auto_37419 ) ) ( not ( = ?auto_37406 ?auto_37419 ) ) ( not ( = ?auto_37409 ?auto_37419 ) ) ( not ( = ?auto_37420 ?auto_37419 ) ) ( not ( = ?auto_37414 ?auto_37419 ) ) ( not ( = ?auto_37415 ?auto_37419 ) ) ( SURFACE-AT ?auto_37418 ?auto_37408 ) ( CLEAR ?auto_37418 ) ( IS-CRATE ?auto_37415 ) ( not ( = ?auto_37405 ?auto_37418 ) ) ( not ( = ?auto_37406 ?auto_37418 ) ) ( not ( = ?auto_37409 ?auto_37418 ) ) ( not ( = ?auto_37420 ?auto_37418 ) ) ( not ( = ?auto_37414 ?auto_37418 ) ) ( not ( = ?auto_37415 ?auto_37418 ) ) ( not ( = ?auto_37419 ?auto_37418 ) ) ( AVAILABLE ?auto_37417 ) ( IN ?auto_37415 ?auto_37416 ) ( TRUCK-AT ?auto_37416 ?auto_37422 ) ( not ( = ?auto_37422 ?auto_37408 ) ) ( not ( = ?auto_37407 ?auto_37422 ) ) ( not ( = ?auto_37412 ?auto_37422 ) ) ( not ( = ?auto_37410 ?auto_37422 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37416 ?auto_37422 ?auto_37408 )
      ( MAKE-ON ?auto_37405 ?auto_37406 )
      ( MAKE-ON-VERIFY ?auto_37405 ?auto_37406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37423 - SURFACE
      ?auto_37424 - SURFACE
    )
    :vars
    (
      ?auto_37426 - HOIST
      ?auto_37435 - PLACE
      ?auto_37439 - PLACE
      ?auto_37438 - HOIST
      ?auto_37425 - SURFACE
      ?auto_37431 - SURFACE
      ?auto_37434 - PLACE
      ?auto_37437 - HOIST
      ?auto_37433 - SURFACE
      ?auto_37430 - SURFACE
      ?auto_37427 - PLACE
      ?auto_37428 - HOIST
      ?auto_37440 - SURFACE
      ?auto_37432 - SURFACE
      ?auto_37436 - TRUCK
      ?auto_37429 - PLACE
      ?auto_37441 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37426 ?auto_37435 ) ( IS-CRATE ?auto_37423 ) ( not ( = ?auto_37423 ?auto_37424 ) ) ( not ( = ?auto_37439 ?auto_37435 ) ) ( HOIST-AT ?auto_37438 ?auto_37439 ) ( not ( = ?auto_37426 ?auto_37438 ) ) ( AVAILABLE ?auto_37438 ) ( SURFACE-AT ?auto_37423 ?auto_37439 ) ( ON ?auto_37423 ?auto_37425 ) ( CLEAR ?auto_37423 ) ( not ( = ?auto_37423 ?auto_37425 ) ) ( not ( = ?auto_37424 ?auto_37425 ) ) ( IS-CRATE ?auto_37424 ) ( not ( = ?auto_37423 ?auto_37431 ) ) ( not ( = ?auto_37424 ?auto_37431 ) ) ( not ( = ?auto_37425 ?auto_37431 ) ) ( not ( = ?auto_37434 ?auto_37435 ) ) ( not ( = ?auto_37439 ?auto_37434 ) ) ( HOIST-AT ?auto_37437 ?auto_37434 ) ( not ( = ?auto_37426 ?auto_37437 ) ) ( not ( = ?auto_37438 ?auto_37437 ) ) ( AVAILABLE ?auto_37437 ) ( SURFACE-AT ?auto_37424 ?auto_37434 ) ( ON ?auto_37424 ?auto_37433 ) ( CLEAR ?auto_37424 ) ( not ( = ?auto_37423 ?auto_37433 ) ) ( not ( = ?auto_37424 ?auto_37433 ) ) ( not ( = ?auto_37425 ?auto_37433 ) ) ( not ( = ?auto_37431 ?auto_37433 ) ) ( IS-CRATE ?auto_37431 ) ( not ( = ?auto_37423 ?auto_37430 ) ) ( not ( = ?auto_37424 ?auto_37430 ) ) ( not ( = ?auto_37425 ?auto_37430 ) ) ( not ( = ?auto_37431 ?auto_37430 ) ) ( not ( = ?auto_37433 ?auto_37430 ) ) ( not ( = ?auto_37427 ?auto_37435 ) ) ( not ( = ?auto_37439 ?auto_37427 ) ) ( not ( = ?auto_37434 ?auto_37427 ) ) ( HOIST-AT ?auto_37428 ?auto_37427 ) ( not ( = ?auto_37426 ?auto_37428 ) ) ( not ( = ?auto_37438 ?auto_37428 ) ) ( not ( = ?auto_37437 ?auto_37428 ) ) ( AVAILABLE ?auto_37428 ) ( SURFACE-AT ?auto_37431 ?auto_37427 ) ( ON ?auto_37431 ?auto_37440 ) ( CLEAR ?auto_37431 ) ( not ( = ?auto_37423 ?auto_37440 ) ) ( not ( = ?auto_37424 ?auto_37440 ) ) ( not ( = ?auto_37425 ?auto_37440 ) ) ( not ( = ?auto_37431 ?auto_37440 ) ) ( not ( = ?auto_37433 ?auto_37440 ) ) ( not ( = ?auto_37430 ?auto_37440 ) ) ( SURFACE-AT ?auto_37432 ?auto_37435 ) ( CLEAR ?auto_37432 ) ( IS-CRATE ?auto_37430 ) ( not ( = ?auto_37423 ?auto_37432 ) ) ( not ( = ?auto_37424 ?auto_37432 ) ) ( not ( = ?auto_37425 ?auto_37432 ) ) ( not ( = ?auto_37431 ?auto_37432 ) ) ( not ( = ?auto_37433 ?auto_37432 ) ) ( not ( = ?auto_37430 ?auto_37432 ) ) ( not ( = ?auto_37440 ?auto_37432 ) ) ( AVAILABLE ?auto_37426 ) ( TRUCK-AT ?auto_37436 ?auto_37429 ) ( not ( = ?auto_37429 ?auto_37435 ) ) ( not ( = ?auto_37439 ?auto_37429 ) ) ( not ( = ?auto_37434 ?auto_37429 ) ) ( not ( = ?auto_37427 ?auto_37429 ) ) ( HOIST-AT ?auto_37441 ?auto_37429 ) ( LIFTING ?auto_37441 ?auto_37430 ) ( not ( = ?auto_37426 ?auto_37441 ) ) ( not ( = ?auto_37438 ?auto_37441 ) ) ( not ( = ?auto_37437 ?auto_37441 ) ) ( not ( = ?auto_37428 ?auto_37441 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37441 ?auto_37430 ?auto_37436 ?auto_37429 )
      ( MAKE-ON ?auto_37423 ?auto_37424 )
      ( MAKE-ON-VERIFY ?auto_37423 ?auto_37424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37442 - SURFACE
      ?auto_37443 - SURFACE
    )
    :vars
    (
      ?auto_37457 - HOIST
      ?auto_37448 - PLACE
      ?auto_37458 - PLACE
      ?auto_37444 - HOIST
      ?auto_37460 - SURFACE
      ?auto_37454 - SURFACE
      ?auto_37451 - PLACE
      ?auto_37449 - HOIST
      ?auto_37447 - SURFACE
      ?auto_37450 - SURFACE
      ?auto_37455 - PLACE
      ?auto_37452 - HOIST
      ?auto_37446 - SURFACE
      ?auto_37456 - SURFACE
      ?auto_37453 - TRUCK
      ?auto_37445 - PLACE
      ?auto_37459 - HOIST
      ?auto_37461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37457 ?auto_37448 ) ( IS-CRATE ?auto_37442 ) ( not ( = ?auto_37442 ?auto_37443 ) ) ( not ( = ?auto_37458 ?auto_37448 ) ) ( HOIST-AT ?auto_37444 ?auto_37458 ) ( not ( = ?auto_37457 ?auto_37444 ) ) ( AVAILABLE ?auto_37444 ) ( SURFACE-AT ?auto_37442 ?auto_37458 ) ( ON ?auto_37442 ?auto_37460 ) ( CLEAR ?auto_37442 ) ( not ( = ?auto_37442 ?auto_37460 ) ) ( not ( = ?auto_37443 ?auto_37460 ) ) ( IS-CRATE ?auto_37443 ) ( not ( = ?auto_37442 ?auto_37454 ) ) ( not ( = ?auto_37443 ?auto_37454 ) ) ( not ( = ?auto_37460 ?auto_37454 ) ) ( not ( = ?auto_37451 ?auto_37448 ) ) ( not ( = ?auto_37458 ?auto_37451 ) ) ( HOIST-AT ?auto_37449 ?auto_37451 ) ( not ( = ?auto_37457 ?auto_37449 ) ) ( not ( = ?auto_37444 ?auto_37449 ) ) ( AVAILABLE ?auto_37449 ) ( SURFACE-AT ?auto_37443 ?auto_37451 ) ( ON ?auto_37443 ?auto_37447 ) ( CLEAR ?auto_37443 ) ( not ( = ?auto_37442 ?auto_37447 ) ) ( not ( = ?auto_37443 ?auto_37447 ) ) ( not ( = ?auto_37460 ?auto_37447 ) ) ( not ( = ?auto_37454 ?auto_37447 ) ) ( IS-CRATE ?auto_37454 ) ( not ( = ?auto_37442 ?auto_37450 ) ) ( not ( = ?auto_37443 ?auto_37450 ) ) ( not ( = ?auto_37460 ?auto_37450 ) ) ( not ( = ?auto_37454 ?auto_37450 ) ) ( not ( = ?auto_37447 ?auto_37450 ) ) ( not ( = ?auto_37455 ?auto_37448 ) ) ( not ( = ?auto_37458 ?auto_37455 ) ) ( not ( = ?auto_37451 ?auto_37455 ) ) ( HOIST-AT ?auto_37452 ?auto_37455 ) ( not ( = ?auto_37457 ?auto_37452 ) ) ( not ( = ?auto_37444 ?auto_37452 ) ) ( not ( = ?auto_37449 ?auto_37452 ) ) ( AVAILABLE ?auto_37452 ) ( SURFACE-AT ?auto_37454 ?auto_37455 ) ( ON ?auto_37454 ?auto_37446 ) ( CLEAR ?auto_37454 ) ( not ( = ?auto_37442 ?auto_37446 ) ) ( not ( = ?auto_37443 ?auto_37446 ) ) ( not ( = ?auto_37460 ?auto_37446 ) ) ( not ( = ?auto_37454 ?auto_37446 ) ) ( not ( = ?auto_37447 ?auto_37446 ) ) ( not ( = ?auto_37450 ?auto_37446 ) ) ( SURFACE-AT ?auto_37456 ?auto_37448 ) ( CLEAR ?auto_37456 ) ( IS-CRATE ?auto_37450 ) ( not ( = ?auto_37442 ?auto_37456 ) ) ( not ( = ?auto_37443 ?auto_37456 ) ) ( not ( = ?auto_37460 ?auto_37456 ) ) ( not ( = ?auto_37454 ?auto_37456 ) ) ( not ( = ?auto_37447 ?auto_37456 ) ) ( not ( = ?auto_37450 ?auto_37456 ) ) ( not ( = ?auto_37446 ?auto_37456 ) ) ( AVAILABLE ?auto_37457 ) ( TRUCK-AT ?auto_37453 ?auto_37445 ) ( not ( = ?auto_37445 ?auto_37448 ) ) ( not ( = ?auto_37458 ?auto_37445 ) ) ( not ( = ?auto_37451 ?auto_37445 ) ) ( not ( = ?auto_37455 ?auto_37445 ) ) ( HOIST-AT ?auto_37459 ?auto_37445 ) ( not ( = ?auto_37457 ?auto_37459 ) ) ( not ( = ?auto_37444 ?auto_37459 ) ) ( not ( = ?auto_37449 ?auto_37459 ) ) ( not ( = ?auto_37452 ?auto_37459 ) ) ( AVAILABLE ?auto_37459 ) ( SURFACE-AT ?auto_37450 ?auto_37445 ) ( ON ?auto_37450 ?auto_37461 ) ( CLEAR ?auto_37450 ) ( not ( = ?auto_37442 ?auto_37461 ) ) ( not ( = ?auto_37443 ?auto_37461 ) ) ( not ( = ?auto_37460 ?auto_37461 ) ) ( not ( = ?auto_37454 ?auto_37461 ) ) ( not ( = ?auto_37447 ?auto_37461 ) ) ( not ( = ?auto_37450 ?auto_37461 ) ) ( not ( = ?auto_37446 ?auto_37461 ) ) ( not ( = ?auto_37456 ?auto_37461 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37459 ?auto_37450 ?auto_37461 ?auto_37445 )
      ( MAKE-ON ?auto_37442 ?auto_37443 )
      ( MAKE-ON-VERIFY ?auto_37442 ?auto_37443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37462 - SURFACE
      ?auto_37463 - SURFACE
    )
    :vars
    (
      ?auto_37469 - HOIST
      ?auto_37479 - PLACE
      ?auto_37480 - PLACE
      ?auto_37470 - HOIST
      ?auto_37468 - SURFACE
      ?auto_37475 - SURFACE
      ?auto_37464 - PLACE
      ?auto_37471 - HOIST
      ?auto_37478 - SURFACE
      ?auto_37473 - SURFACE
      ?auto_37476 - PLACE
      ?auto_37465 - HOIST
      ?auto_37481 - SURFACE
      ?auto_37474 - SURFACE
      ?auto_37477 - PLACE
      ?auto_37472 - HOIST
      ?auto_37467 - SURFACE
      ?auto_37466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37469 ?auto_37479 ) ( IS-CRATE ?auto_37462 ) ( not ( = ?auto_37462 ?auto_37463 ) ) ( not ( = ?auto_37480 ?auto_37479 ) ) ( HOIST-AT ?auto_37470 ?auto_37480 ) ( not ( = ?auto_37469 ?auto_37470 ) ) ( AVAILABLE ?auto_37470 ) ( SURFACE-AT ?auto_37462 ?auto_37480 ) ( ON ?auto_37462 ?auto_37468 ) ( CLEAR ?auto_37462 ) ( not ( = ?auto_37462 ?auto_37468 ) ) ( not ( = ?auto_37463 ?auto_37468 ) ) ( IS-CRATE ?auto_37463 ) ( not ( = ?auto_37462 ?auto_37475 ) ) ( not ( = ?auto_37463 ?auto_37475 ) ) ( not ( = ?auto_37468 ?auto_37475 ) ) ( not ( = ?auto_37464 ?auto_37479 ) ) ( not ( = ?auto_37480 ?auto_37464 ) ) ( HOIST-AT ?auto_37471 ?auto_37464 ) ( not ( = ?auto_37469 ?auto_37471 ) ) ( not ( = ?auto_37470 ?auto_37471 ) ) ( AVAILABLE ?auto_37471 ) ( SURFACE-AT ?auto_37463 ?auto_37464 ) ( ON ?auto_37463 ?auto_37478 ) ( CLEAR ?auto_37463 ) ( not ( = ?auto_37462 ?auto_37478 ) ) ( not ( = ?auto_37463 ?auto_37478 ) ) ( not ( = ?auto_37468 ?auto_37478 ) ) ( not ( = ?auto_37475 ?auto_37478 ) ) ( IS-CRATE ?auto_37475 ) ( not ( = ?auto_37462 ?auto_37473 ) ) ( not ( = ?auto_37463 ?auto_37473 ) ) ( not ( = ?auto_37468 ?auto_37473 ) ) ( not ( = ?auto_37475 ?auto_37473 ) ) ( not ( = ?auto_37478 ?auto_37473 ) ) ( not ( = ?auto_37476 ?auto_37479 ) ) ( not ( = ?auto_37480 ?auto_37476 ) ) ( not ( = ?auto_37464 ?auto_37476 ) ) ( HOIST-AT ?auto_37465 ?auto_37476 ) ( not ( = ?auto_37469 ?auto_37465 ) ) ( not ( = ?auto_37470 ?auto_37465 ) ) ( not ( = ?auto_37471 ?auto_37465 ) ) ( AVAILABLE ?auto_37465 ) ( SURFACE-AT ?auto_37475 ?auto_37476 ) ( ON ?auto_37475 ?auto_37481 ) ( CLEAR ?auto_37475 ) ( not ( = ?auto_37462 ?auto_37481 ) ) ( not ( = ?auto_37463 ?auto_37481 ) ) ( not ( = ?auto_37468 ?auto_37481 ) ) ( not ( = ?auto_37475 ?auto_37481 ) ) ( not ( = ?auto_37478 ?auto_37481 ) ) ( not ( = ?auto_37473 ?auto_37481 ) ) ( SURFACE-AT ?auto_37474 ?auto_37479 ) ( CLEAR ?auto_37474 ) ( IS-CRATE ?auto_37473 ) ( not ( = ?auto_37462 ?auto_37474 ) ) ( not ( = ?auto_37463 ?auto_37474 ) ) ( not ( = ?auto_37468 ?auto_37474 ) ) ( not ( = ?auto_37475 ?auto_37474 ) ) ( not ( = ?auto_37478 ?auto_37474 ) ) ( not ( = ?auto_37473 ?auto_37474 ) ) ( not ( = ?auto_37481 ?auto_37474 ) ) ( AVAILABLE ?auto_37469 ) ( not ( = ?auto_37477 ?auto_37479 ) ) ( not ( = ?auto_37480 ?auto_37477 ) ) ( not ( = ?auto_37464 ?auto_37477 ) ) ( not ( = ?auto_37476 ?auto_37477 ) ) ( HOIST-AT ?auto_37472 ?auto_37477 ) ( not ( = ?auto_37469 ?auto_37472 ) ) ( not ( = ?auto_37470 ?auto_37472 ) ) ( not ( = ?auto_37471 ?auto_37472 ) ) ( not ( = ?auto_37465 ?auto_37472 ) ) ( AVAILABLE ?auto_37472 ) ( SURFACE-AT ?auto_37473 ?auto_37477 ) ( ON ?auto_37473 ?auto_37467 ) ( CLEAR ?auto_37473 ) ( not ( = ?auto_37462 ?auto_37467 ) ) ( not ( = ?auto_37463 ?auto_37467 ) ) ( not ( = ?auto_37468 ?auto_37467 ) ) ( not ( = ?auto_37475 ?auto_37467 ) ) ( not ( = ?auto_37478 ?auto_37467 ) ) ( not ( = ?auto_37473 ?auto_37467 ) ) ( not ( = ?auto_37481 ?auto_37467 ) ) ( not ( = ?auto_37474 ?auto_37467 ) ) ( TRUCK-AT ?auto_37466 ?auto_37479 ) )
    :subtasks
    ( ( !DRIVE ?auto_37466 ?auto_37479 ?auto_37477 )
      ( MAKE-ON ?auto_37462 ?auto_37463 )
      ( MAKE-ON-VERIFY ?auto_37462 ?auto_37463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37482 - SURFACE
      ?auto_37483 - SURFACE
    )
    :vars
    (
      ?auto_37484 - HOIST
      ?auto_37497 - PLACE
      ?auto_37489 - PLACE
      ?auto_37487 - HOIST
      ?auto_37490 - SURFACE
      ?auto_37491 - SURFACE
      ?auto_37485 - PLACE
      ?auto_37496 - HOIST
      ?auto_37494 - SURFACE
      ?auto_37493 - SURFACE
      ?auto_37495 - PLACE
      ?auto_37486 - HOIST
      ?auto_37498 - SURFACE
      ?auto_37501 - SURFACE
      ?auto_37492 - PLACE
      ?auto_37488 - HOIST
      ?auto_37499 - SURFACE
      ?auto_37500 - TRUCK
      ?auto_37502 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37484 ?auto_37497 ) ( IS-CRATE ?auto_37482 ) ( not ( = ?auto_37482 ?auto_37483 ) ) ( not ( = ?auto_37489 ?auto_37497 ) ) ( HOIST-AT ?auto_37487 ?auto_37489 ) ( not ( = ?auto_37484 ?auto_37487 ) ) ( AVAILABLE ?auto_37487 ) ( SURFACE-AT ?auto_37482 ?auto_37489 ) ( ON ?auto_37482 ?auto_37490 ) ( CLEAR ?auto_37482 ) ( not ( = ?auto_37482 ?auto_37490 ) ) ( not ( = ?auto_37483 ?auto_37490 ) ) ( IS-CRATE ?auto_37483 ) ( not ( = ?auto_37482 ?auto_37491 ) ) ( not ( = ?auto_37483 ?auto_37491 ) ) ( not ( = ?auto_37490 ?auto_37491 ) ) ( not ( = ?auto_37485 ?auto_37497 ) ) ( not ( = ?auto_37489 ?auto_37485 ) ) ( HOIST-AT ?auto_37496 ?auto_37485 ) ( not ( = ?auto_37484 ?auto_37496 ) ) ( not ( = ?auto_37487 ?auto_37496 ) ) ( AVAILABLE ?auto_37496 ) ( SURFACE-AT ?auto_37483 ?auto_37485 ) ( ON ?auto_37483 ?auto_37494 ) ( CLEAR ?auto_37483 ) ( not ( = ?auto_37482 ?auto_37494 ) ) ( not ( = ?auto_37483 ?auto_37494 ) ) ( not ( = ?auto_37490 ?auto_37494 ) ) ( not ( = ?auto_37491 ?auto_37494 ) ) ( IS-CRATE ?auto_37491 ) ( not ( = ?auto_37482 ?auto_37493 ) ) ( not ( = ?auto_37483 ?auto_37493 ) ) ( not ( = ?auto_37490 ?auto_37493 ) ) ( not ( = ?auto_37491 ?auto_37493 ) ) ( not ( = ?auto_37494 ?auto_37493 ) ) ( not ( = ?auto_37495 ?auto_37497 ) ) ( not ( = ?auto_37489 ?auto_37495 ) ) ( not ( = ?auto_37485 ?auto_37495 ) ) ( HOIST-AT ?auto_37486 ?auto_37495 ) ( not ( = ?auto_37484 ?auto_37486 ) ) ( not ( = ?auto_37487 ?auto_37486 ) ) ( not ( = ?auto_37496 ?auto_37486 ) ) ( AVAILABLE ?auto_37486 ) ( SURFACE-AT ?auto_37491 ?auto_37495 ) ( ON ?auto_37491 ?auto_37498 ) ( CLEAR ?auto_37491 ) ( not ( = ?auto_37482 ?auto_37498 ) ) ( not ( = ?auto_37483 ?auto_37498 ) ) ( not ( = ?auto_37490 ?auto_37498 ) ) ( not ( = ?auto_37491 ?auto_37498 ) ) ( not ( = ?auto_37494 ?auto_37498 ) ) ( not ( = ?auto_37493 ?auto_37498 ) ) ( IS-CRATE ?auto_37493 ) ( not ( = ?auto_37482 ?auto_37501 ) ) ( not ( = ?auto_37483 ?auto_37501 ) ) ( not ( = ?auto_37490 ?auto_37501 ) ) ( not ( = ?auto_37491 ?auto_37501 ) ) ( not ( = ?auto_37494 ?auto_37501 ) ) ( not ( = ?auto_37493 ?auto_37501 ) ) ( not ( = ?auto_37498 ?auto_37501 ) ) ( not ( = ?auto_37492 ?auto_37497 ) ) ( not ( = ?auto_37489 ?auto_37492 ) ) ( not ( = ?auto_37485 ?auto_37492 ) ) ( not ( = ?auto_37495 ?auto_37492 ) ) ( HOIST-AT ?auto_37488 ?auto_37492 ) ( not ( = ?auto_37484 ?auto_37488 ) ) ( not ( = ?auto_37487 ?auto_37488 ) ) ( not ( = ?auto_37496 ?auto_37488 ) ) ( not ( = ?auto_37486 ?auto_37488 ) ) ( AVAILABLE ?auto_37488 ) ( SURFACE-AT ?auto_37493 ?auto_37492 ) ( ON ?auto_37493 ?auto_37499 ) ( CLEAR ?auto_37493 ) ( not ( = ?auto_37482 ?auto_37499 ) ) ( not ( = ?auto_37483 ?auto_37499 ) ) ( not ( = ?auto_37490 ?auto_37499 ) ) ( not ( = ?auto_37491 ?auto_37499 ) ) ( not ( = ?auto_37494 ?auto_37499 ) ) ( not ( = ?auto_37493 ?auto_37499 ) ) ( not ( = ?auto_37498 ?auto_37499 ) ) ( not ( = ?auto_37501 ?auto_37499 ) ) ( TRUCK-AT ?auto_37500 ?auto_37497 ) ( SURFACE-AT ?auto_37502 ?auto_37497 ) ( CLEAR ?auto_37502 ) ( LIFTING ?auto_37484 ?auto_37501 ) ( IS-CRATE ?auto_37501 ) ( not ( = ?auto_37482 ?auto_37502 ) ) ( not ( = ?auto_37483 ?auto_37502 ) ) ( not ( = ?auto_37490 ?auto_37502 ) ) ( not ( = ?auto_37491 ?auto_37502 ) ) ( not ( = ?auto_37494 ?auto_37502 ) ) ( not ( = ?auto_37493 ?auto_37502 ) ) ( not ( = ?auto_37498 ?auto_37502 ) ) ( not ( = ?auto_37501 ?auto_37502 ) ) ( not ( = ?auto_37499 ?auto_37502 ) ) )
    :subtasks
    ( ( !DROP ?auto_37484 ?auto_37501 ?auto_37502 ?auto_37497 )
      ( MAKE-ON ?auto_37482 ?auto_37483 )
      ( MAKE-ON-VERIFY ?auto_37482 ?auto_37483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37503 - SURFACE
      ?auto_37504 - SURFACE
    )
    :vars
    (
      ?auto_37508 - HOIST
      ?auto_37515 - PLACE
      ?auto_37521 - PLACE
      ?auto_37519 - HOIST
      ?auto_37523 - SURFACE
      ?auto_37516 - SURFACE
      ?auto_37505 - PLACE
      ?auto_37514 - HOIST
      ?auto_37511 - SURFACE
      ?auto_37512 - SURFACE
      ?auto_37517 - PLACE
      ?auto_37518 - HOIST
      ?auto_37513 - SURFACE
      ?auto_37510 - SURFACE
      ?auto_37507 - PLACE
      ?auto_37520 - HOIST
      ?auto_37522 - SURFACE
      ?auto_37509 - TRUCK
      ?auto_37506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37508 ?auto_37515 ) ( IS-CRATE ?auto_37503 ) ( not ( = ?auto_37503 ?auto_37504 ) ) ( not ( = ?auto_37521 ?auto_37515 ) ) ( HOIST-AT ?auto_37519 ?auto_37521 ) ( not ( = ?auto_37508 ?auto_37519 ) ) ( AVAILABLE ?auto_37519 ) ( SURFACE-AT ?auto_37503 ?auto_37521 ) ( ON ?auto_37503 ?auto_37523 ) ( CLEAR ?auto_37503 ) ( not ( = ?auto_37503 ?auto_37523 ) ) ( not ( = ?auto_37504 ?auto_37523 ) ) ( IS-CRATE ?auto_37504 ) ( not ( = ?auto_37503 ?auto_37516 ) ) ( not ( = ?auto_37504 ?auto_37516 ) ) ( not ( = ?auto_37523 ?auto_37516 ) ) ( not ( = ?auto_37505 ?auto_37515 ) ) ( not ( = ?auto_37521 ?auto_37505 ) ) ( HOIST-AT ?auto_37514 ?auto_37505 ) ( not ( = ?auto_37508 ?auto_37514 ) ) ( not ( = ?auto_37519 ?auto_37514 ) ) ( AVAILABLE ?auto_37514 ) ( SURFACE-AT ?auto_37504 ?auto_37505 ) ( ON ?auto_37504 ?auto_37511 ) ( CLEAR ?auto_37504 ) ( not ( = ?auto_37503 ?auto_37511 ) ) ( not ( = ?auto_37504 ?auto_37511 ) ) ( not ( = ?auto_37523 ?auto_37511 ) ) ( not ( = ?auto_37516 ?auto_37511 ) ) ( IS-CRATE ?auto_37516 ) ( not ( = ?auto_37503 ?auto_37512 ) ) ( not ( = ?auto_37504 ?auto_37512 ) ) ( not ( = ?auto_37523 ?auto_37512 ) ) ( not ( = ?auto_37516 ?auto_37512 ) ) ( not ( = ?auto_37511 ?auto_37512 ) ) ( not ( = ?auto_37517 ?auto_37515 ) ) ( not ( = ?auto_37521 ?auto_37517 ) ) ( not ( = ?auto_37505 ?auto_37517 ) ) ( HOIST-AT ?auto_37518 ?auto_37517 ) ( not ( = ?auto_37508 ?auto_37518 ) ) ( not ( = ?auto_37519 ?auto_37518 ) ) ( not ( = ?auto_37514 ?auto_37518 ) ) ( AVAILABLE ?auto_37518 ) ( SURFACE-AT ?auto_37516 ?auto_37517 ) ( ON ?auto_37516 ?auto_37513 ) ( CLEAR ?auto_37516 ) ( not ( = ?auto_37503 ?auto_37513 ) ) ( not ( = ?auto_37504 ?auto_37513 ) ) ( not ( = ?auto_37523 ?auto_37513 ) ) ( not ( = ?auto_37516 ?auto_37513 ) ) ( not ( = ?auto_37511 ?auto_37513 ) ) ( not ( = ?auto_37512 ?auto_37513 ) ) ( IS-CRATE ?auto_37512 ) ( not ( = ?auto_37503 ?auto_37510 ) ) ( not ( = ?auto_37504 ?auto_37510 ) ) ( not ( = ?auto_37523 ?auto_37510 ) ) ( not ( = ?auto_37516 ?auto_37510 ) ) ( not ( = ?auto_37511 ?auto_37510 ) ) ( not ( = ?auto_37512 ?auto_37510 ) ) ( not ( = ?auto_37513 ?auto_37510 ) ) ( not ( = ?auto_37507 ?auto_37515 ) ) ( not ( = ?auto_37521 ?auto_37507 ) ) ( not ( = ?auto_37505 ?auto_37507 ) ) ( not ( = ?auto_37517 ?auto_37507 ) ) ( HOIST-AT ?auto_37520 ?auto_37507 ) ( not ( = ?auto_37508 ?auto_37520 ) ) ( not ( = ?auto_37519 ?auto_37520 ) ) ( not ( = ?auto_37514 ?auto_37520 ) ) ( not ( = ?auto_37518 ?auto_37520 ) ) ( AVAILABLE ?auto_37520 ) ( SURFACE-AT ?auto_37512 ?auto_37507 ) ( ON ?auto_37512 ?auto_37522 ) ( CLEAR ?auto_37512 ) ( not ( = ?auto_37503 ?auto_37522 ) ) ( not ( = ?auto_37504 ?auto_37522 ) ) ( not ( = ?auto_37523 ?auto_37522 ) ) ( not ( = ?auto_37516 ?auto_37522 ) ) ( not ( = ?auto_37511 ?auto_37522 ) ) ( not ( = ?auto_37512 ?auto_37522 ) ) ( not ( = ?auto_37513 ?auto_37522 ) ) ( not ( = ?auto_37510 ?auto_37522 ) ) ( TRUCK-AT ?auto_37509 ?auto_37515 ) ( SURFACE-AT ?auto_37506 ?auto_37515 ) ( CLEAR ?auto_37506 ) ( IS-CRATE ?auto_37510 ) ( not ( = ?auto_37503 ?auto_37506 ) ) ( not ( = ?auto_37504 ?auto_37506 ) ) ( not ( = ?auto_37523 ?auto_37506 ) ) ( not ( = ?auto_37516 ?auto_37506 ) ) ( not ( = ?auto_37511 ?auto_37506 ) ) ( not ( = ?auto_37512 ?auto_37506 ) ) ( not ( = ?auto_37513 ?auto_37506 ) ) ( not ( = ?auto_37510 ?auto_37506 ) ) ( not ( = ?auto_37522 ?auto_37506 ) ) ( AVAILABLE ?auto_37508 ) ( IN ?auto_37510 ?auto_37509 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37508 ?auto_37510 ?auto_37509 ?auto_37515 )
      ( MAKE-ON ?auto_37503 ?auto_37504 )
      ( MAKE-ON-VERIFY ?auto_37503 ?auto_37504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37524 - SURFACE
      ?auto_37525 - SURFACE
    )
    :vars
    (
      ?auto_37540 - HOIST
      ?auto_37544 - PLACE
      ?auto_37526 - PLACE
      ?auto_37538 - HOIST
      ?auto_37528 - SURFACE
      ?auto_37533 - SURFACE
      ?auto_37530 - PLACE
      ?auto_37532 - HOIST
      ?auto_37539 - SURFACE
      ?auto_37531 - SURFACE
      ?auto_37537 - PLACE
      ?auto_37541 - HOIST
      ?auto_37536 - SURFACE
      ?auto_37535 - SURFACE
      ?auto_37529 - PLACE
      ?auto_37534 - HOIST
      ?auto_37527 - SURFACE
      ?auto_37542 - SURFACE
      ?auto_37543 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37540 ?auto_37544 ) ( IS-CRATE ?auto_37524 ) ( not ( = ?auto_37524 ?auto_37525 ) ) ( not ( = ?auto_37526 ?auto_37544 ) ) ( HOIST-AT ?auto_37538 ?auto_37526 ) ( not ( = ?auto_37540 ?auto_37538 ) ) ( AVAILABLE ?auto_37538 ) ( SURFACE-AT ?auto_37524 ?auto_37526 ) ( ON ?auto_37524 ?auto_37528 ) ( CLEAR ?auto_37524 ) ( not ( = ?auto_37524 ?auto_37528 ) ) ( not ( = ?auto_37525 ?auto_37528 ) ) ( IS-CRATE ?auto_37525 ) ( not ( = ?auto_37524 ?auto_37533 ) ) ( not ( = ?auto_37525 ?auto_37533 ) ) ( not ( = ?auto_37528 ?auto_37533 ) ) ( not ( = ?auto_37530 ?auto_37544 ) ) ( not ( = ?auto_37526 ?auto_37530 ) ) ( HOIST-AT ?auto_37532 ?auto_37530 ) ( not ( = ?auto_37540 ?auto_37532 ) ) ( not ( = ?auto_37538 ?auto_37532 ) ) ( AVAILABLE ?auto_37532 ) ( SURFACE-AT ?auto_37525 ?auto_37530 ) ( ON ?auto_37525 ?auto_37539 ) ( CLEAR ?auto_37525 ) ( not ( = ?auto_37524 ?auto_37539 ) ) ( not ( = ?auto_37525 ?auto_37539 ) ) ( not ( = ?auto_37528 ?auto_37539 ) ) ( not ( = ?auto_37533 ?auto_37539 ) ) ( IS-CRATE ?auto_37533 ) ( not ( = ?auto_37524 ?auto_37531 ) ) ( not ( = ?auto_37525 ?auto_37531 ) ) ( not ( = ?auto_37528 ?auto_37531 ) ) ( not ( = ?auto_37533 ?auto_37531 ) ) ( not ( = ?auto_37539 ?auto_37531 ) ) ( not ( = ?auto_37537 ?auto_37544 ) ) ( not ( = ?auto_37526 ?auto_37537 ) ) ( not ( = ?auto_37530 ?auto_37537 ) ) ( HOIST-AT ?auto_37541 ?auto_37537 ) ( not ( = ?auto_37540 ?auto_37541 ) ) ( not ( = ?auto_37538 ?auto_37541 ) ) ( not ( = ?auto_37532 ?auto_37541 ) ) ( AVAILABLE ?auto_37541 ) ( SURFACE-AT ?auto_37533 ?auto_37537 ) ( ON ?auto_37533 ?auto_37536 ) ( CLEAR ?auto_37533 ) ( not ( = ?auto_37524 ?auto_37536 ) ) ( not ( = ?auto_37525 ?auto_37536 ) ) ( not ( = ?auto_37528 ?auto_37536 ) ) ( not ( = ?auto_37533 ?auto_37536 ) ) ( not ( = ?auto_37539 ?auto_37536 ) ) ( not ( = ?auto_37531 ?auto_37536 ) ) ( IS-CRATE ?auto_37531 ) ( not ( = ?auto_37524 ?auto_37535 ) ) ( not ( = ?auto_37525 ?auto_37535 ) ) ( not ( = ?auto_37528 ?auto_37535 ) ) ( not ( = ?auto_37533 ?auto_37535 ) ) ( not ( = ?auto_37539 ?auto_37535 ) ) ( not ( = ?auto_37531 ?auto_37535 ) ) ( not ( = ?auto_37536 ?auto_37535 ) ) ( not ( = ?auto_37529 ?auto_37544 ) ) ( not ( = ?auto_37526 ?auto_37529 ) ) ( not ( = ?auto_37530 ?auto_37529 ) ) ( not ( = ?auto_37537 ?auto_37529 ) ) ( HOIST-AT ?auto_37534 ?auto_37529 ) ( not ( = ?auto_37540 ?auto_37534 ) ) ( not ( = ?auto_37538 ?auto_37534 ) ) ( not ( = ?auto_37532 ?auto_37534 ) ) ( not ( = ?auto_37541 ?auto_37534 ) ) ( AVAILABLE ?auto_37534 ) ( SURFACE-AT ?auto_37531 ?auto_37529 ) ( ON ?auto_37531 ?auto_37527 ) ( CLEAR ?auto_37531 ) ( not ( = ?auto_37524 ?auto_37527 ) ) ( not ( = ?auto_37525 ?auto_37527 ) ) ( not ( = ?auto_37528 ?auto_37527 ) ) ( not ( = ?auto_37533 ?auto_37527 ) ) ( not ( = ?auto_37539 ?auto_37527 ) ) ( not ( = ?auto_37531 ?auto_37527 ) ) ( not ( = ?auto_37536 ?auto_37527 ) ) ( not ( = ?auto_37535 ?auto_37527 ) ) ( SURFACE-AT ?auto_37542 ?auto_37544 ) ( CLEAR ?auto_37542 ) ( IS-CRATE ?auto_37535 ) ( not ( = ?auto_37524 ?auto_37542 ) ) ( not ( = ?auto_37525 ?auto_37542 ) ) ( not ( = ?auto_37528 ?auto_37542 ) ) ( not ( = ?auto_37533 ?auto_37542 ) ) ( not ( = ?auto_37539 ?auto_37542 ) ) ( not ( = ?auto_37531 ?auto_37542 ) ) ( not ( = ?auto_37536 ?auto_37542 ) ) ( not ( = ?auto_37535 ?auto_37542 ) ) ( not ( = ?auto_37527 ?auto_37542 ) ) ( AVAILABLE ?auto_37540 ) ( IN ?auto_37535 ?auto_37543 ) ( TRUCK-AT ?auto_37543 ?auto_37530 ) )
    :subtasks
    ( ( !DRIVE ?auto_37543 ?auto_37530 ?auto_37544 )
      ( MAKE-ON ?auto_37524 ?auto_37525 )
      ( MAKE-ON-VERIFY ?auto_37524 ?auto_37525 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37545 - SURFACE
      ?auto_37546 - SURFACE
    )
    :vars
    (
      ?auto_37563 - HOIST
      ?auto_37548 - PLACE
      ?auto_37550 - PLACE
      ?auto_37559 - HOIST
      ?auto_37561 - SURFACE
      ?auto_37555 - SURFACE
      ?auto_37562 - PLACE
      ?auto_37551 - HOIST
      ?auto_37553 - SURFACE
      ?auto_37564 - SURFACE
      ?auto_37558 - PLACE
      ?auto_37549 - HOIST
      ?auto_37556 - SURFACE
      ?auto_37554 - SURFACE
      ?auto_37565 - PLACE
      ?auto_37552 - HOIST
      ?auto_37557 - SURFACE
      ?auto_37560 - SURFACE
      ?auto_37547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37563 ?auto_37548 ) ( IS-CRATE ?auto_37545 ) ( not ( = ?auto_37545 ?auto_37546 ) ) ( not ( = ?auto_37550 ?auto_37548 ) ) ( HOIST-AT ?auto_37559 ?auto_37550 ) ( not ( = ?auto_37563 ?auto_37559 ) ) ( AVAILABLE ?auto_37559 ) ( SURFACE-AT ?auto_37545 ?auto_37550 ) ( ON ?auto_37545 ?auto_37561 ) ( CLEAR ?auto_37545 ) ( not ( = ?auto_37545 ?auto_37561 ) ) ( not ( = ?auto_37546 ?auto_37561 ) ) ( IS-CRATE ?auto_37546 ) ( not ( = ?auto_37545 ?auto_37555 ) ) ( not ( = ?auto_37546 ?auto_37555 ) ) ( not ( = ?auto_37561 ?auto_37555 ) ) ( not ( = ?auto_37562 ?auto_37548 ) ) ( not ( = ?auto_37550 ?auto_37562 ) ) ( HOIST-AT ?auto_37551 ?auto_37562 ) ( not ( = ?auto_37563 ?auto_37551 ) ) ( not ( = ?auto_37559 ?auto_37551 ) ) ( SURFACE-AT ?auto_37546 ?auto_37562 ) ( ON ?auto_37546 ?auto_37553 ) ( CLEAR ?auto_37546 ) ( not ( = ?auto_37545 ?auto_37553 ) ) ( not ( = ?auto_37546 ?auto_37553 ) ) ( not ( = ?auto_37561 ?auto_37553 ) ) ( not ( = ?auto_37555 ?auto_37553 ) ) ( IS-CRATE ?auto_37555 ) ( not ( = ?auto_37545 ?auto_37564 ) ) ( not ( = ?auto_37546 ?auto_37564 ) ) ( not ( = ?auto_37561 ?auto_37564 ) ) ( not ( = ?auto_37555 ?auto_37564 ) ) ( not ( = ?auto_37553 ?auto_37564 ) ) ( not ( = ?auto_37558 ?auto_37548 ) ) ( not ( = ?auto_37550 ?auto_37558 ) ) ( not ( = ?auto_37562 ?auto_37558 ) ) ( HOIST-AT ?auto_37549 ?auto_37558 ) ( not ( = ?auto_37563 ?auto_37549 ) ) ( not ( = ?auto_37559 ?auto_37549 ) ) ( not ( = ?auto_37551 ?auto_37549 ) ) ( AVAILABLE ?auto_37549 ) ( SURFACE-AT ?auto_37555 ?auto_37558 ) ( ON ?auto_37555 ?auto_37556 ) ( CLEAR ?auto_37555 ) ( not ( = ?auto_37545 ?auto_37556 ) ) ( not ( = ?auto_37546 ?auto_37556 ) ) ( not ( = ?auto_37561 ?auto_37556 ) ) ( not ( = ?auto_37555 ?auto_37556 ) ) ( not ( = ?auto_37553 ?auto_37556 ) ) ( not ( = ?auto_37564 ?auto_37556 ) ) ( IS-CRATE ?auto_37564 ) ( not ( = ?auto_37545 ?auto_37554 ) ) ( not ( = ?auto_37546 ?auto_37554 ) ) ( not ( = ?auto_37561 ?auto_37554 ) ) ( not ( = ?auto_37555 ?auto_37554 ) ) ( not ( = ?auto_37553 ?auto_37554 ) ) ( not ( = ?auto_37564 ?auto_37554 ) ) ( not ( = ?auto_37556 ?auto_37554 ) ) ( not ( = ?auto_37565 ?auto_37548 ) ) ( not ( = ?auto_37550 ?auto_37565 ) ) ( not ( = ?auto_37562 ?auto_37565 ) ) ( not ( = ?auto_37558 ?auto_37565 ) ) ( HOIST-AT ?auto_37552 ?auto_37565 ) ( not ( = ?auto_37563 ?auto_37552 ) ) ( not ( = ?auto_37559 ?auto_37552 ) ) ( not ( = ?auto_37551 ?auto_37552 ) ) ( not ( = ?auto_37549 ?auto_37552 ) ) ( AVAILABLE ?auto_37552 ) ( SURFACE-AT ?auto_37564 ?auto_37565 ) ( ON ?auto_37564 ?auto_37557 ) ( CLEAR ?auto_37564 ) ( not ( = ?auto_37545 ?auto_37557 ) ) ( not ( = ?auto_37546 ?auto_37557 ) ) ( not ( = ?auto_37561 ?auto_37557 ) ) ( not ( = ?auto_37555 ?auto_37557 ) ) ( not ( = ?auto_37553 ?auto_37557 ) ) ( not ( = ?auto_37564 ?auto_37557 ) ) ( not ( = ?auto_37556 ?auto_37557 ) ) ( not ( = ?auto_37554 ?auto_37557 ) ) ( SURFACE-AT ?auto_37560 ?auto_37548 ) ( CLEAR ?auto_37560 ) ( IS-CRATE ?auto_37554 ) ( not ( = ?auto_37545 ?auto_37560 ) ) ( not ( = ?auto_37546 ?auto_37560 ) ) ( not ( = ?auto_37561 ?auto_37560 ) ) ( not ( = ?auto_37555 ?auto_37560 ) ) ( not ( = ?auto_37553 ?auto_37560 ) ) ( not ( = ?auto_37564 ?auto_37560 ) ) ( not ( = ?auto_37556 ?auto_37560 ) ) ( not ( = ?auto_37554 ?auto_37560 ) ) ( not ( = ?auto_37557 ?auto_37560 ) ) ( AVAILABLE ?auto_37563 ) ( TRUCK-AT ?auto_37547 ?auto_37562 ) ( LIFTING ?auto_37551 ?auto_37554 ) )
    :subtasks
    ( ( !LOAD ?auto_37551 ?auto_37554 ?auto_37547 ?auto_37562 )
      ( MAKE-ON ?auto_37545 ?auto_37546 )
      ( MAKE-ON-VERIFY ?auto_37545 ?auto_37546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37566 - SURFACE
      ?auto_37567 - SURFACE
    )
    :vars
    (
      ?auto_37568 - HOIST
      ?auto_37580 - PLACE
      ?auto_37574 - PLACE
      ?auto_37573 - HOIST
      ?auto_37577 - SURFACE
      ?auto_37585 - SURFACE
      ?auto_37586 - PLACE
      ?auto_37576 - HOIST
      ?auto_37584 - SURFACE
      ?auto_37582 - SURFACE
      ?auto_37575 - PLACE
      ?auto_37572 - HOIST
      ?auto_37571 - SURFACE
      ?auto_37569 - SURFACE
      ?auto_37583 - PLACE
      ?auto_37581 - HOIST
      ?auto_37579 - SURFACE
      ?auto_37570 - SURFACE
      ?auto_37578 - TRUCK
      ?auto_37587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37568 ?auto_37580 ) ( IS-CRATE ?auto_37566 ) ( not ( = ?auto_37566 ?auto_37567 ) ) ( not ( = ?auto_37574 ?auto_37580 ) ) ( HOIST-AT ?auto_37573 ?auto_37574 ) ( not ( = ?auto_37568 ?auto_37573 ) ) ( AVAILABLE ?auto_37573 ) ( SURFACE-AT ?auto_37566 ?auto_37574 ) ( ON ?auto_37566 ?auto_37577 ) ( CLEAR ?auto_37566 ) ( not ( = ?auto_37566 ?auto_37577 ) ) ( not ( = ?auto_37567 ?auto_37577 ) ) ( IS-CRATE ?auto_37567 ) ( not ( = ?auto_37566 ?auto_37585 ) ) ( not ( = ?auto_37567 ?auto_37585 ) ) ( not ( = ?auto_37577 ?auto_37585 ) ) ( not ( = ?auto_37586 ?auto_37580 ) ) ( not ( = ?auto_37574 ?auto_37586 ) ) ( HOIST-AT ?auto_37576 ?auto_37586 ) ( not ( = ?auto_37568 ?auto_37576 ) ) ( not ( = ?auto_37573 ?auto_37576 ) ) ( SURFACE-AT ?auto_37567 ?auto_37586 ) ( ON ?auto_37567 ?auto_37584 ) ( CLEAR ?auto_37567 ) ( not ( = ?auto_37566 ?auto_37584 ) ) ( not ( = ?auto_37567 ?auto_37584 ) ) ( not ( = ?auto_37577 ?auto_37584 ) ) ( not ( = ?auto_37585 ?auto_37584 ) ) ( IS-CRATE ?auto_37585 ) ( not ( = ?auto_37566 ?auto_37582 ) ) ( not ( = ?auto_37567 ?auto_37582 ) ) ( not ( = ?auto_37577 ?auto_37582 ) ) ( not ( = ?auto_37585 ?auto_37582 ) ) ( not ( = ?auto_37584 ?auto_37582 ) ) ( not ( = ?auto_37575 ?auto_37580 ) ) ( not ( = ?auto_37574 ?auto_37575 ) ) ( not ( = ?auto_37586 ?auto_37575 ) ) ( HOIST-AT ?auto_37572 ?auto_37575 ) ( not ( = ?auto_37568 ?auto_37572 ) ) ( not ( = ?auto_37573 ?auto_37572 ) ) ( not ( = ?auto_37576 ?auto_37572 ) ) ( AVAILABLE ?auto_37572 ) ( SURFACE-AT ?auto_37585 ?auto_37575 ) ( ON ?auto_37585 ?auto_37571 ) ( CLEAR ?auto_37585 ) ( not ( = ?auto_37566 ?auto_37571 ) ) ( not ( = ?auto_37567 ?auto_37571 ) ) ( not ( = ?auto_37577 ?auto_37571 ) ) ( not ( = ?auto_37585 ?auto_37571 ) ) ( not ( = ?auto_37584 ?auto_37571 ) ) ( not ( = ?auto_37582 ?auto_37571 ) ) ( IS-CRATE ?auto_37582 ) ( not ( = ?auto_37566 ?auto_37569 ) ) ( not ( = ?auto_37567 ?auto_37569 ) ) ( not ( = ?auto_37577 ?auto_37569 ) ) ( not ( = ?auto_37585 ?auto_37569 ) ) ( not ( = ?auto_37584 ?auto_37569 ) ) ( not ( = ?auto_37582 ?auto_37569 ) ) ( not ( = ?auto_37571 ?auto_37569 ) ) ( not ( = ?auto_37583 ?auto_37580 ) ) ( not ( = ?auto_37574 ?auto_37583 ) ) ( not ( = ?auto_37586 ?auto_37583 ) ) ( not ( = ?auto_37575 ?auto_37583 ) ) ( HOIST-AT ?auto_37581 ?auto_37583 ) ( not ( = ?auto_37568 ?auto_37581 ) ) ( not ( = ?auto_37573 ?auto_37581 ) ) ( not ( = ?auto_37576 ?auto_37581 ) ) ( not ( = ?auto_37572 ?auto_37581 ) ) ( AVAILABLE ?auto_37581 ) ( SURFACE-AT ?auto_37582 ?auto_37583 ) ( ON ?auto_37582 ?auto_37579 ) ( CLEAR ?auto_37582 ) ( not ( = ?auto_37566 ?auto_37579 ) ) ( not ( = ?auto_37567 ?auto_37579 ) ) ( not ( = ?auto_37577 ?auto_37579 ) ) ( not ( = ?auto_37585 ?auto_37579 ) ) ( not ( = ?auto_37584 ?auto_37579 ) ) ( not ( = ?auto_37582 ?auto_37579 ) ) ( not ( = ?auto_37571 ?auto_37579 ) ) ( not ( = ?auto_37569 ?auto_37579 ) ) ( SURFACE-AT ?auto_37570 ?auto_37580 ) ( CLEAR ?auto_37570 ) ( IS-CRATE ?auto_37569 ) ( not ( = ?auto_37566 ?auto_37570 ) ) ( not ( = ?auto_37567 ?auto_37570 ) ) ( not ( = ?auto_37577 ?auto_37570 ) ) ( not ( = ?auto_37585 ?auto_37570 ) ) ( not ( = ?auto_37584 ?auto_37570 ) ) ( not ( = ?auto_37582 ?auto_37570 ) ) ( not ( = ?auto_37571 ?auto_37570 ) ) ( not ( = ?auto_37569 ?auto_37570 ) ) ( not ( = ?auto_37579 ?auto_37570 ) ) ( AVAILABLE ?auto_37568 ) ( TRUCK-AT ?auto_37578 ?auto_37586 ) ( AVAILABLE ?auto_37576 ) ( SURFACE-AT ?auto_37569 ?auto_37586 ) ( ON ?auto_37569 ?auto_37587 ) ( CLEAR ?auto_37569 ) ( not ( = ?auto_37566 ?auto_37587 ) ) ( not ( = ?auto_37567 ?auto_37587 ) ) ( not ( = ?auto_37577 ?auto_37587 ) ) ( not ( = ?auto_37585 ?auto_37587 ) ) ( not ( = ?auto_37584 ?auto_37587 ) ) ( not ( = ?auto_37582 ?auto_37587 ) ) ( not ( = ?auto_37571 ?auto_37587 ) ) ( not ( = ?auto_37569 ?auto_37587 ) ) ( not ( = ?auto_37579 ?auto_37587 ) ) ( not ( = ?auto_37570 ?auto_37587 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37576 ?auto_37569 ?auto_37587 ?auto_37586 )
      ( MAKE-ON ?auto_37566 ?auto_37567 )
      ( MAKE-ON-VERIFY ?auto_37566 ?auto_37567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37588 - SURFACE
      ?auto_37589 - SURFACE
    )
    :vars
    (
      ?auto_37590 - HOIST
      ?auto_37606 - PLACE
      ?auto_37597 - PLACE
      ?auto_37607 - HOIST
      ?auto_37605 - SURFACE
      ?auto_37604 - SURFACE
      ?auto_37603 - PLACE
      ?auto_37602 - HOIST
      ?auto_37594 - SURFACE
      ?auto_37596 - SURFACE
      ?auto_37593 - PLACE
      ?auto_37598 - HOIST
      ?auto_37592 - SURFACE
      ?auto_37600 - SURFACE
      ?auto_37609 - PLACE
      ?auto_37599 - HOIST
      ?auto_37601 - SURFACE
      ?auto_37595 - SURFACE
      ?auto_37591 - SURFACE
      ?auto_37608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37590 ?auto_37606 ) ( IS-CRATE ?auto_37588 ) ( not ( = ?auto_37588 ?auto_37589 ) ) ( not ( = ?auto_37597 ?auto_37606 ) ) ( HOIST-AT ?auto_37607 ?auto_37597 ) ( not ( = ?auto_37590 ?auto_37607 ) ) ( AVAILABLE ?auto_37607 ) ( SURFACE-AT ?auto_37588 ?auto_37597 ) ( ON ?auto_37588 ?auto_37605 ) ( CLEAR ?auto_37588 ) ( not ( = ?auto_37588 ?auto_37605 ) ) ( not ( = ?auto_37589 ?auto_37605 ) ) ( IS-CRATE ?auto_37589 ) ( not ( = ?auto_37588 ?auto_37604 ) ) ( not ( = ?auto_37589 ?auto_37604 ) ) ( not ( = ?auto_37605 ?auto_37604 ) ) ( not ( = ?auto_37603 ?auto_37606 ) ) ( not ( = ?auto_37597 ?auto_37603 ) ) ( HOIST-AT ?auto_37602 ?auto_37603 ) ( not ( = ?auto_37590 ?auto_37602 ) ) ( not ( = ?auto_37607 ?auto_37602 ) ) ( SURFACE-AT ?auto_37589 ?auto_37603 ) ( ON ?auto_37589 ?auto_37594 ) ( CLEAR ?auto_37589 ) ( not ( = ?auto_37588 ?auto_37594 ) ) ( not ( = ?auto_37589 ?auto_37594 ) ) ( not ( = ?auto_37605 ?auto_37594 ) ) ( not ( = ?auto_37604 ?auto_37594 ) ) ( IS-CRATE ?auto_37604 ) ( not ( = ?auto_37588 ?auto_37596 ) ) ( not ( = ?auto_37589 ?auto_37596 ) ) ( not ( = ?auto_37605 ?auto_37596 ) ) ( not ( = ?auto_37604 ?auto_37596 ) ) ( not ( = ?auto_37594 ?auto_37596 ) ) ( not ( = ?auto_37593 ?auto_37606 ) ) ( not ( = ?auto_37597 ?auto_37593 ) ) ( not ( = ?auto_37603 ?auto_37593 ) ) ( HOIST-AT ?auto_37598 ?auto_37593 ) ( not ( = ?auto_37590 ?auto_37598 ) ) ( not ( = ?auto_37607 ?auto_37598 ) ) ( not ( = ?auto_37602 ?auto_37598 ) ) ( AVAILABLE ?auto_37598 ) ( SURFACE-AT ?auto_37604 ?auto_37593 ) ( ON ?auto_37604 ?auto_37592 ) ( CLEAR ?auto_37604 ) ( not ( = ?auto_37588 ?auto_37592 ) ) ( not ( = ?auto_37589 ?auto_37592 ) ) ( not ( = ?auto_37605 ?auto_37592 ) ) ( not ( = ?auto_37604 ?auto_37592 ) ) ( not ( = ?auto_37594 ?auto_37592 ) ) ( not ( = ?auto_37596 ?auto_37592 ) ) ( IS-CRATE ?auto_37596 ) ( not ( = ?auto_37588 ?auto_37600 ) ) ( not ( = ?auto_37589 ?auto_37600 ) ) ( not ( = ?auto_37605 ?auto_37600 ) ) ( not ( = ?auto_37604 ?auto_37600 ) ) ( not ( = ?auto_37594 ?auto_37600 ) ) ( not ( = ?auto_37596 ?auto_37600 ) ) ( not ( = ?auto_37592 ?auto_37600 ) ) ( not ( = ?auto_37609 ?auto_37606 ) ) ( not ( = ?auto_37597 ?auto_37609 ) ) ( not ( = ?auto_37603 ?auto_37609 ) ) ( not ( = ?auto_37593 ?auto_37609 ) ) ( HOIST-AT ?auto_37599 ?auto_37609 ) ( not ( = ?auto_37590 ?auto_37599 ) ) ( not ( = ?auto_37607 ?auto_37599 ) ) ( not ( = ?auto_37602 ?auto_37599 ) ) ( not ( = ?auto_37598 ?auto_37599 ) ) ( AVAILABLE ?auto_37599 ) ( SURFACE-AT ?auto_37596 ?auto_37609 ) ( ON ?auto_37596 ?auto_37601 ) ( CLEAR ?auto_37596 ) ( not ( = ?auto_37588 ?auto_37601 ) ) ( not ( = ?auto_37589 ?auto_37601 ) ) ( not ( = ?auto_37605 ?auto_37601 ) ) ( not ( = ?auto_37604 ?auto_37601 ) ) ( not ( = ?auto_37594 ?auto_37601 ) ) ( not ( = ?auto_37596 ?auto_37601 ) ) ( not ( = ?auto_37592 ?auto_37601 ) ) ( not ( = ?auto_37600 ?auto_37601 ) ) ( SURFACE-AT ?auto_37595 ?auto_37606 ) ( CLEAR ?auto_37595 ) ( IS-CRATE ?auto_37600 ) ( not ( = ?auto_37588 ?auto_37595 ) ) ( not ( = ?auto_37589 ?auto_37595 ) ) ( not ( = ?auto_37605 ?auto_37595 ) ) ( not ( = ?auto_37604 ?auto_37595 ) ) ( not ( = ?auto_37594 ?auto_37595 ) ) ( not ( = ?auto_37596 ?auto_37595 ) ) ( not ( = ?auto_37592 ?auto_37595 ) ) ( not ( = ?auto_37600 ?auto_37595 ) ) ( not ( = ?auto_37601 ?auto_37595 ) ) ( AVAILABLE ?auto_37590 ) ( AVAILABLE ?auto_37602 ) ( SURFACE-AT ?auto_37600 ?auto_37603 ) ( ON ?auto_37600 ?auto_37591 ) ( CLEAR ?auto_37600 ) ( not ( = ?auto_37588 ?auto_37591 ) ) ( not ( = ?auto_37589 ?auto_37591 ) ) ( not ( = ?auto_37605 ?auto_37591 ) ) ( not ( = ?auto_37604 ?auto_37591 ) ) ( not ( = ?auto_37594 ?auto_37591 ) ) ( not ( = ?auto_37596 ?auto_37591 ) ) ( not ( = ?auto_37592 ?auto_37591 ) ) ( not ( = ?auto_37600 ?auto_37591 ) ) ( not ( = ?auto_37601 ?auto_37591 ) ) ( not ( = ?auto_37595 ?auto_37591 ) ) ( TRUCK-AT ?auto_37608 ?auto_37606 ) )
    :subtasks
    ( ( !DRIVE ?auto_37608 ?auto_37606 ?auto_37603 )
      ( MAKE-ON ?auto_37588 ?auto_37589 )
      ( MAKE-ON-VERIFY ?auto_37588 ?auto_37589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37610 - SURFACE
      ?auto_37611 - SURFACE
    )
    :vars
    (
      ?auto_37620 - HOIST
      ?auto_37616 - PLACE
      ?auto_37614 - PLACE
      ?auto_37631 - HOIST
      ?auto_37629 - SURFACE
      ?auto_37621 - SURFACE
      ?auto_37624 - PLACE
      ?auto_37612 - HOIST
      ?auto_37628 - SURFACE
      ?auto_37626 - SURFACE
      ?auto_37623 - PLACE
      ?auto_37618 - HOIST
      ?auto_37613 - SURFACE
      ?auto_37625 - SURFACE
      ?auto_37630 - PLACE
      ?auto_37617 - HOIST
      ?auto_37627 - SURFACE
      ?auto_37622 - SURFACE
      ?auto_37615 - SURFACE
      ?auto_37619 - TRUCK
      ?auto_37632 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37620 ?auto_37616 ) ( IS-CRATE ?auto_37610 ) ( not ( = ?auto_37610 ?auto_37611 ) ) ( not ( = ?auto_37614 ?auto_37616 ) ) ( HOIST-AT ?auto_37631 ?auto_37614 ) ( not ( = ?auto_37620 ?auto_37631 ) ) ( AVAILABLE ?auto_37631 ) ( SURFACE-AT ?auto_37610 ?auto_37614 ) ( ON ?auto_37610 ?auto_37629 ) ( CLEAR ?auto_37610 ) ( not ( = ?auto_37610 ?auto_37629 ) ) ( not ( = ?auto_37611 ?auto_37629 ) ) ( IS-CRATE ?auto_37611 ) ( not ( = ?auto_37610 ?auto_37621 ) ) ( not ( = ?auto_37611 ?auto_37621 ) ) ( not ( = ?auto_37629 ?auto_37621 ) ) ( not ( = ?auto_37624 ?auto_37616 ) ) ( not ( = ?auto_37614 ?auto_37624 ) ) ( HOIST-AT ?auto_37612 ?auto_37624 ) ( not ( = ?auto_37620 ?auto_37612 ) ) ( not ( = ?auto_37631 ?auto_37612 ) ) ( SURFACE-AT ?auto_37611 ?auto_37624 ) ( ON ?auto_37611 ?auto_37628 ) ( CLEAR ?auto_37611 ) ( not ( = ?auto_37610 ?auto_37628 ) ) ( not ( = ?auto_37611 ?auto_37628 ) ) ( not ( = ?auto_37629 ?auto_37628 ) ) ( not ( = ?auto_37621 ?auto_37628 ) ) ( IS-CRATE ?auto_37621 ) ( not ( = ?auto_37610 ?auto_37626 ) ) ( not ( = ?auto_37611 ?auto_37626 ) ) ( not ( = ?auto_37629 ?auto_37626 ) ) ( not ( = ?auto_37621 ?auto_37626 ) ) ( not ( = ?auto_37628 ?auto_37626 ) ) ( not ( = ?auto_37623 ?auto_37616 ) ) ( not ( = ?auto_37614 ?auto_37623 ) ) ( not ( = ?auto_37624 ?auto_37623 ) ) ( HOIST-AT ?auto_37618 ?auto_37623 ) ( not ( = ?auto_37620 ?auto_37618 ) ) ( not ( = ?auto_37631 ?auto_37618 ) ) ( not ( = ?auto_37612 ?auto_37618 ) ) ( AVAILABLE ?auto_37618 ) ( SURFACE-AT ?auto_37621 ?auto_37623 ) ( ON ?auto_37621 ?auto_37613 ) ( CLEAR ?auto_37621 ) ( not ( = ?auto_37610 ?auto_37613 ) ) ( not ( = ?auto_37611 ?auto_37613 ) ) ( not ( = ?auto_37629 ?auto_37613 ) ) ( not ( = ?auto_37621 ?auto_37613 ) ) ( not ( = ?auto_37628 ?auto_37613 ) ) ( not ( = ?auto_37626 ?auto_37613 ) ) ( IS-CRATE ?auto_37626 ) ( not ( = ?auto_37610 ?auto_37625 ) ) ( not ( = ?auto_37611 ?auto_37625 ) ) ( not ( = ?auto_37629 ?auto_37625 ) ) ( not ( = ?auto_37621 ?auto_37625 ) ) ( not ( = ?auto_37628 ?auto_37625 ) ) ( not ( = ?auto_37626 ?auto_37625 ) ) ( not ( = ?auto_37613 ?auto_37625 ) ) ( not ( = ?auto_37630 ?auto_37616 ) ) ( not ( = ?auto_37614 ?auto_37630 ) ) ( not ( = ?auto_37624 ?auto_37630 ) ) ( not ( = ?auto_37623 ?auto_37630 ) ) ( HOIST-AT ?auto_37617 ?auto_37630 ) ( not ( = ?auto_37620 ?auto_37617 ) ) ( not ( = ?auto_37631 ?auto_37617 ) ) ( not ( = ?auto_37612 ?auto_37617 ) ) ( not ( = ?auto_37618 ?auto_37617 ) ) ( AVAILABLE ?auto_37617 ) ( SURFACE-AT ?auto_37626 ?auto_37630 ) ( ON ?auto_37626 ?auto_37627 ) ( CLEAR ?auto_37626 ) ( not ( = ?auto_37610 ?auto_37627 ) ) ( not ( = ?auto_37611 ?auto_37627 ) ) ( not ( = ?auto_37629 ?auto_37627 ) ) ( not ( = ?auto_37621 ?auto_37627 ) ) ( not ( = ?auto_37628 ?auto_37627 ) ) ( not ( = ?auto_37626 ?auto_37627 ) ) ( not ( = ?auto_37613 ?auto_37627 ) ) ( not ( = ?auto_37625 ?auto_37627 ) ) ( IS-CRATE ?auto_37625 ) ( not ( = ?auto_37610 ?auto_37622 ) ) ( not ( = ?auto_37611 ?auto_37622 ) ) ( not ( = ?auto_37629 ?auto_37622 ) ) ( not ( = ?auto_37621 ?auto_37622 ) ) ( not ( = ?auto_37628 ?auto_37622 ) ) ( not ( = ?auto_37626 ?auto_37622 ) ) ( not ( = ?auto_37613 ?auto_37622 ) ) ( not ( = ?auto_37625 ?auto_37622 ) ) ( not ( = ?auto_37627 ?auto_37622 ) ) ( AVAILABLE ?auto_37612 ) ( SURFACE-AT ?auto_37625 ?auto_37624 ) ( ON ?auto_37625 ?auto_37615 ) ( CLEAR ?auto_37625 ) ( not ( = ?auto_37610 ?auto_37615 ) ) ( not ( = ?auto_37611 ?auto_37615 ) ) ( not ( = ?auto_37629 ?auto_37615 ) ) ( not ( = ?auto_37621 ?auto_37615 ) ) ( not ( = ?auto_37628 ?auto_37615 ) ) ( not ( = ?auto_37626 ?auto_37615 ) ) ( not ( = ?auto_37613 ?auto_37615 ) ) ( not ( = ?auto_37625 ?auto_37615 ) ) ( not ( = ?auto_37627 ?auto_37615 ) ) ( not ( = ?auto_37622 ?auto_37615 ) ) ( TRUCK-AT ?auto_37619 ?auto_37616 ) ( SURFACE-AT ?auto_37632 ?auto_37616 ) ( CLEAR ?auto_37632 ) ( LIFTING ?auto_37620 ?auto_37622 ) ( IS-CRATE ?auto_37622 ) ( not ( = ?auto_37610 ?auto_37632 ) ) ( not ( = ?auto_37611 ?auto_37632 ) ) ( not ( = ?auto_37629 ?auto_37632 ) ) ( not ( = ?auto_37621 ?auto_37632 ) ) ( not ( = ?auto_37628 ?auto_37632 ) ) ( not ( = ?auto_37626 ?auto_37632 ) ) ( not ( = ?auto_37613 ?auto_37632 ) ) ( not ( = ?auto_37625 ?auto_37632 ) ) ( not ( = ?auto_37627 ?auto_37632 ) ) ( not ( = ?auto_37622 ?auto_37632 ) ) ( not ( = ?auto_37615 ?auto_37632 ) ) )
    :subtasks
    ( ( !DROP ?auto_37620 ?auto_37622 ?auto_37632 ?auto_37616 )
      ( MAKE-ON ?auto_37610 ?auto_37611 )
      ( MAKE-ON-VERIFY ?auto_37610 ?auto_37611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37633 - SURFACE
      ?auto_37634 - SURFACE
    )
    :vars
    (
      ?auto_37636 - HOIST
      ?auto_37653 - PLACE
      ?auto_37635 - PLACE
      ?auto_37644 - HOIST
      ?auto_37655 - SURFACE
      ?auto_37646 - SURFACE
      ?auto_37642 - PLACE
      ?auto_37638 - HOIST
      ?auto_37643 - SURFACE
      ?auto_37649 - SURFACE
      ?auto_37639 - PLACE
      ?auto_37650 - HOIST
      ?auto_37640 - SURFACE
      ?auto_37652 - SURFACE
      ?auto_37654 - PLACE
      ?auto_37641 - HOIST
      ?auto_37648 - SURFACE
      ?auto_37645 - SURFACE
      ?auto_37637 - SURFACE
      ?auto_37647 - TRUCK
      ?auto_37651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37636 ?auto_37653 ) ( IS-CRATE ?auto_37633 ) ( not ( = ?auto_37633 ?auto_37634 ) ) ( not ( = ?auto_37635 ?auto_37653 ) ) ( HOIST-AT ?auto_37644 ?auto_37635 ) ( not ( = ?auto_37636 ?auto_37644 ) ) ( AVAILABLE ?auto_37644 ) ( SURFACE-AT ?auto_37633 ?auto_37635 ) ( ON ?auto_37633 ?auto_37655 ) ( CLEAR ?auto_37633 ) ( not ( = ?auto_37633 ?auto_37655 ) ) ( not ( = ?auto_37634 ?auto_37655 ) ) ( IS-CRATE ?auto_37634 ) ( not ( = ?auto_37633 ?auto_37646 ) ) ( not ( = ?auto_37634 ?auto_37646 ) ) ( not ( = ?auto_37655 ?auto_37646 ) ) ( not ( = ?auto_37642 ?auto_37653 ) ) ( not ( = ?auto_37635 ?auto_37642 ) ) ( HOIST-AT ?auto_37638 ?auto_37642 ) ( not ( = ?auto_37636 ?auto_37638 ) ) ( not ( = ?auto_37644 ?auto_37638 ) ) ( SURFACE-AT ?auto_37634 ?auto_37642 ) ( ON ?auto_37634 ?auto_37643 ) ( CLEAR ?auto_37634 ) ( not ( = ?auto_37633 ?auto_37643 ) ) ( not ( = ?auto_37634 ?auto_37643 ) ) ( not ( = ?auto_37655 ?auto_37643 ) ) ( not ( = ?auto_37646 ?auto_37643 ) ) ( IS-CRATE ?auto_37646 ) ( not ( = ?auto_37633 ?auto_37649 ) ) ( not ( = ?auto_37634 ?auto_37649 ) ) ( not ( = ?auto_37655 ?auto_37649 ) ) ( not ( = ?auto_37646 ?auto_37649 ) ) ( not ( = ?auto_37643 ?auto_37649 ) ) ( not ( = ?auto_37639 ?auto_37653 ) ) ( not ( = ?auto_37635 ?auto_37639 ) ) ( not ( = ?auto_37642 ?auto_37639 ) ) ( HOIST-AT ?auto_37650 ?auto_37639 ) ( not ( = ?auto_37636 ?auto_37650 ) ) ( not ( = ?auto_37644 ?auto_37650 ) ) ( not ( = ?auto_37638 ?auto_37650 ) ) ( AVAILABLE ?auto_37650 ) ( SURFACE-AT ?auto_37646 ?auto_37639 ) ( ON ?auto_37646 ?auto_37640 ) ( CLEAR ?auto_37646 ) ( not ( = ?auto_37633 ?auto_37640 ) ) ( not ( = ?auto_37634 ?auto_37640 ) ) ( not ( = ?auto_37655 ?auto_37640 ) ) ( not ( = ?auto_37646 ?auto_37640 ) ) ( not ( = ?auto_37643 ?auto_37640 ) ) ( not ( = ?auto_37649 ?auto_37640 ) ) ( IS-CRATE ?auto_37649 ) ( not ( = ?auto_37633 ?auto_37652 ) ) ( not ( = ?auto_37634 ?auto_37652 ) ) ( not ( = ?auto_37655 ?auto_37652 ) ) ( not ( = ?auto_37646 ?auto_37652 ) ) ( not ( = ?auto_37643 ?auto_37652 ) ) ( not ( = ?auto_37649 ?auto_37652 ) ) ( not ( = ?auto_37640 ?auto_37652 ) ) ( not ( = ?auto_37654 ?auto_37653 ) ) ( not ( = ?auto_37635 ?auto_37654 ) ) ( not ( = ?auto_37642 ?auto_37654 ) ) ( not ( = ?auto_37639 ?auto_37654 ) ) ( HOIST-AT ?auto_37641 ?auto_37654 ) ( not ( = ?auto_37636 ?auto_37641 ) ) ( not ( = ?auto_37644 ?auto_37641 ) ) ( not ( = ?auto_37638 ?auto_37641 ) ) ( not ( = ?auto_37650 ?auto_37641 ) ) ( AVAILABLE ?auto_37641 ) ( SURFACE-AT ?auto_37649 ?auto_37654 ) ( ON ?auto_37649 ?auto_37648 ) ( CLEAR ?auto_37649 ) ( not ( = ?auto_37633 ?auto_37648 ) ) ( not ( = ?auto_37634 ?auto_37648 ) ) ( not ( = ?auto_37655 ?auto_37648 ) ) ( not ( = ?auto_37646 ?auto_37648 ) ) ( not ( = ?auto_37643 ?auto_37648 ) ) ( not ( = ?auto_37649 ?auto_37648 ) ) ( not ( = ?auto_37640 ?auto_37648 ) ) ( not ( = ?auto_37652 ?auto_37648 ) ) ( IS-CRATE ?auto_37652 ) ( not ( = ?auto_37633 ?auto_37645 ) ) ( not ( = ?auto_37634 ?auto_37645 ) ) ( not ( = ?auto_37655 ?auto_37645 ) ) ( not ( = ?auto_37646 ?auto_37645 ) ) ( not ( = ?auto_37643 ?auto_37645 ) ) ( not ( = ?auto_37649 ?auto_37645 ) ) ( not ( = ?auto_37640 ?auto_37645 ) ) ( not ( = ?auto_37652 ?auto_37645 ) ) ( not ( = ?auto_37648 ?auto_37645 ) ) ( AVAILABLE ?auto_37638 ) ( SURFACE-AT ?auto_37652 ?auto_37642 ) ( ON ?auto_37652 ?auto_37637 ) ( CLEAR ?auto_37652 ) ( not ( = ?auto_37633 ?auto_37637 ) ) ( not ( = ?auto_37634 ?auto_37637 ) ) ( not ( = ?auto_37655 ?auto_37637 ) ) ( not ( = ?auto_37646 ?auto_37637 ) ) ( not ( = ?auto_37643 ?auto_37637 ) ) ( not ( = ?auto_37649 ?auto_37637 ) ) ( not ( = ?auto_37640 ?auto_37637 ) ) ( not ( = ?auto_37652 ?auto_37637 ) ) ( not ( = ?auto_37648 ?auto_37637 ) ) ( not ( = ?auto_37645 ?auto_37637 ) ) ( TRUCK-AT ?auto_37647 ?auto_37653 ) ( SURFACE-AT ?auto_37651 ?auto_37653 ) ( CLEAR ?auto_37651 ) ( IS-CRATE ?auto_37645 ) ( not ( = ?auto_37633 ?auto_37651 ) ) ( not ( = ?auto_37634 ?auto_37651 ) ) ( not ( = ?auto_37655 ?auto_37651 ) ) ( not ( = ?auto_37646 ?auto_37651 ) ) ( not ( = ?auto_37643 ?auto_37651 ) ) ( not ( = ?auto_37649 ?auto_37651 ) ) ( not ( = ?auto_37640 ?auto_37651 ) ) ( not ( = ?auto_37652 ?auto_37651 ) ) ( not ( = ?auto_37648 ?auto_37651 ) ) ( not ( = ?auto_37645 ?auto_37651 ) ) ( not ( = ?auto_37637 ?auto_37651 ) ) ( AVAILABLE ?auto_37636 ) ( IN ?auto_37645 ?auto_37647 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37636 ?auto_37645 ?auto_37647 ?auto_37653 )
      ( MAKE-ON ?auto_37633 ?auto_37634 )
      ( MAKE-ON-VERIFY ?auto_37633 ?auto_37634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37656 - SURFACE
      ?auto_37657 - SURFACE
    )
    :vars
    (
      ?auto_37668 - HOIST
      ?auto_37674 - PLACE
      ?auto_37678 - PLACE
      ?auto_37677 - HOIST
      ?auto_37659 - SURFACE
      ?auto_37669 - SURFACE
      ?auto_37670 - PLACE
      ?auto_37663 - HOIST
      ?auto_37660 - SURFACE
      ?auto_37664 - SURFACE
      ?auto_37661 - PLACE
      ?auto_37662 - HOIST
      ?auto_37676 - SURFACE
      ?auto_37667 - SURFACE
      ?auto_37672 - PLACE
      ?auto_37658 - HOIST
      ?auto_37671 - SURFACE
      ?auto_37675 - SURFACE
      ?auto_37673 - SURFACE
      ?auto_37666 - SURFACE
      ?auto_37665 - TRUCK
      ?auto_37679 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37668 ?auto_37674 ) ( IS-CRATE ?auto_37656 ) ( not ( = ?auto_37656 ?auto_37657 ) ) ( not ( = ?auto_37678 ?auto_37674 ) ) ( HOIST-AT ?auto_37677 ?auto_37678 ) ( not ( = ?auto_37668 ?auto_37677 ) ) ( AVAILABLE ?auto_37677 ) ( SURFACE-AT ?auto_37656 ?auto_37678 ) ( ON ?auto_37656 ?auto_37659 ) ( CLEAR ?auto_37656 ) ( not ( = ?auto_37656 ?auto_37659 ) ) ( not ( = ?auto_37657 ?auto_37659 ) ) ( IS-CRATE ?auto_37657 ) ( not ( = ?auto_37656 ?auto_37669 ) ) ( not ( = ?auto_37657 ?auto_37669 ) ) ( not ( = ?auto_37659 ?auto_37669 ) ) ( not ( = ?auto_37670 ?auto_37674 ) ) ( not ( = ?auto_37678 ?auto_37670 ) ) ( HOIST-AT ?auto_37663 ?auto_37670 ) ( not ( = ?auto_37668 ?auto_37663 ) ) ( not ( = ?auto_37677 ?auto_37663 ) ) ( SURFACE-AT ?auto_37657 ?auto_37670 ) ( ON ?auto_37657 ?auto_37660 ) ( CLEAR ?auto_37657 ) ( not ( = ?auto_37656 ?auto_37660 ) ) ( not ( = ?auto_37657 ?auto_37660 ) ) ( not ( = ?auto_37659 ?auto_37660 ) ) ( not ( = ?auto_37669 ?auto_37660 ) ) ( IS-CRATE ?auto_37669 ) ( not ( = ?auto_37656 ?auto_37664 ) ) ( not ( = ?auto_37657 ?auto_37664 ) ) ( not ( = ?auto_37659 ?auto_37664 ) ) ( not ( = ?auto_37669 ?auto_37664 ) ) ( not ( = ?auto_37660 ?auto_37664 ) ) ( not ( = ?auto_37661 ?auto_37674 ) ) ( not ( = ?auto_37678 ?auto_37661 ) ) ( not ( = ?auto_37670 ?auto_37661 ) ) ( HOIST-AT ?auto_37662 ?auto_37661 ) ( not ( = ?auto_37668 ?auto_37662 ) ) ( not ( = ?auto_37677 ?auto_37662 ) ) ( not ( = ?auto_37663 ?auto_37662 ) ) ( AVAILABLE ?auto_37662 ) ( SURFACE-AT ?auto_37669 ?auto_37661 ) ( ON ?auto_37669 ?auto_37676 ) ( CLEAR ?auto_37669 ) ( not ( = ?auto_37656 ?auto_37676 ) ) ( not ( = ?auto_37657 ?auto_37676 ) ) ( not ( = ?auto_37659 ?auto_37676 ) ) ( not ( = ?auto_37669 ?auto_37676 ) ) ( not ( = ?auto_37660 ?auto_37676 ) ) ( not ( = ?auto_37664 ?auto_37676 ) ) ( IS-CRATE ?auto_37664 ) ( not ( = ?auto_37656 ?auto_37667 ) ) ( not ( = ?auto_37657 ?auto_37667 ) ) ( not ( = ?auto_37659 ?auto_37667 ) ) ( not ( = ?auto_37669 ?auto_37667 ) ) ( not ( = ?auto_37660 ?auto_37667 ) ) ( not ( = ?auto_37664 ?auto_37667 ) ) ( not ( = ?auto_37676 ?auto_37667 ) ) ( not ( = ?auto_37672 ?auto_37674 ) ) ( not ( = ?auto_37678 ?auto_37672 ) ) ( not ( = ?auto_37670 ?auto_37672 ) ) ( not ( = ?auto_37661 ?auto_37672 ) ) ( HOIST-AT ?auto_37658 ?auto_37672 ) ( not ( = ?auto_37668 ?auto_37658 ) ) ( not ( = ?auto_37677 ?auto_37658 ) ) ( not ( = ?auto_37663 ?auto_37658 ) ) ( not ( = ?auto_37662 ?auto_37658 ) ) ( AVAILABLE ?auto_37658 ) ( SURFACE-AT ?auto_37664 ?auto_37672 ) ( ON ?auto_37664 ?auto_37671 ) ( CLEAR ?auto_37664 ) ( not ( = ?auto_37656 ?auto_37671 ) ) ( not ( = ?auto_37657 ?auto_37671 ) ) ( not ( = ?auto_37659 ?auto_37671 ) ) ( not ( = ?auto_37669 ?auto_37671 ) ) ( not ( = ?auto_37660 ?auto_37671 ) ) ( not ( = ?auto_37664 ?auto_37671 ) ) ( not ( = ?auto_37676 ?auto_37671 ) ) ( not ( = ?auto_37667 ?auto_37671 ) ) ( IS-CRATE ?auto_37667 ) ( not ( = ?auto_37656 ?auto_37675 ) ) ( not ( = ?auto_37657 ?auto_37675 ) ) ( not ( = ?auto_37659 ?auto_37675 ) ) ( not ( = ?auto_37669 ?auto_37675 ) ) ( not ( = ?auto_37660 ?auto_37675 ) ) ( not ( = ?auto_37664 ?auto_37675 ) ) ( not ( = ?auto_37676 ?auto_37675 ) ) ( not ( = ?auto_37667 ?auto_37675 ) ) ( not ( = ?auto_37671 ?auto_37675 ) ) ( AVAILABLE ?auto_37663 ) ( SURFACE-AT ?auto_37667 ?auto_37670 ) ( ON ?auto_37667 ?auto_37673 ) ( CLEAR ?auto_37667 ) ( not ( = ?auto_37656 ?auto_37673 ) ) ( not ( = ?auto_37657 ?auto_37673 ) ) ( not ( = ?auto_37659 ?auto_37673 ) ) ( not ( = ?auto_37669 ?auto_37673 ) ) ( not ( = ?auto_37660 ?auto_37673 ) ) ( not ( = ?auto_37664 ?auto_37673 ) ) ( not ( = ?auto_37676 ?auto_37673 ) ) ( not ( = ?auto_37667 ?auto_37673 ) ) ( not ( = ?auto_37671 ?auto_37673 ) ) ( not ( = ?auto_37675 ?auto_37673 ) ) ( SURFACE-AT ?auto_37666 ?auto_37674 ) ( CLEAR ?auto_37666 ) ( IS-CRATE ?auto_37675 ) ( not ( = ?auto_37656 ?auto_37666 ) ) ( not ( = ?auto_37657 ?auto_37666 ) ) ( not ( = ?auto_37659 ?auto_37666 ) ) ( not ( = ?auto_37669 ?auto_37666 ) ) ( not ( = ?auto_37660 ?auto_37666 ) ) ( not ( = ?auto_37664 ?auto_37666 ) ) ( not ( = ?auto_37676 ?auto_37666 ) ) ( not ( = ?auto_37667 ?auto_37666 ) ) ( not ( = ?auto_37671 ?auto_37666 ) ) ( not ( = ?auto_37675 ?auto_37666 ) ) ( not ( = ?auto_37673 ?auto_37666 ) ) ( AVAILABLE ?auto_37668 ) ( IN ?auto_37675 ?auto_37665 ) ( TRUCK-AT ?auto_37665 ?auto_37679 ) ( not ( = ?auto_37679 ?auto_37674 ) ) ( not ( = ?auto_37678 ?auto_37679 ) ) ( not ( = ?auto_37670 ?auto_37679 ) ) ( not ( = ?auto_37661 ?auto_37679 ) ) ( not ( = ?auto_37672 ?auto_37679 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37665 ?auto_37679 ?auto_37674 )
      ( MAKE-ON ?auto_37656 ?auto_37657 )
      ( MAKE-ON-VERIFY ?auto_37656 ?auto_37657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37680 - SURFACE
      ?auto_37681 - SURFACE
    )
    :vars
    (
      ?auto_37688 - HOIST
      ?auto_37699 - PLACE
      ?auto_37691 - PLACE
      ?auto_37690 - HOIST
      ?auto_37695 - SURFACE
      ?auto_37703 - SURFACE
      ?auto_37682 - PLACE
      ?auto_37700 - HOIST
      ?auto_37683 - SURFACE
      ?auto_37685 - SURFACE
      ?auto_37701 - PLACE
      ?auto_37687 - HOIST
      ?auto_37698 - SURFACE
      ?auto_37689 - SURFACE
      ?auto_37694 - PLACE
      ?auto_37693 - HOIST
      ?auto_37686 - SURFACE
      ?auto_37697 - SURFACE
      ?auto_37684 - SURFACE
      ?auto_37692 - SURFACE
      ?auto_37696 - TRUCK
      ?auto_37702 - PLACE
      ?auto_37704 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37688 ?auto_37699 ) ( IS-CRATE ?auto_37680 ) ( not ( = ?auto_37680 ?auto_37681 ) ) ( not ( = ?auto_37691 ?auto_37699 ) ) ( HOIST-AT ?auto_37690 ?auto_37691 ) ( not ( = ?auto_37688 ?auto_37690 ) ) ( AVAILABLE ?auto_37690 ) ( SURFACE-AT ?auto_37680 ?auto_37691 ) ( ON ?auto_37680 ?auto_37695 ) ( CLEAR ?auto_37680 ) ( not ( = ?auto_37680 ?auto_37695 ) ) ( not ( = ?auto_37681 ?auto_37695 ) ) ( IS-CRATE ?auto_37681 ) ( not ( = ?auto_37680 ?auto_37703 ) ) ( not ( = ?auto_37681 ?auto_37703 ) ) ( not ( = ?auto_37695 ?auto_37703 ) ) ( not ( = ?auto_37682 ?auto_37699 ) ) ( not ( = ?auto_37691 ?auto_37682 ) ) ( HOIST-AT ?auto_37700 ?auto_37682 ) ( not ( = ?auto_37688 ?auto_37700 ) ) ( not ( = ?auto_37690 ?auto_37700 ) ) ( SURFACE-AT ?auto_37681 ?auto_37682 ) ( ON ?auto_37681 ?auto_37683 ) ( CLEAR ?auto_37681 ) ( not ( = ?auto_37680 ?auto_37683 ) ) ( not ( = ?auto_37681 ?auto_37683 ) ) ( not ( = ?auto_37695 ?auto_37683 ) ) ( not ( = ?auto_37703 ?auto_37683 ) ) ( IS-CRATE ?auto_37703 ) ( not ( = ?auto_37680 ?auto_37685 ) ) ( not ( = ?auto_37681 ?auto_37685 ) ) ( not ( = ?auto_37695 ?auto_37685 ) ) ( not ( = ?auto_37703 ?auto_37685 ) ) ( not ( = ?auto_37683 ?auto_37685 ) ) ( not ( = ?auto_37701 ?auto_37699 ) ) ( not ( = ?auto_37691 ?auto_37701 ) ) ( not ( = ?auto_37682 ?auto_37701 ) ) ( HOIST-AT ?auto_37687 ?auto_37701 ) ( not ( = ?auto_37688 ?auto_37687 ) ) ( not ( = ?auto_37690 ?auto_37687 ) ) ( not ( = ?auto_37700 ?auto_37687 ) ) ( AVAILABLE ?auto_37687 ) ( SURFACE-AT ?auto_37703 ?auto_37701 ) ( ON ?auto_37703 ?auto_37698 ) ( CLEAR ?auto_37703 ) ( not ( = ?auto_37680 ?auto_37698 ) ) ( not ( = ?auto_37681 ?auto_37698 ) ) ( not ( = ?auto_37695 ?auto_37698 ) ) ( not ( = ?auto_37703 ?auto_37698 ) ) ( not ( = ?auto_37683 ?auto_37698 ) ) ( not ( = ?auto_37685 ?auto_37698 ) ) ( IS-CRATE ?auto_37685 ) ( not ( = ?auto_37680 ?auto_37689 ) ) ( not ( = ?auto_37681 ?auto_37689 ) ) ( not ( = ?auto_37695 ?auto_37689 ) ) ( not ( = ?auto_37703 ?auto_37689 ) ) ( not ( = ?auto_37683 ?auto_37689 ) ) ( not ( = ?auto_37685 ?auto_37689 ) ) ( not ( = ?auto_37698 ?auto_37689 ) ) ( not ( = ?auto_37694 ?auto_37699 ) ) ( not ( = ?auto_37691 ?auto_37694 ) ) ( not ( = ?auto_37682 ?auto_37694 ) ) ( not ( = ?auto_37701 ?auto_37694 ) ) ( HOIST-AT ?auto_37693 ?auto_37694 ) ( not ( = ?auto_37688 ?auto_37693 ) ) ( not ( = ?auto_37690 ?auto_37693 ) ) ( not ( = ?auto_37700 ?auto_37693 ) ) ( not ( = ?auto_37687 ?auto_37693 ) ) ( AVAILABLE ?auto_37693 ) ( SURFACE-AT ?auto_37685 ?auto_37694 ) ( ON ?auto_37685 ?auto_37686 ) ( CLEAR ?auto_37685 ) ( not ( = ?auto_37680 ?auto_37686 ) ) ( not ( = ?auto_37681 ?auto_37686 ) ) ( not ( = ?auto_37695 ?auto_37686 ) ) ( not ( = ?auto_37703 ?auto_37686 ) ) ( not ( = ?auto_37683 ?auto_37686 ) ) ( not ( = ?auto_37685 ?auto_37686 ) ) ( not ( = ?auto_37698 ?auto_37686 ) ) ( not ( = ?auto_37689 ?auto_37686 ) ) ( IS-CRATE ?auto_37689 ) ( not ( = ?auto_37680 ?auto_37697 ) ) ( not ( = ?auto_37681 ?auto_37697 ) ) ( not ( = ?auto_37695 ?auto_37697 ) ) ( not ( = ?auto_37703 ?auto_37697 ) ) ( not ( = ?auto_37683 ?auto_37697 ) ) ( not ( = ?auto_37685 ?auto_37697 ) ) ( not ( = ?auto_37698 ?auto_37697 ) ) ( not ( = ?auto_37689 ?auto_37697 ) ) ( not ( = ?auto_37686 ?auto_37697 ) ) ( AVAILABLE ?auto_37700 ) ( SURFACE-AT ?auto_37689 ?auto_37682 ) ( ON ?auto_37689 ?auto_37684 ) ( CLEAR ?auto_37689 ) ( not ( = ?auto_37680 ?auto_37684 ) ) ( not ( = ?auto_37681 ?auto_37684 ) ) ( not ( = ?auto_37695 ?auto_37684 ) ) ( not ( = ?auto_37703 ?auto_37684 ) ) ( not ( = ?auto_37683 ?auto_37684 ) ) ( not ( = ?auto_37685 ?auto_37684 ) ) ( not ( = ?auto_37698 ?auto_37684 ) ) ( not ( = ?auto_37689 ?auto_37684 ) ) ( not ( = ?auto_37686 ?auto_37684 ) ) ( not ( = ?auto_37697 ?auto_37684 ) ) ( SURFACE-AT ?auto_37692 ?auto_37699 ) ( CLEAR ?auto_37692 ) ( IS-CRATE ?auto_37697 ) ( not ( = ?auto_37680 ?auto_37692 ) ) ( not ( = ?auto_37681 ?auto_37692 ) ) ( not ( = ?auto_37695 ?auto_37692 ) ) ( not ( = ?auto_37703 ?auto_37692 ) ) ( not ( = ?auto_37683 ?auto_37692 ) ) ( not ( = ?auto_37685 ?auto_37692 ) ) ( not ( = ?auto_37698 ?auto_37692 ) ) ( not ( = ?auto_37689 ?auto_37692 ) ) ( not ( = ?auto_37686 ?auto_37692 ) ) ( not ( = ?auto_37697 ?auto_37692 ) ) ( not ( = ?auto_37684 ?auto_37692 ) ) ( AVAILABLE ?auto_37688 ) ( TRUCK-AT ?auto_37696 ?auto_37702 ) ( not ( = ?auto_37702 ?auto_37699 ) ) ( not ( = ?auto_37691 ?auto_37702 ) ) ( not ( = ?auto_37682 ?auto_37702 ) ) ( not ( = ?auto_37701 ?auto_37702 ) ) ( not ( = ?auto_37694 ?auto_37702 ) ) ( HOIST-AT ?auto_37704 ?auto_37702 ) ( LIFTING ?auto_37704 ?auto_37697 ) ( not ( = ?auto_37688 ?auto_37704 ) ) ( not ( = ?auto_37690 ?auto_37704 ) ) ( not ( = ?auto_37700 ?auto_37704 ) ) ( not ( = ?auto_37687 ?auto_37704 ) ) ( not ( = ?auto_37693 ?auto_37704 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37704 ?auto_37697 ?auto_37696 ?auto_37702 )
      ( MAKE-ON ?auto_37680 ?auto_37681 )
      ( MAKE-ON-VERIFY ?auto_37680 ?auto_37681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37705 - SURFACE
      ?auto_37706 - SURFACE
    )
    :vars
    (
      ?auto_37716 - HOIST
      ?auto_37728 - PLACE
      ?auto_37726 - PLACE
      ?auto_37717 - HOIST
      ?auto_37727 - SURFACE
      ?auto_37710 - SURFACE
      ?auto_37714 - PLACE
      ?auto_37721 - HOIST
      ?auto_37712 - SURFACE
      ?auto_37711 - SURFACE
      ?auto_37722 - PLACE
      ?auto_37718 - HOIST
      ?auto_37723 - SURFACE
      ?auto_37719 - SURFACE
      ?auto_37709 - PLACE
      ?auto_37708 - HOIST
      ?auto_37713 - SURFACE
      ?auto_37724 - SURFACE
      ?auto_37720 - SURFACE
      ?auto_37707 - SURFACE
      ?auto_37715 - TRUCK
      ?auto_37729 - PLACE
      ?auto_37725 - HOIST
      ?auto_37730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37716 ?auto_37728 ) ( IS-CRATE ?auto_37705 ) ( not ( = ?auto_37705 ?auto_37706 ) ) ( not ( = ?auto_37726 ?auto_37728 ) ) ( HOIST-AT ?auto_37717 ?auto_37726 ) ( not ( = ?auto_37716 ?auto_37717 ) ) ( AVAILABLE ?auto_37717 ) ( SURFACE-AT ?auto_37705 ?auto_37726 ) ( ON ?auto_37705 ?auto_37727 ) ( CLEAR ?auto_37705 ) ( not ( = ?auto_37705 ?auto_37727 ) ) ( not ( = ?auto_37706 ?auto_37727 ) ) ( IS-CRATE ?auto_37706 ) ( not ( = ?auto_37705 ?auto_37710 ) ) ( not ( = ?auto_37706 ?auto_37710 ) ) ( not ( = ?auto_37727 ?auto_37710 ) ) ( not ( = ?auto_37714 ?auto_37728 ) ) ( not ( = ?auto_37726 ?auto_37714 ) ) ( HOIST-AT ?auto_37721 ?auto_37714 ) ( not ( = ?auto_37716 ?auto_37721 ) ) ( not ( = ?auto_37717 ?auto_37721 ) ) ( SURFACE-AT ?auto_37706 ?auto_37714 ) ( ON ?auto_37706 ?auto_37712 ) ( CLEAR ?auto_37706 ) ( not ( = ?auto_37705 ?auto_37712 ) ) ( not ( = ?auto_37706 ?auto_37712 ) ) ( not ( = ?auto_37727 ?auto_37712 ) ) ( not ( = ?auto_37710 ?auto_37712 ) ) ( IS-CRATE ?auto_37710 ) ( not ( = ?auto_37705 ?auto_37711 ) ) ( not ( = ?auto_37706 ?auto_37711 ) ) ( not ( = ?auto_37727 ?auto_37711 ) ) ( not ( = ?auto_37710 ?auto_37711 ) ) ( not ( = ?auto_37712 ?auto_37711 ) ) ( not ( = ?auto_37722 ?auto_37728 ) ) ( not ( = ?auto_37726 ?auto_37722 ) ) ( not ( = ?auto_37714 ?auto_37722 ) ) ( HOIST-AT ?auto_37718 ?auto_37722 ) ( not ( = ?auto_37716 ?auto_37718 ) ) ( not ( = ?auto_37717 ?auto_37718 ) ) ( not ( = ?auto_37721 ?auto_37718 ) ) ( AVAILABLE ?auto_37718 ) ( SURFACE-AT ?auto_37710 ?auto_37722 ) ( ON ?auto_37710 ?auto_37723 ) ( CLEAR ?auto_37710 ) ( not ( = ?auto_37705 ?auto_37723 ) ) ( not ( = ?auto_37706 ?auto_37723 ) ) ( not ( = ?auto_37727 ?auto_37723 ) ) ( not ( = ?auto_37710 ?auto_37723 ) ) ( not ( = ?auto_37712 ?auto_37723 ) ) ( not ( = ?auto_37711 ?auto_37723 ) ) ( IS-CRATE ?auto_37711 ) ( not ( = ?auto_37705 ?auto_37719 ) ) ( not ( = ?auto_37706 ?auto_37719 ) ) ( not ( = ?auto_37727 ?auto_37719 ) ) ( not ( = ?auto_37710 ?auto_37719 ) ) ( not ( = ?auto_37712 ?auto_37719 ) ) ( not ( = ?auto_37711 ?auto_37719 ) ) ( not ( = ?auto_37723 ?auto_37719 ) ) ( not ( = ?auto_37709 ?auto_37728 ) ) ( not ( = ?auto_37726 ?auto_37709 ) ) ( not ( = ?auto_37714 ?auto_37709 ) ) ( not ( = ?auto_37722 ?auto_37709 ) ) ( HOIST-AT ?auto_37708 ?auto_37709 ) ( not ( = ?auto_37716 ?auto_37708 ) ) ( not ( = ?auto_37717 ?auto_37708 ) ) ( not ( = ?auto_37721 ?auto_37708 ) ) ( not ( = ?auto_37718 ?auto_37708 ) ) ( AVAILABLE ?auto_37708 ) ( SURFACE-AT ?auto_37711 ?auto_37709 ) ( ON ?auto_37711 ?auto_37713 ) ( CLEAR ?auto_37711 ) ( not ( = ?auto_37705 ?auto_37713 ) ) ( not ( = ?auto_37706 ?auto_37713 ) ) ( not ( = ?auto_37727 ?auto_37713 ) ) ( not ( = ?auto_37710 ?auto_37713 ) ) ( not ( = ?auto_37712 ?auto_37713 ) ) ( not ( = ?auto_37711 ?auto_37713 ) ) ( not ( = ?auto_37723 ?auto_37713 ) ) ( not ( = ?auto_37719 ?auto_37713 ) ) ( IS-CRATE ?auto_37719 ) ( not ( = ?auto_37705 ?auto_37724 ) ) ( not ( = ?auto_37706 ?auto_37724 ) ) ( not ( = ?auto_37727 ?auto_37724 ) ) ( not ( = ?auto_37710 ?auto_37724 ) ) ( not ( = ?auto_37712 ?auto_37724 ) ) ( not ( = ?auto_37711 ?auto_37724 ) ) ( not ( = ?auto_37723 ?auto_37724 ) ) ( not ( = ?auto_37719 ?auto_37724 ) ) ( not ( = ?auto_37713 ?auto_37724 ) ) ( AVAILABLE ?auto_37721 ) ( SURFACE-AT ?auto_37719 ?auto_37714 ) ( ON ?auto_37719 ?auto_37720 ) ( CLEAR ?auto_37719 ) ( not ( = ?auto_37705 ?auto_37720 ) ) ( not ( = ?auto_37706 ?auto_37720 ) ) ( not ( = ?auto_37727 ?auto_37720 ) ) ( not ( = ?auto_37710 ?auto_37720 ) ) ( not ( = ?auto_37712 ?auto_37720 ) ) ( not ( = ?auto_37711 ?auto_37720 ) ) ( not ( = ?auto_37723 ?auto_37720 ) ) ( not ( = ?auto_37719 ?auto_37720 ) ) ( not ( = ?auto_37713 ?auto_37720 ) ) ( not ( = ?auto_37724 ?auto_37720 ) ) ( SURFACE-AT ?auto_37707 ?auto_37728 ) ( CLEAR ?auto_37707 ) ( IS-CRATE ?auto_37724 ) ( not ( = ?auto_37705 ?auto_37707 ) ) ( not ( = ?auto_37706 ?auto_37707 ) ) ( not ( = ?auto_37727 ?auto_37707 ) ) ( not ( = ?auto_37710 ?auto_37707 ) ) ( not ( = ?auto_37712 ?auto_37707 ) ) ( not ( = ?auto_37711 ?auto_37707 ) ) ( not ( = ?auto_37723 ?auto_37707 ) ) ( not ( = ?auto_37719 ?auto_37707 ) ) ( not ( = ?auto_37713 ?auto_37707 ) ) ( not ( = ?auto_37724 ?auto_37707 ) ) ( not ( = ?auto_37720 ?auto_37707 ) ) ( AVAILABLE ?auto_37716 ) ( TRUCK-AT ?auto_37715 ?auto_37729 ) ( not ( = ?auto_37729 ?auto_37728 ) ) ( not ( = ?auto_37726 ?auto_37729 ) ) ( not ( = ?auto_37714 ?auto_37729 ) ) ( not ( = ?auto_37722 ?auto_37729 ) ) ( not ( = ?auto_37709 ?auto_37729 ) ) ( HOIST-AT ?auto_37725 ?auto_37729 ) ( not ( = ?auto_37716 ?auto_37725 ) ) ( not ( = ?auto_37717 ?auto_37725 ) ) ( not ( = ?auto_37721 ?auto_37725 ) ) ( not ( = ?auto_37718 ?auto_37725 ) ) ( not ( = ?auto_37708 ?auto_37725 ) ) ( AVAILABLE ?auto_37725 ) ( SURFACE-AT ?auto_37724 ?auto_37729 ) ( ON ?auto_37724 ?auto_37730 ) ( CLEAR ?auto_37724 ) ( not ( = ?auto_37705 ?auto_37730 ) ) ( not ( = ?auto_37706 ?auto_37730 ) ) ( not ( = ?auto_37727 ?auto_37730 ) ) ( not ( = ?auto_37710 ?auto_37730 ) ) ( not ( = ?auto_37712 ?auto_37730 ) ) ( not ( = ?auto_37711 ?auto_37730 ) ) ( not ( = ?auto_37723 ?auto_37730 ) ) ( not ( = ?auto_37719 ?auto_37730 ) ) ( not ( = ?auto_37713 ?auto_37730 ) ) ( not ( = ?auto_37724 ?auto_37730 ) ) ( not ( = ?auto_37720 ?auto_37730 ) ) ( not ( = ?auto_37707 ?auto_37730 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37725 ?auto_37724 ?auto_37730 ?auto_37729 )
      ( MAKE-ON ?auto_37705 ?auto_37706 )
      ( MAKE-ON-VERIFY ?auto_37705 ?auto_37706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37731 - SURFACE
      ?auto_37732 - SURFACE
    )
    :vars
    (
      ?auto_37751 - HOIST
      ?auto_37748 - PLACE
      ?auto_37745 - PLACE
      ?auto_37739 - HOIST
      ?auto_37749 - SURFACE
      ?auto_37743 - SURFACE
      ?auto_37734 - PLACE
      ?auto_37754 - HOIST
      ?auto_37747 - SURFACE
      ?auto_37742 - SURFACE
      ?auto_37753 - PLACE
      ?auto_37740 - HOIST
      ?auto_37735 - SURFACE
      ?auto_37750 - SURFACE
      ?auto_37741 - PLACE
      ?auto_37737 - HOIST
      ?auto_37755 - SURFACE
      ?auto_37736 - SURFACE
      ?auto_37733 - SURFACE
      ?auto_37744 - SURFACE
      ?auto_37752 - PLACE
      ?auto_37746 - HOIST
      ?auto_37756 - SURFACE
      ?auto_37738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37751 ?auto_37748 ) ( IS-CRATE ?auto_37731 ) ( not ( = ?auto_37731 ?auto_37732 ) ) ( not ( = ?auto_37745 ?auto_37748 ) ) ( HOIST-AT ?auto_37739 ?auto_37745 ) ( not ( = ?auto_37751 ?auto_37739 ) ) ( AVAILABLE ?auto_37739 ) ( SURFACE-AT ?auto_37731 ?auto_37745 ) ( ON ?auto_37731 ?auto_37749 ) ( CLEAR ?auto_37731 ) ( not ( = ?auto_37731 ?auto_37749 ) ) ( not ( = ?auto_37732 ?auto_37749 ) ) ( IS-CRATE ?auto_37732 ) ( not ( = ?auto_37731 ?auto_37743 ) ) ( not ( = ?auto_37732 ?auto_37743 ) ) ( not ( = ?auto_37749 ?auto_37743 ) ) ( not ( = ?auto_37734 ?auto_37748 ) ) ( not ( = ?auto_37745 ?auto_37734 ) ) ( HOIST-AT ?auto_37754 ?auto_37734 ) ( not ( = ?auto_37751 ?auto_37754 ) ) ( not ( = ?auto_37739 ?auto_37754 ) ) ( SURFACE-AT ?auto_37732 ?auto_37734 ) ( ON ?auto_37732 ?auto_37747 ) ( CLEAR ?auto_37732 ) ( not ( = ?auto_37731 ?auto_37747 ) ) ( not ( = ?auto_37732 ?auto_37747 ) ) ( not ( = ?auto_37749 ?auto_37747 ) ) ( not ( = ?auto_37743 ?auto_37747 ) ) ( IS-CRATE ?auto_37743 ) ( not ( = ?auto_37731 ?auto_37742 ) ) ( not ( = ?auto_37732 ?auto_37742 ) ) ( not ( = ?auto_37749 ?auto_37742 ) ) ( not ( = ?auto_37743 ?auto_37742 ) ) ( not ( = ?auto_37747 ?auto_37742 ) ) ( not ( = ?auto_37753 ?auto_37748 ) ) ( not ( = ?auto_37745 ?auto_37753 ) ) ( not ( = ?auto_37734 ?auto_37753 ) ) ( HOIST-AT ?auto_37740 ?auto_37753 ) ( not ( = ?auto_37751 ?auto_37740 ) ) ( not ( = ?auto_37739 ?auto_37740 ) ) ( not ( = ?auto_37754 ?auto_37740 ) ) ( AVAILABLE ?auto_37740 ) ( SURFACE-AT ?auto_37743 ?auto_37753 ) ( ON ?auto_37743 ?auto_37735 ) ( CLEAR ?auto_37743 ) ( not ( = ?auto_37731 ?auto_37735 ) ) ( not ( = ?auto_37732 ?auto_37735 ) ) ( not ( = ?auto_37749 ?auto_37735 ) ) ( not ( = ?auto_37743 ?auto_37735 ) ) ( not ( = ?auto_37747 ?auto_37735 ) ) ( not ( = ?auto_37742 ?auto_37735 ) ) ( IS-CRATE ?auto_37742 ) ( not ( = ?auto_37731 ?auto_37750 ) ) ( not ( = ?auto_37732 ?auto_37750 ) ) ( not ( = ?auto_37749 ?auto_37750 ) ) ( not ( = ?auto_37743 ?auto_37750 ) ) ( not ( = ?auto_37747 ?auto_37750 ) ) ( not ( = ?auto_37742 ?auto_37750 ) ) ( not ( = ?auto_37735 ?auto_37750 ) ) ( not ( = ?auto_37741 ?auto_37748 ) ) ( not ( = ?auto_37745 ?auto_37741 ) ) ( not ( = ?auto_37734 ?auto_37741 ) ) ( not ( = ?auto_37753 ?auto_37741 ) ) ( HOIST-AT ?auto_37737 ?auto_37741 ) ( not ( = ?auto_37751 ?auto_37737 ) ) ( not ( = ?auto_37739 ?auto_37737 ) ) ( not ( = ?auto_37754 ?auto_37737 ) ) ( not ( = ?auto_37740 ?auto_37737 ) ) ( AVAILABLE ?auto_37737 ) ( SURFACE-AT ?auto_37742 ?auto_37741 ) ( ON ?auto_37742 ?auto_37755 ) ( CLEAR ?auto_37742 ) ( not ( = ?auto_37731 ?auto_37755 ) ) ( not ( = ?auto_37732 ?auto_37755 ) ) ( not ( = ?auto_37749 ?auto_37755 ) ) ( not ( = ?auto_37743 ?auto_37755 ) ) ( not ( = ?auto_37747 ?auto_37755 ) ) ( not ( = ?auto_37742 ?auto_37755 ) ) ( not ( = ?auto_37735 ?auto_37755 ) ) ( not ( = ?auto_37750 ?auto_37755 ) ) ( IS-CRATE ?auto_37750 ) ( not ( = ?auto_37731 ?auto_37736 ) ) ( not ( = ?auto_37732 ?auto_37736 ) ) ( not ( = ?auto_37749 ?auto_37736 ) ) ( not ( = ?auto_37743 ?auto_37736 ) ) ( not ( = ?auto_37747 ?auto_37736 ) ) ( not ( = ?auto_37742 ?auto_37736 ) ) ( not ( = ?auto_37735 ?auto_37736 ) ) ( not ( = ?auto_37750 ?auto_37736 ) ) ( not ( = ?auto_37755 ?auto_37736 ) ) ( AVAILABLE ?auto_37754 ) ( SURFACE-AT ?auto_37750 ?auto_37734 ) ( ON ?auto_37750 ?auto_37733 ) ( CLEAR ?auto_37750 ) ( not ( = ?auto_37731 ?auto_37733 ) ) ( not ( = ?auto_37732 ?auto_37733 ) ) ( not ( = ?auto_37749 ?auto_37733 ) ) ( not ( = ?auto_37743 ?auto_37733 ) ) ( not ( = ?auto_37747 ?auto_37733 ) ) ( not ( = ?auto_37742 ?auto_37733 ) ) ( not ( = ?auto_37735 ?auto_37733 ) ) ( not ( = ?auto_37750 ?auto_37733 ) ) ( not ( = ?auto_37755 ?auto_37733 ) ) ( not ( = ?auto_37736 ?auto_37733 ) ) ( SURFACE-AT ?auto_37744 ?auto_37748 ) ( CLEAR ?auto_37744 ) ( IS-CRATE ?auto_37736 ) ( not ( = ?auto_37731 ?auto_37744 ) ) ( not ( = ?auto_37732 ?auto_37744 ) ) ( not ( = ?auto_37749 ?auto_37744 ) ) ( not ( = ?auto_37743 ?auto_37744 ) ) ( not ( = ?auto_37747 ?auto_37744 ) ) ( not ( = ?auto_37742 ?auto_37744 ) ) ( not ( = ?auto_37735 ?auto_37744 ) ) ( not ( = ?auto_37750 ?auto_37744 ) ) ( not ( = ?auto_37755 ?auto_37744 ) ) ( not ( = ?auto_37736 ?auto_37744 ) ) ( not ( = ?auto_37733 ?auto_37744 ) ) ( AVAILABLE ?auto_37751 ) ( not ( = ?auto_37752 ?auto_37748 ) ) ( not ( = ?auto_37745 ?auto_37752 ) ) ( not ( = ?auto_37734 ?auto_37752 ) ) ( not ( = ?auto_37753 ?auto_37752 ) ) ( not ( = ?auto_37741 ?auto_37752 ) ) ( HOIST-AT ?auto_37746 ?auto_37752 ) ( not ( = ?auto_37751 ?auto_37746 ) ) ( not ( = ?auto_37739 ?auto_37746 ) ) ( not ( = ?auto_37754 ?auto_37746 ) ) ( not ( = ?auto_37740 ?auto_37746 ) ) ( not ( = ?auto_37737 ?auto_37746 ) ) ( AVAILABLE ?auto_37746 ) ( SURFACE-AT ?auto_37736 ?auto_37752 ) ( ON ?auto_37736 ?auto_37756 ) ( CLEAR ?auto_37736 ) ( not ( = ?auto_37731 ?auto_37756 ) ) ( not ( = ?auto_37732 ?auto_37756 ) ) ( not ( = ?auto_37749 ?auto_37756 ) ) ( not ( = ?auto_37743 ?auto_37756 ) ) ( not ( = ?auto_37747 ?auto_37756 ) ) ( not ( = ?auto_37742 ?auto_37756 ) ) ( not ( = ?auto_37735 ?auto_37756 ) ) ( not ( = ?auto_37750 ?auto_37756 ) ) ( not ( = ?auto_37755 ?auto_37756 ) ) ( not ( = ?auto_37736 ?auto_37756 ) ) ( not ( = ?auto_37733 ?auto_37756 ) ) ( not ( = ?auto_37744 ?auto_37756 ) ) ( TRUCK-AT ?auto_37738 ?auto_37748 ) )
    :subtasks
    ( ( !DRIVE ?auto_37738 ?auto_37748 ?auto_37752 )
      ( MAKE-ON ?auto_37731 ?auto_37732 )
      ( MAKE-ON-VERIFY ?auto_37731 ?auto_37732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37759 - SURFACE
      ?auto_37760 - SURFACE
    )
    :vars
    (
      ?auto_37761 - HOIST
      ?auto_37762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37761 ?auto_37762 ) ( SURFACE-AT ?auto_37760 ?auto_37762 ) ( CLEAR ?auto_37760 ) ( LIFTING ?auto_37761 ?auto_37759 ) ( IS-CRATE ?auto_37759 ) ( not ( = ?auto_37759 ?auto_37760 ) ) )
    :subtasks
    ( ( !DROP ?auto_37761 ?auto_37759 ?auto_37760 ?auto_37762 )
      ( MAKE-ON-VERIFY ?auto_37759 ?auto_37760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37763 - SURFACE
      ?auto_37764 - SURFACE
    )
    :vars
    (
      ?auto_37765 - HOIST
      ?auto_37766 - PLACE
      ?auto_37767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37765 ?auto_37766 ) ( SURFACE-AT ?auto_37764 ?auto_37766 ) ( CLEAR ?auto_37764 ) ( IS-CRATE ?auto_37763 ) ( not ( = ?auto_37763 ?auto_37764 ) ) ( TRUCK-AT ?auto_37767 ?auto_37766 ) ( AVAILABLE ?auto_37765 ) ( IN ?auto_37763 ?auto_37767 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37765 ?auto_37763 ?auto_37767 ?auto_37766 )
      ( MAKE-ON ?auto_37763 ?auto_37764 )
      ( MAKE-ON-VERIFY ?auto_37763 ?auto_37764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37768 - SURFACE
      ?auto_37769 - SURFACE
    )
    :vars
    (
      ?auto_37770 - HOIST
      ?auto_37772 - PLACE
      ?auto_37771 - TRUCK
      ?auto_37773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37770 ?auto_37772 ) ( SURFACE-AT ?auto_37769 ?auto_37772 ) ( CLEAR ?auto_37769 ) ( IS-CRATE ?auto_37768 ) ( not ( = ?auto_37768 ?auto_37769 ) ) ( AVAILABLE ?auto_37770 ) ( IN ?auto_37768 ?auto_37771 ) ( TRUCK-AT ?auto_37771 ?auto_37773 ) ( not ( = ?auto_37773 ?auto_37772 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37771 ?auto_37773 ?auto_37772 )
      ( MAKE-ON ?auto_37768 ?auto_37769 )
      ( MAKE-ON-VERIFY ?auto_37768 ?auto_37769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37774 - SURFACE
      ?auto_37775 - SURFACE
    )
    :vars
    (
      ?auto_37776 - HOIST
      ?auto_37777 - PLACE
      ?auto_37778 - TRUCK
      ?auto_37779 - PLACE
      ?auto_37780 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37776 ?auto_37777 ) ( SURFACE-AT ?auto_37775 ?auto_37777 ) ( CLEAR ?auto_37775 ) ( IS-CRATE ?auto_37774 ) ( not ( = ?auto_37774 ?auto_37775 ) ) ( AVAILABLE ?auto_37776 ) ( TRUCK-AT ?auto_37778 ?auto_37779 ) ( not ( = ?auto_37779 ?auto_37777 ) ) ( HOIST-AT ?auto_37780 ?auto_37779 ) ( LIFTING ?auto_37780 ?auto_37774 ) ( not ( = ?auto_37776 ?auto_37780 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37780 ?auto_37774 ?auto_37778 ?auto_37779 )
      ( MAKE-ON ?auto_37774 ?auto_37775 )
      ( MAKE-ON-VERIFY ?auto_37774 ?auto_37775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37781 - SURFACE
      ?auto_37782 - SURFACE
    )
    :vars
    (
      ?auto_37784 - HOIST
      ?auto_37785 - PLACE
      ?auto_37783 - TRUCK
      ?auto_37787 - PLACE
      ?auto_37786 - HOIST
      ?auto_37788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37784 ?auto_37785 ) ( SURFACE-AT ?auto_37782 ?auto_37785 ) ( CLEAR ?auto_37782 ) ( IS-CRATE ?auto_37781 ) ( not ( = ?auto_37781 ?auto_37782 ) ) ( AVAILABLE ?auto_37784 ) ( TRUCK-AT ?auto_37783 ?auto_37787 ) ( not ( = ?auto_37787 ?auto_37785 ) ) ( HOIST-AT ?auto_37786 ?auto_37787 ) ( not ( = ?auto_37784 ?auto_37786 ) ) ( AVAILABLE ?auto_37786 ) ( SURFACE-AT ?auto_37781 ?auto_37787 ) ( ON ?auto_37781 ?auto_37788 ) ( CLEAR ?auto_37781 ) ( not ( = ?auto_37781 ?auto_37788 ) ) ( not ( = ?auto_37782 ?auto_37788 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37786 ?auto_37781 ?auto_37788 ?auto_37787 )
      ( MAKE-ON ?auto_37781 ?auto_37782 )
      ( MAKE-ON-VERIFY ?auto_37781 ?auto_37782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37789 - SURFACE
      ?auto_37790 - SURFACE
    )
    :vars
    (
      ?auto_37796 - HOIST
      ?auto_37794 - PLACE
      ?auto_37795 - PLACE
      ?auto_37793 - HOIST
      ?auto_37791 - SURFACE
      ?auto_37792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37796 ?auto_37794 ) ( SURFACE-AT ?auto_37790 ?auto_37794 ) ( CLEAR ?auto_37790 ) ( IS-CRATE ?auto_37789 ) ( not ( = ?auto_37789 ?auto_37790 ) ) ( AVAILABLE ?auto_37796 ) ( not ( = ?auto_37795 ?auto_37794 ) ) ( HOIST-AT ?auto_37793 ?auto_37795 ) ( not ( = ?auto_37796 ?auto_37793 ) ) ( AVAILABLE ?auto_37793 ) ( SURFACE-AT ?auto_37789 ?auto_37795 ) ( ON ?auto_37789 ?auto_37791 ) ( CLEAR ?auto_37789 ) ( not ( = ?auto_37789 ?auto_37791 ) ) ( not ( = ?auto_37790 ?auto_37791 ) ) ( TRUCK-AT ?auto_37792 ?auto_37794 ) )
    :subtasks
    ( ( !DRIVE ?auto_37792 ?auto_37794 ?auto_37795 )
      ( MAKE-ON ?auto_37789 ?auto_37790 )
      ( MAKE-ON-VERIFY ?auto_37789 ?auto_37790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37797 - SURFACE
      ?auto_37798 - SURFACE
    )
    :vars
    (
      ?auto_37801 - HOIST
      ?auto_37799 - PLACE
      ?auto_37802 - PLACE
      ?auto_37803 - HOIST
      ?auto_37804 - SURFACE
      ?auto_37800 - TRUCK
      ?auto_37805 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37801 ?auto_37799 ) ( IS-CRATE ?auto_37797 ) ( not ( = ?auto_37797 ?auto_37798 ) ) ( not ( = ?auto_37802 ?auto_37799 ) ) ( HOIST-AT ?auto_37803 ?auto_37802 ) ( not ( = ?auto_37801 ?auto_37803 ) ) ( AVAILABLE ?auto_37803 ) ( SURFACE-AT ?auto_37797 ?auto_37802 ) ( ON ?auto_37797 ?auto_37804 ) ( CLEAR ?auto_37797 ) ( not ( = ?auto_37797 ?auto_37804 ) ) ( not ( = ?auto_37798 ?auto_37804 ) ) ( TRUCK-AT ?auto_37800 ?auto_37799 ) ( SURFACE-AT ?auto_37805 ?auto_37799 ) ( CLEAR ?auto_37805 ) ( LIFTING ?auto_37801 ?auto_37798 ) ( IS-CRATE ?auto_37798 ) ( not ( = ?auto_37797 ?auto_37805 ) ) ( not ( = ?auto_37798 ?auto_37805 ) ) ( not ( = ?auto_37804 ?auto_37805 ) ) )
    :subtasks
    ( ( !DROP ?auto_37801 ?auto_37798 ?auto_37805 ?auto_37799 )
      ( MAKE-ON ?auto_37797 ?auto_37798 )
      ( MAKE-ON-VERIFY ?auto_37797 ?auto_37798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37806 - SURFACE
      ?auto_37807 - SURFACE
    )
    :vars
    (
      ?auto_37814 - HOIST
      ?auto_37810 - PLACE
      ?auto_37811 - PLACE
      ?auto_37809 - HOIST
      ?auto_37812 - SURFACE
      ?auto_37813 - TRUCK
      ?auto_37808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37814 ?auto_37810 ) ( IS-CRATE ?auto_37806 ) ( not ( = ?auto_37806 ?auto_37807 ) ) ( not ( = ?auto_37811 ?auto_37810 ) ) ( HOIST-AT ?auto_37809 ?auto_37811 ) ( not ( = ?auto_37814 ?auto_37809 ) ) ( AVAILABLE ?auto_37809 ) ( SURFACE-AT ?auto_37806 ?auto_37811 ) ( ON ?auto_37806 ?auto_37812 ) ( CLEAR ?auto_37806 ) ( not ( = ?auto_37806 ?auto_37812 ) ) ( not ( = ?auto_37807 ?auto_37812 ) ) ( TRUCK-AT ?auto_37813 ?auto_37810 ) ( SURFACE-AT ?auto_37808 ?auto_37810 ) ( CLEAR ?auto_37808 ) ( IS-CRATE ?auto_37807 ) ( not ( = ?auto_37806 ?auto_37808 ) ) ( not ( = ?auto_37807 ?auto_37808 ) ) ( not ( = ?auto_37812 ?auto_37808 ) ) ( AVAILABLE ?auto_37814 ) ( IN ?auto_37807 ?auto_37813 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37814 ?auto_37807 ?auto_37813 ?auto_37810 )
      ( MAKE-ON ?auto_37806 ?auto_37807 )
      ( MAKE-ON-VERIFY ?auto_37806 ?auto_37807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37815 - SURFACE
      ?auto_37816 - SURFACE
    )
    :vars
    (
      ?auto_37817 - HOIST
      ?auto_37821 - PLACE
      ?auto_37823 - PLACE
      ?auto_37819 - HOIST
      ?auto_37822 - SURFACE
      ?auto_37818 - SURFACE
      ?auto_37820 - TRUCK
      ?auto_37824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37817 ?auto_37821 ) ( IS-CRATE ?auto_37815 ) ( not ( = ?auto_37815 ?auto_37816 ) ) ( not ( = ?auto_37823 ?auto_37821 ) ) ( HOIST-AT ?auto_37819 ?auto_37823 ) ( not ( = ?auto_37817 ?auto_37819 ) ) ( AVAILABLE ?auto_37819 ) ( SURFACE-AT ?auto_37815 ?auto_37823 ) ( ON ?auto_37815 ?auto_37822 ) ( CLEAR ?auto_37815 ) ( not ( = ?auto_37815 ?auto_37822 ) ) ( not ( = ?auto_37816 ?auto_37822 ) ) ( SURFACE-AT ?auto_37818 ?auto_37821 ) ( CLEAR ?auto_37818 ) ( IS-CRATE ?auto_37816 ) ( not ( = ?auto_37815 ?auto_37818 ) ) ( not ( = ?auto_37816 ?auto_37818 ) ) ( not ( = ?auto_37822 ?auto_37818 ) ) ( AVAILABLE ?auto_37817 ) ( IN ?auto_37816 ?auto_37820 ) ( TRUCK-AT ?auto_37820 ?auto_37824 ) ( not ( = ?auto_37824 ?auto_37821 ) ) ( not ( = ?auto_37823 ?auto_37824 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37820 ?auto_37824 ?auto_37821 )
      ( MAKE-ON ?auto_37815 ?auto_37816 )
      ( MAKE-ON-VERIFY ?auto_37815 ?auto_37816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37825 - SURFACE
      ?auto_37826 - SURFACE
    )
    :vars
    (
      ?auto_37827 - HOIST
      ?auto_37830 - PLACE
      ?auto_37831 - PLACE
      ?auto_37833 - HOIST
      ?auto_37828 - SURFACE
      ?auto_37829 - SURFACE
      ?auto_37834 - TRUCK
      ?auto_37832 - PLACE
      ?auto_37835 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37827 ?auto_37830 ) ( IS-CRATE ?auto_37825 ) ( not ( = ?auto_37825 ?auto_37826 ) ) ( not ( = ?auto_37831 ?auto_37830 ) ) ( HOIST-AT ?auto_37833 ?auto_37831 ) ( not ( = ?auto_37827 ?auto_37833 ) ) ( AVAILABLE ?auto_37833 ) ( SURFACE-AT ?auto_37825 ?auto_37831 ) ( ON ?auto_37825 ?auto_37828 ) ( CLEAR ?auto_37825 ) ( not ( = ?auto_37825 ?auto_37828 ) ) ( not ( = ?auto_37826 ?auto_37828 ) ) ( SURFACE-AT ?auto_37829 ?auto_37830 ) ( CLEAR ?auto_37829 ) ( IS-CRATE ?auto_37826 ) ( not ( = ?auto_37825 ?auto_37829 ) ) ( not ( = ?auto_37826 ?auto_37829 ) ) ( not ( = ?auto_37828 ?auto_37829 ) ) ( AVAILABLE ?auto_37827 ) ( TRUCK-AT ?auto_37834 ?auto_37832 ) ( not ( = ?auto_37832 ?auto_37830 ) ) ( not ( = ?auto_37831 ?auto_37832 ) ) ( HOIST-AT ?auto_37835 ?auto_37832 ) ( LIFTING ?auto_37835 ?auto_37826 ) ( not ( = ?auto_37827 ?auto_37835 ) ) ( not ( = ?auto_37833 ?auto_37835 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37835 ?auto_37826 ?auto_37834 ?auto_37832 )
      ( MAKE-ON ?auto_37825 ?auto_37826 )
      ( MAKE-ON-VERIFY ?auto_37825 ?auto_37826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37836 - SURFACE
      ?auto_37837 - SURFACE
    )
    :vars
    (
      ?auto_37846 - HOIST
      ?auto_37840 - PLACE
      ?auto_37838 - PLACE
      ?auto_37841 - HOIST
      ?auto_37839 - SURFACE
      ?auto_37844 - SURFACE
      ?auto_37842 - TRUCK
      ?auto_37843 - PLACE
      ?auto_37845 - HOIST
      ?auto_37847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37846 ?auto_37840 ) ( IS-CRATE ?auto_37836 ) ( not ( = ?auto_37836 ?auto_37837 ) ) ( not ( = ?auto_37838 ?auto_37840 ) ) ( HOIST-AT ?auto_37841 ?auto_37838 ) ( not ( = ?auto_37846 ?auto_37841 ) ) ( AVAILABLE ?auto_37841 ) ( SURFACE-AT ?auto_37836 ?auto_37838 ) ( ON ?auto_37836 ?auto_37839 ) ( CLEAR ?auto_37836 ) ( not ( = ?auto_37836 ?auto_37839 ) ) ( not ( = ?auto_37837 ?auto_37839 ) ) ( SURFACE-AT ?auto_37844 ?auto_37840 ) ( CLEAR ?auto_37844 ) ( IS-CRATE ?auto_37837 ) ( not ( = ?auto_37836 ?auto_37844 ) ) ( not ( = ?auto_37837 ?auto_37844 ) ) ( not ( = ?auto_37839 ?auto_37844 ) ) ( AVAILABLE ?auto_37846 ) ( TRUCK-AT ?auto_37842 ?auto_37843 ) ( not ( = ?auto_37843 ?auto_37840 ) ) ( not ( = ?auto_37838 ?auto_37843 ) ) ( HOIST-AT ?auto_37845 ?auto_37843 ) ( not ( = ?auto_37846 ?auto_37845 ) ) ( not ( = ?auto_37841 ?auto_37845 ) ) ( AVAILABLE ?auto_37845 ) ( SURFACE-AT ?auto_37837 ?auto_37843 ) ( ON ?auto_37837 ?auto_37847 ) ( CLEAR ?auto_37837 ) ( not ( = ?auto_37836 ?auto_37847 ) ) ( not ( = ?auto_37837 ?auto_37847 ) ) ( not ( = ?auto_37839 ?auto_37847 ) ) ( not ( = ?auto_37844 ?auto_37847 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37845 ?auto_37837 ?auto_37847 ?auto_37843 )
      ( MAKE-ON ?auto_37836 ?auto_37837 )
      ( MAKE-ON-VERIFY ?auto_37836 ?auto_37837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37848 - SURFACE
      ?auto_37849 - SURFACE
    )
    :vars
    (
      ?auto_37855 - HOIST
      ?auto_37857 - PLACE
      ?auto_37853 - PLACE
      ?auto_37851 - HOIST
      ?auto_37858 - SURFACE
      ?auto_37856 - SURFACE
      ?auto_37852 - PLACE
      ?auto_37859 - HOIST
      ?auto_37850 - SURFACE
      ?auto_37854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37855 ?auto_37857 ) ( IS-CRATE ?auto_37848 ) ( not ( = ?auto_37848 ?auto_37849 ) ) ( not ( = ?auto_37853 ?auto_37857 ) ) ( HOIST-AT ?auto_37851 ?auto_37853 ) ( not ( = ?auto_37855 ?auto_37851 ) ) ( AVAILABLE ?auto_37851 ) ( SURFACE-AT ?auto_37848 ?auto_37853 ) ( ON ?auto_37848 ?auto_37858 ) ( CLEAR ?auto_37848 ) ( not ( = ?auto_37848 ?auto_37858 ) ) ( not ( = ?auto_37849 ?auto_37858 ) ) ( SURFACE-AT ?auto_37856 ?auto_37857 ) ( CLEAR ?auto_37856 ) ( IS-CRATE ?auto_37849 ) ( not ( = ?auto_37848 ?auto_37856 ) ) ( not ( = ?auto_37849 ?auto_37856 ) ) ( not ( = ?auto_37858 ?auto_37856 ) ) ( AVAILABLE ?auto_37855 ) ( not ( = ?auto_37852 ?auto_37857 ) ) ( not ( = ?auto_37853 ?auto_37852 ) ) ( HOIST-AT ?auto_37859 ?auto_37852 ) ( not ( = ?auto_37855 ?auto_37859 ) ) ( not ( = ?auto_37851 ?auto_37859 ) ) ( AVAILABLE ?auto_37859 ) ( SURFACE-AT ?auto_37849 ?auto_37852 ) ( ON ?auto_37849 ?auto_37850 ) ( CLEAR ?auto_37849 ) ( not ( = ?auto_37848 ?auto_37850 ) ) ( not ( = ?auto_37849 ?auto_37850 ) ) ( not ( = ?auto_37858 ?auto_37850 ) ) ( not ( = ?auto_37856 ?auto_37850 ) ) ( TRUCK-AT ?auto_37854 ?auto_37857 ) )
    :subtasks
    ( ( !DRIVE ?auto_37854 ?auto_37857 ?auto_37852 )
      ( MAKE-ON ?auto_37848 ?auto_37849 )
      ( MAKE-ON-VERIFY ?auto_37848 ?auto_37849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37860 - SURFACE
      ?auto_37861 - SURFACE
    )
    :vars
    (
      ?auto_37865 - HOIST
      ?auto_37867 - PLACE
      ?auto_37866 - PLACE
      ?auto_37870 - HOIST
      ?auto_37864 - SURFACE
      ?auto_37862 - SURFACE
      ?auto_37871 - PLACE
      ?auto_37869 - HOIST
      ?auto_37868 - SURFACE
      ?auto_37863 - TRUCK
      ?auto_37872 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37865 ?auto_37867 ) ( IS-CRATE ?auto_37860 ) ( not ( = ?auto_37860 ?auto_37861 ) ) ( not ( = ?auto_37866 ?auto_37867 ) ) ( HOIST-AT ?auto_37870 ?auto_37866 ) ( not ( = ?auto_37865 ?auto_37870 ) ) ( AVAILABLE ?auto_37870 ) ( SURFACE-AT ?auto_37860 ?auto_37866 ) ( ON ?auto_37860 ?auto_37864 ) ( CLEAR ?auto_37860 ) ( not ( = ?auto_37860 ?auto_37864 ) ) ( not ( = ?auto_37861 ?auto_37864 ) ) ( IS-CRATE ?auto_37861 ) ( not ( = ?auto_37860 ?auto_37862 ) ) ( not ( = ?auto_37861 ?auto_37862 ) ) ( not ( = ?auto_37864 ?auto_37862 ) ) ( not ( = ?auto_37871 ?auto_37867 ) ) ( not ( = ?auto_37866 ?auto_37871 ) ) ( HOIST-AT ?auto_37869 ?auto_37871 ) ( not ( = ?auto_37865 ?auto_37869 ) ) ( not ( = ?auto_37870 ?auto_37869 ) ) ( AVAILABLE ?auto_37869 ) ( SURFACE-AT ?auto_37861 ?auto_37871 ) ( ON ?auto_37861 ?auto_37868 ) ( CLEAR ?auto_37861 ) ( not ( = ?auto_37860 ?auto_37868 ) ) ( not ( = ?auto_37861 ?auto_37868 ) ) ( not ( = ?auto_37864 ?auto_37868 ) ) ( not ( = ?auto_37862 ?auto_37868 ) ) ( TRUCK-AT ?auto_37863 ?auto_37867 ) ( SURFACE-AT ?auto_37872 ?auto_37867 ) ( CLEAR ?auto_37872 ) ( LIFTING ?auto_37865 ?auto_37862 ) ( IS-CRATE ?auto_37862 ) ( not ( = ?auto_37860 ?auto_37872 ) ) ( not ( = ?auto_37861 ?auto_37872 ) ) ( not ( = ?auto_37864 ?auto_37872 ) ) ( not ( = ?auto_37862 ?auto_37872 ) ) ( not ( = ?auto_37868 ?auto_37872 ) ) )
    :subtasks
    ( ( !DROP ?auto_37865 ?auto_37862 ?auto_37872 ?auto_37867 )
      ( MAKE-ON ?auto_37860 ?auto_37861 )
      ( MAKE-ON-VERIFY ?auto_37860 ?auto_37861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37873 - SURFACE
      ?auto_37874 - SURFACE
    )
    :vars
    (
      ?auto_37881 - HOIST
      ?auto_37879 - PLACE
      ?auto_37885 - PLACE
      ?auto_37875 - HOIST
      ?auto_37878 - SURFACE
      ?auto_37876 - SURFACE
      ?auto_37883 - PLACE
      ?auto_37884 - HOIST
      ?auto_37882 - SURFACE
      ?auto_37880 - TRUCK
      ?auto_37877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37881 ?auto_37879 ) ( IS-CRATE ?auto_37873 ) ( not ( = ?auto_37873 ?auto_37874 ) ) ( not ( = ?auto_37885 ?auto_37879 ) ) ( HOIST-AT ?auto_37875 ?auto_37885 ) ( not ( = ?auto_37881 ?auto_37875 ) ) ( AVAILABLE ?auto_37875 ) ( SURFACE-AT ?auto_37873 ?auto_37885 ) ( ON ?auto_37873 ?auto_37878 ) ( CLEAR ?auto_37873 ) ( not ( = ?auto_37873 ?auto_37878 ) ) ( not ( = ?auto_37874 ?auto_37878 ) ) ( IS-CRATE ?auto_37874 ) ( not ( = ?auto_37873 ?auto_37876 ) ) ( not ( = ?auto_37874 ?auto_37876 ) ) ( not ( = ?auto_37878 ?auto_37876 ) ) ( not ( = ?auto_37883 ?auto_37879 ) ) ( not ( = ?auto_37885 ?auto_37883 ) ) ( HOIST-AT ?auto_37884 ?auto_37883 ) ( not ( = ?auto_37881 ?auto_37884 ) ) ( not ( = ?auto_37875 ?auto_37884 ) ) ( AVAILABLE ?auto_37884 ) ( SURFACE-AT ?auto_37874 ?auto_37883 ) ( ON ?auto_37874 ?auto_37882 ) ( CLEAR ?auto_37874 ) ( not ( = ?auto_37873 ?auto_37882 ) ) ( not ( = ?auto_37874 ?auto_37882 ) ) ( not ( = ?auto_37878 ?auto_37882 ) ) ( not ( = ?auto_37876 ?auto_37882 ) ) ( TRUCK-AT ?auto_37880 ?auto_37879 ) ( SURFACE-AT ?auto_37877 ?auto_37879 ) ( CLEAR ?auto_37877 ) ( IS-CRATE ?auto_37876 ) ( not ( = ?auto_37873 ?auto_37877 ) ) ( not ( = ?auto_37874 ?auto_37877 ) ) ( not ( = ?auto_37878 ?auto_37877 ) ) ( not ( = ?auto_37876 ?auto_37877 ) ) ( not ( = ?auto_37882 ?auto_37877 ) ) ( AVAILABLE ?auto_37881 ) ( IN ?auto_37876 ?auto_37880 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37881 ?auto_37876 ?auto_37880 ?auto_37879 )
      ( MAKE-ON ?auto_37873 ?auto_37874 )
      ( MAKE-ON-VERIFY ?auto_37873 ?auto_37874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37886 - SURFACE
      ?auto_37887 - SURFACE
    )
    :vars
    (
      ?auto_37890 - HOIST
      ?auto_37891 - PLACE
      ?auto_37894 - PLACE
      ?auto_37897 - HOIST
      ?auto_37895 - SURFACE
      ?auto_37892 - SURFACE
      ?auto_37893 - PLACE
      ?auto_37889 - HOIST
      ?auto_37888 - SURFACE
      ?auto_37898 - SURFACE
      ?auto_37896 - TRUCK
      ?auto_37899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37890 ?auto_37891 ) ( IS-CRATE ?auto_37886 ) ( not ( = ?auto_37886 ?auto_37887 ) ) ( not ( = ?auto_37894 ?auto_37891 ) ) ( HOIST-AT ?auto_37897 ?auto_37894 ) ( not ( = ?auto_37890 ?auto_37897 ) ) ( AVAILABLE ?auto_37897 ) ( SURFACE-AT ?auto_37886 ?auto_37894 ) ( ON ?auto_37886 ?auto_37895 ) ( CLEAR ?auto_37886 ) ( not ( = ?auto_37886 ?auto_37895 ) ) ( not ( = ?auto_37887 ?auto_37895 ) ) ( IS-CRATE ?auto_37887 ) ( not ( = ?auto_37886 ?auto_37892 ) ) ( not ( = ?auto_37887 ?auto_37892 ) ) ( not ( = ?auto_37895 ?auto_37892 ) ) ( not ( = ?auto_37893 ?auto_37891 ) ) ( not ( = ?auto_37894 ?auto_37893 ) ) ( HOIST-AT ?auto_37889 ?auto_37893 ) ( not ( = ?auto_37890 ?auto_37889 ) ) ( not ( = ?auto_37897 ?auto_37889 ) ) ( AVAILABLE ?auto_37889 ) ( SURFACE-AT ?auto_37887 ?auto_37893 ) ( ON ?auto_37887 ?auto_37888 ) ( CLEAR ?auto_37887 ) ( not ( = ?auto_37886 ?auto_37888 ) ) ( not ( = ?auto_37887 ?auto_37888 ) ) ( not ( = ?auto_37895 ?auto_37888 ) ) ( not ( = ?auto_37892 ?auto_37888 ) ) ( SURFACE-AT ?auto_37898 ?auto_37891 ) ( CLEAR ?auto_37898 ) ( IS-CRATE ?auto_37892 ) ( not ( = ?auto_37886 ?auto_37898 ) ) ( not ( = ?auto_37887 ?auto_37898 ) ) ( not ( = ?auto_37895 ?auto_37898 ) ) ( not ( = ?auto_37892 ?auto_37898 ) ) ( not ( = ?auto_37888 ?auto_37898 ) ) ( AVAILABLE ?auto_37890 ) ( IN ?auto_37892 ?auto_37896 ) ( TRUCK-AT ?auto_37896 ?auto_37899 ) ( not ( = ?auto_37899 ?auto_37891 ) ) ( not ( = ?auto_37894 ?auto_37899 ) ) ( not ( = ?auto_37893 ?auto_37899 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37896 ?auto_37899 ?auto_37891 )
      ( MAKE-ON ?auto_37886 ?auto_37887 )
      ( MAKE-ON-VERIFY ?auto_37886 ?auto_37887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37900 - SURFACE
      ?auto_37901 - SURFACE
    )
    :vars
    (
      ?auto_37907 - HOIST
      ?auto_37909 - PLACE
      ?auto_37908 - PLACE
      ?auto_37906 - HOIST
      ?auto_37905 - SURFACE
      ?auto_37903 - SURFACE
      ?auto_37904 - PLACE
      ?auto_37910 - HOIST
      ?auto_37913 - SURFACE
      ?auto_37911 - SURFACE
      ?auto_37902 - TRUCK
      ?auto_37912 - PLACE
      ?auto_37914 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_37907 ?auto_37909 ) ( IS-CRATE ?auto_37900 ) ( not ( = ?auto_37900 ?auto_37901 ) ) ( not ( = ?auto_37908 ?auto_37909 ) ) ( HOIST-AT ?auto_37906 ?auto_37908 ) ( not ( = ?auto_37907 ?auto_37906 ) ) ( AVAILABLE ?auto_37906 ) ( SURFACE-AT ?auto_37900 ?auto_37908 ) ( ON ?auto_37900 ?auto_37905 ) ( CLEAR ?auto_37900 ) ( not ( = ?auto_37900 ?auto_37905 ) ) ( not ( = ?auto_37901 ?auto_37905 ) ) ( IS-CRATE ?auto_37901 ) ( not ( = ?auto_37900 ?auto_37903 ) ) ( not ( = ?auto_37901 ?auto_37903 ) ) ( not ( = ?auto_37905 ?auto_37903 ) ) ( not ( = ?auto_37904 ?auto_37909 ) ) ( not ( = ?auto_37908 ?auto_37904 ) ) ( HOIST-AT ?auto_37910 ?auto_37904 ) ( not ( = ?auto_37907 ?auto_37910 ) ) ( not ( = ?auto_37906 ?auto_37910 ) ) ( AVAILABLE ?auto_37910 ) ( SURFACE-AT ?auto_37901 ?auto_37904 ) ( ON ?auto_37901 ?auto_37913 ) ( CLEAR ?auto_37901 ) ( not ( = ?auto_37900 ?auto_37913 ) ) ( not ( = ?auto_37901 ?auto_37913 ) ) ( not ( = ?auto_37905 ?auto_37913 ) ) ( not ( = ?auto_37903 ?auto_37913 ) ) ( SURFACE-AT ?auto_37911 ?auto_37909 ) ( CLEAR ?auto_37911 ) ( IS-CRATE ?auto_37903 ) ( not ( = ?auto_37900 ?auto_37911 ) ) ( not ( = ?auto_37901 ?auto_37911 ) ) ( not ( = ?auto_37905 ?auto_37911 ) ) ( not ( = ?auto_37903 ?auto_37911 ) ) ( not ( = ?auto_37913 ?auto_37911 ) ) ( AVAILABLE ?auto_37907 ) ( TRUCK-AT ?auto_37902 ?auto_37912 ) ( not ( = ?auto_37912 ?auto_37909 ) ) ( not ( = ?auto_37908 ?auto_37912 ) ) ( not ( = ?auto_37904 ?auto_37912 ) ) ( HOIST-AT ?auto_37914 ?auto_37912 ) ( LIFTING ?auto_37914 ?auto_37903 ) ( not ( = ?auto_37907 ?auto_37914 ) ) ( not ( = ?auto_37906 ?auto_37914 ) ) ( not ( = ?auto_37910 ?auto_37914 ) ) )
    :subtasks
    ( ( !LOAD ?auto_37914 ?auto_37903 ?auto_37902 ?auto_37912 )
      ( MAKE-ON ?auto_37900 ?auto_37901 )
      ( MAKE-ON-VERIFY ?auto_37900 ?auto_37901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37915 - SURFACE
      ?auto_37916 - SURFACE
    )
    :vars
    (
      ?auto_37928 - HOIST
      ?auto_37924 - PLACE
      ?auto_37926 - PLACE
      ?auto_37919 - HOIST
      ?auto_37922 - SURFACE
      ?auto_37923 - SURFACE
      ?auto_37917 - PLACE
      ?auto_37927 - HOIST
      ?auto_37921 - SURFACE
      ?auto_37929 - SURFACE
      ?auto_37918 - TRUCK
      ?auto_37920 - PLACE
      ?auto_37925 - HOIST
      ?auto_37930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37928 ?auto_37924 ) ( IS-CRATE ?auto_37915 ) ( not ( = ?auto_37915 ?auto_37916 ) ) ( not ( = ?auto_37926 ?auto_37924 ) ) ( HOIST-AT ?auto_37919 ?auto_37926 ) ( not ( = ?auto_37928 ?auto_37919 ) ) ( AVAILABLE ?auto_37919 ) ( SURFACE-AT ?auto_37915 ?auto_37926 ) ( ON ?auto_37915 ?auto_37922 ) ( CLEAR ?auto_37915 ) ( not ( = ?auto_37915 ?auto_37922 ) ) ( not ( = ?auto_37916 ?auto_37922 ) ) ( IS-CRATE ?auto_37916 ) ( not ( = ?auto_37915 ?auto_37923 ) ) ( not ( = ?auto_37916 ?auto_37923 ) ) ( not ( = ?auto_37922 ?auto_37923 ) ) ( not ( = ?auto_37917 ?auto_37924 ) ) ( not ( = ?auto_37926 ?auto_37917 ) ) ( HOIST-AT ?auto_37927 ?auto_37917 ) ( not ( = ?auto_37928 ?auto_37927 ) ) ( not ( = ?auto_37919 ?auto_37927 ) ) ( AVAILABLE ?auto_37927 ) ( SURFACE-AT ?auto_37916 ?auto_37917 ) ( ON ?auto_37916 ?auto_37921 ) ( CLEAR ?auto_37916 ) ( not ( = ?auto_37915 ?auto_37921 ) ) ( not ( = ?auto_37916 ?auto_37921 ) ) ( not ( = ?auto_37922 ?auto_37921 ) ) ( not ( = ?auto_37923 ?auto_37921 ) ) ( SURFACE-AT ?auto_37929 ?auto_37924 ) ( CLEAR ?auto_37929 ) ( IS-CRATE ?auto_37923 ) ( not ( = ?auto_37915 ?auto_37929 ) ) ( not ( = ?auto_37916 ?auto_37929 ) ) ( not ( = ?auto_37922 ?auto_37929 ) ) ( not ( = ?auto_37923 ?auto_37929 ) ) ( not ( = ?auto_37921 ?auto_37929 ) ) ( AVAILABLE ?auto_37928 ) ( TRUCK-AT ?auto_37918 ?auto_37920 ) ( not ( = ?auto_37920 ?auto_37924 ) ) ( not ( = ?auto_37926 ?auto_37920 ) ) ( not ( = ?auto_37917 ?auto_37920 ) ) ( HOIST-AT ?auto_37925 ?auto_37920 ) ( not ( = ?auto_37928 ?auto_37925 ) ) ( not ( = ?auto_37919 ?auto_37925 ) ) ( not ( = ?auto_37927 ?auto_37925 ) ) ( AVAILABLE ?auto_37925 ) ( SURFACE-AT ?auto_37923 ?auto_37920 ) ( ON ?auto_37923 ?auto_37930 ) ( CLEAR ?auto_37923 ) ( not ( = ?auto_37915 ?auto_37930 ) ) ( not ( = ?auto_37916 ?auto_37930 ) ) ( not ( = ?auto_37922 ?auto_37930 ) ) ( not ( = ?auto_37923 ?auto_37930 ) ) ( not ( = ?auto_37921 ?auto_37930 ) ) ( not ( = ?auto_37929 ?auto_37930 ) ) )
    :subtasks
    ( ( !LIFT ?auto_37925 ?auto_37923 ?auto_37930 ?auto_37920 )
      ( MAKE-ON ?auto_37915 ?auto_37916 )
      ( MAKE-ON-VERIFY ?auto_37915 ?auto_37916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37931 - SURFACE
      ?auto_37932 - SURFACE
    )
    :vars
    (
      ?auto_37934 - HOIST
      ?auto_37943 - PLACE
      ?auto_37945 - PLACE
      ?auto_37944 - HOIST
      ?auto_37937 - SURFACE
      ?auto_37942 - SURFACE
      ?auto_37935 - PLACE
      ?auto_37933 - HOIST
      ?auto_37938 - SURFACE
      ?auto_37941 - SURFACE
      ?auto_37940 - PLACE
      ?auto_37936 - HOIST
      ?auto_37946 - SURFACE
      ?auto_37939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37934 ?auto_37943 ) ( IS-CRATE ?auto_37931 ) ( not ( = ?auto_37931 ?auto_37932 ) ) ( not ( = ?auto_37945 ?auto_37943 ) ) ( HOIST-AT ?auto_37944 ?auto_37945 ) ( not ( = ?auto_37934 ?auto_37944 ) ) ( AVAILABLE ?auto_37944 ) ( SURFACE-AT ?auto_37931 ?auto_37945 ) ( ON ?auto_37931 ?auto_37937 ) ( CLEAR ?auto_37931 ) ( not ( = ?auto_37931 ?auto_37937 ) ) ( not ( = ?auto_37932 ?auto_37937 ) ) ( IS-CRATE ?auto_37932 ) ( not ( = ?auto_37931 ?auto_37942 ) ) ( not ( = ?auto_37932 ?auto_37942 ) ) ( not ( = ?auto_37937 ?auto_37942 ) ) ( not ( = ?auto_37935 ?auto_37943 ) ) ( not ( = ?auto_37945 ?auto_37935 ) ) ( HOIST-AT ?auto_37933 ?auto_37935 ) ( not ( = ?auto_37934 ?auto_37933 ) ) ( not ( = ?auto_37944 ?auto_37933 ) ) ( AVAILABLE ?auto_37933 ) ( SURFACE-AT ?auto_37932 ?auto_37935 ) ( ON ?auto_37932 ?auto_37938 ) ( CLEAR ?auto_37932 ) ( not ( = ?auto_37931 ?auto_37938 ) ) ( not ( = ?auto_37932 ?auto_37938 ) ) ( not ( = ?auto_37937 ?auto_37938 ) ) ( not ( = ?auto_37942 ?auto_37938 ) ) ( SURFACE-AT ?auto_37941 ?auto_37943 ) ( CLEAR ?auto_37941 ) ( IS-CRATE ?auto_37942 ) ( not ( = ?auto_37931 ?auto_37941 ) ) ( not ( = ?auto_37932 ?auto_37941 ) ) ( not ( = ?auto_37937 ?auto_37941 ) ) ( not ( = ?auto_37942 ?auto_37941 ) ) ( not ( = ?auto_37938 ?auto_37941 ) ) ( AVAILABLE ?auto_37934 ) ( not ( = ?auto_37940 ?auto_37943 ) ) ( not ( = ?auto_37945 ?auto_37940 ) ) ( not ( = ?auto_37935 ?auto_37940 ) ) ( HOIST-AT ?auto_37936 ?auto_37940 ) ( not ( = ?auto_37934 ?auto_37936 ) ) ( not ( = ?auto_37944 ?auto_37936 ) ) ( not ( = ?auto_37933 ?auto_37936 ) ) ( AVAILABLE ?auto_37936 ) ( SURFACE-AT ?auto_37942 ?auto_37940 ) ( ON ?auto_37942 ?auto_37946 ) ( CLEAR ?auto_37942 ) ( not ( = ?auto_37931 ?auto_37946 ) ) ( not ( = ?auto_37932 ?auto_37946 ) ) ( not ( = ?auto_37937 ?auto_37946 ) ) ( not ( = ?auto_37942 ?auto_37946 ) ) ( not ( = ?auto_37938 ?auto_37946 ) ) ( not ( = ?auto_37941 ?auto_37946 ) ) ( TRUCK-AT ?auto_37939 ?auto_37943 ) )
    :subtasks
    ( ( !DRIVE ?auto_37939 ?auto_37943 ?auto_37940 )
      ( MAKE-ON ?auto_37931 ?auto_37932 )
      ( MAKE-ON-VERIFY ?auto_37931 ?auto_37932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37947 - SURFACE
      ?auto_37948 - SURFACE
    )
    :vars
    (
      ?auto_37960 - HOIST
      ?auto_37950 - PLACE
      ?auto_37953 - PLACE
      ?auto_37961 - HOIST
      ?auto_37952 - SURFACE
      ?auto_37951 - SURFACE
      ?auto_37955 - PLACE
      ?auto_37949 - HOIST
      ?auto_37956 - SURFACE
      ?auto_37958 - SURFACE
      ?auto_37959 - PLACE
      ?auto_37957 - HOIST
      ?auto_37962 - SURFACE
      ?auto_37954 - TRUCK
      ?auto_37963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37960 ?auto_37950 ) ( IS-CRATE ?auto_37947 ) ( not ( = ?auto_37947 ?auto_37948 ) ) ( not ( = ?auto_37953 ?auto_37950 ) ) ( HOIST-AT ?auto_37961 ?auto_37953 ) ( not ( = ?auto_37960 ?auto_37961 ) ) ( AVAILABLE ?auto_37961 ) ( SURFACE-AT ?auto_37947 ?auto_37953 ) ( ON ?auto_37947 ?auto_37952 ) ( CLEAR ?auto_37947 ) ( not ( = ?auto_37947 ?auto_37952 ) ) ( not ( = ?auto_37948 ?auto_37952 ) ) ( IS-CRATE ?auto_37948 ) ( not ( = ?auto_37947 ?auto_37951 ) ) ( not ( = ?auto_37948 ?auto_37951 ) ) ( not ( = ?auto_37952 ?auto_37951 ) ) ( not ( = ?auto_37955 ?auto_37950 ) ) ( not ( = ?auto_37953 ?auto_37955 ) ) ( HOIST-AT ?auto_37949 ?auto_37955 ) ( not ( = ?auto_37960 ?auto_37949 ) ) ( not ( = ?auto_37961 ?auto_37949 ) ) ( AVAILABLE ?auto_37949 ) ( SURFACE-AT ?auto_37948 ?auto_37955 ) ( ON ?auto_37948 ?auto_37956 ) ( CLEAR ?auto_37948 ) ( not ( = ?auto_37947 ?auto_37956 ) ) ( not ( = ?auto_37948 ?auto_37956 ) ) ( not ( = ?auto_37952 ?auto_37956 ) ) ( not ( = ?auto_37951 ?auto_37956 ) ) ( IS-CRATE ?auto_37951 ) ( not ( = ?auto_37947 ?auto_37958 ) ) ( not ( = ?auto_37948 ?auto_37958 ) ) ( not ( = ?auto_37952 ?auto_37958 ) ) ( not ( = ?auto_37951 ?auto_37958 ) ) ( not ( = ?auto_37956 ?auto_37958 ) ) ( not ( = ?auto_37959 ?auto_37950 ) ) ( not ( = ?auto_37953 ?auto_37959 ) ) ( not ( = ?auto_37955 ?auto_37959 ) ) ( HOIST-AT ?auto_37957 ?auto_37959 ) ( not ( = ?auto_37960 ?auto_37957 ) ) ( not ( = ?auto_37961 ?auto_37957 ) ) ( not ( = ?auto_37949 ?auto_37957 ) ) ( AVAILABLE ?auto_37957 ) ( SURFACE-AT ?auto_37951 ?auto_37959 ) ( ON ?auto_37951 ?auto_37962 ) ( CLEAR ?auto_37951 ) ( not ( = ?auto_37947 ?auto_37962 ) ) ( not ( = ?auto_37948 ?auto_37962 ) ) ( not ( = ?auto_37952 ?auto_37962 ) ) ( not ( = ?auto_37951 ?auto_37962 ) ) ( not ( = ?auto_37956 ?auto_37962 ) ) ( not ( = ?auto_37958 ?auto_37962 ) ) ( TRUCK-AT ?auto_37954 ?auto_37950 ) ( SURFACE-AT ?auto_37963 ?auto_37950 ) ( CLEAR ?auto_37963 ) ( LIFTING ?auto_37960 ?auto_37958 ) ( IS-CRATE ?auto_37958 ) ( not ( = ?auto_37947 ?auto_37963 ) ) ( not ( = ?auto_37948 ?auto_37963 ) ) ( not ( = ?auto_37952 ?auto_37963 ) ) ( not ( = ?auto_37951 ?auto_37963 ) ) ( not ( = ?auto_37956 ?auto_37963 ) ) ( not ( = ?auto_37958 ?auto_37963 ) ) ( not ( = ?auto_37962 ?auto_37963 ) ) )
    :subtasks
    ( ( !DROP ?auto_37960 ?auto_37958 ?auto_37963 ?auto_37950 )
      ( MAKE-ON ?auto_37947 ?auto_37948 )
      ( MAKE-ON-VERIFY ?auto_37947 ?auto_37948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37964 - SURFACE
      ?auto_37965 - SURFACE
    )
    :vars
    (
      ?auto_37976 - HOIST
      ?auto_37979 - PLACE
      ?auto_37972 - PLACE
      ?auto_37968 - HOIST
      ?auto_37980 - SURFACE
      ?auto_37969 - SURFACE
      ?auto_37966 - PLACE
      ?auto_37970 - HOIST
      ?auto_37973 - SURFACE
      ?auto_37971 - SURFACE
      ?auto_37967 - PLACE
      ?auto_37975 - HOIST
      ?auto_37978 - SURFACE
      ?auto_37977 - TRUCK
      ?auto_37974 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37976 ?auto_37979 ) ( IS-CRATE ?auto_37964 ) ( not ( = ?auto_37964 ?auto_37965 ) ) ( not ( = ?auto_37972 ?auto_37979 ) ) ( HOIST-AT ?auto_37968 ?auto_37972 ) ( not ( = ?auto_37976 ?auto_37968 ) ) ( AVAILABLE ?auto_37968 ) ( SURFACE-AT ?auto_37964 ?auto_37972 ) ( ON ?auto_37964 ?auto_37980 ) ( CLEAR ?auto_37964 ) ( not ( = ?auto_37964 ?auto_37980 ) ) ( not ( = ?auto_37965 ?auto_37980 ) ) ( IS-CRATE ?auto_37965 ) ( not ( = ?auto_37964 ?auto_37969 ) ) ( not ( = ?auto_37965 ?auto_37969 ) ) ( not ( = ?auto_37980 ?auto_37969 ) ) ( not ( = ?auto_37966 ?auto_37979 ) ) ( not ( = ?auto_37972 ?auto_37966 ) ) ( HOIST-AT ?auto_37970 ?auto_37966 ) ( not ( = ?auto_37976 ?auto_37970 ) ) ( not ( = ?auto_37968 ?auto_37970 ) ) ( AVAILABLE ?auto_37970 ) ( SURFACE-AT ?auto_37965 ?auto_37966 ) ( ON ?auto_37965 ?auto_37973 ) ( CLEAR ?auto_37965 ) ( not ( = ?auto_37964 ?auto_37973 ) ) ( not ( = ?auto_37965 ?auto_37973 ) ) ( not ( = ?auto_37980 ?auto_37973 ) ) ( not ( = ?auto_37969 ?auto_37973 ) ) ( IS-CRATE ?auto_37969 ) ( not ( = ?auto_37964 ?auto_37971 ) ) ( not ( = ?auto_37965 ?auto_37971 ) ) ( not ( = ?auto_37980 ?auto_37971 ) ) ( not ( = ?auto_37969 ?auto_37971 ) ) ( not ( = ?auto_37973 ?auto_37971 ) ) ( not ( = ?auto_37967 ?auto_37979 ) ) ( not ( = ?auto_37972 ?auto_37967 ) ) ( not ( = ?auto_37966 ?auto_37967 ) ) ( HOIST-AT ?auto_37975 ?auto_37967 ) ( not ( = ?auto_37976 ?auto_37975 ) ) ( not ( = ?auto_37968 ?auto_37975 ) ) ( not ( = ?auto_37970 ?auto_37975 ) ) ( AVAILABLE ?auto_37975 ) ( SURFACE-AT ?auto_37969 ?auto_37967 ) ( ON ?auto_37969 ?auto_37978 ) ( CLEAR ?auto_37969 ) ( not ( = ?auto_37964 ?auto_37978 ) ) ( not ( = ?auto_37965 ?auto_37978 ) ) ( not ( = ?auto_37980 ?auto_37978 ) ) ( not ( = ?auto_37969 ?auto_37978 ) ) ( not ( = ?auto_37973 ?auto_37978 ) ) ( not ( = ?auto_37971 ?auto_37978 ) ) ( TRUCK-AT ?auto_37977 ?auto_37979 ) ( SURFACE-AT ?auto_37974 ?auto_37979 ) ( CLEAR ?auto_37974 ) ( IS-CRATE ?auto_37971 ) ( not ( = ?auto_37964 ?auto_37974 ) ) ( not ( = ?auto_37965 ?auto_37974 ) ) ( not ( = ?auto_37980 ?auto_37974 ) ) ( not ( = ?auto_37969 ?auto_37974 ) ) ( not ( = ?auto_37973 ?auto_37974 ) ) ( not ( = ?auto_37971 ?auto_37974 ) ) ( not ( = ?auto_37978 ?auto_37974 ) ) ( AVAILABLE ?auto_37976 ) ( IN ?auto_37971 ?auto_37977 ) )
    :subtasks
    ( ( !UNLOAD ?auto_37976 ?auto_37971 ?auto_37977 ?auto_37979 )
      ( MAKE-ON ?auto_37964 ?auto_37965 )
      ( MAKE-ON-VERIFY ?auto_37964 ?auto_37965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37981 - SURFACE
      ?auto_37982 - SURFACE
    )
    :vars
    (
      ?auto_37992 - HOIST
      ?auto_37995 - PLACE
      ?auto_37996 - PLACE
      ?auto_37987 - HOIST
      ?auto_37994 - SURFACE
      ?auto_37990 - SURFACE
      ?auto_37989 - PLACE
      ?auto_37985 - HOIST
      ?auto_37983 - SURFACE
      ?auto_37986 - SURFACE
      ?auto_37988 - PLACE
      ?auto_37991 - HOIST
      ?auto_37984 - SURFACE
      ?auto_37997 - SURFACE
      ?auto_37993 - TRUCK
      ?auto_37998 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_37992 ?auto_37995 ) ( IS-CRATE ?auto_37981 ) ( not ( = ?auto_37981 ?auto_37982 ) ) ( not ( = ?auto_37996 ?auto_37995 ) ) ( HOIST-AT ?auto_37987 ?auto_37996 ) ( not ( = ?auto_37992 ?auto_37987 ) ) ( AVAILABLE ?auto_37987 ) ( SURFACE-AT ?auto_37981 ?auto_37996 ) ( ON ?auto_37981 ?auto_37994 ) ( CLEAR ?auto_37981 ) ( not ( = ?auto_37981 ?auto_37994 ) ) ( not ( = ?auto_37982 ?auto_37994 ) ) ( IS-CRATE ?auto_37982 ) ( not ( = ?auto_37981 ?auto_37990 ) ) ( not ( = ?auto_37982 ?auto_37990 ) ) ( not ( = ?auto_37994 ?auto_37990 ) ) ( not ( = ?auto_37989 ?auto_37995 ) ) ( not ( = ?auto_37996 ?auto_37989 ) ) ( HOIST-AT ?auto_37985 ?auto_37989 ) ( not ( = ?auto_37992 ?auto_37985 ) ) ( not ( = ?auto_37987 ?auto_37985 ) ) ( AVAILABLE ?auto_37985 ) ( SURFACE-AT ?auto_37982 ?auto_37989 ) ( ON ?auto_37982 ?auto_37983 ) ( CLEAR ?auto_37982 ) ( not ( = ?auto_37981 ?auto_37983 ) ) ( not ( = ?auto_37982 ?auto_37983 ) ) ( not ( = ?auto_37994 ?auto_37983 ) ) ( not ( = ?auto_37990 ?auto_37983 ) ) ( IS-CRATE ?auto_37990 ) ( not ( = ?auto_37981 ?auto_37986 ) ) ( not ( = ?auto_37982 ?auto_37986 ) ) ( not ( = ?auto_37994 ?auto_37986 ) ) ( not ( = ?auto_37990 ?auto_37986 ) ) ( not ( = ?auto_37983 ?auto_37986 ) ) ( not ( = ?auto_37988 ?auto_37995 ) ) ( not ( = ?auto_37996 ?auto_37988 ) ) ( not ( = ?auto_37989 ?auto_37988 ) ) ( HOIST-AT ?auto_37991 ?auto_37988 ) ( not ( = ?auto_37992 ?auto_37991 ) ) ( not ( = ?auto_37987 ?auto_37991 ) ) ( not ( = ?auto_37985 ?auto_37991 ) ) ( AVAILABLE ?auto_37991 ) ( SURFACE-AT ?auto_37990 ?auto_37988 ) ( ON ?auto_37990 ?auto_37984 ) ( CLEAR ?auto_37990 ) ( not ( = ?auto_37981 ?auto_37984 ) ) ( not ( = ?auto_37982 ?auto_37984 ) ) ( not ( = ?auto_37994 ?auto_37984 ) ) ( not ( = ?auto_37990 ?auto_37984 ) ) ( not ( = ?auto_37983 ?auto_37984 ) ) ( not ( = ?auto_37986 ?auto_37984 ) ) ( SURFACE-AT ?auto_37997 ?auto_37995 ) ( CLEAR ?auto_37997 ) ( IS-CRATE ?auto_37986 ) ( not ( = ?auto_37981 ?auto_37997 ) ) ( not ( = ?auto_37982 ?auto_37997 ) ) ( not ( = ?auto_37994 ?auto_37997 ) ) ( not ( = ?auto_37990 ?auto_37997 ) ) ( not ( = ?auto_37983 ?auto_37997 ) ) ( not ( = ?auto_37986 ?auto_37997 ) ) ( not ( = ?auto_37984 ?auto_37997 ) ) ( AVAILABLE ?auto_37992 ) ( IN ?auto_37986 ?auto_37993 ) ( TRUCK-AT ?auto_37993 ?auto_37998 ) ( not ( = ?auto_37998 ?auto_37995 ) ) ( not ( = ?auto_37996 ?auto_37998 ) ) ( not ( = ?auto_37989 ?auto_37998 ) ) ( not ( = ?auto_37988 ?auto_37998 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_37993 ?auto_37998 ?auto_37995 )
      ( MAKE-ON ?auto_37981 ?auto_37982 )
      ( MAKE-ON-VERIFY ?auto_37981 ?auto_37982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_37999 - SURFACE
      ?auto_38000 - SURFACE
    )
    :vars
    (
      ?auto_38013 - HOIST
      ?auto_38009 - PLACE
      ?auto_38014 - PLACE
      ?auto_38012 - HOIST
      ?auto_38010 - SURFACE
      ?auto_38015 - SURFACE
      ?auto_38005 - PLACE
      ?auto_38002 - HOIST
      ?auto_38008 - SURFACE
      ?auto_38004 - SURFACE
      ?auto_38016 - PLACE
      ?auto_38007 - HOIST
      ?auto_38001 - SURFACE
      ?auto_38011 - SURFACE
      ?auto_38003 - TRUCK
      ?auto_38006 - PLACE
      ?auto_38017 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38013 ?auto_38009 ) ( IS-CRATE ?auto_37999 ) ( not ( = ?auto_37999 ?auto_38000 ) ) ( not ( = ?auto_38014 ?auto_38009 ) ) ( HOIST-AT ?auto_38012 ?auto_38014 ) ( not ( = ?auto_38013 ?auto_38012 ) ) ( AVAILABLE ?auto_38012 ) ( SURFACE-AT ?auto_37999 ?auto_38014 ) ( ON ?auto_37999 ?auto_38010 ) ( CLEAR ?auto_37999 ) ( not ( = ?auto_37999 ?auto_38010 ) ) ( not ( = ?auto_38000 ?auto_38010 ) ) ( IS-CRATE ?auto_38000 ) ( not ( = ?auto_37999 ?auto_38015 ) ) ( not ( = ?auto_38000 ?auto_38015 ) ) ( not ( = ?auto_38010 ?auto_38015 ) ) ( not ( = ?auto_38005 ?auto_38009 ) ) ( not ( = ?auto_38014 ?auto_38005 ) ) ( HOIST-AT ?auto_38002 ?auto_38005 ) ( not ( = ?auto_38013 ?auto_38002 ) ) ( not ( = ?auto_38012 ?auto_38002 ) ) ( AVAILABLE ?auto_38002 ) ( SURFACE-AT ?auto_38000 ?auto_38005 ) ( ON ?auto_38000 ?auto_38008 ) ( CLEAR ?auto_38000 ) ( not ( = ?auto_37999 ?auto_38008 ) ) ( not ( = ?auto_38000 ?auto_38008 ) ) ( not ( = ?auto_38010 ?auto_38008 ) ) ( not ( = ?auto_38015 ?auto_38008 ) ) ( IS-CRATE ?auto_38015 ) ( not ( = ?auto_37999 ?auto_38004 ) ) ( not ( = ?auto_38000 ?auto_38004 ) ) ( not ( = ?auto_38010 ?auto_38004 ) ) ( not ( = ?auto_38015 ?auto_38004 ) ) ( not ( = ?auto_38008 ?auto_38004 ) ) ( not ( = ?auto_38016 ?auto_38009 ) ) ( not ( = ?auto_38014 ?auto_38016 ) ) ( not ( = ?auto_38005 ?auto_38016 ) ) ( HOIST-AT ?auto_38007 ?auto_38016 ) ( not ( = ?auto_38013 ?auto_38007 ) ) ( not ( = ?auto_38012 ?auto_38007 ) ) ( not ( = ?auto_38002 ?auto_38007 ) ) ( AVAILABLE ?auto_38007 ) ( SURFACE-AT ?auto_38015 ?auto_38016 ) ( ON ?auto_38015 ?auto_38001 ) ( CLEAR ?auto_38015 ) ( not ( = ?auto_37999 ?auto_38001 ) ) ( not ( = ?auto_38000 ?auto_38001 ) ) ( not ( = ?auto_38010 ?auto_38001 ) ) ( not ( = ?auto_38015 ?auto_38001 ) ) ( not ( = ?auto_38008 ?auto_38001 ) ) ( not ( = ?auto_38004 ?auto_38001 ) ) ( SURFACE-AT ?auto_38011 ?auto_38009 ) ( CLEAR ?auto_38011 ) ( IS-CRATE ?auto_38004 ) ( not ( = ?auto_37999 ?auto_38011 ) ) ( not ( = ?auto_38000 ?auto_38011 ) ) ( not ( = ?auto_38010 ?auto_38011 ) ) ( not ( = ?auto_38015 ?auto_38011 ) ) ( not ( = ?auto_38008 ?auto_38011 ) ) ( not ( = ?auto_38004 ?auto_38011 ) ) ( not ( = ?auto_38001 ?auto_38011 ) ) ( AVAILABLE ?auto_38013 ) ( TRUCK-AT ?auto_38003 ?auto_38006 ) ( not ( = ?auto_38006 ?auto_38009 ) ) ( not ( = ?auto_38014 ?auto_38006 ) ) ( not ( = ?auto_38005 ?auto_38006 ) ) ( not ( = ?auto_38016 ?auto_38006 ) ) ( HOIST-AT ?auto_38017 ?auto_38006 ) ( LIFTING ?auto_38017 ?auto_38004 ) ( not ( = ?auto_38013 ?auto_38017 ) ) ( not ( = ?auto_38012 ?auto_38017 ) ) ( not ( = ?auto_38002 ?auto_38017 ) ) ( not ( = ?auto_38007 ?auto_38017 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38017 ?auto_38004 ?auto_38003 ?auto_38006 )
      ( MAKE-ON ?auto_37999 ?auto_38000 )
      ( MAKE-ON-VERIFY ?auto_37999 ?auto_38000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38018 - SURFACE
      ?auto_38019 - SURFACE
    )
    :vars
    (
      ?auto_38023 - HOIST
      ?auto_38035 - PLACE
      ?auto_38031 - PLACE
      ?auto_38021 - HOIST
      ?auto_38022 - SURFACE
      ?auto_38025 - SURFACE
      ?auto_38032 - PLACE
      ?auto_38029 - HOIST
      ?auto_38028 - SURFACE
      ?auto_38026 - SURFACE
      ?auto_38034 - PLACE
      ?auto_38036 - HOIST
      ?auto_38024 - SURFACE
      ?auto_38033 - SURFACE
      ?auto_38027 - TRUCK
      ?auto_38030 - PLACE
      ?auto_38020 - HOIST
      ?auto_38037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38023 ?auto_38035 ) ( IS-CRATE ?auto_38018 ) ( not ( = ?auto_38018 ?auto_38019 ) ) ( not ( = ?auto_38031 ?auto_38035 ) ) ( HOIST-AT ?auto_38021 ?auto_38031 ) ( not ( = ?auto_38023 ?auto_38021 ) ) ( AVAILABLE ?auto_38021 ) ( SURFACE-AT ?auto_38018 ?auto_38031 ) ( ON ?auto_38018 ?auto_38022 ) ( CLEAR ?auto_38018 ) ( not ( = ?auto_38018 ?auto_38022 ) ) ( not ( = ?auto_38019 ?auto_38022 ) ) ( IS-CRATE ?auto_38019 ) ( not ( = ?auto_38018 ?auto_38025 ) ) ( not ( = ?auto_38019 ?auto_38025 ) ) ( not ( = ?auto_38022 ?auto_38025 ) ) ( not ( = ?auto_38032 ?auto_38035 ) ) ( not ( = ?auto_38031 ?auto_38032 ) ) ( HOIST-AT ?auto_38029 ?auto_38032 ) ( not ( = ?auto_38023 ?auto_38029 ) ) ( not ( = ?auto_38021 ?auto_38029 ) ) ( AVAILABLE ?auto_38029 ) ( SURFACE-AT ?auto_38019 ?auto_38032 ) ( ON ?auto_38019 ?auto_38028 ) ( CLEAR ?auto_38019 ) ( not ( = ?auto_38018 ?auto_38028 ) ) ( not ( = ?auto_38019 ?auto_38028 ) ) ( not ( = ?auto_38022 ?auto_38028 ) ) ( not ( = ?auto_38025 ?auto_38028 ) ) ( IS-CRATE ?auto_38025 ) ( not ( = ?auto_38018 ?auto_38026 ) ) ( not ( = ?auto_38019 ?auto_38026 ) ) ( not ( = ?auto_38022 ?auto_38026 ) ) ( not ( = ?auto_38025 ?auto_38026 ) ) ( not ( = ?auto_38028 ?auto_38026 ) ) ( not ( = ?auto_38034 ?auto_38035 ) ) ( not ( = ?auto_38031 ?auto_38034 ) ) ( not ( = ?auto_38032 ?auto_38034 ) ) ( HOIST-AT ?auto_38036 ?auto_38034 ) ( not ( = ?auto_38023 ?auto_38036 ) ) ( not ( = ?auto_38021 ?auto_38036 ) ) ( not ( = ?auto_38029 ?auto_38036 ) ) ( AVAILABLE ?auto_38036 ) ( SURFACE-AT ?auto_38025 ?auto_38034 ) ( ON ?auto_38025 ?auto_38024 ) ( CLEAR ?auto_38025 ) ( not ( = ?auto_38018 ?auto_38024 ) ) ( not ( = ?auto_38019 ?auto_38024 ) ) ( not ( = ?auto_38022 ?auto_38024 ) ) ( not ( = ?auto_38025 ?auto_38024 ) ) ( not ( = ?auto_38028 ?auto_38024 ) ) ( not ( = ?auto_38026 ?auto_38024 ) ) ( SURFACE-AT ?auto_38033 ?auto_38035 ) ( CLEAR ?auto_38033 ) ( IS-CRATE ?auto_38026 ) ( not ( = ?auto_38018 ?auto_38033 ) ) ( not ( = ?auto_38019 ?auto_38033 ) ) ( not ( = ?auto_38022 ?auto_38033 ) ) ( not ( = ?auto_38025 ?auto_38033 ) ) ( not ( = ?auto_38028 ?auto_38033 ) ) ( not ( = ?auto_38026 ?auto_38033 ) ) ( not ( = ?auto_38024 ?auto_38033 ) ) ( AVAILABLE ?auto_38023 ) ( TRUCK-AT ?auto_38027 ?auto_38030 ) ( not ( = ?auto_38030 ?auto_38035 ) ) ( not ( = ?auto_38031 ?auto_38030 ) ) ( not ( = ?auto_38032 ?auto_38030 ) ) ( not ( = ?auto_38034 ?auto_38030 ) ) ( HOIST-AT ?auto_38020 ?auto_38030 ) ( not ( = ?auto_38023 ?auto_38020 ) ) ( not ( = ?auto_38021 ?auto_38020 ) ) ( not ( = ?auto_38029 ?auto_38020 ) ) ( not ( = ?auto_38036 ?auto_38020 ) ) ( AVAILABLE ?auto_38020 ) ( SURFACE-AT ?auto_38026 ?auto_38030 ) ( ON ?auto_38026 ?auto_38037 ) ( CLEAR ?auto_38026 ) ( not ( = ?auto_38018 ?auto_38037 ) ) ( not ( = ?auto_38019 ?auto_38037 ) ) ( not ( = ?auto_38022 ?auto_38037 ) ) ( not ( = ?auto_38025 ?auto_38037 ) ) ( not ( = ?auto_38028 ?auto_38037 ) ) ( not ( = ?auto_38026 ?auto_38037 ) ) ( not ( = ?auto_38024 ?auto_38037 ) ) ( not ( = ?auto_38033 ?auto_38037 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38020 ?auto_38026 ?auto_38037 ?auto_38030 )
      ( MAKE-ON ?auto_38018 ?auto_38019 )
      ( MAKE-ON-VERIFY ?auto_38018 ?auto_38019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38038 - SURFACE
      ?auto_38039 - SURFACE
    )
    :vars
    (
      ?auto_38051 - HOIST
      ?auto_38048 - PLACE
      ?auto_38041 - PLACE
      ?auto_38050 - HOIST
      ?auto_38049 - SURFACE
      ?auto_38047 - SURFACE
      ?auto_38043 - PLACE
      ?auto_38045 - HOIST
      ?auto_38044 - SURFACE
      ?auto_38057 - SURFACE
      ?auto_38056 - PLACE
      ?auto_38055 - HOIST
      ?auto_38052 - SURFACE
      ?auto_38054 - SURFACE
      ?auto_38042 - PLACE
      ?auto_38046 - HOIST
      ?auto_38053 - SURFACE
      ?auto_38040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38051 ?auto_38048 ) ( IS-CRATE ?auto_38038 ) ( not ( = ?auto_38038 ?auto_38039 ) ) ( not ( = ?auto_38041 ?auto_38048 ) ) ( HOIST-AT ?auto_38050 ?auto_38041 ) ( not ( = ?auto_38051 ?auto_38050 ) ) ( AVAILABLE ?auto_38050 ) ( SURFACE-AT ?auto_38038 ?auto_38041 ) ( ON ?auto_38038 ?auto_38049 ) ( CLEAR ?auto_38038 ) ( not ( = ?auto_38038 ?auto_38049 ) ) ( not ( = ?auto_38039 ?auto_38049 ) ) ( IS-CRATE ?auto_38039 ) ( not ( = ?auto_38038 ?auto_38047 ) ) ( not ( = ?auto_38039 ?auto_38047 ) ) ( not ( = ?auto_38049 ?auto_38047 ) ) ( not ( = ?auto_38043 ?auto_38048 ) ) ( not ( = ?auto_38041 ?auto_38043 ) ) ( HOIST-AT ?auto_38045 ?auto_38043 ) ( not ( = ?auto_38051 ?auto_38045 ) ) ( not ( = ?auto_38050 ?auto_38045 ) ) ( AVAILABLE ?auto_38045 ) ( SURFACE-AT ?auto_38039 ?auto_38043 ) ( ON ?auto_38039 ?auto_38044 ) ( CLEAR ?auto_38039 ) ( not ( = ?auto_38038 ?auto_38044 ) ) ( not ( = ?auto_38039 ?auto_38044 ) ) ( not ( = ?auto_38049 ?auto_38044 ) ) ( not ( = ?auto_38047 ?auto_38044 ) ) ( IS-CRATE ?auto_38047 ) ( not ( = ?auto_38038 ?auto_38057 ) ) ( not ( = ?auto_38039 ?auto_38057 ) ) ( not ( = ?auto_38049 ?auto_38057 ) ) ( not ( = ?auto_38047 ?auto_38057 ) ) ( not ( = ?auto_38044 ?auto_38057 ) ) ( not ( = ?auto_38056 ?auto_38048 ) ) ( not ( = ?auto_38041 ?auto_38056 ) ) ( not ( = ?auto_38043 ?auto_38056 ) ) ( HOIST-AT ?auto_38055 ?auto_38056 ) ( not ( = ?auto_38051 ?auto_38055 ) ) ( not ( = ?auto_38050 ?auto_38055 ) ) ( not ( = ?auto_38045 ?auto_38055 ) ) ( AVAILABLE ?auto_38055 ) ( SURFACE-AT ?auto_38047 ?auto_38056 ) ( ON ?auto_38047 ?auto_38052 ) ( CLEAR ?auto_38047 ) ( not ( = ?auto_38038 ?auto_38052 ) ) ( not ( = ?auto_38039 ?auto_38052 ) ) ( not ( = ?auto_38049 ?auto_38052 ) ) ( not ( = ?auto_38047 ?auto_38052 ) ) ( not ( = ?auto_38044 ?auto_38052 ) ) ( not ( = ?auto_38057 ?auto_38052 ) ) ( SURFACE-AT ?auto_38054 ?auto_38048 ) ( CLEAR ?auto_38054 ) ( IS-CRATE ?auto_38057 ) ( not ( = ?auto_38038 ?auto_38054 ) ) ( not ( = ?auto_38039 ?auto_38054 ) ) ( not ( = ?auto_38049 ?auto_38054 ) ) ( not ( = ?auto_38047 ?auto_38054 ) ) ( not ( = ?auto_38044 ?auto_38054 ) ) ( not ( = ?auto_38057 ?auto_38054 ) ) ( not ( = ?auto_38052 ?auto_38054 ) ) ( AVAILABLE ?auto_38051 ) ( not ( = ?auto_38042 ?auto_38048 ) ) ( not ( = ?auto_38041 ?auto_38042 ) ) ( not ( = ?auto_38043 ?auto_38042 ) ) ( not ( = ?auto_38056 ?auto_38042 ) ) ( HOIST-AT ?auto_38046 ?auto_38042 ) ( not ( = ?auto_38051 ?auto_38046 ) ) ( not ( = ?auto_38050 ?auto_38046 ) ) ( not ( = ?auto_38045 ?auto_38046 ) ) ( not ( = ?auto_38055 ?auto_38046 ) ) ( AVAILABLE ?auto_38046 ) ( SURFACE-AT ?auto_38057 ?auto_38042 ) ( ON ?auto_38057 ?auto_38053 ) ( CLEAR ?auto_38057 ) ( not ( = ?auto_38038 ?auto_38053 ) ) ( not ( = ?auto_38039 ?auto_38053 ) ) ( not ( = ?auto_38049 ?auto_38053 ) ) ( not ( = ?auto_38047 ?auto_38053 ) ) ( not ( = ?auto_38044 ?auto_38053 ) ) ( not ( = ?auto_38057 ?auto_38053 ) ) ( not ( = ?auto_38052 ?auto_38053 ) ) ( not ( = ?auto_38054 ?auto_38053 ) ) ( TRUCK-AT ?auto_38040 ?auto_38048 ) )
    :subtasks
    ( ( !DRIVE ?auto_38040 ?auto_38048 ?auto_38042 )
      ( MAKE-ON ?auto_38038 ?auto_38039 )
      ( MAKE-ON-VERIFY ?auto_38038 ?auto_38039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38058 - SURFACE
      ?auto_38059 - SURFACE
    )
    :vars
    (
      ?auto_38070 - HOIST
      ?auto_38066 - PLACE
      ?auto_38076 - PLACE
      ?auto_38063 - HOIST
      ?auto_38064 - SURFACE
      ?auto_38071 - SURFACE
      ?auto_38061 - PLACE
      ?auto_38074 - HOIST
      ?auto_38073 - SURFACE
      ?auto_38060 - SURFACE
      ?auto_38069 - PLACE
      ?auto_38067 - HOIST
      ?auto_38072 - SURFACE
      ?auto_38068 - SURFACE
      ?auto_38062 - PLACE
      ?auto_38065 - HOIST
      ?auto_38077 - SURFACE
      ?auto_38075 - TRUCK
      ?auto_38078 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38070 ?auto_38066 ) ( IS-CRATE ?auto_38058 ) ( not ( = ?auto_38058 ?auto_38059 ) ) ( not ( = ?auto_38076 ?auto_38066 ) ) ( HOIST-AT ?auto_38063 ?auto_38076 ) ( not ( = ?auto_38070 ?auto_38063 ) ) ( AVAILABLE ?auto_38063 ) ( SURFACE-AT ?auto_38058 ?auto_38076 ) ( ON ?auto_38058 ?auto_38064 ) ( CLEAR ?auto_38058 ) ( not ( = ?auto_38058 ?auto_38064 ) ) ( not ( = ?auto_38059 ?auto_38064 ) ) ( IS-CRATE ?auto_38059 ) ( not ( = ?auto_38058 ?auto_38071 ) ) ( not ( = ?auto_38059 ?auto_38071 ) ) ( not ( = ?auto_38064 ?auto_38071 ) ) ( not ( = ?auto_38061 ?auto_38066 ) ) ( not ( = ?auto_38076 ?auto_38061 ) ) ( HOIST-AT ?auto_38074 ?auto_38061 ) ( not ( = ?auto_38070 ?auto_38074 ) ) ( not ( = ?auto_38063 ?auto_38074 ) ) ( AVAILABLE ?auto_38074 ) ( SURFACE-AT ?auto_38059 ?auto_38061 ) ( ON ?auto_38059 ?auto_38073 ) ( CLEAR ?auto_38059 ) ( not ( = ?auto_38058 ?auto_38073 ) ) ( not ( = ?auto_38059 ?auto_38073 ) ) ( not ( = ?auto_38064 ?auto_38073 ) ) ( not ( = ?auto_38071 ?auto_38073 ) ) ( IS-CRATE ?auto_38071 ) ( not ( = ?auto_38058 ?auto_38060 ) ) ( not ( = ?auto_38059 ?auto_38060 ) ) ( not ( = ?auto_38064 ?auto_38060 ) ) ( not ( = ?auto_38071 ?auto_38060 ) ) ( not ( = ?auto_38073 ?auto_38060 ) ) ( not ( = ?auto_38069 ?auto_38066 ) ) ( not ( = ?auto_38076 ?auto_38069 ) ) ( not ( = ?auto_38061 ?auto_38069 ) ) ( HOIST-AT ?auto_38067 ?auto_38069 ) ( not ( = ?auto_38070 ?auto_38067 ) ) ( not ( = ?auto_38063 ?auto_38067 ) ) ( not ( = ?auto_38074 ?auto_38067 ) ) ( AVAILABLE ?auto_38067 ) ( SURFACE-AT ?auto_38071 ?auto_38069 ) ( ON ?auto_38071 ?auto_38072 ) ( CLEAR ?auto_38071 ) ( not ( = ?auto_38058 ?auto_38072 ) ) ( not ( = ?auto_38059 ?auto_38072 ) ) ( not ( = ?auto_38064 ?auto_38072 ) ) ( not ( = ?auto_38071 ?auto_38072 ) ) ( not ( = ?auto_38073 ?auto_38072 ) ) ( not ( = ?auto_38060 ?auto_38072 ) ) ( IS-CRATE ?auto_38060 ) ( not ( = ?auto_38058 ?auto_38068 ) ) ( not ( = ?auto_38059 ?auto_38068 ) ) ( not ( = ?auto_38064 ?auto_38068 ) ) ( not ( = ?auto_38071 ?auto_38068 ) ) ( not ( = ?auto_38073 ?auto_38068 ) ) ( not ( = ?auto_38060 ?auto_38068 ) ) ( not ( = ?auto_38072 ?auto_38068 ) ) ( not ( = ?auto_38062 ?auto_38066 ) ) ( not ( = ?auto_38076 ?auto_38062 ) ) ( not ( = ?auto_38061 ?auto_38062 ) ) ( not ( = ?auto_38069 ?auto_38062 ) ) ( HOIST-AT ?auto_38065 ?auto_38062 ) ( not ( = ?auto_38070 ?auto_38065 ) ) ( not ( = ?auto_38063 ?auto_38065 ) ) ( not ( = ?auto_38074 ?auto_38065 ) ) ( not ( = ?auto_38067 ?auto_38065 ) ) ( AVAILABLE ?auto_38065 ) ( SURFACE-AT ?auto_38060 ?auto_38062 ) ( ON ?auto_38060 ?auto_38077 ) ( CLEAR ?auto_38060 ) ( not ( = ?auto_38058 ?auto_38077 ) ) ( not ( = ?auto_38059 ?auto_38077 ) ) ( not ( = ?auto_38064 ?auto_38077 ) ) ( not ( = ?auto_38071 ?auto_38077 ) ) ( not ( = ?auto_38073 ?auto_38077 ) ) ( not ( = ?auto_38060 ?auto_38077 ) ) ( not ( = ?auto_38072 ?auto_38077 ) ) ( not ( = ?auto_38068 ?auto_38077 ) ) ( TRUCK-AT ?auto_38075 ?auto_38066 ) ( SURFACE-AT ?auto_38078 ?auto_38066 ) ( CLEAR ?auto_38078 ) ( LIFTING ?auto_38070 ?auto_38068 ) ( IS-CRATE ?auto_38068 ) ( not ( = ?auto_38058 ?auto_38078 ) ) ( not ( = ?auto_38059 ?auto_38078 ) ) ( not ( = ?auto_38064 ?auto_38078 ) ) ( not ( = ?auto_38071 ?auto_38078 ) ) ( not ( = ?auto_38073 ?auto_38078 ) ) ( not ( = ?auto_38060 ?auto_38078 ) ) ( not ( = ?auto_38072 ?auto_38078 ) ) ( not ( = ?auto_38068 ?auto_38078 ) ) ( not ( = ?auto_38077 ?auto_38078 ) ) )
    :subtasks
    ( ( !DROP ?auto_38070 ?auto_38068 ?auto_38078 ?auto_38066 )
      ( MAKE-ON ?auto_38058 ?auto_38059 )
      ( MAKE-ON-VERIFY ?auto_38058 ?auto_38059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38079 - SURFACE
      ?auto_38080 - SURFACE
    )
    :vars
    (
      ?auto_38090 - HOIST
      ?auto_38098 - PLACE
      ?auto_38093 - PLACE
      ?auto_38086 - HOIST
      ?auto_38087 - SURFACE
      ?auto_38094 - SURFACE
      ?auto_38099 - PLACE
      ?auto_38082 - HOIST
      ?auto_38091 - SURFACE
      ?auto_38096 - SURFACE
      ?auto_38081 - PLACE
      ?auto_38092 - HOIST
      ?auto_38083 - SURFACE
      ?auto_38095 - SURFACE
      ?auto_38085 - PLACE
      ?auto_38089 - HOIST
      ?auto_38084 - SURFACE
      ?auto_38097 - TRUCK
      ?auto_38088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38090 ?auto_38098 ) ( IS-CRATE ?auto_38079 ) ( not ( = ?auto_38079 ?auto_38080 ) ) ( not ( = ?auto_38093 ?auto_38098 ) ) ( HOIST-AT ?auto_38086 ?auto_38093 ) ( not ( = ?auto_38090 ?auto_38086 ) ) ( AVAILABLE ?auto_38086 ) ( SURFACE-AT ?auto_38079 ?auto_38093 ) ( ON ?auto_38079 ?auto_38087 ) ( CLEAR ?auto_38079 ) ( not ( = ?auto_38079 ?auto_38087 ) ) ( not ( = ?auto_38080 ?auto_38087 ) ) ( IS-CRATE ?auto_38080 ) ( not ( = ?auto_38079 ?auto_38094 ) ) ( not ( = ?auto_38080 ?auto_38094 ) ) ( not ( = ?auto_38087 ?auto_38094 ) ) ( not ( = ?auto_38099 ?auto_38098 ) ) ( not ( = ?auto_38093 ?auto_38099 ) ) ( HOIST-AT ?auto_38082 ?auto_38099 ) ( not ( = ?auto_38090 ?auto_38082 ) ) ( not ( = ?auto_38086 ?auto_38082 ) ) ( AVAILABLE ?auto_38082 ) ( SURFACE-AT ?auto_38080 ?auto_38099 ) ( ON ?auto_38080 ?auto_38091 ) ( CLEAR ?auto_38080 ) ( not ( = ?auto_38079 ?auto_38091 ) ) ( not ( = ?auto_38080 ?auto_38091 ) ) ( not ( = ?auto_38087 ?auto_38091 ) ) ( not ( = ?auto_38094 ?auto_38091 ) ) ( IS-CRATE ?auto_38094 ) ( not ( = ?auto_38079 ?auto_38096 ) ) ( not ( = ?auto_38080 ?auto_38096 ) ) ( not ( = ?auto_38087 ?auto_38096 ) ) ( not ( = ?auto_38094 ?auto_38096 ) ) ( not ( = ?auto_38091 ?auto_38096 ) ) ( not ( = ?auto_38081 ?auto_38098 ) ) ( not ( = ?auto_38093 ?auto_38081 ) ) ( not ( = ?auto_38099 ?auto_38081 ) ) ( HOIST-AT ?auto_38092 ?auto_38081 ) ( not ( = ?auto_38090 ?auto_38092 ) ) ( not ( = ?auto_38086 ?auto_38092 ) ) ( not ( = ?auto_38082 ?auto_38092 ) ) ( AVAILABLE ?auto_38092 ) ( SURFACE-AT ?auto_38094 ?auto_38081 ) ( ON ?auto_38094 ?auto_38083 ) ( CLEAR ?auto_38094 ) ( not ( = ?auto_38079 ?auto_38083 ) ) ( not ( = ?auto_38080 ?auto_38083 ) ) ( not ( = ?auto_38087 ?auto_38083 ) ) ( not ( = ?auto_38094 ?auto_38083 ) ) ( not ( = ?auto_38091 ?auto_38083 ) ) ( not ( = ?auto_38096 ?auto_38083 ) ) ( IS-CRATE ?auto_38096 ) ( not ( = ?auto_38079 ?auto_38095 ) ) ( not ( = ?auto_38080 ?auto_38095 ) ) ( not ( = ?auto_38087 ?auto_38095 ) ) ( not ( = ?auto_38094 ?auto_38095 ) ) ( not ( = ?auto_38091 ?auto_38095 ) ) ( not ( = ?auto_38096 ?auto_38095 ) ) ( not ( = ?auto_38083 ?auto_38095 ) ) ( not ( = ?auto_38085 ?auto_38098 ) ) ( not ( = ?auto_38093 ?auto_38085 ) ) ( not ( = ?auto_38099 ?auto_38085 ) ) ( not ( = ?auto_38081 ?auto_38085 ) ) ( HOIST-AT ?auto_38089 ?auto_38085 ) ( not ( = ?auto_38090 ?auto_38089 ) ) ( not ( = ?auto_38086 ?auto_38089 ) ) ( not ( = ?auto_38082 ?auto_38089 ) ) ( not ( = ?auto_38092 ?auto_38089 ) ) ( AVAILABLE ?auto_38089 ) ( SURFACE-AT ?auto_38096 ?auto_38085 ) ( ON ?auto_38096 ?auto_38084 ) ( CLEAR ?auto_38096 ) ( not ( = ?auto_38079 ?auto_38084 ) ) ( not ( = ?auto_38080 ?auto_38084 ) ) ( not ( = ?auto_38087 ?auto_38084 ) ) ( not ( = ?auto_38094 ?auto_38084 ) ) ( not ( = ?auto_38091 ?auto_38084 ) ) ( not ( = ?auto_38096 ?auto_38084 ) ) ( not ( = ?auto_38083 ?auto_38084 ) ) ( not ( = ?auto_38095 ?auto_38084 ) ) ( TRUCK-AT ?auto_38097 ?auto_38098 ) ( SURFACE-AT ?auto_38088 ?auto_38098 ) ( CLEAR ?auto_38088 ) ( IS-CRATE ?auto_38095 ) ( not ( = ?auto_38079 ?auto_38088 ) ) ( not ( = ?auto_38080 ?auto_38088 ) ) ( not ( = ?auto_38087 ?auto_38088 ) ) ( not ( = ?auto_38094 ?auto_38088 ) ) ( not ( = ?auto_38091 ?auto_38088 ) ) ( not ( = ?auto_38096 ?auto_38088 ) ) ( not ( = ?auto_38083 ?auto_38088 ) ) ( not ( = ?auto_38095 ?auto_38088 ) ) ( not ( = ?auto_38084 ?auto_38088 ) ) ( AVAILABLE ?auto_38090 ) ( IN ?auto_38095 ?auto_38097 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38090 ?auto_38095 ?auto_38097 ?auto_38098 )
      ( MAKE-ON ?auto_38079 ?auto_38080 )
      ( MAKE-ON-VERIFY ?auto_38079 ?auto_38080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38100 - SURFACE
      ?auto_38101 - SURFACE
    )
    :vars
    (
      ?auto_38103 - HOIST
      ?auto_38114 - PLACE
      ?auto_38117 - PLACE
      ?auto_38104 - HOIST
      ?auto_38105 - SURFACE
      ?auto_38112 - SURFACE
      ?auto_38115 - PLACE
      ?auto_38111 - HOIST
      ?auto_38120 - SURFACE
      ?auto_38116 - SURFACE
      ?auto_38107 - PLACE
      ?auto_38106 - HOIST
      ?auto_38108 - SURFACE
      ?auto_38110 - SURFACE
      ?auto_38118 - PLACE
      ?auto_38109 - HOIST
      ?auto_38119 - SURFACE
      ?auto_38102 - SURFACE
      ?auto_38113 - TRUCK
      ?auto_38121 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38103 ?auto_38114 ) ( IS-CRATE ?auto_38100 ) ( not ( = ?auto_38100 ?auto_38101 ) ) ( not ( = ?auto_38117 ?auto_38114 ) ) ( HOIST-AT ?auto_38104 ?auto_38117 ) ( not ( = ?auto_38103 ?auto_38104 ) ) ( AVAILABLE ?auto_38104 ) ( SURFACE-AT ?auto_38100 ?auto_38117 ) ( ON ?auto_38100 ?auto_38105 ) ( CLEAR ?auto_38100 ) ( not ( = ?auto_38100 ?auto_38105 ) ) ( not ( = ?auto_38101 ?auto_38105 ) ) ( IS-CRATE ?auto_38101 ) ( not ( = ?auto_38100 ?auto_38112 ) ) ( not ( = ?auto_38101 ?auto_38112 ) ) ( not ( = ?auto_38105 ?auto_38112 ) ) ( not ( = ?auto_38115 ?auto_38114 ) ) ( not ( = ?auto_38117 ?auto_38115 ) ) ( HOIST-AT ?auto_38111 ?auto_38115 ) ( not ( = ?auto_38103 ?auto_38111 ) ) ( not ( = ?auto_38104 ?auto_38111 ) ) ( AVAILABLE ?auto_38111 ) ( SURFACE-AT ?auto_38101 ?auto_38115 ) ( ON ?auto_38101 ?auto_38120 ) ( CLEAR ?auto_38101 ) ( not ( = ?auto_38100 ?auto_38120 ) ) ( not ( = ?auto_38101 ?auto_38120 ) ) ( not ( = ?auto_38105 ?auto_38120 ) ) ( not ( = ?auto_38112 ?auto_38120 ) ) ( IS-CRATE ?auto_38112 ) ( not ( = ?auto_38100 ?auto_38116 ) ) ( not ( = ?auto_38101 ?auto_38116 ) ) ( not ( = ?auto_38105 ?auto_38116 ) ) ( not ( = ?auto_38112 ?auto_38116 ) ) ( not ( = ?auto_38120 ?auto_38116 ) ) ( not ( = ?auto_38107 ?auto_38114 ) ) ( not ( = ?auto_38117 ?auto_38107 ) ) ( not ( = ?auto_38115 ?auto_38107 ) ) ( HOIST-AT ?auto_38106 ?auto_38107 ) ( not ( = ?auto_38103 ?auto_38106 ) ) ( not ( = ?auto_38104 ?auto_38106 ) ) ( not ( = ?auto_38111 ?auto_38106 ) ) ( AVAILABLE ?auto_38106 ) ( SURFACE-AT ?auto_38112 ?auto_38107 ) ( ON ?auto_38112 ?auto_38108 ) ( CLEAR ?auto_38112 ) ( not ( = ?auto_38100 ?auto_38108 ) ) ( not ( = ?auto_38101 ?auto_38108 ) ) ( not ( = ?auto_38105 ?auto_38108 ) ) ( not ( = ?auto_38112 ?auto_38108 ) ) ( not ( = ?auto_38120 ?auto_38108 ) ) ( not ( = ?auto_38116 ?auto_38108 ) ) ( IS-CRATE ?auto_38116 ) ( not ( = ?auto_38100 ?auto_38110 ) ) ( not ( = ?auto_38101 ?auto_38110 ) ) ( not ( = ?auto_38105 ?auto_38110 ) ) ( not ( = ?auto_38112 ?auto_38110 ) ) ( not ( = ?auto_38120 ?auto_38110 ) ) ( not ( = ?auto_38116 ?auto_38110 ) ) ( not ( = ?auto_38108 ?auto_38110 ) ) ( not ( = ?auto_38118 ?auto_38114 ) ) ( not ( = ?auto_38117 ?auto_38118 ) ) ( not ( = ?auto_38115 ?auto_38118 ) ) ( not ( = ?auto_38107 ?auto_38118 ) ) ( HOIST-AT ?auto_38109 ?auto_38118 ) ( not ( = ?auto_38103 ?auto_38109 ) ) ( not ( = ?auto_38104 ?auto_38109 ) ) ( not ( = ?auto_38111 ?auto_38109 ) ) ( not ( = ?auto_38106 ?auto_38109 ) ) ( AVAILABLE ?auto_38109 ) ( SURFACE-AT ?auto_38116 ?auto_38118 ) ( ON ?auto_38116 ?auto_38119 ) ( CLEAR ?auto_38116 ) ( not ( = ?auto_38100 ?auto_38119 ) ) ( not ( = ?auto_38101 ?auto_38119 ) ) ( not ( = ?auto_38105 ?auto_38119 ) ) ( not ( = ?auto_38112 ?auto_38119 ) ) ( not ( = ?auto_38120 ?auto_38119 ) ) ( not ( = ?auto_38116 ?auto_38119 ) ) ( not ( = ?auto_38108 ?auto_38119 ) ) ( not ( = ?auto_38110 ?auto_38119 ) ) ( SURFACE-AT ?auto_38102 ?auto_38114 ) ( CLEAR ?auto_38102 ) ( IS-CRATE ?auto_38110 ) ( not ( = ?auto_38100 ?auto_38102 ) ) ( not ( = ?auto_38101 ?auto_38102 ) ) ( not ( = ?auto_38105 ?auto_38102 ) ) ( not ( = ?auto_38112 ?auto_38102 ) ) ( not ( = ?auto_38120 ?auto_38102 ) ) ( not ( = ?auto_38116 ?auto_38102 ) ) ( not ( = ?auto_38108 ?auto_38102 ) ) ( not ( = ?auto_38110 ?auto_38102 ) ) ( not ( = ?auto_38119 ?auto_38102 ) ) ( AVAILABLE ?auto_38103 ) ( IN ?auto_38110 ?auto_38113 ) ( TRUCK-AT ?auto_38113 ?auto_38121 ) ( not ( = ?auto_38121 ?auto_38114 ) ) ( not ( = ?auto_38117 ?auto_38121 ) ) ( not ( = ?auto_38115 ?auto_38121 ) ) ( not ( = ?auto_38107 ?auto_38121 ) ) ( not ( = ?auto_38118 ?auto_38121 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38113 ?auto_38121 ?auto_38114 )
      ( MAKE-ON ?auto_38100 ?auto_38101 )
      ( MAKE-ON-VERIFY ?auto_38100 ?auto_38101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38122 - SURFACE
      ?auto_38123 - SURFACE
    )
    :vars
    (
      ?auto_38134 - HOIST
      ?auto_38135 - PLACE
      ?auto_38128 - PLACE
      ?auto_38130 - HOIST
      ?auto_38141 - SURFACE
      ?auto_38133 - SURFACE
      ?auto_38132 - PLACE
      ?auto_38138 - HOIST
      ?auto_38127 - SURFACE
      ?auto_38129 - SURFACE
      ?auto_38142 - PLACE
      ?auto_38140 - HOIST
      ?auto_38143 - SURFACE
      ?auto_38131 - SURFACE
      ?auto_38125 - PLACE
      ?auto_38136 - HOIST
      ?auto_38126 - SURFACE
      ?auto_38139 - SURFACE
      ?auto_38137 - TRUCK
      ?auto_38124 - PLACE
      ?auto_38144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38134 ?auto_38135 ) ( IS-CRATE ?auto_38122 ) ( not ( = ?auto_38122 ?auto_38123 ) ) ( not ( = ?auto_38128 ?auto_38135 ) ) ( HOIST-AT ?auto_38130 ?auto_38128 ) ( not ( = ?auto_38134 ?auto_38130 ) ) ( AVAILABLE ?auto_38130 ) ( SURFACE-AT ?auto_38122 ?auto_38128 ) ( ON ?auto_38122 ?auto_38141 ) ( CLEAR ?auto_38122 ) ( not ( = ?auto_38122 ?auto_38141 ) ) ( not ( = ?auto_38123 ?auto_38141 ) ) ( IS-CRATE ?auto_38123 ) ( not ( = ?auto_38122 ?auto_38133 ) ) ( not ( = ?auto_38123 ?auto_38133 ) ) ( not ( = ?auto_38141 ?auto_38133 ) ) ( not ( = ?auto_38132 ?auto_38135 ) ) ( not ( = ?auto_38128 ?auto_38132 ) ) ( HOIST-AT ?auto_38138 ?auto_38132 ) ( not ( = ?auto_38134 ?auto_38138 ) ) ( not ( = ?auto_38130 ?auto_38138 ) ) ( AVAILABLE ?auto_38138 ) ( SURFACE-AT ?auto_38123 ?auto_38132 ) ( ON ?auto_38123 ?auto_38127 ) ( CLEAR ?auto_38123 ) ( not ( = ?auto_38122 ?auto_38127 ) ) ( not ( = ?auto_38123 ?auto_38127 ) ) ( not ( = ?auto_38141 ?auto_38127 ) ) ( not ( = ?auto_38133 ?auto_38127 ) ) ( IS-CRATE ?auto_38133 ) ( not ( = ?auto_38122 ?auto_38129 ) ) ( not ( = ?auto_38123 ?auto_38129 ) ) ( not ( = ?auto_38141 ?auto_38129 ) ) ( not ( = ?auto_38133 ?auto_38129 ) ) ( not ( = ?auto_38127 ?auto_38129 ) ) ( not ( = ?auto_38142 ?auto_38135 ) ) ( not ( = ?auto_38128 ?auto_38142 ) ) ( not ( = ?auto_38132 ?auto_38142 ) ) ( HOIST-AT ?auto_38140 ?auto_38142 ) ( not ( = ?auto_38134 ?auto_38140 ) ) ( not ( = ?auto_38130 ?auto_38140 ) ) ( not ( = ?auto_38138 ?auto_38140 ) ) ( AVAILABLE ?auto_38140 ) ( SURFACE-AT ?auto_38133 ?auto_38142 ) ( ON ?auto_38133 ?auto_38143 ) ( CLEAR ?auto_38133 ) ( not ( = ?auto_38122 ?auto_38143 ) ) ( not ( = ?auto_38123 ?auto_38143 ) ) ( not ( = ?auto_38141 ?auto_38143 ) ) ( not ( = ?auto_38133 ?auto_38143 ) ) ( not ( = ?auto_38127 ?auto_38143 ) ) ( not ( = ?auto_38129 ?auto_38143 ) ) ( IS-CRATE ?auto_38129 ) ( not ( = ?auto_38122 ?auto_38131 ) ) ( not ( = ?auto_38123 ?auto_38131 ) ) ( not ( = ?auto_38141 ?auto_38131 ) ) ( not ( = ?auto_38133 ?auto_38131 ) ) ( not ( = ?auto_38127 ?auto_38131 ) ) ( not ( = ?auto_38129 ?auto_38131 ) ) ( not ( = ?auto_38143 ?auto_38131 ) ) ( not ( = ?auto_38125 ?auto_38135 ) ) ( not ( = ?auto_38128 ?auto_38125 ) ) ( not ( = ?auto_38132 ?auto_38125 ) ) ( not ( = ?auto_38142 ?auto_38125 ) ) ( HOIST-AT ?auto_38136 ?auto_38125 ) ( not ( = ?auto_38134 ?auto_38136 ) ) ( not ( = ?auto_38130 ?auto_38136 ) ) ( not ( = ?auto_38138 ?auto_38136 ) ) ( not ( = ?auto_38140 ?auto_38136 ) ) ( AVAILABLE ?auto_38136 ) ( SURFACE-AT ?auto_38129 ?auto_38125 ) ( ON ?auto_38129 ?auto_38126 ) ( CLEAR ?auto_38129 ) ( not ( = ?auto_38122 ?auto_38126 ) ) ( not ( = ?auto_38123 ?auto_38126 ) ) ( not ( = ?auto_38141 ?auto_38126 ) ) ( not ( = ?auto_38133 ?auto_38126 ) ) ( not ( = ?auto_38127 ?auto_38126 ) ) ( not ( = ?auto_38129 ?auto_38126 ) ) ( not ( = ?auto_38143 ?auto_38126 ) ) ( not ( = ?auto_38131 ?auto_38126 ) ) ( SURFACE-AT ?auto_38139 ?auto_38135 ) ( CLEAR ?auto_38139 ) ( IS-CRATE ?auto_38131 ) ( not ( = ?auto_38122 ?auto_38139 ) ) ( not ( = ?auto_38123 ?auto_38139 ) ) ( not ( = ?auto_38141 ?auto_38139 ) ) ( not ( = ?auto_38133 ?auto_38139 ) ) ( not ( = ?auto_38127 ?auto_38139 ) ) ( not ( = ?auto_38129 ?auto_38139 ) ) ( not ( = ?auto_38143 ?auto_38139 ) ) ( not ( = ?auto_38131 ?auto_38139 ) ) ( not ( = ?auto_38126 ?auto_38139 ) ) ( AVAILABLE ?auto_38134 ) ( TRUCK-AT ?auto_38137 ?auto_38124 ) ( not ( = ?auto_38124 ?auto_38135 ) ) ( not ( = ?auto_38128 ?auto_38124 ) ) ( not ( = ?auto_38132 ?auto_38124 ) ) ( not ( = ?auto_38142 ?auto_38124 ) ) ( not ( = ?auto_38125 ?auto_38124 ) ) ( HOIST-AT ?auto_38144 ?auto_38124 ) ( LIFTING ?auto_38144 ?auto_38131 ) ( not ( = ?auto_38134 ?auto_38144 ) ) ( not ( = ?auto_38130 ?auto_38144 ) ) ( not ( = ?auto_38138 ?auto_38144 ) ) ( not ( = ?auto_38140 ?auto_38144 ) ) ( not ( = ?auto_38136 ?auto_38144 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38144 ?auto_38131 ?auto_38137 ?auto_38124 )
      ( MAKE-ON ?auto_38122 ?auto_38123 )
      ( MAKE-ON-VERIFY ?auto_38122 ?auto_38123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38145 - SURFACE
      ?auto_38146 - SURFACE
    )
    :vars
    (
      ?auto_38149 - HOIST
      ?auto_38157 - PLACE
      ?auto_38152 - PLACE
      ?auto_38163 - HOIST
      ?auto_38148 - SURFACE
      ?auto_38159 - SURFACE
      ?auto_38164 - PLACE
      ?auto_38147 - HOIST
      ?auto_38162 - SURFACE
      ?auto_38156 - SURFACE
      ?auto_38165 - PLACE
      ?auto_38151 - HOIST
      ?auto_38153 - SURFACE
      ?auto_38167 - SURFACE
      ?auto_38155 - PLACE
      ?auto_38160 - HOIST
      ?auto_38161 - SURFACE
      ?auto_38166 - SURFACE
      ?auto_38158 - TRUCK
      ?auto_38150 - PLACE
      ?auto_38154 - HOIST
      ?auto_38168 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38149 ?auto_38157 ) ( IS-CRATE ?auto_38145 ) ( not ( = ?auto_38145 ?auto_38146 ) ) ( not ( = ?auto_38152 ?auto_38157 ) ) ( HOIST-AT ?auto_38163 ?auto_38152 ) ( not ( = ?auto_38149 ?auto_38163 ) ) ( AVAILABLE ?auto_38163 ) ( SURFACE-AT ?auto_38145 ?auto_38152 ) ( ON ?auto_38145 ?auto_38148 ) ( CLEAR ?auto_38145 ) ( not ( = ?auto_38145 ?auto_38148 ) ) ( not ( = ?auto_38146 ?auto_38148 ) ) ( IS-CRATE ?auto_38146 ) ( not ( = ?auto_38145 ?auto_38159 ) ) ( not ( = ?auto_38146 ?auto_38159 ) ) ( not ( = ?auto_38148 ?auto_38159 ) ) ( not ( = ?auto_38164 ?auto_38157 ) ) ( not ( = ?auto_38152 ?auto_38164 ) ) ( HOIST-AT ?auto_38147 ?auto_38164 ) ( not ( = ?auto_38149 ?auto_38147 ) ) ( not ( = ?auto_38163 ?auto_38147 ) ) ( AVAILABLE ?auto_38147 ) ( SURFACE-AT ?auto_38146 ?auto_38164 ) ( ON ?auto_38146 ?auto_38162 ) ( CLEAR ?auto_38146 ) ( not ( = ?auto_38145 ?auto_38162 ) ) ( not ( = ?auto_38146 ?auto_38162 ) ) ( not ( = ?auto_38148 ?auto_38162 ) ) ( not ( = ?auto_38159 ?auto_38162 ) ) ( IS-CRATE ?auto_38159 ) ( not ( = ?auto_38145 ?auto_38156 ) ) ( not ( = ?auto_38146 ?auto_38156 ) ) ( not ( = ?auto_38148 ?auto_38156 ) ) ( not ( = ?auto_38159 ?auto_38156 ) ) ( not ( = ?auto_38162 ?auto_38156 ) ) ( not ( = ?auto_38165 ?auto_38157 ) ) ( not ( = ?auto_38152 ?auto_38165 ) ) ( not ( = ?auto_38164 ?auto_38165 ) ) ( HOIST-AT ?auto_38151 ?auto_38165 ) ( not ( = ?auto_38149 ?auto_38151 ) ) ( not ( = ?auto_38163 ?auto_38151 ) ) ( not ( = ?auto_38147 ?auto_38151 ) ) ( AVAILABLE ?auto_38151 ) ( SURFACE-AT ?auto_38159 ?auto_38165 ) ( ON ?auto_38159 ?auto_38153 ) ( CLEAR ?auto_38159 ) ( not ( = ?auto_38145 ?auto_38153 ) ) ( not ( = ?auto_38146 ?auto_38153 ) ) ( not ( = ?auto_38148 ?auto_38153 ) ) ( not ( = ?auto_38159 ?auto_38153 ) ) ( not ( = ?auto_38162 ?auto_38153 ) ) ( not ( = ?auto_38156 ?auto_38153 ) ) ( IS-CRATE ?auto_38156 ) ( not ( = ?auto_38145 ?auto_38167 ) ) ( not ( = ?auto_38146 ?auto_38167 ) ) ( not ( = ?auto_38148 ?auto_38167 ) ) ( not ( = ?auto_38159 ?auto_38167 ) ) ( not ( = ?auto_38162 ?auto_38167 ) ) ( not ( = ?auto_38156 ?auto_38167 ) ) ( not ( = ?auto_38153 ?auto_38167 ) ) ( not ( = ?auto_38155 ?auto_38157 ) ) ( not ( = ?auto_38152 ?auto_38155 ) ) ( not ( = ?auto_38164 ?auto_38155 ) ) ( not ( = ?auto_38165 ?auto_38155 ) ) ( HOIST-AT ?auto_38160 ?auto_38155 ) ( not ( = ?auto_38149 ?auto_38160 ) ) ( not ( = ?auto_38163 ?auto_38160 ) ) ( not ( = ?auto_38147 ?auto_38160 ) ) ( not ( = ?auto_38151 ?auto_38160 ) ) ( AVAILABLE ?auto_38160 ) ( SURFACE-AT ?auto_38156 ?auto_38155 ) ( ON ?auto_38156 ?auto_38161 ) ( CLEAR ?auto_38156 ) ( not ( = ?auto_38145 ?auto_38161 ) ) ( not ( = ?auto_38146 ?auto_38161 ) ) ( not ( = ?auto_38148 ?auto_38161 ) ) ( not ( = ?auto_38159 ?auto_38161 ) ) ( not ( = ?auto_38162 ?auto_38161 ) ) ( not ( = ?auto_38156 ?auto_38161 ) ) ( not ( = ?auto_38153 ?auto_38161 ) ) ( not ( = ?auto_38167 ?auto_38161 ) ) ( SURFACE-AT ?auto_38166 ?auto_38157 ) ( CLEAR ?auto_38166 ) ( IS-CRATE ?auto_38167 ) ( not ( = ?auto_38145 ?auto_38166 ) ) ( not ( = ?auto_38146 ?auto_38166 ) ) ( not ( = ?auto_38148 ?auto_38166 ) ) ( not ( = ?auto_38159 ?auto_38166 ) ) ( not ( = ?auto_38162 ?auto_38166 ) ) ( not ( = ?auto_38156 ?auto_38166 ) ) ( not ( = ?auto_38153 ?auto_38166 ) ) ( not ( = ?auto_38167 ?auto_38166 ) ) ( not ( = ?auto_38161 ?auto_38166 ) ) ( AVAILABLE ?auto_38149 ) ( TRUCK-AT ?auto_38158 ?auto_38150 ) ( not ( = ?auto_38150 ?auto_38157 ) ) ( not ( = ?auto_38152 ?auto_38150 ) ) ( not ( = ?auto_38164 ?auto_38150 ) ) ( not ( = ?auto_38165 ?auto_38150 ) ) ( not ( = ?auto_38155 ?auto_38150 ) ) ( HOIST-AT ?auto_38154 ?auto_38150 ) ( not ( = ?auto_38149 ?auto_38154 ) ) ( not ( = ?auto_38163 ?auto_38154 ) ) ( not ( = ?auto_38147 ?auto_38154 ) ) ( not ( = ?auto_38151 ?auto_38154 ) ) ( not ( = ?auto_38160 ?auto_38154 ) ) ( AVAILABLE ?auto_38154 ) ( SURFACE-AT ?auto_38167 ?auto_38150 ) ( ON ?auto_38167 ?auto_38168 ) ( CLEAR ?auto_38167 ) ( not ( = ?auto_38145 ?auto_38168 ) ) ( not ( = ?auto_38146 ?auto_38168 ) ) ( not ( = ?auto_38148 ?auto_38168 ) ) ( not ( = ?auto_38159 ?auto_38168 ) ) ( not ( = ?auto_38162 ?auto_38168 ) ) ( not ( = ?auto_38156 ?auto_38168 ) ) ( not ( = ?auto_38153 ?auto_38168 ) ) ( not ( = ?auto_38167 ?auto_38168 ) ) ( not ( = ?auto_38161 ?auto_38168 ) ) ( not ( = ?auto_38166 ?auto_38168 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38154 ?auto_38167 ?auto_38168 ?auto_38150 )
      ( MAKE-ON ?auto_38145 ?auto_38146 )
      ( MAKE-ON-VERIFY ?auto_38145 ?auto_38146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38169 - SURFACE
      ?auto_38170 - SURFACE
    )
    :vars
    (
      ?auto_38192 - HOIST
      ?auto_38177 - PLACE
      ?auto_38175 - PLACE
      ?auto_38176 - HOIST
      ?auto_38174 - SURFACE
      ?auto_38184 - SURFACE
      ?auto_38178 - PLACE
      ?auto_38189 - HOIST
      ?auto_38172 - SURFACE
      ?auto_38183 - SURFACE
      ?auto_38171 - PLACE
      ?auto_38190 - HOIST
      ?auto_38179 - SURFACE
      ?auto_38187 - SURFACE
      ?auto_38188 - PLACE
      ?auto_38191 - HOIST
      ?auto_38185 - SURFACE
      ?auto_38180 - SURFACE
      ?auto_38182 - PLACE
      ?auto_38186 - HOIST
      ?auto_38181 - SURFACE
      ?auto_38173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38192 ?auto_38177 ) ( IS-CRATE ?auto_38169 ) ( not ( = ?auto_38169 ?auto_38170 ) ) ( not ( = ?auto_38175 ?auto_38177 ) ) ( HOIST-AT ?auto_38176 ?auto_38175 ) ( not ( = ?auto_38192 ?auto_38176 ) ) ( AVAILABLE ?auto_38176 ) ( SURFACE-AT ?auto_38169 ?auto_38175 ) ( ON ?auto_38169 ?auto_38174 ) ( CLEAR ?auto_38169 ) ( not ( = ?auto_38169 ?auto_38174 ) ) ( not ( = ?auto_38170 ?auto_38174 ) ) ( IS-CRATE ?auto_38170 ) ( not ( = ?auto_38169 ?auto_38184 ) ) ( not ( = ?auto_38170 ?auto_38184 ) ) ( not ( = ?auto_38174 ?auto_38184 ) ) ( not ( = ?auto_38178 ?auto_38177 ) ) ( not ( = ?auto_38175 ?auto_38178 ) ) ( HOIST-AT ?auto_38189 ?auto_38178 ) ( not ( = ?auto_38192 ?auto_38189 ) ) ( not ( = ?auto_38176 ?auto_38189 ) ) ( AVAILABLE ?auto_38189 ) ( SURFACE-AT ?auto_38170 ?auto_38178 ) ( ON ?auto_38170 ?auto_38172 ) ( CLEAR ?auto_38170 ) ( not ( = ?auto_38169 ?auto_38172 ) ) ( not ( = ?auto_38170 ?auto_38172 ) ) ( not ( = ?auto_38174 ?auto_38172 ) ) ( not ( = ?auto_38184 ?auto_38172 ) ) ( IS-CRATE ?auto_38184 ) ( not ( = ?auto_38169 ?auto_38183 ) ) ( not ( = ?auto_38170 ?auto_38183 ) ) ( not ( = ?auto_38174 ?auto_38183 ) ) ( not ( = ?auto_38184 ?auto_38183 ) ) ( not ( = ?auto_38172 ?auto_38183 ) ) ( not ( = ?auto_38171 ?auto_38177 ) ) ( not ( = ?auto_38175 ?auto_38171 ) ) ( not ( = ?auto_38178 ?auto_38171 ) ) ( HOIST-AT ?auto_38190 ?auto_38171 ) ( not ( = ?auto_38192 ?auto_38190 ) ) ( not ( = ?auto_38176 ?auto_38190 ) ) ( not ( = ?auto_38189 ?auto_38190 ) ) ( AVAILABLE ?auto_38190 ) ( SURFACE-AT ?auto_38184 ?auto_38171 ) ( ON ?auto_38184 ?auto_38179 ) ( CLEAR ?auto_38184 ) ( not ( = ?auto_38169 ?auto_38179 ) ) ( not ( = ?auto_38170 ?auto_38179 ) ) ( not ( = ?auto_38174 ?auto_38179 ) ) ( not ( = ?auto_38184 ?auto_38179 ) ) ( not ( = ?auto_38172 ?auto_38179 ) ) ( not ( = ?auto_38183 ?auto_38179 ) ) ( IS-CRATE ?auto_38183 ) ( not ( = ?auto_38169 ?auto_38187 ) ) ( not ( = ?auto_38170 ?auto_38187 ) ) ( not ( = ?auto_38174 ?auto_38187 ) ) ( not ( = ?auto_38184 ?auto_38187 ) ) ( not ( = ?auto_38172 ?auto_38187 ) ) ( not ( = ?auto_38183 ?auto_38187 ) ) ( not ( = ?auto_38179 ?auto_38187 ) ) ( not ( = ?auto_38188 ?auto_38177 ) ) ( not ( = ?auto_38175 ?auto_38188 ) ) ( not ( = ?auto_38178 ?auto_38188 ) ) ( not ( = ?auto_38171 ?auto_38188 ) ) ( HOIST-AT ?auto_38191 ?auto_38188 ) ( not ( = ?auto_38192 ?auto_38191 ) ) ( not ( = ?auto_38176 ?auto_38191 ) ) ( not ( = ?auto_38189 ?auto_38191 ) ) ( not ( = ?auto_38190 ?auto_38191 ) ) ( AVAILABLE ?auto_38191 ) ( SURFACE-AT ?auto_38183 ?auto_38188 ) ( ON ?auto_38183 ?auto_38185 ) ( CLEAR ?auto_38183 ) ( not ( = ?auto_38169 ?auto_38185 ) ) ( not ( = ?auto_38170 ?auto_38185 ) ) ( not ( = ?auto_38174 ?auto_38185 ) ) ( not ( = ?auto_38184 ?auto_38185 ) ) ( not ( = ?auto_38172 ?auto_38185 ) ) ( not ( = ?auto_38183 ?auto_38185 ) ) ( not ( = ?auto_38179 ?auto_38185 ) ) ( not ( = ?auto_38187 ?auto_38185 ) ) ( SURFACE-AT ?auto_38180 ?auto_38177 ) ( CLEAR ?auto_38180 ) ( IS-CRATE ?auto_38187 ) ( not ( = ?auto_38169 ?auto_38180 ) ) ( not ( = ?auto_38170 ?auto_38180 ) ) ( not ( = ?auto_38174 ?auto_38180 ) ) ( not ( = ?auto_38184 ?auto_38180 ) ) ( not ( = ?auto_38172 ?auto_38180 ) ) ( not ( = ?auto_38183 ?auto_38180 ) ) ( not ( = ?auto_38179 ?auto_38180 ) ) ( not ( = ?auto_38187 ?auto_38180 ) ) ( not ( = ?auto_38185 ?auto_38180 ) ) ( AVAILABLE ?auto_38192 ) ( not ( = ?auto_38182 ?auto_38177 ) ) ( not ( = ?auto_38175 ?auto_38182 ) ) ( not ( = ?auto_38178 ?auto_38182 ) ) ( not ( = ?auto_38171 ?auto_38182 ) ) ( not ( = ?auto_38188 ?auto_38182 ) ) ( HOIST-AT ?auto_38186 ?auto_38182 ) ( not ( = ?auto_38192 ?auto_38186 ) ) ( not ( = ?auto_38176 ?auto_38186 ) ) ( not ( = ?auto_38189 ?auto_38186 ) ) ( not ( = ?auto_38190 ?auto_38186 ) ) ( not ( = ?auto_38191 ?auto_38186 ) ) ( AVAILABLE ?auto_38186 ) ( SURFACE-AT ?auto_38187 ?auto_38182 ) ( ON ?auto_38187 ?auto_38181 ) ( CLEAR ?auto_38187 ) ( not ( = ?auto_38169 ?auto_38181 ) ) ( not ( = ?auto_38170 ?auto_38181 ) ) ( not ( = ?auto_38174 ?auto_38181 ) ) ( not ( = ?auto_38184 ?auto_38181 ) ) ( not ( = ?auto_38172 ?auto_38181 ) ) ( not ( = ?auto_38183 ?auto_38181 ) ) ( not ( = ?auto_38179 ?auto_38181 ) ) ( not ( = ?auto_38187 ?auto_38181 ) ) ( not ( = ?auto_38185 ?auto_38181 ) ) ( not ( = ?auto_38180 ?auto_38181 ) ) ( TRUCK-AT ?auto_38173 ?auto_38177 ) )
    :subtasks
    ( ( !DRIVE ?auto_38173 ?auto_38177 ?auto_38182 )
      ( MAKE-ON ?auto_38169 ?auto_38170 )
      ( MAKE-ON-VERIFY ?auto_38169 ?auto_38170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38193 - SURFACE
      ?auto_38194 - SURFACE
    )
    :vars
    (
      ?auto_38203 - HOIST
      ?auto_38209 - PLACE
      ?auto_38216 - PLACE
      ?auto_38201 - HOIST
      ?auto_38211 - SURFACE
      ?auto_38210 - SURFACE
      ?auto_38196 - PLACE
      ?auto_38199 - HOIST
      ?auto_38195 - SURFACE
      ?auto_38212 - SURFACE
      ?auto_38204 - PLACE
      ?auto_38200 - HOIST
      ?auto_38213 - SURFACE
      ?auto_38197 - SURFACE
      ?auto_38198 - PLACE
      ?auto_38202 - HOIST
      ?auto_38205 - SURFACE
      ?auto_38215 - SURFACE
      ?auto_38214 - PLACE
      ?auto_38206 - HOIST
      ?auto_38207 - SURFACE
      ?auto_38208 - TRUCK
      ?auto_38217 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38203 ?auto_38209 ) ( IS-CRATE ?auto_38193 ) ( not ( = ?auto_38193 ?auto_38194 ) ) ( not ( = ?auto_38216 ?auto_38209 ) ) ( HOIST-AT ?auto_38201 ?auto_38216 ) ( not ( = ?auto_38203 ?auto_38201 ) ) ( AVAILABLE ?auto_38201 ) ( SURFACE-AT ?auto_38193 ?auto_38216 ) ( ON ?auto_38193 ?auto_38211 ) ( CLEAR ?auto_38193 ) ( not ( = ?auto_38193 ?auto_38211 ) ) ( not ( = ?auto_38194 ?auto_38211 ) ) ( IS-CRATE ?auto_38194 ) ( not ( = ?auto_38193 ?auto_38210 ) ) ( not ( = ?auto_38194 ?auto_38210 ) ) ( not ( = ?auto_38211 ?auto_38210 ) ) ( not ( = ?auto_38196 ?auto_38209 ) ) ( not ( = ?auto_38216 ?auto_38196 ) ) ( HOIST-AT ?auto_38199 ?auto_38196 ) ( not ( = ?auto_38203 ?auto_38199 ) ) ( not ( = ?auto_38201 ?auto_38199 ) ) ( AVAILABLE ?auto_38199 ) ( SURFACE-AT ?auto_38194 ?auto_38196 ) ( ON ?auto_38194 ?auto_38195 ) ( CLEAR ?auto_38194 ) ( not ( = ?auto_38193 ?auto_38195 ) ) ( not ( = ?auto_38194 ?auto_38195 ) ) ( not ( = ?auto_38211 ?auto_38195 ) ) ( not ( = ?auto_38210 ?auto_38195 ) ) ( IS-CRATE ?auto_38210 ) ( not ( = ?auto_38193 ?auto_38212 ) ) ( not ( = ?auto_38194 ?auto_38212 ) ) ( not ( = ?auto_38211 ?auto_38212 ) ) ( not ( = ?auto_38210 ?auto_38212 ) ) ( not ( = ?auto_38195 ?auto_38212 ) ) ( not ( = ?auto_38204 ?auto_38209 ) ) ( not ( = ?auto_38216 ?auto_38204 ) ) ( not ( = ?auto_38196 ?auto_38204 ) ) ( HOIST-AT ?auto_38200 ?auto_38204 ) ( not ( = ?auto_38203 ?auto_38200 ) ) ( not ( = ?auto_38201 ?auto_38200 ) ) ( not ( = ?auto_38199 ?auto_38200 ) ) ( AVAILABLE ?auto_38200 ) ( SURFACE-AT ?auto_38210 ?auto_38204 ) ( ON ?auto_38210 ?auto_38213 ) ( CLEAR ?auto_38210 ) ( not ( = ?auto_38193 ?auto_38213 ) ) ( not ( = ?auto_38194 ?auto_38213 ) ) ( not ( = ?auto_38211 ?auto_38213 ) ) ( not ( = ?auto_38210 ?auto_38213 ) ) ( not ( = ?auto_38195 ?auto_38213 ) ) ( not ( = ?auto_38212 ?auto_38213 ) ) ( IS-CRATE ?auto_38212 ) ( not ( = ?auto_38193 ?auto_38197 ) ) ( not ( = ?auto_38194 ?auto_38197 ) ) ( not ( = ?auto_38211 ?auto_38197 ) ) ( not ( = ?auto_38210 ?auto_38197 ) ) ( not ( = ?auto_38195 ?auto_38197 ) ) ( not ( = ?auto_38212 ?auto_38197 ) ) ( not ( = ?auto_38213 ?auto_38197 ) ) ( not ( = ?auto_38198 ?auto_38209 ) ) ( not ( = ?auto_38216 ?auto_38198 ) ) ( not ( = ?auto_38196 ?auto_38198 ) ) ( not ( = ?auto_38204 ?auto_38198 ) ) ( HOIST-AT ?auto_38202 ?auto_38198 ) ( not ( = ?auto_38203 ?auto_38202 ) ) ( not ( = ?auto_38201 ?auto_38202 ) ) ( not ( = ?auto_38199 ?auto_38202 ) ) ( not ( = ?auto_38200 ?auto_38202 ) ) ( AVAILABLE ?auto_38202 ) ( SURFACE-AT ?auto_38212 ?auto_38198 ) ( ON ?auto_38212 ?auto_38205 ) ( CLEAR ?auto_38212 ) ( not ( = ?auto_38193 ?auto_38205 ) ) ( not ( = ?auto_38194 ?auto_38205 ) ) ( not ( = ?auto_38211 ?auto_38205 ) ) ( not ( = ?auto_38210 ?auto_38205 ) ) ( not ( = ?auto_38195 ?auto_38205 ) ) ( not ( = ?auto_38212 ?auto_38205 ) ) ( not ( = ?auto_38213 ?auto_38205 ) ) ( not ( = ?auto_38197 ?auto_38205 ) ) ( IS-CRATE ?auto_38197 ) ( not ( = ?auto_38193 ?auto_38215 ) ) ( not ( = ?auto_38194 ?auto_38215 ) ) ( not ( = ?auto_38211 ?auto_38215 ) ) ( not ( = ?auto_38210 ?auto_38215 ) ) ( not ( = ?auto_38195 ?auto_38215 ) ) ( not ( = ?auto_38212 ?auto_38215 ) ) ( not ( = ?auto_38213 ?auto_38215 ) ) ( not ( = ?auto_38197 ?auto_38215 ) ) ( not ( = ?auto_38205 ?auto_38215 ) ) ( not ( = ?auto_38214 ?auto_38209 ) ) ( not ( = ?auto_38216 ?auto_38214 ) ) ( not ( = ?auto_38196 ?auto_38214 ) ) ( not ( = ?auto_38204 ?auto_38214 ) ) ( not ( = ?auto_38198 ?auto_38214 ) ) ( HOIST-AT ?auto_38206 ?auto_38214 ) ( not ( = ?auto_38203 ?auto_38206 ) ) ( not ( = ?auto_38201 ?auto_38206 ) ) ( not ( = ?auto_38199 ?auto_38206 ) ) ( not ( = ?auto_38200 ?auto_38206 ) ) ( not ( = ?auto_38202 ?auto_38206 ) ) ( AVAILABLE ?auto_38206 ) ( SURFACE-AT ?auto_38197 ?auto_38214 ) ( ON ?auto_38197 ?auto_38207 ) ( CLEAR ?auto_38197 ) ( not ( = ?auto_38193 ?auto_38207 ) ) ( not ( = ?auto_38194 ?auto_38207 ) ) ( not ( = ?auto_38211 ?auto_38207 ) ) ( not ( = ?auto_38210 ?auto_38207 ) ) ( not ( = ?auto_38195 ?auto_38207 ) ) ( not ( = ?auto_38212 ?auto_38207 ) ) ( not ( = ?auto_38213 ?auto_38207 ) ) ( not ( = ?auto_38197 ?auto_38207 ) ) ( not ( = ?auto_38205 ?auto_38207 ) ) ( not ( = ?auto_38215 ?auto_38207 ) ) ( TRUCK-AT ?auto_38208 ?auto_38209 ) ( SURFACE-AT ?auto_38217 ?auto_38209 ) ( CLEAR ?auto_38217 ) ( LIFTING ?auto_38203 ?auto_38215 ) ( IS-CRATE ?auto_38215 ) ( not ( = ?auto_38193 ?auto_38217 ) ) ( not ( = ?auto_38194 ?auto_38217 ) ) ( not ( = ?auto_38211 ?auto_38217 ) ) ( not ( = ?auto_38210 ?auto_38217 ) ) ( not ( = ?auto_38195 ?auto_38217 ) ) ( not ( = ?auto_38212 ?auto_38217 ) ) ( not ( = ?auto_38213 ?auto_38217 ) ) ( not ( = ?auto_38197 ?auto_38217 ) ) ( not ( = ?auto_38205 ?auto_38217 ) ) ( not ( = ?auto_38215 ?auto_38217 ) ) ( not ( = ?auto_38207 ?auto_38217 ) ) )
    :subtasks
    ( ( !DROP ?auto_38203 ?auto_38215 ?auto_38217 ?auto_38209 )
      ( MAKE-ON ?auto_38193 ?auto_38194 )
      ( MAKE-ON-VERIFY ?auto_38193 ?auto_38194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38218 - SURFACE
      ?auto_38219 - SURFACE
    )
    :vars
    (
      ?auto_38231 - HOIST
      ?auto_38220 - PLACE
      ?auto_38241 - PLACE
      ?auto_38224 - HOIST
      ?auto_38222 - SURFACE
      ?auto_38234 - SURFACE
      ?auto_38226 - PLACE
      ?auto_38227 - HOIST
      ?auto_38242 - SURFACE
      ?auto_38221 - SURFACE
      ?auto_38236 - PLACE
      ?auto_38238 - HOIST
      ?auto_38232 - SURFACE
      ?auto_38230 - SURFACE
      ?auto_38223 - PLACE
      ?auto_38237 - HOIST
      ?auto_38235 - SURFACE
      ?auto_38240 - SURFACE
      ?auto_38233 - PLACE
      ?auto_38225 - HOIST
      ?auto_38239 - SURFACE
      ?auto_38228 - TRUCK
      ?auto_38229 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38231 ?auto_38220 ) ( IS-CRATE ?auto_38218 ) ( not ( = ?auto_38218 ?auto_38219 ) ) ( not ( = ?auto_38241 ?auto_38220 ) ) ( HOIST-AT ?auto_38224 ?auto_38241 ) ( not ( = ?auto_38231 ?auto_38224 ) ) ( AVAILABLE ?auto_38224 ) ( SURFACE-AT ?auto_38218 ?auto_38241 ) ( ON ?auto_38218 ?auto_38222 ) ( CLEAR ?auto_38218 ) ( not ( = ?auto_38218 ?auto_38222 ) ) ( not ( = ?auto_38219 ?auto_38222 ) ) ( IS-CRATE ?auto_38219 ) ( not ( = ?auto_38218 ?auto_38234 ) ) ( not ( = ?auto_38219 ?auto_38234 ) ) ( not ( = ?auto_38222 ?auto_38234 ) ) ( not ( = ?auto_38226 ?auto_38220 ) ) ( not ( = ?auto_38241 ?auto_38226 ) ) ( HOIST-AT ?auto_38227 ?auto_38226 ) ( not ( = ?auto_38231 ?auto_38227 ) ) ( not ( = ?auto_38224 ?auto_38227 ) ) ( AVAILABLE ?auto_38227 ) ( SURFACE-AT ?auto_38219 ?auto_38226 ) ( ON ?auto_38219 ?auto_38242 ) ( CLEAR ?auto_38219 ) ( not ( = ?auto_38218 ?auto_38242 ) ) ( not ( = ?auto_38219 ?auto_38242 ) ) ( not ( = ?auto_38222 ?auto_38242 ) ) ( not ( = ?auto_38234 ?auto_38242 ) ) ( IS-CRATE ?auto_38234 ) ( not ( = ?auto_38218 ?auto_38221 ) ) ( not ( = ?auto_38219 ?auto_38221 ) ) ( not ( = ?auto_38222 ?auto_38221 ) ) ( not ( = ?auto_38234 ?auto_38221 ) ) ( not ( = ?auto_38242 ?auto_38221 ) ) ( not ( = ?auto_38236 ?auto_38220 ) ) ( not ( = ?auto_38241 ?auto_38236 ) ) ( not ( = ?auto_38226 ?auto_38236 ) ) ( HOIST-AT ?auto_38238 ?auto_38236 ) ( not ( = ?auto_38231 ?auto_38238 ) ) ( not ( = ?auto_38224 ?auto_38238 ) ) ( not ( = ?auto_38227 ?auto_38238 ) ) ( AVAILABLE ?auto_38238 ) ( SURFACE-AT ?auto_38234 ?auto_38236 ) ( ON ?auto_38234 ?auto_38232 ) ( CLEAR ?auto_38234 ) ( not ( = ?auto_38218 ?auto_38232 ) ) ( not ( = ?auto_38219 ?auto_38232 ) ) ( not ( = ?auto_38222 ?auto_38232 ) ) ( not ( = ?auto_38234 ?auto_38232 ) ) ( not ( = ?auto_38242 ?auto_38232 ) ) ( not ( = ?auto_38221 ?auto_38232 ) ) ( IS-CRATE ?auto_38221 ) ( not ( = ?auto_38218 ?auto_38230 ) ) ( not ( = ?auto_38219 ?auto_38230 ) ) ( not ( = ?auto_38222 ?auto_38230 ) ) ( not ( = ?auto_38234 ?auto_38230 ) ) ( not ( = ?auto_38242 ?auto_38230 ) ) ( not ( = ?auto_38221 ?auto_38230 ) ) ( not ( = ?auto_38232 ?auto_38230 ) ) ( not ( = ?auto_38223 ?auto_38220 ) ) ( not ( = ?auto_38241 ?auto_38223 ) ) ( not ( = ?auto_38226 ?auto_38223 ) ) ( not ( = ?auto_38236 ?auto_38223 ) ) ( HOIST-AT ?auto_38237 ?auto_38223 ) ( not ( = ?auto_38231 ?auto_38237 ) ) ( not ( = ?auto_38224 ?auto_38237 ) ) ( not ( = ?auto_38227 ?auto_38237 ) ) ( not ( = ?auto_38238 ?auto_38237 ) ) ( AVAILABLE ?auto_38237 ) ( SURFACE-AT ?auto_38221 ?auto_38223 ) ( ON ?auto_38221 ?auto_38235 ) ( CLEAR ?auto_38221 ) ( not ( = ?auto_38218 ?auto_38235 ) ) ( not ( = ?auto_38219 ?auto_38235 ) ) ( not ( = ?auto_38222 ?auto_38235 ) ) ( not ( = ?auto_38234 ?auto_38235 ) ) ( not ( = ?auto_38242 ?auto_38235 ) ) ( not ( = ?auto_38221 ?auto_38235 ) ) ( not ( = ?auto_38232 ?auto_38235 ) ) ( not ( = ?auto_38230 ?auto_38235 ) ) ( IS-CRATE ?auto_38230 ) ( not ( = ?auto_38218 ?auto_38240 ) ) ( not ( = ?auto_38219 ?auto_38240 ) ) ( not ( = ?auto_38222 ?auto_38240 ) ) ( not ( = ?auto_38234 ?auto_38240 ) ) ( not ( = ?auto_38242 ?auto_38240 ) ) ( not ( = ?auto_38221 ?auto_38240 ) ) ( not ( = ?auto_38232 ?auto_38240 ) ) ( not ( = ?auto_38230 ?auto_38240 ) ) ( not ( = ?auto_38235 ?auto_38240 ) ) ( not ( = ?auto_38233 ?auto_38220 ) ) ( not ( = ?auto_38241 ?auto_38233 ) ) ( not ( = ?auto_38226 ?auto_38233 ) ) ( not ( = ?auto_38236 ?auto_38233 ) ) ( not ( = ?auto_38223 ?auto_38233 ) ) ( HOIST-AT ?auto_38225 ?auto_38233 ) ( not ( = ?auto_38231 ?auto_38225 ) ) ( not ( = ?auto_38224 ?auto_38225 ) ) ( not ( = ?auto_38227 ?auto_38225 ) ) ( not ( = ?auto_38238 ?auto_38225 ) ) ( not ( = ?auto_38237 ?auto_38225 ) ) ( AVAILABLE ?auto_38225 ) ( SURFACE-AT ?auto_38230 ?auto_38233 ) ( ON ?auto_38230 ?auto_38239 ) ( CLEAR ?auto_38230 ) ( not ( = ?auto_38218 ?auto_38239 ) ) ( not ( = ?auto_38219 ?auto_38239 ) ) ( not ( = ?auto_38222 ?auto_38239 ) ) ( not ( = ?auto_38234 ?auto_38239 ) ) ( not ( = ?auto_38242 ?auto_38239 ) ) ( not ( = ?auto_38221 ?auto_38239 ) ) ( not ( = ?auto_38232 ?auto_38239 ) ) ( not ( = ?auto_38230 ?auto_38239 ) ) ( not ( = ?auto_38235 ?auto_38239 ) ) ( not ( = ?auto_38240 ?auto_38239 ) ) ( TRUCK-AT ?auto_38228 ?auto_38220 ) ( SURFACE-AT ?auto_38229 ?auto_38220 ) ( CLEAR ?auto_38229 ) ( IS-CRATE ?auto_38240 ) ( not ( = ?auto_38218 ?auto_38229 ) ) ( not ( = ?auto_38219 ?auto_38229 ) ) ( not ( = ?auto_38222 ?auto_38229 ) ) ( not ( = ?auto_38234 ?auto_38229 ) ) ( not ( = ?auto_38242 ?auto_38229 ) ) ( not ( = ?auto_38221 ?auto_38229 ) ) ( not ( = ?auto_38232 ?auto_38229 ) ) ( not ( = ?auto_38230 ?auto_38229 ) ) ( not ( = ?auto_38235 ?auto_38229 ) ) ( not ( = ?auto_38240 ?auto_38229 ) ) ( not ( = ?auto_38239 ?auto_38229 ) ) ( AVAILABLE ?auto_38231 ) ( IN ?auto_38240 ?auto_38228 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38231 ?auto_38240 ?auto_38228 ?auto_38220 )
      ( MAKE-ON ?auto_38218 ?auto_38219 )
      ( MAKE-ON-VERIFY ?auto_38218 ?auto_38219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38243 - SURFACE
      ?auto_38244 - SURFACE
    )
    :vars
    (
      ?auto_38247 - HOIST
      ?auto_38263 - PLACE
      ?auto_38254 - PLACE
      ?auto_38265 - HOIST
      ?auto_38245 - SURFACE
      ?auto_38258 - SURFACE
      ?auto_38267 - PLACE
      ?auto_38266 - HOIST
      ?auto_38255 - SURFACE
      ?auto_38251 - SURFACE
      ?auto_38249 - PLACE
      ?auto_38250 - HOIST
      ?auto_38259 - SURFACE
      ?auto_38246 - SURFACE
      ?auto_38257 - PLACE
      ?auto_38262 - HOIST
      ?auto_38256 - SURFACE
      ?auto_38253 - SURFACE
      ?auto_38248 - PLACE
      ?auto_38260 - HOIST
      ?auto_38252 - SURFACE
      ?auto_38264 - SURFACE
      ?auto_38261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38247 ?auto_38263 ) ( IS-CRATE ?auto_38243 ) ( not ( = ?auto_38243 ?auto_38244 ) ) ( not ( = ?auto_38254 ?auto_38263 ) ) ( HOIST-AT ?auto_38265 ?auto_38254 ) ( not ( = ?auto_38247 ?auto_38265 ) ) ( AVAILABLE ?auto_38265 ) ( SURFACE-AT ?auto_38243 ?auto_38254 ) ( ON ?auto_38243 ?auto_38245 ) ( CLEAR ?auto_38243 ) ( not ( = ?auto_38243 ?auto_38245 ) ) ( not ( = ?auto_38244 ?auto_38245 ) ) ( IS-CRATE ?auto_38244 ) ( not ( = ?auto_38243 ?auto_38258 ) ) ( not ( = ?auto_38244 ?auto_38258 ) ) ( not ( = ?auto_38245 ?auto_38258 ) ) ( not ( = ?auto_38267 ?auto_38263 ) ) ( not ( = ?auto_38254 ?auto_38267 ) ) ( HOIST-AT ?auto_38266 ?auto_38267 ) ( not ( = ?auto_38247 ?auto_38266 ) ) ( not ( = ?auto_38265 ?auto_38266 ) ) ( AVAILABLE ?auto_38266 ) ( SURFACE-AT ?auto_38244 ?auto_38267 ) ( ON ?auto_38244 ?auto_38255 ) ( CLEAR ?auto_38244 ) ( not ( = ?auto_38243 ?auto_38255 ) ) ( not ( = ?auto_38244 ?auto_38255 ) ) ( not ( = ?auto_38245 ?auto_38255 ) ) ( not ( = ?auto_38258 ?auto_38255 ) ) ( IS-CRATE ?auto_38258 ) ( not ( = ?auto_38243 ?auto_38251 ) ) ( not ( = ?auto_38244 ?auto_38251 ) ) ( not ( = ?auto_38245 ?auto_38251 ) ) ( not ( = ?auto_38258 ?auto_38251 ) ) ( not ( = ?auto_38255 ?auto_38251 ) ) ( not ( = ?auto_38249 ?auto_38263 ) ) ( not ( = ?auto_38254 ?auto_38249 ) ) ( not ( = ?auto_38267 ?auto_38249 ) ) ( HOIST-AT ?auto_38250 ?auto_38249 ) ( not ( = ?auto_38247 ?auto_38250 ) ) ( not ( = ?auto_38265 ?auto_38250 ) ) ( not ( = ?auto_38266 ?auto_38250 ) ) ( AVAILABLE ?auto_38250 ) ( SURFACE-AT ?auto_38258 ?auto_38249 ) ( ON ?auto_38258 ?auto_38259 ) ( CLEAR ?auto_38258 ) ( not ( = ?auto_38243 ?auto_38259 ) ) ( not ( = ?auto_38244 ?auto_38259 ) ) ( not ( = ?auto_38245 ?auto_38259 ) ) ( not ( = ?auto_38258 ?auto_38259 ) ) ( not ( = ?auto_38255 ?auto_38259 ) ) ( not ( = ?auto_38251 ?auto_38259 ) ) ( IS-CRATE ?auto_38251 ) ( not ( = ?auto_38243 ?auto_38246 ) ) ( not ( = ?auto_38244 ?auto_38246 ) ) ( not ( = ?auto_38245 ?auto_38246 ) ) ( not ( = ?auto_38258 ?auto_38246 ) ) ( not ( = ?auto_38255 ?auto_38246 ) ) ( not ( = ?auto_38251 ?auto_38246 ) ) ( not ( = ?auto_38259 ?auto_38246 ) ) ( not ( = ?auto_38257 ?auto_38263 ) ) ( not ( = ?auto_38254 ?auto_38257 ) ) ( not ( = ?auto_38267 ?auto_38257 ) ) ( not ( = ?auto_38249 ?auto_38257 ) ) ( HOIST-AT ?auto_38262 ?auto_38257 ) ( not ( = ?auto_38247 ?auto_38262 ) ) ( not ( = ?auto_38265 ?auto_38262 ) ) ( not ( = ?auto_38266 ?auto_38262 ) ) ( not ( = ?auto_38250 ?auto_38262 ) ) ( AVAILABLE ?auto_38262 ) ( SURFACE-AT ?auto_38251 ?auto_38257 ) ( ON ?auto_38251 ?auto_38256 ) ( CLEAR ?auto_38251 ) ( not ( = ?auto_38243 ?auto_38256 ) ) ( not ( = ?auto_38244 ?auto_38256 ) ) ( not ( = ?auto_38245 ?auto_38256 ) ) ( not ( = ?auto_38258 ?auto_38256 ) ) ( not ( = ?auto_38255 ?auto_38256 ) ) ( not ( = ?auto_38251 ?auto_38256 ) ) ( not ( = ?auto_38259 ?auto_38256 ) ) ( not ( = ?auto_38246 ?auto_38256 ) ) ( IS-CRATE ?auto_38246 ) ( not ( = ?auto_38243 ?auto_38253 ) ) ( not ( = ?auto_38244 ?auto_38253 ) ) ( not ( = ?auto_38245 ?auto_38253 ) ) ( not ( = ?auto_38258 ?auto_38253 ) ) ( not ( = ?auto_38255 ?auto_38253 ) ) ( not ( = ?auto_38251 ?auto_38253 ) ) ( not ( = ?auto_38259 ?auto_38253 ) ) ( not ( = ?auto_38246 ?auto_38253 ) ) ( not ( = ?auto_38256 ?auto_38253 ) ) ( not ( = ?auto_38248 ?auto_38263 ) ) ( not ( = ?auto_38254 ?auto_38248 ) ) ( not ( = ?auto_38267 ?auto_38248 ) ) ( not ( = ?auto_38249 ?auto_38248 ) ) ( not ( = ?auto_38257 ?auto_38248 ) ) ( HOIST-AT ?auto_38260 ?auto_38248 ) ( not ( = ?auto_38247 ?auto_38260 ) ) ( not ( = ?auto_38265 ?auto_38260 ) ) ( not ( = ?auto_38266 ?auto_38260 ) ) ( not ( = ?auto_38250 ?auto_38260 ) ) ( not ( = ?auto_38262 ?auto_38260 ) ) ( AVAILABLE ?auto_38260 ) ( SURFACE-AT ?auto_38246 ?auto_38248 ) ( ON ?auto_38246 ?auto_38252 ) ( CLEAR ?auto_38246 ) ( not ( = ?auto_38243 ?auto_38252 ) ) ( not ( = ?auto_38244 ?auto_38252 ) ) ( not ( = ?auto_38245 ?auto_38252 ) ) ( not ( = ?auto_38258 ?auto_38252 ) ) ( not ( = ?auto_38255 ?auto_38252 ) ) ( not ( = ?auto_38251 ?auto_38252 ) ) ( not ( = ?auto_38259 ?auto_38252 ) ) ( not ( = ?auto_38246 ?auto_38252 ) ) ( not ( = ?auto_38256 ?auto_38252 ) ) ( not ( = ?auto_38253 ?auto_38252 ) ) ( SURFACE-AT ?auto_38264 ?auto_38263 ) ( CLEAR ?auto_38264 ) ( IS-CRATE ?auto_38253 ) ( not ( = ?auto_38243 ?auto_38264 ) ) ( not ( = ?auto_38244 ?auto_38264 ) ) ( not ( = ?auto_38245 ?auto_38264 ) ) ( not ( = ?auto_38258 ?auto_38264 ) ) ( not ( = ?auto_38255 ?auto_38264 ) ) ( not ( = ?auto_38251 ?auto_38264 ) ) ( not ( = ?auto_38259 ?auto_38264 ) ) ( not ( = ?auto_38246 ?auto_38264 ) ) ( not ( = ?auto_38256 ?auto_38264 ) ) ( not ( = ?auto_38253 ?auto_38264 ) ) ( not ( = ?auto_38252 ?auto_38264 ) ) ( AVAILABLE ?auto_38247 ) ( IN ?auto_38253 ?auto_38261 ) ( TRUCK-AT ?auto_38261 ?auto_38249 ) )
    :subtasks
    ( ( !DRIVE ?auto_38261 ?auto_38249 ?auto_38263 )
      ( MAKE-ON ?auto_38243 ?auto_38244 )
      ( MAKE-ON-VERIFY ?auto_38243 ?auto_38244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38268 - SURFACE
      ?auto_38269 - SURFACE
    )
    :vars
    (
      ?auto_38272 - HOIST
      ?auto_38284 - PLACE
      ?auto_38282 - PLACE
      ?auto_38276 - HOIST
      ?auto_38289 - SURFACE
      ?auto_38279 - SURFACE
      ?auto_38270 - PLACE
      ?auto_38275 - HOIST
      ?auto_38281 - SURFACE
      ?auto_38278 - SURFACE
      ?auto_38280 - PLACE
      ?auto_38288 - HOIST
      ?auto_38290 - SURFACE
      ?auto_38292 - SURFACE
      ?auto_38273 - PLACE
      ?auto_38283 - HOIST
      ?auto_38274 - SURFACE
      ?auto_38286 - SURFACE
      ?auto_38287 - PLACE
      ?auto_38277 - HOIST
      ?auto_38291 - SURFACE
      ?auto_38271 - SURFACE
      ?auto_38285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38272 ?auto_38284 ) ( IS-CRATE ?auto_38268 ) ( not ( = ?auto_38268 ?auto_38269 ) ) ( not ( = ?auto_38282 ?auto_38284 ) ) ( HOIST-AT ?auto_38276 ?auto_38282 ) ( not ( = ?auto_38272 ?auto_38276 ) ) ( AVAILABLE ?auto_38276 ) ( SURFACE-AT ?auto_38268 ?auto_38282 ) ( ON ?auto_38268 ?auto_38289 ) ( CLEAR ?auto_38268 ) ( not ( = ?auto_38268 ?auto_38289 ) ) ( not ( = ?auto_38269 ?auto_38289 ) ) ( IS-CRATE ?auto_38269 ) ( not ( = ?auto_38268 ?auto_38279 ) ) ( not ( = ?auto_38269 ?auto_38279 ) ) ( not ( = ?auto_38289 ?auto_38279 ) ) ( not ( = ?auto_38270 ?auto_38284 ) ) ( not ( = ?auto_38282 ?auto_38270 ) ) ( HOIST-AT ?auto_38275 ?auto_38270 ) ( not ( = ?auto_38272 ?auto_38275 ) ) ( not ( = ?auto_38276 ?auto_38275 ) ) ( AVAILABLE ?auto_38275 ) ( SURFACE-AT ?auto_38269 ?auto_38270 ) ( ON ?auto_38269 ?auto_38281 ) ( CLEAR ?auto_38269 ) ( not ( = ?auto_38268 ?auto_38281 ) ) ( not ( = ?auto_38269 ?auto_38281 ) ) ( not ( = ?auto_38289 ?auto_38281 ) ) ( not ( = ?auto_38279 ?auto_38281 ) ) ( IS-CRATE ?auto_38279 ) ( not ( = ?auto_38268 ?auto_38278 ) ) ( not ( = ?auto_38269 ?auto_38278 ) ) ( not ( = ?auto_38289 ?auto_38278 ) ) ( not ( = ?auto_38279 ?auto_38278 ) ) ( not ( = ?auto_38281 ?auto_38278 ) ) ( not ( = ?auto_38280 ?auto_38284 ) ) ( not ( = ?auto_38282 ?auto_38280 ) ) ( not ( = ?auto_38270 ?auto_38280 ) ) ( HOIST-AT ?auto_38288 ?auto_38280 ) ( not ( = ?auto_38272 ?auto_38288 ) ) ( not ( = ?auto_38276 ?auto_38288 ) ) ( not ( = ?auto_38275 ?auto_38288 ) ) ( SURFACE-AT ?auto_38279 ?auto_38280 ) ( ON ?auto_38279 ?auto_38290 ) ( CLEAR ?auto_38279 ) ( not ( = ?auto_38268 ?auto_38290 ) ) ( not ( = ?auto_38269 ?auto_38290 ) ) ( not ( = ?auto_38289 ?auto_38290 ) ) ( not ( = ?auto_38279 ?auto_38290 ) ) ( not ( = ?auto_38281 ?auto_38290 ) ) ( not ( = ?auto_38278 ?auto_38290 ) ) ( IS-CRATE ?auto_38278 ) ( not ( = ?auto_38268 ?auto_38292 ) ) ( not ( = ?auto_38269 ?auto_38292 ) ) ( not ( = ?auto_38289 ?auto_38292 ) ) ( not ( = ?auto_38279 ?auto_38292 ) ) ( not ( = ?auto_38281 ?auto_38292 ) ) ( not ( = ?auto_38278 ?auto_38292 ) ) ( not ( = ?auto_38290 ?auto_38292 ) ) ( not ( = ?auto_38273 ?auto_38284 ) ) ( not ( = ?auto_38282 ?auto_38273 ) ) ( not ( = ?auto_38270 ?auto_38273 ) ) ( not ( = ?auto_38280 ?auto_38273 ) ) ( HOIST-AT ?auto_38283 ?auto_38273 ) ( not ( = ?auto_38272 ?auto_38283 ) ) ( not ( = ?auto_38276 ?auto_38283 ) ) ( not ( = ?auto_38275 ?auto_38283 ) ) ( not ( = ?auto_38288 ?auto_38283 ) ) ( AVAILABLE ?auto_38283 ) ( SURFACE-AT ?auto_38278 ?auto_38273 ) ( ON ?auto_38278 ?auto_38274 ) ( CLEAR ?auto_38278 ) ( not ( = ?auto_38268 ?auto_38274 ) ) ( not ( = ?auto_38269 ?auto_38274 ) ) ( not ( = ?auto_38289 ?auto_38274 ) ) ( not ( = ?auto_38279 ?auto_38274 ) ) ( not ( = ?auto_38281 ?auto_38274 ) ) ( not ( = ?auto_38278 ?auto_38274 ) ) ( not ( = ?auto_38290 ?auto_38274 ) ) ( not ( = ?auto_38292 ?auto_38274 ) ) ( IS-CRATE ?auto_38292 ) ( not ( = ?auto_38268 ?auto_38286 ) ) ( not ( = ?auto_38269 ?auto_38286 ) ) ( not ( = ?auto_38289 ?auto_38286 ) ) ( not ( = ?auto_38279 ?auto_38286 ) ) ( not ( = ?auto_38281 ?auto_38286 ) ) ( not ( = ?auto_38278 ?auto_38286 ) ) ( not ( = ?auto_38290 ?auto_38286 ) ) ( not ( = ?auto_38292 ?auto_38286 ) ) ( not ( = ?auto_38274 ?auto_38286 ) ) ( not ( = ?auto_38287 ?auto_38284 ) ) ( not ( = ?auto_38282 ?auto_38287 ) ) ( not ( = ?auto_38270 ?auto_38287 ) ) ( not ( = ?auto_38280 ?auto_38287 ) ) ( not ( = ?auto_38273 ?auto_38287 ) ) ( HOIST-AT ?auto_38277 ?auto_38287 ) ( not ( = ?auto_38272 ?auto_38277 ) ) ( not ( = ?auto_38276 ?auto_38277 ) ) ( not ( = ?auto_38275 ?auto_38277 ) ) ( not ( = ?auto_38288 ?auto_38277 ) ) ( not ( = ?auto_38283 ?auto_38277 ) ) ( AVAILABLE ?auto_38277 ) ( SURFACE-AT ?auto_38292 ?auto_38287 ) ( ON ?auto_38292 ?auto_38291 ) ( CLEAR ?auto_38292 ) ( not ( = ?auto_38268 ?auto_38291 ) ) ( not ( = ?auto_38269 ?auto_38291 ) ) ( not ( = ?auto_38289 ?auto_38291 ) ) ( not ( = ?auto_38279 ?auto_38291 ) ) ( not ( = ?auto_38281 ?auto_38291 ) ) ( not ( = ?auto_38278 ?auto_38291 ) ) ( not ( = ?auto_38290 ?auto_38291 ) ) ( not ( = ?auto_38292 ?auto_38291 ) ) ( not ( = ?auto_38274 ?auto_38291 ) ) ( not ( = ?auto_38286 ?auto_38291 ) ) ( SURFACE-AT ?auto_38271 ?auto_38284 ) ( CLEAR ?auto_38271 ) ( IS-CRATE ?auto_38286 ) ( not ( = ?auto_38268 ?auto_38271 ) ) ( not ( = ?auto_38269 ?auto_38271 ) ) ( not ( = ?auto_38289 ?auto_38271 ) ) ( not ( = ?auto_38279 ?auto_38271 ) ) ( not ( = ?auto_38281 ?auto_38271 ) ) ( not ( = ?auto_38278 ?auto_38271 ) ) ( not ( = ?auto_38290 ?auto_38271 ) ) ( not ( = ?auto_38292 ?auto_38271 ) ) ( not ( = ?auto_38274 ?auto_38271 ) ) ( not ( = ?auto_38286 ?auto_38271 ) ) ( not ( = ?auto_38291 ?auto_38271 ) ) ( AVAILABLE ?auto_38272 ) ( TRUCK-AT ?auto_38285 ?auto_38280 ) ( LIFTING ?auto_38288 ?auto_38286 ) )
    :subtasks
    ( ( !LOAD ?auto_38288 ?auto_38286 ?auto_38285 ?auto_38280 )
      ( MAKE-ON ?auto_38268 ?auto_38269 )
      ( MAKE-ON-VERIFY ?auto_38268 ?auto_38269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38293 - SURFACE
      ?auto_38294 - SURFACE
    )
    :vars
    (
      ?auto_38314 - HOIST
      ?auto_38306 - PLACE
      ?auto_38297 - PLACE
      ?auto_38303 - HOIST
      ?auto_38300 - SURFACE
      ?auto_38305 - SURFACE
      ?auto_38302 - PLACE
      ?auto_38312 - HOIST
      ?auto_38295 - SURFACE
      ?auto_38311 - SURFACE
      ?auto_38296 - PLACE
      ?auto_38301 - HOIST
      ?auto_38307 - SURFACE
      ?auto_38309 - SURFACE
      ?auto_38299 - PLACE
      ?auto_38304 - HOIST
      ?auto_38298 - SURFACE
      ?auto_38316 - SURFACE
      ?auto_38317 - PLACE
      ?auto_38313 - HOIST
      ?auto_38308 - SURFACE
      ?auto_38315 - SURFACE
      ?auto_38310 - TRUCK
      ?auto_38318 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38314 ?auto_38306 ) ( IS-CRATE ?auto_38293 ) ( not ( = ?auto_38293 ?auto_38294 ) ) ( not ( = ?auto_38297 ?auto_38306 ) ) ( HOIST-AT ?auto_38303 ?auto_38297 ) ( not ( = ?auto_38314 ?auto_38303 ) ) ( AVAILABLE ?auto_38303 ) ( SURFACE-AT ?auto_38293 ?auto_38297 ) ( ON ?auto_38293 ?auto_38300 ) ( CLEAR ?auto_38293 ) ( not ( = ?auto_38293 ?auto_38300 ) ) ( not ( = ?auto_38294 ?auto_38300 ) ) ( IS-CRATE ?auto_38294 ) ( not ( = ?auto_38293 ?auto_38305 ) ) ( not ( = ?auto_38294 ?auto_38305 ) ) ( not ( = ?auto_38300 ?auto_38305 ) ) ( not ( = ?auto_38302 ?auto_38306 ) ) ( not ( = ?auto_38297 ?auto_38302 ) ) ( HOIST-AT ?auto_38312 ?auto_38302 ) ( not ( = ?auto_38314 ?auto_38312 ) ) ( not ( = ?auto_38303 ?auto_38312 ) ) ( AVAILABLE ?auto_38312 ) ( SURFACE-AT ?auto_38294 ?auto_38302 ) ( ON ?auto_38294 ?auto_38295 ) ( CLEAR ?auto_38294 ) ( not ( = ?auto_38293 ?auto_38295 ) ) ( not ( = ?auto_38294 ?auto_38295 ) ) ( not ( = ?auto_38300 ?auto_38295 ) ) ( not ( = ?auto_38305 ?auto_38295 ) ) ( IS-CRATE ?auto_38305 ) ( not ( = ?auto_38293 ?auto_38311 ) ) ( not ( = ?auto_38294 ?auto_38311 ) ) ( not ( = ?auto_38300 ?auto_38311 ) ) ( not ( = ?auto_38305 ?auto_38311 ) ) ( not ( = ?auto_38295 ?auto_38311 ) ) ( not ( = ?auto_38296 ?auto_38306 ) ) ( not ( = ?auto_38297 ?auto_38296 ) ) ( not ( = ?auto_38302 ?auto_38296 ) ) ( HOIST-AT ?auto_38301 ?auto_38296 ) ( not ( = ?auto_38314 ?auto_38301 ) ) ( not ( = ?auto_38303 ?auto_38301 ) ) ( not ( = ?auto_38312 ?auto_38301 ) ) ( SURFACE-AT ?auto_38305 ?auto_38296 ) ( ON ?auto_38305 ?auto_38307 ) ( CLEAR ?auto_38305 ) ( not ( = ?auto_38293 ?auto_38307 ) ) ( not ( = ?auto_38294 ?auto_38307 ) ) ( not ( = ?auto_38300 ?auto_38307 ) ) ( not ( = ?auto_38305 ?auto_38307 ) ) ( not ( = ?auto_38295 ?auto_38307 ) ) ( not ( = ?auto_38311 ?auto_38307 ) ) ( IS-CRATE ?auto_38311 ) ( not ( = ?auto_38293 ?auto_38309 ) ) ( not ( = ?auto_38294 ?auto_38309 ) ) ( not ( = ?auto_38300 ?auto_38309 ) ) ( not ( = ?auto_38305 ?auto_38309 ) ) ( not ( = ?auto_38295 ?auto_38309 ) ) ( not ( = ?auto_38311 ?auto_38309 ) ) ( not ( = ?auto_38307 ?auto_38309 ) ) ( not ( = ?auto_38299 ?auto_38306 ) ) ( not ( = ?auto_38297 ?auto_38299 ) ) ( not ( = ?auto_38302 ?auto_38299 ) ) ( not ( = ?auto_38296 ?auto_38299 ) ) ( HOIST-AT ?auto_38304 ?auto_38299 ) ( not ( = ?auto_38314 ?auto_38304 ) ) ( not ( = ?auto_38303 ?auto_38304 ) ) ( not ( = ?auto_38312 ?auto_38304 ) ) ( not ( = ?auto_38301 ?auto_38304 ) ) ( AVAILABLE ?auto_38304 ) ( SURFACE-AT ?auto_38311 ?auto_38299 ) ( ON ?auto_38311 ?auto_38298 ) ( CLEAR ?auto_38311 ) ( not ( = ?auto_38293 ?auto_38298 ) ) ( not ( = ?auto_38294 ?auto_38298 ) ) ( not ( = ?auto_38300 ?auto_38298 ) ) ( not ( = ?auto_38305 ?auto_38298 ) ) ( not ( = ?auto_38295 ?auto_38298 ) ) ( not ( = ?auto_38311 ?auto_38298 ) ) ( not ( = ?auto_38307 ?auto_38298 ) ) ( not ( = ?auto_38309 ?auto_38298 ) ) ( IS-CRATE ?auto_38309 ) ( not ( = ?auto_38293 ?auto_38316 ) ) ( not ( = ?auto_38294 ?auto_38316 ) ) ( not ( = ?auto_38300 ?auto_38316 ) ) ( not ( = ?auto_38305 ?auto_38316 ) ) ( not ( = ?auto_38295 ?auto_38316 ) ) ( not ( = ?auto_38311 ?auto_38316 ) ) ( not ( = ?auto_38307 ?auto_38316 ) ) ( not ( = ?auto_38309 ?auto_38316 ) ) ( not ( = ?auto_38298 ?auto_38316 ) ) ( not ( = ?auto_38317 ?auto_38306 ) ) ( not ( = ?auto_38297 ?auto_38317 ) ) ( not ( = ?auto_38302 ?auto_38317 ) ) ( not ( = ?auto_38296 ?auto_38317 ) ) ( not ( = ?auto_38299 ?auto_38317 ) ) ( HOIST-AT ?auto_38313 ?auto_38317 ) ( not ( = ?auto_38314 ?auto_38313 ) ) ( not ( = ?auto_38303 ?auto_38313 ) ) ( not ( = ?auto_38312 ?auto_38313 ) ) ( not ( = ?auto_38301 ?auto_38313 ) ) ( not ( = ?auto_38304 ?auto_38313 ) ) ( AVAILABLE ?auto_38313 ) ( SURFACE-AT ?auto_38309 ?auto_38317 ) ( ON ?auto_38309 ?auto_38308 ) ( CLEAR ?auto_38309 ) ( not ( = ?auto_38293 ?auto_38308 ) ) ( not ( = ?auto_38294 ?auto_38308 ) ) ( not ( = ?auto_38300 ?auto_38308 ) ) ( not ( = ?auto_38305 ?auto_38308 ) ) ( not ( = ?auto_38295 ?auto_38308 ) ) ( not ( = ?auto_38311 ?auto_38308 ) ) ( not ( = ?auto_38307 ?auto_38308 ) ) ( not ( = ?auto_38309 ?auto_38308 ) ) ( not ( = ?auto_38298 ?auto_38308 ) ) ( not ( = ?auto_38316 ?auto_38308 ) ) ( SURFACE-AT ?auto_38315 ?auto_38306 ) ( CLEAR ?auto_38315 ) ( IS-CRATE ?auto_38316 ) ( not ( = ?auto_38293 ?auto_38315 ) ) ( not ( = ?auto_38294 ?auto_38315 ) ) ( not ( = ?auto_38300 ?auto_38315 ) ) ( not ( = ?auto_38305 ?auto_38315 ) ) ( not ( = ?auto_38295 ?auto_38315 ) ) ( not ( = ?auto_38311 ?auto_38315 ) ) ( not ( = ?auto_38307 ?auto_38315 ) ) ( not ( = ?auto_38309 ?auto_38315 ) ) ( not ( = ?auto_38298 ?auto_38315 ) ) ( not ( = ?auto_38316 ?auto_38315 ) ) ( not ( = ?auto_38308 ?auto_38315 ) ) ( AVAILABLE ?auto_38314 ) ( TRUCK-AT ?auto_38310 ?auto_38296 ) ( AVAILABLE ?auto_38301 ) ( SURFACE-AT ?auto_38316 ?auto_38296 ) ( ON ?auto_38316 ?auto_38318 ) ( CLEAR ?auto_38316 ) ( not ( = ?auto_38293 ?auto_38318 ) ) ( not ( = ?auto_38294 ?auto_38318 ) ) ( not ( = ?auto_38300 ?auto_38318 ) ) ( not ( = ?auto_38305 ?auto_38318 ) ) ( not ( = ?auto_38295 ?auto_38318 ) ) ( not ( = ?auto_38311 ?auto_38318 ) ) ( not ( = ?auto_38307 ?auto_38318 ) ) ( not ( = ?auto_38309 ?auto_38318 ) ) ( not ( = ?auto_38298 ?auto_38318 ) ) ( not ( = ?auto_38316 ?auto_38318 ) ) ( not ( = ?auto_38308 ?auto_38318 ) ) ( not ( = ?auto_38315 ?auto_38318 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38301 ?auto_38316 ?auto_38318 ?auto_38296 )
      ( MAKE-ON ?auto_38293 ?auto_38294 )
      ( MAKE-ON-VERIFY ?auto_38293 ?auto_38294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38319 - SURFACE
      ?auto_38320 - SURFACE
    )
    :vars
    (
      ?auto_38344 - HOIST
      ?auto_38338 - PLACE
      ?auto_38342 - PLACE
      ?auto_38329 - HOIST
      ?auto_38324 - SURFACE
      ?auto_38337 - SURFACE
      ?auto_38323 - PLACE
      ?auto_38331 - HOIST
      ?auto_38335 - SURFACE
      ?auto_38330 - SURFACE
      ?auto_38332 - PLACE
      ?auto_38339 - HOIST
      ?auto_38340 - SURFACE
      ?auto_38334 - SURFACE
      ?auto_38322 - PLACE
      ?auto_38336 - HOIST
      ?auto_38321 - SURFACE
      ?auto_38325 - SURFACE
      ?auto_38327 - PLACE
      ?auto_38343 - HOIST
      ?auto_38341 - SURFACE
      ?auto_38326 - SURFACE
      ?auto_38333 - SURFACE
      ?auto_38328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38344 ?auto_38338 ) ( IS-CRATE ?auto_38319 ) ( not ( = ?auto_38319 ?auto_38320 ) ) ( not ( = ?auto_38342 ?auto_38338 ) ) ( HOIST-AT ?auto_38329 ?auto_38342 ) ( not ( = ?auto_38344 ?auto_38329 ) ) ( AVAILABLE ?auto_38329 ) ( SURFACE-AT ?auto_38319 ?auto_38342 ) ( ON ?auto_38319 ?auto_38324 ) ( CLEAR ?auto_38319 ) ( not ( = ?auto_38319 ?auto_38324 ) ) ( not ( = ?auto_38320 ?auto_38324 ) ) ( IS-CRATE ?auto_38320 ) ( not ( = ?auto_38319 ?auto_38337 ) ) ( not ( = ?auto_38320 ?auto_38337 ) ) ( not ( = ?auto_38324 ?auto_38337 ) ) ( not ( = ?auto_38323 ?auto_38338 ) ) ( not ( = ?auto_38342 ?auto_38323 ) ) ( HOIST-AT ?auto_38331 ?auto_38323 ) ( not ( = ?auto_38344 ?auto_38331 ) ) ( not ( = ?auto_38329 ?auto_38331 ) ) ( AVAILABLE ?auto_38331 ) ( SURFACE-AT ?auto_38320 ?auto_38323 ) ( ON ?auto_38320 ?auto_38335 ) ( CLEAR ?auto_38320 ) ( not ( = ?auto_38319 ?auto_38335 ) ) ( not ( = ?auto_38320 ?auto_38335 ) ) ( not ( = ?auto_38324 ?auto_38335 ) ) ( not ( = ?auto_38337 ?auto_38335 ) ) ( IS-CRATE ?auto_38337 ) ( not ( = ?auto_38319 ?auto_38330 ) ) ( not ( = ?auto_38320 ?auto_38330 ) ) ( not ( = ?auto_38324 ?auto_38330 ) ) ( not ( = ?auto_38337 ?auto_38330 ) ) ( not ( = ?auto_38335 ?auto_38330 ) ) ( not ( = ?auto_38332 ?auto_38338 ) ) ( not ( = ?auto_38342 ?auto_38332 ) ) ( not ( = ?auto_38323 ?auto_38332 ) ) ( HOIST-AT ?auto_38339 ?auto_38332 ) ( not ( = ?auto_38344 ?auto_38339 ) ) ( not ( = ?auto_38329 ?auto_38339 ) ) ( not ( = ?auto_38331 ?auto_38339 ) ) ( SURFACE-AT ?auto_38337 ?auto_38332 ) ( ON ?auto_38337 ?auto_38340 ) ( CLEAR ?auto_38337 ) ( not ( = ?auto_38319 ?auto_38340 ) ) ( not ( = ?auto_38320 ?auto_38340 ) ) ( not ( = ?auto_38324 ?auto_38340 ) ) ( not ( = ?auto_38337 ?auto_38340 ) ) ( not ( = ?auto_38335 ?auto_38340 ) ) ( not ( = ?auto_38330 ?auto_38340 ) ) ( IS-CRATE ?auto_38330 ) ( not ( = ?auto_38319 ?auto_38334 ) ) ( not ( = ?auto_38320 ?auto_38334 ) ) ( not ( = ?auto_38324 ?auto_38334 ) ) ( not ( = ?auto_38337 ?auto_38334 ) ) ( not ( = ?auto_38335 ?auto_38334 ) ) ( not ( = ?auto_38330 ?auto_38334 ) ) ( not ( = ?auto_38340 ?auto_38334 ) ) ( not ( = ?auto_38322 ?auto_38338 ) ) ( not ( = ?auto_38342 ?auto_38322 ) ) ( not ( = ?auto_38323 ?auto_38322 ) ) ( not ( = ?auto_38332 ?auto_38322 ) ) ( HOIST-AT ?auto_38336 ?auto_38322 ) ( not ( = ?auto_38344 ?auto_38336 ) ) ( not ( = ?auto_38329 ?auto_38336 ) ) ( not ( = ?auto_38331 ?auto_38336 ) ) ( not ( = ?auto_38339 ?auto_38336 ) ) ( AVAILABLE ?auto_38336 ) ( SURFACE-AT ?auto_38330 ?auto_38322 ) ( ON ?auto_38330 ?auto_38321 ) ( CLEAR ?auto_38330 ) ( not ( = ?auto_38319 ?auto_38321 ) ) ( not ( = ?auto_38320 ?auto_38321 ) ) ( not ( = ?auto_38324 ?auto_38321 ) ) ( not ( = ?auto_38337 ?auto_38321 ) ) ( not ( = ?auto_38335 ?auto_38321 ) ) ( not ( = ?auto_38330 ?auto_38321 ) ) ( not ( = ?auto_38340 ?auto_38321 ) ) ( not ( = ?auto_38334 ?auto_38321 ) ) ( IS-CRATE ?auto_38334 ) ( not ( = ?auto_38319 ?auto_38325 ) ) ( not ( = ?auto_38320 ?auto_38325 ) ) ( not ( = ?auto_38324 ?auto_38325 ) ) ( not ( = ?auto_38337 ?auto_38325 ) ) ( not ( = ?auto_38335 ?auto_38325 ) ) ( not ( = ?auto_38330 ?auto_38325 ) ) ( not ( = ?auto_38340 ?auto_38325 ) ) ( not ( = ?auto_38334 ?auto_38325 ) ) ( not ( = ?auto_38321 ?auto_38325 ) ) ( not ( = ?auto_38327 ?auto_38338 ) ) ( not ( = ?auto_38342 ?auto_38327 ) ) ( not ( = ?auto_38323 ?auto_38327 ) ) ( not ( = ?auto_38332 ?auto_38327 ) ) ( not ( = ?auto_38322 ?auto_38327 ) ) ( HOIST-AT ?auto_38343 ?auto_38327 ) ( not ( = ?auto_38344 ?auto_38343 ) ) ( not ( = ?auto_38329 ?auto_38343 ) ) ( not ( = ?auto_38331 ?auto_38343 ) ) ( not ( = ?auto_38339 ?auto_38343 ) ) ( not ( = ?auto_38336 ?auto_38343 ) ) ( AVAILABLE ?auto_38343 ) ( SURFACE-AT ?auto_38334 ?auto_38327 ) ( ON ?auto_38334 ?auto_38341 ) ( CLEAR ?auto_38334 ) ( not ( = ?auto_38319 ?auto_38341 ) ) ( not ( = ?auto_38320 ?auto_38341 ) ) ( not ( = ?auto_38324 ?auto_38341 ) ) ( not ( = ?auto_38337 ?auto_38341 ) ) ( not ( = ?auto_38335 ?auto_38341 ) ) ( not ( = ?auto_38330 ?auto_38341 ) ) ( not ( = ?auto_38340 ?auto_38341 ) ) ( not ( = ?auto_38334 ?auto_38341 ) ) ( not ( = ?auto_38321 ?auto_38341 ) ) ( not ( = ?auto_38325 ?auto_38341 ) ) ( SURFACE-AT ?auto_38326 ?auto_38338 ) ( CLEAR ?auto_38326 ) ( IS-CRATE ?auto_38325 ) ( not ( = ?auto_38319 ?auto_38326 ) ) ( not ( = ?auto_38320 ?auto_38326 ) ) ( not ( = ?auto_38324 ?auto_38326 ) ) ( not ( = ?auto_38337 ?auto_38326 ) ) ( not ( = ?auto_38335 ?auto_38326 ) ) ( not ( = ?auto_38330 ?auto_38326 ) ) ( not ( = ?auto_38340 ?auto_38326 ) ) ( not ( = ?auto_38334 ?auto_38326 ) ) ( not ( = ?auto_38321 ?auto_38326 ) ) ( not ( = ?auto_38325 ?auto_38326 ) ) ( not ( = ?auto_38341 ?auto_38326 ) ) ( AVAILABLE ?auto_38344 ) ( AVAILABLE ?auto_38339 ) ( SURFACE-AT ?auto_38325 ?auto_38332 ) ( ON ?auto_38325 ?auto_38333 ) ( CLEAR ?auto_38325 ) ( not ( = ?auto_38319 ?auto_38333 ) ) ( not ( = ?auto_38320 ?auto_38333 ) ) ( not ( = ?auto_38324 ?auto_38333 ) ) ( not ( = ?auto_38337 ?auto_38333 ) ) ( not ( = ?auto_38335 ?auto_38333 ) ) ( not ( = ?auto_38330 ?auto_38333 ) ) ( not ( = ?auto_38340 ?auto_38333 ) ) ( not ( = ?auto_38334 ?auto_38333 ) ) ( not ( = ?auto_38321 ?auto_38333 ) ) ( not ( = ?auto_38325 ?auto_38333 ) ) ( not ( = ?auto_38341 ?auto_38333 ) ) ( not ( = ?auto_38326 ?auto_38333 ) ) ( TRUCK-AT ?auto_38328 ?auto_38338 ) )
    :subtasks
    ( ( !DRIVE ?auto_38328 ?auto_38338 ?auto_38332 )
      ( MAKE-ON ?auto_38319 ?auto_38320 )
      ( MAKE-ON-VERIFY ?auto_38319 ?auto_38320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38345 - SURFACE
      ?auto_38346 - SURFACE
    )
    :vars
    (
      ?auto_38358 - HOIST
      ?auto_38366 - PLACE
      ?auto_38370 - PLACE
      ?auto_38369 - HOIST
      ?auto_38360 - SURFACE
      ?auto_38367 - SURFACE
      ?auto_38354 - PLACE
      ?auto_38359 - HOIST
      ?auto_38353 - SURFACE
      ?auto_38363 - SURFACE
      ?auto_38356 - PLACE
      ?auto_38349 - HOIST
      ?auto_38348 - SURFACE
      ?auto_38355 - SURFACE
      ?auto_38352 - PLACE
      ?auto_38350 - HOIST
      ?auto_38364 - SURFACE
      ?auto_38361 - SURFACE
      ?auto_38368 - PLACE
      ?auto_38351 - HOIST
      ?auto_38347 - SURFACE
      ?auto_38357 - SURFACE
      ?auto_38365 - SURFACE
      ?auto_38362 - TRUCK
      ?auto_38371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38358 ?auto_38366 ) ( IS-CRATE ?auto_38345 ) ( not ( = ?auto_38345 ?auto_38346 ) ) ( not ( = ?auto_38370 ?auto_38366 ) ) ( HOIST-AT ?auto_38369 ?auto_38370 ) ( not ( = ?auto_38358 ?auto_38369 ) ) ( AVAILABLE ?auto_38369 ) ( SURFACE-AT ?auto_38345 ?auto_38370 ) ( ON ?auto_38345 ?auto_38360 ) ( CLEAR ?auto_38345 ) ( not ( = ?auto_38345 ?auto_38360 ) ) ( not ( = ?auto_38346 ?auto_38360 ) ) ( IS-CRATE ?auto_38346 ) ( not ( = ?auto_38345 ?auto_38367 ) ) ( not ( = ?auto_38346 ?auto_38367 ) ) ( not ( = ?auto_38360 ?auto_38367 ) ) ( not ( = ?auto_38354 ?auto_38366 ) ) ( not ( = ?auto_38370 ?auto_38354 ) ) ( HOIST-AT ?auto_38359 ?auto_38354 ) ( not ( = ?auto_38358 ?auto_38359 ) ) ( not ( = ?auto_38369 ?auto_38359 ) ) ( AVAILABLE ?auto_38359 ) ( SURFACE-AT ?auto_38346 ?auto_38354 ) ( ON ?auto_38346 ?auto_38353 ) ( CLEAR ?auto_38346 ) ( not ( = ?auto_38345 ?auto_38353 ) ) ( not ( = ?auto_38346 ?auto_38353 ) ) ( not ( = ?auto_38360 ?auto_38353 ) ) ( not ( = ?auto_38367 ?auto_38353 ) ) ( IS-CRATE ?auto_38367 ) ( not ( = ?auto_38345 ?auto_38363 ) ) ( not ( = ?auto_38346 ?auto_38363 ) ) ( not ( = ?auto_38360 ?auto_38363 ) ) ( not ( = ?auto_38367 ?auto_38363 ) ) ( not ( = ?auto_38353 ?auto_38363 ) ) ( not ( = ?auto_38356 ?auto_38366 ) ) ( not ( = ?auto_38370 ?auto_38356 ) ) ( not ( = ?auto_38354 ?auto_38356 ) ) ( HOIST-AT ?auto_38349 ?auto_38356 ) ( not ( = ?auto_38358 ?auto_38349 ) ) ( not ( = ?auto_38369 ?auto_38349 ) ) ( not ( = ?auto_38359 ?auto_38349 ) ) ( SURFACE-AT ?auto_38367 ?auto_38356 ) ( ON ?auto_38367 ?auto_38348 ) ( CLEAR ?auto_38367 ) ( not ( = ?auto_38345 ?auto_38348 ) ) ( not ( = ?auto_38346 ?auto_38348 ) ) ( not ( = ?auto_38360 ?auto_38348 ) ) ( not ( = ?auto_38367 ?auto_38348 ) ) ( not ( = ?auto_38353 ?auto_38348 ) ) ( not ( = ?auto_38363 ?auto_38348 ) ) ( IS-CRATE ?auto_38363 ) ( not ( = ?auto_38345 ?auto_38355 ) ) ( not ( = ?auto_38346 ?auto_38355 ) ) ( not ( = ?auto_38360 ?auto_38355 ) ) ( not ( = ?auto_38367 ?auto_38355 ) ) ( not ( = ?auto_38353 ?auto_38355 ) ) ( not ( = ?auto_38363 ?auto_38355 ) ) ( not ( = ?auto_38348 ?auto_38355 ) ) ( not ( = ?auto_38352 ?auto_38366 ) ) ( not ( = ?auto_38370 ?auto_38352 ) ) ( not ( = ?auto_38354 ?auto_38352 ) ) ( not ( = ?auto_38356 ?auto_38352 ) ) ( HOIST-AT ?auto_38350 ?auto_38352 ) ( not ( = ?auto_38358 ?auto_38350 ) ) ( not ( = ?auto_38369 ?auto_38350 ) ) ( not ( = ?auto_38359 ?auto_38350 ) ) ( not ( = ?auto_38349 ?auto_38350 ) ) ( AVAILABLE ?auto_38350 ) ( SURFACE-AT ?auto_38363 ?auto_38352 ) ( ON ?auto_38363 ?auto_38364 ) ( CLEAR ?auto_38363 ) ( not ( = ?auto_38345 ?auto_38364 ) ) ( not ( = ?auto_38346 ?auto_38364 ) ) ( not ( = ?auto_38360 ?auto_38364 ) ) ( not ( = ?auto_38367 ?auto_38364 ) ) ( not ( = ?auto_38353 ?auto_38364 ) ) ( not ( = ?auto_38363 ?auto_38364 ) ) ( not ( = ?auto_38348 ?auto_38364 ) ) ( not ( = ?auto_38355 ?auto_38364 ) ) ( IS-CRATE ?auto_38355 ) ( not ( = ?auto_38345 ?auto_38361 ) ) ( not ( = ?auto_38346 ?auto_38361 ) ) ( not ( = ?auto_38360 ?auto_38361 ) ) ( not ( = ?auto_38367 ?auto_38361 ) ) ( not ( = ?auto_38353 ?auto_38361 ) ) ( not ( = ?auto_38363 ?auto_38361 ) ) ( not ( = ?auto_38348 ?auto_38361 ) ) ( not ( = ?auto_38355 ?auto_38361 ) ) ( not ( = ?auto_38364 ?auto_38361 ) ) ( not ( = ?auto_38368 ?auto_38366 ) ) ( not ( = ?auto_38370 ?auto_38368 ) ) ( not ( = ?auto_38354 ?auto_38368 ) ) ( not ( = ?auto_38356 ?auto_38368 ) ) ( not ( = ?auto_38352 ?auto_38368 ) ) ( HOIST-AT ?auto_38351 ?auto_38368 ) ( not ( = ?auto_38358 ?auto_38351 ) ) ( not ( = ?auto_38369 ?auto_38351 ) ) ( not ( = ?auto_38359 ?auto_38351 ) ) ( not ( = ?auto_38349 ?auto_38351 ) ) ( not ( = ?auto_38350 ?auto_38351 ) ) ( AVAILABLE ?auto_38351 ) ( SURFACE-AT ?auto_38355 ?auto_38368 ) ( ON ?auto_38355 ?auto_38347 ) ( CLEAR ?auto_38355 ) ( not ( = ?auto_38345 ?auto_38347 ) ) ( not ( = ?auto_38346 ?auto_38347 ) ) ( not ( = ?auto_38360 ?auto_38347 ) ) ( not ( = ?auto_38367 ?auto_38347 ) ) ( not ( = ?auto_38353 ?auto_38347 ) ) ( not ( = ?auto_38363 ?auto_38347 ) ) ( not ( = ?auto_38348 ?auto_38347 ) ) ( not ( = ?auto_38355 ?auto_38347 ) ) ( not ( = ?auto_38364 ?auto_38347 ) ) ( not ( = ?auto_38361 ?auto_38347 ) ) ( IS-CRATE ?auto_38361 ) ( not ( = ?auto_38345 ?auto_38357 ) ) ( not ( = ?auto_38346 ?auto_38357 ) ) ( not ( = ?auto_38360 ?auto_38357 ) ) ( not ( = ?auto_38367 ?auto_38357 ) ) ( not ( = ?auto_38353 ?auto_38357 ) ) ( not ( = ?auto_38363 ?auto_38357 ) ) ( not ( = ?auto_38348 ?auto_38357 ) ) ( not ( = ?auto_38355 ?auto_38357 ) ) ( not ( = ?auto_38364 ?auto_38357 ) ) ( not ( = ?auto_38361 ?auto_38357 ) ) ( not ( = ?auto_38347 ?auto_38357 ) ) ( AVAILABLE ?auto_38349 ) ( SURFACE-AT ?auto_38361 ?auto_38356 ) ( ON ?auto_38361 ?auto_38365 ) ( CLEAR ?auto_38361 ) ( not ( = ?auto_38345 ?auto_38365 ) ) ( not ( = ?auto_38346 ?auto_38365 ) ) ( not ( = ?auto_38360 ?auto_38365 ) ) ( not ( = ?auto_38367 ?auto_38365 ) ) ( not ( = ?auto_38353 ?auto_38365 ) ) ( not ( = ?auto_38363 ?auto_38365 ) ) ( not ( = ?auto_38348 ?auto_38365 ) ) ( not ( = ?auto_38355 ?auto_38365 ) ) ( not ( = ?auto_38364 ?auto_38365 ) ) ( not ( = ?auto_38361 ?auto_38365 ) ) ( not ( = ?auto_38347 ?auto_38365 ) ) ( not ( = ?auto_38357 ?auto_38365 ) ) ( TRUCK-AT ?auto_38362 ?auto_38366 ) ( SURFACE-AT ?auto_38371 ?auto_38366 ) ( CLEAR ?auto_38371 ) ( LIFTING ?auto_38358 ?auto_38357 ) ( IS-CRATE ?auto_38357 ) ( not ( = ?auto_38345 ?auto_38371 ) ) ( not ( = ?auto_38346 ?auto_38371 ) ) ( not ( = ?auto_38360 ?auto_38371 ) ) ( not ( = ?auto_38367 ?auto_38371 ) ) ( not ( = ?auto_38353 ?auto_38371 ) ) ( not ( = ?auto_38363 ?auto_38371 ) ) ( not ( = ?auto_38348 ?auto_38371 ) ) ( not ( = ?auto_38355 ?auto_38371 ) ) ( not ( = ?auto_38364 ?auto_38371 ) ) ( not ( = ?auto_38361 ?auto_38371 ) ) ( not ( = ?auto_38347 ?auto_38371 ) ) ( not ( = ?auto_38357 ?auto_38371 ) ) ( not ( = ?auto_38365 ?auto_38371 ) ) )
    :subtasks
    ( ( !DROP ?auto_38358 ?auto_38357 ?auto_38371 ?auto_38366 )
      ( MAKE-ON ?auto_38345 ?auto_38346 )
      ( MAKE-ON-VERIFY ?auto_38345 ?auto_38346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38372 - SURFACE
      ?auto_38373 - SURFACE
    )
    :vars
    (
      ?auto_38379 - HOIST
      ?auto_38376 - PLACE
      ?auto_38385 - PLACE
      ?auto_38386 - HOIST
      ?auto_38380 - SURFACE
      ?auto_38375 - SURFACE
      ?auto_38381 - PLACE
      ?auto_38378 - HOIST
      ?auto_38388 - SURFACE
      ?auto_38383 - SURFACE
      ?auto_38389 - PLACE
      ?auto_38390 - HOIST
      ?auto_38398 - SURFACE
      ?auto_38393 - SURFACE
      ?auto_38391 - PLACE
      ?auto_38382 - HOIST
      ?auto_38384 - SURFACE
      ?auto_38396 - SURFACE
      ?auto_38374 - PLACE
      ?auto_38397 - HOIST
      ?auto_38394 - SURFACE
      ?auto_38392 - SURFACE
      ?auto_38377 - SURFACE
      ?auto_38387 - TRUCK
      ?auto_38395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38379 ?auto_38376 ) ( IS-CRATE ?auto_38372 ) ( not ( = ?auto_38372 ?auto_38373 ) ) ( not ( = ?auto_38385 ?auto_38376 ) ) ( HOIST-AT ?auto_38386 ?auto_38385 ) ( not ( = ?auto_38379 ?auto_38386 ) ) ( AVAILABLE ?auto_38386 ) ( SURFACE-AT ?auto_38372 ?auto_38385 ) ( ON ?auto_38372 ?auto_38380 ) ( CLEAR ?auto_38372 ) ( not ( = ?auto_38372 ?auto_38380 ) ) ( not ( = ?auto_38373 ?auto_38380 ) ) ( IS-CRATE ?auto_38373 ) ( not ( = ?auto_38372 ?auto_38375 ) ) ( not ( = ?auto_38373 ?auto_38375 ) ) ( not ( = ?auto_38380 ?auto_38375 ) ) ( not ( = ?auto_38381 ?auto_38376 ) ) ( not ( = ?auto_38385 ?auto_38381 ) ) ( HOIST-AT ?auto_38378 ?auto_38381 ) ( not ( = ?auto_38379 ?auto_38378 ) ) ( not ( = ?auto_38386 ?auto_38378 ) ) ( AVAILABLE ?auto_38378 ) ( SURFACE-AT ?auto_38373 ?auto_38381 ) ( ON ?auto_38373 ?auto_38388 ) ( CLEAR ?auto_38373 ) ( not ( = ?auto_38372 ?auto_38388 ) ) ( not ( = ?auto_38373 ?auto_38388 ) ) ( not ( = ?auto_38380 ?auto_38388 ) ) ( not ( = ?auto_38375 ?auto_38388 ) ) ( IS-CRATE ?auto_38375 ) ( not ( = ?auto_38372 ?auto_38383 ) ) ( not ( = ?auto_38373 ?auto_38383 ) ) ( not ( = ?auto_38380 ?auto_38383 ) ) ( not ( = ?auto_38375 ?auto_38383 ) ) ( not ( = ?auto_38388 ?auto_38383 ) ) ( not ( = ?auto_38389 ?auto_38376 ) ) ( not ( = ?auto_38385 ?auto_38389 ) ) ( not ( = ?auto_38381 ?auto_38389 ) ) ( HOIST-AT ?auto_38390 ?auto_38389 ) ( not ( = ?auto_38379 ?auto_38390 ) ) ( not ( = ?auto_38386 ?auto_38390 ) ) ( not ( = ?auto_38378 ?auto_38390 ) ) ( SURFACE-AT ?auto_38375 ?auto_38389 ) ( ON ?auto_38375 ?auto_38398 ) ( CLEAR ?auto_38375 ) ( not ( = ?auto_38372 ?auto_38398 ) ) ( not ( = ?auto_38373 ?auto_38398 ) ) ( not ( = ?auto_38380 ?auto_38398 ) ) ( not ( = ?auto_38375 ?auto_38398 ) ) ( not ( = ?auto_38388 ?auto_38398 ) ) ( not ( = ?auto_38383 ?auto_38398 ) ) ( IS-CRATE ?auto_38383 ) ( not ( = ?auto_38372 ?auto_38393 ) ) ( not ( = ?auto_38373 ?auto_38393 ) ) ( not ( = ?auto_38380 ?auto_38393 ) ) ( not ( = ?auto_38375 ?auto_38393 ) ) ( not ( = ?auto_38388 ?auto_38393 ) ) ( not ( = ?auto_38383 ?auto_38393 ) ) ( not ( = ?auto_38398 ?auto_38393 ) ) ( not ( = ?auto_38391 ?auto_38376 ) ) ( not ( = ?auto_38385 ?auto_38391 ) ) ( not ( = ?auto_38381 ?auto_38391 ) ) ( not ( = ?auto_38389 ?auto_38391 ) ) ( HOIST-AT ?auto_38382 ?auto_38391 ) ( not ( = ?auto_38379 ?auto_38382 ) ) ( not ( = ?auto_38386 ?auto_38382 ) ) ( not ( = ?auto_38378 ?auto_38382 ) ) ( not ( = ?auto_38390 ?auto_38382 ) ) ( AVAILABLE ?auto_38382 ) ( SURFACE-AT ?auto_38383 ?auto_38391 ) ( ON ?auto_38383 ?auto_38384 ) ( CLEAR ?auto_38383 ) ( not ( = ?auto_38372 ?auto_38384 ) ) ( not ( = ?auto_38373 ?auto_38384 ) ) ( not ( = ?auto_38380 ?auto_38384 ) ) ( not ( = ?auto_38375 ?auto_38384 ) ) ( not ( = ?auto_38388 ?auto_38384 ) ) ( not ( = ?auto_38383 ?auto_38384 ) ) ( not ( = ?auto_38398 ?auto_38384 ) ) ( not ( = ?auto_38393 ?auto_38384 ) ) ( IS-CRATE ?auto_38393 ) ( not ( = ?auto_38372 ?auto_38396 ) ) ( not ( = ?auto_38373 ?auto_38396 ) ) ( not ( = ?auto_38380 ?auto_38396 ) ) ( not ( = ?auto_38375 ?auto_38396 ) ) ( not ( = ?auto_38388 ?auto_38396 ) ) ( not ( = ?auto_38383 ?auto_38396 ) ) ( not ( = ?auto_38398 ?auto_38396 ) ) ( not ( = ?auto_38393 ?auto_38396 ) ) ( not ( = ?auto_38384 ?auto_38396 ) ) ( not ( = ?auto_38374 ?auto_38376 ) ) ( not ( = ?auto_38385 ?auto_38374 ) ) ( not ( = ?auto_38381 ?auto_38374 ) ) ( not ( = ?auto_38389 ?auto_38374 ) ) ( not ( = ?auto_38391 ?auto_38374 ) ) ( HOIST-AT ?auto_38397 ?auto_38374 ) ( not ( = ?auto_38379 ?auto_38397 ) ) ( not ( = ?auto_38386 ?auto_38397 ) ) ( not ( = ?auto_38378 ?auto_38397 ) ) ( not ( = ?auto_38390 ?auto_38397 ) ) ( not ( = ?auto_38382 ?auto_38397 ) ) ( AVAILABLE ?auto_38397 ) ( SURFACE-AT ?auto_38393 ?auto_38374 ) ( ON ?auto_38393 ?auto_38394 ) ( CLEAR ?auto_38393 ) ( not ( = ?auto_38372 ?auto_38394 ) ) ( not ( = ?auto_38373 ?auto_38394 ) ) ( not ( = ?auto_38380 ?auto_38394 ) ) ( not ( = ?auto_38375 ?auto_38394 ) ) ( not ( = ?auto_38388 ?auto_38394 ) ) ( not ( = ?auto_38383 ?auto_38394 ) ) ( not ( = ?auto_38398 ?auto_38394 ) ) ( not ( = ?auto_38393 ?auto_38394 ) ) ( not ( = ?auto_38384 ?auto_38394 ) ) ( not ( = ?auto_38396 ?auto_38394 ) ) ( IS-CRATE ?auto_38396 ) ( not ( = ?auto_38372 ?auto_38392 ) ) ( not ( = ?auto_38373 ?auto_38392 ) ) ( not ( = ?auto_38380 ?auto_38392 ) ) ( not ( = ?auto_38375 ?auto_38392 ) ) ( not ( = ?auto_38388 ?auto_38392 ) ) ( not ( = ?auto_38383 ?auto_38392 ) ) ( not ( = ?auto_38398 ?auto_38392 ) ) ( not ( = ?auto_38393 ?auto_38392 ) ) ( not ( = ?auto_38384 ?auto_38392 ) ) ( not ( = ?auto_38396 ?auto_38392 ) ) ( not ( = ?auto_38394 ?auto_38392 ) ) ( AVAILABLE ?auto_38390 ) ( SURFACE-AT ?auto_38396 ?auto_38389 ) ( ON ?auto_38396 ?auto_38377 ) ( CLEAR ?auto_38396 ) ( not ( = ?auto_38372 ?auto_38377 ) ) ( not ( = ?auto_38373 ?auto_38377 ) ) ( not ( = ?auto_38380 ?auto_38377 ) ) ( not ( = ?auto_38375 ?auto_38377 ) ) ( not ( = ?auto_38388 ?auto_38377 ) ) ( not ( = ?auto_38383 ?auto_38377 ) ) ( not ( = ?auto_38398 ?auto_38377 ) ) ( not ( = ?auto_38393 ?auto_38377 ) ) ( not ( = ?auto_38384 ?auto_38377 ) ) ( not ( = ?auto_38396 ?auto_38377 ) ) ( not ( = ?auto_38394 ?auto_38377 ) ) ( not ( = ?auto_38392 ?auto_38377 ) ) ( TRUCK-AT ?auto_38387 ?auto_38376 ) ( SURFACE-AT ?auto_38395 ?auto_38376 ) ( CLEAR ?auto_38395 ) ( IS-CRATE ?auto_38392 ) ( not ( = ?auto_38372 ?auto_38395 ) ) ( not ( = ?auto_38373 ?auto_38395 ) ) ( not ( = ?auto_38380 ?auto_38395 ) ) ( not ( = ?auto_38375 ?auto_38395 ) ) ( not ( = ?auto_38388 ?auto_38395 ) ) ( not ( = ?auto_38383 ?auto_38395 ) ) ( not ( = ?auto_38398 ?auto_38395 ) ) ( not ( = ?auto_38393 ?auto_38395 ) ) ( not ( = ?auto_38384 ?auto_38395 ) ) ( not ( = ?auto_38396 ?auto_38395 ) ) ( not ( = ?auto_38394 ?auto_38395 ) ) ( not ( = ?auto_38392 ?auto_38395 ) ) ( not ( = ?auto_38377 ?auto_38395 ) ) ( AVAILABLE ?auto_38379 ) ( IN ?auto_38392 ?auto_38387 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38379 ?auto_38392 ?auto_38387 ?auto_38376 )
      ( MAKE-ON ?auto_38372 ?auto_38373 )
      ( MAKE-ON-VERIFY ?auto_38372 ?auto_38373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38399 - SURFACE
      ?auto_38400 - SURFACE
    )
    :vars
    (
      ?auto_38423 - HOIST
      ?auto_38420 - PLACE
      ?auto_38425 - PLACE
      ?auto_38422 - HOIST
      ?auto_38401 - SURFACE
      ?auto_38405 - SURFACE
      ?auto_38424 - PLACE
      ?auto_38417 - HOIST
      ?auto_38407 - SURFACE
      ?auto_38403 - SURFACE
      ?auto_38416 - PLACE
      ?auto_38409 - HOIST
      ?auto_38421 - SURFACE
      ?auto_38412 - SURFACE
      ?auto_38410 - PLACE
      ?auto_38418 - HOIST
      ?auto_38406 - SURFACE
      ?auto_38415 - SURFACE
      ?auto_38404 - PLACE
      ?auto_38408 - HOIST
      ?auto_38413 - SURFACE
      ?auto_38411 - SURFACE
      ?auto_38419 - SURFACE
      ?auto_38414 - SURFACE
      ?auto_38402 - TRUCK
      ?auto_38426 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38423 ?auto_38420 ) ( IS-CRATE ?auto_38399 ) ( not ( = ?auto_38399 ?auto_38400 ) ) ( not ( = ?auto_38425 ?auto_38420 ) ) ( HOIST-AT ?auto_38422 ?auto_38425 ) ( not ( = ?auto_38423 ?auto_38422 ) ) ( AVAILABLE ?auto_38422 ) ( SURFACE-AT ?auto_38399 ?auto_38425 ) ( ON ?auto_38399 ?auto_38401 ) ( CLEAR ?auto_38399 ) ( not ( = ?auto_38399 ?auto_38401 ) ) ( not ( = ?auto_38400 ?auto_38401 ) ) ( IS-CRATE ?auto_38400 ) ( not ( = ?auto_38399 ?auto_38405 ) ) ( not ( = ?auto_38400 ?auto_38405 ) ) ( not ( = ?auto_38401 ?auto_38405 ) ) ( not ( = ?auto_38424 ?auto_38420 ) ) ( not ( = ?auto_38425 ?auto_38424 ) ) ( HOIST-AT ?auto_38417 ?auto_38424 ) ( not ( = ?auto_38423 ?auto_38417 ) ) ( not ( = ?auto_38422 ?auto_38417 ) ) ( AVAILABLE ?auto_38417 ) ( SURFACE-AT ?auto_38400 ?auto_38424 ) ( ON ?auto_38400 ?auto_38407 ) ( CLEAR ?auto_38400 ) ( not ( = ?auto_38399 ?auto_38407 ) ) ( not ( = ?auto_38400 ?auto_38407 ) ) ( not ( = ?auto_38401 ?auto_38407 ) ) ( not ( = ?auto_38405 ?auto_38407 ) ) ( IS-CRATE ?auto_38405 ) ( not ( = ?auto_38399 ?auto_38403 ) ) ( not ( = ?auto_38400 ?auto_38403 ) ) ( not ( = ?auto_38401 ?auto_38403 ) ) ( not ( = ?auto_38405 ?auto_38403 ) ) ( not ( = ?auto_38407 ?auto_38403 ) ) ( not ( = ?auto_38416 ?auto_38420 ) ) ( not ( = ?auto_38425 ?auto_38416 ) ) ( not ( = ?auto_38424 ?auto_38416 ) ) ( HOIST-AT ?auto_38409 ?auto_38416 ) ( not ( = ?auto_38423 ?auto_38409 ) ) ( not ( = ?auto_38422 ?auto_38409 ) ) ( not ( = ?auto_38417 ?auto_38409 ) ) ( SURFACE-AT ?auto_38405 ?auto_38416 ) ( ON ?auto_38405 ?auto_38421 ) ( CLEAR ?auto_38405 ) ( not ( = ?auto_38399 ?auto_38421 ) ) ( not ( = ?auto_38400 ?auto_38421 ) ) ( not ( = ?auto_38401 ?auto_38421 ) ) ( not ( = ?auto_38405 ?auto_38421 ) ) ( not ( = ?auto_38407 ?auto_38421 ) ) ( not ( = ?auto_38403 ?auto_38421 ) ) ( IS-CRATE ?auto_38403 ) ( not ( = ?auto_38399 ?auto_38412 ) ) ( not ( = ?auto_38400 ?auto_38412 ) ) ( not ( = ?auto_38401 ?auto_38412 ) ) ( not ( = ?auto_38405 ?auto_38412 ) ) ( not ( = ?auto_38407 ?auto_38412 ) ) ( not ( = ?auto_38403 ?auto_38412 ) ) ( not ( = ?auto_38421 ?auto_38412 ) ) ( not ( = ?auto_38410 ?auto_38420 ) ) ( not ( = ?auto_38425 ?auto_38410 ) ) ( not ( = ?auto_38424 ?auto_38410 ) ) ( not ( = ?auto_38416 ?auto_38410 ) ) ( HOIST-AT ?auto_38418 ?auto_38410 ) ( not ( = ?auto_38423 ?auto_38418 ) ) ( not ( = ?auto_38422 ?auto_38418 ) ) ( not ( = ?auto_38417 ?auto_38418 ) ) ( not ( = ?auto_38409 ?auto_38418 ) ) ( AVAILABLE ?auto_38418 ) ( SURFACE-AT ?auto_38403 ?auto_38410 ) ( ON ?auto_38403 ?auto_38406 ) ( CLEAR ?auto_38403 ) ( not ( = ?auto_38399 ?auto_38406 ) ) ( not ( = ?auto_38400 ?auto_38406 ) ) ( not ( = ?auto_38401 ?auto_38406 ) ) ( not ( = ?auto_38405 ?auto_38406 ) ) ( not ( = ?auto_38407 ?auto_38406 ) ) ( not ( = ?auto_38403 ?auto_38406 ) ) ( not ( = ?auto_38421 ?auto_38406 ) ) ( not ( = ?auto_38412 ?auto_38406 ) ) ( IS-CRATE ?auto_38412 ) ( not ( = ?auto_38399 ?auto_38415 ) ) ( not ( = ?auto_38400 ?auto_38415 ) ) ( not ( = ?auto_38401 ?auto_38415 ) ) ( not ( = ?auto_38405 ?auto_38415 ) ) ( not ( = ?auto_38407 ?auto_38415 ) ) ( not ( = ?auto_38403 ?auto_38415 ) ) ( not ( = ?auto_38421 ?auto_38415 ) ) ( not ( = ?auto_38412 ?auto_38415 ) ) ( not ( = ?auto_38406 ?auto_38415 ) ) ( not ( = ?auto_38404 ?auto_38420 ) ) ( not ( = ?auto_38425 ?auto_38404 ) ) ( not ( = ?auto_38424 ?auto_38404 ) ) ( not ( = ?auto_38416 ?auto_38404 ) ) ( not ( = ?auto_38410 ?auto_38404 ) ) ( HOIST-AT ?auto_38408 ?auto_38404 ) ( not ( = ?auto_38423 ?auto_38408 ) ) ( not ( = ?auto_38422 ?auto_38408 ) ) ( not ( = ?auto_38417 ?auto_38408 ) ) ( not ( = ?auto_38409 ?auto_38408 ) ) ( not ( = ?auto_38418 ?auto_38408 ) ) ( AVAILABLE ?auto_38408 ) ( SURFACE-AT ?auto_38412 ?auto_38404 ) ( ON ?auto_38412 ?auto_38413 ) ( CLEAR ?auto_38412 ) ( not ( = ?auto_38399 ?auto_38413 ) ) ( not ( = ?auto_38400 ?auto_38413 ) ) ( not ( = ?auto_38401 ?auto_38413 ) ) ( not ( = ?auto_38405 ?auto_38413 ) ) ( not ( = ?auto_38407 ?auto_38413 ) ) ( not ( = ?auto_38403 ?auto_38413 ) ) ( not ( = ?auto_38421 ?auto_38413 ) ) ( not ( = ?auto_38412 ?auto_38413 ) ) ( not ( = ?auto_38406 ?auto_38413 ) ) ( not ( = ?auto_38415 ?auto_38413 ) ) ( IS-CRATE ?auto_38415 ) ( not ( = ?auto_38399 ?auto_38411 ) ) ( not ( = ?auto_38400 ?auto_38411 ) ) ( not ( = ?auto_38401 ?auto_38411 ) ) ( not ( = ?auto_38405 ?auto_38411 ) ) ( not ( = ?auto_38407 ?auto_38411 ) ) ( not ( = ?auto_38403 ?auto_38411 ) ) ( not ( = ?auto_38421 ?auto_38411 ) ) ( not ( = ?auto_38412 ?auto_38411 ) ) ( not ( = ?auto_38406 ?auto_38411 ) ) ( not ( = ?auto_38415 ?auto_38411 ) ) ( not ( = ?auto_38413 ?auto_38411 ) ) ( AVAILABLE ?auto_38409 ) ( SURFACE-AT ?auto_38415 ?auto_38416 ) ( ON ?auto_38415 ?auto_38419 ) ( CLEAR ?auto_38415 ) ( not ( = ?auto_38399 ?auto_38419 ) ) ( not ( = ?auto_38400 ?auto_38419 ) ) ( not ( = ?auto_38401 ?auto_38419 ) ) ( not ( = ?auto_38405 ?auto_38419 ) ) ( not ( = ?auto_38407 ?auto_38419 ) ) ( not ( = ?auto_38403 ?auto_38419 ) ) ( not ( = ?auto_38421 ?auto_38419 ) ) ( not ( = ?auto_38412 ?auto_38419 ) ) ( not ( = ?auto_38406 ?auto_38419 ) ) ( not ( = ?auto_38415 ?auto_38419 ) ) ( not ( = ?auto_38413 ?auto_38419 ) ) ( not ( = ?auto_38411 ?auto_38419 ) ) ( SURFACE-AT ?auto_38414 ?auto_38420 ) ( CLEAR ?auto_38414 ) ( IS-CRATE ?auto_38411 ) ( not ( = ?auto_38399 ?auto_38414 ) ) ( not ( = ?auto_38400 ?auto_38414 ) ) ( not ( = ?auto_38401 ?auto_38414 ) ) ( not ( = ?auto_38405 ?auto_38414 ) ) ( not ( = ?auto_38407 ?auto_38414 ) ) ( not ( = ?auto_38403 ?auto_38414 ) ) ( not ( = ?auto_38421 ?auto_38414 ) ) ( not ( = ?auto_38412 ?auto_38414 ) ) ( not ( = ?auto_38406 ?auto_38414 ) ) ( not ( = ?auto_38415 ?auto_38414 ) ) ( not ( = ?auto_38413 ?auto_38414 ) ) ( not ( = ?auto_38411 ?auto_38414 ) ) ( not ( = ?auto_38419 ?auto_38414 ) ) ( AVAILABLE ?auto_38423 ) ( IN ?auto_38411 ?auto_38402 ) ( TRUCK-AT ?auto_38402 ?auto_38426 ) ( not ( = ?auto_38426 ?auto_38420 ) ) ( not ( = ?auto_38425 ?auto_38426 ) ) ( not ( = ?auto_38424 ?auto_38426 ) ) ( not ( = ?auto_38416 ?auto_38426 ) ) ( not ( = ?auto_38410 ?auto_38426 ) ) ( not ( = ?auto_38404 ?auto_38426 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38402 ?auto_38426 ?auto_38420 )
      ( MAKE-ON ?auto_38399 ?auto_38400 )
      ( MAKE-ON-VERIFY ?auto_38399 ?auto_38400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38427 - SURFACE
      ?auto_38428 - SURFACE
    )
    :vars
    (
      ?auto_38449 - HOIST
      ?auto_38446 - PLACE
      ?auto_38454 - PLACE
      ?auto_38450 - HOIST
      ?auto_38431 - SURFACE
      ?auto_38453 - SURFACE
      ?auto_38441 - PLACE
      ?auto_38448 - HOIST
      ?auto_38436 - SURFACE
      ?auto_38433 - SURFACE
      ?auto_38430 - PLACE
      ?auto_38444 - HOIST
      ?auto_38445 - SURFACE
      ?auto_38442 - SURFACE
      ?auto_38451 - PLACE
      ?auto_38447 - HOIST
      ?auto_38443 - SURFACE
      ?auto_38435 - SURFACE
      ?auto_38429 - PLACE
      ?auto_38434 - HOIST
      ?auto_38437 - SURFACE
      ?auto_38452 - SURFACE
      ?auto_38432 - SURFACE
      ?auto_38438 - SURFACE
      ?auto_38440 - TRUCK
      ?auto_38439 - PLACE
      ?auto_38455 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38449 ?auto_38446 ) ( IS-CRATE ?auto_38427 ) ( not ( = ?auto_38427 ?auto_38428 ) ) ( not ( = ?auto_38454 ?auto_38446 ) ) ( HOIST-AT ?auto_38450 ?auto_38454 ) ( not ( = ?auto_38449 ?auto_38450 ) ) ( AVAILABLE ?auto_38450 ) ( SURFACE-AT ?auto_38427 ?auto_38454 ) ( ON ?auto_38427 ?auto_38431 ) ( CLEAR ?auto_38427 ) ( not ( = ?auto_38427 ?auto_38431 ) ) ( not ( = ?auto_38428 ?auto_38431 ) ) ( IS-CRATE ?auto_38428 ) ( not ( = ?auto_38427 ?auto_38453 ) ) ( not ( = ?auto_38428 ?auto_38453 ) ) ( not ( = ?auto_38431 ?auto_38453 ) ) ( not ( = ?auto_38441 ?auto_38446 ) ) ( not ( = ?auto_38454 ?auto_38441 ) ) ( HOIST-AT ?auto_38448 ?auto_38441 ) ( not ( = ?auto_38449 ?auto_38448 ) ) ( not ( = ?auto_38450 ?auto_38448 ) ) ( AVAILABLE ?auto_38448 ) ( SURFACE-AT ?auto_38428 ?auto_38441 ) ( ON ?auto_38428 ?auto_38436 ) ( CLEAR ?auto_38428 ) ( not ( = ?auto_38427 ?auto_38436 ) ) ( not ( = ?auto_38428 ?auto_38436 ) ) ( not ( = ?auto_38431 ?auto_38436 ) ) ( not ( = ?auto_38453 ?auto_38436 ) ) ( IS-CRATE ?auto_38453 ) ( not ( = ?auto_38427 ?auto_38433 ) ) ( not ( = ?auto_38428 ?auto_38433 ) ) ( not ( = ?auto_38431 ?auto_38433 ) ) ( not ( = ?auto_38453 ?auto_38433 ) ) ( not ( = ?auto_38436 ?auto_38433 ) ) ( not ( = ?auto_38430 ?auto_38446 ) ) ( not ( = ?auto_38454 ?auto_38430 ) ) ( not ( = ?auto_38441 ?auto_38430 ) ) ( HOIST-AT ?auto_38444 ?auto_38430 ) ( not ( = ?auto_38449 ?auto_38444 ) ) ( not ( = ?auto_38450 ?auto_38444 ) ) ( not ( = ?auto_38448 ?auto_38444 ) ) ( SURFACE-AT ?auto_38453 ?auto_38430 ) ( ON ?auto_38453 ?auto_38445 ) ( CLEAR ?auto_38453 ) ( not ( = ?auto_38427 ?auto_38445 ) ) ( not ( = ?auto_38428 ?auto_38445 ) ) ( not ( = ?auto_38431 ?auto_38445 ) ) ( not ( = ?auto_38453 ?auto_38445 ) ) ( not ( = ?auto_38436 ?auto_38445 ) ) ( not ( = ?auto_38433 ?auto_38445 ) ) ( IS-CRATE ?auto_38433 ) ( not ( = ?auto_38427 ?auto_38442 ) ) ( not ( = ?auto_38428 ?auto_38442 ) ) ( not ( = ?auto_38431 ?auto_38442 ) ) ( not ( = ?auto_38453 ?auto_38442 ) ) ( not ( = ?auto_38436 ?auto_38442 ) ) ( not ( = ?auto_38433 ?auto_38442 ) ) ( not ( = ?auto_38445 ?auto_38442 ) ) ( not ( = ?auto_38451 ?auto_38446 ) ) ( not ( = ?auto_38454 ?auto_38451 ) ) ( not ( = ?auto_38441 ?auto_38451 ) ) ( not ( = ?auto_38430 ?auto_38451 ) ) ( HOIST-AT ?auto_38447 ?auto_38451 ) ( not ( = ?auto_38449 ?auto_38447 ) ) ( not ( = ?auto_38450 ?auto_38447 ) ) ( not ( = ?auto_38448 ?auto_38447 ) ) ( not ( = ?auto_38444 ?auto_38447 ) ) ( AVAILABLE ?auto_38447 ) ( SURFACE-AT ?auto_38433 ?auto_38451 ) ( ON ?auto_38433 ?auto_38443 ) ( CLEAR ?auto_38433 ) ( not ( = ?auto_38427 ?auto_38443 ) ) ( not ( = ?auto_38428 ?auto_38443 ) ) ( not ( = ?auto_38431 ?auto_38443 ) ) ( not ( = ?auto_38453 ?auto_38443 ) ) ( not ( = ?auto_38436 ?auto_38443 ) ) ( not ( = ?auto_38433 ?auto_38443 ) ) ( not ( = ?auto_38445 ?auto_38443 ) ) ( not ( = ?auto_38442 ?auto_38443 ) ) ( IS-CRATE ?auto_38442 ) ( not ( = ?auto_38427 ?auto_38435 ) ) ( not ( = ?auto_38428 ?auto_38435 ) ) ( not ( = ?auto_38431 ?auto_38435 ) ) ( not ( = ?auto_38453 ?auto_38435 ) ) ( not ( = ?auto_38436 ?auto_38435 ) ) ( not ( = ?auto_38433 ?auto_38435 ) ) ( not ( = ?auto_38445 ?auto_38435 ) ) ( not ( = ?auto_38442 ?auto_38435 ) ) ( not ( = ?auto_38443 ?auto_38435 ) ) ( not ( = ?auto_38429 ?auto_38446 ) ) ( not ( = ?auto_38454 ?auto_38429 ) ) ( not ( = ?auto_38441 ?auto_38429 ) ) ( not ( = ?auto_38430 ?auto_38429 ) ) ( not ( = ?auto_38451 ?auto_38429 ) ) ( HOIST-AT ?auto_38434 ?auto_38429 ) ( not ( = ?auto_38449 ?auto_38434 ) ) ( not ( = ?auto_38450 ?auto_38434 ) ) ( not ( = ?auto_38448 ?auto_38434 ) ) ( not ( = ?auto_38444 ?auto_38434 ) ) ( not ( = ?auto_38447 ?auto_38434 ) ) ( AVAILABLE ?auto_38434 ) ( SURFACE-AT ?auto_38442 ?auto_38429 ) ( ON ?auto_38442 ?auto_38437 ) ( CLEAR ?auto_38442 ) ( not ( = ?auto_38427 ?auto_38437 ) ) ( not ( = ?auto_38428 ?auto_38437 ) ) ( not ( = ?auto_38431 ?auto_38437 ) ) ( not ( = ?auto_38453 ?auto_38437 ) ) ( not ( = ?auto_38436 ?auto_38437 ) ) ( not ( = ?auto_38433 ?auto_38437 ) ) ( not ( = ?auto_38445 ?auto_38437 ) ) ( not ( = ?auto_38442 ?auto_38437 ) ) ( not ( = ?auto_38443 ?auto_38437 ) ) ( not ( = ?auto_38435 ?auto_38437 ) ) ( IS-CRATE ?auto_38435 ) ( not ( = ?auto_38427 ?auto_38452 ) ) ( not ( = ?auto_38428 ?auto_38452 ) ) ( not ( = ?auto_38431 ?auto_38452 ) ) ( not ( = ?auto_38453 ?auto_38452 ) ) ( not ( = ?auto_38436 ?auto_38452 ) ) ( not ( = ?auto_38433 ?auto_38452 ) ) ( not ( = ?auto_38445 ?auto_38452 ) ) ( not ( = ?auto_38442 ?auto_38452 ) ) ( not ( = ?auto_38443 ?auto_38452 ) ) ( not ( = ?auto_38435 ?auto_38452 ) ) ( not ( = ?auto_38437 ?auto_38452 ) ) ( AVAILABLE ?auto_38444 ) ( SURFACE-AT ?auto_38435 ?auto_38430 ) ( ON ?auto_38435 ?auto_38432 ) ( CLEAR ?auto_38435 ) ( not ( = ?auto_38427 ?auto_38432 ) ) ( not ( = ?auto_38428 ?auto_38432 ) ) ( not ( = ?auto_38431 ?auto_38432 ) ) ( not ( = ?auto_38453 ?auto_38432 ) ) ( not ( = ?auto_38436 ?auto_38432 ) ) ( not ( = ?auto_38433 ?auto_38432 ) ) ( not ( = ?auto_38445 ?auto_38432 ) ) ( not ( = ?auto_38442 ?auto_38432 ) ) ( not ( = ?auto_38443 ?auto_38432 ) ) ( not ( = ?auto_38435 ?auto_38432 ) ) ( not ( = ?auto_38437 ?auto_38432 ) ) ( not ( = ?auto_38452 ?auto_38432 ) ) ( SURFACE-AT ?auto_38438 ?auto_38446 ) ( CLEAR ?auto_38438 ) ( IS-CRATE ?auto_38452 ) ( not ( = ?auto_38427 ?auto_38438 ) ) ( not ( = ?auto_38428 ?auto_38438 ) ) ( not ( = ?auto_38431 ?auto_38438 ) ) ( not ( = ?auto_38453 ?auto_38438 ) ) ( not ( = ?auto_38436 ?auto_38438 ) ) ( not ( = ?auto_38433 ?auto_38438 ) ) ( not ( = ?auto_38445 ?auto_38438 ) ) ( not ( = ?auto_38442 ?auto_38438 ) ) ( not ( = ?auto_38443 ?auto_38438 ) ) ( not ( = ?auto_38435 ?auto_38438 ) ) ( not ( = ?auto_38437 ?auto_38438 ) ) ( not ( = ?auto_38452 ?auto_38438 ) ) ( not ( = ?auto_38432 ?auto_38438 ) ) ( AVAILABLE ?auto_38449 ) ( TRUCK-AT ?auto_38440 ?auto_38439 ) ( not ( = ?auto_38439 ?auto_38446 ) ) ( not ( = ?auto_38454 ?auto_38439 ) ) ( not ( = ?auto_38441 ?auto_38439 ) ) ( not ( = ?auto_38430 ?auto_38439 ) ) ( not ( = ?auto_38451 ?auto_38439 ) ) ( not ( = ?auto_38429 ?auto_38439 ) ) ( HOIST-AT ?auto_38455 ?auto_38439 ) ( LIFTING ?auto_38455 ?auto_38452 ) ( not ( = ?auto_38449 ?auto_38455 ) ) ( not ( = ?auto_38450 ?auto_38455 ) ) ( not ( = ?auto_38448 ?auto_38455 ) ) ( not ( = ?auto_38444 ?auto_38455 ) ) ( not ( = ?auto_38447 ?auto_38455 ) ) ( not ( = ?auto_38434 ?auto_38455 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38455 ?auto_38452 ?auto_38440 ?auto_38439 )
      ( MAKE-ON ?auto_38427 ?auto_38428 )
      ( MAKE-ON-VERIFY ?auto_38427 ?auto_38428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38456 - SURFACE
      ?auto_38457 - SURFACE
    )
    :vars
    (
      ?auto_38468 - HOIST
      ?auto_38465 - PLACE
      ?auto_38462 - PLACE
      ?auto_38469 - HOIST
      ?auto_38482 - SURFACE
      ?auto_38461 - SURFACE
      ?auto_38479 - PLACE
      ?auto_38467 - HOIST
      ?auto_38460 - SURFACE
      ?auto_38476 - SURFACE
      ?auto_38475 - PLACE
      ?auto_38471 - HOIST
      ?auto_38464 - SURFACE
      ?auto_38478 - SURFACE
      ?auto_38470 - PLACE
      ?auto_38466 - HOIST
      ?auto_38472 - SURFACE
      ?auto_38458 - SURFACE
      ?auto_38483 - PLACE
      ?auto_38474 - HOIST
      ?auto_38459 - SURFACE
      ?auto_38463 - SURFACE
      ?auto_38481 - SURFACE
      ?auto_38480 - SURFACE
      ?auto_38477 - TRUCK
      ?auto_38473 - PLACE
      ?auto_38484 - HOIST
      ?auto_38485 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38468 ?auto_38465 ) ( IS-CRATE ?auto_38456 ) ( not ( = ?auto_38456 ?auto_38457 ) ) ( not ( = ?auto_38462 ?auto_38465 ) ) ( HOIST-AT ?auto_38469 ?auto_38462 ) ( not ( = ?auto_38468 ?auto_38469 ) ) ( AVAILABLE ?auto_38469 ) ( SURFACE-AT ?auto_38456 ?auto_38462 ) ( ON ?auto_38456 ?auto_38482 ) ( CLEAR ?auto_38456 ) ( not ( = ?auto_38456 ?auto_38482 ) ) ( not ( = ?auto_38457 ?auto_38482 ) ) ( IS-CRATE ?auto_38457 ) ( not ( = ?auto_38456 ?auto_38461 ) ) ( not ( = ?auto_38457 ?auto_38461 ) ) ( not ( = ?auto_38482 ?auto_38461 ) ) ( not ( = ?auto_38479 ?auto_38465 ) ) ( not ( = ?auto_38462 ?auto_38479 ) ) ( HOIST-AT ?auto_38467 ?auto_38479 ) ( not ( = ?auto_38468 ?auto_38467 ) ) ( not ( = ?auto_38469 ?auto_38467 ) ) ( AVAILABLE ?auto_38467 ) ( SURFACE-AT ?auto_38457 ?auto_38479 ) ( ON ?auto_38457 ?auto_38460 ) ( CLEAR ?auto_38457 ) ( not ( = ?auto_38456 ?auto_38460 ) ) ( not ( = ?auto_38457 ?auto_38460 ) ) ( not ( = ?auto_38482 ?auto_38460 ) ) ( not ( = ?auto_38461 ?auto_38460 ) ) ( IS-CRATE ?auto_38461 ) ( not ( = ?auto_38456 ?auto_38476 ) ) ( not ( = ?auto_38457 ?auto_38476 ) ) ( not ( = ?auto_38482 ?auto_38476 ) ) ( not ( = ?auto_38461 ?auto_38476 ) ) ( not ( = ?auto_38460 ?auto_38476 ) ) ( not ( = ?auto_38475 ?auto_38465 ) ) ( not ( = ?auto_38462 ?auto_38475 ) ) ( not ( = ?auto_38479 ?auto_38475 ) ) ( HOIST-AT ?auto_38471 ?auto_38475 ) ( not ( = ?auto_38468 ?auto_38471 ) ) ( not ( = ?auto_38469 ?auto_38471 ) ) ( not ( = ?auto_38467 ?auto_38471 ) ) ( SURFACE-AT ?auto_38461 ?auto_38475 ) ( ON ?auto_38461 ?auto_38464 ) ( CLEAR ?auto_38461 ) ( not ( = ?auto_38456 ?auto_38464 ) ) ( not ( = ?auto_38457 ?auto_38464 ) ) ( not ( = ?auto_38482 ?auto_38464 ) ) ( not ( = ?auto_38461 ?auto_38464 ) ) ( not ( = ?auto_38460 ?auto_38464 ) ) ( not ( = ?auto_38476 ?auto_38464 ) ) ( IS-CRATE ?auto_38476 ) ( not ( = ?auto_38456 ?auto_38478 ) ) ( not ( = ?auto_38457 ?auto_38478 ) ) ( not ( = ?auto_38482 ?auto_38478 ) ) ( not ( = ?auto_38461 ?auto_38478 ) ) ( not ( = ?auto_38460 ?auto_38478 ) ) ( not ( = ?auto_38476 ?auto_38478 ) ) ( not ( = ?auto_38464 ?auto_38478 ) ) ( not ( = ?auto_38470 ?auto_38465 ) ) ( not ( = ?auto_38462 ?auto_38470 ) ) ( not ( = ?auto_38479 ?auto_38470 ) ) ( not ( = ?auto_38475 ?auto_38470 ) ) ( HOIST-AT ?auto_38466 ?auto_38470 ) ( not ( = ?auto_38468 ?auto_38466 ) ) ( not ( = ?auto_38469 ?auto_38466 ) ) ( not ( = ?auto_38467 ?auto_38466 ) ) ( not ( = ?auto_38471 ?auto_38466 ) ) ( AVAILABLE ?auto_38466 ) ( SURFACE-AT ?auto_38476 ?auto_38470 ) ( ON ?auto_38476 ?auto_38472 ) ( CLEAR ?auto_38476 ) ( not ( = ?auto_38456 ?auto_38472 ) ) ( not ( = ?auto_38457 ?auto_38472 ) ) ( not ( = ?auto_38482 ?auto_38472 ) ) ( not ( = ?auto_38461 ?auto_38472 ) ) ( not ( = ?auto_38460 ?auto_38472 ) ) ( not ( = ?auto_38476 ?auto_38472 ) ) ( not ( = ?auto_38464 ?auto_38472 ) ) ( not ( = ?auto_38478 ?auto_38472 ) ) ( IS-CRATE ?auto_38478 ) ( not ( = ?auto_38456 ?auto_38458 ) ) ( not ( = ?auto_38457 ?auto_38458 ) ) ( not ( = ?auto_38482 ?auto_38458 ) ) ( not ( = ?auto_38461 ?auto_38458 ) ) ( not ( = ?auto_38460 ?auto_38458 ) ) ( not ( = ?auto_38476 ?auto_38458 ) ) ( not ( = ?auto_38464 ?auto_38458 ) ) ( not ( = ?auto_38478 ?auto_38458 ) ) ( not ( = ?auto_38472 ?auto_38458 ) ) ( not ( = ?auto_38483 ?auto_38465 ) ) ( not ( = ?auto_38462 ?auto_38483 ) ) ( not ( = ?auto_38479 ?auto_38483 ) ) ( not ( = ?auto_38475 ?auto_38483 ) ) ( not ( = ?auto_38470 ?auto_38483 ) ) ( HOIST-AT ?auto_38474 ?auto_38483 ) ( not ( = ?auto_38468 ?auto_38474 ) ) ( not ( = ?auto_38469 ?auto_38474 ) ) ( not ( = ?auto_38467 ?auto_38474 ) ) ( not ( = ?auto_38471 ?auto_38474 ) ) ( not ( = ?auto_38466 ?auto_38474 ) ) ( AVAILABLE ?auto_38474 ) ( SURFACE-AT ?auto_38478 ?auto_38483 ) ( ON ?auto_38478 ?auto_38459 ) ( CLEAR ?auto_38478 ) ( not ( = ?auto_38456 ?auto_38459 ) ) ( not ( = ?auto_38457 ?auto_38459 ) ) ( not ( = ?auto_38482 ?auto_38459 ) ) ( not ( = ?auto_38461 ?auto_38459 ) ) ( not ( = ?auto_38460 ?auto_38459 ) ) ( not ( = ?auto_38476 ?auto_38459 ) ) ( not ( = ?auto_38464 ?auto_38459 ) ) ( not ( = ?auto_38478 ?auto_38459 ) ) ( not ( = ?auto_38472 ?auto_38459 ) ) ( not ( = ?auto_38458 ?auto_38459 ) ) ( IS-CRATE ?auto_38458 ) ( not ( = ?auto_38456 ?auto_38463 ) ) ( not ( = ?auto_38457 ?auto_38463 ) ) ( not ( = ?auto_38482 ?auto_38463 ) ) ( not ( = ?auto_38461 ?auto_38463 ) ) ( not ( = ?auto_38460 ?auto_38463 ) ) ( not ( = ?auto_38476 ?auto_38463 ) ) ( not ( = ?auto_38464 ?auto_38463 ) ) ( not ( = ?auto_38478 ?auto_38463 ) ) ( not ( = ?auto_38472 ?auto_38463 ) ) ( not ( = ?auto_38458 ?auto_38463 ) ) ( not ( = ?auto_38459 ?auto_38463 ) ) ( AVAILABLE ?auto_38471 ) ( SURFACE-AT ?auto_38458 ?auto_38475 ) ( ON ?auto_38458 ?auto_38481 ) ( CLEAR ?auto_38458 ) ( not ( = ?auto_38456 ?auto_38481 ) ) ( not ( = ?auto_38457 ?auto_38481 ) ) ( not ( = ?auto_38482 ?auto_38481 ) ) ( not ( = ?auto_38461 ?auto_38481 ) ) ( not ( = ?auto_38460 ?auto_38481 ) ) ( not ( = ?auto_38476 ?auto_38481 ) ) ( not ( = ?auto_38464 ?auto_38481 ) ) ( not ( = ?auto_38478 ?auto_38481 ) ) ( not ( = ?auto_38472 ?auto_38481 ) ) ( not ( = ?auto_38458 ?auto_38481 ) ) ( not ( = ?auto_38459 ?auto_38481 ) ) ( not ( = ?auto_38463 ?auto_38481 ) ) ( SURFACE-AT ?auto_38480 ?auto_38465 ) ( CLEAR ?auto_38480 ) ( IS-CRATE ?auto_38463 ) ( not ( = ?auto_38456 ?auto_38480 ) ) ( not ( = ?auto_38457 ?auto_38480 ) ) ( not ( = ?auto_38482 ?auto_38480 ) ) ( not ( = ?auto_38461 ?auto_38480 ) ) ( not ( = ?auto_38460 ?auto_38480 ) ) ( not ( = ?auto_38476 ?auto_38480 ) ) ( not ( = ?auto_38464 ?auto_38480 ) ) ( not ( = ?auto_38478 ?auto_38480 ) ) ( not ( = ?auto_38472 ?auto_38480 ) ) ( not ( = ?auto_38458 ?auto_38480 ) ) ( not ( = ?auto_38459 ?auto_38480 ) ) ( not ( = ?auto_38463 ?auto_38480 ) ) ( not ( = ?auto_38481 ?auto_38480 ) ) ( AVAILABLE ?auto_38468 ) ( TRUCK-AT ?auto_38477 ?auto_38473 ) ( not ( = ?auto_38473 ?auto_38465 ) ) ( not ( = ?auto_38462 ?auto_38473 ) ) ( not ( = ?auto_38479 ?auto_38473 ) ) ( not ( = ?auto_38475 ?auto_38473 ) ) ( not ( = ?auto_38470 ?auto_38473 ) ) ( not ( = ?auto_38483 ?auto_38473 ) ) ( HOIST-AT ?auto_38484 ?auto_38473 ) ( not ( = ?auto_38468 ?auto_38484 ) ) ( not ( = ?auto_38469 ?auto_38484 ) ) ( not ( = ?auto_38467 ?auto_38484 ) ) ( not ( = ?auto_38471 ?auto_38484 ) ) ( not ( = ?auto_38466 ?auto_38484 ) ) ( not ( = ?auto_38474 ?auto_38484 ) ) ( AVAILABLE ?auto_38484 ) ( SURFACE-AT ?auto_38463 ?auto_38473 ) ( ON ?auto_38463 ?auto_38485 ) ( CLEAR ?auto_38463 ) ( not ( = ?auto_38456 ?auto_38485 ) ) ( not ( = ?auto_38457 ?auto_38485 ) ) ( not ( = ?auto_38482 ?auto_38485 ) ) ( not ( = ?auto_38461 ?auto_38485 ) ) ( not ( = ?auto_38460 ?auto_38485 ) ) ( not ( = ?auto_38476 ?auto_38485 ) ) ( not ( = ?auto_38464 ?auto_38485 ) ) ( not ( = ?auto_38478 ?auto_38485 ) ) ( not ( = ?auto_38472 ?auto_38485 ) ) ( not ( = ?auto_38458 ?auto_38485 ) ) ( not ( = ?auto_38459 ?auto_38485 ) ) ( not ( = ?auto_38463 ?auto_38485 ) ) ( not ( = ?auto_38481 ?auto_38485 ) ) ( not ( = ?auto_38480 ?auto_38485 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38484 ?auto_38463 ?auto_38485 ?auto_38473 )
      ( MAKE-ON ?auto_38456 ?auto_38457 )
      ( MAKE-ON-VERIFY ?auto_38456 ?auto_38457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38486 - SURFACE
      ?auto_38487 - SURFACE
    )
    :vars
    (
      ?auto_38494 - HOIST
      ?auto_38514 - PLACE
      ?auto_38499 - PLACE
      ?auto_38489 - HOIST
      ?auto_38492 - SURFACE
      ?auto_38513 - SURFACE
      ?auto_38506 - PLACE
      ?auto_38511 - HOIST
      ?auto_38510 - SURFACE
      ?auto_38503 - SURFACE
      ?auto_38502 - PLACE
      ?auto_38497 - HOIST
      ?auto_38509 - SURFACE
      ?auto_38505 - SURFACE
      ?auto_38512 - PLACE
      ?auto_38493 - HOIST
      ?auto_38488 - SURFACE
      ?auto_38495 - SURFACE
      ?auto_38491 - PLACE
      ?auto_38501 - HOIST
      ?auto_38498 - SURFACE
      ?auto_38515 - SURFACE
      ?auto_38500 - SURFACE
      ?auto_38507 - SURFACE
      ?auto_38508 - PLACE
      ?auto_38490 - HOIST
      ?auto_38496 - SURFACE
      ?auto_38504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38494 ?auto_38514 ) ( IS-CRATE ?auto_38486 ) ( not ( = ?auto_38486 ?auto_38487 ) ) ( not ( = ?auto_38499 ?auto_38514 ) ) ( HOIST-AT ?auto_38489 ?auto_38499 ) ( not ( = ?auto_38494 ?auto_38489 ) ) ( AVAILABLE ?auto_38489 ) ( SURFACE-AT ?auto_38486 ?auto_38499 ) ( ON ?auto_38486 ?auto_38492 ) ( CLEAR ?auto_38486 ) ( not ( = ?auto_38486 ?auto_38492 ) ) ( not ( = ?auto_38487 ?auto_38492 ) ) ( IS-CRATE ?auto_38487 ) ( not ( = ?auto_38486 ?auto_38513 ) ) ( not ( = ?auto_38487 ?auto_38513 ) ) ( not ( = ?auto_38492 ?auto_38513 ) ) ( not ( = ?auto_38506 ?auto_38514 ) ) ( not ( = ?auto_38499 ?auto_38506 ) ) ( HOIST-AT ?auto_38511 ?auto_38506 ) ( not ( = ?auto_38494 ?auto_38511 ) ) ( not ( = ?auto_38489 ?auto_38511 ) ) ( AVAILABLE ?auto_38511 ) ( SURFACE-AT ?auto_38487 ?auto_38506 ) ( ON ?auto_38487 ?auto_38510 ) ( CLEAR ?auto_38487 ) ( not ( = ?auto_38486 ?auto_38510 ) ) ( not ( = ?auto_38487 ?auto_38510 ) ) ( not ( = ?auto_38492 ?auto_38510 ) ) ( not ( = ?auto_38513 ?auto_38510 ) ) ( IS-CRATE ?auto_38513 ) ( not ( = ?auto_38486 ?auto_38503 ) ) ( not ( = ?auto_38487 ?auto_38503 ) ) ( not ( = ?auto_38492 ?auto_38503 ) ) ( not ( = ?auto_38513 ?auto_38503 ) ) ( not ( = ?auto_38510 ?auto_38503 ) ) ( not ( = ?auto_38502 ?auto_38514 ) ) ( not ( = ?auto_38499 ?auto_38502 ) ) ( not ( = ?auto_38506 ?auto_38502 ) ) ( HOIST-AT ?auto_38497 ?auto_38502 ) ( not ( = ?auto_38494 ?auto_38497 ) ) ( not ( = ?auto_38489 ?auto_38497 ) ) ( not ( = ?auto_38511 ?auto_38497 ) ) ( SURFACE-AT ?auto_38513 ?auto_38502 ) ( ON ?auto_38513 ?auto_38509 ) ( CLEAR ?auto_38513 ) ( not ( = ?auto_38486 ?auto_38509 ) ) ( not ( = ?auto_38487 ?auto_38509 ) ) ( not ( = ?auto_38492 ?auto_38509 ) ) ( not ( = ?auto_38513 ?auto_38509 ) ) ( not ( = ?auto_38510 ?auto_38509 ) ) ( not ( = ?auto_38503 ?auto_38509 ) ) ( IS-CRATE ?auto_38503 ) ( not ( = ?auto_38486 ?auto_38505 ) ) ( not ( = ?auto_38487 ?auto_38505 ) ) ( not ( = ?auto_38492 ?auto_38505 ) ) ( not ( = ?auto_38513 ?auto_38505 ) ) ( not ( = ?auto_38510 ?auto_38505 ) ) ( not ( = ?auto_38503 ?auto_38505 ) ) ( not ( = ?auto_38509 ?auto_38505 ) ) ( not ( = ?auto_38512 ?auto_38514 ) ) ( not ( = ?auto_38499 ?auto_38512 ) ) ( not ( = ?auto_38506 ?auto_38512 ) ) ( not ( = ?auto_38502 ?auto_38512 ) ) ( HOIST-AT ?auto_38493 ?auto_38512 ) ( not ( = ?auto_38494 ?auto_38493 ) ) ( not ( = ?auto_38489 ?auto_38493 ) ) ( not ( = ?auto_38511 ?auto_38493 ) ) ( not ( = ?auto_38497 ?auto_38493 ) ) ( AVAILABLE ?auto_38493 ) ( SURFACE-AT ?auto_38503 ?auto_38512 ) ( ON ?auto_38503 ?auto_38488 ) ( CLEAR ?auto_38503 ) ( not ( = ?auto_38486 ?auto_38488 ) ) ( not ( = ?auto_38487 ?auto_38488 ) ) ( not ( = ?auto_38492 ?auto_38488 ) ) ( not ( = ?auto_38513 ?auto_38488 ) ) ( not ( = ?auto_38510 ?auto_38488 ) ) ( not ( = ?auto_38503 ?auto_38488 ) ) ( not ( = ?auto_38509 ?auto_38488 ) ) ( not ( = ?auto_38505 ?auto_38488 ) ) ( IS-CRATE ?auto_38505 ) ( not ( = ?auto_38486 ?auto_38495 ) ) ( not ( = ?auto_38487 ?auto_38495 ) ) ( not ( = ?auto_38492 ?auto_38495 ) ) ( not ( = ?auto_38513 ?auto_38495 ) ) ( not ( = ?auto_38510 ?auto_38495 ) ) ( not ( = ?auto_38503 ?auto_38495 ) ) ( not ( = ?auto_38509 ?auto_38495 ) ) ( not ( = ?auto_38505 ?auto_38495 ) ) ( not ( = ?auto_38488 ?auto_38495 ) ) ( not ( = ?auto_38491 ?auto_38514 ) ) ( not ( = ?auto_38499 ?auto_38491 ) ) ( not ( = ?auto_38506 ?auto_38491 ) ) ( not ( = ?auto_38502 ?auto_38491 ) ) ( not ( = ?auto_38512 ?auto_38491 ) ) ( HOIST-AT ?auto_38501 ?auto_38491 ) ( not ( = ?auto_38494 ?auto_38501 ) ) ( not ( = ?auto_38489 ?auto_38501 ) ) ( not ( = ?auto_38511 ?auto_38501 ) ) ( not ( = ?auto_38497 ?auto_38501 ) ) ( not ( = ?auto_38493 ?auto_38501 ) ) ( AVAILABLE ?auto_38501 ) ( SURFACE-AT ?auto_38505 ?auto_38491 ) ( ON ?auto_38505 ?auto_38498 ) ( CLEAR ?auto_38505 ) ( not ( = ?auto_38486 ?auto_38498 ) ) ( not ( = ?auto_38487 ?auto_38498 ) ) ( not ( = ?auto_38492 ?auto_38498 ) ) ( not ( = ?auto_38513 ?auto_38498 ) ) ( not ( = ?auto_38510 ?auto_38498 ) ) ( not ( = ?auto_38503 ?auto_38498 ) ) ( not ( = ?auto_38509 ?auto_38498 ) ) ( not ( = ?auto_38505 ?auto_38498 ) ) ( not ( = ?auto_38488 ?auto_38498 ) ) ( not ( = ?auto_38495 ?auto_38498 ) ) ( IS-CRATE ?auto_38495 ) ( not ( = ?auto_38486 ?auto_38515 ) ) ( not ( = ?auto_38487 ?auto_38515 ) ) ( not ( = ?auto_38492 ?auto_38515 ) ) ( not ( = ?auto_38513 ?auto_38515 ) ) ( not ( = ?auto_38510 ?auto_38515 ) ) ( not ( = ?auto_38503 ?auto_38515 ) ) ( not ( = ?auto_38509 ?auto_38515 ) ) ( not ( = ?auto_38505 ?auto_38515 ) ) ( not ( = ?auto_38488 ?auto_38515 ) ) ( not ( = ?auto_38495 ?auto_38515 ) ) ( not ( = ?auto_38498 ?auto_38515 ) ) ( AVAILABLE ?auto_38497 ) ( SURFACE-AT ?auto_38495 ?auto_38502 ) ( ON ?auto_38495 ?auto_38500 ) ( CLEAR ?auto_38495 ) ( not ( = ?auto_38486 ?auto_38500 ) ) ( not ( = ?auto_38487 ?auto_38500 ) ) ( not ( = ?auto_38492 ?auto_38500 ) ) ( not ( = ?auto_38513 ?auto_38500 ) ) ( not ( = ?auto_38510 ?auto_38500 ) ) ( not ( = ?auto_38503 ?auto_38500 ) ) ( not ( = ?auto_38509 ?auto_38500 ) ) ( not ( = ?auto_38505 ?auto_38500 ) ) ( not ( = ?auto_38488 ?auto_38500 ) ) ( not ( = ?auto_38495 ?auto_38500 ) ) ( not ( = ?auto_38498 ?auto_38500 ) ) ( not ( = ?auto_38515 ?auto_38500 ) ) ( SURFACE-AT ?auto_38507 ?auto_38514 ) ( CLEAR ?auto_38507 ) ( IS-CRATE ?auto_38515 ) ( not ( = ?auto_38486 ?auto_38507 ) ) ( not ( = ?auto_38487 ?auto_38507 ) ) ( not ( = ?auto_38492 ?auto_38507 ) ) ( not ( = ?auto_38513 ?auto_38507 ) ) ( not ( = ?auto_38510 ?auto_38507 ) ) ( not ( = ?auto_38503 ?auto_38507 ) ) ( not ( = ?auto_38509 ?auto_38507 ) ) ( not ( = ?auto_38505 ?auto_38507 ) ) ( not ( = ?auto_38488 ?auto_38507 ) ) ( not ( = ?auto_38495 ?auto_38507 ) ) ( not ( = ?auto_38498 ?auto_38507 ) ) ( not ( = ?auto_38515 ?auto_38507 ) ) ( not ( = ?auto_38500 ?auto_38507 ) ) ( AVAILABLE ?auto_38494 ) ( not ( = ?auto_38508 ?auto_38514 ) ) ( not ( = ?auto_38499 ?auto_38508 ) ) ( not ( = ?auto_38506 ?auto_38508 ) ) ( not ( = ?auto_38502 ?auto_38508 ) ) ( not ( = ?auto_38512 ?auto_38508 ) ) ( not ( = ?auto_38491 ?auto_38508 ) ) ( HOIST-AT ?auto_38490 ?auto_38508 ) ( not ( = ?auto_38494 ?auto_38490 ) ) ( not ( = ?auto_38489 ?auto_38490 ) ) ( not ( = ?auto_38511 ?auto_38490 ) ) ( not ( = ?auto_38497 ?auto_38490 ) ) ( not ( = ?auto_38493 ?auto_38490 ) ) ( not ( = ?auto_38501 ?auto_38490 ) ) ( AVAILABLE ?auto_38490 ) ( SURFACE-AT ?auto_38515 ?auto_38508 ) ( ON ?auto_38515 ?auto_38496 ) ( CLEAR ?auto_38515 ) ( not ( = ?auto_38486 ?auto_38496 ) ) ( not ( = ?auto_38487 ?auto_38496 ) ) ( not ( = ?auto_38492 ?auto_38496 ) ) ( not ( = ?auto_38513 ?auto_38496 ) ) ( not ( = ?auto_38510 ?auto_38496 ) ) ( not ( = ?auto_38503 ?auto_38496 ) ) ( not ( = ?auto_38509 ?auto_38496 ) ) ( not ( = ?auto_38505 ?auto_38496 ) ) ( not ( = ?auto_38488 ?auto_38496 ) ) ( not ( = ?auto_38495 ?auto_38496 ) ) ( not ( = ?auto_38498 ?auto_38496 ) ) ( not ( = ?auto_38515 ?auto_38496 ) ) ( not ( = ?auto_38500 ?auto_38496 ) ) ( not ( = ?auto_38507 ?auto_38496 ) ) ( TRUCK-AT ?auto_38504 ?auto_38514 ) )
    :subtasks
    ( ( !DRIVE ?auto_38504 ?auto_38514 ?auto_38508 )
      ( MAKE-ON ?auto_38486 ?auto_38487 )
      ( MAKE-ON-VERIFY ?auto_38486 ?auto_38487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38518 - SURFACE
      ?auto_38519 - SURFACE
    )
    :vars
    (
      ?auto_38520 - HOIST
      ?auto_38521 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38520 ?auto_38521 ) ( SURFACE-AT ?auto_38519 ?auto_38521 ) ( CLEAR ?auto_38519 ) ( LIFTING ?auto_38520 ?auto_38518 ) ( IS-CRATE ?auto_38518 ) ( not ( = ?auto_38518 ?auto_38519 ) ) )
    :subtasks
    ( ( !DROP ?auto_38520 ?auto_38518 ?auto_38519 ?auto_38521 )
      ( MAKE-ON-VERIFY ?auto_38518 ?auto_38519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38522 - SURFACE
      ?auto_38523 - SURFACE
    )
    :vars
    (
      ?auto_38524 - HOIST
      ?auto_38525 - PLACE
      ?auto_38526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38524 ?auto_38525 ) ( SURFACE-AT ?auto_38523 ?auto_38525 ) ( CLEAR ?auto_38523 ) ( IS-CRATE ?auto_38522 ) ( not ( = ?auto_38522 ?auto_38523 ) ) ( TRUCK-AT ?auto_38526 ?auto_38525 ) ( AVAILABLE ?auto_38524 ) ( IN ?auto_38522 ?auto_38526 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38524 ?auto_38522 ?auto_38526 ?auto_38525 )
      ( MAKE-ON ?auto_38522 ?auto_38523 )
      ( MAKE-ON-VERIFY ?auto_38522 ?auto_38523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38527 - SURFACE
      ?auto_38528 - SURFACE
    )
    :vars
    (
      ?auto_38530 - HOIST
      ?auto_38529 - PLACE
      ?auto_38531 - TRUCK
      ?auto_38532 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38530 ?auto_38529 ) ( SURFACE-AT ?auto_38528 ?auto_38529 ) ( CLEAR ?auto_38528 ) ( IS-CRATE ?auto_38527 ) ( not ( = ?auto_38527 ?auto_38528 ) ) ( AVAILABLE ?auto_38530 ) ( IN ?auto_38527 ?auto_38531 ) ( TRUCK-AT ?auto_38531 ?auto_38532 ) ( not ( = ?auto_38532 ?auto_38529 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38531 ?auto_38532 ?auto_38529 )
      ( MAKE-ON ?auto_38527 ?auto_38528 )
      ( MAKE-ON-VERIFY ?auto_38527 ?auto_38528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38533 - SURFACE
      ?auto_38534 - SURFACE
    )
    :vars
    (
      ?auto_38538 - HOIST
      ?auto_38537 - PLACE
      ?auto_38535 - TRUCK
      ?auto_38536 - PLACE
      ?auto_38539 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38538 ?auto_38537 ) ( SURFACE-AT ?auto_38534 ?auto_38537 ) ( CLEAR ?auto_38534 ) ( IS-CRATE ?auto_38533 ) ( not ( = ?auto_38533 ?auto_38534 ) ) ( AVAILABLE ?auto_38538 ) ( TRUCK-AT ?auto_38535 ?auto_38536 ) ( not ( = ?auto_38536 ?auto_38537 ) ) ( HOIST-AT ?auto_38539 ?auto_38536 ) ( LIFTING ?auto_38539 ?auto_38533 ) ( not ( = ?auto_38538 ?auto_38539 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38539 ?auto_38533 ?auto_38535 ?auto_38536 )
      ( MAKE-ON ?auto_38533 ?auto_38534 )
      ( MAKE-ON-VERIFY ?auto_38533 ?auto_38534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38540 - SURFACE
      ?auto_38541 - SURFACE
    )
    :vars
    (
      ?auto_38545 - HOIST
      ?auto_38543 - PLACE
      ?auto_38544 - TRUCK
      ?auto_38542 - PLACE
      ?auto_38546 - HOIST
      ?auto_38547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38545 ?auto_38543 ) ( SURFACE-AT ?auto_38541 ?auto_38543 ) ( CLEAR ?auto_38541 ) ( IS-CRATE ?auto_38540 ) ( not ( = ?auto_38540 ?auto_38541 ) ) ( AVAILABLE ?auto_38545 ) ( TRUCK-AT ?auto_38544 ?auto_38542 ) ( not ( = ?auto_38542 ?auto_38543 ) ) ( HOIST-AT ?auto_38546 ?auto_38542 ) ( not ( = ?auto_38545 ?auto_38546 ) ) ( AVAILABLE ?auto_38546 ) ( SURFACE-AT ?auto_38540 ?auto_38542 ) ( ON ?auto_38540 ?auto_38547 ) ( CLEAR ?auto_38540 ) ( not ( = ?auto_38540 ?auto_38547 ) ) ( not ( = ?auto_38541 ?auto_38547 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38546 ?auto_38540 ?auto_38547 ?auto_38542 )
      ( MAKE-ON ?auto_38540 ?auto_38541 )
      ( MAKE-ON-VERIFY ?auto_38540 ?auto_38541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38548 - SURFACE
      ?auto_38549 - SURFACE
    )
    :vars
    (
      ?auto_38552 - HOIST
      ?auto_38550 - PLACE
      ?auto_38555 - PLACE
      ?auto_38551 - HOIST
      ?auto_38554 - SURFACE
      ?auto_38553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38552 ?auto_38550 ) ( SURFACE-AT ?auto_38549 ?auto_38550 ) ( CLEAR ?auto_38549 ) ( IS-CRATE ?auto_38548 ) ( not ( = ?auto_38548 ?auto_38549 ) ) ( AVAILABLE ?auto_38552 ) ( not ( = ?auto_38555 ?auto_38550 ) ) ( HOIST-AT ?auto_38551 ?auto_38555 ) ( not ( = ?auto_38552 ?auto_38551 ) ) ( AVAILABLE ?auto_38551 ) ( SURFACE-AT ?auto_38548 ?auto_38555 ) ( ON ?auto_38548 ?auto_38554 ) ( CLEAR ?auto_38548 ) ( not ( = ?auto_38548 ?auto_38554 ) ) ( not ( = ?auto_38549 ?auto_38554 ) ) ( TRUCK-AT ?auto_38553 ?auto_38550 ) )
    :subtasks
    ( ( !DRIVE ?auto_38553 ?auto_38550 ?auto_38555 )
      ( MAKE-ON ?auto_38548 ?auto_38549 )
      ( MAKE-ON-VERIFY ?auto_38548 ?auto_38549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38556 - SURFACE
      ?auto_38557 - SURFACE
    )
    :vars
    (
      ?auto_38563 - HOIST
      ?auto_38559 - PLACE
      ?auto_38562 - PLACE
      ?auto_38558 - HOIST
      ?auto_38561 - SURFACE
      ?auto_38560 - TRUCK
      ?auto_38564 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38563 ?auto_38559 ) ( IS-CRATE ?auto_38556 ) ( not ( = ?auto_38556 ?auto_38557 ) ) ( not ( = ?auto_38562 ?auto_38559 ) ) ( HOIST-AT ?auto_38558 ?auto_38562 ) ( not ( = ?auto_38563 ?auto_38558 ) ) ( AVAILABLE ?auto_38558 ) ( SURFACE-AT ?auto_38556 ?auto_38562 ) ( ON ?auto_38556 ?auto_38561 ) ( CLEAR ?auto_38556 ) ( not ( = ?auto_38556 ?auto_38561 ) ) ( not ( = ?auto_38557 ?auto_38561 ) ) ( TRUCK-AT ?auto_38560 ?auto_38559 ) ( SURFACE-AT ?auto_38564 ?auto_38559 ) ( CLEAR ?auto_38564 ) ( LIFTING ?auto_38563 ?auto_38557 ) ( IS-CRATE ?auto_38557 ) ( not ( = ?auto_38556 ?auto_38564 ) ) ( not ( = ?auto_38557 ?auto_38564 ) ) ( not ( = ?auto_38561 ?auto_38564 ) ) )
    :subtasks
    ( ( !DROP ?auto_38563 ?auto_38557 ?auto_38564 ?auto_38559 )
      ( MAKE-ON ?auto_38556 ?auto_38557 )
      ( MAKE-ON-VERIFY ?auto_38556 ?auto_38557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38565 - SURFACE
      ?auto_38566 - SURFACE
    )
    :vars
    (
      ?auto_38569 - HOIST
      ?auto_38568 - PLACE
      ?auto_38570 - PLACE
      ?auto_38572 - HOIST
      ?auto_38571 - SURFACE
      ?auto_38573 - TRUCK
      ?auto_38567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38569 ?auto_38568 ) ( IS-CRATE ?auto_38565 ) ( not ( = ?auto_38565 ?auto_38566 ) ) ( not ( = ?auto_38570 ?auto_38568 ) ) ( HOIST-AT ?auto_38572 ?auto_38570 ) ( not ( = ?auto_38569 ?auto_38572 ) ) ( AVAILABLE ?auto_38572 ) ( SURFACE-AT ?auto_38565 ?auto_38570 ) ( ON ?auto_38565 ?auto_38571 ) ( CLEAR ?auto_38565 ) ( not ( = ?auto_38565 ?auto_38571 ) ) ( not ( = ?auto_38566 ?auto_38571 ) ) ( TRUCK-AT ?auto_38573 ?auto_38568 ) ( SURFACE-AT ?auto_38567 ?auto_38568 ) ( CLEAR ?auto_38567 ) ( IS-CRATE ?auto_38566 ) ( not ( = ?auto_38565 ?auto_38567 ) ) ( not ( = ?auto_38566 ?auto_38567 ) ) ( not ( = ?auto_38571 ?auto_38567 ) ) ( AVAILABLE ?auto_38569 ) ( IN ?auto_38566 ?auto_38573 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38569 ?auto_38566 ?auto_38573 ?auto_38568 )
      ( MAKE-ON ?auto_38565 ?auto_38566 )
      ( MAKE-ON-VERIFY ?auto_38565 ?auto_38566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38574 - SURFACE
      ?auto_38575 - SURFACE
    )
    :vars
    (
      ?auto_38582 - HOIST
      ?auto_38579 - PLACE
      ?auto_38581 - PLACE
      ?auto_38578 - HOIST
      ?auto_38580 - SURFACE
      ?auto_38577 - SURFACE
      ?auto_38576 - TRUCK
      ?auto_38583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38582 ?auto_38579 ) ( IS-CRATE ?auto_38574 ) ( not ( = ?auto_38574 ?auto_38575 ) ) ( not ( = ?auto_38581 ?auto_38579 ) ) ( HOIST-AT ?auto_38578 ?auto_38581 ) ( not ( = ?auto_38582 ?auto_38578 ) ) ( AVAILABLE ?auto_38578 ) ( SURFACE-AT ?auto_38574 ?auto_38581 ) ( ON ?auto_38574 ?auto_38580 ) ( CLEAR ?auto_38574 ) ( not ( = ?auto_38574 ?auto_38580 ) ) ( not ( = ?auto_38575 ?auto_38580 ) ) ( SURFACE-AT ?auto_38577 ?auto_38579 ) ( CLEAR ?auto_38577 ) ( IS-CRATE ?auto_38575 ) ( not ( = ?auto_38574 ?auto_38577 ) ) ( not ( = ?auto_38575 ?auto_38577 ) ) ( not ( = ?auto_38580 ?auto_38577 ) ) ( AVAILABLE ?auto_38582 ) ( IN ?auto_38575 ?auto_38576 ) ( TRUCK-AT ?auto_38576 ?auto_38583 ) ( not ( = ?auto_38583 ?auto_38579 ) ) ( not ( = ?auto_38581 ?auto_38583 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38576 ?auto_38583 ?auto_38579 )
      ( MAKE-ON ?auto_38574 ?auto_38575 )
      ( MAKE-ON-VERIFY ?auto_38574 ?auto_38575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38584 - SURFACE
      ?auto_38585 - SURFACE
    )
    :vars
    (
      ?auto_38589 - HOIST
      ?auto_38590 - PLACE
      ?auto_38587 - PLACE
      ?auto_38591 - HOIST
      ?auto_38586 - SURFACE
      ?auto_38588 - SURFACE
      ?auto_38593 - TRUCK
      ?auto_38592 - PLACE
      ?auto_38594 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38589 ?auto_38590 ) ( IS-CRATE ?auto_38584 ) ( not ( = ?auto_38584 ?auto_38585 ) ) ( not ( = ?auto_38587 ?auto_38590 ) ) ( HOIST-AT ?auto_38591 ?auto_38587 ) ( not ( = ?auto_38589 ?auto_38591 ) ) ( AVAILABLE ?auto_38591 ) ( SURFACE-AT ?auto_38584 ?auto_38587 ) ( ON ?auto_38584 ?auto_38586 ) ( CLEAR ?auto_38584 ) ( not ( = ?auto_38584 ?auto_38586 ) ) ( not ( = ?auto_38585 ?auto_38586 ) ) ( SURFACE-AT ?auto_38588 ?auto_38590 ) ( CLEAR ?auto_38588 ) ( IS-CRATE ?auto_38585 ) ( not ( = ?auto_38584 ?auto_38588 ) ) ( not ( = ?auto_38585 ?auto_38588 ) ) ( not ( = ?auto_38586 ?auto_38588 ) ) ( AVAILABLE ?auto_38589 ) ( TRUCK-AT ?auto_38593 ?auto_38592 ) ( not ( = ?auto_38592 ?auto_38590 ) ) ( not ( = ?auto_38587 ?auto_38592 ) ) ( HOIST-AT ?auto_38594 ?auto_38592 ) ( LIFTING ?auto_38594 ?auto_38585 ) ( not ( = ?auto_38589 ?auto_38594 ) ) ( not ( = ?auto_38591 ?auto_38594 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38594 ?auto_38585 ?auto_38593 ?auto_38592 )
      ( MAKE-ON ?auto_38584 ?auto_38585 )
      ( MAKE-ON-VERIFY ?auto_38584 ?auto_38585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38595 - SURFACE
      ?auto_38596 - SURFACE
    )
    :vars
    (
      ?auto_38599 - HOIST
      ?auto_38603 - PLACE
      ?auto_38604 - PLACE
      ?auto_38601 - HOIST
      ?auto_38597 - SURFACE
      ?auto_38600 - SURFACE
      ?auto_38602 - TRUCK
      ?auto_38598 - PLACE
      ?auto_38605 - HOIST
      ?auto_38606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38599 ?auto_38603 ) ( IS-CRATE ?auto_38595 ) ( not ( = ?auto_38595 ?auto_38596 ) ) ( not ( = ?auto_38604 ?auto_38603 ) ) ( HOIST-AT ?auto_38601 ?auto_38604 ) ( not ( = ?auto_38599 ?auto_38601 ) ) ( AVAILABLE ?auto_38601 ) ( SURFACE-AT ?auto_38595 ?auto_38604 ) ( ON ?auto_38595 ?auto_38597 ) ( CLEAR ?auto_38595 ) ( not ( = ?auto_38595 ?auto_38597 ) ) ( not ( = ?auto_38596 ?auto_38597 ) ) ( SURFACE-AT ?auto_38600 ?auto_38603 ) ( CLEAR ?auto_38600 ) ( IS-CRATE ?auto_38596 ) ( not ( = ?auto_38595 ?auto_38600 ) ) ( not ( = ?auto_38596 ?auto_38600 ) ) ( not ( = ?auto_38597 ?auto_38600 ) ) ( AVAILABLE ?auto_38599 ) ( TRUCK-AT ?auto_38602 ?auto_38598 ) ( not ( = ?auto_38598 ?auto_38603 ) ) ( not ( = ?auto_38604 ?auto_38598 ) ) ( HOIST-AT ?auto_38605 ?auto_38598 ) ( not ( = ?auto_38599 ?auto_38605 ) ) ( not ( = ?auto_38601 ?auto_38605 ) ) ( AVAILABLE ?auto_38605 ) ( SURFACE-AT ?auto_38596 ?auto_38598 ) ( ON ?auto_38596 ?auto_38606 ) ( CLEAR ?auto_38596 ) ( not ( = ?auto_38595 ?auto_38606 ) ) ( not ( = ?auto_38596 ?auto_38606 ) ) ( not ( = ?auto_38597 ?auto_38606 ) ) ( not ( = ?auto_38600 ?auto_38606 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38605 ?auto_38596 ?auto_38606 ?auto_38598 )
      ( MAKE-ON ?auto_38595 ?auto_38596 )
      ( MAKE-ON-VERIFY ?auto_38595 ?auto_38596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38607 - SURFACE
      ?auto_38608 - SURFACE
    )
    :vars
    (
      ?auto_38615 - HOIST
      ?auto_38618 - PLACE
      ?auto_38609 - PLACE
      ?auto_38617 - HOIST
      ?auto_38612 - SURFACE
      ?auto_38611 - SURFACE
      ?auto_38616 - PLACE
      ?auto_38613 - HOIST
      ?auto_38614 - SURFACE
      ?auto_38610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38615 ?auto_38618 ) ( IS-CRATE ?auto_38607 ) ( not ( = ?auto_38607 ?auto_38608 ) ) ( not ( = ?auto_38609 ?auto_38618 ) ) ( HOIST-AT ?auto_38617 ?auto_38609 ) ( not ( = ?auto_38615 ?auto_38617 ) ) ( AVAILABLE ?auto_38617 ) ( SURFACE-AT ?auto_38607 ?auto_38609 ) ( ON ?auto_38607 ?auto_38612 ) ( CLEAR ?auto_38607 ) ( not ( = ?auto_38607 ?auto_38612 ) ) ( not ( = ?auto_38608 ?auto_38612 ) ) ( SURFACE-AT ?auto_38611 ?auto_38618 ) ( CLEAR ?auto_38611 ) ( IS-CRATE ?auto_38608 ) ( not ( = ?auto_38607 ?auto_38611 ) ) ( not ( = ?auto_38608 ?auto_38611 ) ) ( not ( = ?auto_38612 ?auto_38611 ) ) ( AVAILABLE ?auto_38615 ) ( not ( = ?auto_38616 ?auto_38618 ) ) ( not ( = ?auto_38609 ?auto_38616 ) ) ( HOIST-AT ?auto_38613 ?auto_38616 ) ( not ( = ?auto_38615 ?auto_38613 ) ) ( not ( = ?auto_38617 ?auto_38613 ) ) ( AVAILABLE ?auto_38613 ) ( SURFACE-AT ?auto_38608 ?auto_38616 ) ( ON ?auto_38608 ?auto_38614 ) ( CLEAR ?auto_38608 ) ( not ( = ?auto_38607 ?auto_38614 ) ) ( not ( = ?auto_38608 ?auto_38614 ) ) ( not ( = ?auto_38612 ?auto_38614 ) ) ( not ( = ?auto_38611 ?auto_38614 ) ) ( TRUCK-AT ?auto_38610 ?auto_38618 ) )
    :subtasks
    ( ( !DRIVE ?auto_38610 ?auto_38618 ?auto_38616 )
      ( MAKE-ON ?auto_38607 ?auto_38608 )
      ( MAKE-ON-VERIFY ?auto_38607 ?auto_38608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38619 - SURFACE
      ?auto_38620 - SURFACE
    )
    :vars
    (
      ?auto_38626 - HOIST
      ?auto_38623 - PLACE
      ?auto_38624 - PLACE
      ?auto_38627 - HOIST
      ?auto_38629 - SURFACE
      ?auto_38625 - SURFACE
      ?auto_38628 - PLACE
      ?auto_38630 - HOIST
      ?auto_38622 - SURFACE
      ?auto_38621 - TRUCK
      ?auto_38631 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38626 ?auto_38623 ) ( IS-CRATE ?auto_38619 ) ( not ( = ?auto_38619 ?auto_38620 ) ) ( not ( = ?auto_38624 ?auto_38623 ) ) ( HOIST-AT ?auto_38627 ?auto_38624 ) ( not ( = ?auto_38626 ?auto_38627 ) ) ( AVAILABLE ?auto_38627 ) ( SURFACE-AT ?auto_38619 ?auto_38624 ) ( ON ?auto_38619 ?auto_38629 ) ( CLEAR ?auto_38619 ) ( not ( = ?auto_38619 ?auto_38629 ) ) ( not ( = ?auto_38620 ?auto_38629 ) ) ( IS-CRATE ?auto_38620 ) ( not ( = ?auto_38619 ?auto_38625 ) ) ( not ( = ?auto_38620 ?auto_38625 ) ) ( not ( = ?auto_38629 ?auto_38625 ) ) ( not ( = ?auto_38628 ?auto_38623 ) ) ( not ( = ?auto_38624 ?auto_38628 ) ) ( HOIST-AT ?auto_38630 ?auto_38628 ) ( not ( = ?auto_38626 ?auto_38630 ) ) ( not ( = ?auto_38627 ?auto_38630 ) ) ( AVAILABLE ?auto_38630 ) ( SURFACE-AT ?auto_38620 ?auto_38628 ) ( ON ?auto_38620 ?auto_38622 ) ( CLEAR ?auto_38620 ) ( not ( = ?auto_38619 ?auto_38622 ) ) ( not ( = ?auto_38620 ?auto_38622 ) ) ( not ( = ?auto_38629 ?auto_38622 ) ) ( not ( = ?auto_38625 ?auto_38622 ) ) ( TRUCK-AT ?auto_38621 ?auto_38623 ) ( SURFACE-AT ?auto_38631 ?auto_38623 ) ( CLEAR ?auto_38631 ) ( LIFTING ?auto_38626 ?auto_38625 ) ( IS-CRATE ?auto_38625 ) ( not ( = ?auto_38619 ?auto_38631 ) ) ( not ( = ?auto_38620 ?auto_38631 ) ) ( not ( = ?auto_38629 ?auto_38631 ) ) ( not ( = ?auto_38625 ?auto_38631 ) ) ( not ( = ?auto_38622 ?auto_38631 ) ) )
    :subtasks
    ( ( !DROP ?auto_38626 ?auto_38625 ?auto_38631 ?auto_38623 )
      ( MAKE-ON ?auto_38619 ?auto_38620 )
      ( MAKE-ON-VERIFY ?auto_38619 ?auto_38620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38632 - SURFACE
      ?auto_38633 - SURFACE
    )
    :vars
    (
      ?auto_38638 - HOIST
      ?auto_38634 - PLACE
      ?auto_38640 - PLACE
      ?auto_38637 - HOIST
      ?auto_38642 - SURFACE
      ?auto_38641 - SURFACE
      ?auto_38635 - PLACE
      ?auto_38636 - HOIST
      ?auto_38639 - SURFACE
      ?auto_38643 - TRUCK
      ?auto_38644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38638 ?auto_38634 ) ( IS-CRATE ?auto_38632 ) ( not ( = ?auto_38632 ?auto_38633 ) ) ( not ( = ?auto_38640 ?auto_38634 ) ) ( HOIST-AT ?auto_38637 ?auto_38640 ) ( not ( = ?auto_38638 ?auto_38637 ) ) ( AVAILABLE ?auto_38637 ) ( SURFACE-AT ?auto_38632 ?auto_38640 ) ( ON ?auto_38632 ?auto_38642 ) ( CLEAR ?auto_38632 ) ( not ( = ?auto_38632 ?auto_38642 ) ) ( not ( = ?auto_38633 ?auto_38642 ) ) ( IS-CRATE ?auto_38633 ) ( not ( = ?auto_38632 ?auto_38641 ) ) ( not ( = ?auto_38633 ?auto_38641 ) ) ( not ( = ?auto_38642 ?auto_38641 ) ) ( not ( = ?auto_38635 ?auto_38634 ) ) ( not ( = ?auto_38640 ?auto_38635 ) ) ( HOIST-AT ?auto_38636 ?auto_38635 ) ( not ( = ?auto_38638 ?auto_38636 ) ) ( not ( = ?auto_38637 ?auto_38636 ) ) ( AVAILABLE ?auto_38636 ) ( SURFACE-AT ?auto_38633 ?auto_38635 ) ( ON ?auto_38633 ?auto_38639 ) ( CLEAR ?auto_38633 ) ( not ( = ?auto_38632 ?auto_38639 ) ) ( not ( = ?auto_38633 ?auto_38639 ) ) ( not ( = ?auto_38642 ?auto_38639 ) ) ( not ( = ?auto_38641 ?auto_38639 ) ) ( TRUCK-AT ?auto_38643 ?auto_38634 ) ( SURFACE-AT ?auto_38644 ?auto_38634 ) ( CLEAR ?auto_38644 ) ( IS-CRATE ?auto_38641 ) ( not ( = ?auto_38632 ?auto_38644 ) ) ( not ( = ?auto_38633 ?auto_38644 ) ) ( not ( = ?auto_38642 ?auto_38644 ) ) ( not ( = ?auto_38641 ?auto_38644 ) ) ( not ( = ?auto_38639 ?auto_38644 ) ) ( AVAILABLE ?auto_38638 ) ( IN ?auto_38641 ?auto_38643 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38638 ?auto_38641 ?auto_38643 ?auto_38634 )
      ( MAKE-ON ?auto_38632 ?auto_38633 )
      ( MAKE-ON-VERIFY ?auto_38632 ?auto_38633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38645 - SURFACE
      ?auto_38646 - SURFACE
    )
    :vars
    (
      ?auto_38648 - HOIST
      ?auto_38653 - PLACE
      ?auto_38654 - PLACE
      ?auto_38649 - HOIST
      ?auto_38650 - SURFACE
      ?auto_38656 - SURFACE
      ?auto_38647 - PLACE
      ?auto_38651 - HOIST
      ?auto_38657 - SURFACE
      ?auto_38652 - SURFACE
      ?auto_38655 - TRUCK
      ?auto_38658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38648 ?auto_38653 ) ( IS-CRATE ?auto_38645 ) ( not ( = ?auto_38645 ?auto_38646 ) ) ( not ( = ?auto_38654 ?auto_38653 ) ) ( HOIST-AT ?auto_38649 ?auto_38654 ) ( not ( = ?auto_38648 ?auto_38649 ) ) ( AVAILABLE ?auto_38649 ) ( SURFACE-AT ?auto_38645 ?auto_38654 ) ( ON ?auto_38645 ?auto_38650 ) ( CLEAR ?auto_38645 ) ( not ( = ?auto_38645 ?auto_38650 ) ) ( not ( = ?auto_38646 ?auto_38650 ) ) ( IS-CRATE ?auto_38646 ) ( not ( = ?auto_38645 ?auto_38656 ) ) ( not ( = ?auto_38646 ?auto_38656 ) ) ( not ( = ?auto_38650 ?auto_38656 ) ) ( not ( = ?auto_38647 ?auto_38653 ) ) ( not ( = ?auto_38654 ?auto_38647 ) ) ( HOIST-AT ?auto_38651 ?auto_38647 ) ( not ( = ?auto_38648 ?auto_38651 ) ) ( not ( = ?auto_38649 ?auto_38651 ) ) ( AVAILABLE ?auto_38651 ) ( SURFACE-AT ?auto_38646 ?auto_38647 ) ( ON ?auto_38646 ?auto_38657 ) ( CLEAR ?auto_38646 ) ( not ( = ?auto_38645 ?auto_38657 ) ) ( not ( = ?auto_38646 ?auto_38657 ) ) ( not ( = ?auto_38650 ?auto_38657 ) ) ( not ( = ?auto_38656 ?auto_38657 ) ) ( SURFACE-AT ?auto_38652 ?auto_38653 ) ( CLEAR ?auto_38652 ) ( IS-CRATE ?auto_38656 ) ( not ( = ?auto_38645 ?auto_38652 ) ) ( not ( = ?auto_38646 ?auto_38652 ) ) ( not ( = ?auto_38650 ?auto_38652 ) ) ( not ( = ?auto_38656 ?auto_38652 ) ) ( not ( = ?auto_38657 ?auto_38652 ) ) ( AVAILABLE ?auto_38648 ) ( IN ?auto_38656 ?auto_38655 ) ( TRUCK-AT ?auto_38655 ?auto_38658 ) ( not ( = ?auto_38658 ?auto_38653 ) ) ( not ( = ?auto_38654 ?auto_38658 ) ) ( not ( = ?auto_38647 ?auto_38658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38655 ?auto_38658 ?auto_38653 )
      ( MAKE-ON ?auto_38645 ?auto_38646 )
      ( MAKE-ON-VERIFY ?auto_38645 ?auto_38646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38659 - SURFACE
      ?auto_38660 - SURFACE
    )
    :vars
    (
      ?auto_38666 - HOIST
      ?auto_38661 - PLACE
      ?auto_38670 - PLACE
      ?auto_38672 - HOIST
      ?auto_38665 - SURFACE
      ?auto_38671 - SURFACE
      ?auto_38663 - PLACE
      ?auto_38668 - HOIST
      ?auto_38664 - SURFACE
      ?auto_38669 - SURFACE
      ?auto_38667 - TRUCK
      ?auto_38662 - PLACE
      ?auto_38673 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38666 ?auto_38661 ) ( IS-CRATE ?auto_38659 ) ( not ( = ?auto_38659 ?auto_38660 ) ) ( not ( = ?auto_38670 ?auto_38661 ) ) ( HOIST-AT ?auto_38672 ?auto_38670 ) ( not ( = ?auto_38666 ?auto_38672 ) ) ( AVAILABLE ?auto_38672 ) ( SURFACE-AT ?auto_38659 ?auto_38670 ) ( ON ?auto_38659 ?auto_38665 ) ( CLEAR ?auto_38659 ) ( not ( = ?auto_38659 ?auto_38665 ) ) ( not ( = ?auto_38660 ?auto_38665 ) ) ( IS-CRATE ?auto_38660 ) ( not ( = ?auto_38659 ?auto_38671 ) ) ( not ( = ?auto_38660 ?auto_38671 ) ) ( not ( = ?auto_38665 ?auto_38671 ) ) ( not ( = ?auto_38663 ?auto_38661 ) ) ( not ( = ?auto_38670 ?auto_38663 ) ) ( HOIST-AT ?auto_38668 ?auto_38663 ) ( not ( = ?auto_38666 ?auto_38668 ) ) ( not ( = ?auto_38672 ?auto_38668 ) ) ( AVAILABLE ?auto_38668 ) ( SURFACE-AT ?auto_38660 ?auto_38663 ) ( ON ?auto_38660 ?auto_38664 ) ( CLEAR ?auto_38660 ) ( not ( = ?auto_38659 ?auto_38664 ) ) ( not ( = ?auto_38660 ?auto_38664 ) ) ( not ( = ?auto_38665 ?auto_38664 ) ) ( not ( = ?auto_38671 ?auto_38664 ) ) ( SURFACE-AT ?auto_38669 ?auto_38661 ) ( CLEAR ?auto_38669 ) ( IS-CRATE ?auto_38671 ) ( not ( = ?auto_38659 ?auto_38669 ) ) ( not ( = ?auto_38660 ?auto_38669 ) ) ( not ( = ?auto_38665 ?auto_38669 ) ) ( not ( = ?auto_38671 ?auto_38669 ) ) ( not ( = ?auto_38664 ?auto_38669 ) ) ( AVAILABLE ?auto_38666 ) ( TRUCK-AT ?auto_38667 ?auto_38662 ) ( not ( = ?auto_38662 ?auto_38661 ) ) ( not ( = ?auto_38670 ?auto_38662 ) ) ( not ( = ?auto_38663 ?auto_38662 ) ) ( HOIST-AT ?auto_38673 ?auto_38662 ) ( LIFTING ?auto_38673 ?auto_38671 ) ( not ( = ?auto_38666 ?auto_38673 ) ) ( not ( = ?auto_38672 ?auto_38673 ) ) ( not ( = ?auto_38668 ?auto_38673 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38673 ?auto_38671 ?auto_38667 ?auto_38662 )
      ( MAKE-ON ?auto_38659 ?auto_38660 )
      ( MAKE-ON-VERIFY ?auto_38659 ?auto_38660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38674 - SURFACE
      ?auto_38675 - SURFACE
    )
    :vars
    (
      ?auto_38684 - HOIST
      ?auto_38683 - PLACE
      ?auto_38681 - PLACE
      ?auto_38687 - HOIST
      ?auto_38688 - SURFACE
      ?auto_38676 - SURFACE
      ?auto_38682 - PLACE
      ?auto_38680 - HOIST
      ?auto_38677 - SURFACE
      ?auto_38679 - SURFACE
      ?auto_38686 - TRUCK
      ?auto_38678 - PLACE
      ?auto_38685 - HOIST
      ?auto_38689 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38684 ?auto_38683 ) ( IS-CRATE ?auto_38674 ) ( not ( = ?auto_38674 ?auto_38675 ) ) ( not ( = ?auto_38681 ?auto_38683 ) ) ( HOIST-AT ?auto_38687 ?auto_38681 ) ( not ( = ?auto_38684 ?auto_38687 ) ) ( AVAILABLE ?auto_38687 ) ( SURFACE-AT ?auto_38674 ?auto_38681 ) ( ON ?auto_38674 ?auto_38688 ) ( CLEAR ?auto_38674 ) ( not ( = ?auto_38674 ?auto_38688 ) ) ( not ( = ?auto_38675 ?auto_38688 ) ) ( IS-CRATE ?auto_38675 ) ( not ( = ?auto_38674 ?auto_38676 ) ) ( not ( = ?auto_38675 ?auto_38676 ) ) ( not ( = ?auto_38688 ?auto_38676 ) ) ( not ( = ?auto_38682 ?auto_38683 ) ) ( not ( = ?auto_38681 ?auto_38682 ) ) ( HOIST-AT ?auto_38680 ?auto_38682 ) ( not ( = ?auto_38684 ?auto_38680 ) ) ( not ( = ?auto_38687 ?auto_38680 ) ) ( AVAILABLE ?auto_38680 ) ( SURFACE-AT ?auto_38675 ?auto_38682 ) ( ON ?auto_38675 ?auto_38677 ) ( CLEAR ?auto_38675 ) ( not ( = ?auto_38674 ?auto_38677 ) ) ( not ( = ?auto_38675 ?auto_38677 ) ) ( not ( = ?auto_38688 ?auto_38677 ) ) ( not ( = ?auto_38676 ?auto_38677 ) ) ( SURFACE-AT ?auto_38679 ?auto_38683 ) ( CLEAR ?auto_38679 ) ( IS-CRATE ?auto_38676 ) ( not ( = ?auto_38674 ?auto_38679 ) ) ( not ( = ?auto_38675 ?auto_38679 ) ) ( not ( = ?auto_38688 ?auto_38679 ) ) ( not ( = ?auto_38676 ?auto_38679 ) ) ( not ( = ?auto_38677 ?auto_38679 ) ) ( AVAILABLE ?auto_38684 ) ( TRUCK-AT ?auto_38686 ?auto_38678 ) ( not ( = ?auto_38678 ?auto_38683 ) ) ( not ( = ?auto_38681 ?auto_38678 ) ) ( not ( = ?auto_38682 ?auto_38678 ) ) ( HOIST-AT ?auto_38685 ?auto_38678 ) ( not ( = ?auto_38684 ?auto_38685 ) ) ( not ( = ?auto_38687 ?auto_38685 ) ) ( not ( = ?auto_38680 ?auto_38685 ) ) ( AVAILABLE ?auto_38685 ) ( SURFACE-AT ?auto_38676 ?auto_38678 ) ( ON ?auto_38676 ?auto_38689 ) ( CLEAR ?auto_38676 ) ( not ( = ?auto_38674 ?auto_38689 ) ) ( not ( = ?auto_38675 ?auto_38689 ) ) ( not ( = ?auto_38688 ?auto_38689 ) ) ( not ( = ?auto_38676 ?auto_38689 ) ) ( not ( = ?auto_38677 ?auto_38689 ) ) ( not ( = ?auto_38679 ?auto_38689 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38685 ?auto_38676 ?auto_38689 ?auto_38678 )
      ( MAKE-ON ?auto_38674 ?auto_38675 )
      ( MAKE-ON-VERIFY ?auto_38674 ?auto_38675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38690 - SURFACE
      ?auto_38691 - SURFACE
    )
    :vars
    (
      ?auto_38694 - HOIST
      ?auto_38692 - PLACE
      ?auto_38697 - PLACE
      ?auto_38699 - HOIST
      ?auto_38696 - SURFACE
      ?auto_38695 - SURFACE
      ?auto_38705 - PLACE
      ?auto_38704 - HOIST
      ?auto_38698 - SURFACE
      ?auto_38703 - SURFACE
      ?auto_38701 - PLACE
      ?auto_38700 - HOIST
      ?auto_38693 - SURFACE
      ?auto_38702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38694 ?auto_38692 ) ( IS-CRATE ?auto_38690 ) ( not ( = ?auto_38690 ?auto_38691 ) ) ( not ( = ?auto_38697 ?auto_38692 ) ) ( HOIST-AT ?auto_38699 ?auto_38697 ) ( not ( = ?auto_38694 ?auto_38699 ) ) ( AVAILABLE ?auto_38699 ) ( SURFACE-AT ?auto_38690 ?auto_38697 ) ( ON ?auto_38690 ?auto_38696 ) ( CLEAR ?auto_38690 ) ( not ( = ?auto_38690 ?auto_38696 ) ) ( not ( = ?auto_38691 ?auto_38696 ) ) ( IS-CRATE ?auto_38691 ) ( not ( = ?auto_38690 ?auto_38695 ) ) ( not ( = ?auto_38691 ?auto_38695 ) ) ( not ( = ?auto_38696 ?auto_38695 ) ) ( not ( = ?auto_38705 ?auto_38692 ) ) ( not ( = ?auto_38697 ?auto_38705 ) ) ( HOIST-AT ?auto_38704 ?auto_38705 ) ( not ( = ?auto_38694 ?auto_38704 ) ) ( not ( = ?auto_38699 ?auto_38704 ) ) ( AVAILABLE ?auto_38704 ) ( SURFACE-AT ?auto_38691 ?auto_38705 ) ( ON ?auto_38691 ?auto_38698 ) ( CLEAR ?auto_38691 ) ( not ( = ?auto_38690 ?auto_38698 ) ) ( not ( = ?auto_38691 ?auto_38698 ) ) ( not ( = ?auto_38696 ?auto_38698 ) ) ( not ( = ?auto_38695 ?auto_38698 ) ) ( SURFACE-AT ?auto_38703 ?auto_38692 ) ( CLEAR ?auto_38703 ) ( IS-CRATE ?auto_38695 ) ( not ( = ?auto_38690 ?auto_38703 ) ) ( not ( = ?auto_38691 ?auto_38703 ) ) ( not ( = ?auto_38696 ?auto_38703 ) ) ( not ( = ?auto_38695 ?auto_38703 ) ) ( not ( = ?auto_38698 ?auto_38703 ) ) ( AVAILABLE ?auto_38694 ) ( not ( = ?auto_38701 ?auto_38692 ) ) ( not ( = ?auto_38697 ?auto_38701 ) ) ( not ( = ?auto_38705 ?auto_38701 ) ) ( HOIST-AT ?auto_38700 ?auto_38701 ) ( not ( = ?auto_38694 ?auto_38700 ) ) ( not ( = ?auto_38699 ?auto_38700 ) ) ( not ( = ?auto_38704 ?auto_38700 ) ) ( AVAILABLE ?auto_38700 ) ( SURFACE-AT ?auto_38695 ?auto_38701 ) ( ON ?auto_38695 ?auto_38693 ) ( CLEAR ?auto_38695 ) ( not ( = ?auto_38690 ?auto_38693 ) ) ( not ( = ?auto_38691 ?auto_38693 ) ) ( not ( = ?auto_38696 ?auto_38693 ) ) ( not ( = ?auto_38695 ?auto_38693 ) ) ( not ( = ?auto_38698 ?auto_38693 ) ) ( not ( = ?auto_38703 ?auto_38693 ) ) ( TRUCK-AT ?auto_38702 ?auto_38692 ) )
    :subtasks
    ( ( !DRIVE ?auto_38702 ?auto_38692 ?auto_38701 )
      ( MAKE-ON ?auto_38690 ?auto_38691 )
      ( MAKE-ON-VERIFY ?auto_38690 ?auto_38691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38706 - SURFACE
      ?auto_38707 - SURFACE
    )
    :vars
    (
      ?auto_38708 - HOIST
      ?auto_38711 - PLACE
      ?auto_38720 - PLACE
      ?auto_38713 - HOIST
      ?auto_38718 - SURFACE
      ?auto_38715 - SURFACE
      ?auto_38714 - PLACE
      ?auto_38717 - HOIST
      ?auto_38710 - SURFACE
      ?auto_38709 - SURFACE
      ?auto_38719 - PLACE
      ?auto_38716 - HOIST
      ?auto_38712 - SURFACE
      ?auto_38721 - TRUCK
      ?auto_38722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38708 ?auto_38711 ) ( IS-CRATE ?auto_38706 ) ( not ( = ?auto_38706 ?auto_38707 ) ) ( not ( = ?auto_38720 ?auto_38711 ) ) ( HOIST-AT ?auto_38713 ?auto_38720 ) ( not ( = ?auto_38708 ?auto_38713 ) ) ( AVAILABLE ?auto_38713 ) ( SURFACE-AT ?auto_38706 ?auto_38720 ) ( ON ?auto_38706 ?auto_38718 ) ( CLEAR ?auto_38706 ) ( not ( = ?auto_38706 ?auto_38718 ) ) ( not ( = ?auto_38707 ?auto_38718 ) ) ( IS-CRATE ?auto_38707 ) ( not ( = ?auto_38706 ?auto_38715 ) ) ( not ( = ?auto_38707 ?auto_38715 ) ) ( not ( = ?auto_38718 ?auto_38715 ) ) ( not ( = ?auto_38714 ?auto_38711 ) ) ( not ( = ?auto_38720 ?auto_38714 ) ) ( HOIST-AT ?auto_38717 ?auto_38714 ) ( not ( = ?auto_38708 ?auto_38717 ) ) ( not ( = ?auto_38713 ?auto_38717 ) ) ( AVAILABLE ?auto_38717 ) ( SURFACE-AT ?auto_38707 ?auto_38714 ) ( ON ?auto_38707 ?auto_38710 ) ( CLEAR ?auto_38707 ) ( not ( = ?auto_38706 ?auto_38710 ) ) ( not ( = ?auto_38707 ?auto_38710 ) ) ( not ( = ?auto_38718 ?auto_38710 ) ) ( not ( = ?auto_38715 ?auto_38710 ) ) ( IS-CRATE ?auto_38715 ) ( not ( = ?auto_38706 ?auto_38709 ) ) ( not ( = ?auto_38707 ?auto_38709 ) ) ( not ( = ?auto_38718 ?auto_38709 ) ) ( not ( = ?auto_38715 ?auto_38709 ) ) ( not ( = ?auto_38710 ?auto_38709 ) ) ( not ( = ?auto_38719 ?auto_38711 ) ) ( not ( = ?auto_38720 ?auto_38719 ) ) ( not ( = ?auto_38714 ?auto_38719 ) ) ( HOIST-AT ?auto_38716 ?auto_38719 ) ( not ( = ?auto_38708 ?auto_38716 ) ) ( not ( = ?auto_38713 ?auto_38716 ) ) ( not ( = ?auto_38717 ?auto_38716 ) ) ( AVAILABLE ?auto_38716 ) ( SURFACE-AT ?auto_38715 ?auto_38719 ) ( ON ?auto_38715 ?auto_38712 ) ( CLEAR ?auto_38715 ) ( not ( = ?auto_38706 ?auto_38712 ) ) ( not ( = ?auto_38707 ?auto_38712 ) ) ( not ( = ?auto_38718 ?auto_38712 ) ) ( not ( = ?auto_38715 ?auto_38712 ) ) ( not ( = ?auto_38710 ?auto_38712 ) ) ( not ( = ?auto_38709 ?auto_38712 ) ) ( TRUCK-AT ?auto_38721 ?auto_38711 ) ( SURFACE-AT ?auto_38722 ?auto_38711 ) ( CLEAR ?auto_38722 ) ( LIFTING ?auto_38708 ?auto_38709 ) ( IS-CRATE ?auto_38709 ) ( not ( = ?auto_38706 ?auto_38722 ) ) ( not ( = ?auto_38707 ?auto_38722 ) ) ( not ( = ?auto_38718 ?auto_38722 ) ) ( not ( = ?auto_38715 ?auto_38722 ) ) ( not ( = ?auto_38710 ?auto_38722 ) ) ( not ( = ?auto_38709 ?auto_38722 ) ) ( not ( = ?auto_38712 ?auto_38722 ) ) )
    :subtasks
    ( ( !DROP ?auto_38708 ?auto_38709 ?auto_38722 ?auto_38711 )
      ( MAKE-ON ?auto_38706 ?auto_38707 )
      ( MAKE-ON-VERIFY ?auto_38706 ?auto_38707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38723 - SURFACE
      ?auto_38724 - SURFACE
    )
    :vars
    (
      ?auto_38734 - HOIST
      ?auto_38731 - PLACE
      ?auto_38732 - PLACE
      ?auto_38728 - HOIST
      ?auto_38737 - SURFACE
      ?auto_38727 - SURFACE
      ?auto_38726 - PLACE
      ?auto_38735 - HOIST
      ?auto_38733 - SURFACE
      ?auto_38730 - SURFACE
      ?auto_38738 - PLACE
      ?auto_38739 - HOIST
      ?auto_38736 - SURFACE
      ?auto_38729 - TRUCK
      ?auto_38725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38734 ?auto_38731 ) ( IS-CRATE ?auto_38723 ) ( not ( = ?auto_38723 ?auto_38724 ) ) ( not ( = ?auto_38732 ?auto_38731 ) ) ( HOIST-AT ?auto_38728 ?auto_38732 ) ( not ( = ?auto_38734 ?auto_38728 ) ) ( AVAILABLE ?auto_38728 ) ( SURFACE-AT ?auto_38723 ?auto_38732 ) ( ON ?auto_38723 ?auto_38737 ) ( CLEAR ?auto_38723 ) ( not ( = ?auto_38723 ?auto_38737 ) ) ( not ( = ?auto_38724 ?auto_38737 ) ) ( IS-CRATE ?auto_38724 ) ( not ( = ?auto_38723 ?auto_38727 ) ) ( not ( = ?auto_38724 ?auto_38727 ) ) ( not ( = ?auto_38737 ?auto_38727 ) ) ( not ( = ?auto_38726 ?auto_38731 ) ) ( not ( = ?auto_38732 ?auto_38726 ) ) ( HOIST-AT ?auto_38735 ?auto_38726 ) ( not ( = ?auto_38734 ?auto_38735 ) ) ( not ( = ?auto_38728 ?auto_38735 ) ) ( AVAILABLE ?auto_38735 ) ( SURFACE-AT ?auto_38724 ?auto_38726 ) ( ON ?auto_38724 ?auto_38733 ) ( CLEAR ?auto_38724 ) ( not ( = ?auto_38723 ?auto_38733 ) ) ( not ( = ?auto_38724 ?auto_38733 ) ) ( not ( = ?auto_38737 ?auto_38733 ) ) ( not ( = ?auto_38727 ?auto_38733 ) ) ( IS-CRATE ?auto_38727 ) ( not ( = ?auto_38723 ?auto_38730 ) ) ( not ( = ?auto_38724 ?auto_38730 ) ) ( not ( = ?auto_38737 ?auto_38730 ) ) ( not ( = ?auto_38727 ?auto_38730 ) ) ( not ( = ?auto_38733 ?auto_38730 ) ) ( not ( = ?auto_38738 ?auto_38731 ) ) ( not ( = ?auto_38732 ?auto_38738 ) ) ( not ( = ?auto_38726 ?auto_38738 ) ) ( HOIST-AT ?auto_38739 ?auto_38738 ) ( not ( = ?auto_38734 ?auto_38739 ) ) ( not ( = ?auto_38728 ?auto_38739 ) ) ( not ( = ?auto_38735 ?auto_38739 ) ) ( AVAILABLE ?auto_38739 ) ( SURFACE-AT ?auto_38727 ?auto_38738 ) ( ON ?auto_38727 ?auto_38736 ) ( CLEAR ?auto_38727 ) ( not ( = ?auto_38723 ?auto_38736 ) ) ( not ( = ?auto_38724 ?auto_38736 ) ) ( not ( = ?auto_38737 ?auto_38736 ) ) ( not ( = ?auto_38727 ?auto_38736 ) ) ( not ( = ?auto_38733 ?auto_38736 ) ) ( not ( = ?auto_38730 ?auto_38736 ) ) ( TRUCK-AT ?auto_38729 ?auto_38731 ) ( SURFACE-AT ?auto_38725 ?auto_38731 ) ( CLEAR ?auto_38725 ) ( IS-CRATE ?auto_38730 ) ( not ( = ?auto_38723 ?auto_38725 ) ) ( not ( = ?auto_38724 ?auto_38725 ) ) ( not ( = ?auto_38737 ?auto_38725 ) ) ( not ( = ?auto_38727 ?auto_38725 ) ) ( not ( = ?auto_38733 ?auto_38725 ) ) ( not ( = ?auto_38730 ?auto_38725 ) ) ( not ( = ?auto_38736 ?auto_38725 ) ) ( AVAILABLE ?auto_38734 ) ( IN ?auto_38730 ?auto_38729 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38734 ?auto_38730 ?auto_38729 ?auto_38731 )
      ( MAKE-ON ?auto_38723 ?auto_38724 )
      ( MAKE-ON-VERIFY ?auto_38723 ?auto_38724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38740 - SURFACE
      ?auto_38741 - SURFACE
    )
    :vars
    (
      ?auto_38749 - HOIST
      ?auto_38747 - PLACE
      ?auto_38743 - PLACE
      ?auto_38753 - HOIST
      ?auto_38754 - SURFACE
      ?auto_38745 - SURFACE
      ?auto_38756 - PLACE
      ?auto_38755 - HOIST
      ?auto_38748 - SURFACE
      ?auto_38746 - SURFACE
      ?auto_38742 - PLACE
      ?auto_38751 - HOIST
      ?auto_38752 - SURFACE
      ?auto_38750 - SURFACE
      ?auto_38744 - TRUCK
      ?auto_38757 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38749 ?auto_38747 ) ( IS-CRATE ?auto_38740 ) ( not ( = ?auto_38740 ?auto_38741 ) ) ( not ( = ?auto_38743 ?auto_38747 ) ) ( HOIST-AT ?auto_38753 ?auto_38743 ) ( not ( = ?auto_38749 ?auto_38753 ) ) ( AVAILABLE ?auto_38753 ) ( SURFACE-AT ?auto_38740 ?auto_38743 ) ( ON ?auto_38740 ?auto_38754 ) ( CLEAR ?auto_38740 ) ( not ( = ?auto_38740 ?auto_38754 ) ) ( not ( = ?auto_38741 ?auto_38754 ) ) ( IS-CRATE ?auto_38741 ) ( not ( = ?auto_38740 ?auto_38745 ) ) ( not ( = ?auto_38741 ?auto_38745 ) ) ( not ( = ?auto_38754 ?auto_38745 ) ) ( not ( = ?auto_38756 ?auto_38747 ) ) ( not ( = ?auto_38743 ?auto_38756 ) ) ( HOIST-AT ?auto_38755 ?auto_38756 ) ( not ( = ?auto_38749 ?auto_38755 ) ) ( not ( = ?auto_38753 ?auto_38755 ) ) ( AVAILABLE ?auto_38755 ) ( SURFACE-AT ?auto_38741 ?auto_38756 ) ( ON ?auto_38741 ?auto_38748 ) ( CLEAR ?auto_38741 ) ( not ( = ?auto_38740 ?auto_38748 ) ) ( not ( = ?auto_38741 ?auto_38748 ) ) ( not ( = ?auto_38754 ?auto_38748 ) ) ( not ( = ?auto_38745 ?auto_38748 ) ) ( IS-CRATE ?auto_38745 ) ( not ( = ?auto_38740 ?auto_38746 ) ) ( not ( = ?auto_38741 ?auto_38746 ) ) ( not ( = ?auto_38754 ?auto_38746 ) ) ( not ( = ?auto_38745 ?auto_38746 ) ) ( not ( = ?auto_38748 ?auto_38746 ) ) ( not ( = ?auto_38742 ?auto_38747 ) ) ( not ( = ?auto_38743 ?auto_38742 ) ) ( not ( = ?auto_38756 ?auto_38742 ) ) ( HOIST-AT ?auto_38751 ?auto_38742 ) ( not ( = ?auto_38749 ?auto_38751 ) ) ( not ( = ?auto_38753 ?auto_38751 ) ) ( not ( = ?auto_38755 ?auto_38751 ) ) ( AVAILABLE ?auto_38751 ) ( SURFACE-AT ?auto_38745 ?auto_38742 ) ( ON ?auto_38745 ?auto_38752 ) ( CLEAR ?auto_38745 ) ( not ( = ?auto_38740 ?auto_38752 ) ) ( not ( = ?auto_38741 ?auto_38752 ) ) ( not ( = ?auto_38754 ?auto_38752 ) ) ( not ( = ?auto_38745 ?auto_38752 ) ) ( not ( = ?auto_38748 ?auto_38752 ) ) ( not ( = ?auto_38746 ?auto_38752 ) ) ( SURFACE-AT ?auto_38750 ?auto_38747 ) ( CLEAR ?auto_38750 ) ( IS-CRATE ?auto_38746 ) ( not ( = ?auto_38740 ?auto_38750 ) ) ( not ( = ?auto_38741 ?auto_38750 ) ) ( not ( = ?auto_38754 ?auto_38750 ) ) ( not ( = ?auto_38745 ?auto_38750 ) ) ( not ( = ?auto_38748 ?auto_38750 ) ) ( not ( = ?auto_38746 ?auto_38750 ) ) ( not ( = ?auto_38752 ?auto_38750 ) ) ( AVAILABLE ?auto_38749 ) ( IN ?auto_38746 ?auto_38744 ) ( TRUCK-AT ?auto_38744 ?auto_38757 ) ( not ( = ?auto_38757 ?auto_38747 ) ) ( not ( = ?auto_38743 ?auto_38757 ) ) ( not ( = ?auto_38756 ?auto_38757 ) ) ( not ( = ?auto_38742 ?auto_38757 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38744 ?auto_38757 ?auto_38747 )
      ( MAKE-ON ?auto_38740 ?auto_38741 )
      ( MAKE-ON-VERIFY ?auto_38740 ?auto_38741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38758 - SURFACE
      ?auto_38759 - SURFACE
    )
    :vars
    (
      ?auto_38769 - HOIST
      ?auto_38770 - PLACE
      ?auto_38772 - PLACE
      ?auto_38765 - HOIST
      ?auto_38766 - SURFACE
      ?auto_38774 - SURFACE
      ?auto_38768 - PLACE
      ?auto_38767 - HOIST
      ?auto_38775 - SURFACE
      ?auto_38761 - SURFACE
      ?auto_38763 - PLACE
      ?auto_38762 - HOIST
      ?auto_38773 - SURFACE
      ?auto_38760 - SURFACE
      ?auto_38771 - TRUCK
      ?auto_38764 - PLACE
      ?auto_38776 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38769 ?auto_38770 ) ( IS-CRATE ?auto_38758 ) ( not ( = ?auto_38758 ?auto_38759 ) ) ( not ( = ?auto_38772 ?auto_38770 ) ) ( HOIST-AT ?auto_38765 ?auto_38772 ) ( not ( = ?auto_38769 ?auto_38765 ) ) ( AVAILABLE ?auto_38765 ) ( SURFACE-AT ?auto_38758 ?auto_38772 ) ( ON ?auto_38758 ?auto_38766 ) ( CLEAR ?auto_38758 ) ( not ( = ?auto_38758 ?auto_38766 ) ) ( not ( = ?auto_38759 ?auto_38766 ) ) ( IS-CRATE ?auto_38759 ) ( not ( = ?auto_38758 ?auto_38774 ) ) ( not ( = ?auto_38759 ?auto_38774 ) ) ( not ( = ?auto_38766 ?auto_38774 ) ) ( not ( = ?auto_38768 ?auto_38770 ) ) ( not ( = ?auto_38772 ?auto_38768 ) ) ( HOIST-AT ?auto_38767 ?auto_38768 ) ( not ( = ?auto_38769 ?auto_38767 ) ) ( not ( = ?auto_38765 ?auto_38767 ) ) ( AVAILABLE ?auto_38767 ) ( SURFACE-AT ?auto_38759 ?auto_38768 ) ( ON ?auto_38759 ?auto_38775 ) ( CLEAR ?auto_38759 ) ( not ( = ?auto_38758 ?auto_38775 ) ) ( not ( = ?auto_38759 ?auto_38775 ) ) ( not ( = ?auto_38766 ?auto_38775 ) ) ( not ( = ?auto_38774 ?auto_38775 ) ) ( IS-CRATE ?auto_38774 ) ( not ( = ?auto_38758 ?auto_38761 ) ) ( not ( = ?auto_38759 ?auto_38761 ) ) ( not ( = ?auto_38766 ?auto_38761 ) ) ( not ( = ?auto_38774 ?auto_38761 ) ) ( not ( = ?auto_38775 ?auto_38761 ) ) ( not ( = ?auto_38763 ?auto_38770 ) ) ( not ( = ?auto_38772 ?auto_38763 ) ) ( not ( = ?auto_38768 ?auto_38763 ) ) ( HOIST-AT ?auto_38762 ?auto_38763 ) ( not ( = ?auto_38769 ?auto_38762 ) ) ( not ( = ?auto_38765 ?auto_38762 ) ) ( not ( = ?auto_38767 ?auto_38762 ) ) ( AVAILABLE ?auto_38762 ) ( SURFACE-AT ?auto_38774 ?auto_38763 ) ( ON ?auto_38774 ?auto_38773 ) ( CLEAR ?auto_38774 ) ( not ( = ?auto_38758 ?auto_38773 ) ) ( not ( = ?auto_38759 ?auto_38773 ) ) ( not ( = ?auto_38766 ?auto_38773 ) ) ( not ( = ?auto_38774 ?auto_38773 ) ) ( not ( = ?auto_38775 ?auto_38773 ) ) ( not ( = ?auto_38761 ?auto_38773 ) ) ( SURFACE-AT ?auto_38760 ?auto_38770 ) ( CLEAR ?auto_38760 ) ( IS-CRATE ?auto_38761 ) ( not ( = ?auto_38758 ?auto_38760 ) ) ( not ( = ?auto_38759 ?auto_38760 ) ) ( not ( = ?auto_38766 ?auto_38760 ) ) ( not ( = ?auto_38774 ?auto_38760 ) ) ( not ( = ?auto_38775 ?auto_38760 ) ) ( not ( = ?auto_38761 ?auto_38760 ) ) ( not ( = ?auto_38773 ?auto_38760 ) ) ( AVAILABLE ?auto_38769 ) ( TRUCK-AT ?auto_38771 ?auto_38764 ) ( not ( = ?auto_38764 ?auto_38770 ) ) ( not ( = ?auto_38772 ?auto_38764 ) ) ( not ( = ?auto_38768 ?auto_38764 ) ) ( not ( = ?auto_38763 ?auto_38764 ) ) ( HOIST-AT ?auto_38776 ?auto_38764 ) ( LIFTING ?auto_38776 ?auto_38761 ) ( not ( = ?auto_38769 ?auto_38776 ) ) ( not ( = ?auto_38765 ?auto_38776 ) ) ( not ( = ?auto_38767 ?auto_38776 ) ) ( not ( = ?auto_38762 ?auto_38776 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38776 ?auto_38761 ?auto_38771 ?auto_38764 )
      ( MAKE-ON ?auto_38758 ?auto_38759 )
      ( MAKE-ON-VERIFY ?auto_38758 ?auto_38759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38777 - SURFACE
      ?auto_38778 - SURFACE
    )
    :vars
    (
      ?auto_38791 - HOIST
      ?auto_38789 - PLACE
      ?auto_38779 - PLACE
      ?auto_38781 - HOIST
      ?auto_38780 - SURFACE
      ?auto_38795 - SURFACE
      ?auto_38786 - PLACE
      ?auto_38783 - HOIST
      ?auto_38785 - SURFACE
      ?auto_38784 - SURFACE
      ?auto_38793 - PLACE
      ?auto_38782 - HOIST
      ?auto_38787 - SURFACE
      ?auto_38794 - SURFACE
      ?auto_38790 - TRUCK
      ?auto_38788 - PLACE
      ?auto_38792 - HOIST
      ?auto_38796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38791 ?auto_38789 ) ( IS-CRATE ?auto_38777 ) ( not ( = ?auto_38777 ?auto_38778 ) ) ( not ( = ?auto_38779 ?auto_38789 ) ) ( HOIST-AT ?auto_38781 ?auto_38779 ) ( not ( = ?auto_38791 ?auto_38781 ) ) ( AVAILABLE ?auto_38781 ) ( SURFACE-AT ?auto_38777 ?auto_38779 ) ( ON ?auto_38777 ?auto_38780 ) ( CLEAR ?auto_38777 ) ( not ( = ?auto_38777 ?auto_38780 ) ) ( not ( = ?auto_38778 ?auto_38780 ) ) ( IS-CRATE ?auto_38778 ) ( not ( = ?auto_38777 ?auto_38795 ) ) ( not ( = ?auto_38778 ?auto_38795 ) ) ( not ( = ?auto_38780 ?auto_38795 ) ) ( not ( = ?auto_38786 ?auto_38789 ) ) ( not ( = ?auto_38779 ?auto_38786 ) ) ( HOIST-AT ?auto_38783 ?auto_38786 ) ( not ( = ?auto_38791 ?auto_38783 ) ) ( not ( = ?auto_38781 ?auto_38783 ) ) ( AVAILABLE ?auto_38783 ) ( SURFACE-AT ?auto_38778 ?auto_38786 ) ( ON ?auto_38778 ?auto_38785 ) ( CLEAR ?auto_38778 ) ( not ( = ?auto_38777 ?auto_38785 ) ) ( not ( = ?auto_38778 ?auto_38785 ) ) ( not ( = ?auto_38780 ?auto_38785 ) ) ( not ( = ?auto_38795 ?auto_38785 ) ) ( IS-CRATE ?auto_38795 ) ( not ( = ?auto_38777 ?auto_38784 ) ) ( not ( = ?auto_38778 ?auto_38784 ) ) ( not ( = ?auto_38780 ?auto_38784 ) ) ( not ( = ?auto_38795 ?auto_38784 ) ) ( not ( = ?auto_38785 ?auto_38784 ) ) ( not ( = ?auto_38793 ?auto_38789 ) ) ( not ( = ?auto_38779 ?auto_38793 ) ) ( not ( = ?auto_38786 ?auto_38793 ) ) ( HOIST-AT ?auto_38782 ?auto_38793 ) ( not ( = ?auto_38791 ?auto_38782 ) ) ( not ( = ?auto_38781 ?auto_38782 ) ) ( not ( = ?auto_38783 ?auto_38782 ) ) ( AVAILABLE ?auto_38782 ) ( SURFACE-AT ?auto_38795 ?auto_38793 ) ( ON ?auto_38795 ?auto_38787 ) ( CLEAR ?auto_38795 ) ( not ( = ?auto_38777 ?auto_38787 ) ) ( not ( = ?auto_38778 ?auto_38787 ) ) ( not ( = ?auto_38780 ?auto_38787 ) ) ( not ( = ?auto_38795 ?auto_38787 ) ) ( not ( = ?auto_38785 ?auto_38787 ) ) ( not ( = ?auto_38784 ?auto_38787 ) ) ( SURFACE-AT ?auto_38794 ?auto_38789 ) ( CLEAR ?auto_38794 ) ( IS-CRATE ?auto_38784 ) ( not ( = ?auto_38777 ?auto_38794 ) ) ( not ( = ?auto_38778 ?auto_38794 ) ) ( not ( = ?auto_38780 ?auto_38794 ) ) ( not ( = ?auto_38795 ?auto_38794 ) ) ( not ( = ?auto_38785 ?auto_38794 ) ) ( not ( = ?auto_38784 ?auto_38794 ) ) ( not ( = ?auto_38787 ?auto_38794 ) ) ( AVAILABLE ?auto_38791 ) ( TRUCK-AT ?auto_38790 ?auto_38788 ) ( not ( = ?auto_38788 ?auto_38789 ) ) ( not ( = ?auto_38779 ?auto_38788 ) ) ( not ( = ?auto_38786 ?auto_38788 ) ) ( not ( = ?auto_38793 ?auto_38788 ) ) ( HOIST-AT ?auto_38792 ?auto_38788 ) ( not ( = ?auto_38791 ?auto_38792 ) ) ( not ( = ?auto_38781 ?auto_38792 ) ) ( not ( = ?auto_38783 ?auto_38792 ) ) ( not ( = ?auto_38782 ?auto_38792 ) ) ( AVAILABLE ?auto_38792 ) ( SURFACE-AT ?auto_38784 ?auto_38788 ) ( ON ?auto_38784 ?auto_38796 ) ( CLEAR ?auto_38784 ) ( not ( = ?auto_38777 ?auto_38796 ) ) ( not ( = ?auto_38778 ?auto_38796 ) ) ( not ( = ?auto_38780 ?auto_38796 ) ) ( not ( = ?auto_38795 ?auto_38796 ) ) ( not ( = ?auto_38785 ?auto_38796 ) ) ( not ( = ?auto_38784 ?auto_38796 ) ) ( not ( = ?auto_38787 ?auto_38796 ) ) ( not ( = ?auto_38794 ?auto_38796 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38792 ?auto_38784 ?auto_38796 ?auto_38788 )
      ( MAKE-ON ?auto_38777 ?auto_38778 )
      ( MAKE-ON-VERIFY ?auto_38777 ?auto_38778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38797 - SURFACE
      ?auto_38798 - SURFACE
    )
    :vars
    (
      ?auto_38811 - HOIST
      ?auto_38812 - PLACE
      ?auto_38803 - PLACE
      ?auto_38808 - HOIST
      ?auto_38809 - SURFACE
      ?auto_38807 - SURFACE
      ?auto_38799 - PLACE
      ?auto_38805 - HOIST
      ?auto_38815 - SURFACE
      ?auto_38806 - SURFACE
      ?auto_38814 - PLACE
      ?auto_38810 - HOIST
      ?auto_38801 - SURFACE
      ?auto_38804 - SURFACE
      ?auto_38802 - PLACE
      ?auto_38800 - HOIST
      ?auto_38816 - SURFACE
      ?auto_38813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38811 ?auto_38812 ) ( IS-CRATE ?auto_38797 ) ( not ( = ?auto_38797 ?auto_38798 ) ) ( not ( = ?auto_38803 ?auto_38812 ) ) ( HOIST-AT ?auto_38808 ?auto_38803 ) ( not ( = ?auto_38811 ?auto_38808 ) ) ( AVAILABLE ?auto_38808 ) ( SURFACE-AT ?auto_38797 ?auto_38803 ) ( ON ?auto_38797 ?auto_38809 ) ( CLEAR ?auto_38797 ) ( not ( = ?auto_38797 ?auto_38809 ) ) ( not ( = ?auto_38798 ?auto_38809 ) ) ( IS-CRATE ?auto_38798 ) ( not ( = ?auto_38797 ?auto_38807 ) ) ( not ( = ?auto_38798 ?auto_38807 ) ) ( not ( = ?auto_38809 ?auto_38807 ) ) ( not ( = ?auto_38799 ?auto_38812 ) ) ( not ( = ?auto_38803 ?auto_38799 ) ) ( HOIST-AT ?auto_38805 ?auto_38799 ) ( not ( = ?auto_38811 ?auto_38805 ) ) ( not ( = ?auto_38808 ?auto_38805 ) ) ( AVAILABLE ?auto_38805 ) ( SURFACE-AT ?auto_38798 ?auto_38799 ) ( ON ?auto_38798 ?auto_38815 ) ( CLEAR ?auto_38798 ) ( not ( = ?auto_38797 ?auto_38815 ) ) ( not ( = ?auto_38798 ?auto_38815 ) ) ( not ( = ?auto_38809 ?auto_38815 ) ) ( not ( = ?auto_38807 ?auto_38815 ) ) ( IS-CRATE ?auto_38807 ) ( not ( = ?auto_38797 ?auto_38806 ) ) ( not ( = ?auto_38798 ?auto_38806 ) ) ( not ( = ?auto_38809 ?auto_38806 ) ) ( not ( = ?auto_38807 ?auto_38806 ) ) ( not ( = ?auto_38815 ?auto_38806 ) ) ( not ( = ?auto_38814 ?auto_38812 ) ) ( not ( = ?auto_38803 ?auto_38814 ) ) ( not ( = ?auto_38799 ?auto_38814 ) ) ( HOIST-AT ?auto_38810 ?auto_38814 ) ( not ( = ?auto_38811 ?auto_38810 ) ) ( not ( = ?auto_38808 ?auto_38810 ) ) ( not ( = ?auto_38805 ?auto_38810 ) ) ( AVAILABLE ?auto_38810 ) ( SURFACE-AT ?auto_38807 ?auto_38814 ) ( ON ?auto_38807 ?auto_38801 ) ( CLEAR ?auto_38807 ) ( not ( = ?auto_38797 ?auto_38801 ) ) ( not ( = ?auto_38798 ?auto_38801 ) ) ( not ( = ?auto_38809 ?auto_38801 ) ) ( not ( = ?auto_38807 ?auto_38801 ) ) ( not ( = ?auto_38815 ?auto_38801 ) ) ( not ( = ?auto_38806 ?auto_38801 ) ) ( SURFACE-AT ?auto_38804 ?auto_38812 ) ( CLEAR ?auto_38804 ) ( IS-CRATE ?auto_38806 ) ( not ( = ?auto_38797 ?auto_38804 ) ) ( not ( = ?auto_38798 ?auto_38804 ) ) ( not ( = ?auto_38809 ?auto_38804 ) ) ( not ( = ?auto_38807 ?auto_38804 ) ) ( not ( = ?auto_38815 ?auto_38804 ) ) ( not ( = ?auto_38806 ?auto_38804 ) ) ( not ( = ?auto_38801 ?auto_38804 ) ) ( AVAILABLE ?auto_38811 ) ( not ( = ?auto_38802 ?auto_38812 ) ) ( not ( = ?auto_38803 ?auto_38802 ) ) ( not ( = ?auto_38799 ?auto_38802 ) ) ( not ( = ?auto_38814 ?auto_38802 ) ) ( HOIST-AT ?auto_38800 ?auto_38802 ) ( not ( = ?auto_38811 ?auto_38800 ) ) ( not ( = ?auto_38808 ?auto_38800 ) ) ( not ( = ?auto_38805 ?auto_38800 ) ) ( not ( = ?auto_38810 ?auto_38800 ) ) ( AVAILABLE ?auto_38800 ) ( SURFACE-AT ?auto_38806 ?auto_38802 ) ( ON ?auto_38806 ?auto_38816 ) ( CLEAR ?auto_38806 ) ( not ( = ?auto_38797 ?auto_38816 ) ) ( not ( = ?auto_38798 ?auto_38816 ) ) ( not ( = ?auto_38809 ?auto_38816 ) ) ( not ( = ?auto_38807 ?auto_38816 ) ) ( not ( = ?auto_38815 ?auto_38816 ) ) ( not ( = ?auto_38806 ?auto_38816 ) ) ( not ( = ?auto_38801 ?auto_38816 ) ) ( not ( = ?auto_38804 ?auto_38816 ) ) ( TRUCK-AT ?auto_38813 ?auto_38812 ) )
    :subtasks
    ( ( !DRIVE ?auto_38813 ?auto_38812 ?auto_38802 )
      ( MAKE-ON ?auto_38797 ?auto_38798 )
      ( MAKE-ON-VERIFY ?auto_38797 ?auto_38798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38817 - SURFACE
      ?auto_38818 - SURFACE
    )
    :vars
    (
      ?auto_38830 - HOIST
      ?auto_38833 - PLACE
      ?auto_38819 - PLACE
      ?auto_38823 - HOIST
      ?auto_38822 - SURFACE
      ?auto_38827 - SURFACE
      ?auto_38826 - PLACE
      ?auto_38820 - HOIST
      ?auto_38834 - SURFACE
      ?auto_38829 - SURFACE
      ?auto_38836 - PLACE
      ?auto_38828 - HOIST
      ?auto_38832 - SURFACE
      ?auto_38821 - SURFACE
      ?auto_38831 - PLACE
      ?auto_38825 - HOIST
      ?auto_38835 - SURFACE
      ?auto_38824 - TRUCK
      ?auto_38837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38830 ?auto_38833 ) ( IS-CRATE ?auto_38817 ) ( not ( = ?auto_38817 ?auto_38818 ) ) ( not ( = ?auto_38819 ?auto_38833 ) ) ( HOIST-AT ?auto_38823 ?auto_38819 ) ( not ( = ?auto_38830 ?auto_38823 ) ) ( AVAILABLE ?auto_38823 ) ( SURFACE-AT ?auto_38817 ?auto_38819 ) ( ON ?auto_38817 ?auto_38822 ) ( CLEAR ?auto_38817 ) ( not ( = ?auto_38817 ?auto_38822 ) ) ( not ( = ?auto_38818 ?auto_38822 ) ) ( IS-CRATE ?auto_38818 ) ( not ( = ?auto_38817 ?auto_38827 ) ) ( not ( = ?auto_38818 ?auto_38827 ) ) ( not ( = ?auto_38822 ?auto_38827 ) ) ( not ( = ?auto_38826 ?auto_38833 ) ) ( not ( = ?auto_38819 ?auto_38826 ) ) ( HOIST-AT ?auto_38820 ?auto_38826 ) ( not ( = ?auto_38830 ?auto_38820 ) ) ( not ( = ?auto_38823 ?auto_38820 ) ) ( AVAILABLE ?auto_38820 ) ( SURFACE-AT ?auto_38818 ?auto_38826 ) ( ON ?auto_38818 ?auto_38834 ) ( CLEAR ?auto_38818 ) ( not ( = ?auto_38817 ?auto_38834 ) ) ( not ( = ?auto_38818 ?auto_38834 ) ) ( not ( = ?auto_38822 ?auto_38834 ) ) ( not ( = ?auto_38827 ?auto_38834 ) ) ( IS-CRATE ?auto_38827 ) ( not ( = ?auto_38817 ?auto_38829 ) ) ( not ( = ?auto_38818 ?auto_38829 ) ) ( not ( = ?auto_38822 ?auto_38829 ) ) ( not ( = ?auto_38827 ?auto_38829 ) ) ( not ( = ?auto_38834 ?auto_38829 ) ) ( not ( = ?auto_38836 ?auto_38833 ) ) ( not ( = ?auto_38819 ?auto_38836 ) ) ( not ( = ?auto_38826 ?auto_38836 ) ) ( HOIST-AT ?auto_38828 ?auto_38836 ) ( not ( = ?auto_38830 ?auto_38828 ) ) ( not ( = ?auto_38823 ?auto_38828 ) ) ( not ( = ?auto_38820 ?auto_38828 ) ) ( AVAILABLE ?auto_38828 ) ( SURFACE-AT ?auto_38827 ?auto_38836 ) ( ON ?auto_38827 ?auto_38832 ) ( CLEAR ?auto_38827 ) ( not ( = ?auto_38817 ?auto_38832 ) ) ( not ( = ?auto_38818 ?auto_38832 ) ) ( not ( = ?auto_38822 ?auto_38832 ) ) ( not ( = ?auto_38827 ?auto_38832 ) ) ( not ( = ?auto_38834 ?auto_38832 ) ) ( not ( = ?auto_38829 ?auto_38832 ) ) ( IS-CRATE ?auto_38829 ) ( not ( = ?auto_38817 ?auto_38821 ) ) ( not ( = ?auto_38818 ?auto_38821 ) ) ( not ( = ?auto_38822 ?auto_38821 ) ) ( not ( = ?auto_38827 ?auto_38821 ) ) ( not ( = ?auto_38834 ?auto_38821 ) ) ( not ( = ?auto_38829 ?auto_38821 ) ) ( not ( = ?auto_38832 ?auto_38821 ) ) ( not ( = ?auto_38831 ?auto_38833 ) ) ( not ( = ?auto_38819 ?auto_38831 ) ) ( not ( = ?auto_38826 ?auto_38831 ) ) ( not ( = ?auto_38836 ?auto_38831 ) ) ( HOIST-AT ?auto_38825 ?auto_38831 ) ( not ( = ?auto_38830 ?auto_38825 ) ) ( not ( = ?auto_38823 ?auto_38825 ) ) ( not ( = ?auto_38820 ?auto_38825 ) ) ( not ( = ?auto_38828 ?auto_38825 ) ) ( AVAILABLE ?auto_38825 ) ( SURFACE-AT ?auto_38829 ?auto_38831 ) ( ON ?auto_38829 ?auto_38835 ) ( CLEAR ?auto_38829 ) ( not ( = ?auto_38817 ?auto_38835 ) ) ( not ( = ?auto_38818 ?auto_38835 ) ) ( not ( = ?auto_38822 ?auto_38835 ) ) ( not ( = ?auto_38827 ?auto_38835 ) ) ( not ( = ?auto_38834 ?auto_38835 ) ) ( not ( = ?auto_38829 ?auto_38835 ) ) ( not ( = ?auto_38832 ?auto_38835 ) ) ( not ( = ?auto_38821 ?auto_38835 ) ) ( TRUCK-AT ?auto_38824 ?auto_38833 ) ( SURFACE-AT ?auto_38837 ?auto_38833 ) ( CLEAR ?auto_38837 ) ( LIFTING ?auto_38830 ?auto_38821 ) ( IS-CRATE ?auto_38821 ) ( not ( = ?auto_38817 ?auto_38837 ) ) ( not ( = ?auto_38818 ?auto_38837 ) ) ( not ( = ?auto_38822 ?auto_38837 ) ) ( not ( = ?auto_38827 ?auto_38837 ) ) ( not ( = ?auto_38834 ?auto_38837 ) ) ( not ( = ?auto_38829 ?auto_38837 ) ) ( not ( = ?auto_38832 ?auto_38837 ) ) ( not ( = ?auto_38821 ?auto_38837 ) ) ( not ( = ?auto_38835 ?auto_38837 ) ) )
    :subtasks
    ( ( !DROP ?auto_38830 ?auto_38821 ?auto_38837 ?auto_38833 )
      ( MAKE-ON ?auto_38817 ?auto_38818 )
      ( MAKE-ON-VERIFY ?auto_38817 ?auto_38818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38838 - SURFACE
      ?auto_38839 - SURFACE
    )
    :vars
    (
      ?auto_38852 - HOIST
      ?auto_38844 - PLACE
      ?auto_38841 - PLACE
      ?auto_38855 - HOIST
      ?auto_38854 - SURFACE
      ?auto_38840 - SURFACE
      ?auto_38851 - PLACE
      ?auto_38849 - HOIST
      ?auto_38846 - SURFACE
      ?auto_38857 - SURFACE
      ?auto_38847 - PLACE
      ?auto_38842 - HOIST
      ?auto_38850 - SURFACE
      ?auto_38853 - SURFACE
      ?auto_38843 - PLACE
      ?auto_38845 - HOIST
      ?auto_38848 - SURFACE
      ?auto_38856 - TRUCK
      ?auto_38858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38852 ?auto_38844 ) ( IS-CRATE ?auto_38838 ) ( not ( = ?auto_38838 ?auto_38839 ) ) ( not ( = ?auto_38841 ?auto_38844 ) ) ( HOIST-AT ?auto_38855 ?auto_38841 ) ( not ( = ?auto_38852 ?auto_38855 ) ) ( AVAILABLE ?auto_38855 ) ( SURFACE-AT ?auto_38838 ?auto_38841 ) ( ON ?auto_38838 ?auto_38854 ) ( CLEAR ?auto_38838 ) ( not ( = ?auto_38838 ?auto_38854 ) ) ( not ( = ?auto_38839 ?auto_38854 ) ) ( IS-CRATE ?auto_38839 ) ( not ( = ?auto_38838 ?auto_38840 ) ) ( not ( = ?auto_38839 ?auto_38840 ) ) ( not ( = ?auto_38854 ?auto_38840 ) ) ( not ( = ?auto_38851 ?auto_38844 ) ) ( not ( = ?auto_38841 ?auto_38851 ) ) ( HOIST-AT ?auto_38849 ?auto_38851 ) ( not ( = ?auto_38852 ?auto_38849 ) ) ( not ( = ?auto_38855 ?auto_38849 ) ) ( AVAILABLE ?auto_38849 ) ( SURFACE-AT ?auto_38839 ?auto_38851 ) ( ON ?auto_38839 ?auto_38846 ) ( CLEAR ?auto_38839 ) ( not ( = ?auto_38838 ?auto_38846 ) ) ( not ( = ?auto_38839 ?auto_38846 ) ) ( not ( = ?auto_38854 ?auto_38846 ) ) ( not ( = ?auto_38840 ?auto_38846 ) ) ( IS-CRATE ?auto_38840 ) ( not ( = ?auto_38838 ?auto_38857 ) ) ( not ( = ?auto_38839 ?auto_38857 ) ) ( not ( = ?auto_38854 ?auto_38857 ) ) ( not ( = ?auto_38840 ?auto_38857 ) ) ( not ( = ?auto_38846 ?auto_38857 ) ) ( not ( = ?auto_38847 ?auto_38844 ) ) ( not ( = ?auto_38841 ?auto_38847 ) ) ( not ( = ?auto_38851 ?auto_38847 ) ) ( HOIST-AT ?auto_38842 ?auto_38847 ) ( not ( = ?auto_38852 ?auto_38842 ) ) ( not ( = ?auto_38855 ?auto_38842 ) ) ( not ( = ?auto_38849 ?auto_38842 ) ) ( AVAILABLE ?auto_38842 ) ( SURFACE-AT ?auto_38840 ?auto_38847 ) ( ON ?auto_38840 ?auto_38850 ) ( CLEAR ?auto_38840 ) ( not ( = ?auto_38838 ?auto_38850 ) ) ( not ( = ?auto_38839 ?auto_38850 ) ) ( not ( = ?auto_38854 ?auto_38850 ) ) ( not ( = ?auto_38840 ?auto_38850 ) ) ( not ( = ?auto_38846 ?auto_38850 ) ) ( not ( = ?auto_38857 ?auto_38850 ) ) ( IS-CRATE ?auto_38857 ) ( not ( = ?auto_38838 ?auto_38853 ) ) ( not ( = ?auto_38839 ?auto_38853 ) ) ( not ( = ?auto_38854 ?auto_38853 ) ) ( not ( = ?auto_38840 ?auto_38853 ) ) ( not ( = ?auto_38846 ?auto_38853 ) ) ( not ( = ?auto_38857 ?auto_38853 ) ) ( not ( = ?auto_38850 ?auto_38853 ) ) ( not ( = ?auto_38843 ?auto_38844 ) ) ( not ( = ?auto_38841 ?auto_38843 ) ) ( not ( = ?auto_38851 ?auto_38843 ) ) ( not ( = ?auto_38847 ?auto_38843 ) ) ( HOIST-AT ?auto_38845 ?auto_38843 ) ( not ( = ?auto_38852 ?auto_38845 ) ) ( not ( = ?auto_38855 ?auto_38845 ) ) ( not ( = ?auto_38849 ?auto_38845 ) ) ( not ( = ?auto_38842 ?auto_38845 ) ) ( AVAILABLE ?auto_38845 ) ( SURFACE-AT ?auto_38857 ?auto_38843 ) ( ON ?auto_38857 ?auto_38848 ) ( CLEAR ?auto_38857 ) ( not ( = ?auto_38838 ?auto_38848 ) ) ( not ( = ?auto_38839 ?auto_38848 ) ) ( not ( = ?auto_38854 ?auto_38848 ) ) ( not ( = ?auto_38840 ?auto_38848 ) ) ( not ( = ?auto_38846 ?auto_38848 ) ) ( not ( = ?auto_38857 ?auto_38848 ) ) ( not ( = ?auto_38850 ?auto_38848 ) ) ( not ( = ?auto_38853 ?auto_38848 ) ) ( TRUCK-AT ?auto_38856 ?auto_38844 ) ( SURFACE-AT ?auto_38858 ?auto_38844 ) ( CLEAR ?auto_38858 ) ( IS-CRATE ?auto_38853 ) ( not ( = ?auto_38838 ?auto_38858 ) ) ( not ( = ?auto_38839 ?auto_38858 ) ) ( not ( = ?auto_38854 ?auto_38858 ) ) ( not ( = ?auto_38840 ?auto_38858 ) ) ( not ( = ?auto_38846 ?auto_38858 ) ) ( not ( = ?auto_38857 ?auto_38858 ) ) ( not ( = ?auto_38850 ?auto_38858 ) ) ( not ( = ?auto_38853 ?auto_38858 ) ) ( not ( = ?auto_38848 ?auto_38858 ) ) ( AVAILABLE ?auto_38852 ) ( IN ?auto_38853 ?auto_38856 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38852 ?auto_38853 ?auto_38856 ?auto_38844 )
      ( MAKE-ON ?auto_38838 ?auto_38839 )
      ( MAKE-ON-VERIFY ?auto_38838 ?auto_38839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38859 - SURFACE
      ?auto_38860 - SURFACE
    )
    :vars
    (
      ?auto_38877 - HOIST
      ?auto_38870 - PLACE
      ?auto_38869 - PLACE
      ?auto_38876 - HOIST
      ?auto_38872 - SURFACE
      ?auto_38871 - SURFACE
      ?auto_38879 - PLACE
      ?auto_38861 - HOIST
      ?auto_38867 - SURFACE
      ?auto_38874 - SURFACE
      ?auto_38865 - PLACE
      ?auto_38863 - HOIST
      ?auto_38862 - SURFACE
      ?auto_38868 - SURFACE
      ?auto_38864 - PLACE
      ?auto_38866 - HOIST
      ?auto_38878 - SURFACE
      ?auto_38875 - SURFACE
      ?auto_38873 - TRUCK
      ?auto_38880 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38877 ?auto_38870 ) ( IS-CRATE ?auto_38859 ) ( not ( = ?auto_38859 ?auto_38860 ) ) ( not ( = ?auto_38869 ?auto_38870 ) ) ( HOIST-AT ?auto_38876 ?auto_38869 ) ( not ( = ?auto_38877 ?auto_38876 ) ) ( AVAILABLE ?auto_38876 ) ( SURFACE-AT ?auto_38859 ?auto_38869 ) ( ON ?auto_38859 ?auto_38872 ) ( CLEAR ?auto_38859 ) ( not ( = ?auto_38859 ?auto_38872 ) ) ( not ( = ?auto_38860 ?auto_38872 ) ) ( IS-CRATE ?auto_38860 ) ( not ( = ?auto_38859 ?auto_38871 ) ) ( not ( = ?auto_38860 ?auto_38871 ) ) ( not ( = ?auto_38872 ?auto_38871 ) ) ( not ( = ?auto_38879 ?auto_38870 ) ) ( not ( = ?auto_38869 ?auto_38879 ) ) ( HOIST-AT ?auto_38861 ?auto_38879 ) ( not ( = ?auto_38877 ?auto_38861 ) ) ( not ( = ?auto_38876 ?auto_38861 ) ) ( AVAILABLE ?auto_38861 ) ( SURFACE-AT ?auto_38860 ?auto_38879 ) ( ON ?auto_38860 ?auto_38867 ) ( CLEAR ?auto_38860 ) ( not ( = ?auto_38859 ?auto_38867 ) ) ( not ( = ?auto_38860 ?auto_38867 ) ) ( not ( = ?auto_38872 ?auto_38867 ) ) ( not ( = ?auto_38871 ?auto_38867 ) ) ( IS-CRATE ?auto_38871 ) ( not ( = ?auto_38859 ?auto_38874 ) ) ( not ( = ?auto_38860 ?auto_38874 ) ) ( not ( = ?auto_38872 ?auto_38874 ) ) ( not ( = ?auto_38871 ?auto_38874 ) ) ( not ( = ?auto_38867 ?auto_38874 ) ) ( not ( = ?auto_38865 ?auto_38870 ) ) ( not ( = ?auto_38869 ?auto_38865 ) ) ( not ( = ?auto_38879 ?auto_38865 ) ) ( HOIST-AT ?auto_38863 ?auto_38865 ) ( not ( = ?auto_38877 ?auto_38863 ) ) ( not ( = ?auto_38876 ?auto_38863 ) ) ( not ( = ?auto_38861 ?auto_38863 ) ) ( AVAILABLE ?auto_38863 ) ( SURFACE-AT ?auto_38871 ?auto_38865 ) ( ON ?auto_38871 ?auto_38862 ) ( CLEAR ?auto_38871 ) ( not ( = ?auto_38859 ?auto_38862 ) ) ( not ( = ?auto_38860 ?auto_38862 ) ) ( not ( = ?auto_38872 ?auto_38862 ) ) ( not ( = ?auto_38871 ?auto_38862 ) ) ( not ( = ?auto_38867 ?auto_38862 ) ) ( not ( = ?auto_38874 ?auto_38862 ) ) ( IS-CRATE ?auto_38874 ) ( not ( = ?auto_38859 ?auto_38868 ) ) ( not ( = ?auto_38860 ?auto_38868 ) ) ( not ( = ?auto_38872 ?auto_38868 ) ) ( not ( = ?auto_38871 ?auto_38868 ) ) ( not ( = ?auto_38867 ?auto_38868 ) ) ( not ( = ?auto_38874 ?auto_38868 ) ) ( not ( = ?auto_38862 ?auto_38868 ) ) ( not ( = ?auto_38864 ?auto_38870 ) ) ( not ( = ?auto_38869 ?auto_38864 ) ) ( not ( = ?auto_38879 ?auto_38864 ) ) ( not ( = ?auto_38865 ?auto_38864 ) ) ( HOIST-AT ?auto_38866 ?auto_38864 ) ( not ( = ?auto_38877 ?auto_38866 ) ) ( not ( = ?auto_38876 ?auto_38866 ) ) ( not ( = ?auto_38861 ?auto_38866 ) ) ( not ( = ?auto_38863 ?auto_38866 ) ) ( AVAILABLE ?auto_38866 ) ( SURFACE-AT ?auto_38874 ?auto_38864 ) ( ON ?auto_38874 ?auto_38878 ) ( CLEAR ?auto_38874 ) ( not ( = ?auto_38859 ?auto_38878 ) ) ( not ( = ?auto_38860 ?auto_38878 ) ) ( not ( = ?auto_38872 ?auto_38878 ) ) ( not ( = ?auto_38871 ?auto_38878 ) ) ( not ( = ?auto_38867 ?auto_38878 ) ) ( not ( = ?auto_38874 ?auto_38878 ) ) ( not ( = ?auto_38862 ?auto_38878 ) ) ( not ( = ?auto_38868 ?auto_38878 ) ) ( SURFACE-AT ?auto_38875 ?auto_38870 ) ( CLEAR ?auto_38875 ) ( IS-CRATE ?auto_38868 ) ( not ( = ?auto_38859 ?auto_38875 ) ) ( not ( = ?auto_38860 ?auto_38875 ) ) ( not ( = ?auto_38872 ?auto_38875 ) ) ( not ( = ?auto_38871 ?auto_38875 ) ) ( not ( = ?auto_38867 ?auto_38875 ) ) ( not ( = ?auto_38874 ?auto_38875 ) ) ( not ( = ?auto_38862 ?auto_38875 ) ) ( not ( = ?auto_38868 ?auto_38875 ) ) ( not ( = ?auto_38878 ?auto_38875 ) ) ( AVAILABLE ?auto_38877 ) ( IN ?auto_38868 ?auto_38873 ) ( TRUCK-AT ?auto_38873 ?auto_38880 ) ( not ( = ?auto_38880 ?auto_38870 ) ) ( not ( = ?auto_38869 ?auto_38880 ) ) ( not ( = ?auto_38879 ?auto_38880 ) ) ( not ( = ?auto_38865 ?auto_38880 ) ) ( not ( = ?auto_38864 ?auto_38880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38873 ?auto_38880 ?auto_38870 )
      ( MAKE-ON ?auto_38859 ?auto_38860 )
      ( MAKE-ON-VERIFY ?auto_38859 ?auto_38860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38881 - SURFACE
      ?auto_38882 - SURFACE
    )
    :vars
    (
      ?auto_38886 - HOIST
      ?auto_38902 - PLACE
      ?auto_38893 - PLACE
      ?auto_38887 - HOIST
      ?auto_38901 - SURFACE
      ?auto_38889 - SURFACE
      ?auto_38897 - PLACE
      ?auto_38885 - HOIST
      ?auto_38900 - SURFACE
      ?auto_38894 - SURFACE
      ?auto_38883 - PLACE
      ?auto_38892 - HOIST
      ?auto_38890 - SURFACE
      ?auto_38891 - SURFACE
      ?auto_38884 - PLACE
      ?auto_38888 - HOIST
      ?auto_38896 - SURFACE
      ?auto_38899 - SURFACE
      ?auto_38895 - TRUCK
      ?auto_38898 - PLACE
      ?auto_38903 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38886 ?auto_38902 ) ( IS-CRATE ?auto_38881 ) ( not ( = ?auto_38881 ?auto_38882 ) ) ( not ( = ?auto_38893 ?auto_38902 ) ) ( HOIST-AT ?auto_38887 ?auto_38893 ) ( not ( = ?auto_38886 ?auto_38887 ) ) ( AVAILABLE ?auto_38887 ) ( SURFACE-AT ?auto_38881 ?auto_38893 ) ( ON ?auto_38881 ?auto_38901 ) ( CLEAR ?auto_38881 ) ( not ( = ?auto_38881 ?auto_38901 ) ) ( not ( = ?auto_38882 ?auto_38901 ) ) ( IS-CRATE ?auto_38882 ) ( not ( = ?auto_38881 ?auto_38889 ) ) ( not ( = ?auto_38882 ?auto_38889 ) ) ( not ( = ?auto_38901 ?auto_38889 ) ) ( not ( = ?auto_38897 ?auto_38902 ) ) ( not ( = ?auto_38893 ?auto_38897 ) ) ( HOIST-AT ?auto_38885 ?auto_38897 ) ( not ( = ?auto_38886 ?auto_38885 ) ) ( not ( = ?auto_38887 ?auto_38885 ) ) ( AVAILABLE ?auto_38885 ) ( SURFACE-AT ?auto_38882 ?auto_38897 ) ( ON ?auto_38882 ?auto_38900 ) ( CLEAR ?auto_38882 ) ( not ( = ?auto_38881 ?auto_38900 ) ) ( not ( = ?auto_38882 ?auto_38900 ) ) ( not ( = ?auto_38901 ?auto_38900 ) ) ( not ( = ?auto_38889 ?auto_38900 ) ) ( IS-CRATE ?auto_38889 ) ( not ( = ?auto_38881 ?auto_38894 ) ) ( not ( = ?auto_38882 ?auto_38894 ) ) ( not ( = ?auto_38901 ?auto_38894 ) ) ( not ( = ?auto_38889 ?auto_38894 ) ) ( not ( = ?auto_38900 ?auto_38894 ) ) ( not ( = ?auto_38883 ?auto_38902 ) ) ( not ( = ?auto_38893 ?auto_38883 ) ) ( not ( = ?auto_38897 ?auto_38883 ) ) ( HOIST-AT ?auto_38892 ?auto_38883 ) ( not ( = ?auto_38886 ?auto_38892 ) ) ( not ( = ?auto_38887 ?auto_38892 ) ) ( not ( = ?auto_38885 ?auto_38892 ) ) ( AVAILABLE ?auto_38892 ) ( SURFACE-AT ?auto_38889 ?auto_38883 ) ( ON ?auto_38889 ?auto_38890 ) ( CLEAR ?auto_38889 ) ( not ( = ?auto_38881 ?auto_38890 ) ) ( not ( = ?auto_38882 ?auto_38890 ) ) ( not ( = ?auto_38901 ?auto_38890 ) ) ( not ( = ?auto_38889 ?auto_38890 ) ) ( not ( = ?auto_38900 ?auto_38890 ) ) ( not ( = ?auto_38894 ?auto_38890 ) ) ( IS-CRATE ?auto_38894 ) ( not ( = ?auto_38881 ?auto_38891 ) ) ( not ( = ?auto_38882 ?auto_38891 ) ) ( not ( = ?auto_38901 ?auto_38891 ) ) ( not ( = ?auto_38889 ?auto_38891 ) ) ( not ( = ?auto_38900 ?auto_38891 ) ) ( not ( = ?auto_38894 ?auto_38891 ) ) ( not ( = ?auto_38890 ?auto_38891 ) ) ( not ( = ?auto_38884 ?auto_38902 ) ) ( not ( = ?auto_38893 ?auto_38884 ) ) ( not ( = ?auto_38897 ?auto_38884 ) ) ( not ( = ?auto_38883 ?auto_38884 ) ) ( HOIST-AT ?auto_38888 ?auto_38884 ) ( not ( = ?auto_38886 ?auto_38888 ) ) ( not ( = ?auto_38887 ?auto_38888 ) ) ( not ( = ?auto_38885 ?auto_38888 ) ) ( not ( = ?auto_38892 ?auto_38888 ) ) ( AVAILABLE ?auto_38888 ) ( SURFACE-AT ?auto_38894 ?auto_38884 ) ( ON ?auto_38894 ?auto_38896 ) ( CLEAR ?auto_38894 ) ( not ( = ?auto_38881 ?auto_38896 ) ) ( not ( = ?auto_38882 ?auto_38896 ) ) ( not ( = ?auto_38901 ?auto_38896 ) ) ( not ( = ?auto_38889 ?auto_38896 ) ) ( not ( = ?auto_38900 ?auto_38896 ) ) ( not ( = ?auto_38894 ?auto_38896 ) ) ( not ( = ?auto_38890 ?auto_38896 ) ) ( not ( = ?auto_38891 ?auto_38896 ) ) ( SURFACE-AT ?auto_38899 ?auto_38902 ) ( CLEAR ?auto_38899 ) ( IS-CRATE ?auto_38891 ) ( not ( = ?auto_38881 ?auto_38899 ) ) ( not ( = ?auto_38882 ?auto_38899 ) ) ( not ( = ?auto_38901 ?auto_38899 ) ) ( not ( = ?auto_38889 ?auto_38899 ) ) ( not ( = ?auto_38900 ?auto_38899 ) ) ( not ( = ?auto_38894 ?auto_38899 ) ) ( not ( = ?auto_38890 ?auto_38899 ) ) ( not ( = ?auto_38891 ?auto_38899 ) ) ( not ( = ?auto_38896 ?auto_38899 ) ) ( AVAILABLE ?auto_38886 ) ( TRUCK-AT ?auto_38895 ?auto_38898 ) ( not ( = ?auto_38898 ?auto_38902 ) ) ( not ( = ?auto_38893 ?auto_38898 ) ) ( not ( = ?auto_38897 ?auto_38898 ) ) ( not ( = ?auto_38883 ?auto_38898 ) ) ( not ( = ?auto_38884 ?auto_38898 ) ) ( HOIST-AT ?auto_38903 ?auto_38898 ) ( LIFTING ?auto_38903 ?auto_38891 ) ( not ( = ?auto_38886 ?auto_38903 ) ) ( not ( = ?auto_38887 ?auto_38903 ) ) ( not ( = ?auto_38885 ?auto_38903 ) ) ( not ( = ?auto_38892 ?auto_38903 ) ) ( not ( = ?auto_38888 ?auto_38903 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38903 ?auto_38891 ?auto_38895 ?auto_38898 )
      ( MAKE-ON ?auto_38881 ?auto_38882 )
      ( MAKE-ON-VERIFY ?auto_38881 ?auto_38882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38904 - SURFACE
      ?auto_38905 - SURFACE
    )
    :vars
    (
      ?auto_38923 - HOIST
      ?auto_38915 - PLACE
      ?auto_38909 - PLACE
      ?auto_38906 - HOIST
      ?auto_38914 - SURFACE
      ?auto_38910 - SURFACE
      ?auto_38917 - PLACE
      ?auto_38922 - HOIST
      ?auto_38913 - SURFACE
      ?auto_38925 - SURFACE
      ?auto_38908 - PLACE
      ?auto_38920 - HOIST
      ?auto_38918 - SURFACE
      ?auto_38911 - SURFACE
      ?auto_38926 - PLACE
      ?auto_38924 - HOIST
      ?auto_38919 - SURFACE
      ?auto_38907 - SURFACE
      ?auto_38921 - TRUCK
      ?auto_38916 - PLACE
      ?auto_38912 - HOIST
      ?auto_38927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38923 ?auto_38915 ) ( IS-CRATE ?auto_38904 ) ( not ( = ?auto_38904 ?auto_38905 ) ) ( not ( = ?auto_38909 ?auto_38915 ) ) ( HOIST-AT ?auto_38906 ?auto_38909 ) ( not ( = ?auto_38923 ?auto_38906 ) ) ( AVAILABLE ?auto_38906 ) ( SURFACE-AT ?auto_38904 ?auto_38909 ) ( ON ?auto_38904 ?auto_38914 ) ( CLEAR ?auto_38904 ) ( not ( = ?auto_38904 ?auto_38914 ) ) ( not ( = ?auto_38905 ?auto_38914 ) ) ( IS-CRATE ?auto_38905 ) ( not ( = ?auto_38904 ?auto_38910 ) ) ( not ( = ?auto_38905 ?auto_38910 ) ) ( not ( = ?auto_38914 ?auto_38910 ) ) ( not ( = ?auto_38917 ?auto_38915 ) ) ( not ( = ?auto_38909 ?auto_38917 ) ) ( HOIST-AT ?auto_38922 ?auto_38917 ) ( not ( = ?auto_38923 ?auto_38922 ) ) ( not ( = ?auto_38906 ?auto_38922 ) ) ( AVAILABLE ?auto_38922 ) ( SURFACE-AT ?auto_38905 ?auto_38917 ) ( ON ?auto_38905 ?auto_38913 ) ( CLEAR ?auto_38905 ) ( not ( = ?auto_38904 ?auto_38913 ) ) ( not ( = ?auto_38905 ?auto_38913 ) ) ( not ( = ?auto_38914 ?auto_38913 ) ) ( not ( = ?auto_38910 ?auto_38913 ) ) ( IS-CRATE ?auto_38910 ) ( not ( = ?auto_38904 ?auto_38925 ) ) ( not ( = ?auto_38905 ?auto_38925 ) ) ( not ( = ?auto_38914 ?auto_38925 ) ) ( not ( = ?auto_38910 ?auto_38925 ) ) ( not ( = ?auto_38913 ?auto_38925 ) ) ( not ( = ?auto_38908 ?auto_38915 ) ) ( not ( = ?auto_38909 ?auto_38908 ) ) ( not ( = ?auto_38917 ?auto_38908 ) ) ( HOIST-AT ?auto_38920 ?auto_38908 ) ( not ( = ?auto_38923 ?auto_38920 ) ) ( not ( = ?auto_38906 ?auto_38920 ) ) ( not ( = ?auto_38922 ?auto_38920 ) ) ( AVAILABLE ?auto_38920 ) ( SURFACE-AT ?auto_38910 ?auto_38908 ) ( ON ?auto_38910 ?auto_38918 ) ( CLEAR ?auto_38910 ) ( not ( = ?auto_38904 ?auto_38918 ) ) ( not ( = ?auto_38905 ?auto_38918 ) ) ( not ( = ?auto_38914 ?auto_38918 ) ) ( not ( = ?auto_38910 ?auto_38918 ) ) ( not ( = ?auto_38913 ?auto_38918 ) ) ( not ( = ?auto_38925 ?auto_38918 ) ) ( IS-CRATE ?auto_38925 ) ( not ( = ?auto_38904 ?auto_38911 ) ) ( not ( = ?auto_38905 ?auto_38911 ) ) ( not ( = ?auto_38914 ?auto_38911 ) ) ( not ( = ?auto_38910 ?auto_38911 ) ) ( not ( = ?auto_38913 ?auto_38911 ) ) ( not ( = ?auto_38925 ?auto_38911 ) ) ( not ( = ?auto_38918 ?auto_38911 ) ) ( not ( = ?auto_38926 ?auto_38915 ) ) ( not ( = ?auto_38909 ?auto_38926 ) ) ( not ( = ?auto_38917 ?auto_38926 ) ) ( not ( = ?auto_38908 ?auto_38926 ) ) ( HOIST-AT ?auto_38924 ?auto_38926 ) ( not ( = ?auto_38923 ?auto_38924 ) ) ( not ( = ?auto_38906 ?auto_38924 ) ) ( not ( = ?auto_38922 ?auto_38924 ) ) ( not ( = ?auto_38920 ?auto_38924 ) ) ( AVAILABLE ?auto_38924 ) ( SURFACE-AT ?auto_38925 ?auto_38926 ) ( ON ?auto_38925 ?auto_38919 ) ( CLEAR ?auto_38925 ) ( not ( = ?auto_38904 ?auto_38919 ) ) ( not ( = ?auto_38905 ?auto_38919 ) ) ( not ( = ?auto_38914 ?auto_38919 ) ) ( not ( = ?auto_38910 ?auto_38919 ) ) ( not ( = ?auto_38913 ?auto_38919 ) ) ( not ( = ?auto_38925 ?auto_38919 ) ) ( not ( = ?auto_38918 ?auto_38919 ) ) ( not ( = ?auto_38911 ?auto_38919 ) ) ( SURFACE-AT ?auto_38907 ?auto_38915 ) ( CLEAR ?auto_38907 ) ( IS-CRATE ?auto_38911 ) ( not ( = ?auto_38904 ?auto_38907 ) ) ( not ( = ?auto_38905 ?auto_38907 ) ) ( not ( = ?auto_38914 ?auto_38907 ) ) ( not ( = ?auto_38910 ?auto_38907 ) ) ( not ( = ?auto_38913 ?auto_38907 ) ) ( not ( = ?auto_38925 ?auto_38907 ) ) ( not ( = ?auto_38918 ?auto_38907 ) ) ( not ( = ?auto_38911 ?auto_38907 ) ) ( not ( = ?auto_38919 ?auto_38907 ) ) ( AVAILABLE ?auto_38923 ) ( TRUCK-AT ?auto_38921 ?auto_38916 ) ( not ( = ?auto_38916 ?auto_38915 ) ) ( not ( = ?auto_38909 ?auto_38916 ) ) ( not ( = ?auto_38917 ?auto_38916 ) ) ( not ( = ?auto_38908 ?auto_38916 ) ) ( not ( = ?auto_38926 ?auto_38916 ) ) ( HOIST-AT ?auto_38912 ?auto_38916 ) ( not ( = ?auto_38923 ?auto_38912 ) ) ( not ( = ?auto_38906 ?auto_38912 ) ) ( not ( = ?auto_38922 ?auto_38912 ) ) ( not ( = ?auto_38920 ?auto_38912 ) ) ( not ( = ?auto_38924 ?auto_38912 ) ) ( AVAILABLE ?auto_38912 ) ( SURFACE-AT ?auto_38911 ?auto_38916 ) ( ON ?auto_38911 ?auto_38927 ) ( CLEAR ?auto_38911 ) ( not ( = ?auto_38904 ?auto_38927 ) ) ( not ( = ?auto_38905 ?auto_38927 ) ) ( not ( = ?auto_38914 ?auto_38927 ) ) ( not ( = ?auto_38910 ?auto_38927 ) ) ( not ( = ?auto_38913 ?auto_38927 ) ) ( not ( = ?auto_38925 ?auto_38927 ) ) ( not ( = ?auto_38918 ?auto_38927 ) ) ( not ( = ?auto_38911 ?auto_38927 ) ) ( not ( = ?auto_38919 ?auto_38927 ) ) ( not ( = ?auto_38907 ?auto_38927 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38912 ?auto_38911 ?auto_38927 ?auto_38916 )
      ( MAKE-ON ?auto_38904 ?auto_38905 )
      ( MAKE-ON-VERIFY ?auto_38904 ?auto_38905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38928 - SURFACE
      ?auto_38929 - SURFACE
    )
    :vars
    (
      ?auto_38933 - HOIST
      ?auto_38943 - PLACE
      ?auto_38942 - PLACE
      ?auto_38949 - HOIST
      ?auto_38948 - SURFACE
      ?auto_38941 - SURFACE
      ?auto_38940 - PLACE
      ?auto_38934 - HOIST
      ?auto_38935 - SURFACE
      ?auto_38936 - SURFACE
      ?auto_38945 - PLACE
      ?auto_38946 - HOIST
      ?auto_38944 - SURFACE
      ?auto_38950 - SURFACE
      ?auto_38939 - PLACE
      ?auto_38938 - HOIST
      ?auto_38931 - SURFACE
      ?auto_38951 - SURFACE
      ?auto_38930 - PLACE
      ?auto_38937 - HOIST
      ?auto_38947 - SURFACE
      ?auto_38932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38933 ?auto_38943 ) ( IS-CRATE ?auto_38928 ) ( not ( = ?auto_38928 ?auto_38929 ) ) ( not ( = ?auto_38942 ?auto_38943 ) ) ( HOIST-AT ?auto_38949 ?auto_38942 ) ( not ( = ?auto_38933 ?auto_38949 ) ) ( AVAILABLE ?auto_38949 ) ( SURFACE-AT ?auto_38928 ?auto_38942 ) ( ON ?auto_38928 ?auto_38948 ) ( CLEAR ?auto_38928 ) ( not ( = ?auto_38928 ?auto_38948 ) ) ( not ( = ?auto_38929 ?auto_38948 ) ) ( IS-CRATE ?auto_38929 ) ( not ( = ?auto_38928 ?auto_38941 ) ) ( not ( = ?auto_38929 ?auto_38941 ) ) ( not ( = ?auto_38948 ?auto_38941 ) ) ( not ( = ?auto_38940 ?auto_38943 ) ) ( not ( = ?auto_38942 ?auto_38940 ) ) ( HOIST-AT ?auto_38934 ?auto_38940 ) ( not ( = ?auto_38933 ?auto_38934 ) ) ( not ( = ?auto_38949 ?auto_38934 ) ) ( AVAILABLE ?auto_38934 ) ( SURFACE-AT ?auto_38929 ?auto_38940 ) ( ON ?auto_38929 ?auto_38935 ) ( CLEAR ?auto_38929 ) ( not ( = ?auto_38928 ?auto_38935 ) ) ( not ( = ?auto_38929 ?auto_38935 ) ) ( not ( = ?auto_38948 ?auto_38935 ) ) ( not ( = ?auto_38941 ?auto_38935 ) ) ( IS-CRATE ?auto_38941 ) ( not ( = ?auto_38928 ?auto_38936 ) ) ( not ( = ?auto_38929 ?auto_38936 ) ) ( not ( = ?auto_38948 ?auto_38936 ) ) ( not ( = ?auto_38941 ?auto_38936 ) ) ( not ( = ?auto_38935 ?auto_38936 ) ) ( not ( = ?auto_38945 ?auto_38943 ) ) ( not ( = ?auto_38942 ?auto_38945 ) ) ( not ( = ?auto_38940 ?auto_38945 ) ) ( HOIST-AT ?auto_38946 ?auto_38945 ) ( not ( = ?auto_38933 ?auto_38946 ) ) ( not ( = ?auto_38949 ?auto_38946 ) ) ( not ( = ?auto_38934 ?auto_38946 ) ) ( AVAILABLE ?auto_38946 ) ( SURFACE-AT ?auto_38941 ?auto_38945 ) ( ON ?auto_38941 ?auto_38944 ) ( CLEAR ?auto_38941 ) ( not ( = ?auto_38928 ?auto_38944 ) ) ( not ( = ?auto_38929 ?auto_38944 ) ) ( not ( = ?auto_38948 ?auto_38944 ) ) ( not ( = ?auto_38941 ?auto_38944 ) ) ( not ( = ?auto_38935 ?auto_38944 ) ) ( not ( = ?auto_38936 ?auto_38944 ) ) ( IS-CRATE ?auto_38936 ) ( not ( = ?auto_38928 ?auto_38950 ) ) ( not ( = ?auto_38929 ?auto_38950 ) ) ( not ( = ?auto_38948 ?auto_38950 ) ) ( not ( = ?auto_38941 ?auto_38950 ) ) ( not ( = ?auto_38935 ?auto_38950 ) ) ( not ( = ?auto_38936 ?auto_38950 ) ) ( not ( = ?auto_38944 ?auto_38950 ) ) ( not ( = ?auto_38939 ?auto_38943 ) ) ( not ( = ?auto_38942 ?auto_38939 ) ) ( not ( = ?auto_38940 ?auto_38939 ) ) ( not ( = ?auto_38945 ?auto_38939 ) ) ( HOIST-AT ?auto_38938 ?auto_38939 ) ( not ( = ?auto_38933 ?auto_38938 ) ) ( not ( = ?auto_38949 ?auto_38938 ) ) ( not ( = ?auto_38934 ?auto_38938 ) ) ( not ( = ?auto_38946 ?auto_38938 ) ) ( AVAILABLE ?auto_38938 ) ( SURFACE-AT ?auto_38936 ?auto_38939 ) ( ON ?auto_38936 ?auto_38931 ) ( CLEAR ?auto_38936 ) ( not ( = ?auto_38928 ?auto_38931 ) ) ( not ( = ?auto_38929 ?auto_38931 ) ) ( not ( = ?auto_38948 ?auto_38931 ) ) ( not ( = ?auto_38941 ?auto_38931 ) ) ( not ( = ?auto_38935 ?auto_38931 ) ) ( not ( = ?auto_38936 ?auto_38931 ) ) ( not ( = ?auto_38944 ?auto_38931 ) ) ( not ( = ?auto_38950 ?auto_38931 ) ) ( SURFACE-AT ?auto_38951 ?auto_38943 ) ( CLEAR ?auto_38951 ) ( IS-CRATE ?auto_38950 ) ( not ( = ?auto_38928 ?auto_38951 ) ) ( not ( = ?auto_38929 ?auto_38951 ) ) ( not ( = ?auto_38948 ?auto_38951 ) ) ( not ( = ?auto_38941 ?auto_38951 ) ) ( not ( = ?auto_38935 ?auto_38951 ) ) ( not ( = ?auto_38936 ?auto_38951 ) ) ( not ( = ?auto_38944 ?auto_38951 ) ) ( not ( = ?auto_38950 ?auto_38951 ) ) ( not ( = ?auto_38931 ?auto_38951 ) ) ( AVAILABLE ?auto_38933 ) ( not ( = ?auto_38930 ?auto_38943 ) ) ( not ( = ?auto_38942 ?auto_38930 ) ) ( not ( = ?auto_38940 ?auto_38930 ) ) ( not ( = ?auto_38945 ?auto_38930 ) ) ( not ( = ?auto_38939 ?auto_38930 ) ) ( HOIST-AT ?auto_38937 ?auto_38930 ) ( not ( = ?auto_38933 ?auto_38937 ) ) ( not ( = ?auto_38949 ?auto_38937 ) ) ( not ( = ?auto_38934 ?auto_38937 ) ) ( not ( = ?auto_38946 ?auto_38937 ) ) ( not ( = ?auto_38938 ?auto_38937 ) ) ( AVAILABLE ?auto_38937 ) ( SURFACE-AT ?auto_38950 ?auto_38930 ) ( ON ?auto_38950 ?auto_38947 ) ( CLEAR ?auto_38950 ) ( not ( = ?auto_38928 ?auto_38947 ) ) ( not ( = ?auto_38929 ?auto_38947 ) ) ( not ( = ?auto_38948 ?auto_38947 ) ) ( not ( = ?auto_38941 ?auto_38947 ) ) ( not ( = ?auto_38935 ?auto_38947 ) ) ( not ( = ?auto_38936 ?auto_38947 ) ) ( not ( = ?auto_38944 ?auto_38947 ) ) ( not ( = ?auto_38950 ?auto_38947 ) ) ( not ( = ?auto_38931 ?auto_38947 ) ) ( not ( = ?auto_38951 ?auto_38947 ) ) ( TRUCK-AT ?auto_38932 ?auto_38943 ) )
    :subtasks
    ( ( !DRIVE ?auto_38932 ?auto_38943 ?auto_38930 )
      ( MAKE-ON ?auto_38928 ?auto_38929 )
      ( MAKE-ON-VERIFY ?auto_38928 ?auto_38929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38952 - SURFACE
      ?auto_38953 - SURFACE
    )
    :vars
    (
      ?auto_38955 - HOIST
      ?auto_38960 - PLACE
      ?auto_38975 - PLACE
      ?auto_38973 - HOIST
      ?auto_38971 - SURFACE
      ?auto_38961 - SURFACE
      ?auto_38959 - PLACE
      ?auto_38966 - HOIST
      ?auto_38972 - SURFACE
      ?auto_38954 - SURFACE
      ?auto_38958 - PLACE
      ?auto_38969 - HOIST
      ?auto_38963 - SURFACE
      ?auto_38974 - SURFACE
      ?auto_38965 - PLACE
      ?auto_38957 - HOIST
      ?auto_38967 - SURFACE
      ?auto_38956 - SURFACE
      ?auto_38962 - PLACE
      ?auto_38968 - HOIST
      ?auto_38970 - SURFACE
      ?auto_38964 - TRUCK
      ?auto_38976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38955 ?auto_38960 ) ( IS-CRATE ?auto_38952 ) ( not ( = ?auto_38952 ?auto_38953 ) ) ( not ( = ?auto_38975 ?auto_38960 ) ) ( HOIST-AT ?auto_38973 ?auto_38975 ) ( not ( = ?auto_38955 ?auto_38973 ) ) ( AVAILABLE ?auto_38973 ) ( SURFACE-AT ?auto_38952 ?auto_38975 ) ( ON ?auto_38952 ?auto_38971 ) ( CLEAR ?auto_38952 ) ( not ( = ?auto_38952 ?auto_38971 ) ) ( not ( = ?auto_38953 ?auto_38971 ) ) ( IS-CRATE ?auto_38953 ) ( not ( = ?auto_38952 ?auto_38961 ) ) ( not ( = ?auto_38953 ?auto_38961 ) ) ( not ( = ?auto_38971 ?auto_38961 ) ) ( not ( = ?auto_38959 ?auto_38960 ) ) ( not ( = ?auto_38975 ?auto_38959 ) ) ( HOIST-AT ?auto_38966 ?auto_38959 ) ( not ( = ?auto_38955 ?auto_38966 ) ) ( not ( = ?auto_38973 ?auto_38966 ) ) ( AVAILABLE ?auto_38966 ) ( SURFACE-AT ?auto_38953 ?auto_38959 ) ( ON ?auto_38953 ?auto_38972 ) ( CLEAR ?auto_38953 ) ( not ( = ?auto_38952 ?auto_38972 ) ) ( not ( = ?auto_38953 ?auto_38972 ) ) ( not ( = ?auto_38971 ?auto_38972 ) ) ( not ( = ?auto_38961 ?auto_38972 ) ) ( IS-CRATE ?auto_38961 ) ( not ( = ?auto_38952 ?auto_38954 ) ) ( not ( = ?auto_38953 ?auto_38954 ) ) ( not ( = ?auto_38971 ?auto_38954 ) ) ( not ( = ?auto_38961 ?auto_38954 ) ) ( not ( = ?auto_38972 ?auto_38954 ) ) ( not ( = ?auto_38958 ?auto_38960 ) ) ( not ( = ?auto_38975 ?auto_38958 ) ) ( not ( = ?auto_38959 ?auto_38958 ) ) ( HOIST-AT ?auto_38969 ?auto_38958 ) ( not ( = ?auto_38955 ?auto_38969 ) ) ( not ( = ?auto_38973 ?auto_38969 ) ) ( not ( = ?auto_38966 ?auto_38969 ) ) ( AVAILABLE ?auto_38969 ) ( SURFACE-AT ?auto_38961 ?auto_38958 ) ( ON ?auto_38961 ?auto_38963 ) ( CLEAR ?auto_38961 ) ( not ( = ?auto_38952 ?auto_38963 ) ) ( not ( = ?auto_38953 ?auto_38963 ) ) ( not ( = ?auto_38971 ?auto_38963 ) ) ( not ( = ?auto_38961 ?auto_38963 ) ) ( not ( = ?auto_38972 ?auto_38963 ) ) ( not ( = ?auto_38954 ?auto_38963 ) ) ( IS-CRATE ?auto_38954 ) ( not ( = ?auto_38952 ?auto_38974 ) ) ( not ( = ?auto_38953 ?auto_38974 ) ) ( not ( = ?auto_38971 ?auto_38974 ) ) ( not ( = ?auto_38961 ?auto_38974 ) ) ( not ( = ?auto_38972 ?auto_38974 ) ) ( not ( = ?auto_38954 ?auto_38974 ) ) ( not ( = ?auto_38963 ?auto_38974 ) ) ( not ( = ?auto_38965 ?auto_38960 ) ) ( not ( = ?auto_38975 ?auto_38965 ) ) ( not ( = ?auto_38959 ?auto_38965 ) ) ( not ( = ?auto_38958 ?auto_38965 ) ) ( HOIST-AT ?auto_38957 ?auto_38965 ) ( not ( = ?auto_38955 ?auto_38957 ) ) ( not ( = ?auto_38973 ?auto_38957 ) ) ( not ( = ?auto_38966 ?auto_38957 ) ) ( not ( = ?auto_38969 ?auto_38957 ) ) ( AVAILABLE ?auto_38957 ) ( SURFACE-AT ?auto_38954 ?auto_38965 ) ( ON ?auto_38954 ?auto_38967 ) ( CLEAR ?auto_38954 ) ( not ( = ?auto_38952 ?auto_38967 ) ) ( not ( = ?auto_38953 ?auto_38967 ) ) ( not ( = ?auto_38971 ?auto_38967 ) ) ( not ( = ?auto_38961 ?auto_38967 ) ) ( not ( = ?auto_38972 ?auto_38967 ) ) ( not ( = ?auto_38954 ?auto_38967 ) ) ( not ( = ?auto_38963 ?auto_38967 ) ) ( not ( = ?auto_38974 ?auto_38967 ) ) ( IS-CRATE ?auto_38974 ) ( not ( = ?auto_38952 ?auto_38956 ) ) ( not ( = ?auto_38953 ?auto_38956 ) ) ( not ( = ?auto_38971 ?auto_38956 ) ) ( not ( = ?auto_38961 ?auto_38956 ) ) ( not ( = ?auto_38972 ?auto_38956 ) ) ( not ( = ?auto_38954 ?auto_38956 ) ) ( not ( = ?auto_38963 ?auto_38956 ) ) ( not ( = ?auto_38974 ?auto_38956 ) ) ( not ( = ?auto_38967 ?auto_38956 ) ) ( not ( = ?auto_38962 ?auto_38960 ) ) ( not ( = ?auto_38975 ?auto_38962 ) ) ( not ( = ?auto_38959 ?auto_38962 ) ) ( not ( = ?auto_38958 ?auto_38962 ) ) ( not ( = ?auto_38965 ?auto_38962 ) ) ( HOIST-AT ?auto_38968 ?auto_38962 ) ( not ( = ?auto_38955 ?auto_38968 ) ) ( not ( = ?auto_38973 ?auto_38968 ) ) ( not ( = ?auto_38966 ?auto_38968 ) ) ( not ( = ?auto_38969 ?auto_38968 ) ) ( not ( = ?auto_38957 ?auto_38968 ) ) ( AVAILABLE ?auto_38968 ) ( SURFACE-AT ?auto_38974 ?auto_38962 ) ( ON ?auto_38974 ?auto_38970 ) ( CLEAR ?auto_38974 ) ( not ( = ?auto_38952 ?auto_38970 ) ) ( not ( = ?auto_38953 ?auto_38970 ) ) ( not ( = ?auto_38971 ?auto_38970 ) ) ( not ( = ?auto_38961 ?auto_38970 ) ) ( not ( = ?auto_38972 ?auto_38970 ) ) ( not ( = ?auto_38954 ?auto_38970 ) ) ( not ( = ?auto_38963 ?auto_38970 ) ) ( not ( = ?auto_38974 ?auto_38970 ) ) ( not ( = ?auto_38967 ?auto_38970 ) ) ( not ( = ?auto_38956 ?auto_38970 ) ) ( TRUCK-AT ?auto_38964 ?auto_38960 ) ( SURFACE-AT ?auto_38976 ?auto_38960 ) ( CLEAR ?auto_38976 ) ( LIFTING ?auto_38955 ?auto_38956 ) ( IS-CRATE ?auto_38956 ) ( not ( = ?auto_38952 ?auto_38976 ) ) ( not ( = ?auto_38953 ?auto_38976 ) ) ( not ( = ?auto_38971 ?auto_38976 ) ) ( not ( = ?auto_38961 ?auto_38976 ) ) ( not ( = ?auto_38972 ?auto_38976 ) ) ( not ( = ?auto_38954 ?auto_38976 ) ) ( not ( = ?auto_38963 ?auto_38976 ) ) ( not ( = ?auto_38974 ?auto_38976 ) ) ( not ( = ?auto_38967 ?auto_38976 ) ) ( not ( = ?auto_38956 ?auto_38976 ) ) ( not ( = ?auto_38970 ?auto_38976 ) ) )
    :subtasks
    ( ( !DROP ?auto_38955 ?auto_38956 ?auto_38976 ?auto_38960 )
      ( MAKE-ON ?auto_38952 ?auto_38953 )
      ( MAKE-ON-VERIFY ?auto_38952 ?auto_38953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_38977 - SURFACE
      ?auto_38978 - SURFACE
    )
    :vars
    (
      ?auto_38992 - HOIST
      ?auto_38982 - PLACE
      ?auto_38983 - PLACE
      ?auto_38995 - HOIST
      ?auto_38993 - SURFACE
      ?auto_39001 - SURFACE
      ?auto_38984 - PLACE
      ?auto_38985 - HOIST
      ?auto_38994 - SURFACE
      ?auto_38990 - SURFACE
      ?auto_38997 - PLACE
      ?auto_38989 - HOIST
      ?auto_39000 - SURFACE
      ?auto_38996 - SURFACE
      ?auto_38991 - PLACE
      ?auto_38986 - HOIST
      ?auto_38998 - SURFACE
      ?auto_38988 - SURFACE
      ?auto_38987 - PLACE
      ?auto_38979 - HOIST
      ?auto_38981 - SURFACE
      ?auto_38999 - TRUCK
      ?auto_38980 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38992 ?auto_38982 ) ( IS-CRATE ?auto_38977 ) ( not ( = ?auto_38977 ?auto_38978 ) ) ( not ( = ?auto_38983 ?auto_38982 ) ) ( HOIST-AT ?auto_38995 ?auto_38983 ) ( not ( = ?auto_38992 ?auto_38995 ) ) ( AVAILABLE ?auto_38995 ) ( SURFACE-AT ?auto_38977 ?auto_38983 ) ( ON ?auto_38977 ?auto_38993 ) ( CLEAR ?auto_38977 ) ( not ( = ?auto_38977 ?auto_38993 ) ) ( not ( = ?auto_38978 ?auto_38993 ) ) ( IS-CRATE ?auto_38978 ) ( not ( = ?auto_38977 ?auto_39001 ) ) ( not ( = ?auto_38978 ?auto_39001 ) ) ( not ( = ?auto_38993 ?auto_39001 ) ) ( not ( = ?auto_38984 ?auto_38982 ) ) ( not ( = ?auto_38983 ?auto_38984 ) ) ( HOIST-AT ?auto_38985 ?auto_38984 ) ( not ( = ?auto_38992 ?auto_38985 ) ) ( not ( = ?auto_38995 ?auto_38985 ) ) ( AVAILABLE ?auto_38985 ) ( SURFACE-AT ?auto_38978 ?auto_38984 ) ( ON ?auto_38978 ?auto_38994 ) ( CLEAR ?auto_38978 ) ( not ( = ?auto_38977 ?auto_38994 ) ) ( not ( = ?auto_38978 ?auto_38994 ) ) ( not ( = ?auto_38993 ?auto_38994 ) ) ( not ( = ?auto_39001 ?auto_38994 ) ) ( IS-CRATE ?auto_39001 ) ( not ( = ?auto_38977 ?auto_38990 ) ) ( not ( = ?auto_38978 ?auto_38990 ) ) ( not ( = ?auto_38993 ?auto_38990 ) ) ( not ( = ?auto_39001 ?auto_38990 ) ) ( not ( = ?auto_38994 ?auto_38990 ) ) ( not ( = ?auto_38997 ?auto_38982 ) ) ( not ( = ?auto_38983 ?auto_38997 ) ) ( not ( = ?auto_38984 ?auto_38997 ) ) ( HOIST-AT ?auto_38989 ?auto_38997 ) ( not ( = ?auto_38992 ?auto_38989 ) ) ( not ( = ?auto_38995 ?auto_38989 ) ) ( not ( = ?auto_38985 ?auto_38989 ) ) ( AVAILABLE ?auto_38989 ) ( SURFACE-AT ?auto_39001 ?auto_38997 ) ( ON ?auto_39001 ?auto_39000 ) ( CLEAR ?auto_39001 ) ( not ( = ?auto_38977 ?auto_39000 ) ) ( not ( = ?auto_38978 ?auto_39000 ) ) ( not ( = ?auto_38993 ?auto_39000 ) ) ( not ( = ?auto_39001 ?auto_39000 ) ) ( not ( = ?auto_38994 ?auto_39000 ) ) ( not ( = ?auto_38990 ?auto_39000 ) ) ( IS-CRATE ?auto_38990 ) ( not ( = ?auto_38977 ?auto_38996 ) ) ( not ( = ?auto_38978 ?auto_38996 ) ) ( not ( = ?auto_38993 ?auto_38996 ) ) ( not ( = ?auto_39001 ?auto_38996 ) ) ( not ( = ?auto_38994 ?auto_38996 ) ) ( not ( = ?auto_38990 ?auto_38996 ) ) ( not ( = ?auto_39000 ?auto_38996 ) ) ( not ( = ?auto_38991 ?auto_38982 ) ) ( not ( = ?auto_38983 ?auto_38991 ) ) ( not ( = ?auto_38984 ?auto_38991 ) ) ( not ( = ?auto_38997 ?auto_38991 ) ) ( HOIST-AT ?auto_38986 ?auto_38991 ) ( not ( = ?auto_38992 ?auto_38986 ) ) ( not ( = ?auto_38995 ?auto_38986 ) ) ( not ( = ?auto_38985 ?auto_38986 ) ) ( not ( = ?auto_38989 ?auto_38986 ) ) ( AVAILABLE ?auto_38986 ) ( SURFACE-AT ?auto_38990 ?auto_38991 ) ( ON ?auto_38990 ?auto_38998 ) ( CLEAR ?auto_38990 ) ( not ( = ?auto_38977 ?auto_38998 ) ) ( not ( = ?auto_38978 ?auto_38998 ) ) ( not ( = ?auto_38993 ?auto_38998 ) ) ( not ( = ?auto_39001 ?auto_38998 ) ) ( not ( = ?auto_38994 ?auto_38998 ) ) ( not ( = ?auto_38990 ?auto_38998 ) ) ( not ( = ?auto_39000 ?auto_38998 ) ) ( not ( = ?auto_38996 ?auto_38998 ) ) ( IS-CRATE ?auto_38996 ) ( not ( = ?auto_38977 ?auto_38988 ) ) ( not ( = ?auto_38978 ?auto_38988 ) ) ( not ( = ?auto_38993 ?auto_38988 ) ) ( not ( = ?auto_39001 ?auto_38988 ) ) ( not ( = ?auto_38994 ?auto_38988 ) ) ( not ( = ?auto_38990 ?auto_38988 ) ) ( not ( = ?auto_39000 ?auto_38988 ) ) ( not ( = ?auto_38996 ?auto_38988 ) ) ( not ( = ?auto_38998 ?auto_38988 ) ) ( not ( = ?auto_38987 ?auto_38982 ) ) ( not ( = ?auto_38983 ?auto_38987 ) ) ( not ( = ?auto_38984 ?auto_38987 ) ) ( not ( = ?auto_38997 ?auto_38987 ) ) ( not ( = ?auto_38991 ?auto_38987 ) ) ( HOIST-AT ?auto_38979 ?auto_38987 ) ( not ( = ?auto_38992 ?auto_38979 ) ) ( not ( = ?auto_38995 ?auto_38979 ) ) ( not ( = ?auto_38985 ?auto_38979 ) ) ( not ( = ?auto_38989 ?auto_38979 ) ) ( not ( = ?auto_38986 ?auto_38979 ) ) ( AVAILABLE ?auto_38979 ) ( SURFACE-AT ?auto_38996 ?auto_38987 ) ( ON ?auto_38996 ?auto_38981 ) ( CLEAR ?auto_38996 ) ( not ( = ?auto_38977 ?auto_38981 ) ) ( not ( = ?auto_38978 ?auto_38981 ) ) ( not ( = ?auto_38993 ?auto_38981 ) ) ( not ( = ?auto_39001 ?auto_38981 ) ) ( not ( = ?auto_38994 ?auto_38981 ) ) ( not ( = ?auto_38990 ?auto_38981 ) ) ( not ( = ?auto_39000 ?auto_38981 ) ) ( not ( = ?auto_38996 ?auto_38981 ) ) ( not ( = ?auto_38998 ?auto_38981 ) ) ( not ( = ?auto_38988 ?auto_38981 ) ) ( TRUCK-AT ?auto_38999 ?auto_38982 ) ( SURFACE-AT ?auto_38980 ?auto_38982 ) ( CLEAR ?auto_38980 ) ( IS-CRATE ?auto_38988 ) ( not ( = ?auto_38977 ?auto_38980 ) ) ( not ( = ?auto_38978 ?auto_38980 ) ) ( not ( = ?auto_38993 ?auto_38980 ) ) ( not ( = ?auto_39001 ?auto_38980 ) ) ( not ( = ?auto_38994 ?auto_38980 ) ) ( not ( = ?auto_38990 ?auto_38980 ) ) ( not ( = ?auto_39000 ?auto_38980 ) ) ( not ( = ?auto_38996 ?auto_38980 ) ) ( not ( = ?auto_38998 ?auto_38980 ) ) ( not ( = ?auto_38988 ?auto_38980 ) ) ( not ( = ?auto_38981 ?auto_38980 ) ) ( AVAILABLE ?auto_38992 ) ( IN ?auto_38988 ?auto_38999 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38992 ?auto_38988 ?auto_38999 ?auto_38982 )
      ( MAKE-ON ?auto_38977 ?auto_38978 )
      ( MAKE-ON-VERIFY ?auto_38977 ?auto_38978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39002 - SURFACE
      ?auto_39003 - SURFACE
    )
    :vars
    (
      ?auto_39021 - HOIST
      ?auto_39015 - PLACE
      ?auto_39006 - PLACE
      ?auto_39023 - HOIST
      ?auto_39016 - SURFACE
      ?auto_39013 - SURFACE
      ?auto_39008 - PLACE
      ?auto_39022 - HOIST
      ?auto_39014 - SURFACE
      ?auto_39020 - SURFACE
      ?auto_39025 - PLACE
      ?auto_39007 - HOIST
      ?auto_39012 - SURFACE
      ?auto_39026 - SURFACE
      ?auto_39017 - PLACE
      ?auto_39019 - HOIST
      ?auto_39010 - SURFACE
      ?auto_39024 - SURFACE
      ?auto_39018 - PLACE
      ?auto_39004 - HOIST
      ?auto_39009 - SURFACE
      ?auto_39005 - SURFACE
      ?auto_39011 - TRUCK
      ?auto_39027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39021 ?auto_39015 ) ( IS-CRATE ?auto_39002 ) ( not ( = ?auto_39002 ?auto_39003 ) ) ( not ( = ?auto_39006 ?auto_39015 ) ) ( HOIST-AT ?auto_39023 ?auto_39006 ) ( not ( = ?auto_39021 ?auto_39023 ) ) ( AVAILABLE ?auto_39023 ) ( SURFACE-AT ?auto_39002 ?auto_39006 ) ( ON ?auto_39002 ?auto_39016 ) ( CLEAR ?auto_39002 ) ( not ( = ?auto_39002 ?auto_39016 ) ) ( not ( = ?auto_39003 ?auto_39016 ) ) ( IS-CRATE ?auto_39003 ) ( not ( = ?auto_39002 ?auto_39013 ) ) ( not ( = ?auto_39003 ?auto_39013 ) ) ( not ( = ?auto_39016 ?auto_39013 ) ) ( not ( = ?auto_39008 ?auto_39015 ) ) ( not ( = ?auto_39006 ?auto_39008 ) ) ( HOIST-AT ?auto_39022 ?auto_39008 ) ( not ( = ?auto_39021 ?auto_39022 ) ) ( not ( = ?auto_39023 ?auto_39022 ) ) ( AVAILABLE ?auto_39022 ) ( SURFACE-AT ?auto_39003 ?auto_39008 ) ( ON ?auto_39003 ?auto_39014 ) ( CLEAR ?auto_39003 ) ( not ( = ?auto_39002 ?auto_39014 ) ) ( not ( = ?auto_39003 ?auto_39014 ) ) ( not ( = ?auto_39016 ?auto_39014 ) ) ( not ( = ?auto_39013 ?auto_39014 ) ) ( IS-CRATE ?auto_39013 ) ( not ( = ?auto_39002 ?auto_39020 ) ) ( not ( = ?auto_39003 ?auto_39020 ) ) ( not ( = ?auto_39016 ?auto_39020 ) ) ( not ( = ?auto_39013 ?auto_39020 ) ) ( not ( = ?auto_39014 ?auto_39020 ) ) ( not ( = ?auto_39025 ?auto_39015 ) ) ( not ( = ?auto_39006 ?auto_39025 ) ) ( not ( = ?auto_39008 ?auto_39025 ) ) ( HOIST-AT ?auto_39007 ?auto_39025 ) ( not ( = ?auto_39021 ?auto_39007 ) ) ( not ( = ?auto_39023 ?auto_39007 ) ) ( not ( = ?auto_39022 ?auto_39007 ) ) ( AVAILABLE ?auto_39007 ) ( SURFACE-AT ?auto_39013 ?auto_39025 ) ( ON ?auto_39013 ?auto_39012 ) ( CLEAR ?auto_39013 ) ( not ( = ?auto_39002 ?auto_39012 ) ) ( not ( = ?auto_39003 ?auto_39012 ) ) ( not ( = ?auto_39016 ?auto_39012 ) ) ( not ( = ?auto_39013 ?auto_39012 ) ) ( not ( = ?auto_39014 ?auto_39012 ) ) ( not ( = ?auto_39020 ?auto_39012 ) ) ( IS-CRATE ?auto_39020 ) ( not ( = ?auto_39002 ?auto_39026 ) ) ( not ( = ?auto_39003 ?auto_39026 ) ) ( not ( = ?auto_39016 ?auto_39026 ) ) ( not ( = ?auto_39013 ?auto_39026 ) ) ( not ( = ?auto_39014 ?auto_39026 ) ) ( not ( = ?auto_39020 ?auto_39026 ) ) ( not ( = ?auto_39012 ?auto_39026 ) ) ( not ( = ?auto_39017 ?auto_39015 ) ) ( not ( = ?auto_39006 ?auto_39017 ) ) ( not ( = ?auto_39008 ?auto_39017 ) ) ( not ( = ?auto_39025 ?auto_39017 ) ) ( HOIST-AT ?auto_39019 ?auto_39017 ) ( not ( = ?auto_39021 ?auto_39019 ) ) ( not ( = ?auto_39023 ?auto_39019 ) ) ( not ( = ?auto_39022 ?auto_39019 ) ) ( not ( = ?auto_39007 ?auto_39019 ) ) ( AVAILABLE ?auto_39019 ) ( SURFACE-AT ?auto_39020 ?auto_39017 ) ( ON ?auto_39020 ?auto_39010 ) ( CLEAR ?auto_39020 ) ( not ( = ?auto_39002 ?auto_39010 ) ) ( not ( = ?auto_39003 ?auto_39010 ) ) ( not ( = ?auto_39016 ?auto_39010 ) ) ( not ( = ?auto_39013 ?auto_39010 ) ) ( not ( = ?auto_39014 ?auto_39010 ) ) ( not ( = ?auto_39020 ?auto_39010 ) ) ( not ( = ?auto_39012 ?auto_39010 ) ) ( not ( = ?auto_39026 ?auto_39010 ) ) ( IS-CRATE ?auto_39026 ) ( not ( = ?auto_39002 ?auto_39024 ) ) ( not ( = ?auto_39003 ?auto_39024 ) ) ( not ( = ?auto_39016 ?auto_39024 ) ) ( not ( = ?auto_39013 ?auto_39024 ) ) ( not ( = ?auto_39014 ?auto_39024 ) ) ( not ( = ?auto_39020 ?auto_39024 ) ) ( not ( = ?auto_39012 ?auto_39024 ) ) ( not ( = ?auto_39026 ?auto_39024 ) ) ( not ( = ?auto_39010 ?auto_39024 ) ) ( not ( = ?auto_39018 ?auto_39015 ) ) ( not ( = ?auto_39006 ?auto_39018 ) ) ( not ( = ?auto_39008 ?auto_39018 ) ) ( not ( = ?auto_39025 ?auto_39018 ) ) ( not ( = ?auto_39017 ?auto_39018 ) ) ( HOIST-AT ?auto_39004 ?auto_39018 ) ( not ( = ?auto_39021 ?auto_39004 ) ) ( not ( = ?auto_39023 ?auto_39004 ) ) ( not ( = ?auto_39022 ?auto_39004 ) ) ( not ( = ?auto_39007 ?auto_39004 ) ) ( not ( = ?auto_39019 ?auto_39004 ) ) ( AVAILABLE ?auto_39004 ) ( SURFACE-AT ?auto_39026 ?auto_39018 ) ( ON ?auto_39026 ?auto_39009 ) ( CLEAR ?auto_39026 ) ( not ( = ?auto_39002 ?auto_39009 ) ) ( not ( = ?auto_39003 ?auto_39009 ) ) ( not ( = ?auto_39016 ?auto_39009 ) ) ( not ( = ?auto_39013 ?auto_39009 ) ) ( not ( = ?auto_39014 ?auto_39009 ) ) ( not ( = ?auto_39020 ?auto_39009 ) ) ( not ( = ?auto_39012 ?auto_39009 ) ) ( not ( = ?auto_39026 ?auto_39009 ) ) ( not ( = ?auto_39010 ?auto_39009 ) ) ( not ( = ?auto_39024 ?auto_39009 ) ) ( SURFACE-AT ?auto_39005 ?auto_39015 ) ( CLEAR ?auto_39005 ) ( IS-CRATE ?auto_39024 ) ( not ( = ?auto_39002 ?auto_39005 ) ) ( not ( = ?auto_39003 ?auto_39005 ) ) ( not ( = ?auto_39016 ?auto_39005 ) ) ( not ( = ?auto_39013 ?auto_39005 ) ) ( not ( = ?auto_39014 ?auto_39005 ) ) ( not ( = ?auto_39020 ?auto_39005 ) ) ( not ( = ?auto_39012 ?auto_39005 ) ) ( not ( = ?auto_39026 ?auto_39005 ) ) ( not ( = ?auto_39010 ?auto_39005 ) ) ( not ( = ?auto_39024 ?auto_39005 ) ) ( not ( = ?auto_39009 ?auto_39005 ) ) ( AVAILABLE ?auto_39021 ) ( IN ?auto_39024 ?auto_39011 ) ( TRUCK-AT ?auto_39011 ?auto_39027 ) ( not ( = ?auto_39027 ?auto_39015 ) ) ( not ( = ?auto_39006 ?auto_39027 ) ) ( not ( = ?auto_39008 ?auto_39027 ) ) ( not ( = ?auto_39025 ?auto_39027 ) ) ( not ( = ?auto_39017 ?auto_39027 ) ) ( not ( = ?auto_39018 ?auto_39027 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39011 ?auto_39027 ?auto_39015 )
      ( MAKE-ON ?auto_39002 ?auto_39003 )
      ( MAKE-ON-VERIFY ?auto_39002 ?auto_39003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39028 - SURFACE
      ?auto_39029 - SURFACE
    )
    :vars
    (
      ?auto_39048 - HOIST
      ?auto_39039 - PLACE
      ?auto_39047 - PLACE
      ?auto_39050 - HOIST
      ?auto_39040 - SURFACE
      ?auto_39038 - SURFACE
      ?auto_39036 - PLACE
      ?auto_39049 - HOIST
      ?auto_39037 - SURFACE
      ?auto_39035 - SURFACE
      ?auto_39046 - PLACE
      ?auto_39033 - HOIST
      ?auto_39053 - SURFACE
      ?auto_39041 - SURFACE
      ?auto_39044 - PLACE
      ?auto_39042 - HOIST
      ?auto_39043 - SURFACE
      ?auto_39045 - SURFACE
      ?auto_39031 - PLACE
      ?auto_39051 - HOIST
      ?auto_39032 - SURFACE
      ?auto_39030 - SURFACE
      ?auto_39034 - TRUCK
      ?auto_39052 - PLACE
      ?auto_39054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39048 ?auto_39039 ) ( IS-CRATE ?auto_39028 ) ( not ( = ?auto_39028 ?auto_39029 ) ) ( not ( = ?auto_39047 ?auto_39039 ) ) ( HOIST-AT ?auto_39050 ?auto_39047 ) ( not ( = ?auto_39048 ?auto_39050 ) ) ( AVAILABLE ?auto_39050 ) ( SURFACE-AT ?auto_39028 ?auto_39047 ) ( ON ?auto_39028 ?auto_39040 ) ( CLEAR ?auto_39028 ) ( not ( = ?auto_39028 ?auto_39040 ) ) ( not ( = ?auto_39029 ?auto_39040 ) ) ( IS-CRATE ?auto_39029 ) ( not ( = ?auto_39028 ?auto_39038 ) ) ( not ( = ?auto_39029 ?auto_39038 ) ) ( not ( = ?auto_39040 ?auto_39038 ) ) ( not ( = ?auto_39036 ?auto_39039 ) ) ( not ( = ?auto_39047 ?auto_39036 ) ) ( HOIST-AT ?auto_39049 ?auto_39036 ) ( not ( = ?auto_39048 ?auto_39049 ) ) ( not ( = ?auto_39050 ?auto_39049 ) ) ( AVAILABLE ?auto_39049 ) ( SURFACE-AT ?auto_39029 ?auto_39036 ) ( ON ?auto_39029 ?auto_39037 ) ( CLEAR ?auto_39029 ) ( not ( = ?auto_39028 ?auto_39037 ) ) ( not ( = ?auto_39029 ?auto_39037 ) ) ( not ( = ?auto_39040 ?auto_39037 ) ) ( not ( = ?auto_39038 ?auto_39037 ) ) ( IS-CRATE ?auto_39038 ) ( not ( = ?auto_39028 ?auto_39035 ) ) ( not ( = ?auto_39029 ?auto_39035 ) ) ( not ( = ?auto_39040 ?auto_39035 ) ) ( not ( = ?auto_39038 ?auto_39035 ) ) ( not ( = ?auto_39037 ?auto_39035 ) ) ( not ( = ?auto_39046 ?auto_39039 ) ) ( not ( = ?auto_39047 ?auto_39046 ) ) ( not ( = ?auto_39036 ?auto_39046 ) ) ( HOIST-AT ?auto_39033 ?auto_39046 ) ( not ( = ?auto_39048 ?auto_39033 ) ) ( not ( = ?auto_39050 ?auto_39033 ) ) ( not ( = ?auto_39049 ?auto_39033 ) ) ( AVAILABLE ?auto_39033 ) ( SURFACE-AT ?auto_39038 ?auto_39046 ) ( ON ?auto_39038 ?auto_39053 ) ( CLEAR ?auto_39038 ) ( not ( = ?auto_39028 ?auto_39053 ) ) ( not ( = ?auto_39029 ?auto_39053 ) ) ( not ( = ?auto_39040 ?auto_39053 ) ) ( not ( = ?auto_39038 ?auto_39053 ) ) ( not ( = ?auto_39037 ?auto_39053 ) ) ( not ( = ?auto_39035 ?auto_39053 ) ) ( IS-CRATE ?auto_39035 ) ( not ( = ?auto_39028 ?auto_39041 ) ) ( not ( = ?auto_39029 ?auto_39041 ) ) ( not ( = ?auto_39040 ?auto_39041 ) ) ( not ( = ?auto_39038 ?auto_39041 ) ) ( not ( = ?auto_39037 ?auto_39041 ) ) ( not ( = ?auto_39035 ?auto_39041 ) ) ( not ( = ?auto_39053 ?auto_39041 ) ) ( not ( = ?auto_39044 ?auto_39039 ) ) ( not ( = ?auto_39047 ?auto_39044 ) ) ( not ( = ?auto_39036 ?auto_39044 ) ) ( not ( = ?auto_39046 ?auto_39044 ) ) ( HOIST-AT ?auto_39042 ?auto_39044 ) ( not ( = ?auto_39048 ?auto_39042 ) ) ( not ( = ?auto_39050 ?auto_39042 ) ) ( not ( = ?auto_39049 ?auto_39042 ) ) ( not ( = ?auto_39033 ?auto_39042 ) ) ( AVAILABLE ?auto_39042 ) ( SURFACE-AT ?auto_39035 ?auto_39044 ) ( ON ?auto_39035 ?auto_39043 ) ( CLEAR ?auto_39035 ) ( not ( = ?auto_39028 ?auto_39043 ) ) ( not ( = ?auto_39029 ?auto_39043 ) ) ( not ( = ?auto_39040 ?auto_39043 ) ) ( not ( = ?auto_39038 ?auto_39043 ) ) ( not ( = ?auto_39037 ?auto_39043 ) ) ( not ( = ?auto_39035 ?auto_39043 ) ) ( not ( = ?auto_39053 ?auto_39043 ) ) ( not ( = ?auto_39041 ?auto_39043 ) ) ( IS-CRATE ?auto_39041 ) ( not ( = ?auto_39028 ?auto_39045 ) ) ( not ( = ?auto_39029 ?auto_39045 ) ) ( not ( = ?auto_39040 ?auto_39045 ) ) ( not ( = ?auto_39038 ?auto_39045 ) ) ( not ( = ?auto_39037 ?auto_39045 ) ) ( not ( = ?auto_39035 ?auto_39045 ) ) ( not ( = ?auto_39053 ?auto_39045 ) ) ( not ( = ?auto_39041 ?auto_39045 ) ) ( not ( = ?auto_39043 ?auto_39045 ) ) ( not ( = ?auto_39031 ?auto_39039 ) ) ( not ( = ?auto_39047 ?auto_39031 ) ) ( not ( = ?auto_39036 ?auto_39031 ) ) ( not ( = ?auto_39046 ?auto_39031 ) ) ( not ( = ?auto_39044 ?auto_39031 ) ) ( HOIST-AT ?auto_39051 ?auto_39031 ) ( not ( = ?auto_39048 ?auto_39051 ) ) ( not ( = ?auto_39050 ?auto_39051 ) ) ( not ( = ?auto_39049 ?auto_39051 ) ) ( not ( = ?auto_39033 ?auto_39051 ) ) ( not ( = ?auto_39042 ?auto_39051 ) ) ( AVAILABLE ?auto_39051 ) ( SURFACE-AT ?auto_39041 ?auto_39031 ) ( ON ?auto_39041 ?auto_39032 ) ( CLEAR ?auto_39041 ) ( not ( = ?auto_39028 ?auto_39032 ) ) ( not ( = ?auto_39029 ?auto_39032 ) ) ( not ( = ?auto_39040 ?auto_39032 ) ) ( not ( = ?auto_39038 ?auto_39032 ) ) ( not ( = ?auto_39037 ?auto_39032 ) ) ( not ( = ?auto_39035 ?auto_39032 ) ) ( not ( = ?auto_39053 ?auto_39032 ) ) ( not ( = ?auto_39041 ?auto_39032 ) ) ( not ( = ?auto_39043 ?auto_39032 ) ) ( not ( = ?auto_39045 ?auto_39032 ) ) ( SURFACE-AT ?auto_39030 ?auto_39039 ) ( CLEAR ?auto_39030 ) ( IS-CRATE ?auto_39045 ) ( not ( = ?auto_39028 ?auto_39030 ) ) ( not ( = ?auto_39029 ?auto_39030 ) ) ( not ( = ?auto_39040 ?auto_39030 ) ) ( not ( = ?auto_39038 ?auto_39030 ) ) ( not ( = ?auto_39037 ?auto_39030 ) ) ( not ( = ?auto_39035 ?auto_39030 ) ) ( not ( = ?auto_39053 ?auto_39030 ) ) ( not ( = ?auto_39041 ?auto_39030 ) ) ( not ( = ?auto_39043 ?auto_39030 ) ) ( not ( = ?auto_39045 ?auto_39030 ) ) ( not ( = ?auto_39032 ?auto_39030 ) ) ( AVAILABLE ?auto_39048 ) ( TRUCK-AT ?auto_39034 ?auto_39052 ) ( not ( = ?auto_39052 ?auto_39039 ) ) ( not ( = ?auto_39047 ?auto_39052 ) ) ( not ( = ?auto_39036 ?auto_39052 ) ) ( not ( = ?auto_39046 ?auto_39052 ) ) ( not ( = ?auto_39044 ?auto_39052 ) ) ( not ( = ?auto_39031 ?auto_39052 ) ) ( HOIST-AT ?auto_39054 ?auto_39052 ) ( LIFTING ?auto_39054 ?auto_39045 ) ( not ( = ?auto_39048 ?auto_39054 ) ) ( not ( = ?auto_39050 ?auto_39054 ) ) ( not ( = ?auto_39049 ?auto_39054 ) ) ( not ( = ?auto_39033 ?auto_39054 ) ) ( not ( = ?auto_39042 ?auto_39054 ) ) ( not ( = ?auto_39051 ?auto_39054 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39054 ?auto_39045 ?auto_39034 ?auto_39052 )
      ( MAKE-ON ?auto_39028 ?auto_39029 )
      ( MAKE-ON-VERIFY ?auto_39028 ?auto_39029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39055 - SURFACE
      ?auto_39056 - SURFACE
    )
    :vars
    (
      ?auto_39061 - HOIST
      ?auto_39060 - PLACE
      ?auto_39063 - PLACE
      ?auto_39065 - HOIST
      ?auto_39076 - SURFACE
      ?auto_39069 - SURFACE
      ?auto_39058 - PLACE
      ?auto_39064 - HOIST
      ?auto_39071 - SURFACE
      ?auto_39070 - SURFACE
      ?auto_39062 - PLACE
      ?auto_39073 - HOIST
      ?auto_39059 - SURFACE
      ?auto_39077 - SURFACE
      ?auto_39080 - PLACE
      ?auto_39078 - HOIST
      ?auto_39057 - SURFACE
      ?auto_39068 - SURFACE
      ?auto_39074 - PLACE
      ?auto_39066 - HOIST
      ?auto_39072 - SURFACE
      ?auto_39079 - SURFACE
      ?auto_39075 - TRUCK
      ?auto_39067 - PLACE
      ?auto_39081 - HOIST
      ?auto_39082 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39061 ?auto_39060 ) ( IS-CRATE ?auto_39055 ) ( not ( = ?auto_39055 ?auto_39056 ) ) ( not ( = ?auto_39063 ?auto_39060 ) ) ( HOIST-AT ?auto_39065 ?auto_39063 ) ( not ( = ?auto_39061 ?auto_39065 ) ) ( AVAILABLE ?auto_39065 ) ( SURFACE-AT ?auto_39055 ?auto_39063 ) ( ON ?auto_39055 ?auto_39076 ) ( CLEAR ?auto_39055 ) ( not ( = ?auto_39055 ?auto_39076 ) ) ( not ( = ?auto_39056 ?auto_39076 ) ) ( IS-CRATE ?auto_39056 ) ( not ( = ?auto_39055 ?auto_39069 ) ) ( not ( = ?auto_39056 ?auto_39069 ) ) ( not ( = ?auto_39076 ?auto_39069 ) ) ( not ( = ?auto_39058 ?auto_39060 ) ) ( not ( = ?auto_39063 ?auto_39058 ) ) ( HOIST-AT ?auto_39064 ?auto_39058 ) ( not ( = ?auto_39061 ?auto_39064 ) ) ( not ( = ?auto_39065 ?auto_39064 ) ) ( AVAILABLE ?auto_39064 ) ( SURFACE-AT ?auto_39056 ?auto_39058 ) ( ON ?auto_39056 ?auto_39071 ) ( CLEAR ?auto_39056 ) ( not ( = ?auto_39055 ?auto_39071 ) ) ( not ( = ?auto_39056 ?auto_39071 ) ) ( not ( = ?auto_39076 ?auto_39071 ) ) ( not ( = ?auto_39069 ?auto_39071 ) ) ( IS-CRATE ?auto_39069 ) ( not ( = ?auto_39055 ?auto_39070 ) ) ( not ( = ?auto_39056 ?auto_39070 ) ) ( not ( = ?auto_39076 ?auto_39070 ) ) ( not ( = ?auto_39069 ?auto_39070 ) ) ( not ( = ?auto_39071 ?auto_39070 ) ) ( not ( = ?auto_39062 ?auto_39060 ) ) ( not ( = ?auto_39063 ?auto_39062 ) ) ( not ( = ?auto_39058 ?auto_39062 ) ) ( HOIST-AT ?auto_39073 ?auto_39062 ) ( not ( = ?auto_39061 ?auto_39073 ) ) ( not ( = ?auto_39065 ?auto_39073 ) ) ( not ( = ?auto_39064 ?auto_39073 ) ) ( AVAILABLE ?auto_39073 ) ( SURFACE-AT ?auto_39069 ?auto_39062 ) ( ON ?auto_39069 ?auto_39059 ) ( CLEAR ?auto_39069 ) ( not ( = ?auto_39055 ?auto_39059 ) ) ( not ( = ?auto_39056 ?auto_39059 ) ) ( not ( = ?auto_39076 ?auto_39059 ) ) ( not ( = ?auto_39069 ?auto_39059 ) ) ( not ( = ?auto_39071 ?auto_39059 ) ) ( not ( = ?auto_39070 ?auto_39059 ) ) ( IS-CRATE ?auto_39070 ) ( not ( = ?auto_39055 ?auto_39077 ) ) ( not ( = ?auto_39056 ?auto_39077 ) ) ( not ( = ?auto_39076 ?auto_39077 ) ) ( not ( = ?auto_39069 ?auto_39077 ) ) ( not ( = ?auto_39071 ?auto_39077 ) ) ( not ( = ?auto_39070 ?auto_39077 ) ) ( not ( = ?auto_39059 ?auto_39077 ) ) ( not ( = ?auto_39080 ?auto_39060 ) ) ( not ( = ?auto_39063 ?auto_39080 ) ) ( not ( = ?auto_39058 ?auto_39080 ) ) ( not ( = ?auto_39062 ?auto_39080 ) ) ( HOIST-AT ?auto_39078 ?auto_39080 ) ( not ( = ?auto_39061 ?auto_39078 ) ) ( not ( = ?auto_39065 ?auto_39078 ) ) ( not ( = ?auto_39064 ?auto_39078 ) ) ( not ( = ?auto_39073 ?auto_39078 ) ) ( AVAILABLE ?auto_39078 ) ( SURFACE-AT ?auto_39070 ?auto_39080 ) ( ON ?auto_39070 ?auto_39057 ) ( CLEAR ?auto_39070 ) ( not ( = ?auto_39055 ?auto_39057 ) ) ( not ( = ?auto_39056 ?auto_39057 ) ) ( not ( = ?auto_39076 ?auto_39057 ) ) ( not ( = ?auto_39069 ?auto_39057 ) ) ( not ( = ?auto_39071 ?auto_39057 ) ) ( not ( = ?auto_39070 ?auto_39057 ) ) ( not ( = ?auto_39059 ?auto_39057 ) ) ( not ( = ?auto_39077 ?auto_39057 ) ) ( IS-CRATE ?auto_39077 ) ( not ( = ?auto_39055 ?auto_39068 ) ) ( not ( = ?auto_39056 ?auto_39068 ) ) ( not ( = ?auto_39076 ?auto_39068 ) ) ( not ( = ?auto_39069 ?auto_39068 ) ) ( not ( = ?auto_39071 ?auto_39068 ) ) ( not ( = ?auto_39070 ?auto_39068 ) ) ( not ( = ?auto_39059 ?auto_39068 ) ) ( not ( = ?auto_39077 ?auto_39068 ) ) ( not ( = ?auto_39057 ?auto_39068 ) ) ( not ( = ?auto_39074 ?auto_39060 ) ) ( not ( = ?auto_39063 ?auto_39074 ) ) ( not ( = ?auto_39058 ?auto_39074 ) ) ( not ( = ?auto_39062 ?auto_39074 ) ) ( not ( = ?auto_39080 ?auto_39074 ) ) ( HOIST-AT ?auto_39066 ?auto_39074 ) ( not ( = ?auto_39061 ?auto_39066 ) ) ( not ( = ?auto_39065 ?auto_39066 ) ) ( not ( = ?auto_39064 ?auto_39066 ) ) ( not ( = ?auto_39073 ?auto_39066 ) ) ( not ( = ?auto_39078 ?auto_39066 ) ) ( AVAILABLE ?auto_39066 ) ( SURFACE-AT ?auto_39077 ?auto_39074 ) ( ON ?auto_39077 ?auto_39072 ) ( CLEAR ?auto_39077 ) ( not ( = ?auto_39055 ?auto_39072 ) ) ( not ( = ?auto_39056 ?auto_39072 ) ) ( not ( = ?auto_39076 ?auto_39072 ) ) ( not ( = ?auto_39069 ?auto_39072 ) ) ( not ( = ?auto_39071 ?auto_39072 ) ) ( not ( = ?auto_39070 ?auto_39072 ) ) ( not ( = ?auto_39059 ?auto_39072 ) ) ( not ( = ?auto_39077 ?auto_39072 ) ) ( not ( = ?auto_39057 ?auto_39072 ) ) ( not ( = ?auto_39068 ?auto_39072 ) ) ( SURFACE-AT ?auto_39079 ?auto_39060 ) ( CLEAR ?auto_39079 ) ( IS-CRATE ?auto_39068 ) ( not ( = ?auto_39055 ?auto_39079 ) ) ( not ( = ?auto_39056 ?auto_39079 ) ) ( not ( = ?auto_39076 ?auto_39079 ) ) ( not ( = ?auto_39069 ?auto_39079 ) ) ( not ( = ?auto_39071 ?auto_39079 ) ) ( not ( = ?auto_39070 ?auto_39079 ) ) ( not ( = ?auto_39059 ?auto_39079 ) ) ( not ( = ?auto_39077 ?auto_39079 ) ) ( not ( = ?auto_39057 ?auto_39079 ) ) ( not ( = ?auto_39068 ?auto_39079 ) ) ( not ( = ?auto_39072 ?auto_39079 ) ) ( AVAILABLE ?auto_39061 ) ( TRUCK-AT ?auto_39075 ?auto_39067 ) ( not ( = ?auto_39067 ?auto_39060 ) ) ( not ( = ?auto_39063 ?auto_39067 ) ) ( not ( = ?auto_39058 ?auto_39067 ) ) ( not ( = ?auto_39062 ?auto_39067 ) ) ( not ( = ?auto_39080 ?auto_39067 ) ) ( not ( = ?auto_39074 ?auto_39067 ) ) ( HOIST-AT ?auto_39081 ?auto_39067 ) ( not ( = ?auto_39061 ?auto_39081 ) ) ( not ( = ?auto_39065 ?auto_39081 ) ) ( not ( = ?auto_39064 ?auto_39081 ) ) ( not ( = ?auto_39073 ?auto_39081 ) ) ( not ( = ?auto_39078 ?auto_39081 ) ) ( not ( = ?auto_39066 ?auto_39081 ) ) ( AVAILABLE ?auto_39081 ) ( SURFACE-AT ?auto_39068 ?auto_39067 ) ( ON ?auto_39068 ?auto_39082 ) ( CLEAR ?auto_39068 ) ( not ( = ?auto_39055 ?auto_39082 ) ) ( not ( = ?auto_39056 ?auto_39082 ) ) ( not ( = ?auto_39076 ?auto_39082 ) ) ( not ( = ?auto_39069 ?auto_39082 ) ) ( not ( = ?auto_39071 ?auto_39082 ) ) ( not ( = ?auto_39070 ?auto_39082 ) ) ( not ( = ?auto_39059 ?auto_39082 ) ) ( not ( = ?auto_39077 ?auto_39082 ) ) ( not ( = ?auto_39057 ?auto_39082 ) ) ( not ( = ?auto_39068 ?auto_39082 ) ) ( not ( = ?auto_39072 ?auto_39082 ) ) ( not ( = ?auto_39079 ?auto_39082 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39081 ?auto_39068 ?auto_39082 ?auto_39067 )
      ( MAKE-ON ?auto_39055 ?auto_39056 )
      ( MAKE-ON-VERIFY ?auto_39055 ?auto_39056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39083 - SURFACE
      ?auto_39084 - SURFACE
    )
    :vars
    (
      ?auto_39109 - HOIST
      ?auto_39110 - PLACE
      ?auto_39100 - PLACE
      ?auto_39088 - HOIST
      ?auto_39098 - SURFACE
      ?auto_39104 - SURFACE
      ?auto_39089 - PLACE
      ?auto_39085 - HOIST
      ?auto_39099 - SURFACE
      ?auto_39105 - SURFACE
      ?auto_39087 - PLACE
      ?auto_39091 - HOIST
      ?auto_39108 - SURFACE
      ?auto_39095 - SURFACE
      ?auto_39092 - PLACE
      ?auto_39096 - HOIST
      ?auto_39106 - SURFACE
      ?auto_39094 - SURFACE
      ?auto_39090 - PLACE
      ?auto_39107 - HOIST
      ?auto_39103 - SURFACE
      ?auto_39102 - SURFACE
      ?auto_39093 - PLACE
      ?auto_39086 - HOIST
      ?auto_39101 - SURFACE
      ?auto_39097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39109 ?auto_39110 ) ( IS-CRATE ?auto_39083 ) ( not ( = ?auto_39083 ?auto_39084 ) ) ( not ( = ?auto_39100 ?auto_39110 ) ) ( HOIST-AT ?auto_39088 ?auto_39100 ) ( not ( = ?auto_39109 ?auto_39088 ) ) ( AVAILABLE ?auto_39088 ) ( SURFACE-AT ?auto_39083 ?auto_39100 ) ( ON ?auto_39083 ?auto_39098 ) ( CLEAR ?auto_39083 ) ( not ( = ?auto_39083 ?auto_39098 ) ) ( not ( = ?auto_39084 ?auto_39098 ) ) ( IS-CRATE ?auto_39084 ) ( not ( = ?auto_39083 ?auto_39104 ) ) ( not ( = ?auto_39084 ?auto_39104 ) ) ( not ( = ?auto_39098 ?auto_39104 ) ) ( not ( = ?auto_39089 ?auto_39110 ) ) ( not ( = ?auto_39100 ?auto_39089 ) ) ( HOIST-AT ?auto_39085 ?auto_39089 ) ( not ( = ?auto_39109 ?auto_39085 ) ) ( not ( = ?auto_39088 ?auto_39085 ) ) ( AVAILABLE ?auto_39085 ) ( SURFACE-AT ?auto_39084 ?auto_39089 ) ( ON ?auto_39084 ?auto_39099 ) ( CLEAR ?auto_39084 ) ( not ( = ?auto_39083 ?auto_39099 ) ) ( not ( = ?auto_39084 ?auto_39099 ) ) ( not ( = ?auto_39098 ?auto_39099 ) ) ( not ( = ?auto_39104 ?auto_39099 ) ) ( IS-CRATE ?auto_39104 ) ( not ( = ?auto_39083 ?auto_39105 ) ) ( not ( = ?auto_39084 ?auto_39105 ) ) ( not ( = ?auto_39098 ?auto_39105 ) ) ( not ( = ?auto_39104 ?auto_39105 ) ) ( not ( = ?auto_39099 ?auto_39105 ) ) ( not ( = ?auto_39087 ?auto_39110 ) ) ( not ( = ?auto_39100 ?auto_39087 ) ) ( not ( = ?auto_39089 ?auto_39087 ) ) ( HOIST-AT ?auto_39091 ?auto_39087 ) ( not ( = ?auto_39109 ?auto_39091 ) ) ( not ( = ?auto_39088 ?auto_39091 ) ) ( not ( = ?auto_39085 ?auto_39091 ) ) ( AVAILABLE ?auto_39091 ) ( SURFACE-AT ?auto_39104 ?auto_39087 ) ( ON ?auto_39104 ?auto_39108 ) ( CLEAR ?auto_39104 ) ( not ( = ?auto_39083 ?auto_39108 ) ) ( not ( = ?auto_39084 ?auto_39108 ) ) ( not ( = ?auto_39098 ?auto_39108 ) ) ( not ( = ?auto_39104 ?auto_39108 ) ) ( not ( = ?auto_39099 ?auto_39108 ) ) ( not ( = ?auto_39105 ?auto_39108 ) ) ( IS-CRATE ?auto_39105 ) ( not ( = ?auto_39083 ?auto_39095 ) ) ( not ( = ?auto_39084 ?auto_39095 ) ) ( not ( = ?auto_39098 ?auto_39095 ) ) ( not ( = ?auto_39104 ?auto_39095 ) ) ( not ( = ?auto_39099 ?auto_39095 ) ) ( not ( = ?auto_39105 ?auto_39095 ) ) ( not ( = ?auto_39108 ?auto_39095 ) ) ( not ( = ?auto_39092 ?auto_39110 ) ) ( not ( = ?auto_39100 ?auto_39092 ) ) ( not ( = ?auto_39089 ?auto_39092 ) ) ( not ( = ?auto_39087 ?auto_39092 ) ) ( HOIST-AT ?auto_39096 ?auto_39092 ) ( not ( = ?auto_39109 ?auto_39096 ) ) ( not ( = ?auto_39088 ?auto_39096 ) ) ( not ( = ?auto_39085 ?auto_39096 ) ) ( not ( = ?auto_39091 ?auto_39096 ) ) ( AVAILABLE ?auto_39096 ) ( SURFACE-AT ?auto_39105 ?auto_39092 ) ( ON ?auto_39105 ?auto_39106 ) ( CLEAR ?auto_39105 ) ( not ( = ?auto_39083 ?auto_39106 ) ) ( not ( = ?auto_39084 ?auto_39106 ) ) ( not ( = ?auto_39098 ?auto_39106 ) ) ( not ( = ?auto_39104 ?auto_39106 ) ) ( not ( = ?auto_39099 ?auto_39106 ) ) ( not ( = ?auto_39105 ?auto_39106 ) ) ( not ( = ?auto_39108 ?auto_39106 ) ) ( not ( = ?auto_39095 ?auto_39106 ) ) ( IS-CRATE ?auto_39095 ) ( not ( = ?auto_39083 ?auto_39094 ) ) ( not ( = ?auto_39084 ?auto_39094 ) ) ( not ( = ?auto_39098 ?auto_39094 ) ) ( not ( = ?auto_39104 ?auto_39094 ) ) ( not ( = ?auto_39099 ?auto_39094 ) ) ( not ( = ?auto_39105 ?auto_39094 ) ) ( not ( = ?auto_39108 ?auto_39094 ) ) ( not ( = ?auto_39095 ?auto_39094 ) ) ( not ( = ?auto_39106 ?auto_39094 ) ) ( not ( = ?auto_39090 ?auto_39110 ) ) ( not ( = ?auto_39100 ?auto_39090 ) ) ( not ( = ?auto_39089 ?auto_39090 ) ) ( not ( = ?auto_39087 ?auto_39090 ) ) ( not ( = ?auto_39092 ?auto_39090 ) ) ( HOIST-AT ?auto_39107 ?auto_39090 ) ( not ( = ?auto_39109 ?auto_39107 ) ) ( not ( = ?auto_39088 ?auto_39107 ) ) ( not ( = ?auto_39085 ?auto_39107 ) ) ( not ( = ?auto_39091 ?auto_39107 ) ) ( not ( = ?auto_39096 ?auto_39107 ) ) ( AVAILABLE ?auto_39107 ) ( SURFACE-AT ?auto_39095 ?auto_39090 ) ( ON ?auto_39095 ?auto_39103 ) ( CLEAR ?auto_39095 ) ( not ( = ?auto_39083 ?auto_39103 ) ) ( not ( = ?auto_39084 ?auto_39103 ) ) ( not ( = ?auto_39098 ?auto_39103 ) ) ( not ( = ?auto_39104 ?auto_39103 ) ) ( not ( = ?auto_39099 ?auto_39103 ) ) ( not ( = ?auto_39105 ?auto_39103 ) ) ( not ( = ?auto_39108 ?auto_39103 ) ) ( not ( = ?auto_39095 ?auto_39103 ) ) ( not ( = ?auto_39106 ?auto_39103 ) ) ( not ( = ?auto_39094 ?auto_39103 ) ) ( SURFACE-AT ?auto_39102 ?auto_39110 ) ( CLEAR ?auto_39102 ) ( IS-CRATE ?auto_39094 ) ( not ( = ?auto_39083 ?auto_39102 ) ) ( not ( = ?auto_39084 ?auto_39102 ) ) ( not ( = ?auto_39098 ?auto_39102 ) ) ( not ( = ?auto_39104 ?auto_39102 ) ) ( not ( = ?auto_39099 ?auto_39102 ) ) ( not ( = ?auto_39105 ?auto_39102 ) ) ( not ( = ?auto_39108 ?auto_39102 ) ) ( not ( = ?auto_39095 ?auto_39102 ) ) ( not ( = ?auto_39106 ?auto_39102 ) ) ( not ( = ?auto_39094 ?auto_39102 ) ) ( not ( = ?auto_39103 ?auto_39102 ) ) ( AVAILABLE ?auto_39109 ) ( not ( = ?auto_39093 ?auto_39110 ) ) ( not ( = ?auto_39100 ?auto_39093 ) ) ( not ( = ?auto_39089 ?auto_39093 ) ) ( not ( = ?auto_39087 ?auto_39093 ) ) ( not ( = ?auto_39092 ?auto_39093 ) ) ( not ( = ?auto_39090 ?auto_39093 ) ) ( HOIST-AT ?auto_39086 ?auto_39093 ) ( not ( = ?auto_39109 ?auto_39086 ) ) ( not ( = ?auto_39088 ?auto_39086 ) ) ( not ( = ?auto_39085 ?auto_39086 ) ) ( not ( = ?auto_39091 ?auto_39086 ) ) ( not ( = ?auto_39096 ?auto_39086 ) ) ( not ( = ?auto_39107 ?auto_39086 ) ) ( AVAILABLE ?auto_39086 ) ( SURFACE-AT ?auto_39094 ?auto_39093 ) ( ON ?auto_39094 ?auto_39101 ) ( CLEAR ?auto_39094 ) ( not ( = ?auto_39083 ?auto_39101 ) ) ( not ( = ?auto_39084 ?auto_39101 ) ) ( not ( = ?auto_39098 ?auto_39101 ) ) ( not ( = ?auto_39104 ?auto_39101 ) ) ( not ( = ?auto_39099 ?auto_39101 ) ) ( not ( = ?auto_39105 ?auto_39101 ) ) ( not ( = ?auto_39108 ?auto_39101 ) ) ( not ( = ?auto_39095 ?auto_39101 ) ) ( not ( = ?auto_39106 ?auto_39101 ) ) ( not ( = ?auto_39094 ?auto_39101 ) ) ( not ( = ?auto_39103 ?auto_39101 ) ) ( not ( = ?auto_39102 ?auto_39101 ) ) ( TRUCK-AT ?auto_39097 ?auto_39110 ) )
    :subtasks
    ( ( !DRIVE ?auto_39097 ?auto_39110 ?auto_39093 )
      ( MAKE-ON ?auto_39083 ?auto_39084 )
      ( MAKE-ON-VERIFY ?auto_39083 ?auto_39084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39111 - SURFACE
      ?auto_39112 - SURFACE
    )
    :vars
    (
      ?auto_39126 - HOIST
      ?auto_39130 - PLACE
      ?auto_39132 - PLACE
      ?auto_39118 - HOIST
      ?auto_39127 - SURFACE
      ?auto_39115 - SURFACE
      ?auto_39119 - PLACE
      ?auto_39122 - HOIST
      ?auto_39124 - SURFACE
      ?auto_39114 - SURFACE
      ?auto_39133 - PLACE
      ?auto_39134 - HOIST
      ?auto_39136 - SURFACE
      ?auto_39117 - SURFACE
      ?auto_39120 - PLACE
      ?auto_39128 - HOIST
      ?auto_39113 - SURFACE
      ?auto_39121 - SURFACE
      ?auto_39129 - PLACE
      ?auto_39131 - HOIST
      ?auto_39116 - SURFACE
      ?auto_39138 - SURFACE
      ?auto_39135 - PLACE
      ?auto_39125 - HOIST
      ?auto_39137 - SURFACE
      ?auto_39123 - TRUCK
      ?auto_39139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39126 ?auto_39130 ) ( IS-CRATE ?auto_39111 ) ( not ( = ?auto_39111 ?auto_39112 ) ) ( not ( = ?auto_39132 ?auto_39130 ) ) ( HOIST-AT ?auto_39118 ?auto_39132 ) ( not ( = ?auto_39126 ?auto_39118 ) ) ( AVAILABLE ?auto_39118 ) ( SURFACE-AT ?auto_39111 ?auto_39132 ) ( ON ?auto_39111 ?auto_39127 ) ( CLEAR ?auto_39111 ) ( not ( = ?auto_39111 ?auto_39127 ) ) ( not ( = ?auto_39112 ?auto_39127 ) ) ( IS-CRATE ?auto_39112 ) ( not ( = ?auto_39111 ?auto_39115 ) ) ( not ( = ?auto_39112 ?auto_39115 ) ) ( not ( = ?auto_39127 ?auto_39115 ) ) ( not ( = ?auto_39119 ?auto_39130 ) ) ( not ( = ?auto_39132 ?auto_39119 ) ) ( HOIST-AT ?auto_39122 ?auto_39119 ) ( not ( = ?auto_39126 ?auto_39122 ) ) ( not ( = ?auto_39118 ?auto_39122 ) ) ( AVAILABLE ?auto_39122 ) ( SURFACE-AT ?auto_39112 ?auto_39119 ) ( ON ?auto_39112 ?auto_39124 ) ( CLEAR ?auto_39112 ) ( not ( = ?auto_39111 ?auto_39124 ) ) ( not ( = ?auto_39112 ?auto_39124 ) ) ( not ( = ?auto_39127 ?auto_39124 ) ) ( not ( = ?auto_39115 ?auto_39124 ) ) ( IS-CRATE ?auto_39115 ) ( not ( = ?auto_39111 ?auto_39114 ) ) ( not ( = ?auto_39112 ?auto_39114 ) ) ( not ( = ?auto_39127 ?auto_39114 ) ) ( not ( = ?auto_39115 ?auto_39114 ) ) ( not ( = ?auto_39124 ?auto_39114 ) ) ( not ( = ?auto_39133 ?auto_39130 ) ) ( not ( = ?auto_39132 ?auto_39133 ) ) ( not ( = ?auto_39119 ?auto_39133 ) ) ( HOIST-AT ?auto_39134 ?auto_39133 ) ( not ( = ?auto_39126 ?auto_39134 ) ) ( not ( = ?auto_39118 ?auto_39134 ) ) ( not ( = ?auto_39122 ?auto_39134 ) ) ( AVAILABLE ?auto_39134 ) ( SURFACE-AT ?auto_39115 ?auto_39133 ) ( ON ?auto_39115 ?auto_39136 ) ( CLEAR ?auto_39115 ) ( not ( = ?auto_39111 ?auto_39136 ) ) ( not ( = ?auto_39112 ?auto_39136 ) ) ( not ( = ?auto_39127 ?auto_39136 ) ) ( not ( = ?auto_39115 ?auto_39136 ) ) ( not ( = ?auto_39124 ?auto_39136 ) ) ( not ( = ?auto_39114 ?auto_39136 ) ) ( IS-CRATE ?auto_39114 ) ( not ( = ?auto_39111 ?auto_39117 ) ) ( not ( = ?auto_39112 ?auto_39117 ) ) ( not ( = ?auto_39127 ?auto_39117 ) ) ( not ( = ?auto_39115 ?auto_39117 ) ) ( not ( = ?auto_39124 ?auto_39117 ) ) ( not ( = ?auto_39114 ?auto_39117 ) ) ( not ( = ?auto_39136 ?auto_39117 ) ) ( not ( = ?auto_39120 ?auto_39130 ) ) ( not ( = ?auto_39132 ?auto_39120 ) ) ( not ( = ?auto_39119 ?auto_39120 ) ) ( not ( = ?auto_39133 ?auto_39120 ) ) ( HOIST-AT ?auto_39128 ?auto_39120 ) ( not ( = ?auto_39126 ?auto_39128 ) ) ( not ( = ?auto_39118 ?auto_39128 ) ) ( not ( = ?auto_39122 ?auto_39128 ) ) ( not ( = ?auto_39134 ?auto_39128 ) ) ( AVAILABLE ?auto_39128 ) ( SURFACE-AT ?auto_39114 ?auto_39120 ) ( ON ?auto_39114 ?auto_39113 ) ( CLEAR ?auto_39114 ) ( not ( = ?auto_39111 ?auto_39113 ) ) ( not ( = ?auto_39112 ?auto_39113 ) ) ( not ( = ?auto_39127 ?auto_39113 ) ) ( not ( = ?auto_39115 ?auto_39113 ) ) ( not ( = ?auto_39124 ?auto_39113 ) ) ( not ( = ?auto_39114 ?auto_39113 ) ) ( not ( = ?auto_39136 ?auto_39113 ) ) ( not ( = ?auto_39117 ?auto_39113 ) ) ( IS-CRATE ?auto_39117 ) ( not ( = ?auto_39111 ?auto_39121 ) ) ( not ( = ?auto_39112 ?auto_39121 ) ) ( not ( = ?auto_39127 ?auto_39121 ) ) ( not ( = ?auto_39115 ?auto_39121 ) ) ( not ( = ?auto_39124 ?auto_39121 ) ) ( not ( = ?auto_39114 ?auto_39121 ) ) ( not ( = ?auto_39136 ?auto_39121 ) ) ( not ( = ?auto_39117 ?auto_39121 ) ) ( not ( = ?auto_39113 ?auto_39121 ) ) ( not ( = ?auto_39129 ?auto_39130 ) ) ( not ( = ?auto_39132 ?auto_39129 ) ) ( not ( = ?auto_39119 ?auto_39129 ) ) ( not ( = ?auto_39133 ?auto_39129 ) ) ( not ( = ?auto_39120 ?auto_39129 ) ) ( HOIST-AT ?auto_39131 ?auto_39129 ) ( not ( = ?auto_39126 ?auto_39131 ) ) ( not ( = ?auto_39118 ?auto_39131 ) ) ( not ( = ?auto_39122 ?auto_39131 ) ) ( not ( = ?auto_39134 ?auto_39131 ) ) ( not ( = ?auto_39128 ?auto_39131 ) ) ( AVAILABLE ?auto_39131 ) ( SURFACE-AT ?auto_39117 ?auto_39129 ) ( ON ?auto_39117 ?auto_39116 ) ( CLEAR ?auto_39117 ) ( not ( = ?auto_39111 ?auto_39116 ) ) ( not ( = ?auto_39112 ?auto_39116 ) ) ( not ( = ?auto_39127 ?auto_39116 ) ) ( not ( = ?auto_39115 ?auto_39116 ) ) ( not ( = ?auto_39124 ?auto_39116 ) ) ( not ( = ?auto_39114 ?auto_39116 ) ) ( not ( = ?auto_39136 ?auto_39116 ) ) ( not ( = ?auto_39117 ?auto_39116 ) ) ( not ( = ?auto_39113 ?auto_39116 ) ) ( not ( = ?auto_39121 ?auto_39116 ) ) ( IS-CRATE ?auto_39121 ) ( not ( = ?auto_39111 ?auto_39138 ) ) ( not ( = ?auto_39112 ?auto_39138 ) ) ( not ( = ?auto_39127 ?auto_39138 ) ) ( not ( = ?auto_39115 ?auto_39138 ) ) ( not ( = ?auto_39124 ?auto_39138 ) ) ( not ( = ?auto_39114 ?auto_39138 ) ) ( not ( = ?auto_39136 ?auto_39138 ) ) ( not ( = ?auto_39117 ?auto_39138 ) ) ( not ( = ?auto_39113 ?auto_39138 ) ) ( not ( = ?auto_39121 ?auto_39138 ) ) ( not ( = ?auto_39116 ?auto_39138 ) ) ( not ( = ?auto_39135 ?auto_39130 ) ) ( not ( = ?auto_39132 ?auto_39135 ) ) ( not ( = ?auto_39119 ?auto_39135 ) ) ( not ( = ?auto_39133 ?auto_39135 ) ) ( not ( = ?auto_39120 ?auto_39135 ) ) ( not ( = ?auto_39129 ?auto_39135 ) ) ( HOIST-AT ?auto_39125 ?auto_39135 ) ( not ( = ?auto_39126 ?auto_39125 ) ) ( not ( = ?auto_39118 ?auto_39125 ) ) ( not ( = ?auto_39122 ?auto_39125 ) ) ( not ( = ?auto_39134 ?auto_39125 ) ) ( not ( = ?auto_39128 ?auto_39125 ) ) ( not ( = ?auto_39131 ?auto_39125 ) ) ( AVAILABLE ?auto_39125 ) ( SURFACE-AT ?auto_39121 ?auto_39135 ) ( ON ?auto_39121 ?auto_39137 ) ( CLEAR ?auto_39121 ) ( not ( = ?auto_39111 ?auto_39137 ) ) ( not ( = ?auto_39112 ?auto_39137 ) ) ( not ( = ?auto_39127 ?auto_39137 ) ) ( not ( = ?auto_39115 ?auto_39137 ) ) ( not ( = ?auto_39124 ?auto_39137 ) ) ( not ( = ?auto_39114 ?auto_39137 ) ) ( not ( = ?auto_39136 ?auto_39137 ) ) ( not ( = ?auto_39117 ?auto_39137 ) ) ( not ( = ?auto_39113 ?auto_39137 ) ) ( not ( = ?auto_39121 ?auto_39137 ) ) ( not ( = ?auto_39116 ?auto_39137 ) ) ( not ( = ?auto_39138 ?auto_39137 ) ) ( TRUCK-AT ?auto_39123 ?auto_39130 ) ( SURFACE-AT ?auto_39139 ?auto_39130 ) ( CLEAR ?auto_39139 ) ( LIFTING ?auto_39126 ?auto_39138 ) ( IS-CRATE ?auto_39138 ) ( not ( = ?auto_39111 ?auto_39139 ) ) ( not ( = ?auto_39112 ?auto_39139 ) ) ( not ( = ?auto_39127 ?auto_39139 ) ) ( not ( = ?auto_39115 ?auto_39139 ) ) ( not ( = ?auto_39124 ?auto_39139 ) ) ( not ( = ?auto_39114 ?auto_39139 ) ) ( not ( = ?auto_39136 ?auto_39139 ) ) ( not ( = ?auto_39117 ?auto_39139 ) ) ( not ( = ?auto_39113 ?auto_39139 ) ) ( not ( = ?auto_39121 ?auto_39139 ) ) ( not ( = ?auto_39116 ?auto_39139 ) ) ( not ( = ?auto_39138 ?auto_39139 ) ) ( not ( = ?auto_39137 ?auto_39139 ) ) )
    :subtasks
    ( ( !DROP ?auto_39126 ?auto_39138 ?auto_39139 ?auto_39130 )
      ( MAKE-ON ?auto_39111 ?auto_39112 )
      ( MAKE-ON-VERIFY ?auto_39111 ?auto_39112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39140 - SURFACE
      ?auto_39141 - SURFACE
    )
    :vars
    (
      ?auto_39157 - HOIST
      ?auto_39149 - PLACE
      ?auto_39164 - PLACE
      ?auto_39161 - HOIST
      ?auto_39151 - SURFACE
      ?auto_39160 - SURFACE
      ?auto_39143 - PLACE
      ?auto_39159 - HOIST
      ?auto_39146 - SURFACE
      ?auto_39152 - SURFACE
      ?auto_39165 - PLACE
      ?auto_39166 - HOIST
      ?auto_39147 - SURFACE
      ?auto_39153 - SURFACE
      ?auto_39158 - PLACE
      ?auto_39144 - HOIST
      ?auto_39168 - SURFACE
      ?auto_39167 - SURFACE
      ?auto_39148 - PLACE
      ?auto_39163 - HOIST
      ?auto_39150 - SURFACE
      ?auto_39156 - SURFACE
      ?auto_39145 - PLACE
      ?auto_39142 - HOIST
      ?auto_39155 - SURFACE
      ?auto_39162 - TRUCK
      ?auto_39154 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39157 ?auto_39149 ) ( IS-CRATE ?auto_39140 ) ( not ( = ?auto_39140 ?auto_39141 ) ) ( not ( = ?auto_39164 ?auto_39149 ) ) ( HOIST-AT ?auto_39161 ?auto_39164 ) ( not ( = ?auto_39157 ?auto_39161 ) ) ( AVAILABLE ?auto_39161 ) ( SURFACE-AT ?auto_39140 ?auto_39164 ) ( ON ?auto_39140 ?auto_39151 ) ( CLEAR ?auto_39140 ) ( not ( = ?auto_39140 ?auto_39151 ) ) ( not ( = ?auto_39141 ?auto_39151 ) ) ( IS-CRATE ?auto_39141 ) ( not ( = ?auto_39140 ?auto_39160 ) ) ( not ( = ?auto_39141 ?auto_39160 ) ) ( not ( = ?auto_39151 ?auto_39160 ) ) ( not ( = ?auto_39143 ?auto_39149 ) ) ( not ( = ?auto_39164 ?auto_39143 ) ) ( HOIST-AT ?auto_39159 ?auto_39143 ) ( not ( = ?auto_39157 ?auto_39159 ) ) ( not ( = ?auto_39161 ?auto_39159 ) ) ( AVAILABLE ?auto_39159 ) ( SURFACE-AT ?auto_39141 ?auto_39143 ) ( ON ?auto_39141 ?auto_39146 ) ( CLEAR ?auto_39141 ) ( not ( = ?auto_39140 ?auto_39146 ) ) ( not ( = ?auto_39141 ?auto_39146 ) ) ( not ( = ?auto_39151 ?auto_39146 ) ) ( not ( = ?auto_39160 ?auto_39146 ) ) ( IS-CRATE ?auto_39160 ) ( not ( = ?auto_39140 ?auto_39152 ) ) ( not ( = ?auto_39141 ?auto_39152 ) ) ( not ( = ?auto_39151 ?auto_39152 ) ) ( not ( = ?auto_39160 ?auto_39152 ) ) ( not ( = ?auto_39146 ?auto_39152 ) ) ( not ( = ?auto_39165 ?auto_39149 ) ) ( not ( = ?auto_39164 ?auto_39165 ) ) ( not ( = ?auto_39143 ?auto_39165 ) ) ( HOIST-AT ?auto_39166 ?auto_39165 ) ( not ( = ?auto_39157 ?auto_39166 ) ) ( not ( = ?auto_39161 ?auto_39166 ) ) ( not ( = ?auto_39159 ?auto_39166 ) ) ( AVAILABLE ?auto_39166 ) ( SURFACE-AT ?auto_39160 ?auto_39165 ) ( ON ?auto_39160 ?auto_39147 ) ( CLEAR ?auto_39160 ) ( not ( = ?auto_39140 ?auto_39147 ) ) ( not ( = ?auto_39141 ?auto_39147 ) ) ( not ( = ?auto_39151 ?auto_39147 ) ) ( not ( = ?auto_39160 ?auto_39147 ) ) ( not ( = ?auto_39146 ?auto_39147 ) ) ( not ( = ?auto_39152 ?auto_39147 ) ) ( IS-CRATE ?auto_39152 ) ( not ( = ?auto_39140 ?auto_39153 ) ) ( not ( = ?auto_39141 ?auto_39153 ) ) ( not ( = ?auto_39151 ?auto_39153 ) ) ( not ( = ?auto_39160 ?auto_39153 ) ) ( not ( = ?auto_39146 ?auto_39153 ) ) ( not ( = ?auto_39152 ?auto_39153 ) ) ( not ( = ?auto_39147 ?auto_39153 ) ) ( not ( = ?auto_39158 ?auto_39149 ) ) ( not ( = ?auto_39164 ?auto_39158 ) ) ( not ( = ?auto_39143 ?auto_39158 ) ) ( not ( = ?auto_39165 ?auto_39158 ) ) ( HOIST-AT ?auto_39144 ?auto_39158 ) ( not ( = ?auto_39157 ?auto_39144 ) ) ( not ( = ?auto_39161 ?auto_39144 ) ) ( not ( = ?auto_39159 ?auto_39144 ) ) ( not ( = ?auto_39166 ?auto_39144 ) ) ( AVAILABLE ?auto_39144 ) ( SURFACE-AT ?auto_39152 ?auto_39158 ) ( ON ?auto_39152 ?auto_39168 ) ( CLEAR ?auto_39152 ) ( not ( = ?auto_39140 ?auto_39168 ) ) ( not ( = ?auto_39141 ?auto_39168 ) ) ( not ( = ?auto_39151 ?auto_39168 ) ) ( not ( = ?auto_39160 ?auto_39168 ) ) ( not ( = ?auto_39146 ?auto_39168 ) ) ( not ( = ?auto_39152 ?auto_39168 ) ) ( not ( = ?auto_39147 ?auto_39168 ) ) ( not ( = ?auto_39153 ?auto_39168 ) ) ( IS-CRATE ?auto_39153 ) ( not ( = ?auto_39140 ?auto_39167 ) ) ( not ( = ?auto_39141 ?auto_39167 ) ) ( not ( = ?auto_39151 ?auto_39167 ) ) ( not ( = ?auto_39160 ?auto_39167 ) ) ( not ( = ?auto_39146 ?auto_39167 ) ) ( not ( = ?auto_39152 ?auto_39167 ) ) ( not ( = ?auto_39147 ?auto_39167 ) ) ( not ( = ?auto_39153 ?auto_39167 ) ) ( not ( = ?auto_39168 ?auto_39167 ) ) ( not ( = ?auto_39148 ?auto_39149 ) ) ( not ( = ?auto_39164 ?auto_39148 ) ) ( not ( = ?auto_39143 ?auto_39148 ) ) ( not ( = ?auto_39165 ?auto_39148 ) ) ( not ( = ?auto_39158 ?auto_39148 ) ) ( HOIST-AT ?auto_39163 ?auto_39148 ) ( not ( = ?auto_39157 ?auto_39163 ) ) ( not ( = ?auto_39161 ?auto_39163 ) ) ( not ( = ?auto_39159 ?auto_39163 ) ) ( not ( = ?auto_39166 ?auto_39163 ) ) ( not ( = ?auto_39144 ?auto_39163 ) ) ( AVAILABLE ?auto_39163 ) ( SURFACE-AT ?auto_39153 ?auto_39148 ) ( ON ?auto_39153 ?auto_39150 ) ( CLEAR ?auto_39153 ) ( not ( = ?auto_39140 ?auto_39150 ) ) ( not ( = ?auto_39141 ?auto_39150 ) ) ( not ( = ?auto_39151 ?auto_39150 ) ) ( not ( = ?auto_39160 ?auto_39150 ) ) ( not ( = ?auto_39146 ?auto_39150 ) ) ( not ( = ?auto_39152 ?auto_39150 ) ) ( not ( = ?auto_39147 ?auto_39150 ) ) ( not ( = ?auto_39153 ?auto_39150 ) ) ( not ( = ?auto_39168 ?auto_39150 ) ) ( not ( = ?auto_39167 ?auto_39150 ) ) ( IS-CRATE ?auto_39167 ) ( not ( = ?auto_39140 ?auto_39156 ) ) ( not ( = ?auto_39141 ?auto_39156 ) ) ( not ( = ?auto_39151 ?auto_39156 ) ) ( not ( = ?auto_39160 ?auto_39156 ) ) ( not ( = ?auto_39146 ?auto_39156 ) ) ( not ( = ?auto_39152 ?auto_39156 ) ) ( not ( = ?auto_39147 ?auto_39156 ) ) ( not ( = ?auto_39153 ?auto_39156 ) ) ( not ( = ?auto_39168 ?auto_39156 ) ) ( not ( = ?auto_39167 ?auto_39156 ) ) ( not ( = ?auto_39150 ?auto_39156 ) ) ( not ( = ?auto_39145 ?auto_39149 ) ) ( not ( = ?auto_39164 ?auto_39145 ) ) ( not ( = ?auto_39143 ?auto_39145 ) ) ( not ( = ?auto_39165 ?auto_39145 ) ) ( not ( = ?auto_39158 ?auto_39145 ) ) ( not ( = ?auto_39148 ?auto_39145 ) ) ( HOIST-AT ?auto_39142 ?auto_39145 ) ( not ( = ?auto_39157 ?auto_39142 ) ) ( not ( = ?auto_39161 ?auto_39142 ) ) ( not ( = ?auto_39159 ?auto_39142 ) ) ( not ( = ?auto_39166 ?auto_39142 ) ) ( not ( = ?auto_39144 ?auto_39142 ) ) ( not ( = ?auto_39163 ?auto_39142 ) ) ( AVAILABLE ?auto_39142 ) ( SURFACE-AT ?auto_39167 ?auto_39145 ) ( ON ?auto_39167 ?auto_39155 ) ( CLEAR ?auto_39167 ) ( not ( = ?auto_39140 ?auto_39155 ) ) ( not ( = ?auto_39141 ?auto_39155 ) ) ( not ( = ?auto_39151 ?auto_39155 ) ) ( not ( = ?auto_39160 ?auto_39155 ) ) ( not ( = ?auto_39146 ?auto_39155 ) ) ( not ( = ?auto_39152 ?auto_39155 ) ) ( not ( = ?auto_39147 ?auto_39155 ) ) ( not ( = ?auto_39153 ?auto_39155 ) ) ( not ( = ?auto_39168 ?auto_39155 ) ) ( not ( = ?auto_39167 ?auto_39155 ) ) ( not ( = ?auto_39150 ?auto_39155 ) ) ( not ( = ?auto_39156 ?auto_39155 ) ) ( TRUCK-AT ?auto_39162 ?auto_39149 ) ( SURFACE-AT ?auto_39154 ?auto_39149 ) ( CLEAR ?auto_39154 ) ( IS-CRATE ?auto_39156 ) ( not ( = ?auto_39140 ?auto_39154 ) ) ( not ( = ?auto_39141 ?auto_39154 ) ) ( not ( = ?auto_39151 ?auto_39154 ) ) ( not ( = ?auto_39160 ?auto_39154 ) ) ( not ( = ?auto_39146 ?auto_39154 ) ) ( not ( = ?auto_39152 ?auto_39154 ) ) ( not ( = ?auto_39147 ?auto_39154 ) ) ( not ( = ?auto_39153 ?auto_39154 ) ) ( not ( = ?auto_39168 ?auto_39154 ) ) ( not ( = ?auto_39167 ?auto_39154 ) ) ( not ( = ?auto_39150 ?auto_39154 ) ) ( not ( = ?auto_39156 ?auto_39154 ) ) ( not ( = ?auto_39155 ?auto_39154 ) ) ( AVAILABLE ?auto_39157 ) ( IN ?auto_39156 ?auto_39162 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39157 ?auto_39156 ?auto_39162 ?auto_39149 )
      ( MAKE-ON ?auto_39140 ?auto_39141 )
      ( MAKE-ON-VERIFY ?auto_39140 ?auto_39141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39169 - SURFACE
      ?auto_39170 - SURFACE
    )
    :vars
    (
      ?auto_39189 - HOIST
      ?auto_39195 - PLACE
      ?auto_39188 - PLACE
      ?auto_39185 - HOIST
      ?auto_39171 - SURFACE
      ?auto_39184 - SURFACE
      ?auto_39176 - PLACE
      ?auto_39183 - HOIST
      ?auto_39190 - SURFACE
      ?auto_39174 - SURFACE
      ?auto_39181 - PLACE
      ?auto_39178 - HOIST
      ?auto_39194 - SURFACE
      ?auto_39175 - SURFACE
      ?auto_39182 - PLACE
      ?auto_39173 - HOIST
      ?auto_39180 - SURFACE
      ?auto_39179 - SURFACE
      ?auto_39177 - PLACE
      ?auto_39187 - HOIST
      ?auto_39191 - SURFACE
      ?auto_39197 - SURFACE
      ?auto_39192 - PLACE
      ?auto_39196 - HOIST
      ?auto_39172 - SURFACE
      ?auto_39193 - SURFACE
      ?auto_39186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39189 ?auto_39195 ) ( IS-CRATE ?auto_39169 ) ( not ( = ?auto_39169 ?auto_39170 ) ) ( not ( = ?auto_39188 ?auto_39195 ) ) ( HOIST-AT ?auto_39185 ?auto_39188 ) ( not ( = ?auto_39189 ?auto_39185 ) ) ( AVAILABLE ?auto_39185 ) ( SURFACE-AT ?auto_39169 ?auto_39188 ) ( ON ?auto_39169 ?auto_39171 ) ( CLEAR ?auto_39169 ) ( not ( = ?auto_39169 ?auto_39171 ) ) ( not ( = ?auto_39170 ?auto_39171 ) ) ( IS-CRATE ?auto_39170 ) ( not ( = ?auto_39169 ?auto_39184 ) ) ( not ( = ?auto_39170 ?auto_39184 ) ) ( not ( = ?auto_39171 ?auto_39184 ) ) ( not ( = ?auto_39176 ?auto_39195 ) ) ( not ( = ?auto_39188 ?auto_39176 ) ) ( HOIST-AT ?auto_39183 ?auto_39176 ) ( not ( = ?auto_39189 ?auto_39183 ) ) ( not ( = ?auto_39185 ?auto_39183 ) ) ( AVAILABLE ?auto_39183 ) ( SURFACE-AT ?auto_39170 ?auto_39176 ) ( ON ?auto_39170 ?auto_39190 ) ( CLEAR ?auto_39170 ) ( not ( = ?auto_39169 ?auto_39190 ) ) ( not ( = ?auto_39170 ?auto_39190 ) ) ( not ( = ?auto_39171 ?auto_39190 ) ) ( not ( = ?auto_39184 ?auto_39190 ) ) ( IS-CRATE ?auto_39184 ) ( not ( = ?auto_39169 ?auto_39174 ) ) ( not ( = ?auto_39170 ?auto_39174 ) ) ( not ( = ?auto_39171 ?auto_39174 ) ) ( not ( = ?auto_39184 ?auto_39174 ) ) ( not ( = ?auto_39190 ?auto_39174 ) ) ( not ( = ?auto_39181 ?auto_39195 ) ) ( not ( = ?auto_39188 ?auto_39181 ) ) ( not ( = ?auto_39176 ?auto_39181 ) ) ( HOIST-AT ?auto_39178 ?auto_39181 ) ( not ( = ?auto_39189 ?auto_39178 ) ) ( not ( = ?auto_39185 ?auto_39178 ) ) ( not ( = ?auto_39183 ?auto_39178 ) ) ( AVAILABLE ?auto_39178 ) ( SURFACE-AT ?auto_39184 ?auto_39181 ) ( ON ?auto_39184 ?auto_39194 ) ( CLEAR ?auto_39184 ) ( not ( = ?auto_39169 ?auto_39194 ) ) ( not ( = ?auto_39170 ?auto_39194 ) ) ( not ( = ?auto_39171 ?auto_39194 ) ) ( not ( = ?auto_39184 ?auto_39194 ) ) ( not ( = ?auto_39190 ?auto_39194 ) ) ( not ( = ?auto_39174 ?auto_39194 ) ) ( IS-CRATE ?auto_39174 ) ( not ( = ?auto_39169 ?auto_39175 ) ) ( not ( = ?auto_39170 ?auto_39175 ) ) ( not ( = ?auto_39171 ?auto_39175 ) ) ( not ( = ?auto_39184 ?auto_39175 ) ) ( not ( = ?auto_39190 ?auto_39175 ) ) ( not ( = ?auto_39174 ?auto_39175 ) ) ( not ( = ?auto_39194 ?auto_39175 ) ) ( not ( = ?auto_39182 ?auto_39195 ) ) ( not ( = ?auto_39188 ?auto_39182 ) ) ( not ( = ?auto_39176 ?auto_39182 ) ) ( not ( = ?auto_39181 ?auto_39182 ) ) ( HOIST-AT ?auto_39173 ?auto_39182 ) ( not ( = ?auto_39189 ?auto_39173 ) ) ( not ( = ?auto_39185 ?auto_39173 ) ) ( not ( = ?auto_39183 ?auto_39173 ) ) ( not ( = ?auto_39178 ?auto_39173 ) ) ( AVAILABLE ?auto_39173 ) ( SURFACE-AT ?auto_39174 ?auto_39182 ) ( ON ?auto_39174 ?auto_39180 ) ( CLEAR ?auto_39174 ) ( not ( = ?auto_39169 ?auto_39180 ) ) ( not ( = ?auto_39170 ?auto_39180 ) ) ( not ( = ?auto_39171 ?auto_39180 ) ) ( not ( = ?auto_39184 ?auto_39180 ) ) ( not ( = ?auto_39190 ?auto_39180 ) ) ( not ( = ?auto_39174 ?auto_39180 ) ) ( not ( = ?auto_39194 ?auto_39180 ) ) ( not ( = ?auto_39175 ?auto_39180 ) ) ( IS-CRATE ?auto_39175 ) ( not ( = ?auto_39169 ?auto_39179 ) ) ( not ( = ?auto_39170 ?auto_39179 ) ) ( not ( = ?auto_39171 ?auto_39179 ) ) ( not ( = ?auto_39184 ?auto_39179 ) ) ( not ( = ?auto_39190 ?auto_39179 ) ) ( not ( = ?auto_39174 ?auto_39179 ) ) ( not ( = ?auto_39194 ?auto_39179 ) ) ( not ( = ?auto_39175 ?auto_39179 ) ) ( not ( = ?auto_39180 ?auto_39179 ) ) ( not ( = ?auto_39177 ?auto_39195 ) ) ( not ( = ?auto_39188 ?auto_39177 ) ) ( not ( = ?auto_39176 ?auto_39177 ) ) ( not ( = ?auto_39181 ?auto_39177 ) ) ( not ( = ?auto_39182 ?auto_39177 ) ) ( HOIST-AT ?auto_39187 ?auto_39177 ) ( not ( = ?auto_39189 ?auto_39187 ) ) ( not ( = ?auto_39185 ?auto_39187 ) ) ( not ( = ?auto_39183 ?auto_39187 ) ) ( not ( = ?auto_39178 ?auto_39187 ) ) ( not ( = ?auto_39173 ?auto_39187 ) ) ( AVAILABLE ?auto_39187 ) ( SURFACE-AT ?auto_39175 ?auto_39177 ) ( ON ?auto_39175 ?auto_39191 ) ( CLEAR ?auto_39175 ) ( not ( = ?auto_39169 ?auto_39191 ) ) ( not ( = ?auto_39170 ?auto_39191 ) ) ( not ( = ?auto_39171 ?auto_39191 ) ) ( not ( = ?auto_39184 ?auto_39191 ) ) ( not ( = ?auto_39190 ?auto_39191 ) ) ( not ( = ?auto_39174 ?auto_39191 ) ) ( not ( = ?auto_39194 ?auto_39191 ) ) ( not ( = ?auto_39175 ?auto_39191 ) ) ( not ( = ?auto_39180 ?auto_39191 ) ) ( not ( = ?auto_39179 ?auto_39191 ) ) ( IS-CRATE ?auto_39179 ) ( not ( = ?auto_39169 ?auto_39197 ) ) ( not ( = ?auto_39170 ?auto_39197 ) ) ( not ( = ?auto_39171 ?auto_39197 ) ) ( not ( = ?auto_39184 ?auto_39197 ) ) ( not ( = ?auto_39190 ?auto_39197 ) ) ( not ( = ?auto_39174 ?auto_39197 ) ) ( not ( = ?auto_39194 ?auto_39197 ) ) ( not ( = ?auto_39175 ?auto_39197 ) ) ( not ( = ?auto_39180 ?auto_39197 ) ) ( not ( = ?auto_39179 ?auto_39197 ) ) ( not ( = ?auto_39191 ?auto_39197 ) ) ( not ( = ?auto_39192 ?auto_39195 ) ) ( not ( = ?auto_39188 ?auto_39192 ) ) ( not ( = ?auto_39176 ?auto_39192 ) ) ( not ( = ?auto_39181 ?auto_39192 ) ) ( not ( = ?auto_39182 ?auto_39192 ) ) ( not ( = ?auto_39177 ?auto_39192 ) ) ( HOIST-AT ?auto_39196 ?auto_39192 ) ( not ( = ?auto_39189 ?auto_39196 ) ) ( not ( = ?auto_39185 ?auto_39196 ) ) ( not ( = ?auto_39183 ?auto_39196 ) ) ( not ( = ?auto_39178 ?auto_39196 ) ) ( not ( = ?auto_39173 ?auto_39196 ) ) ( not ( = ?auto_39187 ?auto_39196 ) ) ( AVAILABLE ?auto_39196 ) ( SURFACE-AT ?auto_39179 ?auto_39192 ) ( ON ?auto_39179 ?auto_39172 ) ( CLEAR ?auto_39179 ) ( not ( = ?auto_39169 ?auto_39172 ) ) ( not ( = ?auto_39170 ?auto_39172 ) ) ( not ( = ?auto_39171 ?auto_39172 ) ) ( not ( = ?auto_39184 ?auto_39172 ) ) ( not ( = ?auto_39190 ?auto_39172 ) ) ( not ( = ?auto_39174 ?auto_39172 ) ) ( not ( = ?auto_39194 ?auto_39172 ) ) ( not ( = ?auto_39175 ?auto_39172 ) ) ( not ( = ?auto_39180 ?auto_39172 ) ) ( not ( = ?auto_39179 ?auto_39172 ) ) ( not ( = ?auto_39191 ?auto_39172 ) ) ( not ( = ?auto_39197 ?auto_39172 ) ) ( SURFACE-AT ?auto_39193 ?auto_39195 ) ( CLEAR ?auto_39193 ) ( IS-CRATE ?auto_39197 ) ( not ( = ?auto_39169 ?auto_39193 ) ) ( not ( = ?auto_39170 ?auto_39193 ) ) ( not ( = ?auto_39171 ?auto_39193 ) ) ( not ( = ?auto_39184 ?auto_39193 ) ) ( not ( = ?auto_39190 ?auto_39193 ) ) ( not ( = ?auto_39174 ?auto_39193 ) ) ( not ( = ?auto_39194 ?auto_39193 ) ) ( not ( = ?auto_39175 ?auto_39193 ) ) ( not ( = ?auto_39180 ?auto_39193 ) ) ( not ( = ?auto_39179 ?auto_39193 ) ) ( not ( = ?auto_39191 ?auto_39193 ) ) ( not ( = ?auto_39197 ?auto_39193 ) ) ( not ( = ?auto_39172 ?auto_39193 ) ) ( AVAILABLE ?auto_39189 ) ( IN ?auto_39197 ?auto_39186 ) ( TRUCK-AT ?auto_39186 ?auto_39182 ) )
    :subtasks
    ( ( !DRIVE ?auto_39186 ?auto_39182 ?auto_39195 )
      ( MAKE-ON ?auto_39169 ?auto_39170 )
      ( MAKE-ON-VERIFY ?auto_39169 ?auto_39170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39198 - SURFACE
      ?auto_39199 - SURFACE
    )
    :vars
    (
      ?auto_39203 - HOIST
      ?auto_39220 - PLACE
      ?auto_39201 - PLACE
      ?auto_39225 - HOIST
      ?auto_39205 - SURFACE
      ?auto_39217 - SURFACE
      ?auto_39208 - PLACE
      ?auto_39215 - HOIST
      ?auto_39216 - SURFACE
      ?auto_39223 - SURFACE
      ?auto_39218 - PLACE
      ?auto_39211 - HOIST
      ?auto_39204 - SURFACE
      ?auto_39219 - SURFACE
      ?auto_39213 - PLACE
      ?auto_39214 - HOIST
      ?auto_39200 - SURFACE
      ?auto_39212 - SURFACE
      ?auto_39226 - PLACE
      ?auto_39206 - HOIST
      ?auto_39207 - SURFACE
      ?auto_39222 - SURFACE
      ?auto_39202 - PLACE
      ?auto_39221 - HOIST
      ?auto_39224 - SURFACE
      ?auto_39210 - SURFACE
      ?auto_39209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39203 ?auto_39220 ) ( IS-CRATE ?auto_39198 ) ( not ( = ?auto_39198 ?auto_39199 ) ) ( not ( = ?auto_39201 ?auto_39220 ) ) ( HOIST-AT ?auto_39225 ?auto_39201 ) ( not ( = ?auto_39203 ?auto_39225 ) ) ( AVAILABLE ?auto_39225 ) ( SURFACE-AT ?auto_39198 ?auto_39201 ) ( ON ?auto_39198 ?auto_39205 ) ( CLEAR ?auto_39198 ) ( not ( = ?auto_39198 ?auto_39205 ) ) ( not ( = ?auto_39199 ?auto_39205 ) ) ( IS-CRATE ?auto_39199 ) ( not ( = ?auto_39198 ?auto_39217 ) ) ( not ( = ?auto_39199 ?auto_39217 ) ) ( not ( = ?auto_39205 ?auto_39217 ) ) ( not ( = ?auto_39208 ?auto_39220 ) ) ( not ( = ?auto_39201 ?auto_39208 ) ) ( HOIST-AT ?auto_39215 ?auto_39208 ) ( not ( = ?auto_39203 ?auto_39215 ) ) ( not ( = ?auto_39225 ?auto_39215 ) ) ( AVAILABLE ?auto_39215 ) ( SURFACE-AT ?auto_39199 ?auto_39208 ) ( ON ?auto_39199 ?auto_39216 ) ( CLEAR ?auto_39199 ) ( not ( = ?auto_39198 ?auto_39216 ) ) ( not ( = ?auto_39199 ?auto_39216 ) ) ( not ( = ?auto_39205 ?auto_39216 ) ) ( not ( = ?auto_39217 ?auto_39216 ) ) ( IS-CRATE ?auto_39217 ) ( not ( = ?auto_39198 ?auto_39223 ) ) ( not ( = ?auto_39199 ?auto_39223 ) ) ( not ( = ?auto_39205 ?auto_39223 ) ) ( not ( = ?auto_39217 ?auto_39223 ) ) ( not ( = ?auto_39216 ?auto_39223 ) ) ( not ( = ?auto_39218 ?auto_39220 ) ) ( not ( = ?auto_39201 ?auto_39218 ) ) ( not ( = ?auto_39208 ?auto_39218 ) ) ( HOIST-AT ?auto_39211 ?auto_39218 ) ( not ( = ?auto_39203 ?auto_39211 ) ) ( not ( = ?auto_39225 ?auto_39211 ) ) ( not ( = ?auto_39215 ?auto_39211 ) ) ( AVAILABLE ?auto_39211 ) ( SURFACE-AT ?auto_39217 ?auto_39218 ) ( ON ?auto_39217 ?auto_39204 ) ( CLEAR ?auto_39217 ) ( not ( = ?auto_39198 ?auto_39204 ) ) ( not ( = ?auto_39199 ?auto_39204 ) ) ( not ( = ?auto_39205 ?auto_39204 ) ) ( not ( = ?auto_39217 ?auto_39204 ) ) ( not ( = ?auto_39216 ?auto_39204 ) ) ( not ( = ?auto_39223 ?auto_39204 ) ) ( IS-CRATE ?auto_39223 ) ( not ( = ?auto_39198 ?auto_39219 ) ) ( not ( = ?auto_39199 ?auto_39219 ) ) ( not ( = ?auto_39205 ?auto_39219 ) ) ( not ( = ?auto_39217 ?auto_39219 ) ) ( not ( = ?auto_39216 ?auto_39219 ) ) ( not ( = ?auto_39223 ?auto_39219 ) ) ( not ( = ?auto_39204 ?auto_39219 ) ) ( not ( = ?auto_39213 ?auto_39220 ) ) ( not ( = ?auto_39201 ?auto_39213 ) ) ( not ( = ?auto_39208 ?auto_39213 ) ) ( not ( = ?auto_39218 ?auto_39213 ) ) ( HOIST-AT ?auto_39214 ?auto_39213 ) ( not ( = ?auto_39203 ?auto_39214 ) ) ( not ( = ?auto_39225 ?auto_39214 ) ) ( not ( = ?auto_39215 ?auto_39214 ) ) ( not ( = ?auto_39211 ?auto_39214 ) ) ( SURFACE-AT ?auto_39223 ?auto_39213 ) ( ON ?auto_39223 ?auto_39200 ) ( CLEAR ?auto_39223 ) ( not ( = ?auto_39198 ?auto_39200 ) ) ( not ( = ?auto_39199 ?auto_39200 ) ) ( not ( = ?auto_39205 ?auto_39200 ) ) ( not ( = ?auto_39217 ?auto_39200 ) ) ( not ( = ?auto_39216 ?auto_39200 ) ) ( not ( = ?auto_39223 ?auto_39200 ) ) ( not ( = ?auto_39204 ?auto_39200 ) ) ( not ( = ?auto_39219 ?auto_39200 ) ) ( IS-CRATE ?auto_39219 ) ( not ( = ?auto_39198 ?auto_39212 ) ) ( not ( = ?auto_39199 ?auto_39212 ) ) ( not ( = ?auto_39205 ?auto_39212 ) ) ( not ( = ?auto_39217 ?auto_39212 ) ) ( not ( = ?auto_39216 ?auto_39212 ) ) ( not ( = ?auto_39223 ?auto_39212 ) ) ( not ( = ?auto_39204 ?auto_39212 ) ) ( not ( = ?auto_39219 ?auto_39212 ) ) ( not ( = ?auto_39200 ?auto_39212 ) ) ( not ( = ?auto_39226 ?auto_39220 ) ) ( not ( = ?auto_39201 ?auto_39226 ) ) ( not ( = ?auto_39208 ?auto_39226 ) ) ( not ( = ?auto_39218 ?auto_39226 ) ) ( not ( = ?auto_39213 ?auto_39226 ) ) ( HOIST-AT ?auto_39206 ?auto_39226 ) ( not ( = ?auto_39203 ?auto_39206 ) ) ( not ( = ?auto_39225 ?auto_39206 ) ) ( not ( = ?auto_39215 ?auto_39206 ) ) ( not ( = ?auto_39211 ?auto_39206 ) ) ( not ( = ?auto_39214 ?auto_39206 ) ) ( AVAILABLE ?auto_39206 ) ( SURFACE-AT ?auto_39219 ?auto_39226 ) ( ON ?auto_39219 ?auto_39207 ) ( CLEAR ?auto_39219 ) ( not ( = ?auto_39198 ?auto_39207 ) ) ( not ( = ?auto_39199 ?auto_39207 ) ) ( not ( = ?auto_39205 ?auto_39207 ) ) ( not ( = ?auto_39217 ?auto_39207 ) ) ( not ( = ?auto_39216 ?auto_39207 ) ) ( not ( = ?auto_39223 ?auto_39207 ) ) ( not ( = ?auto_39204 ?auto_39207 ) ) ( not ( = ?auto_39219 ?auto_39207 ) ) ( not ( = ?auto_39200 ?auto_39207 ) ) ( not ( = ?auto_39212 ?auto_39207 ) ) ( IS-CRATE ?auto_39212 ) ( not ( = ?auto_39198 ?auto_39222 ) ) ( not ( = ?auto_39199 ?auto_39222 ) ) ( not ( = ?auto_39205 ?auto_39222 ) ) ( not ( = ?auto_39217 ?auto_39222 ) ) ( not ( = ?auto_39216 ?auto_39222 ) ) ( not ( = ?auto_39223 ?auto_39222 ) ) ( not ( = ?auto_39204 ?auto_39222 ) ) ( not ( = ?auto_39219 ?auto_39222 ) ) ( not ( = ?auto_39200 ?auto_39222 ) ) ( not ( = ?auto_39212 ?auto_39222 ) ) ( not ( = ?auto_39207 ?auto_39222 ) ) ( not ( = ?auto_39202 ?auto_39220 ) ) ( not ( = ?auto_39201 ?auto_39202 ) ) ( not ( = ?auto_39208 ?auto_39202 ) ) ( not ( = ?auto_39218 ?auto_39202 ) ) ( not ( = ?auto_39213 ?auto_39202 ) ) ( not ( = ?auto_39226 ?auto_39202 ) ) ( HOIST-AT ?auto_39221 ?auto_39202 ) ( not ( = ?auto_39203 ?auto_39221 ) ) ( not ( = ?auto_39225 ?auto_39221 ) ) ( not ( = ?auto_39215 ?auto_39221 ) ) ( not ( = ?auto_39211 ?auto_39221 ) ) ( not ( = ?auto_39214 ?auto_39221 ) ) ( not ( = ?auto_39206 ?auto_39221 ) ) ( AVAILABLE ?auto_39221 ) ( SURFACE-AT ?auto_39212 ?auto_39202 ) ( ON ?auto_39212 ?auto_39224 ) ( CLEAR ?auto_39212 ) ( not ( = ?auto_39198 ?auto_39224 ) ) ( not ( = ?auto_39199 ?auto_39224 ) ) ( not ( = ?auto_39205 ?auto_39224 ) ) ( not ( = ?auto_39217 ?auto_39224 ) ) ( not ( = ?auto_39216 ?auto_39224 ) ) ( not ( = ?auto_39223 ?auto_39224 ) ) ( not ( = ?auto_39204 ?auto_39224 ) ) ( not ( = ?auto_39219 ?auto_39224 ) ) ( not ( = ?auto_39200 ?auto_39224 ) ) ( not ( = ?auto_39212 ?auto_39224 ) ) ( not ( = ?auto_39207 ?auto_39224 ) ) ( not ( = ?auto_39222 ?auto_39224 ) ) ( SURFACE-AT ?auto_39210 ?auto_39220 ) ( CLEAR ?auto_39210 ) ( IS-CRATE ?auto_39222 ) ( not ( = ?auto_39198 ?auto_39210 ) ) ( not ( = ?auto_39199 ?auto_39210 ) ) ( not ( = ?auto_39205 ?auto_39210 ) ) ( not ( = ?auto_39217 ?auto_39210 ) ) ( not ( = ?auto_39216 ?auto_39210 ) ) ( not ( = ?auto_39223 ?auto_39210 ) ) ( not ( = ?auto_39204 ?auto_39210 ) ) ( not ( = ?auto_39219 ?auto_39210 ) ) ( not ( = ?auto_39200 ?auto_39210 ) ) ( not ( = ?auto_39212 ?auto_39210 ) ) ( not ( = ?auto_39207 ?auto_39210 ) ) ( not ( = ?auto_39222 ?auto_39210 ) ) ( not ( = ?auto_39224 ?auto_39210 ) ) ( AVAILABLE ?auto_39203 ) ( TRUCK-AT ?auto_39209 ?auto_39213 ) ( LIFTING ?auto_39214 ?auto_39222 ) )
    :subtasks
    ( ( !LOAD ?auto_39214 ?auto_39222 ?auto_39209 ?auto_39213 )
      ( MAKE-ON ?auto_39198 ?auto_39199 )
      ( MAKE-ON-VERIFY ?auto_39198 ?auto_39199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39227 - SURFACE
      ?auto_39228 - SURFACE
    )
    :vars
    (
      ?auto_39239 - HOIST
      ?auto_39252 - PLACE
      ?auto_39229 - PLACE
      ?auto_39245 - HOIST
      ?auto_39231 - SURFACE
      ?auto_39249 - SURFACE
      ?auto_39241 - PLACE
      ?auto_39255 - HOIST
      ?auto_39248 - SURFACE
      ?auto_39247 - SURFACE
      ?auto_39250 - PLACE
      ?auto_39242 - HOIST
      ?auto_39243 - SURFACE
      ?auto_39251 - SURFACE
      ?auto_39238 - PLACE
      ?auto_39230 - HOIST
      ?auto_39235 - SURFACE
      ?auto_39233 - SURFACE
      ?auto_39246 - PLACE
      ?auto_39240 - HOIST
      ?auto_39236 - SURFACE
      ?auto_39254 - SURFACE
      ?auto_39237 - PLACE
      ?auto_39253 - HOIST
      ?auto_39244 - SURFACE
      ?auto_39234 - SURFACE
      ?auto_39232 - TRUCK
      ?auto_39256 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39239 ?auto_39252 ) ( IS-CRATE ?auto_39227 ) ( not ( = ?auto_39227 ?auto_39228 ) ) ( not ( = ?auto_39229 ?auto_39252 ) ) ( HOIST-AT ?auto_39245 ?auto_39229 ) ( not ( = ?auto_39239 ?auto_39245 ) ) ( AVAILABLE ?auto_39245 ) ( SURFACE-AT ?auto_39227 ?auto_39229 ) ( ON ?auto_39227 ?auto_39231 ) ( CLEAR ?auto_39227 ) ( not ( = ?auto_39227 ?auto_39231 ) ) ( not ( = ?auto_39228 ?auto_39231 ) ) ( IS-CRATE ?auto_39228 ) ( not ( = ?auto_39227 ?auto_39249 ) ) ( not ( = ?auto_39228 ?auto_39249 ) ) ( not ( = ?auto_39231 ?auto_39249 ) ) ( not ( = ?auto_39241 ?auto_39252 ) ) ( not ( = ?auto_39229 ?auto_39241 ) ) ( HOIST-AT ?auto_39255 ?auto_39241 ) ( not ( = ?auto_39239 ?auto_39255 ) ) ( not ( = ?auto_39245 ?auto_39255 ) ) ( AVAILABLE ?auto_39255 ) ( SURFACE-AT ?auto_39228 ?auto_39241 ) ( ON ?auto_39228 ?auto_39248 ) ( CLEAR ?auto_39228 ) ( not ( = ?auto_39227 ?auto_39248 ) ) ( not ( = ?auto_39228 ?auto_39248 ) ) ( not ( = ?auto_39231 ?auto_39248 ) ) ( not ( = ?auto_39249 ?auto_39248 ) ) ( IS-CRATE ?auto_39249 ) ( not ( = ?auto_39227 ?auto_39247 ) ) ( not ( = ?auto_39228 ?auto_39247 ) ) ( not ( = ?auto_39231 ?auto_39247 ) ) ( not ( = ?auto_39249 ?auto_39247 ) ) ( not ( = ?auto_39248 ?auto_39247 ) ) ( not ( = ?auto_39250 ?auto_39252 ) ) ( not ( = ?auto_39229 ?auto_39250 ) ) ( not ( = ?auto_39241 ?auto_39250 ) ) ( HOIST-AT ?auto_39242 ?auto_39250 ) ( not ( = ?auto_39239 ?auto_39242 ) ) ( not ( = ?auto_39245 ?auto_39242 ) ) ( not ( = ?auto_39255 ?auto_39242 ) ) ( AVAILABLE ?auto_39242 ) ( SURFACE-AT ?auto_39249 ?auto_39250 ) ( ON ?auto_39249 ?auto_39243 ) ( CLEAR ?auto_39249 ) ( not ( = ?auto_39227 ?auto_39243 ) ) ( not ( = ?auto_39228 ?auto_39243 ) ) ( not ( = ?auto_39231 ?auto_39243 ) ) ( not ( = ?auto_39249 ?auto_39243 ) ) ( not ( = ?auto_39248 ?auto_39243 ) ) ( not ( = ?auto_39247 ?auto_39243 ) ) ( IS-CRATE ?auto_39247 ) ( not ( = ?auto_39227 ?auto_39251 ) ) ( not ( = ?auto_39228 ?auto_39251 ) ) ( not ( = ?auto_39231 ?auto_39251 ) ) ( not ( = ?auto_39249 ?auto_39251 ) ) ( not ( = ?auto_39248 ?auto_39251 ) ) ( not ( = ?auto_39247 ?auto_39251 ) ) ( not ( = ?auto_39243 ?auto_39251 ) ) ( not ( = ?auto_39238 ?auto_39252 ) ) ( not ( = ?auto_39229 ?auto_39238 ) ) ( not ( = ?auto_39241 ?auto_39238 ) ) ( not ( = ?auto_39250 ?auto_39238 ) ) ( HOIST-AT ?auto_39230 ?auto_39238 ) ( not ( = ?auto_39239 ?auto_39230 ) ) ( not ( = ?auto_39245 ?auto_39230 ) ) ( not ( = ?auto_39255 ?auto_39230 ) ) ( not ( = ?auto_39242 ?auto_39230 ) ) ( SURFACE-AT ?auto_39247 ?auto_39238 ) ( ON ?auto_39247 ?auto_39235 ) ( CLEAR ?auto_39247 ) ( not ( = ?auto_39227 ?auto_39235 ) ) ( not ( = ?auto_39228 ?auto_39235 ) ) ( not ( = ?auto_39231 ?auto_39235 ) ) ( not ( = ?auto_39249 ?auto_39235 ) ) ( not ( = ?auto_39248 ?auto_39235 ) ) ( not ( = ?auto_39247 ?auto_39235 ) ) ( not ( = ?auto_39243 ?auto_39235 ) ) ( not ( = ?auto_39251 ?auto_39235 ) ) ( IS-CRATE ?auto_39251 ) ( not ( = ?auto_39227 ?auto_39233 ) ) ( not ( = ?auto_39228 ?auto_39233 ) ) ( not ( = ?auto_39231 ?auto_39233 ) ) ( not ( = ?auto_39249 ?auto_39233 ) ) ( not ( = ?auto_39248 ?auto_39233 ) ) ( not ( = ?auto_39247 ?auto_39233 ) ) ( not ( = ?auto_39243 ?auto_39233 ) ) ( not ( = ?auto_39251 ?auto_39233 ) ) ( not ( = ?auto_39235 ?auto_39233 ) ) ( not ( = ?auto_39246 ?auto_39252 ) ) ( not ( = ?auto_39229 ?auto_39246 ) ) ( not ( = ?auto_39241 ?auto_39246 ) ) ( not ( = ?auto_39250 ?auto_39246 ) ) ( not ( = ?auto_39238 ?auto_39246 ) ) ( HOIST-AT ?auto_39240 ?auto_39246 ) ( not ( = ?auto_39239 ?auto_39240 ) ) ( not ( = ?auto_39245 ?auto_39240 ) ) ( not ( = ?auto_39255 ?auto_39240 ) ) ( not ( = ?auto_39242 ?auto_39240 ) ) ( not ( = ?auto_39230 ?auto_39240 ) ) ( AVAILABLE ?auto_39240 ) ( SURFACE-AT ?auto_39251 ?auto_39246 ) ( ON ?auto_39251 ?auto_39236 ) ( CLEAR ?auto_39251 ) ( not ( = ?auto_39227 ?auto_39236 ) ) ( not ( = ?auto_39228 ?auto_39236 ) ) ( not ( = ?auto_39231 ?auto_39236 ) ) ( not ( = ?auto_39249 ?auto_39236 ) ) ( not ( = ?auto_39248 ?auto_39236 ) ) ( not ( = ?auto_39247 ?auto_39236 ) ) ( not ( = ?auto_39243 ?auto_39236 ) ) ( not ( = ?auto_39251 ?auto_39236 ) ) ( not ( = ?auto_39235 ?auto_39236 ) ) ( not ( = ?auto_39233 ?auto_39236 ) ) ( IS-CRATE ?auto_39233 ) ( not ( = ?auto_39227 ?auto_39254 ) ) ( not ( = ?auto_39228 ?auto_39254 ) ) ( not ( = ?auto_39231 ?auto_39254 ) ) ( not ( = ?auto_39249 ?auto_39254 ) ) ( not ( = ?auto_39248 ?auto_39254 ) ) ( not ( = ?auto_39247 ?auto_39254 ) ) ( not ( = ?auto_39243 ?auto_39254 ) ) ( not ( = ?auto_39251 ?auto_39254 ) ) ( not ( = ?auto_39235 ?auto_39254 ) ) ( not ( = ?auto_39233 ?auto_39254 ) ) ( not ( = ?auto_39236 ?auto_39254 ) ) ( not ( = ?auto_39237 ?auto_39252 ) ) ( not ( = ?auto_39229 ?auto_39237 ) ) ( not ( = ?auto_39241 ?auto_39237 ) ) ( not ( = ?auto_39250 ?auto_39237 ) ) ( not ( = ?auto_39238 ?auto_39237 ) ) ( not ( = ?auto_39246 ?auto_39237 ) ) ( HOIST-AT ?auto_39253 ?auto_39237 ) ( not ( = ?auto_39239 ?auto_39253 ) ) ( not ( = ?auto_39245 ?auto_39253 ) ) ( not ( = ?auto_39255 ?auto_39253 ) ) ( not ( = ?auto_39242 ?auto_39253 ) ) ( not ( = ?auto_39230 ?auto_39253 ) ) ( not ( = ?auto_39240 ?auto_39253 ) ) ( AVAILABLE ?auto_39253 ) ( SURFACE-AT ?auto_39233 ?auto_39237 ) ( ON ?auto_39233 ?auto_39244 ) ( CLEAR ?auto_39233 ) ( not ( = ?auto_39227 ?auto_39244 ) ) ( not ( = ?auto_39228 ?auto_39244 ) ) ( not ( = ?auto_39231 ?auto_39244 ) ) ( not ( = ?auto_39249 ?auto_39244 ) ) ( not ( = ?auto_39248 ?auto_39244 ) ) ( not ( = ?auto_39247 ?auto_39244 ) ) ( not ( = ?auto_39243 ?auto_39244 ) ) ( not ( = ?auto_39251 ?auto_39244 ) ) ( not ( = ?auto_39235 ?auto_39244 ) ) ( not ( = ?auto_39233 ?auto_39244 ) ) ( not ( = ?auto_39236 ?auto_39244 ) ) ( not ( = ?auto_39254 ?auto_39244 ) ) ( SURFACE-AT ?auto_39234 ?auto_39252 ) ( CLEAR ?auto_39234 ) ( IS-CRATE ?auto_39254 ) ( not ( = ?auto_39227 ?auto_39234 ) ) ( not ( = ?auto_39228 ?auto_39234 ) ) ( not ( = ?auto_39231 ?auto_39234 ) ) ( not ( = ?auto_39249 ?auto_39234 ) ) ( not ( = ?auto_39248 ?auto_39234 ) ) ( not ( = ?auto_39247 ?auto_39234 ) ) ( not ( = ?auto_39243 ?auto_39234 ) ) ( not ( = ?auto_39251 ?auto_39234 ) ) ( not ( = ?auto_39235 ?auto_39234 ) ) ( not ( = ?auto_39233 ?auto_39234 ) ) ( not ( = ?auto_39236 ?auto_39234 ) ) ( not ( = ?auto_39254 ?auto_39234 ) ) ( not ( = ?auto_39244 ?auto_39234 ) ) ( AVAILABLE ?auto_39239 ) ( TRUCK-AT ?auto_39232 ?auto_39238 ) ( AVAILABLE ?auto_39230 ) ( SURFACE-AT ?auto_39254 ?auto_39238 ) ( ON ?auto_39254 ?auto_39256 ) ( CLEAR ?auto_39254 ) ( not ( = ?auto_39227 ?auto_39256 ) ) ( not ( = ?auto_39228 ?auto_39256 ) ) ( not ( = ?auto_39231 ?auto_39256 ) ) ( not ( = ?auto_39249 ?auto_39256 ) ) ( not ( = ?auto_39248 ?auto_39256 ) ) ( not ( = ?auto_39247 ?auto_39256 ) ) ( not ( = ?auto_39243 ?auto_39256 ) ) ( not ( = ?auto_39251 ?auto_39256 ) ) ( not ( = ?auto_39235 ?auto_39256 ) ) ( not ( = ?auto_39233 ?auto_39256 ) ) ( not ( = ?auto_39236 ?auto_39256 ) ) ( not ( = ?auto_39254 ?auto_39256 ) ) ( not ( = ?auto_39244 ?auto_39256 ) ) ( not ( = ?auto_39234 ?auto_39256 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39230 ?auto_39254 ?auto_39256 ?auto_39238 )
      ( MAKE-ON ?auto_39227 ?auto_39228 )
      ( MAKE-ON-VERIFY ?auto_39227 ?auto_39228 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39257 - SURFACE
      ?auto_39258 - SURFACE
    )
    :vars
    (
      ?auto_39263 - HOIST
      ?auto_39273 - PLACE
      ?auto_39285 - PLACE
      ?auto_39274 - HOIST
      ?auto_39265 - SURFACE
      ?auto_39278 - SURFACE
      ?auto_39266 - PLACE
      ?auto_39282 - HOIST
      ?auto_39277 - SURFACE
      ?auto_39276 - SURFACE
      ?auto_39279 - PLACE
      ?auto_39270 - HOIST
      ?auto_39262 - SURFACE
      ?auto_39261 - SURFACE
      ?auto_39264 - PLACE
      ?auto_39272 - HOIST
      ?auto_39259 - SURFACE
      ?auto_39271 - SURFACE
      ?auto_39275 - PLACE
      ?auto_39283 - HOIST
      ?auto_39268 - SURFACE
      ?auto_39281 - SURFACE
      ?auto_39284 - PLACE
      ?auto_39280 - HOIST
      ?auto_39260 - SURFACE
      ?auto_39269 - SURFACE
      ?auto_39286 - SURFACE
      ?auto_39267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39263 ?auto_39273 ) ( IS-CRATE ?auto_39257 ) ( not ( = ?auto_39257 ?auto_39258 ) ) ( not ( = ?auto_39285 ?auto_39273 ) ) ( HOIST-AT ?auto_39274 ?auto_39285 ) ( not ( = ?auto_39263 ?auto_39274 ) ) ( AVAILABLE ?auto_39274 ) ( SURFACE-AT ?auto_39257 ?auto_39285 ) ( ON ?auto_39257 ?auto_39265 ) ( CLEAR ?auto_39257 ) ( not ( = ?auto_39257 ?auto_39265 ) ) ( not ( = ?auto_39258 ?auto_39265 ) ) ( IS-CRATE ?auto_39258 ) ( not ( = ?auto_39257 ?auto_39278 ) ) ( not ( = ?auto_39258 ?auto_39278 ) ) ( not ( = ?auto_39265 ?auto_39278 ) ) ( not ( = ?auto_39266 ?auto_39273 ) ) ( not ( = ?auto_39285 ?auto_39266 ) ) ( HOIST-AT ?auto_39282 ?auto_39266 ) ( not ( = ?auto_39263 ?auto_39282 ) ) ( not ( = ?auto_39274 ?auto_39282 ) ) ( AVAILABLE ?auto_39282 ) ( SURFACE-AT ?auto_39258 ?auto_39266 ) ( ON ?auto_39258 ?auto_39277 ) ( CLEAR ?auto_39258 ) ( not ( = ?auto_39257 ?auto_39277 ) ) ( not ( = ?auto_39258 ?auto_39277 ) ) ( not ( = ?auto_39265 ?auto_39277 ) ) ( not ( = ?auto_39278 ?auto_39277 ) ) ( IS-CRATE ?auto_39278 ) ( not ( = ?auto_39257 ?auto_39276 ) ) ( not ( = ?auto_39258 ?auto_39276 ) ) ( not ( = ?auto_39265 ?auto_39276 ) ) ( not ( = ?auto_39278 ?auto_39276 ) ) ( not ( = ?auto_39277 ?auto_39276 ) ) ( not ( = ?auto_39279 ?auto_39273 ) ) ( not ( = ?auto_39285 ?auto_39279 ) ) ( not ( = ?auto_39266 ?auto_39279 ) ) ( HOIST-AT ?auto_39270 ?auto_39279 ) ( not ( = ?auto_39263 ?auto_39270 ) ) ( not ( = ?auto_39274 ?auto_39270 ) ) ( not ( = ?auto_39282 ?auto_39270 ) ) ( AVAILABLE ?auto_39270 ) ( SURFACE-AT ?auto_39278 ?auto_39279 ) ( ON ?auto_39278 ?auto_39262 ) ( CLEAR ?auto_39278 ) ( not ( = ?auto_39257 ?auto_39262 ) ) ( not ( = ?auto_39258 ?auto_39262 ) ) ( not ( = ?auto_39265 ?auto_39262 ) ) ( not ( = ?auto_39278 ?auto_39262 ) ) ( not ( = ?auto_39277 ?auto_39262 ) ) ( not ( = ?auto_39276 ?auto_39262 ) ) ( IS-CRATE ?auto_39276 ) ( not ( = ?auto_39257 ?auto_39261 ) ) ( not ( = ?auto_39258 ?auto_39261 ) ) ( not ( = ?auto_39265 ?auto_39261 ) ) ( not ( = ?auto_39278 ?auto_39261 ) ) ( not ( = ?auto_39277 ?auto_39261 ) ) ( not ( = ?auto_39276 ?auto_39261 ) ) ( not ( = ?auto_39262 ?auto_39261 ) ) ( not ( = ?auto_39264 ?auto_39273 ) ) ( not ( = ?auto_39285 ?auto_39264 ) ) ( not ( = ?auto_39266 ?auto_39264 ) ) ( not ( = ?auto_39279 ?auto_39264 ) ) ( HOIST-AT ?auto_39272 ?auto_39264 ) ( not ( = ?auto_39263 ?auto_39272 ) ) ( not ( = ?auto_39274 ?auto_39272 ) ) ( not ( = ?auto_39282 ?auto_39272 ) ) ( not ( = ?auto_39270 ?auto_39272 ) ) ( SURFACE-AT ?auto_39276 ?auto_39264 ) ( ON ?auto_39276 ?auto_39259 ) ( CLEAR ?auto_39276 ) ( not ( = ?auto_39257 ?auto_39259 ) ) ( not ( = ?auto_39258 ?auto_39259 ) ) ( not ( = ?auto_39265 ?auto_39259 ) ) ( not ( = ?auto_39278 ?auto_39259 ) ) ( not ( = ?auto_39277 ?auto_39259 ) ) ( not ( = ?auto_39276 ?auto_39259 ) ) ( not ( = ?auto_39262 ?auto_39259 ) ) ( not ( = ?auto_39261 ?auto_39259 ) ) ( IS-CRATE ?auto_39261 ) ( not ( = ?auto_39257 ?auto_39271 ) ) ( not ( = ?auto_39258 ?auto_39271 ) ) ( not ( = ?auto_39265 ?auto_39271 ) ) ( not ( = ?auto_39278 ?auto_39271 ) ) ( not ( = ?auto_39277 ?auto_39271 ) ) ( not ( = ?auto_39276 ?auto_39271 ) ) ( not ( = ?auto_39262 ?auto_39271 ) ) ( not ( = ?auto_39261 ?auto_39271 ) ) ( not ( = ?auto_39259 ?auto_39271 ) ) ( not ( = ?auto_39275 ?auto_39273 ) ) ( not ( = ?auto_39285 ?auto_39275 ) ) ( not ( = ?auto_39266 ?auto_39275 ) ) ( not ( = ?auto_39279 ?auto_39275 ) ) ( not ( = ?auto_39264 ?auto_39275 ) ) ( HOIST-AT ?auto_39283 ?auto_39275 ) ( not ( = ?auto_39263 ?auto_39283 ) ) ( not ( = ?auto_39274 ?auto_39283 ) ) ( not ( = ?auto_39282 ?auto_39283 ) ) ( not ( = ?auto_39270 ?auto_39283 ) ) ( not ( = ?auto_39272 ?auto_39283 ) ) ( AVAILABLE ?auto_39283 ) ( SURFACE-AT ?auto_39261 ?auto_39275 ) ( ON ?auto_39261 ?auto_39268 ) ( CLEAR ?auto_39261 ) ( not ( = ?auto_39257 ?auto_39268 ) ) ( not ( = ?auto_39258 ?auto_39268 ) ) ( not ( = ?auto_39265 ?auto_39268 ) ) ( not ( = ?auto_39278 ?auto_39268 ) ) ( not ( = ?auto_39277 ?auto_39268 ) ) ( not ( = ?auto_39276 ?auto_39268 ) ) ( not ( = ?auto_39262 ?auto_39268 ) ) ( not ( = ?auto_39261 ?auto_39268 ) ) ( not ( = ?auto_39259 ?auto_39268 ) ) ( not ( = ?auto_39271 ?auto_39268 ) ) ( IS-CRATE ?auto_39271 ) ( not ( = ?auto_39257 ?auto_39281 ) ) ( not ( = ?auto_39258 ?auto_39281 ) ) ( not ( = ?auto_39265 ?auto_39281 ) ) ( not ( = ?auto_39278 ?auto_39281 ) ) ( not ( = ?auto_39277 ?auto_39281 ) ) ( not ( = ?auto_39276 ?auto_39281 ) ) ( not ( = ?auto_39262 ?auto_39281 ) ) ( not ( = ?auto_39261 ?auto_39281 ) ) ( not ( = ?auto_39259 ?auto_39281 ) ) ( not ( = ?auto_39271 ?auto_39281 ) ) ( not ( = ?auto_39268 ?auto_39281 ) ) ( not ( = ?auto_39284 ?auto_39273 ) ) ( not ( = ?auto_39285 ?auto_39284 ) ) ( not ( = ?auto_39266 ?auto_39284 ) ) ( not ( = ?auto_39279 ?auto_39284 ) ) ( not ( = ?auto_39264 ?auto_39284 ) ) ( not ( = ?auto_39275 ?auto_39284 ) ) ( HOIST-AT ?auto_39280 ?auto_39284 ) ( not ( = ?auto_39263 ?auto_39280 ) ) ( not ( = ?auto_39274 ?auto_39280 ) ) ( not ( = ?auto_39282 ?auto_39280 ) ) ( not ( = ?auto_39270 ?auto_39280 ) ) ( not ( = ?auto_39272 ?auto_39280 ) ) ( not ( = ?auto_39283 ?auto_39280 ) ) ( AVAILABLE ?auto_39280 ) ( SURFACE-AT ?auto_39271 ?auto_39284 ) ( ON ?auto_39271 ?auto_39260 ) ( CLEAR ?auto_39271 ) ( not ( = ?auto_39257 ?auto_39260 ) ) ( not ( = ?auto_39258 ?auto_39260 ) ) ( not ( = ?auto_39265 ?auto_39260 ) ) ( not ( = ?auto_39278 ?auto_39260 ) ) ( not ( = ?auto_39277 ?auto_39260 ) ) ( not ( = ?auto_39276 ?auto_39260 ) ) ( not ( = ?auto_39262 ?auto_39260 ) ) ( not ( = ?auto_39261 ?auto_39260 ) ) ( not ( = ?auto_39259 ?auto_39260 ) ) ( not ( = ?auto_39271 ?auto_39260 ) ) ( not ( = ?auto_39268 ?auto_39260 ) ) ( not ( = ?auto_39281 ?auto_39260 ) ) ( SURFACE-AT ?auto_39269 ?auto_39273 ) ( CLEAR ?auto_39269 ) ( IS-CRATE ?auto_39281 ) ( not ( = ?auto_39257 ?auto_39269 ) ) ( not ( = ?auto_39258 ?auto_39269 ) ) ( not ( = ?auto_39265 ?auto_39269 ) ) ( not ( = ?auto_39278 ?auto_39269 ) ) ( not ( = ?auto_39277 ?auto_39269 ) ) ( not ( = ?auto_39276 ?auto_39269 ) ) ( not ( = ?auto_39262 ?auto_39269 ) ) ( not ( = ?auto_39261 ?auto_39269 ) ) ( not ( = ?auto_39259 ?auto_39269 ) ) ( not ( = ?auto_39271 ?auto_39269 ) ) ( not ( = ?auto_39268 ?auto_39269 ) ) ( not ( = ?auto_39281 ?auto_39269 ) ) ( not ( = ?auto_39260 ?auto_39269 ) ) ( AVAILABLE ?auto_39263 ) ( AVAILABLE ?auto_39272 ) ( SURFACE-AT ?auto_39281 ?auto_39264 ) ( ON ?auto_39281 ?auto_39286 ) ( CLEAR ?auto_39281 ) ( not ( = ?auto_39257 ?auto_39286 ) ) ( not ( = ?auto_39258 ?auto_39286 ) ) ( not ( = ?auto_39265 ?auto_39286 ) ) ( not ( = ?auto_39278 ?auto_39286 ) ) ( not ( = ?auto_39277 ?auto_39286 ) ) ( not ( = ?auto_39276 ?auto_39286 ) ) ( not ( = ?auto_39262 ?auto_39286 ) ) ( not ( = ?auto_39261 ?auto_39286 ) ) ( not ( = ?auto_39259 ?auto_39286 ) ) ( not ( = ?auto_39271 ?auto_39286 ) ) ( not ( = ?auto_39268 ?auto_39286 ) ) ( not ( = ?auto_39281 ?auto_39286 ) ) ( not ( = ?auto_39260 ?auto_39286 ) ) ( not ( = ?auto_39269 ?auto_39286 ) ) ( TRUCK-AT ?auto_39267 ?auto_39273 ) )
    :subtasks
    ( ( !DRIVE ?auto_39267 ?auto_39273 ?auto_39264 )
      ( MAKE-ON ?auto_39257 ?auto_39258 )
      ( MAKE-ON-VERIFY ?auto_39257 ?auto_39258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39287 - SURFACE
      ?auto_39288 - SURFACE
    )
    :vars
    (
      ?auto_39300 - HOIST
      ?auto_39297 - PLACE
      ?auto_39290 - PLACE
      ?auto_39310 - HOIST
      ?auto_39304 - SURFACE
      ?auto_39306 - SURFACE
      ?auto_39314 - PLACE
      ?auto_39295 - HOIST
      ?auto_39298 - SURFACE
      ?auto_39293 - SURFACE
      ?auto_39307 - PLACE
      ?auto_39311 - HOIST
      ?auto_39305 - SURFACE
      ?auto_39303 - SURFACE
      ?auto_39302 - PLACE
      ?auto_39301 - HOIST
      ?auto_39296 - SURFACE
      ?auto_39315 - SURFACE
      ?auto_39294 - PLACE
      ?auto_39291 - HOIST
      ?auto_39299 - SURFACE
      ?auto_39309 - SURFACE
      ?auto_39292 - PLACE
      ?auto_39308 - HOIST
      ?auto_39313 - SURFACE
      ?auto_39316 - SURFACE
      ?auto_39289 - SURFACE
      ?auto_39312 - TRUCK
      ?auto_39317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39300 ?auto_39297 ) ( IS-CRATE ?auto_39287 ) ( not ( = ?auto_39287 ?auto_39288 ) ) ( not ( = ?auto_39290 ?auto_39297 ) ) ( HOIST-AT ?auto_39310 ?auto_39290 ) ( not ( = ?auto_39300 ?auto_39310 ) ) ( AVAILABLE ?auto_39310 ) ( SURFACE-AT ?auto_39287 ?auto_39290 ) ( ON ?auto_39287 ?auto_39304 ) ( CLEAR ?auto_39287 ) ( not ( = ?auto_39287 ?auto_39304 ) ) ( not ( = ?auto_39288 ?auto_39304 ) ) ( IS-CRATE ?auto_39288 ) ( not ( = ?auto_39287 ?auto_39306 ) ) ( not ( = ?auto_39288 ?auto_39306 ) ) ( not ( = ?auto_39304 ?auto_39306 ) ) ( not ( = ?auto_39314 ?auto_39297 ) ) ( not ( = ?auto_39290 ?auto_39314 ) ) ( HOIST-AT ?auto_39295 ?auto_39314 ) ( not ( = ?auto_39300 ?auto_39295 ) ) ( not ( = ?auto_39310 ?auto_39295 ) ) ( AVAILABLE ?auto_39295 ) ( SURFACE-AT ?auto_39288 ?auto_39314 ) ( ON ?auto_39288 ?auto_39298 ) ( CLEAR ?auto_39288 ) ( not ( = ?auto_39287 ?auto_39298 ) ) ( not ( = ?auto_39288 ?auto_39298 ) ) ( not ( = ?auto_39304 ?auto_39298 ) ) ( not ( = ?auto_39306 ?auto_39298 ) ) ( IS-CRATE ?auto_39306 ) ( not ( = ?auto_39287 ?auto_39293 ) ) ( not ( = ?auto_39288 ?auto_39293 ) ) ( not ( = ?auto_39304 ?auto_39293 ) ) ( not ( = ?auto_39306 ?auto_39293 ) ) ( not ( = ?auto_39298 ?auto_39293 ) ) ( not ( = ?auto_39307 ?auto_39297 ) ) ( not ( = ?auto_39290 ?auto_39307 ) ) ( not ( = ?auto_39314 ?auto_39307 ) ) ( HOIST-AT ?auto_39311 ?auto_39307 ) ( not ( = ?auto_39300 ?auto_39311 ) ) ( not ( = ?auto_39310 ?auto_39311 ) ) ( not ( = ?auto_39295 ?auto_39311 ) ) ( AVAILABLE ?auto_39311 ) ( SURFACE-AT ?auto_39306 ?auto_39307 ) ( ON ?auto_39306 ?auto_39305 ) ( CLEAR ?auto_39306 ) ( not ( = ?auto_39287 ?auto_39305 ) ) ( not ( = ?auto_39288 ?auto_39305 ) ) ( not ( = ?auto_39304 ?auto_39305 ) ) ( not ( = ?auto_39306 ?auto_39305 ) ) ( not ( = ?auto_39298 ?auto_39305 ) ) ( not ( = ?auto_39293 ?auto_39305 ) ) ( IS-CRATE ?auto_39293 ) ( not ( = ?auto_39287 ?auto_39303 ) ) ( not ( = ?auto_39288 ?auto_39303 ) ) ( not ( = ?auto_39304 ?auto_39303 ) ) ( not ( = ?auto_39306 ?auto_39303 ) ) ( not ( = ?auto_39298 ?auto_39303 ) ) ( not ( = ?auto_39293 ?auto_39303 ) ) ( not ( = ?auto_39305 ?auto_39303 ) ) ( not ( = ?auto_39302 ?auto_39297 ) ) ( not ( = ?auto_39290 ?auto_39302 ) ) ( not ( = ?auto_39314 ?auto_39302 ) ) ( not ( = ?auto_39307 ?auto_39302 ) ) ( HOIST-AT ?auto_39301 ?auto_39302 ) ( not ( = ?auto_39300 ?auto_39301 ) ) ( not ( = ?auto_39310 ?auto_39301 ) ) ( not ( = ?auto_39295 ?auto_39301 ) ) ( not ( = ?auto_39311 ?auto_39301 ) ) ( SURFACE-AT ?auto_39293 ?auto_39302 ) ( ON ?auto_39293 ?auto_39296 ) ( CLEAR ?auto_39293 ) ( not ( = ?auto_39287 ?auto_39296 ) ) ( not ( = ?auto_39288 ?auto_39296 ) ) ( not ( = ?auto_39304 ?auto_39296 ) ) ( not ( = ?auto_39306 ?auto_39296 ) ) ( not ( = ?auto_39298 ?auto_39296 ) ) ( not ( = ?auto_39293 ?auto_39296 ) ) ( not ( = ?auto_39305 ?auto_39296 ) ) ( not ( = ?auto_39303 ?auto_39296 ) ) ( IS-CRATE ?auto_39303 ) ( not ( = ?auto_39287 ?auto_39315 ) ) ( not ( = ?auto_39288 ?auto_39315 ) ) ( not ( = ?auto_39304 ?auto_39315 ) ) ( not ( = ?auto_39306 ?auto_39315 ) ) ( not ( = ?auto_39298 ?auto_39315 ) ) ( not ( = ?auto_39293 ?auto_39315 ) ) ( not ( = ?auto_39305 ?auto_39315 ) ) ( not ( = ?auto_39303 ?auto_39315 ) ) ( not ( = ?auto_39296 ?auto_39315 ) ) ( not ( = ?auto_39294 ?auto_39297 ) ) ( not ( = ?auto_39290 ?auto_39294 ) ) ( not ( = ?auto_39314 ?auto_39294 ) ) ( not ( = ?auto_39307 ?auto_39294 ) ) ( not ( = ?auto_39302 ?auto_39294 ) ) ( HOIST-AT ?auto_39291 ?auto_39294 ) ( not ( = ?auto_39300 ?auto_39291 ) ) ( not ( = ?auto_39310 ?auto_39291 ) ) ( not ( = ?auto_39295 ?auto_39291 ) ) ( not ( = ?auto_39311 ?auto_39291 ) ) ( not ( = ?auto_39301 ?auto_39291 ) ) ( AVAILABLE ?auto_39291 ) ( SURFACE-AT ?auto_39303 ?auto_39294 ) ( ON ?auto_39303 ?auto_39299 ) ( CLEAR ?auto_39303 ) ( not ( = ?auto_39287 ?auto_39299 ) ) ( not ( = ?auto_39288 ?auto_39299 ) ) ( not ( = ?auto_39304 ?auto_39299 ) ) ( not ( = ?auto_39306 ?auto_39299 ) ) ( not ( = ?auto_39298 ?auto_39299 ) ) ( not ( = ?auto_39293 ?auto_39299 ) ) ( not ( = ?auto_39305 ?auto_39299 ) ) ( not ( = ?auto_39303 ?auto_39299 ) ) ( not ( = ?auto_39296 ?auto_39299 ) ) ( not ( = ?auto_39315 ?auto_39299 ) ) ( IS-CRATE ?auto_39315 ) ( not ( = ?auto_39287 ?auto_39309 ) ) ( not ( = ?auto_39288 ?auto_39309 ) ) ( not ( = ?auto_39304 ?auto_39309 ) ) ( not ( = ?auto_39306 ?auto_39309 ) ) ( not ( = ?auto_39298 ?auto_39309 ) ) ( not ( = ?auto_39293 ?auto_39309 ) ) ( not ( = ?auto_39305 ?auto_39309 ) ) ( not ( = ?auto_39303 ?auto_39309 ) ) ( not ( = ?auto_39296 ?auto_39309 ) ) ( not ( = ?auto_39315 ?auto_39309 ) ) ( not ( = ?auto_39299 ?auto_39309 ) ) ( not ( = ?auto_39292 ?auto_39297 ) ) ( not ( = ?auto_39290 ?auto_39292 ) ) ( not ( = ?auto_39314 ?auto_39292 ) ) ( not ( = ?auto_39307 ?auto_39292 ) ) ( not ( = ?auto_39302 ?auto_39292 ) ) ( not ( = ?auto_39294 ?auto_39292 ) ) ( HOIST-AT ?auto_39308 ?auto_39292 ) ( not ( = ?auto_39300 ?auto_39308 ) ) ( not ( = ?auto_39310 ?auto_39308 ) ) ( not ( = ?auto_39295 ?auto_39308 ) ) ( not ( = ?auto_39311 ?auto_39308 ) ) ( not ( = ?auto_39301 ?auto_39308 ) ) ( not ( = ?auto_39291 ?auto_39308 ) ) ( AVAILABLE ?auto_39308 ) ( SURFACE-AT ?auto_39315 ?auto_39292 ) ( ON ?auto_39315 ?auto_39313 ) ( CLEAR ?auto_39315 ) ( not ( = ?auto_39287 ?auto_39313 ) ) ( not ( = ?auto_39288 ?auto_39313 ) ) ( not ( = ?auto_39304 ?auto_39313 ) ) ( not ( = ?auto_39306 ?auto_39313 ) ) ( not ( = ?auto_39298 ?auto_39313 ) ) ( not ( = ?auto_39293 ?auto_39313 ) ) ( not ( = ?auto_39305 ?auto_39313 ) ) ( not ( = ?auto_39303 ?auto_39313 ) ) ( not ( = ?auto_39296 ?auto_39313 ) ) ( not ( = ?auto_39315 ?auto_39313 ) ) ( not ( = ?auto_39299 ?auto_39313 ) ) ( not ( = ?auto_39309 ?auto_39313 ) ) ( IS-CRATE ?auto_39309 ) ( not ( = ?auto_39287 ?auto_39316 ) ) ( not ( = ?auto_39288 ?auto_39316 ) ) ( not ( = ?auto_39304 ?auto_39316 ) ) ( not ( = ?auto_39306 ?auto_39316 ) ) ( not ( = ?auto_39298 ?auto_39316 ) ) ( not ( = ?auto_39293 ?auto_39316 ) ) ( not ( = ?auto_39305 ?auto_39316 ) ) ( not ( = ?auto_39303 ?auto_39316 ) ) ( not ( = ?auto_39296 ?auto_39316 ) ) ( not ( = ?auto_39315 ?auto_39316 ) ) ( not ( = ?auto_39299 ?auto_39316 ) ) ( not ( = ?auto_39309 ?auto_39316 ) ) ( not ( = ?auto_39313 ?auto_39316 ) ) ( AVAILABLE ?auto_39301 ) ( SURFACE-AT ?auto_39309 ?auto_39302 ) ( ON ?auto_39309 ?auto_39289 ) ( CLEAR ?auto_39309 ) ( not ( = ?auto_39287 ?auto_39289 ) ) ( not ( = ?auto_39288 ?auto_39289 ) ) ( not ( = ?auto_39304 ?auto_39289 ) ) ( not ( = ?auto_39306 ?auto_39289 ) ) ( not ( = ?auto_39298 ?auto_39289 ) ) ( not ( = ?auto_39293 ?auto_39289 ) ) ( not ( = ?auto_39305 ?auto_39289 ) ) ( not ( = ?auto_39303 ?auto_39289 ) ) ( not ( = ?auto_39296 ?auto_39289 ) ) ( not ( = ?auto_39315 ?auto_39289 ) ) ( not ( = ?auto_39299 ?auto_39289 ) ) ( not ( = ?auto_39309 ?auto_39289 ) ) ( not ( = ?auto_39313 ?auto_39289 ) ) ( not ( = ?auto_39316 ?auto_39289 ) ) ( TRUCK-AT ?auto_39312 ?auto_39297 ) ( SURFACE-AT ?auto_39317 ?auto_39297 ) ( CLEAR ?auto_39317 ) ( LIFTING ?auto_39300 ?auto_39316 ) ( IS-CRATE ?auto_39316 ) ( not ( = ?auto_39287 ?auto_39317 ) ) ( not ( = ?auto_39288 ?auto_39317 ) ) ( not ( = ?auto_39304 ?auto_39317 ) ) ( not ( = ?auto_39306 ?auto_39317 ) ) ( not ( = ?auto_39298 ?auto_39317 ) ) ( not ( = ?auto_39293 ?auto_39317 ) ) ( not ( = ?auto_39305 ?auto_39317 ) ) ( not ( = ?auto_39303 ?auto_39317 ) ) ( not ( = ?auto_39296 ?auto_39317 ) ) ( not ( = ?auto_39315 ?auto_39317 ) ) ( not ( = ?auto_39299 ?auto_39317 ) ) ( not ( = ?auto_39309 ?auto_39317 ) ) ( not ( = ?auto_39313 ?auto_39317 ) ) ( not ( = ?auto_39316 ?auto_39317 ) ) ( not ( = ?auto_39289 ?auto_39317 ) ) )
    :subtasks
    ( ( !DROP ?auto_39300 ?auto_39316 ?auto_39317 ?auto_39297 )
      ( MAKE-ON ?auto_39287 ?auto_39288 )
      ( MAKE-ON-VERIFY ?auto_39287 ?auto_39288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39318 - SURFACE
      ?auto_39319 - SURFACE
    )
    :vars
    (
      ?auto_39342 - HOIST
      ?auto_39340 - PLACE
      ?auto_39333 - PLACE
      ?auto_39334 - HOIST
      ?auto_39336 - SURFACE
      ?auto_39321 - SURFACE
      ?auto_39327 - PLACE
      ?auto_39344 - HOIST
      ?auto_39346 - SURFACE
      ?auto_39347 - SURFACE
      ?auto_39320 - PLACE
      ?auto_39335 - HOIST
      ?auto_39322 - SURFACE
      ?auto_39343 - SURFACE
      ?auto_39341 - PLACE
      ?auto_39329 - HOIST
      ?auto_39330 - SURFACE
      ?auto_39328 - SURFACE
      ?auto_39331 - PLACE
      ?auto_39332 - HOIST
      ?auto_39345 - SURFACE
      ?auto_39325 - SURFACE
      ?auto_39338 - PLACE
      ?auto_39324 - HOIST
      ?auto_39323 - SURFACE
      ?auto_39339 - SURFACE
      ?auto_39337 - SURFACE
      ?auto_39326 - TRUCK
      ?auto_39348 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39342 ?auto_39340 ) ( IS-CRATE ?auto_39318 ) ( not ( = ?auto_39318 ?auto_39319 ) ) ( not ( = ?auto_39333 ?auto_39340 ) ) ( HOIST-AT ?auto_39334 ?auto_39333 ) ( not ( = ?auto_39342 ?auto_39334 ) ) ( AVAILABLE ?auto_39334 ) ( SURFACE-AT ?auto_39318 ?auto_39333 ) ( ON ?auto_39318 ?auto_39336 ) ( CLEAR ?auto_39318 ) ( not ( = ?auto_39318 ?auto_39336 ) ) ( not ( = ?auto_39319 ?auto_39336 ) ) ( IS-CRATE ?auto_39319 ) ( not ( = ?auto_39318 ?auto_39321 ) ) ( not ( = ?auto_39319 ?auto_39321 ) ) ( not ( = ?auto_39336 ?auto_39321 ) ) ( not ( = ?auto_39327 ?auto_39340 ) ) ( not ( = ?auto_39333 ?auto_39327 ) ) ( HOIST-AT ?auto_39344 ?auto_39327 ) ( not ( = ?auto_39342 ?auto_39344 ) ) ( not ( = ?auto_39334 ?auto_39344 ) ) ( AVAILABLE ?auto_39344 ) ( SURFACE-AT ?auto_39319 ?auto_39327 ) ( ON ?auto_39319 ?auto_39346 ) ( CLEAR ?auto_39319 ) ( not ( = ?auto_39318 ?auto_39346 ) ) ( not ( = ?auto_39319 ?auto_39346 ) ) ( not ( = ?auto_39336 ?auto_39346 ) ) ( not ( = ?auto_39321 ?auto_39346 ) ) ( IS-CRATE ?auto_39321 ) ( not ( = ?auto_39318 ?auto_39347 ) ) ( not ( = ?auto_39319 ?auto_39347 ) ) ( not ( = ?auto_39336 ?auto_39347 ) ) ( not ( = ?auto_39321 ?auto_39347 ) ) ( not ( = ?auto_39346 ?auto_39347 ) ) ( not ( = ?auto_39320 ?auto_39340 ) ) ( not ( = ?auto_39333 ?auto_39320 ) ) ( not ( = ?auto_39327 ?auto_39320 ) ) ( HOIST-AT ?auto_39335 ?auto_39320 ) ( not ( = ?auto_39342 ?auto_39335 ) ) ( not ( = ?auto_39334 ?auto_39335 ) ) ( not ( = ?auto_39344 ?auto_39335 ) ) ( AVAILABLE ?auto_39335 ) ( SURFACE-AT ?auto_39321 ?auto_39320 ) ( ON ?auto_39321 ?auto_39322 ) ( CLEAR ?auto_39321 ) ( not ( = ?auto_39318 ?auto_39322 ) ) ( not ( = ?auto_39319 ?auto_39322 ) ) ( not ( = ?auto_39336 ?auto_39322 ) ) ( not ( = ?auto_39321 ?auto_39322 ) ) ( not ( = ?auto_39346 ?auto_39322 ) ) ( not ( = ?auto_39347 ?auto_39322 ) ) ( IS-CRATE ?auto_39347 ) ( not ( = ?auto_39318 ?auto_39343 ) ) ( not ( = ?auto_39319 ?auto_39343 ) ) ( not ( = ?auto_39336 ?auto_39343 ) ) ( not ( = ?auto_39321 ?auto_39343 ) ) ( not ( = ?auto_39346 ?auto_39343 ) ) ( not ( = ?auto_39347 ?auto_39343 ) ) ( not ( = ?auto_39322 ?auto_39343 ) ) ( not ( = ?auto_39341 ?auto_39340 ) ) ( not ( = ?auto_39333 ?auto_39341 ) ) ( not ( = ?auto_39327 ?auto_39341 ) ) ( not ( = ?auto_39320 ?auto_39341 ) ) ( HOIST-AT ?auto_39329 ?auto_39341 ) ( not ( = ?auto_39342 ?auto_39329 ) ) ( not ( = ?auto_39334 ?auto_39329 ) ) ( not ( = ?auto_39344 ?auto_39329 ) ) ( not ( = ?auto_39335 ?auto_39329 ) ) ( SURFACE-AT ?auto_39347 ?auto_39341 ) ( ON ?auto_39347 ?auto_39330 ) ( CLEAR ?auto_39347 ) ( not ( = ?auto_39318 ?auto_39330 ) ) ( not ( = ?auto_39319 ?auto_39330 ) ) ( not ( = ?auto_39336 ?auto_39330 ) ) ( not ( = ?auto_39321 ?auto_39330 ) ) ( not ( = ?auto_39346 ?auto_39330 ) ) ( not ( = ?auto_39347 ?auto_39330 ) ) ( not ( = ?auto_39322 ?auto_39330 ) ) ( not ( = ?auto_39343 ?auto_39330 ) ) ( IS-CRATE ?auto_39343 ) ( not ( = ?auto_39318 ?auto_39328 ) ) ( not ( = ?auto_39319 ?auto_39328 ) ) ( not ( = ?auto_39336 ?auto_39328 ) ) ( not ( = ?auto_39321 ?auto_39328 ) ) ( not ( = ?auto_39346 ?auto_39328 ) ) ( not ( = ?auto_39347 ?auto_39328 ) ) ( not ( = ?auto_39322 ?auto_39328 ) ) ( not ( = ?auto_39343 ?auto_39328 ) ) ( not ( = ?auto_39330 ?auto_39328 ) ) ( not ( = ?auto_39331 ?auto_39340 ) ) ( not ( = ?auto_39333 ?auto_39331 ) ) ( not ( = ?auto_39327 ?auto_39331 ) ) ( not ( = ?auto_39320 ?auto_39331 ) ) ( not ( = ?auto_39341 ?auto_39331 ) ) ( HOIST-AT ?auto_39332 ?auto_39331 ) ( not ( = ?auto_39342 ?auto_39332 ) ) ( not ( = ?auto_39334 ?auto_39332 ) ) ( not ( = ?auto_39344 ?auto_39332 ) ) ( not ( = ?auto_39335 ?auto_39332 ) ) ( not ( = ?auto_39329 ?auto_39332 ) ) ( AVAILABLE ?auto_39332 ) ( SURFACE-AT ?auto_39343 ?auto_39331 ) ( ON ?auto_39343 ?auto_39345 ) ( CLEAR ?auto_39343 ) ( not ( = ?auto_39318 ?auto_39345 ) ) ( not ( = ?auto_39319 ?auto_39345 ) ) ( not ( = ?auto_39336 ?auto_39345 ) ) ( not ( = ?auto_39321 ?auto_39345 ) ) ( not ( = ?auto_39346 ?auto_39345 ) ) ( not ( = ?auto_39347 ?auto_39345 ) ) ( not ( = ?auto_39322 ?auto_39345 ) ) ( not ( = ?auto_39343 ?auto_39345 ) ) ( not ( = ?auto_39330 ?auto_39345 ) ) ( not ( = ?auto_39328 ?auto_39345 ) ) ( IS-CRATE ?auto_39328 ) ( not ( = ?auto_39318 ?auto_39325 ) ) ( not ( = ?auto_39319 ?auto_39325 ) ) ( not ( = ?auto_39336 ?auto_39325 ) ) ( not ( = ?auto_39321 ?auto_39325 ) ) ( not ( = ?auto_39346 ?auto_39325 ) ) ( not ( = ?auto_39347 ?auto_39325 ) ) ( not ( = ?auto_39322 ?auto_39325 ) ) ( not ( = ?auto_39343 ?auto_39325 ) ) ( not ( = ?auto_39330 ?auto_39325 ) ) ( not ( = ?auto_39328 ?auto_39325 ) ) ( not ( = ?auto_39345 ?auto_39325 ) ) ( not ( = ?auto_39338 ?auto_39340 ) ) ( not ( = ?auto_39333 ?auto_39338 ) ) ( not ( = ?auto_39327 ?auto_39338 ) ) ( not ( = ?auto_39320 ?auto_39338 ) ) ( not ( = ?auto_39341 ?auto_39338 ) ) ( not ( = ?auto_39331 ?auto_39338 ) ) ( HOIST-AT ?auto_39324 ?auto_39338 ) ( not ( = ?auto_39342 ?auto_39324 ) ) ( not ( = ?auto_39334 ?auto_39324 ) ) ( not ( = ?auto_39344 ?auto_39324 ) ) ( not ( = ?auto_39335 ?auto_39324 ) ) ( not ( = ?auto_39329 ?auto_39324 ) ) ( not ( = ?auto_39332 ?auto_39324 ) ) ( AVAILABLE ?auto_39324 ) ( SURFACE-AT ?auto_39328 ?auto_39338 ) ( ON ?auto_39328 ?auto_39323 ) ( CLEAR ?auto_39328 ) ( not ( = ?auto_39318 ?auto_39323 ) ) ( not ( = ?auto_39319 ?auto_39323 ) ) ( not ( = ?auto_39336 ?auto_39323 ) ) ( not ( = ?auto_39321 ?auto_39323 ) ) ( not ( = ?auto_39346 ?auto_39323 ) ) ( not ( = ?auto_39347 ?auto_39323 ) ) ( not ( = ?auto_39322 ?auto_39323 ) ) ( not ( = ?auto_39343 ?auto_39323 ) ) ( not ( = ?auto_39330 ?auto_39323 ) ) ( not ( = ?auto_39328 ?auto_39323 ) ) ( not ( = ?auto_39345 ?auto_39323 ) ) ( not ( = ?auto_39325 ?auto_39323 ) ) ( IS-CRATE ?auto_39325 ) ( not ( = ?auto_39318 ?auto_39339 ) ) ( not ( = ?auto_39319 ?auto_39339 ) ) ( not ( = ?auto_39336 ?auto_39339 ) ) ( not ( = ?auto_39321 ?auto_39339 ) ) ( not ( = ?auto_39346 ?auto_39339 ) ) ( not ( = ?auto_39347 ?auto_39339 ) ) ( not ( = ?auto_39322 ?auto_39339 ) ) ( not ( = ?auto_39343 ?auto_39339 ) ) ( not ( = ?auto_39330 ?auto_39339 ) ) ( not ( = ?auto_39328 ?auto_39339 ) ) ( not ( = ?auto_39345 ?auto_39339 ) ) ( not ( = ?auto_39325 ?auto_39339 ) ) ( not ( = ?auto_39323 ?auto_39339 ) ) ( AVAILABLE ?auto_39329 ) ( SURFACE-AT ?auto_39325 ?auto_39341 ) ( ON ?auto_39325 ?auto_39337 ) ( CLEAR ?auto_39325 ) ( not ( = ?auto_39318 ?auto_39337 ) ) ( not ( = ?auto_39319 ?auto_39337 ) ) ( not ( = ?auto_39336 ?auto_39337 ) ) ( not ( = ?auto_39321 ?auto_39337 ) ) ( not ( = ?auto_39346 ?auto_39337 ) ) ( not ( = ?auto_39347 ?auto_39337 ) ) ( not ( = ?auto_39322 ?auto_39337 ) ) ( not ( = ?auto_39343 ?auto_39337 ) ) ( not ( = ?auto_39330 ?auto_39337 ) ) ( not ( = ?auto_39328 ?auto_39337 ) ) ( not ( = ?auto_39345 ?auto_39337 ) ) ( not ( = ?auto_39325 ?auto_39337 ) ) ( not ( = ?auto_39323 ?auto_39337 ) ) ( not ( = ?auto_39339 ?auto_39337 ) ) ( TRUCK-AT ?auto_39326 ?auto_39340 ) ( SURFACE-AT ?auto_39348 ?auto_39340 ) ( CLEAR ?auto_39348 ) ( IS-CRATE ?auto_39339 ) ( not ( = ?auto_39318 ?auto_39348 ) ) ( not ( = ?auto_39319 ?auto_39348 ) ) ( not ( = ?auto_39336 ?auto_39348 ) ) ( not ( = ?auto_39321 ?auto_39348 ) ) ( not ( = ?auto_39346 ?auto_39348 ) ) ( not ( = ?auto_39347 ?auto_39348 ) ) ( not ( = ?auto_39322 ?auto_39348 ) ) ( not ( = ?auto_39343 ?auto_39348 ) ) ( not ( = ?auto_39330 ?auto_39348 ) ) ( not ( = ?auto_39328 ?auto_39348 ) ) ( not ( = ?auto_39345 ?auto_39348 ) ) ( not ( = ?auto_39325 ?auto_39348 ) ) ( not ( = ?auto_39323 ?auto_39348 ) ) ( not ( = ?auto_39339 ?auto_39348 ) ) ( not ( = ?auto_39337 ?auto_39348 ) ) ( AVAILABLE ?auto_39342 ) ( IN ?auto_39339 ?auto_39326 ) )
    :subtasks
    ( ( !UNLOAD ?auto_39342 ?auto_39339 ?auto_39326 ?auto_39340 )
      ( MAKE-ON ?auto_39318 ?auto_39319 )
      ( MAKE-ON-VERIFY ?auto_39318 ?auto_39319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39349 - SURFACE
      ?auto_39350 - SURFACE
    )
    :vars
    (
      ?auto_39375 - HOIST
      ?auto_39373 - PLACE
      ?auto_39377 - PLACE
      ?auto_39378 - HOIST
      ?auto_39369 - SURFACE
      ?auto_39358 - SURFACE
      ?auto_39351 - PLACE
      ?auto_39357 - HOIST
      ?auto_39365 - SURFACE
      ?auto_39366 - SURFACE
      ?auto_39355 - PLACE
      ?auto_39376 - HOIST
      ?auto_39356 - SURFACE
      ?auto_39368 - SURFACE
      ?auto_39374 - PLACE
      ?auto_39354 - HOIST
      ?auto_39363 - SURFACE
      ?auto_39360 - SURFACE
      ?auto_39353 - PLACE
      ?auto_39352 - HOIST
      ?auto_39361 - SURFACE
      ?auto_39364 - SURFACE
      ?auto_39371 - PLACE
      ?auto_39379 - HOIST
      ?auto_39362 - SURFACE
      ?auto_39372 - SURFACE
      ?auto_39370 - SURFACE
      ?auto_39367 - SURFACE
      ?auto_39359 - TRUCK
      ?auto_39380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39375 ?auto_39373 ) ( IS-CRATE ?auto_39349 ) ( not ( = ?auto_39349 ?auto_39350 ) ) ( not ( = ?auto_39377 ?auto_39373 ) ) ( HOIST-AT ?auto_39378 ?auto_39377 ) ( not ( = ?auto_39375 ?auto_39378 ) ) ( AVAILABLE ?auto_39378 ) ( SURFACE-AT ?auto_39349 ?auto_39377 ) ( ON ?auto_39349 ?auto_39369 ) ( CLEAR ?auto_39349 ) ( not ( = ?auto_39349 ?auto_39369 ) ) ( not ( = ?auto_39350 ?auto_39369 ) ) ( IS-CRATE ?auto_39350 ) ( not ( = ?auto_39349 ?auto_39358 ) ) ( not ( = ?auto_39350 ?auto_39358 ) ) ( not ( = ?auto_39369 ?auto_39358 ) ) ( not ( = ?auto_39351 ?auto_39373 ) ) ( not ( = ?auto_39377 ?auto_39351 ) ) ( HOIST-AT ?auto_39357 ?auto_39351 ) ( not ( = ?auto_39375 ?auto_39357 ) ) ( not ( = ?auto_39378 ?auto_39357 ) ) ( AVAILABLE ?auto_39357 ) ( SURFACE-AT ?auto_39350 ?auto_39351 ) ( ON ?auto_39350 ?auto_39365 ) ( CLEAR ?auto_39350 ) ( not ( = ?auto_39349 ?auto_39365 ) ) ( not ( = ?auto_39350 ?auto_39365 ) ) ( not ( = ?auto_39369 ?auto_39365 ) ) ( not ( = ?auto_39358 ?auto_39365 ) ) ( IS-CRATE ?auto_39358 ) ( not ( = ?auto_39349 ?auto_39366 ) ) ( not ( = ?auto_39350 ?auto_39366 ) ) ( not ( = ?auto_39369 ?auto_39366 ) ) ( not ( = ?auto_39358 ?auto_39366 ) ) ( not ( = ?auto_39365 ?auto_39366 ) ) ( not ( = ?auto_39355 ?auto_39373 ) ) ( not ( = ?auto_39377 ?auto_39355 ) ) ( not ( = ?auto_39351 ?auto_39355 ) ) ( HOIST-AT ?auto_39376 ?auto_39355 ) ( not ( = ?auto_39375 ?auto_39376 ) ) ( not ( = ?auto_39378 ?auto_39376 ) ) ( not ( = ?auto_39357 ?auto_39376 ) ) ( AVAILABLE ?auto_39376 ) ( SURFACE-AT ?auto_39358 ?auto_39355 ) ( ON ?auto_39358 ?auto_39356 ) ( CLEAR ?auto_39358 ) ( not ( = ?auto_39349 ?auto_39356 ) ) ( not ( = ?auto_39350 ?auto_39356 ) ) ( not ( = ?auto_39369 ?auto_39356 ) ) ( not ( = ?auto_39358 ?auto_39356 ) ) ( not ( = ?auto_39365 ?auto_39356 ) ) ( not ( = ?auto_39366 ?auto_39356 ) ) ( IS-CRATE ?auto_39366 ) ( not ( = ?auto_39349 ?auto_39368 ) ) ( not ( = ?auto_39350 ?auto_39368 ) ) ( not ( = ?auto_39369 ?auto_39368 ) ) ( not ( = ?auto_39358 ?auto_39368 ) ) ( not ( = ?auto_39365 ?auto_39368 ) ) ( not ( = ?auto_39366 ?auto_39368 ) ) ( not ( = ?auto_39356 ?auto_39368 ) ) ( not ( = ?auto_39374 ?auto_39373 ) ) ( not ( = ?auto_39377 ?auto_39374 ) ) ( not ( = ?auto_39351 ?auto_39374 ) ) ( not ( = ?auto_39355 ?auto_39374 ) ) ( HOIST-AT ?auto_39354 ?auto_39374 ) ( not ( = ?auto_39375 ?auto_39354 ) ) ( not ( = ?auto_39378 ?auto_39354 ) ) ( not ( = ?auto_39357 ?auto_39354 ) ) ( not ( = ?auto_39376 ?auto_39354 ) ) ( SURFACE-AT ?auto_39366 ?auto_39374 ) ( ON ?auto_39366 ?auto_39363 ) ( CLEAR ?auto_39366 ) ( not ( = ?auto_39349 ?auto_39363 ) ) ( not ( = ?auto_39350 ?auto_39363 ) ) ( not ( = ?auto_39369 ?auto_39363 ) ) ( not ( = ?auto_39358 ?auto_39363 ) ) ( not ( = ?auto_39365 ?auto_39363 ) ) ( not ( = ?auto_39366 ?auto_39363 ) ) ( not ( = ?auto_39356 ?auto_39363 ) ) ( not ( = ?auto_39368 ?auto_39363 ) ) ( IS-CRATE ?auto_39368 ) ( not ( = ?auto_39349 ?auto_39360 ) ) ( not ( = ?auto_39350 ?auto_39360 ) ) ( not ( = ?auto_39369 ?auto_39360 ) ) ( not ( = ?auto_39358 ?auto_39360 ) ) ( not ( = ?auto_39365 ?auto_39360 ) ) ( not ( = ?auto_39366 ?auto_39360 ) ) ( not ( = ?auto_39356 ?auto_39360 ) ) ( not ( = ?auto_39368 ?auto_39360 ) ) ( not ( = ?auto_39363 ?auto_39360 ) ) ( not ( = ?auto_39353 ?auto_39373 ) ) ( not ( = ?auto_39377 ?auto_39353 ) ) ( not ( = ?auto_39351 ?auto_39353 ) ) ( not ( = ?auto_39355 ?auto_39353 ) ) ( not ( = ?auto_39374 ?auto_39353 ) ) ( HOIST-AT ?auto_39352 ?auto_39353 ) ( not ( = ?auto_39375 ?auto_39352 ) ) ( not ( = ?auto_39378 ?auto_39352 ) ) ( not ( = ?auto_39357 ?auto_39352 ) ) ( not ( = ?auto_39376 ?auto_39352 ) ) ( not ( = ?auto_39354 ?auto_39352 ) ) ( AVAILABLE ?auto_39352 ) ( SURFACE-AT ?auto_39368 ?auto_39353 ) ( ON ?auto_39368 ?auto_39361 ) ( CLEAR ?auto_39368 ) ( not ( = ?auto_39349 ?auto_39361 ) ) ( not ( = ?auto_39350 ?auto_39361 ) ) ( not ( = ?auto_39369 ?auto_39361 ) ) ( not ( = ?auto_39358 ?auto_39361 ) ) ( not ( = ?auto_39365 ?auto_39361 ) ) ( not ( = ?auto_39366 ?auto_39361 ) ) ( not ( = ?auto_39356 ?auto_39361 ) ) ( not ( = ?auto_39368 ?auto_39361 ) ) ( not ( = ?auto_39363 ?auto_39361 ) ) ( not ( = ?auto_39360 ?auto_39361 ) ) ( IS-CRATE ?auto_39360 ) ( not ( = ?auto_39349 ?auto_39364 ) ) ( not ( = ?auto_39350 ?auto_39364 ) ) ( not ( = ?auto_39369 ?auto_39364 ) ) ( not ( = ?auto_39358 ?auto_39364 ) ) ( not ( = ?auto_39365 ?auto_39364 ) ) ( not ( = ?auto_39366 ?auto_39364 ) ) ( not ( = ?auto_39356 ?auto_39364 ) ) ( not ( = ?auto_39368 ?auto_39364 ) ) ( not ( = ?auto_39363 ?auto_39364 ) ) ( not ( = ?auto_39360 ?auto_39364 ) ) ( not ( = ?auto_39361 ?auto_39364 ) ) ( not ( = ?auto_39371 ?auto_39373 ) ) ( not ( = ?auto_39377 ?auto_39371 ) ) ( not ( = ?auto_39351 ?auto_39371 ) ) ( not ( = ?auto_39355 ?auto_39371 ) ) ( not ( = ?auto_39374 ?auto_39371 ) ) ( not ( = ?auto_39353 ?auto_39371 ) ) ( HOIST-AT ?auto_39379 ?auto_39371 ) ( not ( = ?auto_39375 ?auto_39379 ) ) ( not ( = ?auto_39378 ?auto_39379 ) ) ( not ( = ?auto_39357 ?auto_39379 ) ) ( not ( = ?auto_39376 ?auto_39379 ) ) ( not ( = ?auto_39354 ?auto_39379 ) ) ( not ( = ?auto_39352 ?auto_39379 ) ) ( AVAILABLE ?auto_39379 ) ( SURFACE-AT ?auto_39360 ?auto_39371 ) ( ON ?auto_39360 ?auto_39362 ) ( CLEAR ?auto_39360 ) ( not ( = ?auto_39349 ?auto_39362 ) ) ( not ( = ?auto_39350 ?auto_39362 ) ) ( not ( = ?auto_39369 ?auto_39362 ) ) ( not ( = ?auto_39358 ?auto_39362 ) ) ( not ( = ?auto_39365 ?auto_39362 ) ) ( not ( = ?auto_39366 ?auto_39362 ) ) ( not ( = ?auto_39356 ?auto_39362 ) ) ( not ( = ?auto_39368 ?auto_39362 ) ) ( not ( = ?auto_39363 ?auto_39362 ) ) ( not ( = ?auto_39360 ?auto_39362 ) ) ( not ( = ?auto_39361 ?auto_39362 ) ) ( not ( = ?auto_39364 ?auto_39362 ) ) ( IS-CRATE ?auto_39364 ) ( not ( = ?auto_39349 ?auto_39372 ) ) ( not ( = ?auto_39350 ?auto_39372 ) ) ( not ( = ?auto_39369 ?auto_39372 ) ) ( not ( = ?auto_39358 ?auto_39372 ) ) ( not ( = ?auto_39365 ?auto_39372 ) ) ( not ( = ?auto_39366 ?auto_39372 ) ) ( not ( = ?auto_39356 ?auto_39372 ) ) ( not ( = ?auto_39368 ?auto_39372 ) ) ( not ( = ?auto_39363 ?auto_39372 ) ) ( not ( = ?auto_39360 ?auto_39372 ) ) ( not ( = ?auto_39361 ?auto_39372 ) ) ( not ( = ?auto_39364 ?auto_39372 ) ) ( not ( = ?auto_39362 ?auto_39372 ) ) ( AVAILABLE ?auto_39354 ) ( SURFACE-AT ?auto_39364 ?auto_39374 ) ( ON ?auto_39364 ?auto_39370 ) ( CLEAR ?auto_39364 ) ( not ( = ?auto_39349 ?auto_39370 ) ) ( not ( = ?auto_39350 ?auto_39370 ) ) ( not ( = ?auto_39369 ?auto_39370 ) ) ( not ( = ?auto_39358 ?auto_39370 ) ) ( not ( = ?auto_39365 ?auto_39370 ) ) ( not ( = ?auto_39366 ?auto_39370 ) ) ( not ( = ?auto_39356 ?auto_39370 ) ) ( not ( = ?auto_39368 ?auto_39370 ) ) ( not ( = ?auto_39363 ?auto_39370 ) ) ( not ( = ?auto_39360 ?auto_39370 ) ) ( not ( = ?auto_39361 ?auto_39370 ) ) ( not ( = ?auto_39364 ?auto_39370 ) ) ( not ( = ?auto_39362 ?auto_39370 ) ) ( not ( = ?auto_39372 ?auto_39370 ) ) ( SURFACE-AT ?auto_39367 ?auto_39373 ) ( CLEAR ?auto_39367 ) ( IS-CRATE ?auto_39372 ) ( not ( = ?auto_39349 ?auto_39367 ) ) ( not ( = ?auto_39350 ?auto_39367 ) ) ( not ( = ?auto_39369 ?auto_39367 ) ) ( not ( = ?auto_39358 ?auto_39367 ) ) ( not ( = ?auto_39365 ?auto_39367 ) ) ( not ( = ?auto_39366 ?auto_39367 ) ) ( not ( = ?auto_39356 ?auto_39367 ) ) ( not ( = ?auto_39368 ?auto_39367 ) ) ( not ( = ?auto_39363 ?auto_39367 ) ) ( not ( = ?auto_39360 ?auto_39367 ) ) ( not ( = ?auto_39361 ?auto_39367 ) ) ( not ( = ?auto_39364 ?auto_39367 ) ) ( not ( = ?auto_39362 ?auto_39367 ) ) ( not ( = ?auto_39372 ?auto_39367 ) ) ( not ( = ?auto_39370 ?auto_39367 ) ) ( AVAILABLE ?auto_39375 ) ( IN ?auto_39372 ?auto_39359 ) ( TRUCK-AT ?auto_39359 ?auto_39380 ) ( not ( = ?auto_39380 ?auto_39373 ) ) ( not ( = ?auto_39377 ?auto_39380 ) ) ( not ( = ?auto_39351 ?auto_39380 ) ) ( not ( = ?auto_39355 ?auto_39380 ) ) ( not ( = ?auto_39374 ?auto_39380 ) ) ( not ( = ?auto_39353 ?auto_39380 ) ) ( not ( = ?auto_39371 ?auto_39380 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39359 ?auto_39380 ?auto_39373 )
      ( MAKE-ON ?auto_39349 ?auto_39350 )
      ( MAKE-ON-VERIFY ?auto_39349 ?auto_39350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39381 - SURFACE
      ?auto_39382 - SURFACE
    )
    :vars
    (
      ?auto_39407 - HOIST
      ?auto_39391 - PLACE
      ?auto_39383 - PLACE
      ?auto_39384 - HOIST
      ?auto_39387 - SURFACE
      ?auto_39404 - SURFACE
      ?auto_39400 - PLACE
      ?auto_39402 - HOIST
      ?auto_39411 - SURFACE
      ?auto_39401 - SURFACE
      ?auto_39394 - PLACE
      ?auto_39408 - HOIST
      ?auto_39403 - SURFACE
      ?auto_39398 - SURFACE
      ?auto_39396 - PLACE
      ?auto_39393 - HOIST
      ?auto_39409 - SURFACE
      ?auto_39385 - SURFACE
      ?auto_39405 - PLACE
      ?auto_39406 - HOIST
      ?auto_39410 - SURFACE
      ?auto_39386 - SURFACE
      ?auto_39389 - PLACE
      ?auto_39392 - HOIST
      ?auto_39395 - SURFACE
      ?auto_39390 - SURFACE
      ?auto_39388 - SURFACE
      ?auto_39397 - SURFACE
      ?auto_39399 - TRUCK
      ?auto_39412 - PLACE
      ?auto_39413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39407 ?auto_39391 ) ( IS-CRATE ?auto_39381 ) ( not ( = ?auto_39381 ?auto_39382 ) ) ( not ( = ?auto_39383 ?auto_39391 ) ) ( HOIST-AT ?auto_39384 ?auto_39383 ) ( not ( = ?auto_39407 ?auto_39384 ) ) ( AVAILABLE ?auto_39384 ) ( SURFACE-AT ?auto_39381 ?auto_39383 ) ( ON ?auto_39381 ?auto_39387 ) ( CLEAR ?auto_39381 ) ( not ( = ?auto_39381 ?auto_39387 ) ) ( not ( = ?auto_39382 ?auto_39387 ) ) ( IS-CRATE ?auto_39382 ) ( not ( = ?auto_39381 ?auto_39404 ) ) ( not ( = ?auto_39382 ?auto_39404 ) ) ( not ( = ?auto_39387 ?auto_39404 ) ) ( not ( = ?auto_39400 ?auto_39391 ) ) ( not ( = ?auto_39383 ?auto_39400 ) ) ( HOIST-AT ?auto_39402 ?auto_39400 ) ( not ( = ?auto_39407 ?auto_39402 ) ) ( not ( = ?auto_39384 ?auto_39402 ) ) ( AVAILABLE ?auto_39402 ) ( SURFACE-AT ?auto_39382 ?auto_39400 ) ( ON ?auto_39382 ?auto_39411 ) ( CLEAR ?auto_39382 ) ( not ( = ?auto_39381 ?auto_39411 ) ) ( not ( = ?auto_39382 ?auto_39411 ) ) ( not ( = ?auto_39387 ?auto_39411 ) ) ( not ( = ?auto_39404 ?auto_39411 ) ) ( IS-CRATE ?auto_39404 ) ( not ( = ?auto_39381 ?auto_39401 ) ) ( not ( = ?auto_39382 ?auto_39401 ) ) ( not ( = ?auto_39387 ?auto_39401 ) ) ( not ( = ?auto_39404 ?auto_39401 ) ) ( not ( = ?auto_39411 ?auto_39401 ) ) ( not ( = ?auto_39394 ?auto_39391 ) ) ( not ( = ?auto_39383 ?auto_39394 ) ) ( not ( = ?auto_39400 ?auto_39394 ) ) ( HOIST-AT ?auto_39408 ?auto_39394 ) ( not ( = ?auto_39407 ?auto_39408 ) ) ( not ( = ?auto_39384 ?auto_39408 ) ) ( not ( = ?auto_39402 ?auto_39408 ) ) ( AVAILABLE ?auto_39408 ) ( SURFACE-AT ?auto_39404 ?auto_39394 ) ( ON ?auto_39404 ?auto_39403 ) ( CLEAR ?auto_39404 ) ( not ( = ?auto_39381 ?auto_39403 ) ) ( not ( = ?auto_39382 ?auto_39403 ) ) ( not ( = ?auto_39387 ?auto_39403 ) ) ( not ( = ?auto_39404 ?auto_39403 ) ) ( not ( = ?auto_39411 ?auto_39403 ) ) ( not ( = ?auto_39401 ?auto_39403 ) ) ( IS-CRATE ?auto_39401 ) ( not ( = ?auto_39381 ?auto_39398 ) ) ( not ( = ?auto_39382 ?auto_39398 ) ) ( not ( = ?auto_39387 ?auto_39398 ) ) ( not ( = ?auto_39404 ?auto_39398 ) ) ( not ( = ?auto_39411 ?auto_39398 ) ) ( not ( = ?auto_39401 ?auto_39398 ) ) ( not ( = ?auto_39403 ?auto_39398 ) ) ( not ( = ?auto_39396 ?auto_39391 ) ) ( not ( = ?auto_39383 ?auto_39396 ) ) ( not ( = ?auto_39400 ?auto_39396 ) ) ( not ( = ?auto_39394 ?auto_39396 ) ) ( HOIST-AT ?auto_39393 ?auto_39396 ) ( not ( = ?auto_39407 ?auto_39393 ) ) ( not ( = ?auto_39384 ?auto_39393 ) ) ( not ( = ?auto_39402 ?auto_39393 ) ) ( not ( = ?auto_39408 ?auto_39393 ) ) ( SURFACE-AT ?auto_39401 ?auto_39396 ) ( ON ?auto_39401 ?auto_39409 ) ( CLEAR ?auto_39401 ) ( not ( = ?auto_39381 ?auto_39409 ) ) ( not ( = ?auto_39382 ?auto_39409 ) ) ( not ( = ?auto_39387 ?auto_39409 ) ) ( not ( = ?auto_39404 ?auto_39409 ) ) ( not ( = ?auto_39411 ?auto_39409 ) ) ( not ( = ?auto_39401 ?auto_39409 ) ) ( not ( = ?auto_39403 ?auto_39409 ) ) ( not ( = ?auto_39398 ?auto_39409 ) ) ( IS-CRATE ?auto_39398 ) ( not ( = ?auto_39381 ?auto_39385 ) ) ( not ( = ?auto_39382 ?auto_39385 ) ) ( not ( = ?auto_39387 ?auto_39385 ) ) ( not ( = ?auto_39404 ?auto_39385 ) ) ( not ( = ?auto_39411 ?auto_39385 ) ) ( not ( = ?auto_39401 ?auto_39385 ) ) ( not ( = ?auto_39403 ?auto_39385 ) ) ( not ( = ?auto_39398 ?auto_39385 ) ) ( not ( = ?auto_39409 ?auto_39385 ) ) ( not ( = ?auto_39405 ?auto_39391 ) ) ( not ( = ?auto_39383 ?auto_39405 ) ) ( not ( = ?auto_39400 ?auto_39405 ) ) ( not ( = ?auto_39394 ?auto_39405 ) ) ( not ( = ?auto_39396 ?auto_39405 ) ) ( HOIST-AT ?auto_39406 ?auto_39405 ) ( not ( = ?auto_39407 ?auto_39406 ) ) ( not ( = ?auto_39384 ?auto_39406 ) ) ( not ( = ?auto_39402 ?auto_39406 ) ) ( not ( = ?auto_39408 ?auto_39406 ) ) ( not ( = ?auto_39393 ?auto_39406 ) ) ( AVAILABLE ?auto_39406 ) ( SURFACE-AT ?auto_39398 ?auto_39405 ) ( ON ?auto_39398 ?auto_39410 ) ( CLEAR ?auto_39398 ) ( not ( = ?auto_39381 ?auto_39410 ) ) ( not ( = ?auto_39382 ?auto_39410 ) ) ( not ( = ?auto_39387 ?auto_39410 ) ) ( not ( = ?auto_39404 ?auto_39410 ) ) ( not ( = ?auto_39411 ?auto_39410 ) ) ( not ( = ?auto_39401 ?auto_39410 ) ) ( not ( = ?auto_39403 ?auto_39410 ) ) ( not ( = ?auto_39398 ?auto_39410 ) ) ( not ( = ?auto_39409 ?auto_39410 ) ) ( not ( = ?auto_39385 ?auto_39410 ) ) ( IS-CRATE ?auto_39385 ) ( not ( = ?auto_39381 ?auto_39386 ) ) ( not ( = ?auto_39382 ?auto_39386 ) ) ( not ( = ?auto_39387 ?auto_39386 ) ) ( not ( = ?auto_39404 ?auto_39386 ) ) ( not ( = ?auto_39411 ?auto_39386 ) ) ( not ( = ?auto_39401 ?auto_39386 ) ) ( not ( = ?auto_39403 ?auto_39386 ) ) ( not ( = ?auto_39398 ?auto_39386 ) ) ( not ( = ?auto_39409 ?auto_39386 ) ) ( not ( = ?auto_39385 ?auto_39386 ) ) ( not ( = ?auto_39410 ?auto_39386 ) ) ( not ( = ?auto_39389 ?auto_39391 ) ) ( not ( = ?auto_39383 ?auto_39389 ) ) ( not ( = ?auto_39400 ?auto_39389 ) ) ( not ( = ?auto_39394 ?auto_39389 ) ) ( not ( = ?auto_39396 ?auto_39389 ) ) ( not ( = ?auto_39405 ?auto_39389 ) ) ( HOIST-AT ?auto_39392 ?auto_39389 ) ( not ( = ?auto_39407 ?auto_39392 ) ) ( not ( = ?auto_39384 ?auto_39392 ) ) ( not ( = ?auto_39402 ?auto_39392 ) ) ( not ( = ?auto_39408 ?auto_39392 ) ) ( not ( = ?auto_39393 ?auto_39392 ) ) ( not ( = ?auto_39406 ?auto_39392 ) ) ( AVAILABLE ?auto_39392 ) ( SURFACE-AT ?auto_39385 ?auto_39389 ) ( ON ?auto_39385 ?auto_39395 ) ( CLEAR ?auto_39385 ) ( not ( = ?auto_39381 ?auto_39395 ) ) ( not ( = ?auto_39382 ?auto_39395 ) ) ( not ( = ?auto_39387 ?auto_39395 ) ) ( not ( = ?auto_39404 ?auto_39395 ) ) ( not ( = ?auto_39411 ?auto_39395 ) ) ( not ( = ?auto_39401 ?auto_39395 ) ) ( not ( = ?auto_39403 ?auto_39395 ) ) ( not ( = ?auto_39398 ?auto_39395 ) ) ( not ( = ?auto_39409 ?auto_39395 ) ) ( not ( = ?auto_39385 ?auto_39395 ) ) ( not ( = ?auto_39410 ?auto_39395 ) ) ( not ( = ?auto_39386 ?auto_39395 ) ) ( IS-CRATE ?auto_39386 ) ( not ( = ?auto_39381 ?auto_39390 ) ) ( not ( = ?auto_39382 ?auto_39390 ) ) ( not ( = ?auto_39387 ?auto_39390 ) ) ( not ( = ?auto_39404 ?auto_39390 ) ) ( not ( = ?auto_39411 ?auto_39390 ) ) ( not ( = ?auto_39401 ?auto_39390 ) ) ( not ( = ?auto_39403 ?auto_39390 ) ) ( not ( = ?auto_39398 ?auto_39390 ) ) ( not ( = ?auto_39409 ?auto_39390 ) ) ( not ( = ?auto_39385 ?auto_39390 ) ) ( not ( = ?auto_39410 ?auto_39390 ) ) ( not ( = ?auto_39386 ?auto_39390 ) ) ( not ( = ?auto_39395 ?auto_39390 ) ) ( AVAILABLE ?auto_39393 ) ( SURFACE-AT ?auto_39386 ?auto_39396 ) ( ON ?auto_39386 ?auto_39388 ) ( CLEAR ?auto_39386 ) ( not ( = ?auto_39381 ?auto_39388 ) ) ( not ( = ?auto_39382 ?auto_39388 ) ) ( not ( = ?auto_39387 ?auto_39388 ) ) ( not ( = ?auto_39404 ?auto_39388 ) ) ( not ( = ?auto_39411 ?auto_39388 ) ) ( not ( = ?auto_39401 ?auto_39388 ) ) ( not ( = ?auto_39403 ?auto_39388 ) ) ( not ( = ?auto_39398 ?auto_39388 ) ) ( not ( = ?auto_39409 ?auto_39388 ) ) ( not ( = ?auto_39385 ?auto_39388 ) ) ( not ( = ?auto_39410 ?auto_39388 ) ) ( not ( = ?auto_39386 ?auto_39388 ) ) ( not ( = ?auto_39395 ?auto_39388 ) ) ( not ( = ?auto_39390 ?auto_39388 ) ) ( SURFACE-AT ?auto_39397 ?auto_39391 ) ( CLEAR ?auto_39397 ) ( IS-CRATE ?auto_39390 ) ( not ( = ?auto_39381 ?auto_39397 ) ) ( not ( = ?auto_39382 ?auto_39397 ) ) ( not ( = ?auto_39387 ?auto_39397 ) ) ( not ( = ?auto_39404 ?auto_39397 ) ) ( not ( = ?auto_39411 ?auto_39397 ) ) ( not ( = ?auto_39401 ?auto_39397 ) ) ( not ( = ?auto_39403 ?auto_39397 ) ) ( not ( = ?auto_39398 ?auto_39397 ) ) ( not ( = ?auto_39409 ?auto_39397 ) ) ( not ( = ?auto_39385 ?auto_39397 ) ) ( not ( = ?auto_39410 ?auto_39397 ) ) ( not ( = ?auto_39386 ?auto_39397 ) ) ( not ( = ?auto_39395 ?auto_39397 ) ) ( not ( = ?auto_39390 ?auto_39397 ) ) ( not ( = ?auto_39388 ?auto_39397 ) ) ( AVAILABLE ?auto_39407 ) ( TRUCK-AT ?auto_39399 ?auto_39412 ) ( not ( = ?auto_39412 ?auto_39391 ) ) ( not ( = ?auto_39383 ?auto_39412 ) ) ( not ( = ?auto_39400 ?auto_39412 ) ) ( not ( = ?auto_39394 ?auto_39412 ) ) ( not ( = ?auto_39396 ?auto_39412 ) ) ( not ( = ?auto_39405 ?auto_39412 ) ) ( not ( = ?auto_39389 ?auto_39412 ) ) ( HOIST-AT ?auto_39413 ?auto_39412 ) ( LIFTING ?auto_39413 ?auto_39390 ) ( not ( = ?auto_39407 ?auto_39413 ) ) ( not ( = ?auto_39384 ?auto_39413 ) ) ( not ( = ?auto_39402 ?auto_39413 ) ) ( not ( = ?auto_39408 ?auto_39413 ) ) ( not ( = ?auto_39393 ?auto_39413 ) ) ( not ( = ?auto_39406 ?auto_39413 ) ) ( not ( = ?auto_39392 ?auto_39413 ) ) )
    :subtasks
    ( ( !LOAD ?auto_39413 ?auto_39390 ?auto_39399 ?auto_39412 )
      ( MAKE-ON ?auto_39381 ?auto_39382 )
      ( MAKE-ON-VERIFY ?auto_39381 ?auto_39382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39414 - SURFACE
      ?auto_39415 - SURFACE
    )
    :vars
    (
      ?auto_39417 - HOIST
      ?auto_39440 - PLACE
      ?auto_39421 - PLACE
      ?auto_39416 - HOIST
      ?auto_39427 - SURFACE
      ?auto_39437 - SURFACE
      ?auto_39433 - PLACE
      ?auto_39435 - HOIST
      ?auto_39429 - SURFACE
      ?auto_39434 - SURFACE
      ?auto_39443 - PLACE
      ?auto_39419 - HOIST
      ?auto_39436 - SURFACE
      ?auto_39439 - SURFACE
      ?auto_39444 - PLACE
      ?auto_39442 - HOIST
      ?auto_39424 - SURFACE
      ?auto_39426 - SURFACE
      ?auto_39438 - PLACE
      ?auto_39431 - HOIST
      ?auto_39428 - SURFACE
      ?auto_39425 - SURFACE
      ?auto_39418 - PLACE
      ?auto_39441 - HOIST
      ?auto_39445 - SURFACE
      ?auto_39446 - SURFACE
      ?auto_39420 - SURFACE
      ?auto_39422 - SURFACE
      ?auto_39432 - TRUCK
      ?auto_39430 - PLACE
      ?auto_39423 - HOIST
      ?auto_39447 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39417 ?auto_39440 ) ( IS-CRATE ?auto_39414 ) ( not ( = ?auto_39414 ?auto_39415 ) ) ( not ( = ?auto_39421 ?auto_39440 ) ) ( HOIST-AT ?auto_39416 ?auto_39421 ) ( not ( = ?auto_39417 ?auto_39416 ) ) ( AVAILABLE ?auto_39416 ) ( SURFACE-AT ?auto_39414 ?auto_39421 ) ( ON ?auto_39414 ?auto_39427 ) ( CLEAR ?auto_39414 ) ( not ( = ?auto_39414 ?auto_39427 ) ) ( not ( = ?auto_39415 ?auto_39427 ) ) ( IS-CRATE ?auto_39415 ) ( not ( = ?auto_39414 ?auto_39437 ) ) ( not ( = ?auto_39415 ?auto_39437 ) ) ( not ( = ?auto_39427 ?auto_39437 ) ) ( not ( = ?auto_39433 ?auto_39440 ) ) ( not ( = ?auto_39421 ?auto_39433 ) ) ( HOIST-AT ?auto_39435 ?auto_39433 ) ( not ( = ?auto_39417 ?auto_39435 ) ) ( not ( = ?auto_39416 ?auto_39435 ) ) ( AVAILABLE ?auto_39435 ) ( SURFACE-AT ?auto_39415 ?auto_39433 ) ( ON ?auto_39415 ?auto_39429 ) ( CLEAR ?auto_39415 ) ( not ( = ?auto_39414 ?auto_39429 ) ) ( not ( = ?auto_39415 ?auto_39429 ) ) ( not ( = ?auto_39427 ?auto_39429 ) ) ( not ( = ?auto_39437 ?auto_39429 ) ) ( IS-CRATE ?auto_39437 ) ( not ( = ?auto_39414 ?auto_39434 ) ) ( not ( = ?auto_39415 ?auto_39434 ) ) ( not ( = ?auto_39427 ?auto_39434 ) ) ( not ( = ?auto_39437 ?auto_39434 ) ) ( not ( = ?auto_39429 ?auto_39434 ) ) ( not ( = ?auto_39443 ?auto_39440 ) ) ( not ( = ?auto_39421 ?auto_39443 ) ) ( not ( = ?auto_39433 ?auto_39443 ) ) ( HOIST-AT ?auto_39419 ?auto_39443 ) ( not ( = ?auto_39417 ?auto_39419 ) ) ( not ( = ?auto_39416 ?auto_39419 ) ) ( not ( = ?auto_39435 ?auto_39419 ) ) ( AVAILABLE ?auto_39419 ) ( SURFACE-AT ?auto_39437 ?auto_39443 ) ( ON ?auto_39437 ?auto_39436 ) ( CLEAR ?auto_39437 ) ( not ( = ?auto_39414 ?auto_39436 ) ) ( not ( = ?auto_39415 ?auto_39436 ) ) ( not ( = ?auto_39427 ?auto_39436 ) ) ( not ( = ?auto_39437 ?auto_39436 ) ) ( not ( = ?auto_39429 ?auto_39436 ) ) ( not ( = ?auto_39434 ?auto_39436 ) ) ( IS-CRATE ?auto_39434 ) ( not ( = ?auto_39414 ?auto_39439 ) ) ( not ( = ?auto_39415 ?auto_39439 ) ) ( not ( = ?auto_39427 ?auto_39439 ) ) ( not ( = ?auto_39437 ?auto_39439 ) ) ( not ( = ?auto_39429 ?auto_39439 ) ) ( not ( = ?auto_39434 ?auto_39439 ) ) ( not ( = ?auto_39436 ?auto_39439 ) ) ( not ( = ?auto_39444 ?auto_39440 ) ) ( not ( = ?auto_39421 ?auto_39444 ) ) ( not ( = ?auto_39433 ?auto_39444 ) ) ( not ( = ?auto_39443 ?auto_39444 ) ) ( HOIST-AT ?auto_39442 ?auto_39444 ) ( not ( = ?auto_39417 ?auto_39442 ) ) ( not ( = ?auto_39416 ?auto_39442 ) ) ( not ( = ?auto_39435 ?auto_39442 ) ) ( not ( = ?auto_39419 ?auto_39442 ) ) ( SURFACE-AT ?auto_39434 ?auto_39444 ) ( ON ?auto_39434 ?auto_39424 ) ( CLEAR ?auto_39434 ) ( not ( = ?auto_39414 ?auto_39424 ) ) ( not ( = ?auto_39415 ?auto_39424 ) ) ( not ( = ?auto_39427 ?auto_39424 ) ) ( not ( = ?auto_39437 ?auto_39424 ) ) ( not ( = ?auto_39429 ?auto_39424 ) ) ( not ( = ?auto_39434 ?auto_39424 ) ) ( not ( = ?auto_39436 ?auto_39424 ) ) ( not ( = ?auto_39439 ?auto_39424 ) ) ( IS-CRATE ?auto_39439 ) ( not ( = ?auto_39414 ?auto_39426 ) ) ( not ( = ?auto_39415 ?auto_39426 ) ) ( not ( = ?auto_39427 ?auto_39426 ) ) ( not ( = ?auto_39437 ?auto_39426 ) ) ( not ( = ?auto_39429 ?auto_39426 ) ) ( not ( = ?auto_39434 ?auto_39426 ) ) ( not ( = ?auto_39436 ?auto_39426 ) ) ( not ( = ?auto_39439 ?auto_39426 ) ) ( not ( = ?auto_39424 ?auto_39426 ) ) ( not ( = ?auto_39438 ?auto_39440 ) ) ( not ( = ?auto_39421 ?auto_39438 ) ) ( not ( = ?auto_39433 ?auto_39438 ) ) ( not ( = ?auto_39443 ?auto_39438 ) ) ( not ( = ?auto_39444 ?auto_39438 ) ) ( HOIST-AT ?auto_39431 ?auto_39438 ) ( not ( = ?auto_39417 ?auto_39431 ) ) ( not ( = ?auto_39416 ?auto_39431 ) ) ( not ( = ?auto_39435 ?auto_39431 ) ) ( not ( = ?auto_39419 ?auto_39431 ) ) ( not ( = ?auto_39442 ?auto_39431 ) ) ( AVAILABLE ?auto_39431 ) ( SURFACE-AT ?auto_39439 ?auto_39438 ) ( ON ?auto_39439 ?auto_39428 ) ( CLEAR ?auto_39439 ) ( not ( = ?auto_39414 ?auto_39428 ) ) ( not ( = ?auto_39415 ?auto_39428 ) ) ( not ( = ?auto_39427 ?auto_39428 ) ) ( not ( = ?auto_39437 ?auto_39428 ) ) ( not ( = ?auto_39429 ?auto_39428 ) ) ( not ( = ?auto_39434 ?auto_39428 ) ) ( not ( = ?auto_39436 ?auto_39428 ) ) ( not ( = ?auto_39439 ?auto_39428 ) ) ( not ( = ?auto_39424 ?auto_39428 ) ) ( not ( = ?auto_39426 ?auto_39428 ) ) ( IS-CRATE ?auto_39426 ) ( not ( = ?auto_39414 ?auto_39425 ) ) ( not ( = ?auto_39415 ?auto_39425 ) ) ( not ( = ?auto_39427 ?auto_39425 ) ) ( not ( = ?auto_39437 ?auto_39425 ) ) ( not ( = ?auto_39429 ?auto_39425 ) ) ( not ( = ?auto_39434 ?auto_39425 ) ) ( not ( = ?auto_39436 ?auto_39425 ) ) ( not ( = ?auto_39439 ?auto_39425 ) ) ( not ( = ?auto_39424 ?auto_39425 ) ) ( not ( = ?auto_39426 ?auto_39425 ) ) ( not ( = ?auto_39428 ?auto_39425 ) ) ( not ( = ?auto_39418 ?auto_39440 ) ) ( not ( = ?auto_39421 ?auto_39418 ) ) ( not ( = ?auto_39433 ?auto_39418 ) ) ( not ( = ?auto_39443 ?auto_39418 ) ) ( not ( = ?auto_39444 ?auto_39418 ) ) ( not ( = ?auto_39438 ?auto_39418 ) ) ( HOIST-AT ?auto_39441 ?auto_39418 ) ( not ( = ?auto_39417 ?auto_39441 ) ) ( not ( = ?auto_39416 ?auto_39441 ) ) ( not ( = ?auto_39435 ?auto_39441 ) ) ( not ( = ?auto_39419 ?auto_39441 ) ) ( not ( = ?auto_39442 ?auto_39441 ) ) ( not ( = ?auto_39431 ?auto_39441 ) ) ( AVAILABLE ?auto_39441 ) ( SURFACE-AT ?auto_39426 ?auto_39418 ) ( ON ?auto_39426 ?auto_39445 ) ( CLEAR ?auto_39426 ) ( not ( = ?auto_39414 ?auto_39445 ) ) ( not ( = ?auto_39415 ?auto_39445 ) ) ( not ( = ?auto_39427 ?auto_39445 ) ) ( not ( = ?auto_39437 ?auto_39445 ) ) ( not ( = ?auto_39429 ?auto_39445 ) ) ( not ( = ?auto_39434 ?auto_39445 ) ) ( not ( = ?auto_39436 ?auto_39445 ) ) ( not ( = ?auto_39439 ?auto_39445 ) ) ( not ( = ?auto_39424 ?auto_39445 ) ) ( not ( = ?auto_39426 ?auto_39445 ) ) ( not ( = ?auto_39428 ?auto_39445 ) ) ( not ( = ?auto_39425 ?auto_39445 ) ) ( IS-CRATE ?auto_39425 ) ( not ( = ?auto_39414 ?auto_39446 ) ) ( not ( = ?auto_39415 ?auto_39446 ) ) ( not ( = ?auto_39427 ?auto_39446 ) ) ( not ( = ?auto_39437 ?auto_39446 ) ) ( not ( = ?auto_39429 ?auto_39446 ) ) ( not ( = ?auto_39434 ?auto_39446 ) ) ( not ( = ?auto_39436 ?auto_39446 ) ) ( not ( = ?auto_39439 ?auto_39446 ) ) ( not ( = ?auto_39424 ?auto_39446 ) ) ( not ( = ?auto_39426 ?auto_39446 ) ) ( not ( = ?auto_39428 ?auto_39446 ) ) ( not ( = ?auto_39425 ?auto_39446 ) ) ( not ( = ?auto_39445 ?auto_39446 ) ) ( AVAILABLE ?auto_39442 ) ( SURFACE-AT ?auto_39425 ?auto_39444 ) ( ON ?auto_39425 ?auto_39420 ) ( CLEAR ?auto_39425 ) ( not ( = ?auto_39414 ?auto_39420 ) ) ( not ( = ?auto_39415 ?auto_39420 ) ) ( not ( = ?auto_39427 ?auto_39420 ) ) ( not ( = ?auto_39437 ?auto_39420 ) ) ( not ( = ?auto_39429 ?auto_39420 ) ) ( not ( = ?auto_39434 ?auto_39420 ) ) ( not ( = ?auto_39436 ?auto_39420 ) ) ( not ( = ?auto_39439 ?auto_39420 ) ) ( not ( = ?auto_39424 ?auto_39420 ) ) ( not ( = ?auto_39426 ?auto_39420 ) ) ( not ( = ?auto_39428 ?auto_39420 ) ) ( not ( = ?auto_39425 ?auto_39420 ) ) ( not ( = ?auto_39445 ?auto_39420 ) ) ( not ( = ?auto_39446 ?auto_39420 ) ) ( SURFACE-AT ?auto_39422 ?auto_39440 ) ( CLEAR ?auto_39422 ) ( IS-CRATE ?auto_39446 ) ( not ( = ?auto_39414 ?auto_39422 ) ) ( not ( = ?auto_39415 ?auto_39422 ) ) ( not ( = ?auto_39427 ?auto_39422 ) ) ( not ( = ?auto_39437 ?auto_39422 ) ) ( not ( = ?auto_39429 ?auto_39422 ) ) ( not ( = ?auto_39434 ?auto_39422 ) ) ( not ( = ?auto_39436 ?auto_39422 ) ) ( not ( = ?auto_39439 ?auto_39422 ) ) ( not ( = ?auto_39424 ?auto_39422 ) ) ( not ( = ?auto_39426 ?auto_39422 ) ) ( not ( = ?auto_39428 ?auto_39422 ) ) ( not ( = ?auto_39425 ?auto_39422 ) ) ( not ( = ?auto_39445 ?auto_39422 ) ) ( not ( = ?auto_39446 ?auto_39422 ) ) ( not ( = ?auto_39420 ?auto_39422 ) ) ( AVAILABLE ?auto_39417 ) ( TRUCK-AT ?auto_39432 ?auto_39430 ) ( not ( = ?auto_39430 ?auto_39440 ) ) ( not ( = ?auto_39421 ?auto_39430 ) ) ( not ( = ?auto_39433 ?auto_39430 ) ) ( not ( = ?auto_39443 ?auto_39430 ) ) ( not ( = ?auto_39444 ?auto_39430 ) ) ( not ( = ?auto_39438 ?auto_39430 ) ) ( not ( = ?auto_39418 ?auto_39430 ) ) ( HOIST-AT ?auto_39423 ?auto_39430 ) ( not ( = ?auto_39417 ?auto_39423 ) ) ( not ( = ?auto_39416 ?auto_39423 ) ) ( not ( = ?auto_39435 ?auto_39423 ) ) ( not ( = ?auto_39419 ?auto_39423 ) ) ( not ( = ?auto_39442 ?auto_39423 ) ) ( not ( = ?auto_39431 ?auto_39423 ) ) ( not ( = ?auto_39441 ?auto_39423 ) ) ( AVAILABLE ?auto_39423 ) ( SURFACE-AT ?auto_39446 ?auto_39430 ) ( ON ?auto_39446 ?auto_39447 ) ( CLEAR ?auto_39446 ) ( not ( = ?auto_39414 ?auto_39447 ) ) ( not ( = ?auto_39415 ?auto_39447 ) ) ( not ( = ?auto_39427 ?auto_39447 ) ) ( not ( = ?auto_39437 ?auto_39447 ) ) ( not ( = ?auto_39429 ?auto_39447 ) ) ( not ( = ?auto_39434 ?auto_39447 ) ) ( not ( = ?auto_39436 ?auto_39447 ) ) ( not ( = ?auto_39439 ?auto_39447 ) ) ( not ( = ?auto_39424 ?auto_39447 ) ) ( not ( = ?auto_39426 ?auto_39447 ) ) ( not ( = ?auto_39428 ?auto_39447 ) ) ( not ( = ?auto_39425 ?auto_39447 ) ) ( not ( = ?auto_39445 ?auto_39447 ) ) ( not ( = ?auto_39446 ?auto_39447 ) ) ( not ( = ?auto_39420 ?auto_39447 ) ) ( not ( = ?auto_39422 ?auto_39447 ) ) )
    :subtasks
    ( ( !LIFT ?auto_39423 ?auto_39446 ?auto_39447 ?auto_39430 )
      ( MAKE-ON ?auto_39414 ?auto_39415 )
      ( MAKE-ON-VERIFY ?auto_39414 ?auto_39415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_39448 - SURFACE
      ?auto_39449 - SURFACE
    )
    :vars
    (
      ?auto_39452 - HOIST
      ?auto_39455 - PLACE
      ?auto_39475 - PLACE
      ?auto_39459 - HOIST
      ?auto_39470 - SURFACE
      ?auto_39462 - SURFACE
      ?auto_39468 - PLACE
      ?auto_39473 - HOIST
      ?auto_39471 - SURFACE
      ?auto_39472 - SURFACE
      ?auto_39453 - PLACE
      ?auto_39450 - HOIST
      ?auto_39461 - SURFACE
      ?auto_39481 - SURFACE
      ?auto_39463 - PLACE
      ?auto_39454 - HOIST
      ?auto_39466 - SURFACE
      ?auto_39476 - SURFACE
      ?auto_39457 - PLACE
      ?auto_39458 - HOIST
      ?auto_39465 - SURFACE
      ?auto_39456 - SURFACE
      ?auto_39451 - PLACE
      ?auto_39460 - HOIST
      ?auto_39464 - SURFACE
      ?auto_39480 - SURFACE
      ?auto_39474 - SURFACE
      ?auto_39478 - SURFACE
      ?auto_39477 - PLACE
      ?auto_39469 - HOIST
      ?auto_39479 - SURFACE
      ?auto_39467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39452 ?auto_39455 ) ( IS-CRATE ?auto_39448 ) ( not ( = ?auto_39448 ?auto_39449 ) ) ( not ( = ?auto_39475 ?auto_39455 ) ) ( HOIST-AT ?auto_39459 ?auto_39475 ) ( not ( = ?auto_39452 ?auto_39459 ) ) ( AVAILABLE ?auto_39459 ) ( SURFACE-AT ?auto_39448 ?auto_39475 ) ( ON ?auto_39448 ?auto_39470 ) ( CLEAR ?auto_39448 ) ( not ( = ?auto_39448 ?auto_39470 ) ) ( not ( = ?auto_39449 ?auto_39470 ) ) ( IS-CRATE ?auto_39449 ) ( not ( = ?auto_39448 ?auto_39462 ) ) ( not ( = ?auto_39449 ?auto_39462 ) ) ( not ( = ?auto_39470 ?auto_39462 ) ) ( not ( = ?auto_39468 ?auto_39455 ) ) ( not ( = ?auto_39475 ?auto_39468 ) ) ( HOIST-AT ?auto_39473 ?auto_39468 ) ( not ( = ?auto_39452 ?auto_39473 ) ) ( not ( = ?auto_39459 ?auto_39473 ) ) ( AVAILABLE ?auto_39473 ) ( SURFACE-AT ?auto_39449 ?auto_39468 ) ( ON ?auto_39449 ?auto_39471 ) ( CLEAR ?auto_39449 ) ( not ( = ?auto_39448 ?auto_39471 ) ) ( not ( = ?auto_39449 ?auto_39471 ) ) ( not ( = ?auto_39470 ?auto_39471 ) ) ( not ( = ?auto_39462 ?auto_39471 ) ) ( IS-CRATE ?auto_39462 ) ( not ( = ?auto_39448 ?auto_39472 ) ) ( not ( = ?auto_39449 ?auto_39472 ) ) ( not ( = ?auto_39470 ?auto_39472 ) ) ( not ( = ?auto_39462 ?auto_39472 ) ) ( not ( = ?auto_39471 ?auto_39472 ) ) ( not ( = ?auto_39453 ?auto_39455 ) ) ( not ( = ?auto_39475 ?auto_39453 ) ) ( not ( = ?auto_39468 ?auto_39453 ) ) ( HOIST-AT ?auto_39450 ?auto_39453 ) ( not ( = ?auto_39452 ?auto_39450 ) ) ( not ( = ?auto_39459 ?auto_39450 ) ) ( not ( = ?auto_39473 ?auto_39450 ) ) ( AVAILABLE ?auto_39450 ) ( SURFACE-AT ?auto_39462 ?auto_39453 ) ( ON ?auto_39462 ?auto_39461 ) ( CLEAR ?auto_39462 ) ( not ( = ?auto_39448 ?auto_39461 ) ) ( not ( = ?auto_39449 ?auto_39461 ) ) ( not ( = ?auto_39470 ?auto_39461 ) ) ( not ( = ?auto_39462 ?auto_39461 ) ) ( not ( = ?auto_39471 ?auto_39461 ) ) ( not ( = ?auto_39472 ?auto_39461 ) ) ( IS-CRATE ?auto_39472 ) ( not ( = ?auto_39448 ?auto_39481 ) ) ( not ( = ?auto_39449 ?auto_39481 ) ) ( not ( = ?auto_39470 ?auto_39481 ) ) ( not ( = ?auto_39462 ?auto_39481 ) ) ( not ( = ?auto_39471 ?auto_39481 ) ) ( not ( = ?auto_39472 ?auto_39481 ) ) ( not ( = ?auto_39461 ?auto_39481 ) ) ( not ( = ?auto_39463 ?auto_39455 ) ) ( not ( = ?auto_39475 ?auto_39463 ) ) ( not ( = ?auto_39468 ?auto_39463 ) ) ( not ( = ?auto_39453 ?auto_39463 ) ) ( HOIST-AT ?auto_39454 ?auto_39463 ) ( not ( = ?auto_39452 ?auto_39454 ) ) ( not ( = ?auto_39459 ?auto_39454 ) ) ( not ( = ?auto_39473 ?auto_39454 ) ) ( not ( = ?auto_39450 ?auto_39454 ) ) ( SURFACE-AT ?auto_39472 ?auto_39463 ) ( ON ?auto_39472 ?auto_39466 ) ( CLEAR ?auto_39472 ) ( not ( = ?auto_39448 ?auto_39466 ) ) ( not ( = ?auto_39449 ?auto_39466 ) ) ( not ( = ?auto_39470 ?auto_39466 ) ) ( not ( = ?auto_39462 ?auto_39466 ) ) ( not ( = ?auto_39471 ?auto_39466 ) ) ( not ( = ?auto_39472 ?auto_39466 ) ) ( not ( = ?auto_39461 ?auto_39466 ) ) ( not ( = ?auto_39481 ?auto_39466 ) ) ( IS-CRATE ?auto_39481 ) ( not ( = ?auto_39448 ?auto_39476 ) ) ( not ( = ?auto_39449 ?auto_39476 ) ) ( not ( = ?auto_39470 ?auto_39476 ) ) ( not ( = ?auto_39462 ?auto_39476 ) ) ( not ( = ?auto_39471 ?auto_39476 ) ) ( not ( = ?auto_39472 ?auto_39476 ) ) ( not ( = ?auto_39461 ?auto_39476 ) ) ( not ( = ?auto_39481 ?auto_39476 ) ) ( not ( = ?auto_39466 ?auto_39476 ) ) ( not ( = ?auto_39457 ?auto_39455 ) ) ( not ( = ?auto_39475 ?auto_39457 ) ) ( not ( = ?auto_39468 ?auto_39457 ) ) ( not ( = ?auto_39453 ?auto_39457 ) ) ( not ( = ?auto_39463 ?auto_39457 ) ) ( HOIST-AT ?auto_39458 ?auto_39457 ) ( not ( = ?auto_39452 ?auto_39458 ) ) ( not ( = ?auto_39459 ?auto_39458 ) ) ( not ( = ?auto_39473 ?auto_39458 ) ) ( not ( = ?auto_39450 ?auto_39458 ) ) ( not ( = ?auto_39454 ?auto_39458 ) ) ( AVAILABLE ?auto_39458 ) ( SURFACE-AT ?auto_39481 ?auto_39457 ) ( ON ?auto_39481 ?auto_39465 ) ( CLEAR ?auto_39481 ) ( not ( = ?auto_39448 ?auto_39465 ) ) ( not ( = ?auto_39449 ?auto_39465 ) ) ( not ( = ?auto_39470 ?auto_39465 ) ) ( not ( = ?auto_39462 ?auto_39465 ) ) ( not ( = ?auto_39471 ?auto_39465 ) ) ( not ( = ?auto_39472 ?auto_39465 ) ) ( not ( = ?auto_39461 ?auto_39465 ) ) ( not ( = ?auto_39481 ?auto_39465 ) ) ( not ( = ?auto_39466 ?auto_39465 ) ) ( not ( = ?auto_39476 ?auto_39465 ) ) ( IS-CRATE ?auto_39476 ) ( not ( = ?auto_39448 ?auto_39456 ) ) ( not ( = ?auto_39449 ?auto_39456 ) ) ( not ( = ?auto_39470 ?auto_39456 ) ) ( not ( = ?auto_39462 ?auto_39456 ) ) ( not ( = ?auto_39471 ?auto_39456 ) ) ( not ( = ?auto_39472 ?auto_39456 ) ) ( not ( = ?auto_39461 ?auto_39456 ) ) ( not ( = ?auto_39481 ?auto_39456 ) ) ( not ( = ?auto_39466 ?auto_39456 ) ) ( not ( = ?auto_39476 ?auto_39456 ) ) ( not ( = ?auto_39465 ?auto_39456 ) ) ( not ( = ?auto_39451 ?auto_39455 ) ) ( not ( = ?auto_39475 ?auto_39451 ) ) ( not ( = ?auto_39468 ?auto_39451 ) ) ( not ( = ?auto_39453 ?auto_39451 ) ) ( not ( = ?auto_39463 ?auto_39451 ) ) ( not ( = ?auto_39457 ?auto_39451 ) ) ( HOIST-AT ?auto_39460 ?auto_39451 ) ( not ( = ?auto_39452 ?auto_39460 ) ) ( not ( = ?auto_39459 ?auto_39460 ) ) ( not ( = ?auto_39473 ?auto_39460 ) ) ( not ( = ?auto_39450 ?auto_39460 ) ) ( not ( = ?auto_39454 ?auto_39460 ) ) ( not ( = ?auto_39458 ?auto_39460 ) ) ( AVAILABLE ?auto_39460 ) ( SURFACE-AT ?auto_39476 ?auto_39451 ) ( ON ?auto_39476 ?auto_39464 ) ( CLEAR ?auto_39476 ) ( not ( = ?auto_39448 ?auto_39464 ) ) ( not ( = ?auto_39449 ?auto_39464 ) ) ( not ( = ?auto_39470 ?auto_39464 ) ) ( not ( = ?auto_39462 ?auto_39464 ) ) ( not ( = ?auto_39471 ?auto_39464 ) ) ( not ( = ?auto_39472 ?auto_39464 ) ) ( not ( = ?auto_39461 ?auto_39464 ) ) ( not ( = ?auto_39481 ?auto_39464 ) ) ( not ( = ?auto_39466 ?auto_39464 ) ) ( not ( = ?auto_39476 ?auto_39464 ) ) ( not ( = ?auto_39465 ?auto_39464 ) ) ( not ( = ?auto_39456 ?auto_39464 ) ) ( IS-CRATE ?auto_39456 ) ( not ( = ?auto_39448 ?auto_39480 ) ) ( not ( = ?auto_39449 ?auto_39480 ) ) ( not ( = ?auto_39470 ?auto_39480 ) ) ( not ( = ?auto_39462 ?auto_39480 ) ) ( not ( = ?auto_39471 ?auto_39480 ) ) ( not ( = ?auto_39472 ?auto_39480 ) ) ( not ( = ?auto_39461 ?auto_39480 ) ) ( not ( = ?auto_39481 ?auto_39480 ) ) ( not ( = ?auto_39466 ?auto_39480 ) ) ( not ( = ?auto_39476 ?auto_39480 ) ) ( not ( = ?auto_39465 ?auto_39480 ) ) ( not ( = ?auto_39456 ?auto_39480 ) ) ( not ( = ?auto_39464 ?auto_39480 ) ) ( AVAILABLE ?auto_39454 ) ( SURFACE-AT ?auto_39456 ?auto_39463 ) ( ON ?auto_39456 ?auto_39474 ) ( CLEAR ?auto_39456 ) ( not ( = ?auto_39448 ?auto_39474 ) ) ( not ( = ?auto_39449 ?auto_39474 ) ) ( not ( = ?auto_39470 ?auto_39474 ) ) ( not ( = ?auto_39462 ?auto_39474 ) ) ( not ( = ?auto_39471 ?auto_39474 ) ) ( not ( = ?auto_39472 ?auto_39474 ) ) ( not ( = ?auto_39461 ?auto_39474 ) ) ( not ( = ?auto_39481 ?auto_39474 ) ) ( not ( = ?auto_39466 ?auto_39474 ) ) ( not ( = ?auto_39476 ?auto_39474 ) ) ( not ( = ?auto_39465 ?auto_39474 ) ) ( not ( = ?auto_39456 ?auto_39474 ) ) ( not ( = ?auto_39464 ?auto_39474 ) ) ( not ( = ?auto_39480 ?auto_39474 ) ) ( SURFACE-AT ?auto_39478 ?auto_39455 ) ( CLEAR ?auto_39478 ) ( IS-CRATE ?auto_39480 ) ( not ( = ?auto_39448 ?auto_39478 ) ) ( not ( = ?auto_39449 ?auto_39478 ) ) ( not ( = ?auto_39470 ?auto_39478 ) ) ( not ( = ?auto_39462 ?auto_39478 ) ) ( not ( = ?auto_39471 ?auto_39478 ) ) ( not ( = ?auto_39472 ?auto_39478 ) ) ( not ( = ?auto_39461 ?auto_39478 ) ) ( not ( = ?auto_39481 ?auto_39478 ) ) ( not ( = ?auto_39466 ?auto_39478 ) ) ( not ( = ?auto_39476 ?auto_39478 ) ) ( not ( = ?auto_39465 ?auto_39478 ) ) ( not ( = ?auto_39456 ?auto_39478 ) ) ( not ( = ?auto_39464 ?auto_39478 ) ) ( not ( = ?auto_39480 ?auto_39478 ) ) ( not ( = ?auto_39474 ?auto_39478 ) ) ( AVAILABLE ?auto_39452 ) ( not ( = ?auto_39477 ?auto_39455 ) ) ( not ( = ?auto_39475 ?auto_39477 ) ) ( not ( = ?auto_39468 ?auto_39477 ) ) ( not ( = ?auto_39453 ?auto_39477 ) ) ( not ( = ?auto_39463 ?auto_39477 ) ) ( not ( = ?auto_39457 ?auto_39477 ) ) ( not ( = ?auto_39451 ?auto_39477 ) ) ( HOIST-AT ?auto_39469 ?auto_39477 ) ( not ( = ?auto_39452 ?auto_39469 ) ) ( not ( = ?auto_39459 ?auto_39469 ) ) ( not ( = ?auto_39473 ?auto_39469 ) ) ( not ( = ?auto_39450 ?auto_39469 ) ) ( not ( = ?auto_39454 ?auto_39469 ) ) ( not ( = ?auto_39458 ?auto_39469 ) ) ( not ( = ?auto_39460 ?auto_39469 ) ) ( AVAILABLE ?auto_39469 ) ( SURFACE-AT ?auto_39480 ?auto_39477 ) ( ON ?auto_39480 ?auto_39479 ) ( CLEAR ?auto_39480 ) ( not ( = ?auto_39448 ?auto_39479 ) ) ( not ( = ?auto_39449 ?auto_39479 ) ) ( not ( = ?auto_39470 ?auto_39479 ) ) ( not ( = ?auto_39462 ?auto_39479 ) ) ( not ( = ?auto_39471 ?auto_39479 ) ) ( not ( = ?auto_39472 ?auto_39479 ) ) ( not ( = ?auto_39461 ?auto_39479 ) ) ( not ( = ?auto_39481 ?auto_39479 ) ) ( not ( = ?auto_39466 ?auto_39479 ) ) ( not ( = ?auto_39476 ?auto_39479 ) ) ( not ( = ?auto_39465 ?auto_39479 ) ) ( not ( = ?auto_39456 ?auto_39479 ) ) ( not ( = ?auto_39464 ?auto_39479 ) ) ( not ( = ?auto_39480 ?auto_39479 ) ) ( not ( = ?auto_39474 ?auto_39479 ) ) ( not ( = ?auto_39478 ?auto_39479 ) ) ( TRUCK-AT ?auto_39467 ?auto_39455 ) )
    :subtasks
    ( ( !DRIVE ?auto_39467 ?auto_39455 ?auto_39477 )
      ( MAKE-ON ?auto_39448 ?auto_39449 )
      ( MAKE-ON-VERIFY ?auto_39448 ?auto_39449 ) )
  )

)

