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

  ( :method MAKE-11CRATE-VERIFY
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
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9844 - SURFACE
      ?auto_9845 - SURFACE
    )
    :vars
    (
      ?auto_9846 - HOIST
      ?auto_9847 - PLACE
      ?auto_9849 - PLACE
      ?auto_9850 - HOIST
      ?auto_9851 - SURFACE
      ?auto_9848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9846 ?auto_9847 ) ( SURFACE-AT ?auto_9844 ?auto_9847 ) ( CLEAR ?auto_9844 ) ( IS-CRATE ?auto_9845 ) ( AVAILABLE ?auto_9846 ) ( not ( = ?auto_9849 ?auto_9847 ) ) ( HOIST-AT ?auto_9850 ?auto_9849 ) ( AVAILABLE ?auto_9850 ) ( SURFACE-AT ?auto_9845 ?auto_9849 ) ( ON ?auto_9845 ?auto_9851 ) ( CLEAR ?auto_9845 ) ( TRUCK-AT ?auto_9848 ?auto_9847 ) ( not ( = ?auto_9844 ?auto_9845 ) ) ( not ( = ?auto_9844 ?auto_9851 ) ) ( not ( = ?auto_9845 ?auto_9851 ) ) ( not ( = ?auto_9846 ?auto_9850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9848 ?auto_9847 ?auto_9849 )
      ( !LIFT ?auto_9850 ?auto_9845 ?auto_9851 ?auto_9849 )
      ( !LOAD ?auto_9850 ?auto_9845 ?auto_9848 ?auto_9849 )
      ( !DRIVE ?auto_9848 ?auto_9849 ?auto_9847 )
      ( !UNLOAD ?auto_9846 ?auto_9845 ?auto_9848 ?auto_9847 )
      ( !DROP ?auto_9846 ?auto_9845 ?auto_9844 ?auto_9847 )
      ( MAKE-1CRATE-VERIFY ?auto_9844 ?auto_9845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9854 - SURFACE
      ?auto_9855 - SURFACE
    )
    :vars
    (
      ?auto_9856 - HOIST
      ?auto_9857 - PLACE
      ?auto_9859 - PLACE
      ?auto_9860 - HOIST
      ?auto_9861 - SURFACE
      ?auto_9858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9856 ?auto_9857 ) ( SURFACE-AT ?auto_9854 ?auto_9857 ) ( CLEAR ?auto_9854 ) ( IS-CRATE ?auto_9855 ) ( AVAILABLE ?auto_9856 ) ( not ( = ?auto_9859 ?auto_9857 ) ) ( HOIST-AT ?auto_9860 ?auto_9859 ) ( AVAILABLE ?auto_9860 ) ( SURFACE-AT ?auto_9855 ?auto_9859 ) ( ON ?auto_9855 ?auto_9861 ) ( CLEAR ?auto_9855 ) ( TRUCK-AT ?auto_9858 ?auto_9857 ) ( not ( = ?auto_9854 ?auto_9855 ) ) ( not ( = ?auto_9854 ?auto_9861 ) ) ( not ( = ?auto_9855 ?auto_9861 ) ) ( not ( = ?auto_9856 ?auto_9860 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9858 ?auto_9857 ?auto_9859 )
      ( !LIFT ?auto_9860 ?auto_9855 ?auto_9861 ?auto_9859 )
      ( !LOAD ?auto_9860 ?auto_9855 ?auto_9858 ?auto_9859 )
      ( !DRIVE ?auto_9858 ?auto_9859 ?auto_9857 )
      ( !UNLOAD ?auto_9856 ?auto_9855 ?auto_9858 ?auto_9857 )
      ( !DROP ?auto_9856 ?auto_9855 ?auto_9854 ?auto_9857 )
      ( MAKE-1CRATE-VERIFY ?auto_9854 ?auto_9855 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9865 - SURFACE
      ?auto_9866 - SURFACE
      ?auto_9867 - SURFACE
    )
    :vars
    (
      ?auto_9869 - HOIST
      ?auto_9871 - PLACE
      ?auto_9872 - PLACE
      ?auto_9870 - HOIST
      ?auto_9868 - SURFACE
      ?auto_9875 - PLACE
      ?auto_9876 - HOIST
      ?auto_9874 - SURFACE
      ?auto_9873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9869 ?auto_9871 ) ( IS-CRATE ?auto_9867 ) ( not ( = ?auto_9872 ?auto_9871 ) ) ( HOIST-AT ?auto_9870 ?auto_9872 ) ( AVAILABLE ?auto_9870 ) ( SURFACE-AT ?auto_9867 ?auto_9872 ) ( ON ?auto_9867 ?auto_9868 ) ( CLEAR ?auto_9867 ) ( not ( = ?auto_9866 ?auto_9867 ) ) ( not ( = ?auto_9866 ?auto_9868 ) ) ( not ( = ?auto_9867 ?auto_9868 ) ) ( not ( = ?auto_9869 ?auto_9870 ) ) ( SURFACE-AT ?auto_9865 ?auto_9871 ) ( CLEAR ?auto_9865 ) ( IS-CRATE ?auto_9866 ) ( AVAILABLE ?auto_9869 ) ( not ( = ?auto_9875 ?auto_9871 ) ) ( HOIST-AT ?auto_9876 ?auto_9875 ) ( AVAILABLE ?auto_9876 ) ( SURFACE-AT ?auto_9866 ?auto_9875 ) ( ON ?auto_9866 ?auto_9874 ) ( CLEAR ?auto_9866 ) ( TRUCK-AT ?auto_9873 ?auto_9871 ) ( not ( = ?auto_9865 ?auto_9866 ) ) ( not ( = ?auto_9865 ?auto_9874 ) ) ( not ( = ?auto_9866 ?auto_9874 ) ) ( not ( = ?auto_9869 ?auto_9876 ) ) ( not ( = ?auto_9865 ?auto_9867 ) ) ( not ( = ?auto_9865 ?auto_9868 ) ) ( not ( = ?auto_9867 ?auto_9874 ) ) ( not ( = ?auto_9872 ?auto_9875 ) ) ( not ( = ?auto_9870 ?auto_9876 ) ) ( not ( = ?auto_9868 ?auto_9874 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9865 ?auto_9866 )
      ( MAKE-1CRATE ?auto_9866 ?auto_9867 )
      ( MAKE-2CRATE-VERIFY ?auto_9865 ?auto_9866 ?auto_9867 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9879 - SURFACE
      ?auto_9880 - SURFACE
    )
    :vars
    (
      ?auto_9881 - HOIST
      ?auto_9882 - PLACE
      ?auto_9884 - PLACE
      ?auto_9885 - HOIST
      ?auto_9886 - SURFACE
      ?auto_9883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9881 ?auto_9882 ) ( SURFACE-AT ?auto_9879 ?auto_9882 ) ( CLEAR ?auto_9879 ) ( IS-CRATE ?auto_9880 ) ( AVAILABLE ?auto_9881 ) ( not ( = ?auto_9884 ?auto_9882 ) ) ( HOIST-AT ?auto_9885 ?auto_9884 ) ( AVAILABLE ?auto_9885 ) ( SURFACE-AT ?auto_9880 ?auto_9884 ) ( ON ?auto_9880 ?auto_9886 ) ( CLEAR ?auto_9880 ) ( TRUCK-AT ?auto_9883 ?auto_9882 ) ( not ( = ?auto_9879 ?auto_9880 ) ) ( not ( = ?auto_9879 ?auto_9886 ) ) ( not ( = ?auto_9880 ?auto_9886 ) ) ( not ( = ?auto_9881 ?auto_9885 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9883 ?auto_9882 ?auto_9884 )
      ( !LIFT ?auto_9885 ?auto_9880 ?auto_9886 ?auto_9884 )
      ( !LOAD ?auto_9885 ?auto_9880 ?auto_9883 ?auto_9884 )
      ( !DRIVE ?auto_9883 ?auto_9884 ?auto_9882 )
      ( !UNLOAD ?auto_9881 ?auto_9880 ?auto_9883 ?auto_9882 )
      ( !DROP ?auto_9881 ?auto_9880 ?auto_9879 ?auto_9882 )
      ( MAKE-1CRATE-VERIFY ?auto_9879 ?auto_9880 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9891 - SURFACE
      ?auto_9892 - SURFACE
      ?auto_9893 - SURFACE
      ?auto_9894 - SURFACE
    )
    :vars
    (
      ?auto_9898 - HOIST
      ?auto_9897 - PLACE
      ?auto_9899 - PLACE
      ?auto_9896 - HOIST
      ?auto_9900 - SURFACE
      ?auto_9903 - PLACE
      ?auto_9905 - HOIST
      ?auto_9902 - SURFACE
      ?auto_9906 - PLACE
      ?auto_9901 - HOIST
      ?auto_9904 - SURFACE
      ?auto_9895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9898 ?auto_9897 ) ( IS-CRATE ?auto_9894 ) ( not ( = ?auto_9899 ?auto_9897 ) ) ( HOIST-AT ?auto_9896 ?auto_9899 ) ( AVAILABLE ?auto_9896 ) ( SURFACE-AT ?auto_9894 ?auto_9899 ) ( ON ?auto_9894 ?auto_9900 ) ( CLEAR ?auto_9894 ) ( not ( = ?auto_9893 ?auto_9894 ) ) ( not ( = ?auto_9893 ?auto_9900 ) ) ( not ( = ?auto_9894 ?auto_9900 ) ) ( not ( = ?auto_9898 ?auto_9896 ) ) ( IS-CRATE ?auto_9893 ) ( not ( = ?auto_9903 ?auto_9897 ) ) ( HOIST-AT ?auto_9905 ?auto_9903 ) ( AVAILABLE ?auto_9905 ) ( SURFACE-AT ?auto_9893 ?auto_9903 ) ( ON ?auto_9893 ?auto_9902 ) ( CLEAR ?auto_9893 ) ( not ( = ?auto_9892 ?auto_9893 ) ) ( not ( = ?auto_9892 ?auto_9902 ) ) ( not ( = ?auto_9893 ?auto_9902 ) ) ( not ( = ?auto_9898 ?auto_9905 ) ) ( SURFACE-AT ?auto_9891 ?auto_9897 ) ( CLEAR ?auto_9891 ) ( IS-CRATE ?auto_9892 ) ( AVAILABLE ?auto_9898 ) ( not ( = ?auto_9906 ?auto_9897 ) ) ( HOIST-AT ?auto_9901 ?auto_9906 ) ( AVAILABLE ?auto_9901 ) ( SURFACE-AT ?auto_9892 ?auto_9906 ) ( ON ?auto_9892 ?auto_9904 ) ( CLEAR ?auto_9892 ) ( TRUCK-AT ?auto_9895 ?auto_9897 ) ( not ( = ?auto_9891 ?auto_9892 ) ) ( not ( = ?auto_9891 ?auto_9904 ) ) ( not ( = ?auto_9892 ?auto_9904 ) ) ( not ( = ?auto_9898 ?auto_9901 ) ) ( not ( = ?auto_9891 ?auto_9893 ) ) ( not ( = ?auto_9891 ?auto_9902 ) ) ( not ( = ?auto_9893 ?auto_9904 ) ) ( not ( = ?auto_9903 ?auto_9906 ) ) ( not ( = ?auto_9905 ?auto_9901 ) ) ( not ( = ?auto_9902 ?auto_9904 ) ) ( not ( = ?auto_9891 ?auto_9894 ) ) ( not ( = ?auto_9891 ?auto_9900 ) ) ( not ( = ?auto_9892 ?auto_9894 ) ) ( not ( = ?auto_9892 ?auto_9900 ) ) ( not ( = ?auto_9894 ?auto_9902 ) ) ( not ( = ?auto_9894 ?auto_9904 ) ) ( not ( = ?auto_9899 ?auto_9903 ) ) ( not ( = ?auto_9899 ?auto_9906 ) ) ( not ( = ?auto_9896 ?auto_9905 ) ) ( not ( = ?auto_9896 ?auto_9901 ) ) ( not ( = ?auto_9900 ?auto_9902 ) ) ( not ( = ?auto_9900 ?auto_9904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9891 ?auto_9892 ?auto_9893 )
      ( MAKE-1CRATE ?auto_9893 ?auto_9894 )
      ( MAKE-3CRATE-VERIFY ?auto_9891 ?auto_9892 ?auto_9893 ?auto_9894 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9909 - SURFACE
      ?auto_9910 - SURFACE
    )
    :vars
    (
      ?auto_9911 - HOIST
      ?auto_9912 - PLACE
      ?auto_9914 - PLACE
      ?auto_9915 - HOIST
      ?auto_9916 - SURFACE
      ?auto_9913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9911 ?auto_9912 ) ( SURFACE-AT ?auto_9909 ?auto_9912 ) ( CLEAR ?auto_9909 ) ( IS-CRATE ?auto_9910 ) ( AVAILABLE ?auto_9911 ) ( not ( = ?auto_9914 ?auto_9912 ) ) ( HOIST-AT ?auto_9915 ?auto_9914 ) ( AVAILABLE ?auto_9915 ) ( SURFACE-AT ?auto_9910 ?auto_9914 ) ( ON ?auto_9910 ?auto_9916 ) ( CLEAR ?auto_9910 ) ( TRUCK-AT ?auto_9913 ?auto_9912 ) ( not ( = ?auto_9909 ?auto_9910 ) ) ( not ( = ?auto_9909 ?auto_9916 ) ) ( not ( = ?auto_9910 ?auto_9916 ) ) ( not ( = ?auto_9911 ?auto_9915 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9913 ?auto_9912 ?auto_9914 )
      ( !LIFT ?auto_9915 ?auto_9910 ?auto_9916 ?auto_9914 )
      ( !LOAD ?auto_9915 ?auto_9910 ?auto_9913 ?auto_9914 )
      ( !DRIVE ?auto_9913 ?auto_9914 ?auto_9912 )
      ( !UNLOAD ?auto_9911 ?auto_9910 ?auto_9913 ?auto_9912 )
      ( !DROP ?auto_9911 ?auto_9910 ?auto_9909 ?auto_9912 )
      ( MAKE-1CRATE-VERIFY ?auto_9909 ?auto_9910 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9922 - SURFACE
      ?auto_9923 - SURFACE
      ?auto_9924 - SURFACE
      ?auto_9925 - SURFACE
      ?auto_9926 - SURFACE
    )
    :vars
    (
      ?auto_9930 - HOIST
      ?auto_9929 - PLACE
      ?auto_9932 - PLACE
      ?auto_9931 - HOIST
      ?auto_9927 - SURFACE
      ?auto_9940 - PLACE
      ?auto_9935 - HOIST
      ?auto_9939 - SURFACE
      ?auto_9936 - PLACE
      ?auto_9941 - HOIST
      ?auto_9938 - SURFACE
      ?auto_9937 - PLACE
      ?auto_9934 - HOIST
      ?auto_9933 - SURFACE
      ?auto_9928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9930 ?auto_9929 ) ( IS-CRATE ?auto_9926 ) ( not ( = ?auto_9932 ?auto_9929 ) ) ( HOIST-AT ?auto_9931 ?auto_9932 ) ( AVAILABLE ?auto_9931 ) ( SURFACE-AT ?auto_9926 ?auto_9932 ) ( ON ?auto_9926 ?auto_9927 ) ( CLEAR ?auto_9926 ) ( not ( = ?auto_9925 ?auto_9926 ) ) ( not ( = ?auto_9925 ?auto_9927 ) ) ( not ( = ?auto_9926 ?auto_9927 ) ) ( not ( = ?auto_9930 ?auto_9931 ) ) ( IS-CRATE ?auto_9925 ) ( not ( = ?auto_9940 ?auto_9929 ) ) ( HOIST-AT ?auto_9935 ?auto_9940 ) ( AVAILABLE ?auto_9935 ) ( SURFACE-AT ?auto_9925 ?auto_9940 ) ( ON ?auto_9925 ?auto_9939 ) ( CLEAR ?auto_9925 ) ( not ( = ?auto_9924 ?auto_9925 ) ) ( not ( = ?auto_9924 ?auto_9939 ) ) ( not ( = ?auto_9925 ?auto_9939 ) ) ( not ( = ?auto_9930 ?auto_9935 ) ) ( IS-CRATE ?auto_9924 ) ( not ( = ?auto_9936 ?auto_9929 ) ) ( HOIST-AT ?auto_9941 ?auto_9936 ) ( AVAILABLE ?auto_9941 ) ( SURFACE-AT ?auto_9924 ?auto_9936 ) ( ON ?auto_9924 ?auto_9938 ) ( CLEAR ?auto_9924 ) ( not ( = ?auto_9923 ?auto_9924 ) ) ( not ( = ?auto_9923 ?auto_9938 ) ) ( not ( = ?auto_9924 ?auto_9938 ) ) ( not ( = ?auto_9930 ?auto_9941 ) ) ( SURFACE-AT ?auto_9922 ?auto_9929 ) ( CLEAR ?auto_9922 ) ( IS-CRATE ?auto_9923 ) ( AVAILABLE ?auto_9930 ) ( not ( = ?auto_9937 ?auto_9929 ) ) ( HOIST-AT ?auto_9934 ?auto_9937 ) ( AVAILABLE ?auto_9934 ) ( SURFACE-AT ?auto_9923 ?auto_9937 ) ( ON ?auto_9923 ?auto_9933 ) ( CLEAR ?auto_9923 ) ( TRUCK-AT ?auto_9928 ?auto_9929 ) ( not ( = ?auto_9922 ?auto_9923 ) ) ( not ( = ?auto_9922 ?auto_9933 ) ) ( not ( = ?auto_9923 ?auto_9933 ) ) ( not ( = ?auto_9930 ?auto_9934 ) ) ( not ( = ?auto_9922 ?auto_9924 ) ) ( not ( = ?auto_9922 ?auto_9938 ) ) ( not ( = ?auto_9924 ?auto_9933 ) ) ( not ( = ?auto_9936 ?auto_9937 ) ) ( not ( = ?auto_9941 ?auto_9934 ) ) ( not ( = ?auto_9938 ?auto_9933 ) ) ( not ( = ?auto_9922 ?auto_9925 ) ) ( not ( = ?auto_9922 ?auto_9939 ) ) ( not ( = ?auto_9923 ?auto_9925 ) ) ( not ( = ?auto_9923 ?auto_9939 ) ) ( not ( = ?auto_9925 ?auto_9938 ) ) ( not ( = ?auto_9925 ?auto_9933 ) ) ( not ( = ?auto_9940 ?auto_9936 ) ) ( not ( = ?auto_9940 ?auto_9937 ) ) ( not ( = ?auto_9935 ?auto_9941 ) ) ( not ( = ?auto_9935 ?auto_9934 ) ) ( not ( = ?auto_9939 ?auto_9938 ) ) ( not ( = ?auto_9939 ?auto_9933 ) ) ( not ( = ?auto_9922 ?auto_9926 ) ) ( not ( = ?auto_9922 ?auto_9927 ) ) ( not ( = ?auto_9923 ?auto_9926 ) ) ( not ( = ?auto_9923 ?auto_9927 ) ) ( not ( = ?auto_9924 ?auto_9926 ) ) ( not ( = ?auto_9924 ?auto_9927 ) ) ( not ( = ?auto_9926 ?auto_9939 ) ) ( not ( = ?auto_9926 ?auto_9938 ) ) ( not ( = ?auto_9926 ?auto_9933 ) ) ( not ( = ?auto_9932 ?auto_9940 ) ) ( not ( = ?auto_9932 ?auto_9936 ) ) ( not ( = ?auto_9932 ?auto_9937 ) ) ( not ( = ?auto_9931 ?auto_9935 ) ) ( not ( = ?auto_9931 ?auto_9941 ) ) ( not ( = ?auto_9931 ?auto_9934 ) ) ( not ( = ?auto_9927 ?auto_9939 ) ) ( not ( = ?auto_9927 ?auto_9938 ) ) ( not ( = ?auto_9927 ?auto_9933 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9922 ?auto_9923 ?auto_9924 ?auto_9925 )
      ( MAKE-1CRATE ?auto_9925 ?auto_9926 )
      ( MAKE-4CRATE-VERIFY ?auto_9922 ?auto_9923 ?auto_9924 ?auto_9925 ?auto_9926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9944 - SURFACE
      ?auto_9945 - SURFACE
    )
    :vars
    (
      ?auto_9946 - HOIST
      ?auto_9947 - PLACE
      ?auto_9949 - PLACE
      ?auto_9950 - HOIST
      ?auto_9951 - SURFACE
      ?auto_9948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9946 ?auto_9947 ) ( SURFACE-AT ?auto_9944 ?auto_9947 ) ( CLEAR ?auto_9944 ) ( IS-CRATE ?auto_9945 ) ( AVAILABLE ?auto_9946 ) ( not ( = ?auto_9949 ?auto_9947 ) ) ( HOIST-AT ?auto_9950 ?auto_9949 ) ( AVAILABLE ?auto_9950 ) ( SURFACE-AT ?auto_9945 ?auto_9949 ) ( ON ?auto_9945 ?auto_9951 ) ( CLEAR ?auto_9945 ) ( TRUCK-AT ?auto_9948 ?auto_9947 ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( not ( = ?auto_9944 ?auto_9951 ) ) ( not ( = ?auto_9945 ?auto_9951 ) ) ( not ( = ?auto_9946 ?auto_9950 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9948 ?auto_9947 ?auto_9949 )
      ( !LIFT ?auto_9950 ?auto_9945 ?auto_9951 ?auto_9949 )
      ( !LOAD ?auto_9950 ?auto_9945 ?auto_9948 ?auto_9949 )
      ( !DRIVE ?auto_9948 ?auto_9949 ?auto_9947 )
      ( !UNLOAD ?auto_9946 ?auto_9945 ?auto_9948 ?auto_9947 )
      ( !DROP ?auto_9946 ?auto_9945 ?auto_9944 ?auto_9947 )
      ( MAKE-1CRATE-VERIFY ?auto_9944 ?auto_9945 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_9958 - SURFACE
      ?auto_9959 - SURFACE
      ?auto_9960 - SURFACE
      ?auto_9961 - SURFACE
      ?auto_9962 - SURFACE
      ?auto_9963 - SURFACE
    )
    :vars
    (
      ?auto_9965 - HOIST
      ?auto_9967 - PLACE
      ?auto_9969 - PLACE
      ?auto_9968 - HOIST
      ?auto_9966 - SURFACE
      ?auto_9972 - PLACE
      ?auto_9971 - HOIST
      ?auto_9979 - SURFACE
      ?auto_9975 - PLACE
      ?auto_9977 - HOIST
      ?auto_9976 - SURFACE
      ?auto_9973 - SURFACE
      ?auto_9974 - PLACE
      ?auto_9978 - HOIST
      ?auto_9970 - SURFACE
      ?auto_9964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9965 ?auto_9967 ) ( IS-CRATE ?auto_9963 ) ( not ( = ?auto_9969 ?auto_9967 ) ) ( HOIST-AT ?auto_9968 ?auto_9969 ) ( SURFACE-AT ?auto_9963 ?auto_9969 ) ( ON ?auto_9963 ?auto_9966 ) ( CLEAR ?auto_9963 ) ( not ( = ?auto_9962 ?auto_9963 ) ) ( not ( = ?auto_9962 ?auto_9966 ) ) ( not ( = ?auto_9963 ?auto_9966 ) ) ( not ( = ?auto_9965 ?auto_9968 ) ) ( IS-CRATE ?auto_9962 ) ( not ( = ?auto_9972 ?auto_9967 ) ) ( HOIST-AT ?auto_9971 ?auto_9972 ) ( AVAILABLE ?auto_9971 ) ( SURFACE-AT ?auto_9962 ?auto_9972 ) ( ON ?auto_9962 ?auto_9979 ) ( CLEAR ?auto_9962 ) ( not ( = ?auto_9961 ?auto_9962 ) ) ( not ( = ?auto_9961 ?auto_9979 ) ) ( not ( = ?auto_9962 ?auto_9979 ) ) ( not ( = ?auto_9965 ?auto_9971 ) ) ( IS-CRATE ?auto_9961 ) ( not ( = ?auto_9975 ?auto_9967 ) ) ( HOIST-AT ?auto_9977 ?auto_9975 ) ( AVAILABLE ?auto_9977 ) ( SURFACE-AT ?auto_9961 ?auto_9975 ) ( ON ?auto_9961 ?auto_9976 ) ( CLEAR ?auto_9961 ) ( not ( = ?auto_9960 ?auto_9961 ) ) ( not ( = ?auto_9960 ?auto_9976 ) ) ( not ( = ?auto_9961 ?auto_9976 ) ) ( not ( = ?auto_9965 ?auto_9977 ) ) ( IS-CRATE ?auto_9960 ) ( AVAILABLE ?auto_9968 ) ( SURFACE-AT ?auto_9960 ?auto_9969 ) ( ON ?auto_9960 ?auto_9973 ) ( CLEAR ?auto_9960 ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9973 ) ) ( not ( = ?auto_9960 ?auto_9973 ) ) ( SURFACE-AT ?auto_9958 ?auto_9967 ) ( CLEAR ?auto_9958 ) ( IS-CRATE ?auto_9959 ) ( AVAILABLE ?auto_9965 ) ( not ( = ?auto_9974 ?auto_9967 ) ) ( HOIST-AT ?auto_9978 ?auto_9974 ) ( AVAILABLE ?auto_9978 ) ( SURFACE-AT ?auto_9959 ?auto_9974 ) ( ON ?auto_9959 ?auto_9970 ) ( CLEAR ?auto_9959 ) ( TRUCK-AT ?auto_9964 ?auto_9967 ) ( not ( = ?auto_9958 ?auto_9959 ) ) ( not ( = ?auto_9958 ?auto_9970 ) ) ( not ( = ?auto_9959 ?auto_9970 ) ) ( not ( = ?auto_9965 ?auto_9978 ) ) ( not ( = ?auto_9958 ?auto_9960 ) ) ( not ( = ?auto_9958 ?auto_9973 ) ) ( not ( = ?auto_9960 ?auto_9970 ) ) ( not ( = ?auto_9969 ?auto_9974 ) ) ( not ( = ?auto_9968 ?auto_9978 ) ) ( not ( = ?auto_9973 ?auto_9970 ) ) ( not ( = ?auto_9958 ?auto_9961 ) ) ( not ( = ?auto_9958 ?auto_9976 ) ) ( not ( = ?auto_9959 ?auto_9961 ) ) ( not ( = ?auto_9959 ?auto_9976 ) ) ( not ( = ?auto_9961 ?auto_9973 ) ) ( not ( = ?auto_9961 ?auto_9970 ) ) ( not ( = ?auto_9975 ?auto_9969 ) ) ( not ( = ?auto_9975 ?auto_9974 ) ) ( not ( = ?auto_9977 ?auto_9968 ) ) ( not ( = ?auto_9977 ?auto_9978 ) ) ( not ( = ?auto_9976 ?auto_9973 ) ) ( not ( = ?auto_9976 ?auto_9970 ) ) ( not ( = ?auto_9958 ?auto_9962 ) ) ( not ( = ?auto_9958 ?auto_9979 ) ) ( not ( = ?auto_9959 ?auto_9962 ) ) ( not ( = ?auto_9959 ?auto_9979 ) ) ( not ( = ?auto_9960 ?auto_9962 ) ) ( not ( = ?auto_9960 ?auto_9979 ) ) ( not ( = ?auto_9962 ?auto_9976 ) ) ( not ( = ?auto_9962 ?auto_9973 ) ) ( not ( = ?auto_9962 ?auto_9970 ) ) ( not ( = ?auto_9972 ?auto_9975 ) ) ( not ( = ?auto_9972 ?auto_9969 ) ) ( not ( = ?auto_9972 ?auto_9974 ) ) ( not ( = ?auto_9971 ?auto_9977 ) ) ( not ( = ?auto_9971 ?auto_9968 ) ) ( not ( = ?auto_9971 ?auto_9978 ) ) ( not ( = ?auto_9979 ?auto_9976 ) ) ( not ( = ?auto_9979 ?auto_9973 ) ) ( not ( = ?auto_9979 ?auto_9970 ) ) ( not ( = ?auto_9958 ?auto_9963 ) ) ( not ( = ?auto_9958 ?auto_9966 ) ) ( not ( = ?auto_9959 ?auto_9963 ) ) ( not ( = ?auto_9959 ?auto_9966 ) ) ( not ( = ?auto_9960 ?auto_9963 ) ) ( not ( = ?auto_9960 ?auto_9966 ) ) ( not ( = ?auto_9961 ?auto_9963 ) ) ( not ( = ?auto_9961 ?auto_9966 ) ) ( not ( = ?auto_9963 ?auto_9979 ) ) ( not ( = ?auto_9963 ?auto_9976 ) ) ( not ( = ?auto_9963 ?auto_9973 ) ) ( not ( = ?auto_9963 ?auto_9970 ) ) ( not ( = ?auto_9966 ?auto_9979 ) ) ( not ( = ?auto_9966 ?auto_9976 ) ) ( not ( = ?auto_9966 ?auto_9973 ) ) ( not ( = ?auto_9966 ?auto_9970 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9958 ?auto_9959 ?auto_9960 ?auto_9961 ?auto_9962 )
      ( MAKE-1CRATE ?auto_9962 ?auto_9963 )
      ( MAKE-5CRATE-VERIFY ?auto_9958 ?auto_9959 ?auto_9960 ?auto_9961 ?auto_9962 ?auto_9963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9982 - SURFACE
      ?auto_9983 - SURFACE
    )
    :vars
    (
      ?auto_9984 - HOIST
      ?auto_9985 - PLACE
      ?auto_9987 - PLACE
      ?auto_9988 - HOIST
      ?auto_9989 - SURFACE
      ?auto_9986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9984 ?auto_9985 ) ( SURFACE-AT ?auto_9982 ?auto_9985 ) ( CLEAR ?auto_9982 ) ( IS-CRATE ?auto_9983 ) ( AVAILABLE ?auto_9984 ) ( not ( = ?auto_9987 ?auto_9985 ) ) ( HOIST-AT ?auto_9988 ?auto_9987 ) ( AVAILABLE ?auto_9988 ) ( SURFACE-AT ?auto_9983 ?auto_9987 ) ( ON ?auto_9983 ?auto_9989 ) ( CLEAR ?auto_9983 ) ( TRUCK-AT ?auto_9986 ?auto_9985 ) ( not ( = ?auto_9982 ?auto_9983 ) ) ( not ( = ?auto_9982 ?auto_9989 ) ) ( not ( = ?auto_9983 ?auto_9989 ) ) ( not ( = ?auto_9984 ?auto_9988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9986 ?auto_9985 ?auto_9987 )
      ( !LIFT ?auto_9988 ?auto_9983 ?auto_9989 ?auto_9987 )
      ( !LOAD ?auto_9988 ?auto_9983 ?auto_9986 ?auto_9987 )
      ( !DRIVE ?auto_9986 ?auto_9987 ?auto_9985 )
      ( !UNLOAD ?auto_9984 ?auto_9983 ?auto_9986 ?auto_9985 )
      ( !DROP ?auto_9984 ?auto_9983 ?auto_9982 ?auto_9985 )
      ( MAKE-1CRATE-VERIFY ?auto_9982 ?auto_9983 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9997 - SURFACE
      ?auto_9998 - SURFACE
      ?auto_9999 - SURFACE
      ?auto_10000 - SURFACE
      ?auto_10001 - SURFACE
      ?auto_10003 - SURFACE
      ?auto_10002 - SURFACE
    )
    :vars
    (
      ?auto_10004 - HOIST
      ?auto_10005 - PLACE
      ?auto_10009 - PLACE
      ?auto_10006 - HOIST
      ?auto_10008 - SURFACE
      ?auto_10017 - PLACE
      ?auto_10022 - HOIST
      ?auto_10014 - SURFACE
      ?auto_10018 - PLACE
      ?auto_10019 - HOIST
      ?auto_10021 - SURFACE
      ?auto_10012 - PLACE
      ?auto_10010 - HOIST
      ?auto_10011 - SURFACE
      ?auto_10016 - SURFACE
      ?auto_10013 - PLACE
      ?auto_10015 - HOIST
      ?auto_10020 - SURFACE
      ?auto_10007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10004 ?auto_10005 ) ( IS-CRATE ?auto_10002 ) ( not ( = ?auto_10009 ?auto_10005 ) ) ( HOIST-AT ?auto_10006 ?auto_10009 ) ( AVAILABLE ?auto_10006 ) ( SURFACE-AT ?auto_10002 ?auto_10009 ) ( ON ?auto_10002 ?auto_10008 ) ( CLEAR ?auto_10002 ) ( not ( = ?auto_10003 ?auto_10002 ) ) ( not ( = ?auto_10003 ?auto_10008 ) ) ( not ( = ?auto_10002 ?auto_10008 ) ) ( not ( = ?auto_10004 ?auto_10006 ) ) ( IS-CRATE ?auto_10003 ) ( not ( = ?auto_10017 ?auto_10005 ) ) ( HOIST-AT ?auto_10022 ?auto_10017 ) ( SURFACE-AT ?auto_10003 ?auto_10017 ) ( ON ?auto_10003 ?auto_10014 ) ( CLEAR ?auto_10003 ) ( not ( = ?auto_10001 ?auto_10003 ) ) ( not ( = ?auto_10001 ?auto_10014 ) ) ( not ( = ?auto_10003 ?auto_10014 ) ) ( not ( = ?auto_10004 ?auto_10022 ) ) ( IS-CRATE ?auto_10001 ) ( not ( = ?auto_10018 ?auto_10005 ) ) ( HOIST-AT ?auto_10019 ?auto_10018 ) ( AVAILABLE ?auto_10019 ) ( SURFACE-AT ?auto_10001 ?auto_10018 ) ( ON ?auto_10001 ?auto_10021 ) ( CLEAR ?auto_10001 ) ( not ( = ?auto_10000 ?auto_10001 ) ) ( not ( = ?auto_10000 ?auto_10021 ) ) ( not ( = ?auto_10001 ?auto_10021 ) ) ( not ( = ?auto_10004 ?auto_10019 ) ) ( IS-CRATE ?auto_10000 ) ( not ( = ?auto_10012 ?auto_10005 ) ) ( HOIST-AT ?auto_10010 ?auto_10012 ) ( AVAILABLE ?auto_10010 ) ( SURFACE-AT ?auto_10000 ?auto_10012 ) ( ON ?auto_10000 ?auto_10011 ) ( CLEAR ?auto_10000 ) ( not ( = ?auto_9999 ?auto_10000 ) ) ( not ( = ?auto_9999 ?auto_10011 ) ) ( not ( = ?auto_10000 ?auto_10011 ) ) ( not ( = ?auto_10004 ?auto_10010 ) ) ( IS-CRATE ?auto_9999 ) ( AVAILABLE ?auto_10022 ) ( SURFACE-AT ?auto_9999 ?auto_10017 ) ( ON ?auto_9999 ?auto_10016 ) ( CLEAR ?auto_9999 ) ( not ( = ?auto_9998 ?auto_9999 ) ) ( not ( = ?auto_9998 ?auto_10016 ) ) ( not ( = ?auto_9999 ?auto_10016 ) ) ( SURFACE-AT ?auto_9997 ?auto_10005 ) ( CLEAR ?auto_9997 ) ( IS-CRATE ?auto_9998 ) ( AVAILABLE ?auto_10004 ) ( not ( = ?auto_10013 ?auto_10005 ) ) ( HOIST-AT ?auto_10015 ?auto_10013 ) ( AVAILABLE ?auto_10015 ) ( SURFACE-AT ?auto_9998 ?auto_10013 ) ( ON ?auto_9998 ?auto_10020 ) ( CLEAR ?auto_9998 ) ( TRUCK-AT ?auto_10007 ?auto_10005 ) ( not ( = ?auto_9997 ?auto_9998 ) ) ( not ( = ?auto_9997 ?auto_10020 ) ) ( not ( = ?auto_9998 ?auto_10020 ) ) ( not ( = ?auto_10004 ?auto_10015 ) ) ( not ( = ?auto_9997 ?auto_9999 ) ) ( not ( = ?auto_9997 ?auto_10016 ) ) ( not ( = ?auto_9999 ?auto_10020 ) ) ( not ( = ?auto_10017 ?auto_10013 ) ) ( not ( = ?auto_10022 ?auto_10015 ) ) ( not ( = ?auto_10016 ?auto_10020 ) ) ( not ( = ?auto_9997 ?auto_10000 ) ) ( not ( = ?auto_9997 ?auto_10011 ) ) ( not ( = ?auto_9998 ?auto_10000 ) ) ( not ( = ?auto_9998 ?auto_10011 ) ) ( not ( = ?auto_10000 ?auto_10016 ) ) ( not ( = ?auto_10000 ?auto_10020 ) ) ( not ( = ?auto_10012 ?auto_10017 ) ) ( not ( = ?auto_10012 ?auto_10013 ) ) ( not ( = ?auto_10010 ?auto_10022 ) ) ( not ( = ?auto_10010 ?auto_10015 ) ) ( not ( = ?auto_10011 ?auto_10016 ) ) ( not ( = ?auto_10011 ?auto_10020 ) ) ( not ( = ?auto_9997 ?auto_10001 ) ) ( not ( = ?auto_9997 ?auto_10021 ) ) ( not ( = ?auto_9998 ?auto_10001 ) ) ( not ( = ?auto_9998 ?auto_10021 ) ) ( not ( = ?auto_9999 ?auto_10001 ) ) ( not ( = ?auto_9999 ?auto_10021 ) ) ( not ( = ?auto_10001 ?auto_10011 ) ) ( not ( = ?auto_10001 ?auto_10016 ) ) ( not ( = ?auto_10001 ?auto_10020 ) ) ( not ( = ?auto_10018 ?auto_10012 ) ) ( not ( = ?auto_10018 ?auto_10017 ) ) ( not ( = ?auto_10018 ?auto_10013 ) ) ( not ( = ?auto_10019 ?auto_10010 ) ) ( not ( = ?auto_10019 ?auto_10022 ) ) ( not ( = ?auto_10019 ?auto_10015 ) ) ( not ( = ?auto_10021 ?auto_10011 ) ) ( not ( = ?auto_10021 ?auto_10016 ) ) ( not ( = ?auto_10021 ?auto_10020 ) ) ( not ( = ?auto_9997 ?auto_10003 ) ) ( not ( = ?auto_9997 ?auto_10014 ) ) ( not ( = ?auto_9998 ?auto_10003 ) ) ( not ( = ?auto_9998 ?auto_10014 ) ) ( not ( = ?auto_9999 ?auto_10003 ) ) ( not ( = ?auto_9999 ?auto_10014 ) ) ( not ( = ?auto_10000 ?auto_10003 ) ) ( not ( = ?auto_10000 ?auto_10014 ) ) ( not ( = ?auto_10003 ?auto_10021 ) ) ( not ( = ?auto_10003 ?auto_10011 ) ) ( not ( = ?auto_10003 ?auto_10016 ) ) ( not ( = ?auto_10003 ?auto_10020 ) ) ( not ( = ?auto_10014 ?auto_10021 ) ) ( not ( = ?auto_10014 ?auto_10011 ) ) ( not ( = ?auto_10014 ?auto_10016 ) ) ( not ( = ?auto_10014 ?auto_10020 ) ) ( not ( = ?auto_9997 ?auto_10002 ) ) ( not ( = ?auto_9997 ?auto_10008 ) ) ( not ( = ?auto_9998 ?auto_10002 ) ) ( not ( = ?auto_9998 ?auto_10008 ) ) ( not ( = ?auto_9999 ?auto_10002 ) ) ( not ( = ?auto_9999 ?auto_10008 ) ) ( not ( = ?auto_10000 ?auto_10002 ) ) ( not ( = ?auto_10000 ?auto_10008 ) ) ( not ( = ?auto_10001 ?auto_10002 ) ) ( not ( = ?auto_10001 ?auto_10008 ) ) ( not ( = ?auto_10002 ?auto_10014 ) ) ( not ( = ?auto_10002 ?auto_10021 ) ) ( not ( = ?auto_10002 ?auto_10011 ) ) ( not ( = ?auto_10002 ?auto_10016 ) ) ( not ( = ?auto_10002 ?auto_10020 ) ) ( not ( = ?auto_10009 ?auto_10017 ) ) ( not ( = ?auto_10009 ?auto_10018 ) ) ( not ( = ?auto_10009 ?auto_10012 ) ) ( not ( = ?auto_10009 ?auto_10013 ) ) ( not ( = ?auto_10006 ?auto_10022 ) ) ( not ( = ?auto_10006 ?auto_10019 ) ) ( not ( = ?auto_10006 ?auto_10010 ) ) ( not ( = ?auto_10006 ?auto_10015 ) ) ( not ( = ?auto_10008 ?auto_10014 ) ) ( not ( = ?auto_10008 ?auto_10021 ) ) ( not ( = ?auto_10008 ?auto_10011 ) ) ( not ( = ?auto_10008 ?auto_10016 ) ) ( not ( = ?auto_10008 ?auto_10020 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9997 ?auto_9998 ?auto_9999 ?auto_10000 ?auto_10001 ?auto_10003 )
      ( MAKE-1CRATE ?auto_10003 ?auto_10002 )
      ( MAKE-6CRATE-VERIFY ?auto_9997 ?auto_9998 ?auto_9999 ?auto_10000 ?auto_10001 ?auto_10003 ?auto_10002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10025 - SURFACE
      ?auto_10026 - SURFACE
    )
    :vars
    (
      ?auto_10027 - HOIST
      ?auto_10028 - PLACE
      ?auto_10030 - PLACE
      ?auto_10031 - HOIST
      ?auto_10032 - SURFACE
      ?auto_10029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10027 ?auto_10028 ) ( SURFACE-AT ?auto_10025 ?auto_10028 ) ( CLEAR ?auto_10025 ) ( IS-CRATE ?auto_10026 ) ( AVAILABLE ?auto_10027 ) ( not ( = ?auto_10030 ?auto_10028 ) ) ( HOIST-AT ?auto_10031 ?auto_10030 ) ( AVAILABLE ?auto_10031 ) ( SURFACE-AT ?auto_10026 ?auto_10030 ) ( ON ?auto_10026 ?auto_10032 ) ( CLEAR ?auto_10026 ) ( TRUCK-AT ?auto_10029 ?auto_10028 ) ( not ( = ?auto_10025 ?auto_10026 ) ) ( not ( = ?auto_10025 ?auto_10032 ) ) ( not ( = ?auto_10026 ?auto_10032 ) ) ( not ( = ?auto_10027 ?auto_10031 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10029 ?auto_10028 ?auto_10030 )
      ( !LIFT ?auto_10031 ?auto_10026 ?auto_10032 ?auto_10030 )
      ( !LOAD ?auto_10031 ?auto_10026 ?auto_10029 ?auto_10030 )
      ( !DRIVE ?auto_10029 ?auto_10030 ?auto_10028 )
      ( !UNLOAD ?auto_10027 ?auto_10026 ?auto_10029 ?auto_10028 )
      ( !DROP ?auto_10027 ?auto_10026 ?auto_10025 ?auto_10028 )
      ( MAKE-1CRATE-VERIFY ?auto_10025 ?auto_10026 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10041 - SURFACE
      ?auto_10042 - SURFACE
      ?auto_10043 - SURFACE
      ?auto_10044 - SURFACE
      ?auto_10045 - SURFACE
      ?auto_10047 - SURFACE
      ?auto_10046 - SURFACE
      ?auto_10048 - SURFACE
    )
    :vars
    (
      ?auto_10049 - HOIST
      ?auto_10050 - PLACE
      ?auto_10052 - PLACE
      ?auto_10054 - HOIST
      ?auto_10051 - SURFACE
      ?auto_10062 - PLACE
      ?auto_10055 - HOIST
      ?auto_10063 - SURFACE
      ?auto_10058 - PLACE
      ?auto_10057 - HOIST
      ?auto_10061 - SURFACE
      ?auto_10068 - PLACE
      ?auto_10070 - HOIST
      ?auto_10056 - SURFACE
      ?auto_10066 - PLACE
      ?auto_10067 - HOIST
      ?auto_10065 - SURFACE
      ?auto_10059 - SURFACE
      ?auto_10064 - PLACE
      ?auto_10060 - HOIST
      ?auto_10069 - SURFACE
      ?auto_10053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10049 ?auto_10050 ) ( IS-CRATE ?auto_10048 ) ( not ( = ?auto_10052 ?auto_10050 ) ) ( HOIST-AT ?auto_10054 ?auto_10052 ) ( AVAILABLE ?auto_10054 ) ( SURFACE-AT ?auto_10048 ?auto_10052 ) ( ON ?auto_10048 ?auto_10051 ) ( CLEAR ?auto_10048 ) ( not ( = ?auto_10046 ?auto_10048 ) ) ( not ( = ?auto_10046 ?auto_10051 ) ) ( not ( = ?auto_10048 ?auto_10051 ) ) ( not ( = ?auto_10049 ?auto_10054 ) ) ( IS-CRATE ?auto_10046 ) ( not ( = ?auto_10062 ?auto_10050 ) ) ( HOIST-AT ?auto_10055 ?auto_10062 ) ( AVAILABLE ?auto_10055 ) ( SURFACE-AT ?auto_10046 ?auto_10062 ) ( ON ?auto_10046 ?auto_10063 ) ( CLEAR ?auto_10046 ) ( not ( = ?auto_10047 ?auto_10046 ) ) ( not ( = ?auto_10047 ?auto_10063 ) ) ( not ( = ?auto_10046 ?auto_10063 ) ) ( not ( = ?auto_10049 ?auto_10055 ) ) ( IS-CRATE ?auto_10047 ) ( not ( = ?auto_10058 ?auto_10050 ) ) ( HOIST-AT ?auto_10057 ?auto_10058 ) ( SURFACE-AT ?auto_10047 ?auto_10058 ) ( ON ?auto_10047 ?auto_10061 ) ( CLEAR ?auto_10047 ) ( not ( = ?auto_10045 ?auto_10047 ) ) ( not ( = ?auto_10045 ?auto_10061 ) ) ( not ( = ?auto_10047 ?auto_10061 ) ) ( not ( = ?auto_10049 ?auto_10057 ) ) ( IS-CRATE ?auto_10045 ) ( not ( = ?auto_10068 ?auto_10050 ) ) ( HOIST-AT ?auto_10070 ?auto_10068 ) ( AVAILABLE ?auto_10070 ) ( SURFACE-AT ?auto_10045 ?auto_10068 ) ( ON ?auto_10045 ?auto_10056 ) ( CLEAR ?auto_10045 ) ( not ( = ?auto_10044 ?auto_10045 ) ) ( not ( = ?auto_10044 ?auto_10056 ) ) ( not ( = ?auto_10045 ?auto_10056 ) ) ( not ( = ?auto_10049 ?auto_10070 ) ) ( IS-CRATE ?auto_10044 ) ( not ( = ?auto_10066 ?auto_10050 ) ) ( HOIST-AT ?auto_10067 ?auto_10066 ) ( AVAILABLE ?auto_10067 ) ( SURFACE-AT ?auto_10044 ?auto_10066 ) ( ON ?auto_10044 ?auto_10065 ) ( CLEAR ?auto_10044 ) ( not ( = ?auto_10043 ?auto_10044 ) ) ( not ( = ?auto_10043 ?auto_10065 ) ) ( not ( = ?auto_10044 ?auto_10065 ) ) ( not ( = ?auto_10049 ?auto_10067 ) ) ( IS-CRATE ?auto_10043 ) ( AVAILABLE ?auto_10057 ) ( SURFACE-AT ?auto_10043 ?auto_10058 ) ( ON ?auto_10043 ?auto_10059 ) ( CLEAR ?auto_10043 ) ( not ( = ?auto_10042 ?auto_10043 ) ) ( not ( = ?auto_10042 ?auto_10059 ) ) ( not ( = ?auto_10043 ?auto_10059 ) ) ( SURFACE-AT ?auto_10041 ?auto_10050 ) ( CLEAR ?auto_10041 ) ( IS-CRATE ?auto_10042 ) ( AVAILABLE ?auto_10049 ) ( not ( = ?auto_10064 ?auto_10050 ) ) ( HOIST-AT ?auto_10060 ?auto_10064 ) ( AVAILABLE ?auto_10060 ) ( SURFACE-AT ?auto_10042 ?auto_10064 ) ( ON ?auto_10042 ?auto_10069 ) ( CLEAR ?auto_10042 ) ( TRUCK-AT ?auto_10053 ?auto_10050 ) ( not ( = ?auto_10041 ?auto_10042 ) ) ( not ( = ?auto_10041 ?auto_10069 ) ) ( not ( = ?auto_10042 ?auto_10069 ) ) ( not ( = ?auto_10049 ?auto_10060 ) ) ( not ( = ?auto_10041 ?auto_10043 ) ) ( not ( = ?auto_10041 ?auto_10059 ) ) ( not ( = ?auto_10043 ?auto_10069 ) ) ( not ( = ?auto_10058 ?auto_10064 ) ) ( not ( = ?auto_10057 ?auto_10060 ) ) ( not ( = ?auto_10059 ?auto_10069 ) ) ( not ( = ?auto_10041 ?auto_10044 ) ) ( not ( = ?auto_10041 ?auto_10065 ) ) ( not ( = ?auto_10042 ?auto_10044 ) ) ( not ( = ?auto_10042 ?auto_10065 ) ) ( not ( = ?auto_10044 ?auto_10059 ) ) ( not ( = ?auto_10044 ?auto_10069 ) ) ( not ( = ?auto_10066 ?auto_10058 ) ) ( not ( = ?auto_10066 ?auto_10064 ) ) ( not ( = ?auto_10067 ?auto_10057 ) ) ( not ( = ?auto_10067 ?auto_10060 ) ) ( not ( = ?auto_10065 ?auto_10059 ) ) ( not ( = ?auto_10065 ?auto_10069 ) ) ( not ( = ?auto_10041 ?auto_10045 ) ) ( not ( = ?auto_10041 ?auto_10056 ) ) ( not ( = ?auto_10042 ?auto_10045 ) ) ( not ( = ?auto_10042 ?auto_10056 ) ) ( not ( = ?auto_10043 ?auto_10045 ) ) ( not ( = ?auto_10043 ?auto_10056 ) ) ( not ( = ?auto_10045 ?auto_10065 ) ) ( not ( = ?auto_10045 ?auto_10059 ) ) ( not ( = ?auto_10045 ?auto_10069 ) ) ( not ( = ?auto_10068 ?auto_10066 ) ) ( not ( = ?auto_10068 ?auto_10058 ) ) ( not ( = ?auto_10068 ?auto_10064 ) ) ( not ( = ?auto_10070 ?auto_10067 ) ) ( not ( = ?auto_10070 ?auto_10057 ) ) ( not ( = ?auto_10070 ?auto_10060 ) ) ( not ( = ?auto_10056 ?auto_10065 ) ) ( not ( = ?auto_10056 ?auto_10059 ) ) ( not ( = ?auto_10056 ?auto_10069 ) ) ( not ( = ?auto_10041 ?auto_10047 ) ) ( not ( = ?auto_10041 ?auto_10061 ) ) ( not ( = ?auto_10042 ?auto_10047 ) ) ( not ( = ?auto_10042 ?auto_10061 ) ) ( not ( = ?auto_10043 ?auto_10047 ) ) ( not ( = ?auto_10043 ?auto_10061 ) ) ( not ( = ?auto_10044 ?auto_10047 ) ) ( not ( = ?auto_10044 ?auto_10061 ) ) ( not ( = ?auto_10047 ?auto_10056 ) ) ( not ( = ?auto_10047 ?auto_10065 ) ) ( not ( = ?auto_10047 ?auto_10059 ) ) ( not ( = ?auto_10047 ?auto_10069 ) ) ( not ( = ?auto_10061 ?auto_10056 ) ) ( not ( = ?auto_10061 ?auto_10065 ) ) ( not ( = ?auto_10061 ?auto_10059 ) ) ( not ( = ?auto_10061 ?auto_10069 ) ) ( not ( = ?auto_10041 ?auto_10046 ) ) ( not ( = ?auto_10041 ?auto_10063 ) ) ( not ( = ?auto_10042 ?auto_10046 ) ) ( not ( = ?auto_10042 ?auto_10063 ) ) ( not ( = ?auto_10043 ?auto_10046 ) ) ( not ( = ?auto_10043 ?auto_10063 ) ) ( not ( = ?auto_10044 ?auto_10046 ) ) ( not ( = ?auto_10044 ?auto_10063 ) ) ( not ( = ?auto_10045 ?auto_10046 ) ) ( not ( = ?auto_10045 ?auto_10063 ) ) ( not ( = ?auto_10046 ?auto_10061 ) ) ( not ( = ?auto_10046 ?auto_10056 ) ) ( not ( = ?auto_10046 ?auto_10065 ) ) ( not ( = ?auto_10046 ?auto_10059 ) ) ( not ( = ?auto_10046 ?auto_10069 ) ) ( not ( = ?auto_10062 ?auto_10058 ) ) ( not ( = ?auto_10062 ?auto_10068 ) ) ( not ( = ?auto_10062 ?auto_10066 ) ) ( not ( = ?auto_10062 ?auto_10064 ) ) ( not ( = ?auto_10055 ?auto_10057 ) ) ( not ( = ?auto_10055 ?auto_10070 ) ) ( not ( = ?auto_10055 ?auto_10067 ) ) ( not ( = ?auto_10055 ?auto_10060 ) ) ( not ( = ?auto_10063 ?auto_10061 ) ) ( not ( = ?auto_10063 ?auto_10056 ) ) ( not ( = ?auto_10063 ?auto_10065 ) ) ( not ( = ?auto_10063 ?auto_10059 ) ) ( not ( = ?auto_10063 ?auto_10069 ) ) ( not ( = ?auto_10041 ?auto_10048 ) ) ( not ( = ?auto_10041 ?auto_10051 ) ) ( not ( = ?auto_10042 ?auto_10048 ) ) ( not ( = ?auto_10042 ?auto_10051 ) ) ( not ( = ?auto_10043 ?auto_10048 ) ) ( not ( = ?auto_10043 ?auto_10051 ) ) ( not ( = ?auto_10044 ?auto_10048 ) ) ( not ( = ?auto_10044 ?auto_10051 ) ) ( not ( = ?auto_10045 ?auto_10048 ) ) ( not ( = ?auto_10045 ?auto_10051 ) ) ( not ( = ?auto_10047 ?auto_10048 ) ) ( not ( = ?auto_10047 ?auto_10051 ) ) ( not ( = ?auto_10048 ?auto_10063 ) ) ( not ( = ?auto_10048 ?auto_10061 ) ) ( not ( = ?auto_10048 ?auto_10056 ) ) ( not ( = ?auto_10048 ?auto_10065 ) ) ( not ( = ?auto_10048 ?auto_10059 ) ) ( not ( = ?auto_10048 ?auto_10069 ) ) ( not ( = ?auto_10052 ?auto_10062 ) ) ( not ( = ?auto_10052 ?auto_10058 ) ) ( not ( = ?auto_10052 ?auto_10068 ) ) ( not ( = ?auto_10052 ?auto_10066 ) ) ( not ( = ?auto_10052 ?auto_10064 ) ) ( not ( = ?auto_10054 ?auto_10055 ) ) ( not ( = ?auto_10054 ?auto_10057 ) ) ( not ( = ?auto_10054 ?auto_10070 ) ) ( not ( = ?auto_10054 ?auto_10067 ) ) ( not ( = ?auto_10054 ?auto_10060 ) ) ( not ( = ?auto_10051 ?auto_10063 ) ) ( not ( = ?auto_10051 ?auto_10061 ) ) ( not ( = ?auto_10051 ?auto_10056 ) ) ( not ( = ?auto_10051 ?auto_10065 ) ) ( not ( = ?auto_10051 ?auto_10059 ) ) ( not ( = ?auto_10051 ?auto_10069 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10041 ?auto_10042 ?auto_10043 ?auto_10044 ?auto_10045 ?auto_10047 ?auto_10046 )
      ( MAKE-1CRATE ?auto_10046 ?auto_10048 )
      ( MAKE-7CRATE-VERIFY ?auto_10041 ?auto_10042 ?auto_10043 ?auto_10044 ?auto_10045 ?auto_10047 ?auto_10046 ?auto_10048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10073 - SURFACE
      ?auto_10074 - SURFACE
    )
    :vars
    (
      ?auto_10075 - HOIST
      ?auto_10076 - PLACE
      ?auto_10078 - PLACE
      ?auto_10079 - HOIST
      ?auto_10080 - SURFACE
      ?auto_10077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10075 ?auto_10076 ) ( SURFACE-AT ?auto_10073 ?auto_10076 ) ( CLEAR ?auto_10073 ) ( IS-CRATE ?auto_10074 ) ( AVAILABLE ?auto_10075 ) ( not ( = ?auto_10078 ?auto_10076 ) ) ( HOIST-AT ?auto_10079 ?auto_10078 ) ( AVAILABLE ?auto_10079 ) ( SURFACE-AT ?auto_10074 ?auto_10078 ) ( ON ?auto_10074 ?auto_10080 ) ( CLEAR ?auto_10074 ) ( TRUCK-AT ?auto_10077 ?auto_10076 ) ( not ( = ?auto_10073 ?auto_10074 ) ) ( not ( = ?auto_10073 ?auto_10080 ) ) ( not ( = ?auto_10074 ?auto_10080 ) ) ( not ( = ?auto_10075 ?auto_10079 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10077 ?auto_10076 ?auto_10078 )
      ( !LIFT ?auto_10079 ?auto_10074 ?auto_10080 ?auto_10078 )
      ( !LOAD ?auto_10079 ?auto_10074 ?auto_10077 ?auto_10078 )
      ( !DRIVE ?auto_10077 ?auto_10078 ?auto_10076 )
      ( !UNLOAD ?auto_10075 ?auto_10074 ?auto_10077 ?auto_10076 )
      ( !DROP ?auto_10075 ?auto_10074 ?auto_10073 ?auto_10076 )
      ( MAKE-1CRATE-VERIFY ?auto_10073 ?auto_10074 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10090 - SURFACE
      ?auto_10091 - SURFACE
      ?auto_10092 - SURFACE
      ?auto_10093 - SURFACE
      ?auto_10094 - SURFACE
      ?auto_10096 - SURFACE
      ?auto_10095 - SURFACE
      ?auto_10098 - SURFACE
      ?auto_10097 - SURFACE
    )
    :vars
    (
      ?auto_10100 - HOIST
      ?auto_10102 - PLACE
      ?auto_10104 - PLACE
      ?auto_10103 - HOIST
      ?auto_10101 - SURFACE
      ?auto_10123 - PLACE
      ?auto_10121 - HOIST
      ?auto_10122 - SURFACE
      ?auto_10117 - PLACE
      ?auto_10109 - HOIST
      ?auto_10111 - SURFACE
      ?auto_10105 - PLACE
      ?auto_10107 - HOIST
      ?auto_10118 - SURFACE
      ?auto_10116 - PLACE
      ?auto_10110 - HOIST
      ?auto_10106 - SURFACE
      ?auto_10114 - PLACE
      ?auto_10115 - HOIST
      ?auto_10112 - SURFACE
      ?auto_10120 - SURFACE
      ?auto_10113 - PLACE
      ?auto_10119 - HOIST
      ?auto_10108 - SURFACE
      ?auto_10099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10100 ?auto_10102 ) ( IS-CRATE ?auto_10097 ) ( not ( = ?auto_10104 ?auto_10102 ) ) ( HOIST-AT ?auto_10103 ?auto_10104 ) ( AVAILABLE ?auto_10103 ) ( SURFACE-AT ?auto_10097 ?auto_10104 ) ( ON ?auto_10097 ?auto_10101 ) ( CLEAR ?auto_10097 ) ( not ( = ?auto_10098 ?auto_10097 ) ) ( not ( = ?auto_10098 ?auto_10101 ) ) ( not ( = ?auto_10097 ?auto_10101 ) ) ( not ( = ?auto_10100 ?auto_10103 ) ) ( IS-CRATE ?auto_10098 ) ( not ( = ?auto_10123 ?auto_10102 ) ) ( HOIST-AT ?auto_10121 ?auto_10123 ) ( AVAILABLE ?auto_10121 ) ( SURFACE-AT ?auto_10098 ?auto_10123 ) ( ON ?auto_10098 ?auto_10122 ) ( CLEAR ?auto_10098 ) ( not ( = ?auto_10095 ?auto_10098 ) ) ( not ( = ?auto_10095 ?auto_10122 ) ) ( not ( = ?auto_10098 ?auto_10122 ) ) ( not ( = ?auto_10100 ?auto_10121 ) ) ( IS-CRATE ?auto_10095 ) ( not ( = ?auto_10117 ?auto_10102 ) ) ( HOIST-AT ?auto_10109 ?auto_10117 ) ( AVAILABLE ?auto_10109 ) ( SURFACE-AT ?auto_10095 ?auto_10117 ) ( ON ?auto_10095 ?auto_10111 ) ( CLEAR ?auto_10095 ) ( not ( = ?auto_10096 ?auto_10095 ) ) ( not ( = ?auto_10096 ?auto_10111 ) ) ( not ( = ?auto_10095 ?auto_10111 ) ) ( not ( = ?auto_10100 ?auto_10109 ) ) ( IS-CRATE ?auto_10096 ) ( not ( = ?auto_10105 ?auto_10102 ) ) ( HOIST-AT ?auto_10107 ?auto_10105 ) ( SURFACE-AT ?auto_10096 ?auto_10105 ) ( ON ?auto_10096 ?auto_10118 ) ( CLEAR ?auto_10096 ) ( not ( = ?auto_10094 ?auto_10096 ) ) ( not ( = ?auto_10094 ?auto_10118 ) ) ( not ( = ?auto_10096 ?auto_10118 ) ) ( not ( = ?auto_10100 ?auto_10107 ) ) ( IS-CRATE ?auto_10094 ) ( not ( = ?auto_10116 ?auto_10102 ) ) ( HOIST-AT ?auto_10110 ?auto_10116 ) ( AVAILABLE ?auto_10110 ) ( SURFACE-AT ?auto_10094 ?auto_10116 ) ( ON ?auto_10094 ?auto_10106 ) ( CLEAR ?auto_10094 ) ( not ( = ?auto_10093 ?auto_10094 ) ) ( not ( = ?auto_10093 ?auto_10106 ) ) ( not ( = ?auto_10094 ?auto_10106 ) ) ( not ( = ?auto_10100 ?auto_10110 ) ) ( IS-CRATE ?auto_10093 ) ( not ( = ?auto_10114 ?auto_10102 ) ) ( HOIST-AT ?auto_10115 ?auto_10114 ) ( AVAILABLE ?auto_10115 ) ( SURFACE-AT ?auto_10093 ?auto_10114 ) ( ON ?auto_10093 ?auto_10112 ) ( CLEAR ?auto_10093 ) ( not ( = ?auto_10092 ?auto_10093 ) ) ( not ( = ?auto_10092 ?auto_10112 ) ) ( not ( = ?auto_10093 ?auto_10112 ) ) ( not ( = ?auto_10100 ?auto_10115 ) ) ( IS-CRATE ?auto_10092 ) ( AVAILABLE ?auto_10107 ) ( SURFACE-AT ?auto_10092 ?auto_10105 ) ( ON ?auto_10092 ?auto_10120 ) ( CLEAR ?auto_10092 ) ( not ( = ?auto_10091 ?auto_10092 ) ) ( not ( = ?auto_10091 ?auto_10120 ) ) ( not ( = ?auto_10092 ?auto_10120 ) ) ( SURFACE-AT ?auto_10090 ?auto_10102 ) ( CLEAR ?auto_10090 ) ( IS-CRATE ?auto_10091 ) ( AVAILABLE ?auto_10100 ) ( not ( = ?auto_10113 ?auto_10102 ) ) ( HOIST-AT ?auto_10119 ?auto_10113 ) ( AVAILABLE ?auto_10119 ) ( SURFACE-AT ?auto_10091 ?auto_10113 ) ( ON ?auto_10091 ?auto_10108 ) ( CLEAR ?auto_10091 ) ( TRUCK-AT ?auto_10099 ?auto_10102 ) ( not ( = ?auto_10090 ?auto_10091 ) ) ( not ( = ?auto_10090 ?auto_10108 ) ) ( not ( = ?auto_10091 ?auto_10108 ) ) ( not ( = ?auto_10100 ?auto_10119 ) ) ( not ( = ?auto_10090 ?auto_10092 ) ) ( not ( = ?auto_10090 ?auto_10120 ) ) ( not ( = ?auto_10092 ?auto_10108 ) ) ( not ( = ?auto_10105 ?auto_10113 ) ) ( not ( = ?auto_10107 ?auto_10119 ) ) ( not ( = ?auto_10120 ?auto_10108 ) ) ( not ( = ?auto_10090 ?auto_10093 ) ) ( not ( = ?auto_10090 ?auto_10112 ) ) ( not ( = ?auto_10091 ?auto_10093 ) ) ( not ( = ?auto_10091 ?auto_10112 ) ) ( not ( = ?auto_10093 ?auto_10120 ) ) ( not ( = ?auto_10093 ?auto_10108 ) ) ( not ( = ?auto_10114 ?auto_10105 ) ) ( not ( = ?auto_10114 ?auto_10113 ) ) ( not ( = ?auto_10115 ?auto_10107 ) ) ( not ( = ?auto_10115 ?auto_10119 ) ) ( not ( = ?auto_10112 ?auto_10120 ) ) ( not ( = ?auto_10112 ?auto_10108 ) ) ( not ( = ?auto_10090 ?auto_10094 ) ) ( not ( = ?auto_10090 ?auto_10106 ) ) ( not ( = ?auto_10091 ?auto_10094 ) ) ( not ( = ?auto_10091 ?auto_10106 ) ) ( not ( = ?auto_10092 ?auto_10094 ) ) ( not ( = ?auto_10092 ?auto_10106 ) ) ( not ( = ?auto_10094 ?auto_10112 ) ) ( not ( = ?auto_10094 ?auto_10120 ) ) ( not ( = ?auto_10094 ?auto_10108 ) ) ( not ( = ?auto_10116 ?auto_10114 ) ) ( not ( = ?auto_10116 ?auto_10105 ) ) ( not ( = ?auto_10116 ?auto_10113 ) ) ( not ( = ?auto_10110 ?auto_10115 ) ) ( not ( = ?auto_10110 ?auto_10107 ) ) ( not ( = ?auto_10110 ?auto_10119 ) ) ( not ( = ?auto_10106 ?auto_10112 ) ) ( not ( = ?auto_10106 ?auto_10120 ) ) ( not ( = ?auto_10106 ?auto_10108 ) ) ( not ( = ?auto_10090 ?auto_10096 ) ) ( not ( = ?auto_10090 ?auto_10118 ) ) ( not ( = ?auto_10091 ?auto_10096 ) ) ( not ( = ?auto_10091 ?auto_10118 ) ) ( not ( = ?auto_10092 ?auto_10096 ) ) ( not ( = ?auto_10092 ?auto_10118 ) ) ( not ( = ?auto_10093 ?auto_10096 ) ) ( not ( = ?auto_10093 ?auto_10118 ) ) ( not ( = ?auto_10096 ?auto_10106 ) ) ( not ( = ?auto_10096 ?auto_10112 ) ) ( not ( = ?auto_10096 ?auto_10120 ) ) ( not ( = ?auto_10096 ?auto_10108 ) ) ( not ( = ?auto_10118 ?auto_10106 ) ) ( not ( = ?auto_10118 ?auto_10112 ) ) ( not ( = ?auto_10118 ?auto_10120 ) ) ( not ( = ?auto_10118 ?auto_10108 ) ) ( not ( = ?auto_10090 ?auto_10095 ) ) ( not ( = ?auto_10090 ?auto_10111 ) ) ( not ( = ?auto_10091 ?auto_10095 ) ) ( not ( = ?auto_10091 ?auto_10111 ) ) ( not ( = ?auto_10092 ?auto_10095 ) ) ( not ( = ?auto_10092 ?auto_10111 ) ) ( not ( = ?auto_10093 ?auto_10095 ) ) ( not ( = ?auto_10093 ?auto_10111 ) ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10111 ) ) ( not ( = ?auto_10095 ?auto_10118 ) ) ( not ( = ?auto_10095 ?auto_10106 ) ) ( not ( = ?auto_10095 ?auto_10112 ) ) ( not ( = ?auto_10095 ?auto_10120 ) ) ( not ( = ?auto_10095 ?auto_10108 ) ) ( not ( = ?auto_10117 ?auto_10105 ) ) ( not ( = ?auto_10117 ?auto_10116 ) ) ( not ( = ?auto_10117 ?auto_10114 ) ) ( not ( = ?auto_10117 ?auto_10113 ) ) ( not ( = ?auto_10109 ?auto_10107 ) ) ( not ( = ?auto_10109 ?auto_10110 ) ) ( not ( = ?auto_10109 ?auto_10115 ) ) ( not ( = ?auto_10109 ?auto_10119 ) ) ( not ( = ?auto_10111 ?auto_10118 ) ) ( not ( = ?auto_10111 ?auto_10106 ) ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( not ( = ?auto_10111 ?auto_10120 ) ) ( not ( = ?auto_10111 ?auto_10108 ) ) ( not ( = ?auto_10090 ?auto_10098 ) ) ( not ( = ?auto_10090 ?auto_10122 ) ) ( not ( = ?auto_10091 ?auto_10098 ) ) ( not ( = ?auto_10091 ?auto_10122 ) ) ( not ( = ?auto_10092 ?auto_10098 ) ) ( not ( = ?auto_10092 ?auto_10122 ) ) ( not ( = ?auto_10093 ?auto_10098 ) ) ( not ( = ?auto_10093 ?auto_10122 ) ) ( not ( = ?auto_10094 ?auto_10098 ) ) ( not ( = ?auto_10094 ?auto_10122 ) ) ( not ( = ?auto_10096 ?auto_10098 ) ) ( not ( = ?auto_10096 ?auto_10122 ) ) ( not ( = ?auto_10098 ?auto_10111 ) ) ( not ( = ?auto_10098 ?auto_10118 ) ) ( not ( = ?auto_10098 ?auto_10106 ) ) ( not ( = ?auto_10098 ?auto_10112 ) ) ( not ( = ?auto_10098 ?auto_10120 ) ) ( not ( = ?auto_10098 ?auto_10108 ) ) ( not ( = ?auto_10123 ?auto_10117 ) ) ( not ( = ?auto_10123 ?auto_10105 ) ) ( not ( = ?auto_10123 ?auto_10116 ) ) ( not ( = ?auto_10123 ?auto_10114 ) ) ( not ( = ?auto_10123 ?auto_10113 ) ) ( not ( = ?auto_10121 ?auto_10109 ) ) ( not ( = ?auto_10121 ?auto_10107 ) ) ( not ( = ?auto_10121 ?auto_10110 ) ) ( not ( = ?auto_10121 ?auto_10115 ) ) ( not ( = ?auto_10121 ?auto_10119 ) ) ( not ( = ?auto_10122 ?auto_10111 ) ) ( not ( = ?auto_10122 ?auto_10118 ) ) ( not ( = ?auto_10122 ?auto_10106 ) ) ( not ( = ?auto_10122 ?auto_10112 ) ) ( not ( = ?auto_10122 ?auto_10120 ) ) ( not ( = ?auto_10122 ?auto_10108 ) ) ( not ( = ?auto_10090 ?auto_10097 ) ) ( not ( = ?auto_10090 ?auto_10101 ) ) ( not ( = ?auto_10091 ?auto_10097 ) ) ( not ( = ?auto_10091 ?auto_10101 ) ) ( not ( = ?auto_10092 ?auto_10097 ) ) ( not ( = ?auto_10092 ?auto_10101 ) ) ( not ( = ?auto_10093 ?auto_10097 ) ) ( not ( = ?auto_10093 ?auto_10101 ) ) ( not ( = ?auto_10094 ?auto_10097 ) ) ( not ( = ?auto_10094 ?auto_10101 ) ) ( not ( = ?auto_10096 ?auto_10097 ) ) ( not ( = ?auto_10096 ?auto_10101 ) ) ( not ( = ?auto_10095 ?auto_10097 ) ) ( not ( = ?auto_10095 ?auto_10101 ) ) ( not ( = ?auto_10097 ?auto_10122 ) ) ( not ( = ?auto_10097 ?auto_10111 ) ) ( not ( = ?auto_10097 ?auto_10118 ) ) ( not ( = ?auto_10097 ?auto_10106 ) ) ( not ( = ?auto_10097 ?auto_10112 ) ) ( not ( = ?auto_10097 ?auto_10120 ) ) ( not ( = ?auto_10097 ?auto_10108 ) ) ( not ( = ?auto_10104 ?auto_10123 ) ) ( not ( = ?auto_10104 ?auto_10117 ) ) ( not ( = ?auto_10104 ?auto_10105 ) ) ( not ( = ?auto_10104 ?auto_10116 ) ) ( not ( = ?auto_10104 ?auto_10114 ) ) ( not ( = ?auto_10104 ?auto_10113 ) ) ( not ( = ?auto_10103 ?auto_10121 ) ) ( not ( = ?auto_10103 ?auto_10109 ) ) ( not ( = ?auto_10103 ?auto_10107 ) ) ( not ( = ?auto_10103 ?auto_10110 ) ) ( not ( = ?auto_10103 ?auto_10115 ) ) ( not ( = ?auto_10103 ?auto_10119 ) ) ( not ( = ?auto_10101 ?auto_10122 ) ) ( not ( = ?auto_10101 ?auto_10111 ) ) ( not ( = ?auto_10101 ?auto_10118 ) ) ( not ( = ?auto_10101 ?auto_10106 ) ) ( not ( = ?auto_10101 ?auto_10112 ) ) ( not ( = ?auto_10101 ?auto_10120 ) ) ( not ( = ?auto_10101 ?auto_10108 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10090 ?auto_10091 ?auto_10092 ?auto_10093 ?auto_10094 ?auto_10096 ?auto_10095 ?auto_10098 )
      ( MAKE-1CRATE ?auto_10098 ?auto_10097 )
      ( MAKE-8CRATE-VERIFY ?auto_10090 ?auto_10091 ?auto_10092 ?auto_10093 ?auto_10094 ?auto_10096 ?auto_10095 ?auto_10098 ?auto_10097 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10126 - SURFACE
      ?auto_10127 - SURFACE
    )
    :vars
    (
      ?auto_10128 - HOIST
      ?auto_10129 - PLACE
      ?auto_10131 - PLACE
      ?auto_10132 - HOIST
      ?auto_10133 - SURFACE
      ?auto_10130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10128 ?auto_10129 ) ( SURFACE-AT ?auto_10126 ?auto_10129 ) ( CLEAR ?auto_10126 ) ( IS-CRATE ?auto_10127 ) ( AVAILABLE ?auto_10128 ) ( not ( = ?auto_10131 ?auto_10129 ) ) ( HOIST-AT ?auto_10132 ?auto_10131 ) ( AVAILABLE ?auto_10132 ) ( SURFACE-AT ?auto_10127 ?auto_10131 ) ( ON ?auto_10127 ?auto_10133 ) ( CLEAR ?auto_10127 ) ( TRUCK-AT ?auto_10130 ?auto_10129 ) ( not ( = ?auto_10126 ?auto_10127 ) ) ( not ( = ?auto_10126 ?auto_10133 ) ) ( not ( = ?auto_10127 ?auto_10133 ) ) ( not ( = ?auto_10128 ?auto_10132 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10130 ?auto_10129 ?auto_10131 )
      ( !LIFT ?auto_10132 ?auto_10127 ?auto_10133 ?auto_10131 )
      ( !LOAD ?auto_10132 ?auto_10127 ?auto_10130 ?auto_10131 )
      ( !DRIVE ?auto_10130 ?auto_10131 ?auto_10129 )
      ( !UNLOAD ?auto_10128 ?auto_10127 ?auto_10130 ?auto_10129 )
      ( !DROP ?auto_10128 ?auto_10127 ?auto_10126 ?auto_10129 )
      ( MAKE-1CRATE-VERIFY ?auto_10126 ?auto_10127 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10144 - SURFACE
      ?auto_10145 - SURFACE
      ?auto_10146 - SURFACE
      ?auto_10147 - SURFACE
      ?auto_10148 - SURFACE
      ?auto_10151 - SURFACE
      ?auto_10149 - SURFACE
      ?auto_10153 - SURFACE
      ?auto_10152 - SURFACE
      ?auto_10150 - SURFACE
    )
    :vars
    (
      ?auto_10155 - HOIST
      ?auto_10158 - PLACE
      ?auto_10159 - PLACE
      ?auto_10157 - HOIST
      ?auto_10154 - SURFACE
      ?auto_10180 - PLACE
      ?auto_10181 - HOIST
      ?auto_10164 - SURFACE
      ?auto_10168 - PLACE
      ?auto_10167 - HOIST
      ?auto_10165 - SURFACE
      ?auto_10174 - PLACE
      ?auto_10179 - HOIST
      ?auto_10177 - SURFACE
      ?auto_10166 - PLACE
      ?auto_10162 - HOIST
      ?auto_10175 - SURFACE
      ?auto_10173 - PLACE
      ?auto_10178 - HOIST
      ?auto_10160 - SURFACE
      ?auto_10172 - PLACE
      ?auto_10171 - HOIST
      ?auto_10176 - SURFACE
      ?auto_10169 - SURFACE
      ?auto_10170 - PLACE
      ?auto_10161 - HOIST
      ?auto_10163 - SURFACE
      ?auto_10156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10155 ?auto_10158 ) ( IS-CRATE ?auto_10150 ) ( not ( = ?auto_10159 ?auto_10158 ) ) ( HOIST-AT ?auto_10157 ?auto_10159 ) ( AVAILABLE ?auto_10157 ) ( SURFACE-AT ?auto_10150 ?auto_10159 ) ( ON ?auto_10150 ?auto_10154 ) ( CLEAR ?auto_10150 ) ( not ( = ?auto_10152 ?auto_10150 ) ) ( not ( = ?auto_10152 ?auto_10154 ) ) ( not ( = ?auto_10150 ?auto_10154 ) ) ( not ( = ?auto_10155 ?auto_10157 ) ) ( IS-CRATE ?auto_10152 ) ( not ( = ?auto_10180 ?auto_10158 ) ) ( HOIST-AT ?auto_10181 ?auto_10180 ) ( AVAILABLE ?auto_10181 ) ( SURFACE-AT ?auto_10152 ?auto_10180 ) ( ON ?auto_10152 ?auto_10164 ) ( CLEAR ?auto_10152 ) ( not ( = ?auto_10153 ?auto_10152 ) ) ( not ( = ?auto_10153 ?auto_10164 ) ) ( not ( = ?auto_10152 ?auto_10164 ) ) ( not ( = ?auto_10155 ?auto_10181 ) ) ( IS-CRATE ?auto_10153 ) ( not ( = ?auto_10168 ?auto_10158 ) ) ( HOIST-AT ?auto_10167 ?auto_10168 ) ( AVAILABLE ?auto_10167 ) ( SURFACE-AT ?auto_10153 ?auto_10168 ) ( ON ?auto_10153 ?auto_10165 ) ( CLEAR ?auto_10153 ) ( not ( = ?auto_10149 ?auto_10153 ) ) ( not ( = ?auto_10149 ?auto_10165 ) ) ( not ( = ?auto_10153 ?auto_10165 ) ) ( not ( = ?auto_10155 ?auto_10167 ) ) ( IS-CRATE ?auto_10149 ) ( not ( = ?auto_10174 ?auto_10158 ) ) ( HOIST-AT ?auto_10179 ?auto_10174 ) ( AVAILABLE ?auto_10179 ) ( SURFACE-AT ?auto_10149 ?auto_10174 ) ( ON ?auto_10149 ?auto_10177 ) ( CLEAR ?auto_10149 ) ( not ( = ?auto_10151 ?auto_10149 ) ) ( not ( = ?auto_10151 ?auto_10177 ) ) ( not ( = ?auto_10149 ?auto_10177 ) ) ( not ( = ?auto_10155 ?auto_10179 ) ) ( IS-CRATE ?auto_10151 ) ( not ( = ?auto_10166 ?auto_10158 ) ) ( HOIST-AT ?auto_10162 ?auto_10166 ) ( SURFACE-AT ?auto_10151 ?auto_10166 ) ( ON ?auto_10151 ?auto_10175 ) ( CLEAR ?auto_10151 ) ( not ( = ?auto_10148 ?auto_10151 ) ) ( not ( = ?auto_10148 ?auto_10175 ) ) ( not ( = ?auto_10151 ?auto_10175 ) ) ( not ( = ?auto_10155 ?auto_10162 ) ) ( IS-CRATE ?auto_10148 ) ( not ( = ?auto_10173 ?auto_10158 ) ) ( HOIST-AT ?auto_10178 ?auto_10173 ) ( AVAILABLE ?auto_10178 ) ( SURFACE-AT ?auto_10148 ?auto_10173 ) ( ON ?auto_10148 ?auto_10160 ) ( CLEAR ?auto_10148 ) ( not ( = ?auto_10147 ?auto_10148 ) ) ( not ( = ?auto_10147 ?auto_10160 ) ) ( not ( = ?auto_10148 ?auto_10160 ) ) ( not ( = ?auto_10155 ?auto_10178 ) ) ( IS-CRATE ?auto_10147 ) ( not ( = ?auto_10172 ?auto_10158 ) ) ( HOIST-AT ?auto_10171 ?auto_10172 ) ( AVAILABLE ?auto_10171 ) ( SURFACE-AT ?auto_10147 ?auto_10172 ) ( ON ?auto_10147 ?auto_10176 ) ( CLEAR ?auto_10147 ) ( not ( = ?auto_10146 ?auto_10147 ) ) ( not ( = ?auto_10146 ?auto_10176 ) ) ( not ( = ?auto_10147 ?auto_10176 ) ) ( not ( = ?auto_10155 ?auto_10171 ) ) ( IS-CRATE ?auto_10146 ) ( AVAILABLE ?auto_10162 ) ( SURFACE-AT ?auto_10146 ?auto_10166 ) ( ON ?auto_10146 ?auto_10169 ) ( CLEAR ?auto_10146 ) ( not ( = ?auto_10145 ?auto_10146 ) ) ( not ( = ?auto_10145 ?auto_10169 ) ) ( not ( = ?auto_10146 ?auto_10169 ) ) ( SURFACE-AT ?auto_10144 ?auto_10158 ) ( CLEAR ?auto_10144 ) ( IS-CRATE ?auto_10145 ) ( AVAILABLE ?auto_10155 ) ( not ( = ?auto_10170 ?auto_10158 ) ) ( HOIST-AT ?auto_10161 ?auto_10170 ) ( AVAILABLE ?auto_10161 ) ( SURFACE-AT ?auto_10145 ?auto_10170 ) ( ON ?auto_10145 ?auto_10163 ) ( CLEAR ?auto_10145 ) ( TRUCK-AT ?auto_10156 ?auto_10158 ) ( not ( = ?auto_10144 ?auto_10145 ) ) ( not ( = ?auto_10144 ?auto_10163 ) ) ( not ( = ?auto_10145 ?auto_10163 ) ) ( not ( = ?auto_10155 ?auto_10161 ) ) ( not ( = ?auto_10144 ?auto_10146 ) ) ( not ( = ?auto_10144 ?auto_10169 ) ) ( not ( = ?auto_10146 ?auto_10163 ) ) ( not ( = ?auto_10166 ?auto_10170 ) ) ( not ( = ?auto_10162 ?auto_10161 ) ) ( not ( = ?auto_10169 ?auto_10163 ) ) ( not ( = ?auto_10144 ?auto_10147 ) ) ( not ( = ?auto_10144 ?auto_10176 ) ) ( not ( = ?auto_10145 ?auto_10147 ) ) ( not ( = ?auto_10145 ?auto_10176 ) ) ( not ( = ?auto_10147 ?auto_10169 ) ) ( not ( = ?auto_10147 ?auto_10163 ) ) ( not ( = ?auto_10172 ?auto_10166 ) ) ( not ( = ?auto_10172 ?auto_10170 ) ) ( not ( = ?auto_10171 ?auto_10162 ) ) ( not ( = ?auto_10171 ?auto_10161 ) ) ( not ( = ?auto_10176 ?auto_10169 ) ) ( not ( = ?auto_10176 ?auto_10163 ) ) ( not ( = ?auto_10144 ?auto_10148 ) ) ( not ( = ?auto_10144 ?auto_10160 ) ) ( not ( = ?auto_10145 ?auto_10148 ) ) ( not ( = ?auto_10145 ?auto_10160 ) ) ( not ( = ?auto_10146 ?auto_10148 ) ) ( not ( = ?auto_10146 ?auto_10160 ) ) ( not ( = ?auto_10148 ?auto_10176 ) ) ( not ( = ?auto_10148 ?auto_10169 ) ) ( not ( = ?auto_10148 ?auto_10163 ) ) ( not ( = ?auto_10173 ?auto_10172 ) ) ( not ( = ?auto_10173 ?auto_10166 ) ) ( not ( = ?auto_10173 ?auto_10170 ) ) ( not ( = ?auto_10178 ?auto_10171 ) ) ( not ( = ?auto_10178 ?auto_10162 ) ) ( not ( = ?auto_10178 ?auto_10161 ) ) ( not ( = ?auto_10160 ?auto_10176 ) ) ( not ( = ?auto_10160 ?auto_10169 ) ) ( not ( = ?auto_10160 ?auto_10163 ) ) ( not ( = ?auto_10144 ?auto_10151 ) ) ( not ( = ?auto_10144 ?auto_10175 ) ) ( not ( = ?auto_10145 ?auto_10151 ) ) ( not ( = ?auto_10145 ?auto_10175 ) ) ( not ( = ?auto_10146 ?auto_10151 ) ) ( not ( = ?auto_10146 ?auto_10175 ) ) ( not ( = ?auto_10147 ?auto_10151 ) ) ( not ( = ?auto_10147 ?auto_10175 ) ) ( not ( = ?auto_10151 ?auto_10160 ) ) ( not ( = ?auto_10151 ?auto_10176 ) ) ( not ( = ?auto_10151 ?auto_10169 ) ) ( not ( = ?auto_10151 ?auto_10163 ) ) ( not ( = ?auto_10175 ?auto_10160 ) ) ( not ( = ?auto_10175 ?auto_10176 ) ) ( not ( = ?auto_10175 ?auto_10169 ) ) ( not ( = ?auto_10175 ?auto_10163 ) ) ( not ( = ?auto_10144 ?auto_10149 ) ) ( not ( = ?auto_10144 ?auto_10177 ) ) ( not ( = ?auto_10145 ?auto_10149 ) ) ( not ( = ?auto_10145 ?auto_10177 ) ) ( not ( = ?auto_10146 ?auto_10149 ) ) ( not ( = ?auto_10146 ?auto_10177 ) ) ( not ( = ?auto_10147 ?auto_10149 ) ) ( not ( = ?auto_10147 ?auto_10177 ) ) ( not ( = ?auto_10148 ?auto_10149 ) ) ( not ( = ?auto_10148 ?auto_10177 ) ) ( not ( = ?auto_10149 ?auto_10175 ) ) ( not ( = ?auto_10149 ?auto_10160 ) ) ( not ( = ?auto_10149 ?auto_10176 ) ) ( not ( = ?auto_10149 ?auto_10169 ) ) ( not ( = ?auto_10149 ?auto_10163 ) ) ( not ( = ?auto_10174 ?auto_10166 ) ) ( not ( = ?auto_10174 ?auto_10173 ) ) ( not ( = ?auto_10174 ?auto_10172 ) ) ( not ( = ?auto_10174 ?auto_10170 ) ) ( not ( = ?auto_10179 ?auto_10162 ) ) ( not ( = ?auto_10179 ?auto_10178 ) ) ( not ( = ?auto_10179 ?auto_10171 ) ) ( not ( = ?auto_10179 ?auto_10161 ) ) ( not ( = ?auto_10177 ?auto_10175 ) ) ( not ( = ?auto_10177 ?auto_10160 ) ) ( not ( = ?auto_10177 ?auto_10176 ) ) ( not ( = ?auto_10177 ?auto_10169 ) ) ( not ( = ?auto_10177 ?auto_10163 ) ) ( not ( = ?auto_10144 ?auto_10153 ) ) ( not ( = ?auto_10144 ?auto_10165 ) ) ( not ( = ?auto_10145 ?auto_10153 ) ) ( not ( = ?auto_10145 ?auto_10165 ) ) ( not ( = ?auto_10146 ?auto_10153 ) ) ( not ( = ?auto_10146 ?auto_10165 ) ) ( not ( = ?auto_10147 ?auto_10153 ) ) ( not ( = ?auto_10147 ?auto_10165 ) ) ( not ( = ?auto_10148 ?auto_10153 ) ) ( not ( = ?auto_10148 ?auto_10165 ) ) ( not ( = ?auto_10151 ?auto_10153 ) ) ( not ( = ?auto_10151 ?auto_10165 ) ) ( not ( = ?auto_10153 ?auto_10177 ) ) ( not ( = ?auto_10153 ?auto_10175 ) ) ( not ( = ?auto_10153 ?auto_10160 ) ) ( not ( = ?auto_10153 ?auto_10176 ) ) ( not ( = ?auto_10153 ?auto_10169 ) ) ( not ( = ?auto_10153 ?auto_10163 ) ) ( not ( = ?auto_10168 ?auto_10174 ) ) ( not ( = ?auto_10168 ?auto_10166 ) ) ( not ( = ?auto_10168 ?auto_10173 ) ) ( not ( = ?auto_10168 ?auto_10172 ) ) ( not ( = ?auto_10168 ?auto_10170 ) ) ( not ( = ?auto_10167 ?auto_10179 ) ) ( not ( = ?auto_10167 ?auto_10162 ) ) ( not ( = ?auto_10167 ?auto_10178 ) ) ( not ( = ?auto_10167 ?auto_10171 ) ) ( not ( = ?auto_10167 ?auto_10161 ) ) ( not ( = ?auto_10165 ?auto_10177 ) ) ( not ( = ?auto_10165 ?auto_10175 ) ) ( not ( = ?auto_10165 ?auto_10160 ) ) ( not ( = ?auto_10165 ?auto_10176 ) ) ( not ( = ?auto_10165 ?auto_10169 ) ) ( not ( = ?auto_10165 ?auto_10163 ) ) ( not ( = ?auto_10144 ?auto_10152 ) ) ( not ( = ?auto_10144 ?auto_10164 ) ) ( not ( = ?auto_10145 ?auto_10152 ) ) ( not ( = ?auto_10145 ?auto_10164 ) ) ( not ( = ?auto_10146 ?auto_10152 ) ) ( not ( = ?auto_10146 ?auto_10164 ) ) ( not ( = ?auto_10147 ?auto_10152 ) ) ( not ( = ?auto_10147 ?auto_10164 ) ) ( not ( = ?auto_10148 ?auto_10152 ) ) ( not ( = ?auto_10148 ?auto_10164 ) ) ( not ( = ?auto_10151 ?auto_10152 ) ) ( not ( = ?auto_10151 ?auto_10164 ) ) ( not ( = ?auto_10149 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10164 ) ) ( not ( = ?auto_10152 ?auto_10165 ) ) ( not ( = ?auto_10152 ?auto_10177 ) ) ( not ( = ?auto_10152 ?auto_10175 ) ) ( not ( = ?auto_10152 ?auto_10160 ) ) ( not ( = ?auto_10152 ?auto_10176 ) ) ( not ( = ?auto_10152 ?auto_10169 ) ) ( not ( = ?auto_10152 ?auto_10163 ) ) ( not ( = ?auto_10180 ?auto_10168 ) ) ( not ( = ?auto_10180 ?auto_10174 ) ) ( not ( = ?auto_10180 ?auto_10166 ) ) ( not ( = ?auto_10180 ?auto_10173 ) ) ( not ( = ?auto_10180 ?auto_10172 ) ) ( not ( = ?auto_10180 ?auto_10170 ) ) ( not ( = ?auto_10181 ?auto_10167 ) ) ( not ( = ?auto_10181 ?auto_10179 ) ) ( not ( = ?auto_10181 ?auto_10162 ) ) ( not ( = ?auto_10181 ?auto_10178 ) ) ( not ( = ?auto_10181 ?auto_10171 ) ) ( not ( = ?auto_10181 ?auto_10161 ) ) ( not ( = ?auto_10164 ?auto_10165 ) ) ( not ( = ?auto_10164 ?auto_10177 ) ) ( not ( = ?auto_10164 ?auto_10175 ) ) ( not ( = ?auto_10164 ?auto_10160 ) ) ( not ( = ?auto_10164 ?auto_10176 ) ) ( not ( = ?auto_10164 ?auto_10169 ) ) ( not ( = ?auto_10164 ?auto_10163 ) ) ( not ( = ?auto_10144 ?auto_10150 ) ) ( not ( = ?auto_10144 ?auto_10154 ) ) ( not ( = ?auto_10145 ?auto_10150 ) ) ( not ( = ?auto_10145 ?auto_10154 ) ) ( not ( = ?auto_10146 ?auto_10150 ) ) ( not ( = ?auto_10146 ?auto_10154 ) ) ( not ( = ?auto_10147 ?auto_10150 ) ) ( not ( = ?auto_10147 ?auto_10154 ) ) ( not ( = ?auto_10148 ?auto_10150 ) ) ( not ( = ?auto_10148 ?auto_10154 ) ) ( not ( = ?auto_10151 ?auto_10150 ) ) ( not ( = ?auto_10151 ?auto_10154 ) ) ( not ( = ?auto_10149 ?auto_10150 ) ) ( not ( = ?auto_10149 ?auto_10154 ) ) ( not ( = ?auto_10153 ?auto_10150 ) ) ( not ( = ?auto_10153 ?auto_10154 ) ) ( not ( = ?auto_10150 ?auto_10164 ) ) ( not ( = ?auto_10150 ?auto_10165 ) ) ( not ( = ?auto_10150 ?auto_10177 ) ) ( not ( = ?auto_10150 ?auto_10175 ) ) ( not ( = ?auto_10150 ?auto_10160 ) ) ( not ( = ?auto_10150 ?auto_10176 ) ) ( not ( = ?auto_10150 ?auto_10169 ) ) ( not ( = ?auto_10150 ?auto_10163 ) ) ( not ( = ?auto_10159 ?auto_10180 ) ) ( not ( = ?auto_10159 ?auto_10168 ) ) ( not ( = ?auto_10159 ?auto_10174 ) ) ( not ( = ?auto_10159 ?auto_10166 ) ) ( not ( = ?auto_10159 ?auto_10173 ) ) ( not ( = ?auto_10159 ?auto_10172 ) ) ( not ( = ?auto_10159 ?auto_10170 ) ) ( not ( = ?auto_10157 ?auto_10181 ) ) ( not ( = ?auto_10157 ?auto_10167 ) ) ( not ( = ?auto_10157 ?auto_10179 ) ) ( not ( = ?auto_10157 ?auto_10162 ) ) ( not ( = ?auto_10157 ?auto_10178 ) ) ( not ( = ?auto_10157 ?auto_10171 ) ) ( not ( = ?auto_10157 ?auto_10161 ) ) ( not ( = ?auto_10154 ?auto_10164 ) ) ( not ( = ?auto_10154 ?auto_10165 ) ) ( not ( = ?auto_10154 ?auto_10177 ) ) ( not ( = ?auto_10154 ?auto_10175 ) ) ( not ( = ?auto_10154 ?auto_10160 ) ) ( not ( = ?auto_10154 ?auto_10176 ) ) ( not ( = ?auto_10154 ?auto_10169 ) ) ( not ( = ?auto_10154 ?auto_10163 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10144 ?auto_10145 ?auto_10146 ?auto_10147 ?auto_10148 ?auto_10151 ?auto_10149 ?auto_10153 ?auto_10152 )
      ( MAKE-1CRATE ?auto_10152 ?auto_10150 )
      ( MAKE-9CRATE-VERIFY ?auto_10144 ?auto_10145 ?auto_10146 ?auto_10147 ?auto_10148 ?auto_10151 ?auto_10149 ?auto_10153 ?auto_10152 ?auto_10150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10184 - SURFACE
      ?auto_10185 - SURFACE
    )
    :vars
    (
      ?auto_10186 - HOIST
      ?auto_10187 - PLACE
      ?auto_10189 - PLACE
      ?auto_10190 - HOIST
      ?auto_10191 - SURFACE
      ?auto_10188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10186 ?auto_10187 ) ( SURFACE-AT ?auto_10184 ?auto_10187 ) ( CLEAR ?auto_10184 ) ( IS-CRATE ?auto_10185 ) ( AVAILABLE ?auto_10186 ) ( not ( = ?auto_10189 ?auto_10187 ) ) ( HOIST-AT ?auto_10190 ?auto_10189 ) ( AVAILABLE ?auto_10190 ) ( SURFACE-AT ?auto_10185 ?auto_10189 ) ( ON ?auto_10185 ?auto_10191 ) ( CLEAR ?auto_10185 ) ( TRUCK-AT ?auto_10188 ?auto_10187 ) ( not ( = ?auto_10184 ?auto_10185 ) ) ( not ( = ?auto_10184 ?auto_10191 ) ) ( not ( = ?auto_10185 ?auto_10191 ) ) ( not ( = ?auto_10186 ?auto_10190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10188 ?auto_10187 ?auto_10189 )
      ( !LIFT ?auto_10190 ?auto_10185 ?auto_10191 ?auto_10189 )
      ( !LOAD ?auto_10190 ?auto_10185 ?auto_10188 ?auto_10189 )
      ( !DRIVE ?auto_10188 ?auto_10189 ?auto_10187 )
      ( !UNLOAD ?auto_10186 ?auto_10185 ?auto_10188 ?auto_10187 )
      ( !DROP ?auto_10186 ?auto_10185 ?auto_10184 ?auto_10187 )
      ( MAKE-1CRATE-VERIFY ?auto_10184 ?auto_10185 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10203 - SURFACE
      ?auto_10204 - SURFACE
      ?auto_10205 - SURFACE
      ?auto_10206 - SURFACE
      ?auto_10207 - SURFACE
      ?auto_10210 - SURFACE
      ?auto_10208 - SURFACE
      ?auto_10212 - SURFACE
      ?auto_10211 - SURFACE
      ?auto_10209 - SURFACE
      ?auto_10213 - SURFACE
    )
    :vars
    (
      ?auto_10219 - HOIST
      ?auto_10218 - PLACE
      ?auto_10216 - PLACE
      ?auto_10214 - HOIST
      ?auto_10217 - SURFACE
      ?auto_10229 - PLACE
      ?auto_10222 - HOIST
      ?auto_10226 - SURFACE
      ?auto_10230 - PLACE
      ?auto_10227 - HOIST
      ?auto_10221 - SURFACE
      ?auto_10228 - PLACE
      ?auto_10234 - HOIST
      ?auto_10220 - SURFACE
      ?auto_10235 - PLACE
      ?auto_10231 - HOIST
      ?auto_10241 - SURFACE
      ?auto_10238 - PLACE
      ?auto_10239 - HOIST
      ?auto_10237 - SURFACE
      ?auto_10236 - PLACE
      ?auto_10225 - HOIST
      ?auto_10223 - SURFACE
      ?auto_10243 - PLACE
      ?auto_10244 - HOIST
      ?auto_10240 - SURFACE
      ?auto_10242 - SURFACE
      ?auto_10232 - PLACE
      ?auto_10224 - HOIST
      ?auto_10233 - SURFACE
      ?auto_10215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10219 ?auto_10218 ) ( IS-CRATE ?auto_10213 ) ( not ( = ?auto_10216 ?auto_10218 ) ) ( HOIST-AT ?auto_10214 ?auto_10216 ) ( AVAILABLE ?auto_10214 ) ( SURFACE-AT ?auto_10213 ?auto_10216 ) ( ON ?auto_10213 ?auto_10217 ) ( CLEAR ?auto_10213 ) ( not ( = ?auto_10209 ?auto_10213 ) ) ( not ( = ?auto_10209 ?auto_10217 ) ) ( not ( = ?auto_10213 ?auto_10217 ) ) ( not ( = ?auto_10219 ?auto_10214 ) ) ( IS-CRATE ?auto_10209 ) ( not ( = ?auto_10229 ?auto_10218 ) ) ( HOIST-AT ?auto_10222 ?auto_10229 ) ( AVAILABLE ?auto_10222 ) ( SURFACE-AT ?auto_10209 ?auto_10229 ) ( ON ?auto_10209 ?auto_10226 ) ( CLEAR ?auto_10209 ) ( not ( = ?auto_10211 ?auto_10209 ) ) ( not ( = ?auto_10211 ?auto_10226 ) ) ( not ( = ?auto_10209 ?auto_10226 ) ) ( not ( = ?auto_10219 ?auto_10222 ) ) ( IS-CRATE ?auto_10211 ) ( not ( = ?auto_10230 ?auto_10218 ) ) ( HOIST-AT ?auto_10227 ?auto_10230 ) ( AVAILABLE ?auto_10227 ) ( SURFACE-AT ?auto_10211 ?auto_10230 ) ( ON ?auto_10211 ?auto_10221 ) ( CLEAR ?auto_10211 ) ( not ( = ?auto_10212 ?auto_10211 ) ) ( not ( = ?auto_10212 ?auto_10221 ) ) ( not ( = ?auto_10211 ?auto_10221 ) ) ( not ( = ?auto_10219 ?auto_10227 ) ) ( IS-CRATE ?auto_10212 ) ( not ( = ?auto_10228 ?auto_10218 ) ) ( HOIST-AT ?auto_10234 ?auto_10228 ) ( AVAILABLE ?auto_10234 ) ( SURFACE-AT ?auto_10212 ?auto_10228 ) ( ON ?auto_10212 ?auto_10220 ) ( CLEAR ?auto_10212 ) ( not ( = ?auto_10208 ?auto_10212 ) ) ( not ( = ?auto_10208 ?auto_10220 ) ) ( not ( = ?auto_10212 ?auto_10220 ) ) ( not ( = ?auto_10219 ?auto_10234 ) ) ( IS-CRATE ?auto_10208 ) ( not ( = ?auto_10235 ?auto_10218 ) ) ( HOIST-AT ?auto_10231 ?auto_10235 ) ( AVAILABLE ?auto_10231 ) ( SURFACE-AT ?auto_10208 ?auto_10235 ) ( ON ?auto_10208 ?auto_10241 ) ( CLEAR ?auto_10208 ) ( not ( = ?auto_10210 ?auto_10208 ) ) ( not ( = ?auto_10210 ?auto_10241 ) ) ( not ( = ?auto_10208 ?auto_10241 ) ) ( not ( = ?auto_10219 ?auto_10231 ) ) ( IS-CRATE ?auto_10210 ) ( not ( = ?auto_10238 ?auto_10218 ) ) ( HOIST-AT ?auto_10239 ?auto_10238 ) ( SURFACE-AT ?auto_10210 ?auto_10238 ) ( ON ?auto_10210 ?auto_10237 ) ( CLEAR ?auto_10210 ) ( not ( = ?auto_10207 ?auto_10210 ) ) ( not ( = ?auto_10207 ?auto_10237 ) ) ( not ( = ?auto_10210 ?auto_10237 ) ) ( not ( = ?auto_10219 ?auto_10239 ) ) ( IS-CRATE ?auto_10207 ) ( not ( = ?auto_10236 ?auto_10218 ) ) ( HOIST-AT ?auto_10225 ?auto_10236 ) ( AVAILABLE ?auto_10225 ) ( SURFACE-AT ?auto_10207 ?auto_10236 ) ( ON ?auto_10207 ?auto_10223 ) ( CLEAR ?auto_10207 ) ( not ( = ?auto_10206 ?auto_10207 ) ) ( not ( = ?auto_10206 ?auto_10223 ) ) ( not ( = ?auto_10207 ?auto_10223 ) ) ( not ( = ?auto_10219 ?auto_10225 ) ) ( IS-CRATE ?auto_10206 ) ( not ( = ?auto_10243 ?auto_10218 ) ) ( HOIST-AT ?auto_10244 ?auto_10243 ) ( AVAILABLE ?auto_10244 ) ( SURFACE-AT ?auto_10206 ?auto_10243 ) ( ON ?auto_10206 ?auto_10240 ) ( CLEAR ?auto_10206 ) ( not ( = ?auto_10205 ?auto_10206 ) ) ( not ( = ?auto_10205 ?auto_10240 ) ) ( not ( = ?auto_10206 ?auto_10240 ) ) ( not ( = ?auto_10219 ?auto_10244 ) ) ( IS-CRATE ?auto_10205 ) ( AVAILABLE ?auto_10239 ) ( SURFACE-AT ?auto_10205 ?auto_10238 ) ( ON ?auto_10205 ?auto_10242 ) ( CLEAR ?auto_10205 ) ( not ( = ?auto_10204 ?auto_10205 ) ) ( not ( = ?auto_10204 ?auto_10242 ) ) ( not ( = ?auto_10205 ?auto_10242 ) ) ( SURFACE-AT ?auto_10203 ?auto_10218 ) ( CLEAR ?auto_10203 ) ( IS-CRATE ?auto_10204 ) ( AVAILABLE ?auto_10219 ) ( not ( = ?auto_10232 ?auto_10218 ) ) ( HOIST-AT ?auto_10224 ?auto_10232 ) ( AVAILABLE ?auto_10224 ) ( SURFACE-AT ?auto_10204 ?auto_10232 ) ( ON ?auto_10204 ?auto_10233 ) ( CLEAR ?auto_10204 ) ( TRUCK-AT ?auto_10215 ?auto_10218 ) ( not ( = ?auto_10203 ?auto_10204 ) ) ( not ( = ?auto_10203 ?auto_10233 ) ) ( not ( = ?auto_10204 ?auto_10233 ) ) ( not ( = ?auto_10219 ?auto_10224 ) ) ( not ( = ?auto_10203 ?auto_10205 ) ) ( not ( = ?auto_10203 ?auto_10242 ) ) ( not ( = ?auto_10205 ?auto_10233 ) ) ( not ( = ?auto_10238 ?auto_10232 ) ) ( not ( = ?auto_10239 ?auto_10224 ) ) ( not ( = ?auto_10242 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10206 ) ) ( not ( = ?auto_10203 ?auto_10240 ) ) ( not ( = ?auto_10204 ?auto_10206 ) ) ( not ( = ?auto_10204 ?auto_10240 ) ) ( not ( = ?auto_10206 ?auto_10242 ) ) ( not ( = ?auto_10206 ?auto_10233 ) ) ( not ( = ?auto_10243 ?auto_10238 ) ) ( not ( = ?auto_10243 ?auto_10232 ) ) ( not ( = ?auto_10244 ?auto_10239 ) ) ( not ( = ?auto_10244 ?auto_10224 ) ) ( not ( = ?auto_10240 ?auto_10242 ) ) ( not ( = ?auto_10240 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10207 ) ) ( not ( = ?auto_10203 ?auto_10223 ) ) ( not ( = ?auto_10204 ?auto_10207 ) ) ( not ( = ?auto_10204 ?auto_10223 ) ) ( not ( = ?auto_10205 ?auto_10207 ) ) ( not ( = ?auto_10205 ?auto_10223 ) ) ( not ( = ?auto_10207 ?auto_10240 ) ) ( not ( = ?auto_10207 ?auto_10242 ) ) ( not ( = ?auto_10207 ?auto_10233 ) ) ( not ( = ?auto_10236 ?auto_10243 ) ) ( not ( = ?auto_10236 ?auto_10238 ) ) ( not ( = ?auto_10236 ?auto_10232 ) ) ( not ( = ?auto_10225 ?auto_10244 ) ) ( not ( = ?auto_10225 ?auto_10239 ) ) ( not ( = ?auto_10225 ?auto_10224 ) ) ( not ( = ?auto_10223 ?auto_10240 ) ) ( not ( = ?auto_10223 ?auto_10242 ) ) ( not ( = ?auto_10223 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10210 ) ) ( not ( = ?auto_10203 ?auto_10237 ) ) ( not ( = ?auto_10204 ?auto_10210 ) ) ( not ( = ?auto_10204 ?auto_10237 ) ) ( not ( = ?auto_10205 ?auto_10210 ) ) ( not ( = ?auto_10205 ?auto_10237 ) ) ( not ( = ?auto_10206 ?auto_10210 ) ) ( not ( = ?auto_10206 ?auto_10237 ) ) ( not ( = ?auto_10210 ?auto_10223 ) ) ( not ( = ?auto_10210 ?auto_10240 ) ) ( not ( = ?auto_10210 ?auto_10242 ) ) ( not ( = ?auto_10210 ?auto_10233 ) ) ( not ( = ?auto_10237 ?auto_10223 ) ) ( not ( = ?auto_10237 ?auto_10240 ) ) ( not ( = ?auto_10237 ?auto_10242 ) ) ( not ( = ?auto_10237 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10208 ) ) ( not ( = ?auto_10203 ?auto_10241 ) ) ( not ( = ?auto_10204 ?auto_10208 ) ) ( not ( = ?auto_10204 ?auto_10241 ) ) ( not ( = ?auto_10205 ?auto_10208 ) ) ( not ( = ?auto_10205 ?auto_10241 ) ) ( not ( = ?auto_10206 ?auto_10208 ) ) ( not ( = ?auto_10206 ?auto_10241 ) ) ( not ( = ?auto_10207 ?auto_10208 ) ) ( not ( = ?auto_10207 ?auto_10241 ) ) ( not ( = ?auto_10208 ?auto_10237 ) ) ( not ( = ?auto_10208 ?auto_10223 ) ) ( not ( = ?auto_10208 ?auto_10240 ) ) ( not ( = ?auto_10208 ?auto_10242 ) ) ( not ( = ?auto_10208 ?auto_10233 ) ) ( not ( = ?auto_10235 ?auto_10238 ) ) ( not ( = ?auto_10235 ?auto_10236 ) ) ( not ( = ?auto_10235 ?auto_10243 ) ) ( not ( = ?auto_10235 ?auto_10232 ) ) ( not ( = ?auto_10231 ?auto_10239 ) ) ( not ( = ?auto_10231 ?auto_10225 ) ) ( not ( = ?auto_10231 ?auto_10244 ) ) ( not ( = ?auto_10231 ?auto_10224 ) ) ( not ( = ?auto_10241 ?auto_10237 ) ) ( not ( = ?auto_10241 ?auto_10223 ) ) ( not ( = ?auto_10241 ?auto_10240 ) ) ( not ( = ?auto_10241 ?auto_10242 ) ) ( not ( = ?auto_10241 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10212 ) ) ( not ( = ?auto_10203 ?auto_10220 ) ) ( not ( = ?auto_10204 ?auto_10212 ) ) ( not ( = ?auto_10204 ?auto_10220 ) ) ( not ( = ?auto_10205 ?auto_10212 ) ) ( not ( = ?auto_10205 ?auto_10220 ) ) ( not ( = ?auto_10206 ?auto_10212 ) ) ( not ( = ?auto_10206 ?auto_10220 ) ) ( not ( = ?auto_10207 ?auto_10212 ) ) ( not ( = ?auto_10207 ?auto_10220 ) ) ( not ( = ?auto_10210 ?auto_10212 ) ) ( not ( = ?auto_10210 ?auto_10220 ) ) ( not ( = ?auto_10212 ?auto_10241 ) ) ( not ( = ?auto_10212 ?auto_10237 ) ) ( not ( = ?auto_10212 ?auto_10223 ) ) ( not ( = ?auto_10212 ?auto_10240 ) ) ( not ( = ?auto_10212 ?auto_10242 ) ) ( not ( = ?auto_10212 ?auto_10233 ) ) ( not ( = ?auto_10228 ?auto_10235 ) ) ( not ( = ?auto_10228 ?auto_10238 ) ) ( not ( = ?auto_10228 ?auto_10236 ) ) ( not ( = ?auto_10228 ?auto_10243 ) ) ( not ( = ?auto_10228 ?auto_10232 ) ) ( not ( = ?auto_10234 ?auto_10231 ) ) ( not ( = ?auto_10234 ?auto_10239 ) ) ( not ( = ?auto_10234 ?auto_10225 ) ) ( not ( = ?auto_10234 ?auto_10244 ) ) ( not ( = ?auto_10234 ?auto_10224 ) ) ( not ( = ?auto_10220 ?auto_10241 ) ) ( not ( = ?auto_10220 ?auto_10237 ) ) ( not ( = ?auto_10220 ?auto_10223 ) ) ( not ( = ?auto_10220 ?auto_10240 ) ) ( not ( = ?auto_10220 ?auto_10242 ) ) ( not ( = ?auto_10220 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10211 ) ) ( not ( = ?auto_10203 ?auto_10221 ) ) ( not ( = ?auto_10204 ?auto_10211 ) ) ( not ( = ?auto_10204 ?auto_10221 ) ) ( not ( = ?auto_10205 ?auto_10211 ) ) ( not ( = ?auto_10205 ?auto_10221 ) ) ( not ( = ?auto_10206 ?auto_10211 ) ) ( not ( = ?auto_10206 ?auto_10221 ) ) ( not ( = ?auto_10207 ?auto_10211 ) ) ( not ( = ?auto_10207 ?auto_10221 ) ) ( not ( = ?auto_10210 ?auto_10211 ) ) ( not ( = ?auto_10210 ?auto_10221 ) ) ( not ( = ?auto_10208 ?auto_10211 ) ) ( not ( = ?auto_10208 ?auto_10221 ) ) ( not ( = ?auto_10211 ?auto_10220 ) ) ( not ( = ?auto_10211 ?auto_10241 ) ) ( not ( = ?auto_10211 ?auto_10237 ) ) ( not ( = ?auto_10211 ?auto_10223 ) ) ( not ( = ?auto_10211 ?auto_10240 ) ) ( not ( = ?auto_10211 ?auto_10242 ) ) ( not ( = ?auto_10211 ?auto_10233 ) ) ( not ( = ?auto_10230 ?auto_10228 ) ) ( not ( = ?auto_10230 ?auto_10235 ) ) ( not ( = ?auto_10230 ?auto_10238 ) ) ( not ( = ?auto_10230 ?auto_10236 ) ) ( not ( = ?auto_10230 ?auto_10243 ) ) ( not ( = ?auto_10230 ?auto_10232 ) ) ( not ( = ?auto_10227 ?auto_10234 ) ) ( not ( = ?auto_10227 ?auto_10231 ) ) ( not ( = ?auto_10227 ?auto_10239 ) ) ( not ( = ?auto_10227 ?auto_10225 ) ) ( not ( = ?auto_10227 ?auto_10244 ) ) ( not ( = ?auto_10227 ?auto_10224 ) ) ( not ( = ?auto_10221 ?auto_10220 ) ) ( not ( = ?auto_10221 ?auto_10241 ) ) ( not ( = ?auto_10221 ?auto_10237 ) ) ( not ( = ?auto_10221 ?auto_10223 ) ) ( not ( = ?auto_10221 ?auto_10240 ) ) ( not ( = ?auto_10221 ?auto_10242 ) ) ( not ( = ?auto_10221 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10209 ) ) ( not ( = ?auto_10203 ?auto_10226 ) ) ( not ( = ?auto_10204 ?auto_10209 ) ) ( not ( = ?auto_10204 ?auto_10226 ) ) ( not ( = ?auto_10205 ?auto_10209 ) ) ( not ( = ?auto_10205 ?auto_10226 ) ) ( not ( = ?auto_10206 ?auto_10209 ) ) ( not ( = ?auto_10206 ?auto_10226 ) ) ( not ( = ?auto_10207 ?auto_10209 ) ) ( not ( = ?auto_10207 ?auto_10226 ) ) ( not ( = ?auto_10210 ?auto_10209 ) ) ( not ( = ?auto_10210 ?auto_10226 ) ) ( not ( = ?auto_10208 ?auto_10209 ) ) ( not ( = ?auto_10208 ?auto_10226 ) ) ( not ( = ?auto_10212 ?auto_10209 ) ) ( not ( = ?auto_10212 ?auto_10226 ) ) ( not ( = ?auto_10209 ?auto_10221 ) ) ( not ( = ?auto_10209 ?auto_10220 ) ) ( not ( = ?auto_10209 ?auto_10241 ) ) ( not ( = ?auto_10209 ?auto_10237 ) ) ( not ( = ?auto_10209 ?auto_10223 ) ) ( not ( = ?auto_10209 ?auto_10240 ) ) ( not ( = ?auto_10209 ?auto_10242 ) ) ( not ( = ?auto_10209 ?auto_10233 ) ) ( not ( = ?auto_10229 ?auto_10230 ) ) ( not ( = ?auto_10229 ?auto_10228 ) ) ( not ( = ?auto_10229 ?auto_10235 ) ) ( not ( = ?auto_10229 ?auto_10238 ) ) ( not ( = ?auto_10229 ?auto_10236 ) ) ( not ( = ?auto_10229 ?auto_10243 ) ) ( not ( = ?auto_10229 ?auto_10232 ) ) ( not ( = ?auto_10222 ?auto_10227 ) ) ( not ( = ?auto_10222 ?auto_10234 ) ) ( not ( = ?auto_10222 ?auto_10231 ) ) ( not ( = ?auto_10222 ?auto_10239 ) ) ( not ( = ?auto_10222 ?auto_10225 ) ) ( not ( = ?auto_10222 ?auto_10244 ) ) ( not ( = ?auto_10222 ?auto_10224 ) ) ( not ( = ?auto_10226 ?auto_10221 ) ) ( not ( = ?auto_10226 ?auto_10220 ) ) ( not ( = ?auto_10226 ?auto_10241 ) ) ( not ( = ?auto_10226 ?auto_10237 ) ) ( not ( = ?auto_10226 ?auto_10223 ) ) ( not ( = ?auto_10226 ?auto_10240 ) ) ( not ( = ?auto_10226 ?auto_10242 ) ) ( not ( = ?auto_10226 ?auto_10233 ) ) ( not ( = ?auto_10203 ?auto_10213 ) ) ( not ( = ?auto_10203 ?auto_10217 ) ) ( not ( = ?auto_10204 ?auto_10213 ) ) ( not ( = ?auto_10204 ?auto_10217 ) ) ( not ( = ?auto_10205 ?auto_10213 ) ) ( not ( = ?auto_10205 ?auto_10217 ) ) ( not ( = ?auto_10206 ?auto_10213 ) ) ( not ( = ?auto_10206 ?auto_10217 ) ) ( not ( = ?auto_10207 ?auto_10213 ) ) ( not ( = ?auto_10207 ?auto_10217 ) ) ( not ( = ?auto_10210 ?auto_10213 ) ) ( not ( = ?auto_10210 ?auto_10217 ) ) ( not ( = ?auto_10208 ?auto_10213 ) ) ( not ( = ?auto_10208 ?auto_10217 ) ) ( not ( = ?auto_10212 ?auto_10213 ) ) ( not ( = ?auto_10212 ?auto_10217 ) ) ( not ( = ?auto_10211 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10217 ) ) ( not ( = ?auto_10213 ?auto_10226 ) ) ( not ( = ?auto_10213 ?auto_10221 ) ) ( not ( = ?auto_10213 ?auto_10220 ) ) ( not ( = ?auto_10213 ?auto_10241 ) ) ( not ( = ?auto_10213 ?auto_10237 ) ) ( not ( = ?auto_10213 ?auto_10223 ) ) ( not ( = ?auto_10213 ?auto_10240 ) ) ( not ( = ?auto_10213 ?auto_10242 ) ) ( not ( = ?auto_10213 ?auto_10233 ) ) ( not ( = ?auto_10216 ?auto_10229 ) ) ( not ( = ?auto_10216 ?auto_10230 ) ) ( not ( = ?auto_10216 ?auto_10228 ) ) ( not ( = ?auto_10216 ?auto_10235 ) ) ( not ( = ?auto_10216 ?auto_10238 ) ) ( not ( = ?auto_10216 ?auto_10236 ) ) ( not ( = ?auto_10216 ?auto_10243 ) ) ( not ( = ?auto_10216 ?auto_10232 ) ) ( not ( = ?auto_10214 ?auto_10222 ) ) ( not ( = ?auto_10214 ?auto_10227 ) ) ( not ( = ?auto_10214 ?auto_10234 ) ) ( not ( = ?auto_10214 ?auto_10231 ) ) ( not ( = ?auto_10214 ?auto_10239 ) ) ( not ( = ?auto_10214 ?auto_10225 ) ) ( not ( = ?auto_10214 ?auto_10244 ) ) ( not ( = ?auto_10214 ?auto_10224 ) ) ( not ( = ?auto_10217 ?auto_10226 ) ) ( not ( = ?auto_10217 ?auto_10221 ) ) ( not ( = ?auto_10217 ?auto_10220 ) ) ( not ( = ?auto_10217 ?auto_10241 ) ) ( not ( = ?auto_10217 ?auto_10237 ) ) ( not ( = ?auto_10217 ?auto_10223 ) ) ( not ( = ?auto_10217 ?auto_10240 ) ) ( not ( = ?auto_10217 ?auto_10242 ) ) ( not ( = ?auto_10217 ?auto_10233 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10203 ?auto_10204 ?auto_10205 ?auto_10206 ?auto_10207 ?auto_10210 ?auto_10208 ?auto_10212 ?auto_10211 ?auto_10209 )
      ( MAKE-1CRATE ?auto_10209 ?auto_10213 )
      ( MAKE-10CRATE-VERIFY ?auto_10203 ?auto_10204 ?auto_10205 ?auto_10206 ?auto_10207 ?auto_10210 ?auto_10208 ?auto_10212 ?auto_10211 ?auto_10209 ?auto_10213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10247 - SURFACE
      ?auto_10248 - SURFACE
    )
    :vars
    (
      ?auto_10249 - HOIST
      ?auto_10250 - PLACE
      ?auto_10252 - PLACE
      ?auto_10253 - HOIST
      ?auto_10254 - SURFACE
      ?auto_10251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10249 ?auto_10250 ) ( SURFACE-AT ?auto_10247 ?auto_10250 ) ( CLEAR ?auto_10247 ) ( IS-CRATE ?auto_10248 ) ( AVAILABLE ?auto_10249 ) ( not ( = ?auto_10252 ?auto_10250 ) ) ( HOIST-AT ?auto_10253 ?auto_10252 ) ( AVAILABLE ?auto_10253 ) ( SURFACE-AT ?auto_10248 ?auto_10252 ) ( ON ?auto_10248 ?auto_10254 ) ( CLEAR ?auto_10248 ) ( TRUCK-AT ?auto_10251 ?auto_10250 ) ( not ( = ?auto_10247 ?auto_10248 ) ) ( not ( = ?auto_10247 ?auto_10254 ) ) ( not ( = ?auto_10248 ?auto_10254 ) ) ( not ( = ?auto_10249 ?auto_10253 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10251 ?auto_10250 ?auto_10252 )
      ( !LIFT ?auto_10253 ?auto_10248 ?auto_10254 ?auto_10252 )
      ( !LOAD ?auto_10253 ?auto_10248 ?auto_10251 ?auto_10252 )
      ( !DRIVE ?auto_10251 ?auto_10252 ?auto_10250 )
      ( !UNLOAD ?auto_10249 ?auto_10248 ?auto_10251 ?auto_10250 )
      ( !DROP ?auto_10249 ?auto_10248 ?auto_10247 ?auto_10250 )
      ( MAKE-1CRATE-VERIFY ?auto_10247 ?auto_10248 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10267 - SURFACE
      ?auto_10268 - SURFACE
      ?auto_10269 - SURFACE
      ?auto_10270 - SURFACE
      ?auto_10271 - SURFACE
      ?auto_10274 - SURFACE
      ?auto_10272 - SURFACE
      ?auto_10276 - SURFACE
      ?auto_10275 - SURFACE
      ?auto_10273 - SURFACE
      ?auto_10278 - SURFACE
      ?auto_10277 - SURFACE
    )
    :vars
    (
      ?auto_10280 - HOIST
      ?auto_10284 - PLACE
      ?auto_10282 - PLACE
      ?auto_10283 - HOIST
      ?auto_10281 - SURFACE
      ?auto_10295 - PLACE
      ?auto_10305 - HOIST
      ?auto_10309 - SURFACE
      ?auto_10306 - PLACE
      ?auto_10294 - HOIST
      ?auto_10287 - SURFACE
      ?auto_10297 - PLACE
      ?auto_10285 - HOIST
      ?auto_10299 - SURFACE
      ?auto_10288 - PLACE
      ?auto_10310 - HOIST
      ?auto_10290 - SURFACE
      ?auto_10304 - SURFACE
      ?auto_10291 - PLACE
      ?auto_10303 - HOIST
      ?auto_10300 - SURFACE
      ?auto_10293 - PLACE
      ?auto_10289 - HOIST
      ?auto_10292 - SURFACE
      ?auto_10298 - PLACE
      ?auto_10296 - HOIST
      ?auto_10302 - SURFACE
      ?auto_10286 - SURFACE
      ?auto_10307 - PLACE
      ?auto_10301 - HOIST
      ?auto_10308 - SURFACE
      ?auto_10279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10280 ?auto_10284 ) ( IS-CRATE ?auto_10277 ) ( not ( = ?auto_10282 ?auto_10284 ) ) ( HOIST-AT ?auto_10283 ?auto_10282 ) ( SURFACE-AT ?auto_10277 ?auto_10282 ) ( ON ?auto_10277 ?auto_10281 ) ( CLEAR ?auto_10277 ) ( not ( = ?auto_10278 ?auto_10277 ) ) ( not ( = ?auto_10278 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10281 ) ) ( not ( = ?auto_10280 ?auto_10283 ) ) ( IS-CRATE ?auto_10278 ) ( not ( = ?auto_10295 ?auto_10284 ) ) ( HOIST-AT ?auto_10305 ?auto_10295 ) ( AVAILABLE ?auto_10305 ) ( SURFACE-AT ?auto_10278 ?auto_10295 ) ( ON ?auto_10278 ?auto_10309 ) ( CLEAR ?auto_10278 ) ( not ( = ?auto_10273 ?auto_10278 ) ) ( not ( = ?auto_10273 ?auto_10309 ) ) ( not ( = ?auto_10278 ?auto_10309 ) ) ( not ( = ?auto_10280 ?auto_10305 ) ) ( IS-CRATE ?auto_10273 ) ( not ( = ?auto_10306 ?auto_10284 ) ) ( HOIST-AT ?auto_10294 ?auto_10306 ) ( AVAILABLE ?auto_10294 ) ( SURFACE-AT ?auto_10273 ?auto_10306 ) ( ON ?auto_10273 ?auto_10287 ) ( CLEAR ?auto_10273 ) ( not ( = ?auto_10275 ?auto_10273 ) ) ( not ( = ?auto_10275 ?auto_10287 ) ) ( not ( = ?auto_10273 ?auto_10287 ) ) ( not ( = ?auto_10280 ?auto_10294 ) ) ( IS-CRATE ?auto_10275 ) ( not ( = ?auto_10297 ?auto_10284 ) ) ( HOIST-AT ?auto_10285 ?auto_10297 ) ( AVAILABLE ?auto_10285 ) ( SURFACE-AT ?auto_10275 ?auto_10297 ) ( ON ?auto_10275 ?auto_10299 ) ( CLEAR ?auto_10275 ) ( not ( = ?auto_10276 ?auto_10275 ) ) ( not ( = ?auto_10276 ?auto_10299 ) ) ( not ( = ?auto_10275 ?auto_10299 ) ) ( not ( = ?auto_10280 ?auto_10285 ) ) ( IS-CRATE ?auto_10276 ) ( not ( = ?auto_10288 ?auto_10284 ) ) ( HOIST-AT ?auto_10310 ?auto_10288 ) ( AVAILABLE ?auto_10310 ) ( SURFACE-AT ?auto_10276 ?auto_10288 ) ( ON ?auto_10276 ?auto_10290 ) ( CLEAR ?auto_10276 ) ( not ( = ?auto_10272 ?auto_10276 ) ) ( not ( = ?auto_10272 ?auto_10290 ) ) ( not ( = ?auto_10276 ?auto_10290 ) ) ( not ( = ?auto_10280 ?auto_10310 ) ) ( IS-CRATE ?auto_10272 ) ( AVAILABLE ?auto_10283 ) ( SURFACE-AT ?auto_10272 ?auto_10282 ) ( ON ?auto_10272 ?auto_10304 ) ( CLEAR ?auto_10272 ) ( not ( = ?auto_10274 ?auto_10272 ) ) ( not ( = ?auto_10274 ?auto_10304 ) ) ( not ( = ?auto_10272 ?auto_10304 ) ) ( IS-CRATE ?auto_10274 ) ( not ( = ?auto_10291 ?auto_10284 ) ) ( HOIST-AT ?auto_10303 ?auto_10291 ) ( SURFACE-AT ?auto_10274 ?auto_10291 ) ( ON ?auto_10274 ?auto_10300 ) ( CLEAR ?auto_10274 ) ( not ( = ?auto_10271 ?auto_10274 ) ) ( not ( = ?auto_10271 ?auto_10300 ) ) ( not ( = ?auto_10274 ?auto_10300 ) ) ( not ( = ?auto_10280 ?auto_10303 ) ) ( IS-CRATE ?auto_10271 ) ( not ( = ?auto_10293 ?auto_10284 ) ) ( HOIST-AT ?auto_10289 ?auto_10293 ) ( AVAILABLE ?auto_10289 ) ( SURFACE-AT ?auto_10271 ?auto_10293 ) ( ON ?auto_10271 ?auto_10292 ) ( CLEAR ?auto_10271 ) ( not ( = ?auto_10270 ?auto_10271 ) ) ( not ( = ?auto_10270 ?auto_10292 ) ) ( not ( = ?auto_10271 ?auto_10292 ) ) ( not ( = ?auto_10280 ?auto_10289 ) ) ( IS-CRATE ?auto_10270 ) ( not ( = ?auto_10298 ?auto_10284 ) ) ( HOIST-AT ?auto_10296 ?auto_10298 ) ( AVAILABLE ?auto_10296 ) ( SURFACE-AT ?auto_10270 ?auto_10298 ) ( ON ?auto_10270 ?auto_10302 ) ( CLEAR ?auto_10270 ) ( not ( = ?auto_10269 ?auto_10270 ) ) ( not ( = ?auto_10269 ?auto_10302 ) ) ( not ( = ?auto_10270 ?auto_10302 ) ) ( not ( = ?auto_10280 ?auto_10296 ) ) ( IS-CRATE ?auto_10269 ) ( AVAILABLE ?auto_10303 ) ( SURFACE-AT ?auto_10269 ?auto_10291 ) ( ON ?auto_10269 ?auto_10286 ) ( CLEAR ?auto_10269 ) ( not ( = ?auto_10268 ?auto_10269 ) ) ( not ( = ?auto_10268 ?auto_10286 ) ) ( not ( = ?auto_10269 ?auto_10286 ) ) ( SURFACE-AT ?auto_10267 ?auto_10284 ) ( CLEAR ?auto_10267 ) ( IS-CRATE ?auto_10268 ) ( AVAILABLE ?auto_10280 ) ( not ( = ?auto_10307 ?auto_10284 ) ) ( HOIST-AT ?auto_10301 ?auto_10307 ) ( AVAILABLE ?auto_10301 ) ( SURFACE-AT ?auto_10268 ?auto_10307 ) ( ON ?auto_10268 ?auto_10308 ) ( CLEAR ?auto_10268 ) ( TRUCK-AT ?auto_10279 ?auto_10284 ) ( not ( = ?auto_10267 ?auto_10268 ) ) ( not ( = ?auto_10267 ?auto_10308 ) ) ( not ( = ?auto_10268 ?auto_10308 ) ) ( not ( = ?auto_10280 ?auto_10301 ) ) ( not ( = ?auto_10267 ?auto_10269 ) ) ( not ( = ?auto_10267 ?auto_10286 ) ) ( not ( = ?auto_10269 ?auto_10308 ) ) ( not ( = ?auto_10291 ?auto_10307 ) ) ( not ( = ?auto_10303 ?auto_10301 ) ) ( not ( = ?auto_10286 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10270 ) ) ( not ( = ?auto_10267 ?auto_10302 ) ) ( not ( = ?auto_10268 ?auto_10270 ) ) ( not ( = ?auto_10268 ?auto_10302 ) ) ( not ( = ?auto_10270 ?auto_10286 ) ) ( not ( = ?auto_10270 ?auto_10308 ) ) ( not ( = ?auto_10298 ?auto_10291 ) ) ( not ( = ?auto_10298 ?auto_10307 ) ) ( not ( = ?auto_10296 ?auto_10303 ) ) ( not ( = ?auto_10296 ?auto_10301 ) ) ( not ( = ?auto_10302 ?auto_10286 ) ) ( not ( = ?auto_10302 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10271 ) ) ( not ( = ?auto_10267 ?auto_10292 ) ) ( not ( = ?auto_10268 ?auto_10271 ) ) ( not ( = ?auto_10268 ?auto_10292 ) ) ( not ( = ?auto_10269 ?auto_10271 ) ) ( not ( = ?auto_10269 ?auto_10292 ) ) ( not ( = ?auto_10271 ?auto_10302 ) ) ( not ( = ?auto_10271 ?auto_10286 ) ) ( not ( = ?auto_10271 ?auto_10308 ) ) ( not ( = ?auto_10293 ?auto_10298 ) ) ( not ( = ?auto_10293 ?auto_10291 ) ) ( not ( = ?auto_10293 ?auto_10307 ) ) ( not ( = ?auto_10289 ?auto_10296 ) ) ( not ( = ?auto_10289 ?auto_10303 ) ) ( not ( = ?auto_10289 ?auto_10301 ) ) ( not ( = ?auto_10292 ?auto_10302 ) ) ( not ( = ?auto_10292 ?auto_10286 ) ) ( not ( = ?auto_10292 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10274 ) ) ( not ( = ?auto_10267 ?auto_10300 ) ) ( not ( = ?auto_10268 ?auto_10274 ) ) ( not ( = ?auto_10268 ?auto_10300 ) ) ( not ( = ?auto_10269 ?auto_10274 ) ) ( not ( = ?auto_10269 ?auto_10300 ) ) ( not ( = ?auto_10270 ?auto_10274 ) ) ( not ( = ?auto_10270 ?auto_10300 ) ) ( not ( = ?auto_10274 ?auto_10292 ) ) ( not ( = ?auto_10274 ?auto_10302 ) ) ( not ( = ?auto_10274 ?auto_10286 ) ) ( not ( = ?auto_10274 ?auto_10308 ) ) ( not ( = ?auto_10300 ?auto_10292 ) ) ( not ( = ?auto_10300 ?auto_10302 ) ) ( not ( = ?auto_10300 ?auto_10286 ) ) ( not ( = ?auto_10300 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10272 ) ) ( not ( = ?auto_10267 ?auto_10304 ) ) ( not ( = ?auto_10268 ?auto_10272 ) ) ( not ( = ?auto_10268 ?auto_10304 ) ) ( not ( = ?auto_10269 ?auto_10272 ) ) ( not ( = ?auto_10269 ?auto_10304 ) ) ( not ( = ?auto_10270 ?auto_10272 ) ) ( not ( = ?auto_10270 ?auto_10304 ) ) ( not ( = ?auto_10271 ?auto_10272 ) ) ( not ( = ?auto_10271 ?auto_10304 ) ) ( not ( = ?auto_10272 ?auto_10300 ) ) ( not ( = ?auto_10272 ?auto_10292 ) ) ( not ( = ?auto_10272 ?auto_10302 ) ) ( not ( = ?auto_10272 ?auto_10286 ) ) ( not ( = ?auto_10272 ?auto_10308 ) ) ( not ( = ?auto_10282 ?auto_10291 ) ) ( not ( = ?auto_10282 ?auto_10293 ) ) ( not ( = ?auto_10282 ?auto_10298 ) ) ( not ( = ?auto_10282 ?auto_10307 ) ) ( not ( = ?auto_10283 ?auto_10303 ) ) ( not ( = ?auto_10283 ?auto_10289 ) ) ( not ( = ?auto_10283 ?auto_10296 ) ) ( not ( = ?auto_10283 ?auto_10301 ) ) ( not ( = ?auto_10304 ?auto_10300 ) ) ( not ( = ?auto_10304 ?auto_10292 ) ) ( not ( = ?auto_10304 ?auto_10302 ) ) ( not ( = ?auto_10304 ?auto_10286 ) ) ( not ( = ?auto_10304 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10276 ) ) ( not ( = ?auto_10267 ?auto_10290 ) ) ( not ( = ?auto_10268 ?auto_10276 ) ) ( not ( = ?auto_10268 ?auto_10290 ) ) ( not ( = ?auto_10269 ?auto_10276 ) ) ( not ( = ?auto_10269 ?auto_10290 ) ) ( not ( = ?auto_10270 ?auto_10276 ) ) ( not ( = ?auto_10270 ?auto_10290 ) ) ( not ( = ?auto_10271 ?auto_10276 ) ) ( not ( = ?auto_10271 ?auto_10290 ) ) ( not ( = ?auto_10274 ?auto_10276 ) ) ( not ( = ?auto_10274 ?auto_10290 ) ) ( not ( = ?auto_10276 ?auto_10304 ) ) ( not ( = ?auto_10276 ?auto_10300 ) ) ( not ( = ?auto_10276 ?auto_10292 ) ) ( not ( = ?auto_10276 ?auto_10302 ) ) ( not ( = ?auto_10276 ?auto_10286 ) ) ( not ( = ?auto_10276 ?auto_10308 ) ) ( not ( = ?auto_10288 ?auto_10282 ) ) ( not ( = ?auto_10288 ?auto_10291 ) ) ( not ( = ?auto_10288 ?auto_10293 ) ) ( not ( = ?auto_10288 ?auto_10298 ) ) ( not ( = ?auto_10288 ?auto_10307 ) ) ( not ( = ?auto_10310 ?auto_10283 ) ) ( not ( = ?auto_10310 ?auto_10303 ) ) ( not ( = ?auto_10310 ?auto_10289 ) ) ( not ( = ?auto_10310 ?auto_10296 ) ) ( not ( = ?auto_10310 ?auto_10301 ) ) ( not ( = ?auto_10290 ?auto_10304 ) ) ( not ( = ?auto_10290 ?auto_10300 ) ) ( not ( = ?auto_10290 ?auto_10292 ) ) ( not ( = ?auto_10290 ?auto_10302 ) ) ( not ( = ?auto_10290 ?auto_10286 ) ) ( not ( = ?auto_10290 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10275 ) ) ( not ( = ?auto_10267 ?auto_10299 ) ) ( not ( = ?auto_10268 ?auto_10275 ) ) ( not ( = ?auto_10268 ?auto_10299 ) ) ( not ( = ?auto_10269 ?auto_10275 ) ) ( not ( = ?auto_10269 ?auto_10299 ) ) ( not ( = ?auto_10270 ?auto_10275 ) ) ( not ( = ?auto_10270 ?auto_10299 ) ) ( not ( = ?auto_10271 ?auto_10275 ) ) ( not ( = ?auto_10271 ?auto_10299 ) ) ( not ( = ?auto_10274 ?auto_10275 ) ) ( not ( = ?auto_10274 ?auto_10299 ) ) ( not ( = ?auto_10272 ?auto_10275 ) ) ( not ( = ?auto_10272 ?auto_10299 ) ) ( not ( = ?auto_10275 ?auto_10290 ) ) ( not ( = ?auto_10275 ?auto_10304 ) ) ( not ( = ?auto_10275 ?auto_10300 ) ) ( not ( = ?auto_10275 ?auto_10292 ) ) ( not ( = ?auto_10275 ?auto_10302 ) ) ( not ( = ?auto_10275 ?auto_10286 ) ) ( not ( = ?auto_10275 ?auto_10308 ) ) ( not ( = ?auto_10297 ?auto_10288 ) ) ( not ( = ?auto_10297 ?auto_10282 ) ) ( not ( = ?auto_10297 ?auto_10291 ) ) ( not ( = ?auto_10297 ?auto_10293 ) ) ( not ( = ?auto_10297 ?auto_10298 ) ) ( not ( = ?auto_10297 ?auto_10307 ) ) ( not ( = ?auto_10285 ?auto_10310 ) ) ( not ( = ?auto_10285 ?auto_10283 ) ) ( not ( = ?auto_10285 ?auto_10303 ) ) ( not ( = ?auto_10285 ?auto_10289 ) ) ( not ( = ?auto_10285 ?auto_10296 ) ) ( not ( = ?auto_10285 ?auto_10301 ) ) ( not ( = ?auto_10299 ?auto_10290 ) ) ( not ( = ?auto_10299 ?auto_10304 ) ) ( not ( = ?auto_10299 ?auto_10300 ) ) ( not ( = ?auto_10299 ?auto_10292 ) ) ( not ( = ?auto_10299 ?auto_10302 ) ) ( not ( = ?auto_10299 ?auto_10286 ) ) ( not ( = ?auto_10299 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10273 ) ) ( not ( = ?auto_10267 ?auto_10287 ) ) ( not ( = ?auto_10268 ?auto_10273 ) ) ( not ( = ?auto_10268 ?auto_10287 ) ) ( not ( = ?auto_10269 ?auto_10273 ) ) ( not ( = ?auto_10269 ?auto_10287 ) ) ( not ( = ?auto_10270 ?auto_10273 ) ) ( not ( = ?auto_10270 ?auto_10287 ) ) ( not ( = ?auto_10271 ?auto_10273 ) ) ( not ( = ?auto_10271 ?auto_10287 ) ) ( not ( = ?auto_10274 ?auto_10273 ) ) ( not ( = ?auto_10274 ?auto_10287 ) ) ( not ( = ?auto_10272 ?auto_10273 ) ) ( not ( = ?auto_10272 ?auto_10287 ) ) ( not ( = ?auto_10276 ?auto_10273 ) ) ( not ( = ?auto_10276 ?auto_10287 ) ) ( not ( = ?auto_10273 ?auto_10299 ) ) ( not ( = ?auto_10273 ?auto_10290 ) ) ( not ( = ?auto_10273 ?auto_10304 ) ) ( not ( = ?auto_10273 ?auto_10300 ) ) ( not ( = ?auto_10273 ?auto_10292 ) ) ( not ( = ?auto_10273 ?auto_10302 ) ) ( not ( = ?auto_10273 ?auto_10286 ) ) ( not ( = ?auto_10273 ?auto_10308 ) ) ( not ( = ?auto_10306 ?auto_10297 ) ) ( not ( = ?auto_10306 ?auto_10288 ) ) ( not ( = ?auto_10306 ?auto_10282 ) ) ( not ( = ?auto_10306 ?auto_10291 ) ) ( not ( = ?auto_10306 ?auto_10293 ) ) ( not ( = ?auto_10306 ?auto_10298 ) ) ( not ( = ?auto_10306 ?auto_10307 ) ) ( not ( = ?auto_10294 ?auto_10285 ) ) ( not ( = ?auto_10294 ?auto_10310 ) ) ( not ( = ?auto_10294 ?auto_10283 ) ) ( not ( = ?auto_10294 ?auto_10303 ) ) ( not ( = ?auto_10294 ?auto_10289 ) ) ( not ( = ?auto_10294 ?auto_10296 ) ) ( not ( = ?auto_10294 ?auto_10301 ) ) ( not ( = ?auto_10287 ?auto_10299 ) ) ( not ( = ?auto_10287 ?auto_10290 ) ) ( not ( = ?auto_10287 ?auto_10304 ) ) ( not ( = ?auto_10287 ?auto_10300 ) ) ( not ( = ?auto_10287 ?auto_10292 ) ) ( not ( = ?auto_10287 ?auto_10302 ) ) ( not ( = ?auto_10287 ?auto_10286 ) ) ( not ( = ?auto_10287 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10278 ) ) ( not ( = ?auto_10267 ?auto_10309 ) ) ( not ( = ?auto_10268 ?auto_10278 ) ) ( not ( = ?auto_10268 ?auto_10309 ) ) ( not ( = ?auto_10269 ?auto_10278 ) ) ( not ( = ?auto_10269 ?auto_10309 ) ) ( not ( = ?auto_10270 ?auto_10278 ) ) ( not ( = ?auto_10270 ?auto_10309 ) ) ( not ( = ?auto_10271 ?auto_10278 ) ) ( not ( = ?auto_10271 ?auto_10309 ) ) ( not ( = ?auto_10274 ?auto_10278 ) ) ( not ( = ?auto_10274 ?auto_10309 ) ) ( not ( = ?auto_10272 ?auto_10278 ) ) ( not ( = ?auto_10272 ?auto_10309 ) ) ( not ( = ?auto_10276 ?auto_10278 ) ) ( not ( = ?auto_10276 ?auto_10309 ) ) ( not ( = ?auto_10275 ?auto_10278 ) ) ( not ( = ?auto_10275 ?auto_10309 ) ) ( not ( = ?auto_10278 ?auto_10287 ) ) ( not ( = ?auto_10278 ?auto_10299 ) ) ( not ( = ?auto_10278 ?auto_10290 ) ) ( not ( = ?auto_10278 ?auto_10304 ) ) ( not ( = ?auto_10278 ?auto_10300 ) ) ( not ( = ?auto_10278 ?auto_10292 ) ) ( not ( = ?auto_10278 ?auto_10302 ) ) ( not ( = ?auto_10278 ?auto_10286 ) ) ( not ( = ?auto_10278 ?auto_10308 ) ) ( not ( = ?auto_10295 ?auto_10306 ) ) ( not ( = ?auto_10295 ?auto_10297 ) ) ( not ( = ?auto_10295 ?auto_10288 ) ) ( not ( = ?auto_10295 ?auto_10282 ) ) ( not ( = ?auto_10295 ?auto_10291 ) ) ( not ( = ?auto_10295 ?auto_10293 ) ) ( not ( = ?auto_10295 ?auto_10298 ) ) ( not ( = ?auto_10295 ?auto_10307 ) ) ( not ( = ?auto_10305 ?auto_10294 ) ) ( not ( = ?auto_10305 ?auto_10285 ) ) ( not ( = ?auto_10305 ?auto_10310 ) ) ( not ( = ?auto_10305 ?auto_10283 ) ) ( not ( = ?auto_10305 ?auto_10303 ) ) ( not ( = ?auto_10305 ?auto_10289 ) ) ( not ( = ?auto_10305 ?auto_10296 ) ) ( not ( = ?auto_10305 ?auto_10301 ) ) ( not ( = ?auto_10309 ?auto_10287 ) ) ( not ( = ?auto_10309 ?auto_10299 ) ) ( not ( = ?auto_10309 ?auto_10290 ) ) ( not ( = ?auto_10309 ?auto_10304 ) ) ( not ( = ?auto_10309 ?auto_10300 ) ) ( not ( = ?auto_10309 ?auto_10292 ) ) ( not ( = ?auto_10309 ?auto_10302 ) ) ( not ( = ?auto_10309 ?auto_10286 ) ) ( not ( = ?auto_10309 ?auto_10308 ) ) ( not ( = ?auto_10267 ?auto_10277 ) ) ( not ( = ?auto_10267 ?auto_10281 ) ) ( not ( = ?auto_10268 ?auto_10277 ) ) ( not ( = ?auto_10268 ?auto_10281 ) ) ( not ( = ?auto_10269 ?auto_10277 ) ) ( not ( = ?auto_10269 ?auto_10281 ) ) ( not ( = ?auto_10270 ?auto_10277 ) ) ( not ( = ?auto_10270 ?auto_10281 ) ) ( not ( = ?auto_10271 ?auto_10277 ) ) ( not ( = ?auto_10271 ?auto_10281 ) ) ( not ( = ?auto_10274 ?auto_10277 ) ) ( not ( = ?auto_10274 ?auto_10281 ) ) ( not ( = ?auto_10272 ?auto_10277 ) ) ( not ( = ?auto_10272 ?auto_10281 ) ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10281 ) ) ( not ( = ?auto_10275 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10281 ) ) ( not ( = ?auto_10273 ?auto_10277 ) ) ( not ( = ?auto_10273 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10309 ) ) ( not ( = ?auto_10277 ?auto_10287 ) ) ( not ( = ?auto_10277 ?auto_10299 ) ) ( not ( = ?auto_10277 ?auto_10290 ) ) ( not ( = ?auto_10277 ?auto_10304 ) ) ( not ( = ?auto_10277 ?auto_10300 ) ) ( not ( = ?auto_10277 ?auto_10292 ) ) ( not ( = ?auto_10277 ?auto_10302 ) ) ( not ( = ?auto_10277 ?auto_10286 ) ) ( not ( = ?auto_10277 ?auto_10308 ) ) ( not ( = ?auto_10281 ?auto_10309 ) ) ( not ( = ?auto_10281 ?auto_10287 ) ) ( not ( = ?auto_10281 ?auto_10299 ) ) ( not ( = ?auto_10281 ?auto_10290 ) ) ( not ( = ?auto_10281 ?auto_10304 ) ) ( not ( = ?auto_10281 ?auto_10300 ) ) ( not ( = ?auto_10281 ?auto_10292 ) ) ( not ( = ?auto_10281 ?auto_10302 ) ) ( not ( = ?auto_10281 ?auto_10286 ) ) ( not ( = ?auto_10281 ?auto_10308 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10267 ?auto_10268 ?auto_10269 ?auto_10270 ?auto_10271 ?auto_10274 ?auto_10272 ?auto_10276 ?auto_10275 ?auto_10273 ?auto_10278 )
      ( MAKE-1CRATE ?auto_10278 ?auto_10277 )
      ( MAKE-11CRATE-VERIFY ?auto_10267 ?auto_10268 ?auto_10269 ?auto_10270 ?auto_10271 ?auto_10274 ?auto_10272 ?auto_10276 ?auto_10275 ?auto_10273 ?auto_10278 ?auto_10277 ) )
  )

)

