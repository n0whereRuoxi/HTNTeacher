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
      ?auto_7766 - SURFACE
      ?auto_7767 - SURFACE
    )
    :vars
    (
      ?auto_7768 - HOIST
      ?auto_7769 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7768 ?auto_7769 ) ( SURFACE-AT ?auto_7767 ?auto_7769 ) ( CLEAR ?auto_7767 ) ( LIFTING ?auto_7768 ?auto_7766 ) ( IS-CRATE ?auto_7766 ) ( not ( = ?auto_7766 ?auto_7767 ) ) )
    :subtasks
    ( ( !DROP ?auto_7768 ?auto_7766 ?auto_7767 ?auto_7769 )
      ( MAKE-ON-VERIFY ?auto_7766 ?auto_7767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7770 - SURFACE
      ?auto_7771 - SURFACE
    )
    :vars
    (
      ?auto_7772 - HOIST
      ?auto_7773 - PLACE
      ?auto_7774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7772 ?auto_7773 ) ( SURFACE-AT ?auto_7771 ?auto_7773 ) ( CLEAR ?auto_7771 ) ( IS-CRATE ?auto_7770 ) ( not ( = ?auto_7770 ?auto_7771 ) ) ( TRUCK-AT ?auto_7774 ?auto_7773 ) ( AVAILABLE ?auto_7772 ) ( IN ?auto_7770 ?auto_7774 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7772 ?auto_7770 ?auto_7774 ?auto_7773 )
      ( MAKE-ON ?auto_7770 ?auto_7771 )
      ( MAKE-ON-VERIFY ?auto_7770 ?auto_7771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7775 - SURFACE
      ?auto_7776 - SURFACE
    )
    :vars
    (
      ?auto_7777 - HOIST
      ?auto_7778 - PLACE
      ?auto_7779 - TRUCK
      ?auto_7780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7777 ?auto_7778 ) ( SURFACE-AT ?auto_7776 ?auto_7778 ) ( CLEAR ?auto_7776 ) ( IS-CRATE ?auto_7775 ) ( not ( = ?auto_7775 ?auto_7776 ) ) ( AVAILABLE ?auto_7777 ) ( IN ?auto_7775 ?auto_7779 ) ( TRUCK-AT ?auto_7779 ?auto_7780 ) ( not ( = ?auto_7780 ?auto_7778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7779 ?auto_7780 ?auto_7778 )
      ( MAKE-ON ?auto_7775 ?auto_7776 )
      ( MAKE-ON-VERIFY ?auto_7775 ?auto_7776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7781 - SURFACE
      ?auto_7782 - SURFACE
    )
    :vars
    (
      ?auto_7786 - HOIST
      ?auto_7784 - PLACE
      ?auto_7783 - TRUCK
      ?auto_7785 - PLACE
      ?auto_7787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7786 ?auto_7784 ) ( SURFACE-AT ?auto_7782 ?auto_7784 ) ( CLEAR ?auto_7782 ) ( IS-CRATE ?auto_7781 ) ( not ( = ?auto_7781 ?auto_7782 ) ) ( AVAILABLE ?auto_7786 ) ( TRUCK-AT ?auto_7783 ?auto_7785 ) ( not ( = ?auto_7785 ?auto_7784 ) ) ( HOIST-AT ?auto_7787 ?auto_7785 ) ( LIFTING ?auto_7787 ?auto_7781 ) ( not ( = ?auto_7786 ?auto_7787 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7787 ?auto_7781 ?auto_7783 ?auto_7785 )
      ( MAKE-ON ?auto_7781 ?auto_7782 )
      ( MAKE-ON-VERIFY ?auto_7781 ?auto_7782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7788 - SURFACE
      ?auto_7789 - SURFACE
    )
    :vars
    (
      ?auto_7790 - HOIST
      ?auto_7794 - PLACE
      ?auto_7793 - TRUCK
      ?auto_7791 - PLACE
      ?auto_7792 - HOIST
      ?auto_7795 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7790 ?auto_7794 ) ( SURFACE-AT ?auto_7789 ?auto_7794 ) ( CLEAR ?auto_7789 ) ( IS-CRATE ?auto_7788 ) ( not ( = ?auto_7788 ?auto_7789 ) ) ( AVAILABLE ?auto_7790 ) ( TRUCK-AT ?auto_7793 ?auto_7791 ) ( not ( = ?auto_7791 ?auto_7794 ) ) ( HOIST-AT ?auto_7792 ?auto_7791 ) ( not ( = ?auto_7790 ?auto_7792 ) ) ( AVAILABLE ?auto_7792 ) ( SURFACE-AT ?auto_7788 ?auto_7791 ) ( ON ?auto_7788 ?auto_7795 ) ( CLEAR ?auto_7788 ) ( not ( = ?auto_7788 ?auto_7795 ) ) ( not ( = ?auto_7789 ?auto_7795 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7792 ?auto_7788 ?auto_7795 ?auto_7791 )
      ( MAKE-ON ?auto_7788 ?auto_7789 )
      ( MAKE-ON-VERIFY ?auto_7788 ?auto_7789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7796 - SURFACE
      ?auto_7797 - SURFACE
    )
    :vars
    (
      ?auto_7802 - HOIST
      ?auto_7798 - PLACE
      ?auto_7799 - PLACE
      ?auto_7800 - HOIST
      ?auto_7801 - SURFACE
      ?auto_7803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7802 ?auto_7798 ) ( SURFACE-AT ?auto_7797 ?auto_7798 ) ( CLEAR ?auto_7797 ) ( IS-CRATE ?auto_7796 ) ( not ( = ?auto_7796 ?auto_7797 ) ) ( AVAILABLE ?auto_7802 ) ( not ( = ?auto_7799 ?auto_7798 ) ) ( HOIST-AT ?auto_7800 ?auto_7799 ) ( not ( = ?auto_7802 ?auto_7800 ) ) ( AVAILABLE ?auto_7800 ) ( SURFACE-AT ?auto_7796 ?auto_7799 ) ( ON ?auto_7796 ?auto_7801 ) ( CLEAR ?auto_7796 ) ( not ( = ?auto_7796 ?auto_7801 ) ) ( not ( = ?auto_7797 ?auto_7801 ) ) ( TRUCK-AT ?auto_7803 ?auto_7798 ) )
    :subtasks
    ( ( !DRIVE ?auto_7803 ?auto_7798 ?auto_7799 )
      ( MAKE-ON ?auto_7796 ?auto_7797 )
      ( MAKE-ON-VERIFY ?auto_7796 ?auto_7797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7844 - SURFACE
      ?auto_7845 - SURFACE
    )
    :vars
    (
      ?auto_7849 - HOIST
      ?auto_7846 - PLACE
      ?auto_7851 - PLACE
      ?auto_7847 - HOIST
      ?auto_7850 - SURFACE
      ?auto_7848 - TRUCK
      ?auto_7852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7849 ?auto_7846 ) ( IS-CRATE ?auto_7844 ) ( not ( = ?auto_7844 ?auto_7845 ) ) ( not ( = ?auto_7851 ?auto_7846 ) ) ( HOIST-AT ?auto_7847 ?auto_7851 ) ( not ( = ?auto_7849 ?auto_7847 ) ) ( AVAILABLE ?auto_7847 ) ( SURFACE-AT ?auto_7844 ?auto_7851 ) ( ON ?auto_7844 ?auto_7850 ) ( CLEAR ?auto_7844 ) ( not ( = ?auto_7844 ?auto_7850 ) ) ( not ( = ?auto_7845 ?auto_7850 ) ) ( TRUCK-AT ?auto_7848 ?auto_7846 ) ( SURFACE-AT ?auto_7852 ?auto_7846 ) ( CLEAR ?auto_7852 ) ( LIFTING ?auto_7849 ?auto_7845 ) ( IS-CRATE ?auto_7845 ) ( not ( = ?auto_7844 ?auto_7852 ) ) ( not ( = ?auto_7845 ?auto_7852 ) ) ( not ( = ?auto_7850 ?auto_7852 ) ) )
    :subtasks
    ( ( !DROP ?auto_7849 ?auto_7845 ?auto_7852 ?auto_7846 )
      ( MAKE-ON ?auto_7844 ?auto_7845 )
      ( MAKE-ON-VERIFY ?auto_7844 ?auto_7845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7853 - SURFACE
      ?auto_7854 - SURFACE
    )
    :vars
    (
      ?auto_7859 - HOIST
      ?auto_7861 - PLACE
      ?auto_7857 - PLACE
      ?auto_7860 - HOIST
      ?auto_7856 - SURFACE
      ?auto_7855 - TRUCK
      ?auto_7858 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7859 ?auto_7861 ) ( IS-CRATE ?auto_7853 ) ( not ( = ?auto_7853 ?auto_7854 ) ) ( not ( = ?auto_7857 ?auto_7861 ) ) ( HOIST-AT ?auto_7860 ?auto_7857 ) ( not ( = ?auto_7859 ?auto_7860 ) ) ( AVAILABLE ?auto_7860 ) ( SURFACE-AT ?auto_7853 ?auto_7857 ) ( ON ?auto_7853 ?auto_7856 ) ( CLEAR ?auto_7853 ) ( not ( = ?auto_7853 ?auto_7856 ) ) ( not ( = ?auto_7854 ?auto_7856 ) ) ( TRUCK-AT ?auto_7855 ?auto_7861 ) ( SURFACE-AT ?auto_7858 ?auto_7861 ) ( CLEAR ?auto_7858 ) ( IS-CRATE ?auto_7854 ) ( not ( = ?auto_7853 ?auto_7858 ) ) ( not ( = ?auto_7854 ?auto_7858 ) ) ( not ( = ?auto_7856 ?auto_7858 ) ) ( AVAILABLE ?auto_7859 ) ( IN ?auto_7854 ?auto_7855 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7859 ?auto_7854 ?auto_7855 ?auto_7861 )
      ( MAKE-ON ?auto_7853 ?auto_7854 )
      ( MAKE-ON-VERIFY ?auto_7853 ?auto_7854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7868 - SURFACE
      ?auto_7869 - SURFACE
    )
    :vars
    (
      ?auto_7872 - HOIST
      ?auto_7874 - PLACE
      ?auto_7873 - PLACE
      ?auto_7875 - HOIST
      ?auto_7870 - SURFACE
      ?auto_7871 - TRUCK
      ?auto_7876 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7872 ?auto_7874 ) ( SURFACE-AT ?auto_7869 ?auto_7874 ) ( CLEAR ?auto_7869 ) ( IS-CRATE ?auto_7868 ) ( not ( = ?auto_7868 ?auto_7869 ) ) ( AVAILABLE ?auto_7872 ) ( not ( = ?auto_7873 ?auto_7874 ) ) ( HOIST-AT ?auto_7875 ?auto_7873 ) ( not ( = ?auto_7872 ?auto_7875 ) ) ( AVAILABLE ?auto_7875 ) ( SURFACE-AT ?auto_7868 ?auto_7873 ) ( ON ?auto_7868 ?auto_7870 ) ( CLEAR ?auto_7868 ) ( not ( = ?auto_7868 ?auto_7870 ) ) ( not ( = ?auto_7869 ?auto_7870 ) ) ( TRUCK-AT ?auto_7871 ?auto_7876 ) ( not ( = ?auto_7876 ?auto_7874 ) ) ( not ( = ?auto_7873 ?auto_7876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7871 ?auto_7876 ?auto_7874 )
      ( MAKE-ON ?auto_7868 ?auto_7869 )
      ( MAKE-ON-VERIFY ?auto_7868 ?auto_7869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8247 - SURFACE
      ?auto_8248 - SURFACE
    )
    :vars
    (
      ?auto_8252 - HOIST
      ?auto_8254 - PLACE
      ?auto_8249 - TRUCK
      ?auto_8251 - PLACE
      ?auto_8250 - HOIST
      ?auto_8253 - SURFACE
      ?auto_8255 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8252 ?auto_8254 ) ( SURFACE-AT ?auto_8248 ?auto_8254 ) ( CLEAR ?auto_8248 ) ( IS-CRATE ?auto_8247 ) ( not ( = ?auto_8247 ?auto_8248 ) ) ( AVAILABLE ?auto_8252 ) ( TRUCK-AT ?auto_8249 ?auto_8251 ) ( not ( = ?auto_8251 ?auto_8254 ) ) ( HOIST-AT ?auto_8250 ?auto_8251 ) ( not ( = ?auto_8252 ?auto_8250 ) ) ( SURFACE-AT ?auto_8247 ?auto_8251 ) ( ON ?auto_8247 ?auto_8253 ) ( CLEAR ?auto_8247 ) ( not ( = ?auto_8247 ?auto_8253 ) ) ( not ( = ?auto_8248 ?auto_8253 ) ) ( LIFTING ?auto_8250 ?auto_8255 ) ( IS-CRATE ?auto_8255 ) ( not ( = ?auto_8247 ?auto_8255 ) ) ( not ( = ?auto_8248 ?auto_8255 ) ) ( not ( = ?auto_8253 ?auto_8255 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8250 ?auto_8255 ?auto_8249 ?auto_8251 )
      ( MAKE-ON ?auto_8247 ?auto_8248 )
      ( MAKE-ON-VERIFY ?auto_8247 ?auto_8248 ) )
  )

)

