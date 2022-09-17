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
      ?auto_4112 - SURFACE
      ?auto_4113 - SURFACE
    )
    :vars
    (
      ?auto_4114 - HOIST
      ?auto_4115 - PLACE
      ?auto_4117 - PLACE
      ?auto_4118 - HOIST
      ?auto_4119 - SURFACE
      ?auto_4116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4114 ?auto_4115 ) ( SURFACE-AT ?auto_4113 ?auto_4115 ) ( CLEAR ?auto_4113 ) ( IS-CRATE ?auto_4112 ) ( AVAILABLE ?auto_4114 ) ( not ( = ?auto_4117 ?auto_4115 ) ) ( HOIST-AT ?auto_4118 ?auto_4117 ) ( AVAILABLE ?auto_4118 ) ( SURFACE-AT ?auto_4112 ?auto_4117 ) ( ON ?auto_4112 ?auto_4119 ) ( CLEAR ?auto_4112 ) ( TRUCK-AT ?auto_4116 ?auto_4115 ) ( not ( = ?auto_4112 ?auto_4113 ) ) ( not ( = ?auto_4112 ?auto_4119 ) ) ( not ( = ?auto_4113 ?auto_4119 ) ) ( not ( = ?auto_4114 ?auto_4118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4116 ?auto_4115 ?auto_4117 )
      ( !LIFT ?auto_4118 ?auto_4112 ?auto_4119 ?auto_4117 )
      ( !LOAD ?auto_4118 ?auto_4112 ?auto_4116 ?auto_4117 )
      ( !DRIVE ?auto_4116 ?auto_4117 ?auto_4115 )
      ( !UNLOAD ?auto_4114 ?auto_4112 ?auto_4116 ?auto_4115 )
      ( !DROP ?auto_4114 ?auto_4112 ?auto_4113 ?auto_4115 )
      ( MAKE-ON-VERIFY ?auto_4112 ?auto_4113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4122 - SURFACE
      ?auto_4123 - SURFACE
    )
    :vars
    (
      ?auto_4124 - HOIST
      ?auto_4125 - PLACE
      ?auto_4127 - PLACE
      ?auto_4128 - HOIST
      ?auto_4129 - SURFACE
      ?auto_4126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4124 ?auto_4125 ) ( SURFACE-AT ?auto_4123 ?auto_4125 ) ( CLEAR ?auto_4123 ) ( IS-CRATE ?auto_4122 ) ( AVAILABLE ?auto_4124 ) ( not ( = ?auto_4127 ?auto_4125 ) ) ( HOIST-AT ?auto_4128 ?auto_4127 ) ( AVAILABLE ?auto_4128 ) ( SURFACE-AT ?auto_4122 ?auto_4127 ) ( ON ?auto_4122 ?auto_4129 ) ( CLEAR ?auto_4122 ) ( TRUCK-AT ?auto_4126 ?auto_4125 ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4129 ) ) ( not ( = ?auto_4123 ?auto_4129 ) ) ( not ( = ?auto_4124 ?auto_4128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4126 ?auto_4125 ?auto_4127 )
      ( !LIFT ?auto_4128 ?auto_4122 ?auto_4129 ?auto_4127 )
      ( !LOAD ?auto_4128 ?auto_4122 ?auto_4126 ?auto_4127 )
      ( !DRIVE ?auto_4126 ?auto_4127 ?auto_4125 )
      ( !UNLOAD ?auto_4124 ?auto_4122 ?auto_4126 ?auto_4125 )
      ( !DROP ?auto_4124 ?auto_4122 ?auto_4123 ?auto_4125 )
      ( MAKE-ON-VERIFY ?auto_4122 ?auto_4123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4132 - SURFACE
      ?auto_4133 - SURFACE
    )
    :vars
    (
      ?auto_4134 - HOIST
      ?auto_4135 - PLACE
      ?auto_4137 - PLACE
      ?auto_4138 - HOIST
      ?auto_4139 - SURFACE
      ?auto_4136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4134 ?auto_4135 ) ( SURFACE-AT ?auto_4133 ?auto_4135 ) ( CLEAR ?auto_4133 ) ( IS-CRATE ?auto_4132 ) ( AVAILABLE ?auto_4134 ) ( not ( = ?auto_4137 ?auto_4135 ) ) ( HOIST-AT ?auto_4138 ?auto_4137 ) ( AVAILABLE ?auto_4138 ) ( SURFACE-AT ?auto_4132 ?auto_4137 ) ( ON ?auto_4132 ?auto_4139 ) ( CLEAR ?auto_4132 ) ( TRUCK-AT ?auto_4136 ?auto_4135 ) ( not ( = ?auto_4132 ?auto_4133 ) ) ( not ( = ?auto_4132 ?auto_4139 ) ) ( not ( = ?auto_4133 ?auto_4139 ) ) ( not ( = ?auto_4134 ?auto_4138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4136 ?auto_4135 ?auto_4137 )
      ( !LIFT ?auto_4138 ?auto_4132 ?auto_4139 ?auto_4137 )
      ( !LOAD ?auto_4138 ?auto_4132 ?auto_4136 ?auto_4137 )
      ( !DRIVE ?auto_4136 ?auto_4137 ?auto_4135 )
      ( !UNLOAD ?auto_4134 ?auto_4132 ?auto_4136 ?auto_4135 )
      ( !DROP ?auto_4134 ?auto_4132 ?auto_4133 ?auto_4135 )
      ( MAKE-ON-VERIFY ?auto_4132 ?auto_4133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4142 - SURFACE
      ?auto_4143 - SURFACE
    )
    :vars
    (
      ?auto_4144 - HOIST
      ?auto_4145 - PLACE
      ?auto_4147 - PLACE
      ?auto_4148 - HOIST
      ?auto_4149 - SURFACE
      ?auto_4146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4144 ?auto_4145 ) ( SURFACE-AT ?auto_4143 ?auto_4145 ) ( CLEAR ?auto_4143 ) ( IS-CRATE ?auto_4142 ) ( AVAILABLE ?auto_4144 ) ( not ( = ?auto_4147 ?auto_4145 ) ) ( HOIST-AT ?auto_4148 ?auto_4147 ) ( AVAILABLE ?auto_4148 ) ( SURFACE-AT ?auto_4142 ?auto_4147 ) ( ON ?auto_4142 ?auto_4149 ) ( CLEAR ?auto_4142 ) ( TRUCK-AT ?auto_4146 ?auto_4145 ) ( not ( = ?auto_4142 ?auto_4143 ) ) ( not ( = ?auto_4142 ?auto_4149 ) ) ( not ( = ?auto_4143 ?auto_4149 ) ) ( not ( = ?auto_4144 ?auto_4148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4146 ?auto_4145 ?auto_4147 )
      ( !LIFT ?auto_4148 ?auto_4142 ?auto_4149 ?auto_4147 )
      ( !LOAD ?auto_4148 ?auto_4142 ?auto_4146 ?auto_4147 )
      ( !DRIVE ?auto_4146 ?auto_4147 ?auto_4145 )
      ( !UNLOAD ?auto_4144 ?auto_4142 ?auto_4146 ?auto_4145 )
      ( !DROP ?auto_4144 ?auto_4142 ?auto_4143 ?auto_4145 )
      ( MAKE-ON-VERIFY ?auto_4142 ?auto_4143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4152 - SURFACE
      ?auto_4153 - SURFACE
    )
    :vars
    (
      ?auto_4154 - HOIST
      ?auto_4155 - PLACE
      ?auto_4157 - PLACE
      ?auto_4158 - HOIST
      ?auto_4159 - SURFACE
      ?auto_4156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4154 ?auto_4155 ) ( SURFACE-AT ?auto_4153 ?auto_4155 ) ( CLEAR ?auto_4153 ) ( IS-CRATE ?auto_4152 ) ( AVAILABLE ?auto_4154 ) ( not ( = ?auto_4157 ?auto_4155 ) ) ( HOIST-AT ?auto_4158 ?auto_4157 ) ( AVAILABLE ?auto_4158 ) ( SURFACE-AT ?auto_4152 ?auto_4157 ) ( ON ?auto_4152 ?auto_4159 ) ( CLEAR ?auto_4152 ) ( TRUCK-AT ?auto_4156 ?auto_4155 ) ( not ( = ?auto_4152 ?auto_4153 ) ) ( not ( = ?auto_4152 ?auto_4159 ) ) ( not ( = ?auto_4153 ?auto_4159 ) ) ( not ( = ?auto_4154 ?auto_4158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4156 ?auto_4155 ?auto_4157 )
      ( !LIFT ?auto_4158 ?auto_4152 ?auto_4159 ?auto_4157 )
      ( !LOAD ?auto_4158 ?auto_4152 ?auto_4156 ?auto_4157 )
      ( !DRIVE ?auto_4156 ?auto_4157 ?auto_4155 )
      ( !UNLOAD ?auto_4154 ?auto_4152 ?auto_4156 ?auto_4155 )
      ( !DROP ?auto_4154 ?auto_4152 ?auto_4153 ?auto_4155 )
      ( MAKE-ON-VERIFY ?auto_4152 ?auto_4153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4162 - SURFACE
      ?auto_4163 - SURFACE
    )
    :vars
    (
      ?auto_4164 - HOIST
      ?auto_4165 - PLACE
      ?auto_4167 - PLACE
      ?auto_4168 - HOIST
      ?auto_4169 - SURFACE
      ?auto_4166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4164 ?auto_4165 ) ( SURFACE-AT ?auto_4163 ?auto_4165 ) ( CLEAR ?auto_4163 ) ( IS-CRATE ?auto_4162 ) ( AVAILABLE ?auto_4164 ) ( not ( = ?auto_4167 ?auto_4165 ) ) ( HOIST-AT ?auto_4168 ?auto_4167 ) ( AVAILABLE ?auto_4168 ) ( SURFACE-AT ?auto_4162 ?auto_4167 ) ( ON ?auto_4162 ?auto_4169 ) ( CLEAR ?auto_4162 ) ( TRUCK-AT ?auto_4166 ?auto_4165 ) ( not ( = ?auto_4162 ?auto_4163 ) ) ( not ( = ?auto_4162 ?auto_4169 ) ) ( not ( = ?auto_4163 ?auto_4169 ) ) ( not ( = ?auto_4164 ?auto_4168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4166 ?auto_4165 ?auto_4167 )
      ( !LIFT ?auto_4168 ?auto_4162 ?auto_4169 ?auto_4167 )
      ( !LOAD ?auto_4168 ?auto_4162 ?auto_4166 ?auto_4167 )
      ( !DRIVE ?auto_4166 ?auto_4167 ?auto_4165 )
      ( !UNLOAD ?auto_4164 ?auto_4162 ?auto_4166 ?auto_4165 )
      ( !DROP ?auto_4164 ?auto_4162 ?auto_4163 ?auto_4165 )
      ( MAKE-ON-VERIFY ?auto_4162 ?auto_4163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4172 - SURFACE
      ?auto_4173 - SURFACE
    )
    :vars
    (
      ?auto_4174 - HOIST
      ?auto_4175 - PLACE
      ?auto_4177 - PLACE
      ?auto_4178 - HOIST
      ?auto_4179 - SURFACE
      ?auto_4176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4174 ?auto_4175 ) ( SURFACE-AT ?auto_4173 ?auto_4175 ) ( CLEAR ?auto_4173 ) ( IS-CRATE ?auto_4172 ) ( AVAILABLE ?auto_4174 ) ( not ( = ?auto_4177 ?auto_4175 ) ) ( HOIST-AT ?auto_4178 ?auto_4177 ) ( AVAILABLE ?auto_4178 ) ( SURFACE-AT ?auto_4172 ?auto_4177 ) ( ON ?auto_4172 ?auto_4179 ) ( CLEAR ?auto_4172 ) ( TRUCK-AT ?auto_4176 ?auto_4175 ) ( not ( = ?auto_4172 ?auto_4173 ) ) ( not ( = ?auto_4172 ?auto_4179 ) ) ( not ( = ?auto_4173 ?auto_4179 ) ) ( not ( = ?auto_4174 ?auto_4178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4176 ?auto_4175 ?auto_4177 )
      ( !LIFT ?auto_4178 ?auto_4172 ?auto_4179 ?auto_4177 )
      ( !LOAD ?auto_4178 ?auto_4172 ?auto_4176 ?auto_4177 )
      ( !DRIVE ?auto_4176 ?auto_4177 ?auto_4175 )
      ( !UNLOAD ?auto_4174 ?auto_4172 ?auto_4176 ?auto_4175 )
      ( !DROP ?auto_4174 ?auto_4172 ?auto_4173 ?auto_4175 )
      ( MAKE-ON-VERIFY ?auto_4172 ?auto_4173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4182 - SURFACE
      ?auto_4183 - SURFACE
    )
    :vars
    (
      ?auto_4184 - HOIST
      ?auto_4185 - PLACE
      ?auto_4187 - PLACE
      ?auto_4188 - HOIST
      ?auto_4189 - SURFACE
      ?auto_4186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4184 ?auto_4185 ) ( SURFACE-AT ?auto_4183 ?auto_4185 ) ( CLEAR ?auto_4183 ) ( IS-CRATE ?auto_4182 ) ( AVAILABLE ?auto_4184 ) ( not ( = ?auto_4187 ?auto_4185 ) ) ( HOIST-AT ?auto_4188 ?auto_4187 ) ( AVAILABLE ?auto_4188 ) ( SURFACE-AT ?auto_4182 ?auto_4187 ) ( ON ?auto_4182 ?auto_4189 ) ( CLEAR ?auto_4182 ) ( TRUCK-AT ?auto_4186 ?auto_4185 ) ( not ( = ?auto_4182 ?auto_4183 ) ) ( not ( = ?auto_4182 ?auto_4189 ) ) ( not ( = ?auto_4183 ?auto_4189 ) ) ( not ( = ?auto_4184 ?auto_4188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4186 ?auto_4185 ?auto_4187 )
      ( !LIFT ?auto_4188 ?auto_4182 ?auto_4189 ?auto_4187 )
      ( !LOAD ?auto_4188 ?auto_4182 ?auto_4186 ?auto_4187 )
      ( !DRIVE ?auto_4186 ?auto_4187 ?auto_4185 )
      ( !UNLOAD ?auto_4184 ?auto_4182 ?auto_4186 ?auto_4185 )
      ( !DROP ?auto_4184 ?auto_4182 ?auto_4183 ?auto_4185 )
      ( MAKE-ON-VERIFY ?auto_4182 ?auto_4183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4192 - SURFACE
      ?auto_4193 - SURFACE
    )
    :vars
    (
      ?auto_4194 - HOIST
      ?auto_4195 - PLACE
      ?auto_4197 - PLACE
      ?auto_4198 - HOIST
      ?auto_4199 - SURFACE
      ?auto_4196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4194 ?auto_4195 ) ( SURFACE-AT ?auto_4193 ?auto_4195 ) ( CLEAR ?auto_4193 ) ( IS-CRATE ?auto_4192 ) ( AVAILABLE ?auto_4194 ) ( not ( = ?auto_4197 ?auto_4195 ) ) ( HOIST-AT ?auto_4198 ?auto_4197 ) ( AVAILABLE ?auto_4198 ) ( SURFACE-AT ?auto_4192 ?auto_4197 ) ( ON ?auto_4192 ?auto_4199 ) ( CLEAR ?auto_4192 ) ( TRUCK-AT ?auto_4196 ?auto_4195 ) ( not ( = ?auto_4192 ?auto_4193 ) ) ( not ( = ?auto_4192 ?auto_4199 ) ) ( not ( = ?auto_4193 ?auto_4199 ) ) ( not ( = ?auto_4194 ?auto_4198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4196 ?auto_4195 ?auto_4197 )
      ( !LIFT ?auto_4198 ?auto_4192 ?auto_4199 ?auto_4197 )
      ( !LOAD ?auto_4198 ?auto_4192 ?auto_4196 ?auto_4197 )
      ( !DRIVE ?auto_4196 ?auto_4197 ?auto_4195 )
      ( !UNLOAD ?auto_4194 ?auto_4192 ?auto_4196 ?auto_4195 )
      ( !DROP ?auto_4194 ?auto_4192 ?auto_4193 ?auto_4195 )
      ( MAKE-ON-VERIFY ?auto_4192 ?auto_4193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4202 - SURFACE
      ?auto_4203 - SURFACE
    )
    :vars
    (
      ?auto_4204 - HOIST
      ?auto_4205 - PLACE
      ?auto_4207 - PLACE
      ?auto_4208 - HOIST
      ?auto_4209 - SURFACE
      ?auto_4206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4204 ?auto_4205 ) ( SURFACE-AT ?auto_4203 ?auto_4205 ) ( CLEAR ?auto_4203 ) ( IS-CRATE ?auto_4202 ) ( AVAILABLE ?auto_4204 ) ( not ( = ?auto_4207 ?auto_4205 ) ) ( HOIST-AT ?auto_4208 ?auto_4207 ) ( AVAILABLE ?auto_4208 ) ( SURFACE-AT ?auto_4202 ?auto_4207 ) ( ON ?auto_4202 ?auto_4209 ) ( CLEAR ?auto_4202 ) ( TRUCK-AT ?auto_4206 ?auto_4205 ) ( not ( = ?auto_4202 ?auto_4203 ) ) ( not ( = ?auto_4202 ?auto_4209 ) ) ( not ( = ?auto_4203 ?auto_4209 ) ) ( not ( = ?auto_4204 ?auto_4208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4206 ?auto_4205 ?auto_4207 )
      ( !LIFT ?auto_4208 ?auto_4202 ?auto_4209 ?auto_4207 )
      ( !LOAD ?auto_4208 ?auto_4202 ?auto_4206 ?auto_4207 )
      ( !DRIVE ?auto_4206 ?auto_4207 ?auto_4205 )
      ( !UNLOAD ?auto_4204 ?auto_4202 ?auto_4206 ?auto_4205 )
      ( !DROP ?auto_4204 ?auto_4202 ?auto_4203 ?auto_4205 )
      ( MAKE-ON-VERIFY ?auto_4202 ?auto_4203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4212 - SURFACE
      ?auto_4213 - SURFACE
    )
    :vars
    (
      ?auto_4214 - HOIST
      ?auto_4215 - PLACE
      ?auto_4217 - PLACE
      ?auto_4218 - HOIST
      ?auto_4219 - SURFACE
      ?auto_4216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4214 ?auto_4215 ) ( SURFACE-AT ?auto_4213 ?auto_4215 ) ( CLEAR ?auto_4213 ) ( IS-CRATE ?auto_4212 ) ( AVAILABLE ?auto_4214 ) ( not ( = ?auto_4217 ?auto_4215 ) ) ( HOIST-AT ?auto_4218 ?auto_4217 ) ( AVAILABLE ?auto_4218 ) ( SURFACE-AT ?auto_4212 ?auto_4217 ) ( ON ?auto_4212 ?auto_4219 ) ( CLEAR ?auto_4212 ) ( TRUCK-AT ?auto_4216 ?auto_4215 ) ( not ( = ?auto_4212 ?auto_4213 ) ) ( not ( = ?auto_4212 ?auto_4219 ) ) ( not ( = ?auto_4213 ?auto_4219 ) ) ( not ( = ?auto_4214 ?auto_4218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4216 ?auto_4215 ?auto_4217 )
      ( !LIFT ?auto_4218 ?auto_4212 ?auto_4219 ?auto_4217 )
      ( !LOAD ?auto_4218 ?auto_4212 ?auto_4216 ?auto_4217 )
      ( !DRIVE ?auto_4216 ?auto_4217 ?auto_4215 )
      ( !UNLOAD ?auto_4214 ?auto_4212 ?auto_4216 ?auto_4215 )
      ( !DROP ?auto_4214 ?auto_4212 ?auto_4213 ?auto_4215 )
      ( MAKE-ON-VERIFY ?auto_4212 ?auto_4213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4222 - SURFACE
      ?auto_4223 - SURFACE
    )
    :vars
    (
      ?auto_4224 - HOIST
      ?auto_4225 - PLACE
      ?auto_4227 - PLACE
      ?auto_4228 - HOIST
      ?auto_4229 - SURFACE
      ?auto_4226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4224 ?auto_4225 ) ( SURFACE-AT ?auto_4223 ?auto_4225 ) ( CLEAR ?auto_4223 ) ( IS-CRATE ?auto_4222 ) ( AVAILABLE ?auto_4224 ) ( not ( = ?auto_4227 ?auto_4225 ) ) ( HOIST-AT ?auto_4228 ?auto_4227 ) ( AVAILABLE ?auto_4228 ) ( SURFACE-AT ?auto_4222 ?auto_4227 ) ( ON ?auto_4222 ?auto_4229 ) ( CLEAR ?auto_4222 ) ( TRUCK-AT ?auto_4226 ?auto_4225 ) ( not ( = ?auto_4222 ?auto_4223 ) ) ( not ( = ?auto_4222 ?auto_4229 ) ) ( not ( = ?auto_4223 ?auto_4229 ) ) ( not ( = ?auto_4224 ?auto_4228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4226 ?auto_4225 ?auto_4227 )
      ( !LIFT ?auto_4228 ?auto_4222 ?auto_4229 ?auto_4227 )
      ( !LOAD ?auto_4228 ?auto_4222 ?auto_4226 ?auto_4227 )
      ( !DRIVE ?auto_4226 ?auto_4227 ?auto_4225 )
      ( !UNLOAD ?auto_4224 ?auto_4222 ?auto_4226 ?auto_4225 )
      ( !DROP ?auto_4224 ?auto_4222 ?auto_4223 ?auto_4225 )
      ( MAKE-ON-VERIFY ?auto_4222 ?auto_4223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_4232 - SURFACE
      ?auto_4233 - SURFACE
    )
    :vars
    (
      ?auto_4234 - HOIST
      ?auto_4235 - PLACE
      ?auto_4237 - PLACE
      ?auto_4238 - HOIST
      ?auto_4239 - SURFACE
      ?auto_4236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4234 ?auto_4235 ) ( SURFACE-AT ?auto_4233 ?auto_4235 ) ( CLEAR ?auto_4233 ) ( IS-CRATE ?auto_4232 ) ( AVAILABLE ?auto_4234 ) ( not ( = ?auto_4237 ?auto_4235 ) ) ( HOIST-AT ?auto_4238 ?auto_4237 ) ( AVAILABLE ?auto_4238 ) ( SURFACE-AT ?auto_4232 ?auto_4237 ) ( ON ?auto_4232 ?auto_4239 ) ( CLEAR ?auto_4232 ) ( TRUCK-AT ?auto_4236 ?auto_4235 ) ( not ( = ?auto_4232 ?auto_4233 ) ) ( not ( = ?auto_4232 ?auto_4239 ) ) ( not ( = ?auto_4233 ?auto_4239 ) ) ( not ( = ?auto_4234 ?auto_4238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4236 ?auto_4235 ?auto_4237 )
      ( !LIFT ?auto_4238 ?auto_4232 ?auto_4239 ?auto_4237 )
      ( !LOAD ?auto_4238 ?auto_4232 ?auto_4236 ?auto_4237 )
      ( !DRIVE ?auto_4236 ?auto_4237 ?auto_4235 )
      ( !UNLOAD ?auto_4234 ?auto_4232 ?auto_4236 ?auto_4235 )
      ( !DROP ?auto_4234 ?auto_4232 ?auto_4233 ?auto_4235 )
      ( MAKE-ON-VERIFY ?auto_4232 ?auto_4233 ) )
  )

)

