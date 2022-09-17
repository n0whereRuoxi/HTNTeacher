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
      ?auto_3898 - SURFACE
      ?auto_3899 - SURFACE
    )
    :vars
    (
      ?auto_3900 - HOIST
      ?auto_3901 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3900 ?auto_3901 ) ( SURFACE-AT ?auto_3898 ?auto_3901 ) ( CLEAR ?auto_3898 ) ( LIFTING ?auto_3900 ?auto_3899 ) ( IS-CRATE ?auto_3899 ) ( not ( = ?auto_3898 ?auto_3899 ) ) )
    :subtasks
    ( ( !DROP ?auto_3900 ?auto_3899 ?auto_3898 ?auto_3901 )
      ( MAKE-1CRATE-VERIFY ?auto_3898 ?auto_3899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3902 - SURFACE
      ?auto_3903 - SURFACE
    )
    :vars
    (
      ?auto_3905 - HOIST
      ?auto_3904 - PLACE
      ?auto_3906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3905 ?auto_3904 ) ( SURFACE-AT ?auto_3902 ?auto_3904 ) ( CLEAR ?auto_3902 ) ( IS-CRATE ?auto_3903 ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( TRUCK-AT ?auto_3906 ?auto_3904 ) ( AVAILABLE ?auto_3905 ) ( IN ?auto_3903 ?auto_3906 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3905 ?auto_3903 ?auto_3906 ?auto_3904 )
      ( MAKE-1CRATE ?auto_3902 ?auto_3903 )
      ( MAKE-1CRATE-VERIFY ?auto_3902 ?auto_3903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3907 - SURFACE
      ?auto_3908 - SURFACE
    )
    :vars
    (
      ?auto_3909 - HOIST
      ?auto_3910 - PLACE
      ?auto_3911 - TRUCK
      ?auto_3912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3909 ?auto_3910 ) ( SURFACE-AT ?auto_3907 ?auto_3910 ) ( CLEAR ?auto_3907 ) ( IS-CRATE ?auto_3908 ) ( not ( = ?auto_3907 ?auto_3908 ) ) ( AVAILABLE ?auto_3909 ) ( IN ?auto_3908 ?auto_3911 ) ( TRUCK-AT ?auto_3911 ?auto_3912 ) ( not ( = ?auto_3912 ?auto_3910 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3911 ?auto_3912 ?auto_3910 )
      ( MAKE-1CRATE ?auto_3907 ?auto_3908 )
      ( MAKE-1CRATE-VERIFY ?auto_3907 ?auto_3908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3913 - SURFACE
      ?auto_3914 - SURFACE
    )
    :vars
    (
      ?auto_3915 - HOIST
      ?auto_3917 - PLACE
      ?auto_3916 - TRUCK
      ?auto_3918 - PLACE
      ?auto_3919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3915 ?auto_3917 ) ( SURFACE-AT ?auto_3913 ?auto_3917 ) ( CLEAR ?auto_3913 ) ( IS-CRATE ?auto_3914 ) ( not ( = ?auto_3913 ?auto_3914 ) ) ( AVAILABLE ?auto_3915 ) ( TRUCK-AT ?auto_3916 ?auto_3918 ) ( not ( = ?auto_3918 ?auto_3917 ) ) ( HOIST-AT ?auto_3919 ?auto_3918 ) ( LIFTING ?auto_3919 ?auto_3914 ) ( not ( = ?auto_3915 ?auto_3919 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3919 ?auto_3914 ?auto_3916 ?auto_3918 )
      ( MAKE-1CRATE ?auto_3913 ?auto_3914 )
      ( MAKE-1CRATE-VERIFY ?auto_3913 ?auto_3914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3920 - SURFACE
      ?auto_3921 - SURFACE
    )
    :vars
    (
      ?auto_3926 - HOIST
      ?auto_3925 - PLACE
      ?auto_3923 - TRUCK
      ?auto_3922 - PLACE
      ?auto_3924 - HOIST
      ?auto_3927 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3926 ?auto_3925 ) ( SURFACE-AT ?auto_3920 ?auto_3925 ) ( CLEAR ?auto_3920 ) ( IS-CRATE ?auto_3921 ) ( not ( = ?auto_3920 ?auto_3921 ) ) ( AVAILABLE ?auto_3926 ) ( TRUCK-AT ?auto_3923 ?auto_3922 ) ( not ( = ?auto_3922 ?auto_3925 ) ) ( HOIST-AT ?auto_3924 ?auto_3922 ) ( not ( = ?auto_3926 ?auto_3924 ) ) ( AVAILABLE ?auto_3924 ) ( SURFACE-AT ?auto_3921 ?auto_3922 ) ( ON ?auto_3921 ?auto_3927 ) ( CLEAR ?auto_3921 ) ( not ( = ?auto_3920 ?auto_3927 ) ) ( not ( = ?auto_3921 ?auto_3927 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3924 ?auto_3921 ?auto_3927 ?auto_3922 )
      ( MAKE-1CRATE ?auto_3920 ?auto_3921 )
      ( MAKE-1CRATE-VERIFY ?auto_3920 ?auto_3921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3928 - SURFACE
      ?auto_3929 - SURFACE
    )
    :vars
    (
      ?auto_3934 - HOIST
      ?auto_3932 - PLACE
      ?auto_3935 - PLACE
      ?auto_3931 - HOIST
      ?auto_3930 - SURFACE
      ?auto_3933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3934 ?auto_3932 ) ( SURFACE-AT ?auto_3928 ?auto_3932 ) ( CLEAR ?auto_3928 ) ( IS-CRATE ?auto_3929 ) ( not ( = ?auto_3928 ?auto_3929 ) ) ( AVAILABLE ?auto_3934 ) ( not ( = ?auto_3935 ?auto_3932 ) ) ( HOIST-AT ?auto_3931 ?auto_3935 ) ( not ( = ?auto_3934 ?auto_3931 ) ) ( AVAILABLE ?auto_3931 ) ( SURFACE-AT ?auto_3929 ?auto_3935 ) ( ON ?auto_3929 ?auto_3930 ) ( CLEAR ?auto_3929 ) ( not ( = ?auto_3928 ?auto_3930 ) ) ( not ( = ?auto_3929 ?auto_3930 ) ) ( TRUCK-AT ?auto_3933 ?auto_3932 ) )
    :subtasks
    ( ( !DRIVE ?auto_3933 ?auto_3932 ?auto_3935 )
      ( MAKE-1CRATE ?auto_3928 ?auto_3929 )
      ( MAKE-1CRATE-VERIFY ?auto_3928 ?auto_3929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3945 - SURFACE
      ?auto_3946 - SURFACE
      ?auto_3947 - SURFACE
    )
    :vars
    (
      ?auto_3948 - HOIST
      ?auto_3949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3948 ?auto_3949 ) ( SURFACE-AT ?auto_3946 ?auto_3949 ) ( CLEAR ?auto_3946 ) ( LIFTING ?auto_3948 ?auto_3947 ) ( IS-CRATE ?auto_3947 ) ( not ( = ?auto_3946 ?auto_3947 ) ) ( ON ?auto_3946 ?auto_3945 ) ( not ( = ?auto_3945 ?auto_3946 ) ) ( not ( = ?auto_3945 ?auto_3947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3946 ?auto_3947 )
      ( MAKE-2CRATE-VERIFY ?auto_3945 ?auto_3946 ?auto_3947 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3955 - SURFACE
      ?auto_3956 - SURFACE
      ?auto_3957 - SURFACE
    )
    :vars
    (
      ?auto_3959 - HOIST
      ?auto_3960 - PLACE
      ?auto_3958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3959 ?auto_3960 ) ( SURFACE-AT ?auto_3956 ?auto_3960 ) ( CLEAR ?auto_3956 ) ( IS-CRATE ?auto_3957 ) ( not ( = ?auto_3956 ?auto_3957 ) ) ( TRUCK-AT ?auto_3958 ?auto_3960 ) ( AVAILABLE ?auto_3959 ) ( IN ?auto_3957 ?auto_3958 ) ( ON ?auto_3956 ?auto_3955 ) ( not ( = ?auto_3955 ?auto_3956 ) ) ( not ( = ?auto_3955 ?auto_3957 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3956 ?auto_3957 )
      ( MAKE-2CRATE-VERIFY ?auto_3955 ?auto_3956 ?auto_3957 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3961 - SURFACE
      ?auto_3962 - SURFACE
    )
    :vars
    (
      ?auto_3964 - HOIST
      ?auto_3963 - PLACE
      ?auto_3966 - TRUCK
      ?auto_3965 - SURFACE
      ?auto_3967 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3964 ?auto_3963 ) ( SURFACE-AT ?auto_3961 ?auto_3963 ) ( CLEAR ?auto_3961 ) ( IS-CRATE ?auto_3962 ) ( not ( = ?auto_3961 ?auto_3962 ) ) ( AVAILABLE ?auto_3964 ) ( IN ?auto_3962 ?auto_3966 ) ( ON ?auto_3961 ?auto_3965 ) ( not ( = ?auto_3965 ?auto_3961 ) ) ( not ( = ?auto_3965 ?auto_3962 ) ) ( TRUCK-AT ?auto_3966 ?auto_3967 ) ( not ( = ?auto_3967 ?auto_3963 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3966 ?auto_3967 ?auto_3963 )
      ( MAKE-2CRATE ?auto_3965 ?auto_3961 ?auto_3962 )
      ( MAKE-1CRATE-VERIFY ?auto_3961 ?auto_3962 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3968 - SURFACE
      ?auto_3969 - SURFACE
      ?auto_3970 - SURFACE
    )
    :vars
    (
      ?auto_3974 - HOIST
      ?auto_3971 - PLACE
      ?auto_3973 - TRUCK
      ?auto_3972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3974 ?auto_3971 ) ( SURFACE-AT ?auto_3969 ?auto_3971 ) ( CLEAR ?auto_3969 ) ( IS-CRATE ?auto_3970 ) ( not ( = ?auto_3969 ?auto_3970 ) ) ( AVAILABLE ?auto_3974 ) ( IN ?auto_3970 ?auto_3973 ) ( ON ?auto_3969 ?auto_3968 ) ( not ( = ?auto_3968 ?auto_3969 ) ) ( not ( = ?auto_3968 ?auto_3970 ) ) ( TRUCK-AT ?auto_3973 ?auto_3972 ) ( not ( = ?auto_3972 ?auto_3971 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3969 ?auto_3970 )
      ( MAKE-2CRATE-VERIFY ?auto_3968 ?auto_3969 ?auto_3970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3975 - SURFACE
      ?auto_3976 - SURFACE
    )
    :vars
    (
      ?auto_3981 - HOIST
      ?auto_3977 - PLACE
      ?auto_3979 - SURFACE
      ?auto_3978 - TRUCK
      ?auto_3980 - PLACE
      ?auto_3982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3981 ?auto_3977 ) ( SURFACE-AT ?auto_3975 ?auto_3977 ) ( CLEAR ?auto_3975 ) ( IS-CRATE ?auto_3976 ) ( not ( = ?auto_3975 ?auto_3976 ) ) ( AVAILABLE ?auto_3981 ) ( ON ?auto_3975 ?auto_3979 ) ( not ( = ?auto_3979 ?auto_3975 ) ) ( not ( = ?auto_3979 ?auto_3976 ) ) ( TRUCK-AT ?auto_3978 ?auto_3980 ) ( not ( = ?auto_3980 ?auto_3977 ) ) ( HOIST-AT ?auto_3982 ?auto_3980 ) ( LIFTING ?auto_3982 ?auto_3976 ) ( not ( = ?auto_3981 ?auto_3982 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3982 ?auto_3976 ?auto_3978 ?auto_3980 )
      ( MAKE-2CRATE ?auto_3979 ?auto_3975 ?auto_3976 )
      ( MAKE-1CRATE-VERIFY ?auto_3975 ?auto_3976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3983 - SURFACE
      ?auto_3984 - SURFACE
      ?auto_3985 - SURFACE
    )
    :vars
    (
      ?auto_3989 - HOIST
      ?auto_3987 - PLACE
      ?auto_3990 - TRUCK
      ?auto_3986 - PLACE
      ?auto_3988 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3989 ?auto_3987 ) ( SURFACE-AT ?auto_3984 ?auto_3987 ) ( CLEAR ?auto_3984 ) ( IS-CRATE ?auto_3985 ) ( not ( = ?auto_3984 ?auto_3985 ) ) ( AVAILABLE ?auto_3989 ) ( ON ?auto_3984 ?auto_3983 ) ( not ( = ?auto_3983 ?auto_3984 ) ) ( not ( = ?auto_3983 ?auto_3985 ) ) ( TRUCK-AT ?auto_3990 ?auto_3986 ) ( not ( = ?auto_3986 ?auto_3987 ) ) ( HOIST-AT ?auto_3988 ?auto_3986 ) ( LIFTING ?auto_3988 ?auto_3985 ) ( not ( = ?auto_3989 ?auto_3988 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3984 ?auto_3985 )
      ( MAKE-2CRATE-VERIFY ?auto_3983 ?auto_3984 ?auto_3985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3991 - SURFACE
      ?auto_3992 - SURFACE
    )
    :vars
    (
      ?auto_3996 - HOIST
      ?auto_3993 - PLACE
      ?auto_3998 - SURFACE
      ?auto_3994 - TRUCK
      ?auto_3997 - PLACE
      ?auto_3995 - HOIST
      ?auto_3999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3996 ?auto_3993 ) ( SURFACE-AT ?auto_3991 ?auto_3993 ) ( CLEAR ?auto_3991 ) ( IS-CRATE ?auto_3992 ) ( not ( = ?auto_3991 ?auto_3992 ) ) ( AVAILABLE ?auto_3996 ) ( ON ?auto_3991 ?auto_3998 ) ( not ( = ?auto_3998 ?auto_3991 ) ) ( not ( = ?auto_3998 ?auto_3992 ) ) ( TRUCK-AT ?auto_3994 ?auto_3997 ) ( not ( = ?auto_3997 ?auto_3993 ) ) ( HOIST-AT ?auto_3995 ?auto_3997 ) ( not ( = ?auto_3996 ?auto_3995 ) ) ( AVAILABLE ?auto_3995 ) ( SURFACE-AT ?auto_3992 ?auto_3997 ) ( ON ?auto_3992 ?auto_3999 ) ( CLEAR ?auto_3992 ) ( not ( = ?auto_3991 ?auto_3999 ) ) ( not ( = ?auto_3992 ?auto_3999 ) ) ( not ( = ?auto_3998 ?auto_3999 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3995 ?auto_3992 ?auto_3999 ?auto_3997 )
      ( MAKE-2CRATE ?auto_3998 ?auto_3991 ?auto_3992 )
      ( MAKE-1CRATE-VERIFY ?auto_3991 ?auto_3992 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4000 - SURFACE
      ?auto_4001 - SURFACE
      ?auto_4002 - SURFACE
    )
    :vars
    (
      ?auto_4007 - HOIST
      ?auto_4004 - PLACE
      ?auto_4003 - TRUCK
      ?auto_4006 - PLACE
      ?auto_4005 - HOIST
      ?auto_4008 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4007 ?auto_4004 ) ( SURFACE-AT ?auto_4001 ?auto_4004 ) ( CLEAR ?auto_4001 ) ( IS-CRATE ?auto_4002 ) ( not ( = ?auto_4001 ?auto_4002 ) ) ( AVAILABLE ?auto_4007 ) ( ON ?auto_4001 ?auto_4000 ) ( not ( = ?auto_4000 ?auto_4001 ) ) ( not ( = ?auto_4000 ?auto_4002 ) ) ( TRUCK-AT ?auto_4003 ?auto_4006 ) ( not ( = ?auto_4006 ?auto_4004 ) ) ( HOIST-AT ?auto_4005 ?auto_4006 ) ( not ( = ?auto_4007 ?auto_4005 ) ) ( AVAILABLE ?auto_4005 ) ( SURFACE-AT ?auto_4002 ?auto_4006 ) ( ON ?auto_4002 ?auto_4008 ) ( CLEAR ?auto_4002 ) ( not ( = ?auto_4001 ?auto_4008 ) ) ( not ( = ?auto_4002 ?auto_4008 ) ) ( not ( = ?auto_4000 ?auto_4008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4001 ?auto_4002 )
      ( MAKE-2CRATE-VERIFY ?auto_4000 ?auto_4001 ?auto_4002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4009 - SURFACE
      ?auto_4010 - SURFACE
    )
    :vars
    (
      ?auto_4017 - HOIST
      ?auto_4012 - PLACE
      ?auto_4015 - SURFACE
      ?auto_4011 - PLACE
      ?auto_4016 - HOIST
      ?auto_4014 - SURFACE
      ?auto_4013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4017 ?auto_4012 ) ( SURFACE-AT ?auto_4009 ?auto_4012 ) ( CLEAR ?auto_4009 ) ( IS-CRATE ?auto_4010 ) ( not ( = ?auto_4009 ?auto_4010 ) ) ( AVAILABLE ?auto_4017 ) ( ON ?auto_4009 ?auto_4015 ) ( not ( = ?auto_4015 ?auto_4009 ) ) ( not ( = ?auto_4015 ?auto_4010 ) ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( HOIST-AT ?auto_4016 ?auto_4011 ) ( not ( = ?auto_4017 ?auto_4016 ) ) ( AVAILABLE ?auto_4016 ) ( SURFACE-AT ?auto_4010 ?auto_4011 ) ( ON ?auto_4010 ?auto_4014 ) ( CLEAR ?auto_4010 ) ( not ( = ?auto_4009 ?auto_4014 ) ) ( not ( = ?auto_4010 ?auto_4014 ) ) ( not ( = ?auto_4015 ?auto_4014 ) ) ( TRUCK-AT ?auto_4013 ?auto_4012 ) )
    :subtasks
    ( ( !DRIVE ?auto_4013 ?auto_4012 ?auto_4011 )
      ( MAKE-2CRATE ?auto_4015 ?auto_4009 ?auto_4010 )
      ( MAKE-1CRATE-VERIFY ?auto_4009 ?auto_4010 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4018 - SURFACE
      ?auto_4019 - SURFACE
      ?auto_4020 - SURFACE
    )
    :vars
    (
      ?auto_4022 - HOIST
      ?auto_4023 - PLACE
      ?auto_4024 - PLACE
      ?auto_4025 - HOIST
      ?auto_4021 - SURFACE
      ?auto_4026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4022 ?auto_4023 ) ( SURFACE-AT ?auto_4019 ?auto_4023 ) ( CLEAR ?auto_4019 ) ( IS-CRATE ?auto_4020 ) ( not ( = ?auto_4019 ?auto_4020 ) ) ( AVAILABLE ?auto_4022 ) ( ON ?auto_4019 ?auto_4018 ) ( not ( = ?auto_4018 ?auto_4019 ) ) ( not ( = ?auto_4018 ?auto_4020 ) ) ( not ( = ?auto_4024 ?auto_4023 ) ) ( HOIST-AT ?auto_4025 ?auto_4024 ) ( not ( = ?auto_4022 ?auto_4025 ) ) ( AVAILABLE ?auto_4025 ) ( SURFACE-AT ?auto_4020 ?auto_4024 ) ( ON ?auto_4020 ?auto_4021 ) ( CLEAR ?auto_4020 ) ( not ( = ?auto_4019 ?auto_4021 ) ) ( not ( = ?auto_4020 ?auto_4021 ) ) ( not ( = ?auto_4018 ?auto_4021 ) ) ( TRUCK-AT ?auto_4026 ?auto_4023 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4019 ?auto_4020 )
      ( MAKE-2CRATE-VERIFY ?auto_4018 ?auto_4019 ?auto_4020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4027 - SURFACE
      ?auto_4028 - SURFACE
    )
    :vars
    (
      ?auto_4032 - HOIST
      ?auto_4029 - PLACE
      ?auto_4033 - SURFACE
      ?auto_4030 - PLACE
      ?auto_4034 - HOIST
      ?auto_4035 - SURFACE
      ?auto_4031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4032 ?auto_4029 ) ( IS-CRATE ?auto_4028 ) ( not ( = ?auto_4027 ?auto_4028 ) ) ( not ( = ?auto_4033 ?auto_4027 ) ) ( not ( = ?auto_4033 ?auto_4028 ) ) ( not ( = ?auto_4030 ?auto_4029 ) ) ( HOIST-AT ?auto_4034 ?auto_4030 ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( AVAILABLE ?auto_4034 ) ( SURFACE-AT ?auto_4028 ?auto_4030 ) ( ON ?auto_4028 ?auto_4035 ) ( CLEAR ?auto_4028 ) ( not ( = ?auto_4027 ?auto_4035 ) ) ( not ( = ?auto_4028 ?auto_4035 ) ) ( not ( = ?auto_4033 ?auto_4035 ) ) ( TRUCK-AT ?auto_4031 ?auto_4029 ) ( SURFACE-AT ?auto_4033 ?auto_4029 ) ( CLEAR ?auto_4033 ) ( LIFTING ?auto_4032 ?auto_4027 ) ( IS-CRATE ?auto_4027 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4033 ?auto_4027 )
      ( MAKE-2CRATE ?auto_4033 ?auto_4027 ?auto_4028 )
      ( MAKE-1CRATE-VERIFY ?auto_4027 ?auto_4028 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4036 - SURFACE
      ?auto_4037 - SURFACE
      ?auto_4038 - SURFACE
    )
    :vars
    (
      ?auto_4044 - HOIST
      ?auto_4039 - PLACE
      ?auto_4040 - PLACE
      ?auto_4043 - HOIST
      ?auto_4041 - SURFACE
      ?auto_4042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4044 ?auto_4039 ) ( IS-CRATE ?auto_4038 ) ( not ( = ?auto_4037 ?auto_4038 ) ) ( not ( = ?auto_4036 ?auto_4037 ) ) ( not ( = ?auto_4036 ?auto_4038 ) ) ( not ( = ?auto_4040 ?auto_4039 ) ) ( HOIST-AT ?auto_4043 ?auto_4040 ) ( not ( = ?auto_4044 ?auto_4043 ) ) ( AVAILABLE ?auto_4043 ) ( SURFACE-AT ?auto_4038 ?auto_4040 ) ( ON ?auto_4038 ?auto_4041 ) ( CLEAR ?auto_4038 ) ( not ( = ?auto_4037 ?auto_4041 ) ) ( not ( = ?auto_4038 ?auto_4041 ) ) ( not ( = ?auto_4036 ?auto_4041 ) ) ( TRUCK-AT ?auto_4042 ?auto_4039 ) ( SURFACE-AT ?auto_4036 ?auto_4039 ) ( CLEAR ?auto_4036 ) ( LIFTING ?auto_4044 ?auto_4037 ) ( IS-CRATE ?auto_4037 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4037 ?auto_4038 )
      ( MAKE-2CRATE-VERIFY ?auto_4036 ?auto_4037 ?auto_4038 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4045 - SURFACE
      ?auto_4046 - SURFACE
    )
    :vars
    (
      ?auto_4052 - HOIST
      ?auto_4051 - PLACE
      ?auto_4050 - SURFACE
      ?auto_4053 - PLACE
      ?auto_4048 - HOIST
      ?auto_4049 - SURFACE
      ?auto_4047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4052 ?auto_4051 ) ( IS-CRATE ?auto_4046 ) ( not ( = ?auto_4045 ?auto_4046 ) ) ( not ( = ?auto_4050 ?auto_4045 ) ) ( not ( = ?auto_4050 ?auto_4046 ) ) ( not ( = ?auto_4053 ?auto_4051 ) ) ( HOIST-AT ?auto_4048 ?auto_4053 ) ( not ( = ?auto_4052 ?auto_4048 ) ) ( AVAILABLE ?auto_4048 ) ( SURFACE-AT ?auto_4046 ?auto_4053 ) ( ON ?auto_4046 ?auto_4049 ) ( CLEAR ?auto_4046 ) ( not ( = ?auto_4045 ?auto_4049 ) ) ( not ( = ?auto_4046 ?auto_4049 ) ) ( not ( = ?auto_4050 ?auto_4049 ) ) ( TRUCK-AT ?auto_4047 ?auto_4051 ) ( SURFACE-AT ?auto_4050 ?auto_4051 ) ( CLEAR ?auto_4050 ) ( IS-CRATE ?auto_4045 ) ( AVAILABLE ?auto_4052 ) ( IN ?auto_4045 ?auto_4047 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4052 ?auto_4045 ?auto_4047 ?auto_4051 )
      ( MAKE-2CRATE ?auto_4050 ?auto_4045 ?auto_4046 )
      ( MAKE-1CRATE-VERIFY ?auto_4045 ?auto_4046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4054 - SURFACE
      ?auto_4055 - SURFACE
      ?auto_4056 - SURFACE
    )
    :vars
    (
      ?auto_4062 - HOIST
      ?auto_4059 - PLACE
      ?auto_4058 - PLACE
      ?auto_4057 - HOIST
      ?auto_4061 - SURFACE
      ?auto_4060 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4062 ?auto_4059 ) ( IS-CRATE ?auto_4056 ) ( not ( = ?auto_4055 ?auto_4056 ) ) ( not ( = ?auto_4054 ?auto_4055 ) ) ( not ( = ?auto_4054 ?auto_4056 ) ) ( not ( = ?auto_4058 ?auto_4059 ) ) ( HOIST-AT ?auto_4057 ?auto_4058 ) ( not ( = ?auto_4062 ?auto_4057 ) ) ( AVAILABLE ?auto_4057 ) ( SURFACE-AT ?auto_4056 ?auto_4058 ) ( ON ?auto_4056 ?auto_4061 ) ( CLEAR ?auto_4056 ) ( not ( = ?auto_4055 ?auto_4061 ) ) ( not ( = ?auto_4056 ?auto_4061 ) ) ( not ( = ?auto_4054 ?auto_4061 ) ) ( TRUCK-AT ?auto_4060 ?auto_4059 ) ( SURFACE-AT ?auto_4054 ?auto_4059 ) ( CLEAR ?auto_4054 ) ( IS-CRATE ?auto_4055 ) ( AVAILABLE ?auto_4062 ) ( IN ?auto_4055 ?auto_4060 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4055 ?auto_4056 )
      ( MAKE-2CRATE-VERIFY ?auto_4054 ?auto_4055 ?auto_4056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4063 - SURFACE
      ?auto_4064 - SURFACE
    )
    :vars
    (
      ?auto_4068 - HOIST
      ?auto_4069 - PLACE
      ?auto_4065 - SURFACE
      ?auto_4070 - PLACE
      ?auto_4067 - HOIST
      ?auto_4071 - SURFACE
      ?auto_4066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4068 ?auto_4069 ) ( IS-CRATE ?auto_4064 ) ( not ( = ?auto_4063 ?auto_4064 ) ) ( not ( = ?auto_4065 ?auto_4063 ) ) ( not ( = ?auto_4065 ?auto_4064 ) ) ( not ( = ?auto_4070 ?auto_4069 ) ) ( HOIST-AT ?auto_4067 ?auto_4070 ) ( not ( = ?auto_4068 ?auto_4067 ) ) ( AVAILABLE ?auto_4067 ) ( SURFACE-AT ?auto_4064 ?auto_4070 ) ( ON ?auto_4064 ?auto_4071 ) ( CLEAR ?auto_4064 ) ( not ( = ?auto_4063 ?auto_4071 ) ) ( not ( = ?auto_4064 ?auto_4071 ) ) ( not ( = ?auto_4065 ?auto_4071 ) ) ( SURFACE-AT ?auto_4065 ?auto_4069 ) ( CLEAR ?auto_4065 ) ( IS-CRATE ?auto_4063 ) ( AVAILABLE ?auto_4068 ) ( IN ?auto_4063 ?auto_4066 ) ( TRUCK-AT ?auto_4066 ?auto_4070 ) )
    :subtasks
    ( ( !DRIVE ?auto_4066 ?auto_4070 ?auto_4069 )
      ( MAKE-2CRATE ?auto_4065 ?auto_4063 ?auto_4064 )
      ( MAKE-1CRATE-VERIFY ?auto_4063 ?auto_4064 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4072 - SURFACE
      ?auto_4073 - SURFACE
      ?auto_4074 - SURFACE
    )
    :vars
    (
      ?auto_4080 - HOIST
      ?auto_4078 - PLACE
      ?auto_4075 - PLACE
      ?auto_4079 - HOIST
      ?auto_4076 - SURFACE
      ?auto_4077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4080 ?auto_4078 ) ( IS-CRATE ?auto_4074 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4072 ?auto_4073 ) ) ( not ( = ?auto_4072 ?auto_4074 ) ) ( not ( = ?auto_4075 ?auto_4078 ) ) ( HOIST-AT ?auto_4079 ?auto_4075 ) ( not ( = ?auto_4080 ?auto_4079 ) ) ( AVAILABLE ?auto_4079 ) ( SURFACE-AT ?auto_4074 ?auto_4075 ) ( ON ?auto_4074 ?auto_4076 ) ( CLEAR ?auto_4074 ) ( not ( = ?auto_4073 ?auto_4076 ) ) ( not ( = ?auto_4074 ?auto_4076 ) ) ( not ( = ?auto_4072 ?auto_4076 ) ) ( SURFACE-AT ?auto_4072 ?auto_4078 ) ( CLEAR ?auto_4072 ) ( IS-CRATE ?auto_4073 ) ( AVAILABLE ?auto_4080 ) ( IN ?auto_4073 ?auto_4077 ) ( TRUCK-AT ?auto_4077 ?auto_4075 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4073 ?auto_4074 )
      ( MAKE-2CRATE-VERIFY ?auto_4072 ?auto_4073 ?auto_4074 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4081 - SURFACE
      ?auto_4082 - SURFACE
    )
    :vars
    (
      ?auto_4084 - HOIST
      ?auto_4083 - PLACE
      ?auto_4088 - SURFACE
      ?auto_4087 - PLACE
      ?auto_4086 - HOIST
      ?auto_4089 - SURFACE
      ?auto_4085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4084 ?auto_4083 ) ( IS-CRATE ?auto_4082 ) ( not ( = ?auto_4081 ?auto_4082 ) ) ( not ( = ?auto_4088 ?auto_4081 ) ) ( not ( = ?auto_4088 ?auto_4082 ) ) ( not ( = ?auto_4087 ?auto_4083 ) ) ( HOIST-AT ?auto_4086 ?auto_4087 ) ( not ( = ?auto_4084 ?auto_4086 ) ) ( SURFACE-AT ?auto_4082 ?auto_4087 ) ( ON ?auto_4082 ?auto_4089 ) ( CLEAR ?auto_4082 ) ( not ( = ?auto_4081 ?auto_4089 ) ) ( not ( = ?auto_4082 ?auto_4089 ) ) ( not ( = ?auto_4088 ?auto_4089 ) ) ( SURFACE-AT ?auto_4088 ?auto_4083 ) ( CLEAR ?auto_4088 ) ( IS-CRATE ?auto_4081 ) ( AVAILABLE ?auto_4084 ) ( TRUCK-AT ?auto_4085 ?auto_4087 ) ( LIFTING ?auto_4086 ?auto_4081 ) )
    :subtasks
    ( ( !LOAD ?auto_4086 ?auto_4081 ?auto_4085 ?auto_4087 )
      ( MAKE-2CRATE ?auto_4088 ?auto_4081 ?auto_4082 )
      ( MAKE-1CRATE-VERIFY ?auto_4081 ?auto_4082 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4090 - SURFACE
      ?auto_4091 - SURFACE
      ?auto_4092 - SURFACE
    )
    :vars
    (
      ?auto_4097 - HOIST
      ?auto_4093 - PLACE
      ?auto_4094 - PLACE
      ?auto_4096 - HOIST
      ?auto_4095 - SURFACE
      ?auto_4098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4097 ?auto_4093 ) ( IS-CRATE ?auto_4092 ) ( not ( = ?auto_4091 ?auto_4092 ) ) ( not ( = ?auto_4090 ?auto_4091 ) ) ( not ( = ?auto_4090 ?auto_4092 ) ) ( not ( = ?auto_4094 ?auto_4093 ) ) ( HOIST-AT ?auto_4096 ?auto_4094 ) ( not ( = ?auto_4097 ?auto_4096 ) ) ( SURFACE-AT ?auto_4092 ?auto_4094 ) ( ON ?auto_4092 ?auto_4095 ) ( CLEAR ?auto_4092 ) ( not ( = ?auto_4091 ?auto_4095 ) ) ( not ( = ?auto_4092 ?auto_4095 ) ) ( not ( = ?auto_4090 ?auto_4095 ) ) ( SURFACE-AT ?auto_4090 ?auto_4093 ) ( CLEAR ?auto_4090 ) ( IS-CRATE ?auto_4091 ) ( AVAILABLE ?auto_4097 ) ( TRUCK-AT ?auto_4098 ?auto_4094 ) ( LIFTING ?auto_4096 ?auto_4091 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4091 ?auto_4092 )
      ( MAKE-2CRATE-VERIFY ?auto_4090 ?auto_4091 ?auto_4092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4099 - SURFACE
      ?auto_4100 - SURFACE
    )
    :vars
    (
      ?auto_4104 - HOIST
      ?auto_4102 - PLACE
      ?auto_4101 - SURFACE
      ?auto_4103 - PLACE
      ?auto_4107 - HOIST
      ?auto_4106 - SURFACE
      ?auto_4105 - TRUCK
      ?auto_4108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4104 ?auto_4102 ) ( IS-CRATE ?auto_4100 ) ( not ( = ?auto_4099 ?auto_4100 ) ) ( not ( = ?auto_4101 ?auto_4099 ) ) ( not ( = ?auto_4101 ?auto_4100 ) ) ( not ( = ?auto_4103 ?auto_4102 ) ) ( HOIST-AT ?auto_4107 ?auto_4103 ) ( not ( = ?auto_4104 ?auto_4107 ) ) ( SURFACE-AT ?auto_4100 ?auto_4103 ) ( ON ?auto_4100 ?auto_4106 ) ( CLEAR ?auto_4100 ) ( not ( = ?auto_4099 ?auto_4106 ) ) ( not ( = ?auto_4100 ?auto_4106 ) ) ( not ( = ?auto_4101 ?auto_4106 ) ) ( SURFACE-AT ?auto_4101 ?auto_4102 ) ( CLEAR ?auto_4101 ) ( IS-CRATE ?auto_4099 ) ( AVAILABLE ?auto_4104 ) ( TRUCK-AT ?auto_4105 ?auto_4103 ) ( AVAILABLE ?auto_4107 ) ( SURFACE-AT ?auto_4099 ?auto_4103 ) ( ON ?auto_4099 ?auto_4108 ) ( CLEAR ?auto_4099 ) ( not ( = ?auto_4099 ?auto_4108 ) ) ( not ( = ?auto_4100 ?auto_4108 ) ) ( not ( = ?auto_4101 ?auto_4108 ) ) ( not ( = ?auto_4106 ?auto_4108 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4107 ?auto_4099 ?auto_4108 ?auto_4103 )
      ( MAKE-2CRATE ?auto_4101 ?auto_4099 ?auto_4100 )
      ( MAKE-1CRATE-VERIFY ?auto_4099 ?auto_4100 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4109 - SURFACE
      ?auto_4110 - SURFACE
      ?auto_4111 - SURFACE
    )
    :vars
    (
      ?auto_4117 - HOIST
      ?auto_4115 - PLACE
      ?auto_4118 - PLACE
      ?auto_4112 - HOIST
      ?auto_4114 - SURFACE
      ?auto_4116 - TRUCK
      ?auto_4113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4117 ?auto_4115 ) ( IS-CRATE ?auto_4111 ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4111 ) ) ( not ( = ?auto_4118 ?auto_4115 ) ) ( HOIST-AT ?auto_4112 ?auto_4118 ) ( not ( = ?auto_4117 ?auto_4112 ) ) ( SURFACE-AT ?auto_4111 ?auto_4118 ) ( ON ?auto_4111 ?auto_4114 ) ( CLEAR ?auto_4111 ) ( not ( = ?auto_4110 ?auto_4114 ) ) ( not ( = ?auto_4111 ?auto_4114 ) ) ( not ( = ?auto_4109 ?auto_4114 ) ) ( SURFACE-AT ?auto_4109 ?auto_4115 ) ( CLEAR ?auto_4109 ) ( IS-CRATE ?auto_4110 ) ( AVAILABLE ?auto_4117 ) ( TRUCK-AT ?auto_4116 ?auto_4118 ) ( AVAILABLE ?auto_4112 ) ( SURFACE-AT ?auto_4110 ?auto_4118 ) ( ON ?auto_4110 ?auto_4113 ) ( CLEAR ?auto_4110 ) ( not ( = ?auto_4110 ?auto_4113 ) ) ( not ( = ?auto_4111 ?auto_4113 ) ) ( not ( = ?auto_4109 ?auto_4113 ) ) ( not ( = ?auto_4114 ?auto_4113 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4110 ?auto_4111 )
      ( MAKE-2CRATE-VERIFY ?auto_4109 ?auto_4110 ?auto_4111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4119 - SURFACE
      ?auto_4120 - SURFACE
    )
    :vars
    (
      ?auto_4127 - HOIST
      ?auto_4122 - PLACE
      ?auto_4128 - SURFACE
      ?auto_4124 - PLACE
      ?auto_4121 - HOIST
      ?auto_4125 - SURFACE
      ?auto_4126 - SURFACE
      ?auto_4123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4127 ?auto_4122 ) ( IS-CRATE ?auto_4120 ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( not ( = ?auto_4128 ?auto_4119 ) ) ( not ( = ?auto_4128 ?auto_4120 ) ) ( not ( = ?auto_4124 ?auto_4122 ) ) ( HOIST-AT ?auto_4121 ?auto_4124 ) ( not ( = ?auto_4127 ?auto_4121 ) ) ( SURFACE-AT ?auto_4120 ?auto_4124 ) ( ON ?auto_4120 ?auto_4125 ) ( CLEAR ?auto_4120 ) ( not ( = ?auto_4119 ?auto_4125 ) ) ( not ( = ?auto_4120 ?auto_4125 ) ) ( not ( = ?auto_4128 ?auto_4125 ) ) ( SURFACE-AT ?auto_4128 ?auto_4122 ) ( CLEAR ?auto_4128 ) ( IS-CRATE ?auto_4119 ) ( AVAILABLE ?auto_4127 ) ( AVAILABLE ?auto_4121 ) ( SURFACE-AT ?auto_4119 ?auto_4124 ) ( ON ?auto_4119 ?auto_4126 ) ( CLEAR ?auto_4119 ) ( not ( = ?auto_4119 ?auto_4126 ) ) ( not ( = ?auto_4120 ?auto_4126 ) ) ( not ( = ?auto_4128 ?auto_4126 ) ) ( not ( = ?auto_4125 ?auto_4126 ) ) ( TRUCK-AT ?auto_4123 ?auto_4122 ) )
    :subtasks
    ( ( !DRIVE ?auto_4123 ?auto_4122 ?auto_4124 )
      ( MAKE-2CRATE ?auto_4128 ?auto_4119 ?auto_4120 )
      ( MAKE-1CRATE-VERIFY ?auto_4119 ?auto_4120 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4129 - SURFACE
      ?auto_4130 - SURFACE
      ?auto_4131 - SURFACE
    )
    :vars
    (
      ?auto_4135 - HOIST
      ?auto_4132 - PLACE
      ?auto_4136 - PLACE
      ?auto_4137 - HOIST
      ?auto_4138 - SURFACE
      ?auto_4134 - SURFACE
      ?auto_4133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4135 ?auto_4132 ) ( IS-CRATE ?auto_4131 ) ( not ( = ?auto_4130 ?auto_4131 ) ) ( not ( = ?auto_4129 ?auto_4130 ) ) ( not ( = ?auto_4129 ?auto_4131 ) ) ( not ( = ?auto_4136 ?auto_4132 ) ) ( HOIST-AT ?auto_4137 ?auto_4136 ) ( not ( = ?auto_4135 ?auto_4137 ) ) ( SURFACE-AT ?auto_4131 ?auto_4136 ) ( ON ?auto_4131 ?auto_4138 ) ( CLEAR ?auto_4131 ) ( not ( = ?auto_4130 ?auto_4138 ) ) ( not ( = ?auto_4131 ?auto_4138 ) ) ( not ( = ?auto_4129 ?auto_4138 ) ) ( SURFACE-AT ?auto_4129 ?auto_4132 ) ( CLEAR ?auto_4129 ) ( IS-CRATE ?auto_4130 ) ( AVAILABLE ?auto_4135 ) ( AVAILABLE ?auto_4137 ) ( SURFACE-AT ?auto_4130 ?auto_4136 ) ( ON ?auto_4130 ?auto_4134 ) ( CLEAR ?auto_4130 ) ( not ( = ?auto_4130 ?auto_4134 ) ) ( not ( = ?auto_4131 ?auto_4134 ) ) ( not ( = ?auto_4129 ?auto_4134 ) ) ( not ( = ?auto_4138 ?auto_4134 ) ) ( TRUCK-AT ?auto_4133 ?auto_4132 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4130 ?auto_4131 )
      ( MAKE-2CRATE-VERIFY ?auto_4129 ?auto_4130 ?auto_4131 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4158 - SURFACE
      ?auto_4159 - SURFACE
      ?auto_4160 - SURFACE
      ?auto_4157 - SURFACE
    )
    :vars
    (
      ?auto_4162 - HOIST
      ?auto_4161 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4162 ?auto_4161 ) ( SURFACE-AT ?auto_4160 ?auto_4161 ) ( CLEAR ?auto_4160 ) ( LIFTING ?auto_4162 ?auto_4157 ) ( IS-CRATE ?auto_4157 ) ( not ( = ?auto_4160 ?auto_4157 ) ) ( ON ?auto_4159 ?auto_4158 ) ( ON ?auto_4160 ?auto_4159 ) ( not ( = ?auto_4158 ?auto_4159 ) ) ( not ( = ?auto_4158 ?auto_4160 ) ) ( not ( = ?auto_4158 ?auto_4157 ) ) ( not ( = ?auto_4159 ?auto_4160 ) ) ( not ( = ?auto_4159 ?auto_4157 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4160 ?auto_4157 )
      ( MAKE-3CRATE-VERIFY ?auto_4158 ?auto_4159 ?auto_4160 ?auto_4157 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4175 - SURFACE
      ?auto_4176 - SURFACE
      ?auto_4177 - SURFACE
      ?auto_4174 - SURFACE
    )
    :vars
    (
      ?auto_4179 - HOIST
      ?auto_4178 - PLACE
      ?auto_4180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4179 ?auto_4178 ) ( SURFACE-AT ?auto_4177 ?auto_4178 ) ( CLEAR ?auto_4177 ) ( IS-CRATE ?auto_4174 ) ( not ( = ?auto_4177 ?auto_4174 ) ) ( TRUCK-AT ?auto_4180 ?auto_4178 ) ( AVAILABLE ?auto_4179 ) ( IN ?auto_4174 ?auto_4180 ) ( ON ?auto_4177 ?auto_4176 ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( not ( = ?auto_4176 ?auto_4174 ) ) ( ON ?auto_4176 ?auto_4175 ) ( not ( = ?auto_4175 ?auto_4176 ) ) ( not ( = ?auto_4175 ?auto_4177 ) ) ( not ( = ?auto_4175 ?auto_4174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4176 ?auto_4177 ?auto_4174 )
      ( MAKE-3CRATE-VERIFY ?auto_4175 ?auto_4176 ?auto_4177 ?auto_4174 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4196 - SURFACE
      ?auto_4197 - SURFACE
      ?auto_4198 - SURFACE
      ?auto_4195 - SURFACE
    )
    :vars
    (
      ?auto_4199 - HOIST
      ?auto_4200 - PLACE
      ?auto_4202 - TRUCK
      ?auto_4201 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4199 ?auto_4200 ) ( SURFACE-AT ?auto_4198 ?auto_4200 ) ( CLEAR ?auto_4198 ) ( IS-CRATE ?auto_4195 ) ( not ( = ?auto_4198 ?auto_4195 ) ) ( AVAILABLE ?auto_4199 ) ( IN ?auto_4195 ?auto_4202 ) ( ON ?auto_4198 ?auto_4197 ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( not ( = ?auto_4197 ?auto_4195 ) ) ( TRUCK-AT ?auto_4202 ?auto_4201 ) ( not ( = ?auto_4201 ?auto_4200 ) ) ( ON ?auto_4197 ?auto_4196 ) ( not ( = ?auto_4196 ?auto_4197 ) ) ( not ( = ?auto_4196 ?auto_4198 ) ) ( not ( = ?auto_4196 ?auto_4195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4197 ?auto_4198 ?auto_4195 )
      ( MAKE-3CRATE-VERIFY ?auto_4196 ?auto_4197 ?auto_4198 ?auto_4195 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4220 - SURFACE
      ?auto_4221 - SURFACE
      ?auto_4222 - SURFACE
      ?auto_4219 - SURFACE
    )
    :vars
    (
      ?auto_4226 - HOIST
      ?auto_4223 - PLACE
      ?auto_4225 - TRUCK
      ?auto_4227 - PLACE
      ?auto_4224 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4226 ?auto_4223 ) ( SURFACE-AT ?auto_4222 ?auto_4223 ) ( CLEAR ?auto_4222 ) ( IS-CRATE ?auto_4219 ) ( not ( = ?auto_4222 ?auto_4219 ) ) ( AVAILABLE ?auto_4226 ) ( ON ?auto_4222 ?auto_4221 ) ( not ( = ?auto_4221 ?auto_4222 ) ) ( not ( = ?auto_4221 ?auto_4219 ) ) ( TRUCK-AT ?auto_4225 ?auto_4227 ) ( not ( = ?auto_4227 ?auto_4223 ) ) ( HOIST-AT ?auto_4224 ?auto_4227 ) ( LIFTING ?auto_4224 ?auto_4219 ) ( not ( = ?auto_4226 ?auto_4224 ) ) ( ON ?auto_4221 ?auto_4220 ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( not ( = ?auto_4220 ?auto_4219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4221 ?auto_4222 ?auto_4219 )
      ( MAKE-3CRATE-VERIFY ?auto_4220 ?auto_4221 ?auto_4222 ?auto_4219 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4247 - SURFACE
      ?auto_4248 - SURFACE
      ?auto_4249 - SURFACE
      ?auto_4246 - SURFACE
    )
    :vars
    (
      ?auto_4250 - HOIST
      ?auto_4255 - PLACE
      ?auto_4252 - TRUCK
      ?auto_4253 - PLACE
      ?auto_4254 - HOIST
      ?auto_4251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4250 ?auto_4255 ) ( SURFACE-AT ?auto_4249 ?auto_4255 ) ( CLEAR ?auto_4249 ) ( IS-CRATE ?auto_4246 ) ( not ( = ?auto_4249 ?auto_4246 ) ) ( AVAILABLE ?auto_4250 ) ( ON ?auto_4249 ?auto_4248 ) ( not ( = ?auto_4248 ?auto_4249 ) ) ( not ( = ?auto_4248 ?auto_4246 ) ) ( TRUCK-AT ?auto_4252 ?auto_4253 ) ( not ( = ?auto_4253 ?auto_4255 ) ) ( HOIST-AT ?auto_4254 ?auto_4253 ) ( not ( = ?auto_4250 ?auto_4254 ) ) ( AVAILABLE ?auto_4254 ) ( SURFACE-AT ?auto_4246 ?auto_4253 ) ( ON ?auto_4246 ?auto_4251 ) ( CLEAR ?auto_4246 ) ( not ( = ?auto_4249 ?auto_4251 ) ) ( not ( = ?auto_4246 ?auto_4251 ) ) ( not ( = ?auto_4248 ?auto_4251 ) ) ( ON ?auto_4248 ?auto_4247 ) ( not ( = ?auto_4247 ?auto_4248 ) ) ( not ( = ?auto_4247 ?auto_4249 ) ) ( not ( = ?auto_4247 ?auto_4246 ) ) ( not ( = ?auto_4247 ?auto_4251 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4248 ?auto_4249 ?auto_4246 )
      ( MAKE-3CRATE-VERIFY ?auto_4247 ?auto_4248 ?auto_4249 ?auto_4246 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4275 - SURFACE
      ?auto_4276 - SURFACE
      ?auto_4277 - SURFACE
      ?auto_4274 - SURFACE
    )
    :vars
    (
      ?auto_4283 - HOIST
      ?auto_4278 - PLACE
      ?auto_4282 - PLACE
      ?auto_4281 - HOIST
      ?auto_4280 - SURFACE
      ?auto_4279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4283 ?auto_4278 ) ( SURFACE-AT ?auto_4277 ?auto_4278 ) ( CLEAR ?auto_4277 ) ( IS-CRATE ?auto_4274 ) ( not ( = ?auto_4277 ?auto_4274 ) ) ( AVAILABLE ?auto_4283 ) ( ON ?auto_4277 ?auto_4276 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4274 ) ) ( not ( = ?auto_4282 ?auto_4278 ) ) ( HOIST-AT ?auto_4281 ?auto_4282 ) ( not ( = ?auto_4283 ?auto_4281 ) ) ( AVAILABLE ?auto_4281 ) ( SURFACE-AT ?auto_4274 ?auto_4282 ) ( ON ?auto_4274 ?auto_4280 ) ( CLEAR ?auto_4274 ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4274 ?auto_4280 ) ) ( not ( = ?auto_4276 ?auto_4280 ) ) ( TRUCK-AT ?auto_4279 ?auto_4278 ) ( ON ?auto_4276 ?auto_4275 ) ( not ( = ?auto_4275 ?auto_4276 ) ) ( not ( = ?auto_4275 ?auto_4277 ) ) ( not ( = ?auto_4275 ?auto_4274 ) ) ( not ( = ?auto_4275 ?auto_4280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4276 ?auto_4277 ?auto_4274 )
      ( MAKE-3CRATE-VERIFY ?auto_4275 ?auto_4276 ?auto_4277 ?auto_4274 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4303 - SURFACE
      ?auto_4304 - SURFACE
      ?auto_4305 - SURFACE
      ?auto_4302 - SURFACE
    )
    :vars
    (
      ?auto_4306 - HOIST
      ?auto_4310 - PLACE
      ?auto_4311 - PLACE
      ?auto_4309 - HOIST
      ?auto_4308 - SURFACE
      ?auto_4307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4306 ?auto_4310 ) ( IS-CRATE ?auto_4302 ) ( not ( = ?auto_4305 ?auto_4302 ) ) ( not ( = ?auto_4304 ?auto_4305 ) ) ( not ( = ?auto_4304 ?auto_4302 ) ) ( not ( = ?auto_4311 ?auto_4310 ) ) ( HOIST-AT ?auto_4309 ?auto_4311 ) ( not ( = ?auto_4306 ?auto_4309 ) ) ( AVAILABLE ?auto_4309 ) ( SURFACE-AT ?auto_4302 ?auto_4311 ) ( ON ?auto_4302 ?auto_4308 ) ( CLEAR ?auto_4302 ) ( not ( = ?auto_4305 ?auto_4308 ) ) ( not ( = ?auto_4302 ?auto_4308 ) ) ( not ( = ?auto_4304 ?auto_4308 ) ) ( TRUCK-AT ?auto_4307 ?auto_4310 ) ( SURFACE-AT ?auto_4304 ?auto_4310 ) ( CLEAR ?auto_4304 ) ( LIFTING ?auto_4306 ?auto_4305 ) ( IS-CRATE ?auto_4305 ) ( ON ?auto_4304 ?auto_4303 ) ( not ( = ?auto_4303 ?auto_4304 ) ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4303 ?auto_4302 ) ) ( not ( = ?auto_4303 ?auto_4308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4304 ?auto_4305 ?auto_4302 )
      ( MAKE-3CRATE-VERIFY ?auto_4303 ?auto_4304 ?auto_4305 ?auto_4302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4331 - SURFACE
      ?auto_4332 - SURFACE
      ?auto_4333 - SURFACE
      ?auto_4330 - SURFACE
    )
    :vars
    (
      ?auto_4337 - HOIST
      ?auto_4334 - PLACE
      ?auto_4338 - PLACE
      ?auto_4335 - HOIST
      ?auto_4336 - SURFACE
      ?auto_4339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4337 ?auto_4334 ) ( IS-CRATE ?auto_4330 ) ( not ( = ?auto_4333 ?auto_4330 ) ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4330 ) ) ( not ( = ?auto_4338 ?auto_4334 ) ) ( HOIST-AT ?auto_4335 ?auto_4338 ) ( not ( = ?auto_4337 ?auto_4335 ) ) ( AVAILABLE ?auto_4335 ) ( SURFACE-AT ?auto_4330 ?auto_4338 ) ( ON ?auto_4330 ?auto_4336 ) ( CLEAR ?auto_4330 ) ( not ( = ?auto_4333 ?auto_4336 ) ) ( not ( = ?auto_4330 ?auto_4336 ) ) ( not ( = ?auto_4332 ?auto_4336 ) ) ( TRUCK-AT ?auto_4339 ?auto_4334 ) ( SURFACE-AT ?auto_4332 ?auto_4334 ) ( CLEAR ?auto_4332 ) ( IS-CRATE ?auto_4333 ) ( AVAILABLE ?auto_4337 ) ( IN ?auto_4333 ?auto_4339 ) ( ON ?auto_4332 ?auto_4331 ) ( not ( = ?auto_4331 ?auto_4332 ) ) ( not ( = ?auto_4331 ?auto_4333 ) ) ( not ( = ?auto_4331 ?auto_4330 ) ) ( not ( = ?auto_4331 ?auto_4336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4332 ?auto_4333 ?auto_4330 )
      ( MAKE-3CRATE-VERIFY ?auto_4331 ?auto_4332 ?auto_4333 ?auto_4330 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4409 - SURFACE
      ?auto_4410 - SURFACE
    )
    :vars
    (
      ?auto_4411 - HOIST
      ?auto_4416 - PLACE
      ?auto_4414 - SURFACE
      ?auto_4417 - PLACE
      ?auto_4413 - HOIST
      ?auto_4415 - SURFACE
      ?auto_4412 - TRUCK
      ?auto_4418 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4411 ?auto_4416 ) ( SURFACE-AT ?auto_4409 ?auto_4416 ) ( CLEAR ?auto_4409 ) ( IS-CRATE ?auto_4410 ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( AVAILABLE ?auto_4411 ) ( ON ?auto_4409 ?auto_4414 ) ( not ( = ?auto_4414 ?auto_4409 ) ) ( not ( = ?auto_4414 ?auto_4410 ) ) ( not ( = ?auto_4417 ?auto_4416 ) ) ( HOIST-AT ?auto_4413 ?auto_4417 ) ( not ( = ?auto_4411 ?auto_4413 ) ) ( AVAILABLE ?auto_4413 ) ( SURFACE-AT ?auto_4410 ?auto_4417 ) ( ON ?auto_4410 ?auto_4415 ) ( CLEAR ?auto_4410 ) ( not ( = ?auto_4409 ?auto_4415 ) ) ( not ( = ?auto_4410 ?auto_4415 ) ) ( not ( = ?auto_4414 ?auto_4415 ) ) ( TRUCK-AT ?auto_4412 ?auto_4418 ) ( not ( = ?auto_4418 ?auto_4416 ) ) ( not ( = ?auto_4417 ?auto_4418 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4412 ?auto_4418 ?auto_4416 )
      ( MAKE-1CRATE ?auto_4409 ?auto_4410 )
      ( MAKE-1CRATE-VERIFY ?auto_4409 ?auto_4410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4515 - SURFACE
      ?auto_4516 - SURFACE
    )
    :vars
    (
      ?auto_4517 - HOIST
      ?auto_4521 - PLACE
      ?auto_4522 - SURFACE
      ?auto_4520 - PLACE
      ?auto_4523 - HOIST
      ?auto_4518 - SURFACE
      ?auto_4519 - TRUCK
      ?auto_4524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4517 ?auto_4521 ) ( SURFACE-AT ?auto_4515 ?auto_4521 ) ( CLEAR ?auto_4515 ) ( IS-CRATE ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4516 ) ) ( ON ?auto_4515 ?auto_4522 ) ( not ( = ?auto_4522 ?auto_4515 ) ) ( not ( = ?auto_4522 ?auto_4516 ) ) ( not ( = ?auto_4520 ?auto_4521 ) ) ( HOIST-AT ?auto_4523 ?auto_4520 ) ( not ( = ?auto_4517 ?auto_4523 ) ) ( AVAILABLE ?auto_4523 ) ( SURFACE-AT ?auto_4516 ?auto_4520 ) ( ON ?auto_4516 ?auto_4518 ) ( CLEAR ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4518 ) ) ( not ( = ?auto_4516 ?auto_4518 ) ) ( not ( = ?auto_4522 ?auto_4518 ) ) ( TRUCK-AT ?auto_4519 ?auto_4521 ) ( LIFTING ?auto_4517 ?auto_4524 ) ( IS-CRATE ?auto_4524 ) ( not ( = ?auto_4515 ?auto_4524 ) ) ( not ( = ?auto_4516 ?auto_4524 ) ) ( not ( = ?auto_4522 ?auto_4524 ) ) ( not ( = ?auto_4518 ?auto_4524 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4517 ?auto_4524 ?auto_4519 ?auto_4521 )
      ( MAKE-1CRATE ?auto_4515 ?auto_4516 )
      ( MAKE-1CRATE-VERIFY ?auto_4515 ?auto_4516 ) )
  )

)

