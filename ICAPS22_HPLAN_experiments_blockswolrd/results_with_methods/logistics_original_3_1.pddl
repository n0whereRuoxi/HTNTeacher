( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4509 - OBJ
      ?auto_4508 - LOCATION
    )
    :vars
    (
      ?auto_4510 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4510 ?auto_4508 ) ( IN-TRUCK ?auto_4509 ?auto_4510 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4509 ?auto_4510 ?auto_4508 )
      ( DELIVER-1PKG-VERIFY ?auto_4509 ?auto_4508 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4521 - OBJ
      ?auto_4520 - LOCATION
    )
    :vars
    (
      ?auto_4522 - TRUCK
      ?auto_4523 - LOCATION
      ?auto_4524 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4521 ?auto_4522 ) ( TRUCK-AT ?auto_4522 ?auto_4523 ) ( IN-CITY ?auto_4523 ?auto_4524 ) ( IN-CITY ?auto_4520 ?auto_4524 ) ( not ( = ?auto_4520 ?auto_4523 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4522 ?auto_4523 ?auto_4520 ?auto_4524 )
      ( DELIVER-1PKG ?auto_4521 ?auto_4520 )
      ( DELIVER-1PKG-VERIFY ?auto_4521 ?auto_4520 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4539 - OBJ
      ?auto_4538 - LOCATION
    )
    :vars
    (
      ?auto_4541 - TRUCK
      ?auto_4542 - LOCATION
      ?auto_4540 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4541 ?auto_4542 ) ( IN-CITY ?auto_4542 ?auto_4540 ) ( IN-CITY ?auto_4538 ?auto_4540 ) ( not ( = ?auto_4538 ?auto_4542 ) ) ( OBJ-AT ?auto_4539 ?auto_4542 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4539 ?auto_4541 ?auto_4542 )
      ( DELIVER-1PKG ?auto_4539 ?auto_4538 )
      ( DELIVER-1PKG-VERIFY ?auto_4539 ?auto_4538 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4557 - OBJ
      ?auto_4556 - LOCATION
    )
    :vars
    (
      ?auto_4558 - LOCATION
      ?auto_4560 - CITY
      ?auto_4559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4558 ?auto_4560 ) ( IN-CITY ?auto_4556 ?auto_4560 ) ( not ( = ?auto_4556 ?auto_4558 ) ) ( OBJ-AT ?auto_4557 ?auto_4558 ) ( TRUCK-AT ?auto_4559 ?auto_4556 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4559 ?auto_4556 ?auto_4558 ?auto_4560 )
      ( DELIVER-1PKG ?auto_4557 ?auto_4556 )
      ( DELIVER-1PKG-VERIFY ?auto_4557 ?auto_4556 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4614 - OBJ
      ?auto_4613 - LOCATION
    )
    :vars
    (
      ?auto_4615 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4615 ?auto_4613 ) ( IN-TRUCK ?auto_4614 ?auto_4615 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_4614 ?auto_4615 ?auto_4613 )
      ( DELIVER-1PKG-VERIFY ?auto_4614 ?auto_4613 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4617 - OBJ
      ?auto_4618 - OBJ
      ?auto_4616 - LOCATION
    )
    :vars
    (
      ?auto_4619 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4619 ?auto_4616 ) ( IN-TRUCK ?auto_4618 ?auto_4619 ) ( OBJ-AT ?auto_4617 ?auto_4616 ) ( not ( = ?auto_4617 ?auto_4618 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4618 ?auto_4616 )
      ( DELIVER-2PKG-VERIFY ?auto_4617 ?auto_4618 ?auto_4616 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4621 - OBJ
      ?auto_4622 - OBJ
      ?auto_4620 - LOCATION
    )
    :vars
    (
      ?auto_4623 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4623 ?auto_4620 ) ( IN-TRUCK ?auto_4621 ?auto_4623 ) ( OBJ-AT ?auto_4622 ?auto_4620 ) ( not ( = ?auto_4621 ?auto_4622 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4621 ?auto_4620 )
      ( DELIVER-2PKG-VERIFY ?auto_4621 ?auto_4622 ?auto_4620 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4629 - OBJ
      ?auto_4630 - OBJ
      ?auto_4631 - OBJ
      ?auto_4628 - LOCATION
    )
    :vars
    (
      ?auto_4632 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4632 ?auto_4628 ) ( IN-TRUCK ?auto_4631 ?auto_4632 ) ( OBJ-AT ?auto_4629 ?auto_4628 ) ( OBJ-AT ?auto_4630 ?auto_4628 ) ( not ( = ?auto_4629 ?auto_4630 ) ) ( not ( = ?auto_4629 ?auto_4631 ) ) ( not ( = ?auto_4630 ?auto_4631 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4631 ?auto_4628 )
      ( DELIVER-3PKG-VERIFY ?auto_4629 ?auto_4630 ?auto_4631 ?auto_4628 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4634 - OBJ
      ?auto_4635 - OBJ
      ?auto_4636 - OBJ
      ?auto_4633 - LOCATION
    )
    :vars
    (
      ?auto_4637 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4637 ?auto_4633 ) ( IN-TRUCK ?auto_4635 ?auto_4637 ) ( OBJ-AT ?auto_4634 ?auto_4633 ) ( OBJ-AT ?auto_4636 ?auto_4633 ) ( not ( = ?auto_4634 ?auto_4635 ) ) ( not ( = ?auto_4634 ?auto_4636 ) ) ( not ( = ?auto_4635 ?auto_4636 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4635 ?auto_4633 )
      ( DELIVER-3PKG-VERIFY ?auto_4634 ?auto_4635 ?auto_4636 ?auto_4633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4644 - OBJ
      ?auto_4645 - OBJ
      ?auto_4646 - OBJ
      ?auto_4643 - LOCATION
    )
    :vars
    (
      ?auto_4647 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4647 ?auto_4643 ) ( IN-TRUCK ?auto_4644 ?auto_4647 ) ( OBJ-AT ?auto_4645 ?auto_4643 ) ( OBJ-AT ?auto_4646 ?auto_4643 ) ( not ( = ?auto_4644 ?auto_4645 ) ) ( not ( = ?auto_4644 ?auto_4646 ) ) ( not ( = ?auto_4645 ?auto_4646 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4644 ?auto_4643 )
      ( DELIVER-3PKG-VERIFY ?auto_4644 ?auto_4645 ?auto_4646 ?auto_4643 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4664 - OBJ
      ?auto_4663 - LOCATION
    )
    :vars
    (
      ?auto_4665 - TRUCK
      ?auto_4666 - LOCATION
      ?auto_4667 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4664 ?auto_4665 ) ( TRUCK-AT ?auto_4665 ?auto_4666 ) ( IN-CITY ?auto_4666 ?auto_4667 ) ( IN-CITY ?auto_4663 ?auto_4667 ) ( not ( = ?auto_4663 ?auto_4666 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4665 ?auto_4666 ?auto_4663 ?auto_4667 )
      ( DELIVER-1PKG ?auto_4664 ?auto_4663 )
      ( DELIVER-1PKG-VERIFY ?auto_4664 ?auto_4663 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4669 - OBJ
      ?auto_4670 - OBJ
      ?auto_4668 - LOCATION
    )
    :vars
    (
      ?auto_4673 - TRUCK
      ?auto_4672 - LOCATION
      ?auto_4671 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4670 ?auto_4673 ) ( TRUCK-AT ?auto_4673 ?auto_4672 ) ( IN-CITY ?auto_4672 ?auto_4671 ) ( IN-CITY ?auto_4668 ?auto_4671 ) ( not ( = ?auto_4668 ?auto_4672 ) ) ( OBJ-AT ?auto_4669 ?auto_4668 ) ( not ( = ?auto_4669 ?auto_4670 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4670 ?auto_4668 )
      ( DELIVER-2PKG-VERIFY ?auto_4669 ?auto_4670 ?auto_4668 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4675 - OBJ
      ?auto_4676 - OBJ
      ?auto_4674 - LOCATION
    )
    :vars
    (
      ?auto_4678 - TRUCK
      ?auto_4677 - LOCATION
      ?auto_4679 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4675 ?auto_4678 ) ( TRUCK-AT ?auto_4678 ?auto_4677 ) ( IN-CITY ?auto_4677 ?auto_4679 ) ( IN-CITY ?auto_4674 ?auto_4679 ) ( not ( = ?auto_4674 ?auto_4677 ) ) ( OBJ-AT ?auto_4676 ?auto_4674 ) ( not ( = ?auto_4676 ?auto_4675 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4676 ?auto_4675 ?auto_4674 )
      ( DELIVER-2PKG-VERIFY ?auto_4675 ?auto_4676 ?auto_4674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4688 - OBJ
      ?auto_4689 - OBJ
      ?auto_4690 - OBJ
      ?auto_4687 - LOCATION
    )
    :vars
    (
      ?auto_4692 - TRUCK
      ?auto_4691 - LOCATION
      ?auto_4693 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4690 ?auto_4692 ) ( TRUCK-AT ?auto_4692 ?auto_4691 ) ( IN-CITY ?auto_4691 ?auto_4693 ) ( IN-CITY ?auto_4687 ?auto_4693 ) ( not ( = ?auto_4687 ?auto_4691 ) ) ( OBJ-AT ?auto_4688 ?auto_4687 ) ( not ( = ?auto_4688 ?auto_4690 ) ) ( OBJ-AT ?auto_4689 ?auto_4687 ) ( not ( = ?auto_4688 ?auto_4689 ) ) ( not ( = ?auto_4689 ?auto_4690 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4688 ?auto_4690 ?auto_4687 )
      ( DELIVER-3PKG-VERIFY ?auto_4688 ?auto_4689 ?auto_4690 ?auto_4687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4695 - OBJ
      ?auto_4696 - OBJ
      ?auto_4697 - OBJ
      ?auto_4694 - LOCATION
    )
    :vars
    (
      ?auto_4699 - TRUCK
      ?auto_4698 - LOCATION
      ?auto_4700 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4696 ?auto_4699 ) ( TRUCK-AT ?auto_4699 ?auto_4698 ) ( IN-CITY ?auto_4698 ?auto_4700 ) ( IN-CITY ?auto_4694 ?auto_4700 ) ( not ( = ?auto_4694 ?auto_4698 ) ) ( OBJ-AT ?auto_4695 ?auto_4694 ) ( not ( = ?auto_4695 ?auto_4696 ) ) ( OBJ-AT ?auto_4697 ?auto_4694 ) ( not ( = ?auto_4695 ?auto_4697 ) ) ( not ( = ?auto_4696 ?auto_4697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4695 ?auto_4696 ?auto_4694 )
      ( DELIVER-3PKG-VERIFY ?auto_4695 ?auto_4696 ?auto_4697 ?auto_4694 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4709 - OBJ
      ?auto_4710 - OBJ
      ?auto_4711 - OBJ
      ?auto_4708 - LOCATION
    )
    :vars
    (
      ?auto_4713 - TRUCK
      ?auto_4712 - LOCATION
      ?auto_4714 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_4709 ?auto_4713 ) ( TRUCK-AT ?auto_4713 ?auto_4712 ) ( IN-CITY ?auto_4712 ?auto_4714 ) ( IN-CITY ?auto_4708 ?auto_4714 ) ( not ( = ?auto_4708 ?auto_4712 ) ) ( OBJ-AT ?auto_4711 ?auto_4708 ) ( not ( = ?auto_4711 ?auto_4709 ) ) ( OBJ-AT ?auto_4710 ?auto_4708 ) ( not ( = ?auto_4709 ?auto_4710 ) ) ( not ( = ?auto_4710 ?auto_4711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4711 ?auto_4709 ?auto_4708 )
      ( DELIVER-3PKG-VERIFY ?auto_4709 ?auto_4710 ?auto_4711 ?auto_4708 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4738 - OBJ
      ?auto_4737 - LOCATION
    )
    :vars
    (
      ?auto_4741 - TRUCK
      ?auto_4740 - LOCATION
      ?auto_4742 - CITY
      ?auto_4739 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4741 ?auto_4740 ) ( IN-CITY ?auto_4740 ?auto_4742 ) ( IN-CITY ?auto_4737 ?auto_4742 ) ( not ( = ?auto_4737 ?auto_4740 ) ) ( OBJ-AT ?auto_4739 ?auto_4737 ) ( not ( = ?auto_4739 ?auto_4738 ) ) ( OBJ-AT ?auto_4738 ?auto_4740 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4738 ?auto_4741 ?auto_4740 )
      ( DELIVER-2PKG ?auto_4739 ?auto_4738 ?auto_4737 )
      ( DELIVER-1PKG-VERIFY ?auto_4738 ?auto_4737 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4744 - OBJ
      ?auto_4745 - OBJ
      ?auto_4743 - LOCATION
    )
    :vars
    (
      ?auto_4746 - TRUCK
      ?auto_4748 - LOCATION
      ?auto_4747 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4746 ?auto_4748 ) ( IN-CITY ?auto_4748 ?auto_4747 ) ( IN-CITY ?auto_4743 ?auto_4747 ) ( not ( = ?auto_4743 ?auto_4748 ) ) ( OBJ-AT ?auto_4744 ?auto_4743 ) ( not ( = ?auto_4744 ?auto_4745 ) ) ( OBJ-AT ?auto_4745 ?auto_4748 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4745 ?auto_4743 )
      ( DELIVER-2PKG-VERIFY ?auto_4744 ?auto_4745 ?auto_4743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4750 - OBJ
      ?auto_4751 - OBJ
      ?auto_4749 - LOCATION
    )
    :vars
    (
      ?auto_4754 - TRUCK
      ?auto_4753 - LOCATION
      ?auto_4752 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4754 ?auto_4753 ) ( IN-CITY ?auto_4753 ?auto_4752 ) ( IN-CITY ?auto_4749 ?auto_4752 ) ( not ( = ?auto_4749 ?auto_4753 ) ) ( OBJ-AT ?auto_4751 ?auto_4749 ) ( not ( = ?auto_4751 ?auto_4750 ) ) ( OBJ-AT ?auto_4750 ?auto_4753 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4751 ?auto_4750 ?auto_4749 )
      ( DELIVER-2PKG-VERIFY ?auto_4750 ?auto_4751 ?auto_4749 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4763 - OBJ
      ?auto_4764 - OBJ
      ?auto_4765 - OBJ
      ?auto_4762 - LOCATION
    )
    :vars
    (
      ?auto_4768 - TRUCK
      ?auto_4767 - LOCATION
      ?auto_4766 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4768 ?auto_4767 ) ( IN-CITY ?auto_4767 ?auto_4766 ) ( IN-CITY ?auto_4762 ?auto_4766 ) ( not ( = ?auto_4762 ?auto_4767 ) ) ( OBJ-AT ?auto_4763 ?auto_4762 ) ( not ( = ?auto_4763 ?auto_4765 ) ) ( OBJ-AT ?auto_4765 ?auto_4767 ) ( OBJ-AT ?auto_4764 ?auto_4762 ) ( not ( = ?auto_4763 ?auto_4764 ) ) ( not ( = ?auto_4764 ?auto_4765 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4763 ?auto_4765 ?auto_4762 )
      ( DELIVER-3PKG-VERIFY ?auto_4763 ?auto_4764 ?auto_4765 ?auto_4762 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4770 - OBJ
      ?auto_4771 - OBJ
      ?auto_4772 - OBJ
      ?auto_4769 - LOCATION
    )
    :vars
    (
      ?auto_4775 - TRUCK
      ?auto_4774 - LOCATION
      ?auto_4773 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4775 ?auto_4774 ) ( IN-CITY ?auto_4774 ?auto_4773 ) ( IN-CITY ?auto_4769 ?auto_4773 ) ( not ( = ?auto_4769 ?auto_4774 ) ) ( OBJ-AT ?auto_4772 ?auto_4769 ) ( not ( = ?auto_4772 ?auto_4771 ) ) ( OBJ-AT ?auto_4771 ?auto_4774 ) ( OBJ-AT ?auto_4770 ?auto_4769 ) ( not ( = ?auto_4770 ?auto_4771 ) ) ( not ( = ?auto_4770 ?auto_4772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4772 ?auto_4771 ?auto_4769 )
      ( DELIVER-3PKG-VERIFY ?auto_4770 ?auto_4771 ?auto_4772 ?auto_4769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4784 - OBJ
      ?auto_4785 - OBJ
      ?auto_4786 - OBJ
      ?auto_4783 - LOCATION
    )
    :vars
    (
      ?auto_4789 - TRUCK
      ?auto_4788 - LOCATION
      ?auto_4787 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_4789 ?auto_4788 ) ( IN-CITY ?auto_4788 ?auto_4787 ) ( IN-CITY ?auto_4783 ?auto_4787 ) ( not ( = ?auto_4783 ?auto_4788 ) ) ( OBJ-AT ?auto_4786 ?auto_4783 ) ( not ( = ?auto_4786 ?auto_4784 ) ) ( OBJ-AT ?auto_4784 ?auto_4788 ) ( OBJ-AT ?auto_4785 ?auto_4783 ) ( not ( = ?auto_4784 ?auto_4785 ) ) ( not ( = ?auto_4785 ?auto_4786 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4786 ?auto_4784 ?auto_4783 )
      ( DELIVER-3PKG-VERIFY ?auto_4784 ?auto_4785 ?auto_4786 ?auto_4783 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4813 - OBJ
      ?auto_4812 - LOCATION
    )
    :vars
    (
      ?auto_4816 - LOCATION
      ?auto_4815 - CITY
      ?auto_4814 - OBJ
      ?auto_4817 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4816 ?auto_4815 ) ( IN-CITY ?auto_4812 ?auto_4815 ) ( not ( = ?auto_4812 ?auto_4816 ) ) ( OBJ-AT ?auto_4814 ?auto_4812 ) ( not ( = ?auto_4814 ?auto_4813 ) ) ( OBJ-AT ?auto_4813 ?auto_4816 ) ( TRUCK-AT ?auto_4817 ?auto_4812 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4817 ?auto_4812 ?auto_4816 ?auto_4815 )
      ( DELIVER-2PKG ?auto_4814 ?auto_4813 ?auto_4812 )
      ( DELIVER-1PKG-VERIFY ?auto_4813 ?auto_4812 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4819 - OBJ
      ?auto_4820 - OBJ
      ?auto_4818 - LOCATION
    )
    :vars
    (
      ?auto_4823 - LOCATION
      ?auto_4822 - CITY
      ?auto_4821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4823 ?auto_4822 ) ( IN-CITY ?auto_4818 ?auto_4822 ) ( not ( = ?auto_4818 ?auto_4823 ) ) ( OBJ-AT ?auto_4819 ?auto_4818 ) ( not ( = ?auto_4819 ?auto_4820 ) ) ( OBJ-AT ?auto_4820 ?auto_4823 ) ( TRUCK-AT ?auto_4821 ?auto_4818 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4820 ?auto_4818 )
      ( DELIVER-2PKG-VERIFY ?auto_4819 ?auto_4820 ?auto_4818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4825 - OBJ
      ?auto_4826 - OBJ
      ?auto_4824 - LOCATION
    )
    :vars
    (
      ?auto_4827 - LOCATION
      ?auto_4828 - CITY
      ?auto_4829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4827 ?auto_4828 ) ( IN-CITY ?auto_4824 ?auto_4828 ) ( not ( = ?auto_4824 ?auto_4827 ) ) ( OBJ-AT ?auto_4826 ?auto_4824 ) ( not ( = ?auto_4826 ?auto_4825 ) ) ( OBJ-AT ?auto_4825 ?auto_4827 ) ( TRUCK-AT ?auto_4829 ?auto_4824 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4826 ?auto_4825 ?auto_4824 )
      ( DELIVER-2PKG-VERIFY ?auto_4825 ?auto_4826 ?auto_4824 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4838 - OBJ
      ?auto_4839 - OBJ
      ?auto_4840 - OBJ
      ?auto_4837 - LOCATION
    )
    :vars
    (
      ?auto_4841 - LOCATION
      ?auto_4842 - CITY
      ?auto_4843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4841 ?auto_4842 ) ( IN-CITY ?auto_4837 ?auto_4842 ) ( not ( = ?auto_4837 ?auto_4841 ) ) ( OBJ-AT ?auto_4838 ?auto_4837 ) ( not ( = ?auto_4838 ?auto_4840 ) ) ( OBJ-AT ?auto_4840 ?auto_4841 ) ( TRUCK-AT ?auto_4843 ?auto_4837 ) ( OBJ-AT ?auto_4839 ?auto_4837 ) ( not ( = ?auto_4838 ?auto_4839 ) ) ( not ( = ?auto_4839 ?auto_4840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4838 ?auto_4840 ?auto_4837 )
      ( DELIVER-3PKG-VERIFY ?auto_4838 ?auto_4839 ?auto_4840 ?auto_4837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4845 - OBJ
      ?auto_4846 - OBJ
      ?auto_4847 - OBJ
      ?auto_4844 - LOCATION
    )
    :vars
    (
      ?auto_4848 - LOCATION
      ?auto_4849 - CITY
      ?auto_4850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4848 ?auto_4849 ) ( IN-CITY ?auto_4844 ?auto_4849 ) ( not ( = ?auto_4844 ?auto_4848 ) ) ( OBJ-AT ?auto_4847 ?auto_4844 ) ( not ( = ?auto_4847 ?auto_4846 ) ) ( OBJ-AT ?auto_4846 ?auto_4848 ) ( TRUCK-AT ?auto_4850 ?auto_4844 ) ( OBJ-AT ?auto_4845 ?auto_4844 ) ( not ( = ?auto_4845 ?auto_4846 ) ) ( not ( = ?auto_4845 ?auto_4847 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4847 ?auto_4846 ?auto_4844 )
      ( DELIVER-3PKG-VERIFY ?auto_4845 ?auto_4846 ?auto_4847 ?auto_4844 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4859 - OBJ
      ?auto_4860 - OBJ
      ?auto_4861 - OBJ
      ?auto_4858 - LOCATION
    )
    :vars
    (
      ?auto_4862 - LOCATION
      ?auto_4863 - CITY
      ?auto_4864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4862 ?auto_4863 ) ( IN-CITY ?auto_4858 ?auto_4863 ) ( not ( = ?auto_4858 ?auto_4862 ) ) ( OBJ-AT ?auto_4860 ?auto_4858 ) ( not ( = ?auto_4860 ?auto_4859 ) ) ( OBJ-AT ?auto_4859 ?auto_4862 ) ( TRUCK-AT ?auto_4864 ?auto_4858 ) ( OBJ-AT ?auto_4861 ?auto_4858 ) ( not ( = ?auto_4859 ?auto_4861 ) ) ( not ( = ?auto_4860 ?auto_4861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4860 ?auto_4859 ?auto_4858 )
      ( DELIVER-3PKG-VERIFY ?auto_4859 ?auto_4860 ?auto_4861 ?auto_4858 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4888 - OBJ
      ?auto_4887 - LOCATION
    )
    :vars
    (
      ?auto_4889 - LOCATION
      ?auto_4890 - CITY
      ?auto_4891 - OBJ
      ?auto_4892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4889 ?auto_4890 ) ( IN-CITY ?auto_4887 ?auto_4890 ) ( not ( = ?auto_4887 ?auto_4889 ) ) ( not ( = ?auto_4891 ?auto_4888 ) ) ( OBJ-AT ?auto_4888 ?auto_4889 ) ( TRUCK-AT ?auto_4892 ?auto_4887 ) ( IN-TRUCK ?auto_4891 ?auto_4892 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4891 ?auto_4887 )
      ( DELIVER-2PKG ?auto_4891 ?auto_4888 ?auto_4887 )
      ( DELIVER-1PKG-VERIFY ?auto_4888 ?auto_4887 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4894 - OBJ
      ?auto_4895 - OBJ
      ?auto_4893 - LOCATION
    )
    :vars
    (
      ?auto_4898 - LOCATION
      ?auto_4896 - CITY
      ?auto_4897 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4898 ?auto_4896 ) ( IN-CITY ?auto_4893 ?auto_4896 ) ( not ( = ?auto_4893 ?auto_4898 ) ) ( not ( = ?auto_4894 ?auto_4895 ) ) ( OBJ-AT ?auto_4895 ?auto_4898 ) ( TRUCK-AT ?auto_4897 ?auto_4893 ) ( IN-TRUCK ?auto_4894 ?auto_4897 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4895 ?auto_4893 )
      ( DELIVER-2PKG-VERIFY ?auto_4894 ?auto_4895 ?auto_4893 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4900 - OBJ
      ?auto_4901 - OBJ
      ?auto_4899 - LOCATION
    )
    :vars
    (
      ?auto_4903 - LOCATION
      ?auto_4904 - CITY
      ?auto_4902 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4903 ?auto_4904 ) ( IN-CITY ?auto_4899 ?auto_4904 ) ( not ( = ?auto_4899 ?auto_4903 ) ) ( not ( = ?auto_4901 ?auto_4900 ) ) ( OBJ-AT ?auto_4900 ?auto_4903 ) ( TRUCK-AT ?auto_4902 ?auto_4899 ) ( IN-TRUCK ?auto_4901 ?auto_4902 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4901 ?auto_4900 ?auto_4899 )
      ( DELIVER-2PKG-VERIFY ?auto_4900 ?auto_4901 ?auto_4899 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4963 - OBJ
      ?auto_4962 - LOCATION
    )
    :vars
    (
      ?auto_4965 - LOCATION
      ?auto_4966 - CITY
      ?auto_4967 - OBJ
      ?auto_4964 - TRUCK
      ?auto_4968 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4965 ?auto_4966 ) ( IN-CITY ?auto_4962 ?auto_4966 ) ( not ( = ?auto_4962 ?auto_4965 ) ) ( not ( = ?auto_4967 ?auto_4963 ) ) ( OBJ-AT ?auto_4963 ?auto_4965 ) ( IN-TRUCK ?auto_4967 ?auto_4964 ) ( TRUCK-AT ?auto_4964 ?auto_4968 ) ( IN-CITY ?auto_4968 ?auto_4966 ) ( not ( = ?auto_4962 ?auto_4968 ) ) ( not ( = ?auto_4965 ?auto_4968 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4964 ?auto_4968 ?auto_4962 ?auto_4966 )
      ( DELIVER-2PKG ?auto_4967 ?auto_4963 ?auto_4962 )
      ( DELIVER-1PKG-VERIFY ?auto_4963 ?auto_4962 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4970 - OBJ
      ?auto_4971 - OBJ
      ?auto_4969 - LOCATION
    )
    :vars
    (
      ?auto_4972 - LOCATION
      ?auto_4973 - CITY
      ?auto_4974 - TRUCK
      ?auto_4975 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4972 ?auto_4973 ) ( IN-CITY ?auto_4969 ?auto_4973 ) ( not ( = ?auto_4969 ?auto_4972 ) ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( OBJ-AT ?auto_4971 ?auto_4972 ) ( IN-TRUCK ?auto_4970 ?auto_4974 ) ( TRUCK-AT ?auto_4974 ?auto_4975 ) ( IN-CITY ?auto_4975 ?auto_4973 ) ( not ( = ?auto_4969 ?auto_4975 ) ) ( not ( = ?auto_4972 ?auto_4975 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4971 ?auto_4969 )
      ( DELIVER-2PKG-VERIFY ?auto_4970 ?auto_4971 ?auto_4969 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4977 - OBJ
      ?auto_4978 - OBJ
      ?auto_4976 - LOCATION
    )
    :vars
    (
      ?auto_4980 - LOCATION
      ?auto_4979 - CITY
      ?auto_4981 - TRUCK
      ?auto_4982 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4980 ?auto_4979 ) ( IN-CITY ?auto_4976 ?auto_4979 ) ( not ( = ?auto_4976 ?auto_4980 ) ) ( not ( = ?auto_4978 ?auto_4977 ) ) ( OBJ-AT ?auto_4977 ?auto_4980 ) ( IN-TRUCK ?auto_4978 ?auto_4981 ) ( TRUCK-AT ?auto_4981 ?auto_4982 ) ( IN-CITY ?auto_4982 ?auto_4979 ) ( not ( = ?auto_4976 ?auto_4982 ) ) ( not ( = ?auto_4980 ?auto_4982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4978 ?auto_4977 ?auto_4976 )
      ( DELIVER-2PKG-VERIFY ?auto_4977 ?auto_4978 ?auto_4976 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5049 - OBJ
      ?auto_5048 - LOCATION
    )
    :vars
    (
      ?auto_5052 - LOCATION
      ?auto_5050 - CITY
      ?auto_5051 - OBJ
      ?auto_5053 - TRUCK
      ?auto_5054 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5052 ?auto_5050 ) ( IN-CITY ?auto_5048 ?auto_5050 ) ( not ( = ?auto_5048 ?auto_5052 ) ) ( not ( = ?auto_5051 ?auto_5049 ) ) ( OBJ-AT ?auto_5049 ?auto_5052 ) ( TRUCK-AT ?auto_5053 ?auto_5054 ) ( IN-CITY ?auto_5054 ?auto_5050 ) ( not ( = ?auto_5048 ?auto_5054 ) ) ( not ( = ?auto_5052 ?auto_5054 ) ) ( OBJ-AT ?auto_5051 ?auto_5054 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5051 ?auto_5053 ?auto_5054 )
      ( DELIVER-2PKG ?auto_5051 ?auto_5049 ?auto_5048 )
      ( DELIVER-1PKG-VERIFY ?auto_5049 ?auto_5048 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5056 - OBJ
      ?auto_5057 - OBJ
      ?auto_5055 - LOCATION
    )
    :vars
    (
      ?auto_5060 - LOCATION
      ?auto_5061 - CITY
      ?auto_5058 - TRUCK
      ?auto_5059 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5060 ?auto_5061 ) ( IN-CITY ?auto_5055 ?auto_5061 ) ( not ( = ?auto_5055 ?auto_5060 ) ) ( not ( = ?auto_5056 ?auto_5057 ) ) ( OBJ-AT ?auto_5057 ?auto_5060 ) ( TRUCK-AT ?auto_5058 ?auto_5059 ) ( IN-CITY ?auto_5059 ?auto_5061 ) ( not ( = ?auto_5055 ?auto_5059 ) ) ( not ( = ?auto_5060 ?auto_5059 ) ) ( OBJ-AT ?auto_5056 ?auto_5059 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5057 ?auto_5055 )
      ( DELIVER-2PKG-VERIFY ?auto_5056 ?auto_5057 ?auto_5055 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5063 - OBJ
      ?auto_5064 - OBJ
      ?auto_5062 - LOCATION
    )
    :vars
    (
      ?auto_5066 - LOCATION
      ?auto_5065 - CITY
      ?auto_5068 - TRUCK
      ?auto_5067 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_5066 ?auto_5065 ) ( IN-CITY ?auto_5062 ?auto_5065 ) ( not ( = ?auto_5062 ?auto_5066 ) ) ( not ( = ?auto_5064 ?auto_5063 ) ) ( OBJ-AT ?auto_5063 ?auto_5066 ) ( TRUCK-AT ?auto_5068 ?auto_5067 ) ( IN-CITY ?auto_5067 ?auto_5065 ) ( not ( = ?auto_5062 ?auto_5067 ) ) ( not ( = ?auto_5066 ?auto_5067 ) ) ( OBJ-AT ?auto_5064 ?auto_5067 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5064 ?auto_5063 ?auto_5062 )
      ( DELIVER-2PKG-VERIFY ?auto_5063 ?auto_5064 ?auto_5062 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5135 - OBJ
      ?auto_5134 - LOCATION
    )
    :vars
    (
      ?auto_5137 - LOCATION
      ?auto_5136 - CITY
      ?auto_5140 - OBJ
      ?auto_5138 - LOCATION
      ?auto_5139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5137 ?auto_5136 ) ( IN-CITY ?auto_5134 ?auto_5136 ) ( not ( = ?auto_5134 ?auto_5137 ) ) ( not ( = ?auto_5140 ?auto_5135 ) ) ( OBJ-AT ?auto_5135 ?auto_5137 ) ( IN-CITY ?auto_5138 ?auto_5136 ) ( not ( = ?auto_5134 ?auto_5138 ) ) ( not ( = ?auto_5137 ?auto_5138 ) ) ( OBJ-AT ?auto_5140 ?auto_5138 ) ( TRUCK-AT ?auto_5139 ?auto_5134 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5139 ?auto_5134 ?auto_5138 ?auto_5136 )
      ( DELIVER-2PKG ?auto_5140 ?auto_5135 ?auto_5134 )
      ( DELIVER-1PKG-VERIFY ?auto_5135 ?auto_5134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5142 - OBJ
      ?auto_5143 - OBJ
      ?auto_5141 - LOCATION
    )
    :vars
    (
      ?auto_5147 - LOCATION
      ?auto_5144 - CITY
      ?auto_5145 - LOCATION
      ?auto_5146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5147 ?auto_5144 ) ( IN-CITY ?auto_5141 ?auto_5144 ) ( not ( = ?auto_5141 ?auto_5147 ) ) ( not ( = ?auto_5142 ?auto_5143 ) ) ( OBJ-AT ?auto_5143 ?auto_5147 ) ( IN-CITY ?auto_5145 ?auto_5144 ) ( not ( = ?auto_5141 ?auto_5145 ) ) ( not ( = ?auto_5147 ?auto_5145 ) ) ( OBJ-AT ?auto_5142 ?auto_5145 ) ( TRUCK-AT ?auto_5146 ?auto_5141 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5143 ?auto_5141 )
      ( DELIVER-2PKG-VERIFY ?auto_5142 ?auto_5143 ?auto_5141 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5149 - OBJ
      ?auto_5150 - OBJ
      ?auto_5148 - LOCATION
    )
    :vars
    (
      ?auto_5152 - LOCATION
      ?auto_5154 - CITY
      ?auto_5153 - LOCATION
      ?auto_5151 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5152 ?auto_5154 ) ( IN-CITY ?auto_5148 ?auto_5154 ) ( not ( = ?auto_5148 ?auto_5152 ) ) ( not ( = ?auto_5150 ?auto_5149 ) ) ( OBJ-AT ?auto_5149 ?auto_5152 ) ( IN-CITY ?auto_5153 ?auto_5154 ) ( not ( = ?auto_5148 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( OBJ-AT ?auto_5150 ?auto_5153 ) ( TRUCK-AT ?auto_5151 ?auto_5148 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5150 ?auto_5149 ?auto_5148 )
      ( DELIVER-2PKG-VERIFY ?auto_5149 ?auto_5150 ?auto_5148 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5314 - OBJ
      ?auto_5313 - LOCATION
    )
    :vars
    (
      ?auto_5315 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5315 ?auto_5313 ) ( IN-TRUCK ?auto_5314 ?auto_5315 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_5314 ?auto_5315 ?auto_5313 )
      ( DELIVER-1PKG-VERIFY ?auto_5314 ?auto_5313 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5317 - OBJ
      ?auto_5318 - OBJ
      ?auto_5316 - LOCATION
    )
    :vars
    (
      ?auto_5319 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5319 ?auto_5316 ) ( IN-TRUCK ?auto_5318 ?auto_5319 ) ( OBJ-AT ?auto_5317 ?auto_5316 ) ( not ( = ?auto_5317 ?auto_5318 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5318 ?auto_5316 )
      ( DELIVER-2PKG-VERIFY ?auto_5317 ?auto_5318 ?auto_5316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5321 - OBJ
      ?auto_5322 - OBJ
      ?auto_5320 - LOCATION
    )
    :vars
    (
      ?auto_5323 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5323 ?auto_5320 ) ( IN-TRUCK ?auto_5322 ?auto_5323 ) ( OBJ-AT ?auto_5321 ?auto_5320 ) ( not ( = ?auto_5321 ?auto_5322 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5322 ?auto_5320 )
      ( DELIVER-2PKG-VERIFY ?auto_5321 ?auto_5322 ?auto_5320 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5325 - OBJ
      ?auto_5326 - OBJ
      ?auto_5324 - LOCATION
    )
    :vars
    (
      ?auto_5327 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5327 ?auto_5324 ) ( IN-TRUCK ?auto_5325 ?auto_5327 ) ( OBJ-AT ?auto_5326 ?auto_5324 ) ( not ( = ?auto_5325 ?auto_5326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5325 ?auto_5324 )
      ( DELIVER-2PKG-VERIFY ?auto_5325 ?auto_5326 ?auto_5324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5329 - OBJ
      ?auto_5330 - OBJ
      ?auto_5328 - LOCATION
    )
    :vars
    (
      ?auto_5331 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5331 ?auto_5328 ) ( IN-TRUCK ?auto_5329 ?auto_5331 ) ( OBJ-AT ?auto_5330 ?auto_5328 ) ( not ( = ?auto_5329 ?auto_5330 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5329 ?auto_5328 )
      ( DELIVER-2PKG-VERIFY ?auto_5329 ?auto_5330 ?auto_5328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5337 - OBJ
      ?auto_5338 - OBJ
      ?auto_5339 - OBJ
      ?auto_5336 - LOCATION
    )
    :vars
    (
      ?auto_5340 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5340 ?auto_5336 ) ( IN-TRUCK ?auto_5339 ?auto_5340 ) ( OBJ-AT ?auto_5337 ?auto_5336 ) ( OBJ-AT ?auto_5338 ?auto_5336 ) ( not ( = ?auto_5337 ?auto_5338 ) ) ( not ( = ?auto_5337 ?auto_5339 ) ) ( not ( = ?auto_5338 ?auto_5339 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5339 ?auto_5336 )
      ( DELIVER-3PKG-VERIFY ?auto_5337 ?auto_5338 ?auto_5339 ?auto_5336 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5342 - OBJ
      ?auto_5343 - OBJ
      ?auto_5344 - OBJ
      ?auto_5341 - LOCATION
    )
    :vars
    (
      ?auto_5345 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5345 ?auto_5341 ) ( IN-TRUCK ?auto_5344 ?auto_5345 ) ( OBJ-AT ?auto_5342 ?auto_5341 ) ( OBJ-AT ?auto_5343 ?auto_5341 ) ( not ( = ?auto_5342 ?auto_5343 ) ) ( not ( = ?auto_5342 ?auto_5344 ) ) ( not ( = ?auto_5343 ?auto_5344 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5344 ?auto_5341 )
      ( DELIVER-3PKG-VERIFY ?auto_5342 ?auto_5343 ?auto_5344 ?auto_5341 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5347 - OBJ
      ?auto_5348 - OBJ
      ?auto_5349 - OBJ
      ?auto_5346 - LOCATION
    )
    :vars
    (
      ?auto_5350 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5350 ?auto_5346 ) ( IN-TRUCK ?auto_5348 ?auto_5350 ) ( OBJ-AT ?auto_5347 ?auto_5346 ) ( OBJ-AT ?auto_5349 ?auto_5346 ) ( not ( = ?auto_5347 ?auto_5348 ) ) ( not ( = ?auto_5347 ?auto_5349 ) ) ( not ( = ?auto_5348 ?auto_5349 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5348 ?auto_5346 )
      ( DELIVER-3PKG-VERIFY ?auto_5347 ?auto_5348 ?auto_5349 ?auto_5346 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5352 - OBJ
      ?auto_5353 - OBJ
      ?auto_5354 - OBJ
      ?auto_5351 - LOCATION
    )
    :vars
    (
      ?auto_5355 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5355 ?auto_5351 ) ( IN-TRUCK ?auto_5353 ?auto_5355 ) ( OBJ-AT ?auto_5352 ?auto_5351 ) ( OBJ-AT ?auto_5354 ?auto_5351 ) ( not ( = ?auto_5352 ?auto_5353 ) ) ( not ( = ?auto_5352 ?auto_5354 ) ) ( not ( = ?auto_5353 ?auto_5354 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5353 ?auto_5351 )
      ( DELIVER-3PKG-VERIFY ?auto_5352 ?auto_5353 ?auto_5354 ?auto_5351 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5362 - OBJ
      ?auto_5363 - OBJ
      ?auto_5364 - OBJ
      ?auto_5361 - LOCATION
    )
    :vars
    (
      ?auto_5365 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5365 ?auto_5361 ) ( IN-TRUCK ?auto_5364 ?auto_5365 ) ( OBJ-AT ?auto_5362 ?auto_5361 ) ( OBJ-AT ?auto_5363 ?auto_5361 ) ( not ( = ?auto_5362 ?auto_5363 ) ) ( not ( = ?auto_5362 ?auto_5364 ) ) ( not ( = ?auto_5363 ?auto_5364 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5364 ?auto_5361 )
      ( DELIVER-3PKG-VERIFY ?auto_5362 ?auto_5363 ?auto_5364 ?auto_5361 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5367 - OBJ
      ?auto_5368 - OBJ
      ?auto_5369 - OBJ
      ?auto_5366 - LOCATION
    )
    :vars
    (
      ?auto_5370 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5370 ?auto_5366 ) ( IN-TRUCK ?auto_5369 ?auto_5370 ) ( OBJ-AT ?auto_5367 ?auto_5366 ) ( OBJ-AT ?auto_5368 ?auto_5366 ) ( not ( = ?auto_5367 ?auto_5368 ) ) ( not ( = ?auto_5367 ?auto_5369 ) ) ( not ( = ?auto_5368 ?auto_5369 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5369 ?auto_5366 )
      ( DELIVER-3PKG-VERIFY ?auto_5367 ?auto_5368 ?auto_5369 ?auto_5366 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5372 - OBJ
      ?auto_5373 - OBJ
      ?auto_5374 - OBJ
      ?auto_5371 - LOCATION
    )
    :vars
    (
      ?auto_5375 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5375 ?auto_5371 ) ( IN-TRUCK ?auto_5373 ?auto_5375 ) ( OBJ-AT ?auto_5372 ?auto_5371 ) ( OBJ-AT ?auto_5374 ?auto_5371 ) ( not ( = ?auto_5372 ?auto_5373 ) ) ( not ( = ?auto_5372 ?auto_5374 ) ) ( not ( = ?auto_5373 ?auto_5374 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5373 ?auto_5371 )
      ( DELIVER-3PKG-VERIFY ?auto_5372 ?auto_5373 ?auto_5374 ?auto_5371 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5377 - OBJ
      ?auto_5378 - OBJ
      ?auto_5379 - OBJ
      ?auto_5376 - LOCATION
    )
    :vars
    (
      ?auto_5380 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5380 ?auto_5376 ) ( IN-TRUCK ?auto_5378 ?auto_5380 ) ( OBJ-AT ?auto_5377 ?auto_5376 ) ( OBJ-AT ?auto_5379 ?auto_5376 ) ( not ( = ?auto_5377 ?auto_5378 ) ) ( not ( = ?auto_5377 ?auto_5379 ) ) ( not ( = ?auto_5378 ?auto_5379 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5378 ?auto_5376 )
      ( DELIVER-3PKG-VERIFY ?auto_5377 ?auto_5378 ?auto_5379 ?auto_5376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5387 - OBJ
      ?auto_5388 - OBJ
      ?auto_5389 - OBJ
      ?auto_5386 - LOCATION
    )
    :vars
    (
      ?auto_5390 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5390 ?auto_5386 ) ( IN-TRUCK ?auto_5387 ?auto_5390 ) ( OBJ-AT ?auto_5388 ?auto_5386 ) ( OBJ-AT ?auto_5389 ?auto_5386 ) ( not ( = ?auto_5387 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5389 ) ) ( not ( = ?auto_5388 ?auto_5389 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5387 ?auto_5386 )
      ( DELIVER-3PKG-VERIFY ?auto_5387 ?auto_5388 ?auto_5389 ?auto_5386 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5392 - OBJ
      ?auto_5393 - OBJ
      ?auto_5394 - OBJ
      ?auto_5391 - LOCATION
    )
    :vars
    (
      ?auto_5395 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5395 ?auto_5391 ) ( IN-TRUCK ?auto_5392 ?auto_5395 ) ( OBJ-AT ?auto_5393 ?auto_5391 ) ( OBJ-AT ?auto_5394 ?auto_5391 ) ( not ( = ?auto_5392 ?auto_5393 ) ) ( not ( = ?auto_5392 ?auto_5394 ) ) ( not ( = ?auto_5393 ?auto_5394 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5392 ?auto_5391 )
      ( DELIVER-3PKG-VERIFY ?auto_5392 ?auto_5393 ?auto_5394 ?auto_5391 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5402 - OBJ
      ?auto_5403 - OBJ
      ?auto_5404 - OBJ
      ?auto_5401 - LOCATION
    )
    :vars
    (
      ?auto_5405 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5405 ?auto_5401 ) ( IN-TRUCK ?auto_5402 ?auto_5405 ) ( OBJ-AT ?auto_5403 ?auto_5401 ) ( OBJ-AT ?auto_5404 ?auto_5401 ) ( not ( = ?auto_5402 ?auto_5403 ) ) ( not ( = ?auto_5402 ?auto_5404 ) ) ( not ( = ?auto_5403 ?auto_5404 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5402 ?auto_5401 )
      ( DELIVER-3PKG-VERIFY ?auto_5402 ?auto_5403 ?auto_5404 ?auto_5401 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5407 - OBJ
      ?auto_5408 - OBJ
      ?auto_5409 - OBJ
      ?auto_5406 - LOCATION
    )
    :vars
    (
      ?auto_5410 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5410 ?auto_5406 ) ( IN-TRUCK ?auto_5407 ?auto_5410 ) ( OBJ-AT ?auto_5408 ?auto_5406 ) ( OBJ-AT ?auto_5409 ?auto_5406 ) ( not ( = ?auto_5407 ?auto_5408 ) ) ( not ( = ?auto_5407 ?auto_5409 ) ) ( not ( = ?auto_5408 ?auto_5409 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5407 ?auto_5406 )
      ( DELIVER-3PKG-VERIFY ?auto_5407 ?auto_5408 ?auto_5409 ?auto_5406 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5432 - OBJ
      ?auto_5431 - LOCATION
    )
    :vars
    (
      ?auto_5433 - TRUCK
      ?auto_5434 - LOCATION
      ?auto_5435 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5432 ?auto_5433 ) ( TRUCK-AT ?auto_5433 ?auto_5434 ) ( IN-CITY ?auto_5434 ?auto_5435 ) ( IN-CITY ?auto_5431 ?auto_5435 ) ( not ( = ?auto_5431 ?auto_5434 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5433 ?auto_5434 ?auto_5431 ?auto_5435 )
      ( DELIVER-1PKG ?auto_5432 ?auto_5431 )
      ( DELIVER-1PKG-VERIFY ?auto_5432 ?auto_5431 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5437 - OBJ
      ?auto_5438 - OBJ
      ?auto_5436 - LOCATION
    )
    :vars
    (
      ?auto_5441 - TRUCK
      ?auto_5440 - LOCATION
      ?auto_5439 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5438 ?auto_5441 ) ( TRUCK-AT ?auto_5441 ?auto_5440 ) ( IN-CITY ?auto_5440 ?auto_5439 ) ( IN-CITY ?auto_5436 ?auto_5439 ) ( not ( = ?auto_5436 ?auto_5440 ) ) ( OBJ-AT ?auto_5437 ?auto_5436 ) ( not ( = ?auto_5437 ?auto_5438 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5438 ?auto_5436 )
      ( DELIVER-2PKG-VERIFY ?auto_5437 ?auto_5438 ?auto_5436 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5443 - OBJ
      ?auto_5444 - OBJ
      ?auto_5442 - LOCATION
    )
    :vars
    (
      ?auto_5446 - TRUCK
      ?auto_5447 - LOCATION
      ?auto_5448 - CITY
      ?auto_5445 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5444 ?auto_5446 ) ( TRUCK-AT ?auto_5446 ?auto_5447 ) ( IN-CITY ?auto_5447 ?auto_5448 ) ( IN-CITY ?auto_5442 ?auto_5448 ) ( not ( = ?auto_5442 ?auto_5447 ) ) ( OBJ-AT ?auto_5445 ?auto_5442 ) ( not ( = ?auto_5445 ?auto_5444 ) ) ( OBJ-AT ?auto_5443 ?auto_5442 ) ( not ( = ?auto_5443 ?auto_5444 ) ) ( not ( = ?auto_5443 ?auto_5445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5445 ?auto_5444 ?auto_5442 )
      ( DELIVER-2PKG-VERIFY ?auto_5443 ?auto_5444 ?auto_5442 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5450 - OBJ
      ?auto_5451 - OBJ
      ?auto_5449 - LOCATION
    )
    :vars
    (
      ?auto_5452 - TRUCK
      ?auto_5453 - LOCATION
      ?auto_5454 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5450 ?auto_5452 ) ( TRUCK-AT ?auto_5452 ?auto_5453 ) ( IN-CITY ?auto_5453 ?auto_5454 ) ( IN-CITY ?auto_5449 ?auto_5454 ) ( not ( = ?auto_5449 ?auto_5453 ) ) ( OBJ-AT ?auto_5451 ?auto_5449 ) ( not ( = ?auto_5451 ?auto_5450 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5451 ?auto_5450 ?auto_5449 )
      ( DELIVER-2PKG-VERIFY ?auto_5450 ?auto_5451 ?auto_5449 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5456 - OBJ
      ?auto_5457 - OBJ
      ?auto_5455 - LOCATION
    )
    :vars
    (
      ?auto_5459 - TRUCK
      ?auto_5460 - LOCATION
      ?auto_5461 - CITY
      ?auto_5458 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5456 ?auto_5459 ) ( TRUCK-AT ?auto_5459 ?auto_5460 ) ( IN-CITY ?auto_5460 ?auto_5461 ) ( IN-CITY ?auto_5455 ?auto_5461 ) ( not ( = ?auto_5455 ?auto_5460 ) ) ( OBJ-AT ?auto_5458 ?auto_5455 ) ( not ( = ?auto_5458 ?auto_5456 ) ) ( OBJ-AT ?auto_5457 ?auto_5455 ) ( not ( = ?auto_5456 ?auto_5457 ) ) ( not ( = ?auto_5457 ?auto_5458 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5458 ?auto_5456 ?auto_5455 )
      ( DELIVER-2PKG-VERIFY ?auto_5456 ?auto_5457 ?auto_5455 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5470 - OBJ
      ?auto_5471 - OBJ
      ?auto_5472 - OBJ
      ?auto_5469 - LOCATION
    )
    :vars
    (
      ?auto_5473 - TRUCK
      ?auto_5474 - LOCATION
      ?auto_5475 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5472 ?auto_5473 ) ( TRUCK-AT ?auto_5473 ?auto_5474 ) ( IN-CITY ?auto_5474 ?auto_5475 ) ( IN-CITY ?auto_5469 ?auto_5475 ) ( not ( = ?auto_5469 ?auto_5474 ) ) ( OBJ-AT ?auto_5471 ?auto_5469 ) ( not ( = ?auto_5471 ?auto_5472 ) ) ( OBJ-AT ?auto_5470 ?auto_5469 ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( not ( = ?auto_5470 ?auto_5472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5471 ?auto_5472 ?auto_5469 )
      ( DELIVER-3PKG-VERIFY ?auto_5470 ?auto_5471 ?auto_5472 ?auto_5469 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5477 - OBJ
      ?auto_5478 - OBJ
      ?auto_5479 - OBJ
      ?auto_5476 - LOCATION
    )
    :vars
    (
      ?auto_5480 - TRUCK
      ?auto_5481 - LOCATION
      ?auto_5482 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5479 ?auto_5480 ) ( TRUCK-AT ?auto_5480 ?auto_5481 ) ( IN-CITY ?auto_5481 ?auto_5482 ) ( IN-CITY ?auto_5476 ?auto_5482 ) ( not ( = ?auto_5476 ?auto_5481 ) ) ( OBJ-AT ?auto_5477 ?auto_5476 ) ( not ( = ?auto_5477 ?auto_5479 ) ) ( OBJ-AT ?auto_5478 ?auto_5476 ) ( not ( = ?auto_5477 ?auto_5478 ) ) ( not ( = ?auto_5478 ?auto_5479 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5477 ?auto_5479 ?auto_5476 )
      ( DELIVER-3PKG-VERIFY ?auto_5477 ?auto_5478 ?auto_5479 ?auto_5476 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5484 - OBJ
      ?auto_5485 - OBJ
      ?auto_5486 - OBJ
      ?auto_5483 - LOCATION
    )
    :vars
    (
      ?auto_5487 - TRUCK
      ?auto_5488 - LOCATION
      ?auto_5489 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5485 ?auto_5487 ) ( TRUCK-AT ?auto_5487 ?auto_5488 ) ( IN-CITY ?auto_5488 ?auto_5489 ) ( IN-CITY ?auto_5483 ?auto_5489 ) ( not ( = ?auto_5483 ?auto_5488 ) ) ( OBJ-AT ?auto_5486 ?auto_5483 ) ( not ( = ?auto_5486 ?auto_5485 ) ) ( OBJ-AT ?auto_5484 ?auto_5483 ) ( not ( = ?auto_5484 ?auto_5485 ) ) ( not ( = ?auto_5484 ?auto_5486 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5486 ?auto_5485 ?auto_5483 )
      ( DELIVER-3PKG-VERIFY ?auto_5484 ?auto_5485 ?auto_5486 ?auto_5483 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5491 - OBJ
      ?auto_5492 - OBJ
      ?auto_5493 - OBJ
      ?auto_5490 - LOCATION
    )
    :vars
    (
      ?auto_5494 - TRUCK
      ?auto_5495 - LOCATION
      ?auto_5496 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5492 ?auto_5494 ) ( TRUCK-AT ?auto_5494 ?auto_5495 ) ( IN-CITY ?auto_5495 ?auto_5496 ) ( IN-CITY ?auto_5490 ?auto_5496 ) ( not ( = ?auto_5490 ?auto_5495 ) ) ( OBJ-AT ?auto_5491 ?auto_5490 ) ( not ( = ?auto_5491 ?auto_5492 ) ) ( OBJ-AT ?auto_5493 ?auto_5490 ) ( not ( = ?auto_5491 ?auto_5493 ) ) ( not ( = ?auto_5492 ?auto_5493 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5491 ?auto_5492 ?auto_5490 )
      ( DELIVER-3PKG-VERIFY ?auto_5491 ?auto_5492 ?auto_5493 ?auto_5490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5505 - OBJ
      ?auto_5506 - OBJ
      ?auto_5507 - OBJ
      ?auto_5504 - LOCATION
    )
    :vars
    (
      ?auto_5508 - TRUCK
      ?auto_5509 - LOCATION
      ?auto_5510 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5507 ?auto_5508 ) ( TRUCK-AT ?auto_5508 ?auto_5509 ) ( IN-CITY ?auto_5509 ?auto_5510 ) ( IN-CITY ?auto_5504 ?auto_5510 ) ( not ( = ?auto_5504 ?auto_5509 ) ) ( OBJ-AT ?auto_5506 ?auto_5504 ) ( not ( = ?auto_5506 ?auto_5507 ) ) ( OBJ-AT ?auto_5505 ?auto_5504 ) ( not ( = ?auto_5505 ?auto_5506 ) ) ( not ( = ?auto_5505 ?auto_5507 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5506 ?auto_5507 ?auto_5504 )
      ( DELIVER-3PKG-VERIFY ?auto_5505 ?auto_5506 ?auto_5507 ?auto_5504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5512 - OBJ
      ?auto_5513 - OBJ
      ?auto_5514 - OBJ
      ?auto_5511 - LOCATION
    )
    :vars
    (
      ?auto_5516 - TRUCK
      ?auto_5517 - LOCATION
      ?auto_5518 - CITY
      ?auto_5515 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5514 ?auto_5516 ) ( TRUCK-AT ?auto_5516 ?auto_5517 ) ( IN-CITY ?auto_5517 ?auto_5518 ) ( IN-CITY ?auto_5511 ?auto_5518 ) ( not ( = ?auto_5511 ?auto_5517 ) ) ( OBJ-AT ?auto_5515 ?auto_5511 ) ( not ( = ?auto_5515 ?auto_5514 ) ) ( OBJ-AT ?auto_5512 ?auto_5511 ) ( OBJ-AT ?auto_5513 ?auto_5511 ) ( not ( = ?auto_5512 ?auto_5513 ) ) ( not ( = ?auto_5512 ?auto_5514 ) ) ( not ( = ?auto_5512 ?auto_5515 ) ) ( not ( = ?auto_5513 ?auto_5514 ) ) ( not ( = ?auto_5513 ?auto_5515 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5515 ?auto_5514 ?auto_5511 )
      ( DELIVER-3PKG-VERIFY ?auto_5512 ?auto_5513 ?auto_5514 ?auto_5511 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5520 - OBJ
      ?auto_5521 - OBJ
      ?auto_5522 - OBJ
      ?auto_5519 - LOCATION
    )
    :vars
    (
      ?auto_5523 - TRUCK
      ?auto_5524 - LOCATION
      ?auto_5525 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5521 ?auto_5523 ) ( TRUCK-AT ?auto_5523 ?auto_5524 ) ( IN-CITY ?auto_5524 ?auto_5525 ) ( IN-CITY ?auto_5519 ?auto_5525 ) ( not ( = ?auto_5519 ?auto_5524 ) ) ( OBJ-AT ?auto_5522 ?auto_5519 ) ( not ( = ?auto_5522 ?auto_5521 ) ) ( OBJ-AT ?auto_5520 ?auto_5519 ) ( not ( = ?auto_5520 ?auto_5521 ) ) ( not ( = ?auto_5520 ?auto_5522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5522 ?auto_5521 ?auto_5519 )
      ( DELIVER-3PKG-VERIFY ?auto_5520 ?auto_5521 ?auto_5522 ?auto_5519 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5527 - OBJ
      ?auto_5528 - OBJ
      ?auto_5529 - OBJ
      ?auto_5526 - LOCATION
    )
    :vars
    (
      ?auto_5531 - TRUCK
      ?auto_5532 - LOCATION
      ?auto_5533 - CITY
      ?auto_5530 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5528 ?auto_5531 ) ( TRUCK-AT ?auto_5531 ?auto_5532 ) ( IN-CITY ?auto_5532 ?auto_5533 ) ( IN-CITY ?auto_5526 ?auto_5533 ) ( not ( = ?auto_5526 ?auto_5532 ) ) ( OBJ-AT ?auto_5530 ?auto_5526 ) ( not ( = ?auto_5530 ?auto_5528 ) ) ( OBJ-AT ?auto_5527 ?auto_5526 ) ( OBJ-AT ?auto_5529 ?auto_5526 ) ( not ( = ?auto_5527 ?auto_5528 ) ) ( not ( = ?auto_5527 ?auto_5529 ) ) ( not ( = ?auto_5527 ?auto_5530 ) ) ( not ( = ?auto_5528 ?auto_5529 ) ) ( not ( = ?auto_5529 ?auto_5530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5530 ?auto_5528 ?auto_5526 )
      ( DELIVER-3PKG-VERIFY ?auto_5527 ?auto_5528 ?auto_5529 ?auto_5526 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5543 - OBJ
      ?auto_5544 - OBJ
      ?auto_5545 - OBJ
      ?auto_5542 - LOCATION
    )
    :vars
    (
      ?auto_5546 - TRUCK
      ?auto_5547 - LOCATION
      ?auto_5548 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5543 ?auto_5546 ) ( TRUCK-AT ?auto_5546 ?auto_5547 ) ( IN-CITY ?auto_5547 ?auto_5548 ) ( IN-CITY ?auto_5542 ?auto_5548 ) ( not ( = ?auto_5542 ?auto_5547 ) ) ( OBJ-AT ?auto_5545 ?auto_5542 ) ( not ( = ?auto_5545 ?auto_5543 ) ) ( OBJ-AT ?auto_5544 ?auto_5542 ) ( not ( = ?auto_5543 ?auto_5544 ) ) ( not ( = ?auto_5544 ?auto_5545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5545 ?auto_5543 ?auto_5542 )
      ( DELIVER-3PKG-VERIFY ?auto_5543 ?auto_5544 ?auto_5545 ?auto_5542 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5550 - OBJ
      ?auto_5551 - OBJ
      ?auto_5552 - OBJ
      ?auto_5549 - LOCATION
    )
    :vars
    (
      ?auto_5553 - TRUCK
      ?auto_5554 - LOCATION
      ?auto_5555 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5550 ?auto_5553 ) ( TRUCK-AT ?auto_5553 ?auto_5554 ) ( IN-CITY ?auto_5554 ?auto_5555 ) ( IN-CITY ?auto_5549 ?auto_5555 ) ( not ( = ?auto_5549 ?auto_5554 ) ) ( OBJ-AT ?auto_5551 ?auto_5549 ) ( not ( = ?auto_5551 ?auto_5550 ) ) ( OBJ-AT ?auto_5552 ?auto_5549 ) ( not ( = ?auto_5550 ?auto_5552 ) ) ( not ( = ?auto_5551 ?auto_5552 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5551 ?auto_5550 ?auto_5549 )
      ( DELIVER-3PKG-VERIFY ?auto_5550 ?auto_5551 ?auto_5552 ?auto_5549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5564 - OBJ
      ?auto_5565 - OBJ
      ?auto_5566 - OBJ
      ?auto_5563 - LOCATION
    )
    :vars
    (
      ?auto_5567 - TRUCK
      ?auto_5568 - LOCATION
      ?auto_5569 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5564 ?auto_5567 ) ( TRUCK-AT ?auto_5567 ?auto_5568 ) ( IN-CITY ?auto_5568 ?auto_5569 ) ( IN-CITY ?auto_5563 ?auto_5569 ) ( not ( = ?auto_5563 ?auto_5568 ) ) ( OBJ-AT ?auto_5566 ?auto_5563 ) ( not ( = ?auto_5566 ?auto_5564 ) ) ( OBJ-AT ?auto_5565 ?auto_5563 ) ( not ( = ?auto_5564 ?auto_5565 ) ) ( not ( = ?auto_5565 ?auto_5566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5566 ?auto_5564 ?auto_5563 )
      ( DELIVER-3PKG-VERIFY ?auto_5564 ?auto_5565 ?auto_5566 ?auto_5563 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5571 - OBJ
      ?auto_5572 - OBJ
      ?auto_5573 - OBJ
      ?auto_5570 - LOCATION
    )
    :vars
    (
      ?auto_5575 - TRUCK
      ?auto_5576 - LOCATION
      ?auto_5577 - CITY
      ?auto_5574 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_5571 ?auto_5575 ) ( TRUCK-AT ?auto_5575 ?auto_5576 ) ( IN-CITY ?auto_5576 ?auto_5577 ) ( IN-CITY ?auto_5570 ?auto_5577 ) ( not ( = ?auto_5570 ?auto_5576 ) ) ( OBJ-AT ?auto_5574 ?auto_5570 ) ( not ( = ?auto_5574 ?auto_5571 ) ) ( OBJ-AT ?auto_5572 ?auto_5570 ) ( OBJ-AT ?auto_5573 ?auto_5570 ) ( not ( = ?auto_5571 ?auto_5572 ) ) ( not ( = ?auto_5571 ?auto_5573 ) ) ( not ( = ?auto_5572 ?auto_5573 ) ) ( not ( = ?auto_5572 ?auto_5574 ) ) ( not ( = ?auto_5573 ?auto_5574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5574 ?auto_5571 ?auto_5570 )
      ( DELIVER-3PKG-VERIFY ?auto_5571 ?auto_5572 ?auto_5573 ?auto_5570 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5610 - OBJ
      ?auto_5609 - LOCATION
    )
    :vars
    (
      ?auto_5612 - TRUCK
      ?auto_5613 - LOCATION
      ?auto_5614 - CITY
      ?auto_5611 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5612 ?auto_5613 ) ( IN-CITY ?auto_5613 ?auto_5614 ) ( IN-CITY ?auto_5609 ?auto_5614 ) ( not ( = ?auto_5609 ?auto_5613 ) ) ( OBJ-AT ?auto_5611 ?auto_5609 ) ( not ( = ?auto_5611 ?auto_5610 ) ) ( OBJ-AT ?auto_5610 ?auto_5613 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_5610 ?auto_5612 ?auto_5613 )
      ( DELIVER-2PKG ?auto_5611 ?auto_5610 ?auto_5609 )
      ( DELIVER-1PKG-VERIFY ?auto_5610 ?auto_5609 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5616 - OBJ
      ?auto_5617 - OBJ
      ?auto_5615 - LOCATION
    )
    :vars
    (
      ?auto_5618 - TRUCK
      ?auto_5619 - LOCATION
      ?auto_5620 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5618 ?auto_5619 ) ( IN-CITY ?auto_5619 ?auto_5620 ) ( IN-CITY ?auto_5615 ?auto_5620 ) ( not ( = ?auto_5615 ?auto_5619 ) ) ( OBJ-AT ?auto_5616 ?auto_5615 ) ( not ( = ?auto_5616 ?auto_5617 ) ) ( OBJ-AT ?auto_5617 ?auto_5619 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5617 ?auto_5615 )
      ( DELIVER-2PKG-VERIFY ?auto_5616 ?auto_5617 ?auto_5615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5622 - OBJ
      ?auto_5623 - OBJ
      ?auto_5621 - LOCATION
    )
    :vars
    (
      ?auto_5626 - TRUCK
      ?auto_5625 - LOCATION
      ?auto_5624 - CITY
      ?auto_5627 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5626 ?auto_5625 ) ( IN-CITY ?auto_5625 ?auto_5624 ) ( IN-CITY ?auto_5621 ?auto_5624 ) ( not ( = ?auto_5621 ?auto_5625 ) ) ( OBJ-AT ?auto_5627 ?auto_5621 ) ( not ( = ?auto_5627 ?auto_5623 ) ) ( OBJ-AT ?auto_5623 ?auto_5625 ) ( OBJ-AT ?auto_5622 ?auto_5621 ) ( not ( = ?auto_5622 ?auto_5623 ) ) ( not ( = ?auto_5622 ?auto_5627 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5627 ?auto_5623 ?auto_5621 )
      ( DELIVER-2PKG-VERIFY ?auto_5622 ?auto_5623 ?auto_5621 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5629 - OBJ
      ?auto_5630 - OBJ
      ?auto_5628 - LOCATION
    )
    :vars
    (
      ?auto_5633 - TRUCK
      ?auto_5632 - LOCATION
      ?auto_5631 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5633 ?auto_5632 ) ( IN-CITY ?auto_5632 ?auto_5631 ) ( IN-CITY ?auto_5628 ?auto_5631 ) ( not ( = ?auto_5628 ?auto_5632 ) ) ( OBJ-AT ?auto_5630 ?auto_5628 ) ( not ( = ?auto_5630 ?auto_5629 ) ) ( OBJ-AT ?auto_5629 ?auto_5632 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5630 ?auto_5629 ?auto_5628 )
      ( DELIVER-2PKG-VERIFY ?auto_5629 ?auto_5630 ?auto_5628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5635 - OBJ
      ?auto_5636 - OBJ
      ?auto_5634 - LOCATION
    )
    :vars
    (
      ?auto_5639 - TRUCK
      ?auto_5638 - LOCATION
      ?auto_5637 - CITY
      ?auto_5640 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5639 ?auto_5638 ) ( IN-CITY ?auto_5638 ?auto_5637 ) ( IN-CITY ?auto_5634 ?auto_5637 ) ( not ( = ?auto_5634 ?auto_5638 ) ) ( OBJ-AT ?auto_5640 ?auto_5634 ) ( not ( = ?auto_5640 ?auto_5635 ) ) ( OBJ-AT ?auto_5635 ?auto_5638 ) ( OBJ-AT ?auto_5636 ?auto_5634 ) ( not ( = ?auto_5635 ?auto_5636 ) ) ( not ( = ?auto_5636 ?auto_5640 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5640 ?auto_5635 ?auto_5634 )
      ( DELIVER-2PKG-VERIFY ?auto_5635 ?auto_5636 ?auto_5634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5649 - OBJ
      ?auto_5650 - OBJ
      ?auto_5651 - OBJ
      ?auto_5648 - LOCATION
    )
    :vars
    (
      ?auto_5654 - TRUCK
      ?auto_5653 - LOCATION
      ?auto_5652 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5654 ?auto_5653 ) ( IN-CITY ?auto_5653 ?auto_5652 ) ( IN-CITY ?auto_5648 ?auto_5652 ) ( not ( = ?auto_5648 ?auto_5653 ) ) ( OBJ-AT ?auto_5650 ?auto_5648 ) ( not ( = ?auto_5650 ?auto_5651 ) ) ( OBJ-AT ?auto_5651 ?auto_5653 ) ( OBJ-AT ?auto_5649 ?auto_5648 ) ( not ( = ?auto_5649 ?auto_5650 ) ) ( not ( = ?auto_5649 ?auto_5651 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5650 ?auto_5651 ?auto_5648 )
      ( DELIVER-3PKG-VERIFY ?auto_5649 ?auto_5650 ?auto_5651 ?auto_5648 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5656 - OBJ
      ?auto_5657 - OBJ
      ?auto_5658 - OBJ
      ?auto_5655 - LOCATION
    )
    :vars
    (
      ?auto_5661 - TRUCK
      ?auto_5660 - LOCATION
      ?auto_5659 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5661 ?auto_5660 ) ( IN-CITY ?auto_5660 ?auto_5659 ) ( IN-CITY ?auto_5655 ?auto_5659 ) ( not ( = ?auto_5655 ?auto_5660 ) ) ( OBJ-AT ?auto_5656 ?auto_5655 ) ( not ( = ?auto_5656 ?auto_5658 ) ) ( OBJ-AT ?auto_5658 ?auto_5660 ) ( OBJ-AT ?auto_5657 ?auto_5655 ) ( not ( = ?auto_5656 ?auto_5657 ) ) ( not ( = ?auto_5657 ?auto_5658 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5656 ?auto_5658 ?auto_5655 )
      ( DELIVER-3PKG-VERIFY ?auto_5656 ?auto_5657 ?auto_5658 ?auto_5655 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5663 - OBJ
      ?auto_5664 - OBJ
      ?auto_5665 - OBJ
      ?auto_5662 - LOCATION
    )
    :vars
    (
      ?auto_5668 - TRUCK
      ?auto_5667 - LOCATION
      ?auto_5666 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5668 ?auto_5667 ) ( IN-CITY ?auto_5667 ?auto_5666 ) ( IN-CITY ?auto_5662 ?auto_5666 ) ( not ( = ?auto_5662 ?auto_5667 ) ) ( OBJ-AT ?auto_5665 ?auto_5662 ) ( not ( = ?auto_5665 ?auto_5664 ) ) ( OBJ-AT ?auto_5664 ?auto_5667 ) ( OBJ-AT ?auto_5663 ?auto_5662 ) ( not ( = ?auto_5663 ?auto_5664 ) ) ( not ( = ?auto_5663 ?auto_5665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5665 ?auto_5664 ?auto_5662 )
      ( DELIVER-3PKG-VERIFY ?auto_5663 ?auto_5664 ?auto_5665 ?auto_5662 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5670 - OBJ
      ?auto_5671 - OBJ
      ?auto_5672 - OBJ
      ?auto_5669 - LOCATION
    )
    :vars
    (
      ?auto_5675 - TRUCK
      ?auto_5674 - LOCATION
      ?auto_5673 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5675 ?auto_5674 ) ( IN-CITY ?auto_5674 ?auto_5673 ) ( IN-CITY ?auto_5669 ?auto_5673 ) ( not ( = ?auto_5669 ?auto_5674 ) ) ( OBJ-AT ?auto_5670 ?auto_5669 ) ( not ( = ?auto_5670 ?auto_5671 ) ) ( OBJ-AT ?auto_5671 ?auto_5674 ) ( OBJ-AT ?auto_5672 ?auto_5669 ) ( not ( = ?auto_5670 ?auto_5672 ) ) ( not ( = ?auto_5671 ?auto_5672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5670 ?auto_5671 ?auto_5669 )
      ( DELIVER-3PKG-VERIFY ?auto_5670 ?auto_5671 ?auto_5672 ?auto_5669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5684 - OBJ
      ?auto_5685 - OBJ
      ?auto_5686 - OBJ
      ?auto_5683 - LOCATION
    )
    :vars
    (
      ?auto_5689 - TRUCK
      ?auto_5688 - LOCATION
      ?auto_5687 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5689 ?auto_5688 ) ( IN-CITY ?auto_5688 ?auto_5687 ) ( IN-CITY ?auto_5683 ?auto_5687 ) ( not ( = ?auto_5683 ?auto_5688 ) ) ( OBJ-AT ?auto_5685 ?auto_5683 ) ( not ( = ?auto_5685 ?auto_5686 ) ) ( OBJ-AT ?auto_5686 ?auto_5688 ) ( OBJ-AT ?auto_5684 ?auto_5683 ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5685 ?auto_5686 ?auto_5683 )
      ( DELIVER-3PKG-VERIFY ?auto_5684 ?auto_5685 ?auto_5686 ?auto_5683 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5691 - OBJ
      ?auto_5692 - OBJ
      ?auto_5693 - OBJ
      ?auto_5690 - LOCATION
    )
    :vars
    (
      ?auto_5696 - TRUCK
      ?auto_5695 - LOCATION
      ?auto_5694 - CITY
      ?auto_5697 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5696 ?auto_5695 ) ( IN-CITY ?auto_5695 ?auto_5694 ) ( IN-CITY ?auto_5690 ?auto_5694 ) ( not ( = ?auto_5690 ?auto_5695 ) ) ( OBJ-AT ?auto_5697 ?auto_5690 ) ( not ( = ?auto_5697 ?auto_5693 ) ) ( OBJ-AT ?auto_5693 ?auto_5695 ) ( OBJ-AT ?auto_5691 ?auto_5690 ) ( OBJ-AT ?auto_5692 ?auto_5690 ) ( not ( = ?auto_5691 ?auto_5692 ) ) ( not ( = ?auto_5691 ?auto_5693 ) ) ( not ( = ?auto_5691 ?auto_5697 ) ) ( not ( = ?auto_5692 ?auto_5693 ) ) ( not ( = ?auto_5692 ?auto_5697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5697 ?auto_5693 ?auto_5690 )
      ( DELIVER-3PKG-VERIFY ?auto_5691 ?auto_5692 ?auto_5693 ?auto_5690 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5699 - OBJ
      ?auto_5700 - OBJ
      ?auto_5701 - OBJ
      ?auto_5698 - LOCATION
    )
    :vars
    (
      ?auto_5704 - TRUCK
      ?auto_5703 - LOCATION
      ?auto_5702 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5704 ?auto_5703 ) ( IN-CITY ?auto_5703 ?auto_5702 ) ( IN-CITY ?auto_5698 ?auto_5702 ) ( not ( = ?auto_5698 ?auto_5703 ) ) ( OBJ-AT ?auto_5701 ?auto_5698 ) ( not ( = ?auto_5701 ?auto_5700 ) ) ( OBJ-AT ?auto_5700 ?auto_5703 ) ( OBJ-AT ?auto_5699 ?auto_5698 ) ( not ( = ?auto_5699 ?auto_5700 ) ) ( not ( = ?auto_5699 ?auto_5701 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5701 ?auto_5700 ?auto_5698 )
      ( DELIVER-3PKG-VERIFY ?auto_5699 ?auto_5700 ?auto_5701 ?auto_5698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5706 - OBJ
      ?auto_5707 - OBJ
      ?auto_5708 - OBJ
      ?auto_5705 - LOCATION
    )
    :vars
    (
      ?auto_5711 - TRUCK
      ?auto_5710 - LOCATION
      ?auto_5709 - CITY
      ?auto_5712 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5711 ?auto_5710 ) ( IN-CITY ?auto_5710 ?auto_5709 ) ( IN-CITY ?auto_5705 ?auto_5709 ) ( not ( = ?auto_5705 ?auto_5710 ) ) ( OBJ-AT ?auto_5712 ?auto_5705 ) ( not ( = ?auto_5712 ?auto_5707 ) ) ( OBJ-AT ?auto_5707 ?auto_5710 ) ( OBJ-AT ?auto_5706 ?auto_5705 ) ( OBJ-AT ?auto_5708 ?auto_5705 ) ( not ( = ?auto_5706 ?auto_5707 ) ) ( not ( = ?auto_5706 ?auto_5708 ) ) ( not ( = ?auto_5706 ?auto_5712 ) ) ( not ( = ?auto_5707 ?auto_5708 ) ) ( not ( = ?auto_5708 ?auto_5712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5712 ?auto_5707 ?auto_5705 )
      ( DELIVER-3PKG-VERIFY ?auto_5706 ?auto_5707 ?auto_5708 ?auto_5705 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5722 - OBJ
      ?auto_5723 - OBJ
      ?auto_5724 - OBJ
      ?auto_5721 - LOCATION
    )
    :vars
    (
      ?auto_5727 - TRUCK
      ?auto_5726 - LOCATION
      ?auto_5725 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5727 ?auto_5726 ) ( IN-CITY ?auto_5726 ?auto_5725 ) ( IN-CITY ?auto_5721 ?auto_5725 ) ( not ( = ?auto_5721 ?auto_5726 ) ) ( OBJ-AT ?auto_5724 ?auto_5721 ) ( not ( = ?auto_5724 ?auto_5722 ) ) ( OBJ-AT ?auto_5722 ?auto_5726 ) ( OBJ-AT ?auto_5723 ?auto_5721 ) ( not ( = ?auto_5722 ?auto_5723 ) ) ( not ( = ?auto_5723 ?auto_5724 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5724 ?auto_5722 ?auto_5721 )
      ( DELIVER-3PKG-VERIFY ?auto_5722 ?auto_5723 ?auto_5724 ?auto_5721 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5729 - OBJ
      ?auto_5730 - OBJ
      ?auto_5731 - OBJ
      ?auto_5728 - LOCATION
    )
    :vars
    (
      ?auto_5734 - TRUCK
      ?auto_5733 - LOCATION
      ?auto_5732 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5734 ?auto_5733 ) ( IN-CITY ?auto_5733 ?auto_5732 ) ( IN-CITY ?auto_5728 ?auto_5732 ) ( not ( = ?auto_5728 ?auto_5733 ) ) ( OBJ-AT ?auto_5730 ?auto_5728 ) ( not ( = ?auto_5730 ?auto_5729 ) ) ( OBJ-AT ?auto_5729 ?auto_5733 ) ( OBJ-AT ?auto_5731 ?auto_5728 ) ( not ( = ?auto_5729 ?auto_5731 ) ) ( not ( = ?auto_5730 ?auto_5731 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5730 ?auto_5729 ?auto_5728 )
      ( DELIVER-3PKG-VERIFY ?auto_5729 ?auto_5730 ?auto_5731 ?auto_5728 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5743 - OBJ
      ?auto_5744 - OBJ
      ?auto_5745 - OBJ
      ?auto_5742 - LOCATION
    )
    :vars
    (
      ?auto_5748 - TRUCK
      ?auto_5747 - LOCATION
      ?auto_5746 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5748 ?auto_5747 ) ( IN-CITY ?auto_5747 ?auto_5746 ) ( IN-CITY ?auto_5742 ?auto_5746 ) ( not ( = ?auto_5742 ?auto_5747 ) ) ( OBJ-AT ?auto_5745 ?auto_5742 ) ( not ( = ?auto_5745 ?auto_5743 ) ) ( OBJ-AT ?auto_5743 ?auto_5747 ) ( OBJ-AT ?auto_5744 ?auto_5742 ) ( not ( = ?auto_5743 ?auto_5744 ) ) ( not ( = ?auto_5744 ?auto_5745 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5745 ?auto_5743 ?auto_5742 )
      ( DELIVER-3PKG-VERIFY ?auto_5743 ?auto_5744 ?auto_5745 ?auto_5742 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5750 - OBJ
      ?auto_5751 - OBJ
      ?auto_5752 - OBJ
      ?auto_5749 - LOCATION
    )
    :vars
    (
      ?auto_5755 - TRUCK
      ?auto_5754 - LOCATION
      ?auto_5753 - CITY
      ?auto_5756 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_5755 ?auto_5754 ) ( IN-CITY ?auto_5754 ?auto_5753 ) ( IN-CITY ?auto_5749 ?auto_5753 ) ( not ( = ?auto_5749 ?auto_5754 ) ) ( OBJ-AT ?auto_5756 ?auto_5749 ) ( not ( = ?auto_5756 ?auto_5750 ) ) ( OBJ-AT ?auto_5750 ?auto_5754 ) ( OBJ-AT ?auto_5751 ?auto_5749 ) ( OBJ-AT ?auto_5752 ?auto_5749 ) ( not ( = ?auto_5750 ?auto_5751 ) ) ( not ( = ?auto_5750 ?auto_5752 ) ) ( not ( = ?auto_5751 ?auto_5752 ) ) ( not ( = ?auto_5751 ?auto_5756 ) ) ( not ( = ?auto_5752 ?auto_5756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5756 ?auto_5750 ?auto_5749 )
      ( DELIVER-3PKG-VERIFY ?auto_5750 ?auto_5751 ?auto_5752 ?auto_5749 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5789 - OBJ
      ?auto_5788 - LOCATION
    )
    :vars
    (
      ?auto_5791 - LOCATION
      ?auto_5790 - CITY
      ?auto_5793 - OBJ
      ?auto_5792 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5791 ?auto_5790 ) ( IN-CITY ?auto_5788 ?auto_5790 ) ( not ( = ?auto_5788 ?auto_5791 ) ) ( OBJ-AT ?auto_5793 ?auto_5788 ) ( not ( = ?auto_5793 ?auto_5789 ) ) ( OBJ-AT ?auto_5789 ?auto_5791 ) ( TRUCK-AT ?auto_5792 ?auto_5788 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_5792 ?auto_5788 ?auto_5791 ?auto_5790 )
      ( DELIVER-2PKG ?auto_5793 ?auto_5789 ?auto_5788 )
      ( DELIVER-1PKG-VERIFY ?auto_5789 ?auto_5788 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5795 - OBJ
      ?auto_5796 - OBJ
      ?auto_5794 - LOCATION
    )
    :vars
    (
      ?auto_5798 - LOCATION
      ?auto_5799 - CITY
      ?auto_5797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5798 ?auto_5799 ) ( IN-CITY ?auto_5794 ?auto_5799 ) ( not ( = ?auto_5794 ?auto_5798 ) ) ( OBJ-AT ?auto_5795 ?auto_5794 ) ( not ( = ?auto_5795 ?auto_5796 ) ) ( OBJ-AT ?auto_5796 ?auto_5798 ) ( TRUCK-AT ?auto_5797 ?auto_5794 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5796 ?auto_5794 )
      ( DELIVER-2PKG-VERIFY ?auto_5795 ?auto_5796 ?auto_5794 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5801 - OBJ
      ?auto_5802 - OBJ
      ?auto_5800 - LOCATION
    )
    :vars
    (
      ?auto_5804 - LOCATION
      ?auto_5805 - CITY
      ?auto_5803 - OBJ
      ?auto_5806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5804 ?auto_5805 ) ( IN-CITY ?auto_5800 ?auto_5805 ) ( not ( = ?auto_5800 ?auto_5804 ) ) ( OBJ-AT ?auto_5803 ?auto_5800 ) ( not ( = ?auto_5803 ?auto_5802 ) ) ( OBJ-AT ?auto_5802 ?auto_5804 ) ( TRUCK-AT ?auto_5806 ?auto_5800 ) ( OBJ-AT ?auto_5801 ?auto_5800 ) ( not ( = ?auto_5801 ?auto_5802 ) ) ( not ( = ?auto_5801 ?auto_5803 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5803 ?auto_5802 ?auto_5800 )
      ( DELIVER-2PKG-VERIFY ?auto_5801 ?auto_5802 ?auto_5800 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5808 - OBJ
      ?auto_5809 - OBJ
      ?auto_5807 - LOCATION
    )
    :vars
    (
      ?auto_5810 - LOCATION
      ?auto_5811 - CITY
      ?auto_5812 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5810 ?auto_5811 ) ( IN-CITY ?auto_5807 ?auto_5811 ) ( not ( = ?auto_5807 ?auto_5810 ) ) ( OBJ-AT ?auto_5809 ?auto_5807 ) ( not ( = ?auto_5809 ?auto_5808 ) ) ( OBJ-AT ?auto_5808 ?auto_5810 ) ( TRUCK-AT ?auto_5812 ?auto_5807 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5809 ?auto_5808 ?auto_5807 )
      ( DELIVER-2PKG-VERIFY ?auto_5808 ?auto_5809 ?auto_5807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5814 - OBJ
      ?auto_5815 - OBJ
      ?auto_5813 - LOCATION
    )
    :vars
    (
      ?auto_5817 - LOCATION
      ?auto_5818 - CITY
      ?auto_5816 - OBJ
      ?auto_5819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5817 ?auto_5818 ) ( IN-CITY ?auto_5813 ?auto_5818 ) ( not ( = ?auto_5813 ?auto_5817 ) ) ( OBJ-AT ?auto_5816 ?auto_5813 ) ( not ( = ?auto_5816 ?auto_5814 ) ) ( OBJ-AT ?auto_5814 ?auto_5817 ) ( TRUCK-AT ?auto_5819 ?auto_5813 ) ( OBJ-AT ?auto_5815 ?auto_5813 ) ( not ( = ?auto_5814 ?auto_5815 ) ) ( not ( = ?auto_5815 ?auto_5816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5816 ?auto_5814 ?auto_5813 )
      ( DELIVER-2PKG-VERIFY ?auto_5814 ?auto_5815 ?auto_5813 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5828 - OBJ
      ?auto_5829 - OBJ
      ?auto_5830 - OBJ
      ?auto_5827 - LOCATION
    )
    :vars
    (
      ?auto_5831 - LOCATION
      ?auto_5832 - CITY
      ?auto_5833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5831 ?auto_5832 ) ( IN-CITY ?auto_5827 ?auto_5832 ) ( not ( = ?auto_5827 ?auto_5831 ) ) ( OBJ-AT ?auto_5829 ?auto_5827 ) ( not ( = ?auto_5829 ?auto_5830 ) ) ( OBJ-AT ?auto_5830 ?auto_5831 ) ( TRUCK-AT ?auto_5833 ?auto_5827 ) ( OBJ-AT ?auto_5828 ?auto_5827 ) ( not ( = ?auto_5828 ?auto_5829 ) ) ( not ( = ?auto_5828 ?auto_5830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5829 ?auto_5830 ?auto_5827 )
      ( DELIVER-3PKG-VERIFY ?auto_5828 ?auto_5829 ?auto_5830 ?auto_5827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5835 - OBJ
      ?auto_5836 - OBJ
      ?auto_5837 - OBJ
      ?auto_5834 - LOCATION
    )
    :vars
    (
      ?auto_5838 - LOCATION
      ?auto_5839 - CITY
      ?auto_5840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5838 ?auto_5839 ) ( IN-CITY ?auto_5834 ?auto_5839 ) ( not ( = ?auto_5834 ?auto_5838 ) ) ( OBJ-AT ?auto_5835 ?auto_5834 ) ( not ( = ?auto_5835 ?auto_5837 ) ) ( OBJ-AT ?auto_5837 ?auto_5838 ) ( TRUCK-AT ?auto_5840 ?auto_5834 ) ( OBJ-AT ?auto_5836 ?auto_5834 ) ( not ( = ?auto_5835 ?auto_5836 ) ) ( not ( = ?auto_5836 ?auto_5837 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5835 ?auto_5837 ?auto_5834 )
      ( DELIVER-3PKG-VERIFY ?auto_5835 ?auto_5836 ?auto_5837 ?auto_5834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5842 - OBJ
      ?auto_5843 - OBJ
      ?auto_5844 - OBJ
      ?auto_5841 - LOCATION
    )
    :vars
    (
      ?auto_5845 - LOCATION
      ?auto_5846 - CITY
      ?auto_5847 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5845 ?auto_5846 ) ( IN-CITY ?auto_5841 ?auto_5846 ) ( not ( = ?auto_5841 ?auto_5845 ) ) ( OBJ-AT ?auto_5844 ?auto_5841 ) ( not ( = ?auto_5844 ?auto_5843 ) ) ( OBJ-AT ?auto_5843 ?auto_5845 ) ( TRUCK-AT ?auto_5847 ?auto_5841 ) ( OBJ-AT ?auto_5842 ?auto_5841 ) ( not ( = ?auto_5842 ?auto_5843 ) ) ( not ( = ?auto_5842 ?auto_5844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5844 ?auto_5843 ?auto_5841 )
      ( DELIVER-3PKG-VERIFY ?auto_5842 ?auto_5843 ?auto_5844 ?auto_5841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5849 - OBJ
      ?auto_5850 - OBJ
      ?auto_5851 - OBJ
      ?auto_5848 - LOCATION
    )
    :vars
    (
      ?auto_5852 - LOCATION
      ?auto_5853 - CITY
      ?auto_5854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5852 ?auto_5853 ) ( IN-CITY ?auto_5848 ?auto_5853 ) ( not ( = ?auto_5848 ?auto_5852 ) ) ( OBJ-AT ?auto_5849 ?auto_5848 ) ( not ( = ?auto_5849 ?auto_5850 ) ) ( OBJ-AT ?auto_5850 ?auto_5852 ) ( TRUCK-AT ?auto_5854 ?auto_5848 ) ( OBJ-AT ?auto_5851 ?auto_5848 ) ( not ( = ?auto_5849 ?auto_5851 ) ) ( not ( = ?auto_5850 ?auto_5851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5849 ?auto_5850 ?auto_5848 )
      ( DELIVER-3PKG-VERIFY ?auto_5849 ?auto_5850 ?auto_5851 ?auto_5848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5863 - OBJ
      ?auto_5864 - OBJ
      ?auto_5865 - OBJ
      ?auto_5862 - LOCATION
    )
    :vars
    (
      ?auto_5866 - LOCATION
      ?auto_5867 - CITY
      ?auto_5868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5866 ?auto_5867 ) ( IN-CITY ?auto_5862 ?auto_5867 ) ( not ( = ?auto_5862 ?auto_5866 ) ) ( OBJ-AT ?auto_5864 ?auto_5862 ) ( not ( = ?auto_5864 ?auto_5865 ) ) ( OBJ-AT ?auto_5865 ?auto_5866 ) ( TRUCK-AT ?auto_5868 ?auto_5862 ) ( OBJ-AT ?auto_5863 ?auto_5862 ) ( not ( = ?auto_5863 ?auto_5864 ) ) ( not ( = ?auto_5863 ?auto_5865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5864 ?auto_5865 ?auto_5862 )
      ( DELIVER-3PKG-VERIFY ?auto_5863 ?auto_5864 ?auto_5865 ?auto_5862 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5870 - OBJ
      ?auto_5871 - OBJ
      ?auto_5872 - OBJ
      ?auto_5869 - LOCATION
    )
    :vars
    (
      ?auto_5874 - LOCATION
      ?auto_5875 - CITY
      ?auto_5873 - OBJ
      ?auto_5876 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5874 ?auto_5875 ) ( IN-CITY ?auto_5869 ?auto_5875 ) ( not ( = ?auto_5869 ?auto_5874 ) ) ( OBJ-AT ?auto_5873 ?auto_5869 ) ( not ( = ?auto_5873 ?auto_5872 ) ) ( OBJ-AT ?auto_5872 ?auto_5874 ) ( TRUCK-AT ?auto_5876 ?auto_5869 ) ( OBJ-AT ?auto_5870 ?auto_5869 ) ( OBJ-AT ?auto_5871 ?auto_5869 ) ( not ( = ?auto_5870 ?auto_5871 ) ) ( not ( = ?auto_5870 ?auto_5872 ) ) ( not ( = ?auto_5870 ?auto_5873 ) ) ( not ( = ?auto_5871 ?auto_5872 ) ) ( not ( = ?auto_5871 ?auto_5873 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5873 ?auto_5872 ?auto_5869 )
      ( DELIVER-3PKG-VERIFY ?auto_5870 ?auto_5871 ?auto_5872 ?auto_5869 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5878 - OBJ
      ?auto_5879 - OBJ
      ?auto_5880 - OBJ
      ?auto_5877 - LOCATION
    )
    :vars
    (
      ?auto_5881 - LOCATION
      ?auto_5882 - CITY
      ?auto_5883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5881 ?auto_5882 ) ( IN-CITY ?auto_5877 ?auto_5882 ) ( not ( = ?auto_5877 ?auto_5881 ) ) ( OBJ-AT ?auto_5880 ?auto_5877 ) ( not ( = ?auto_5880 ?auto_5879 ) ) ( OBJ-AT ?auto_5879 ?auto_5881 ) ( TRUCK-AT ?auto_5883 ?auto_5877 ) ( OBJ-AT ?auto_5878 ?auto_5877 ) ( not ( = ?auto_5878 ?auto_5879 ) ) ( not ( = ?auto_5878 ?auto_5880 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5880 ?auto_5879 ?auto_5877 )
      ( DELIVER-3PKG-VERIFY ?auto_5878 ?auto_5879 ?auto_5880 ?auto_5877 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5885 - OBJ
      ?auto_5886 - OBJ
      ?auto_5887 - OBJ
      ?auto_5884 - LOCATION
    )
    :vars
    (
      ?auto_5889 - LOCATION
      ?auto_5890 - CITY
      ?auto_5888 - OBJ
      ?auto_5891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5889 ?auto_5890 ) ( IN-CITY ?auto_5884 ?auto_5890 ) ( not ( = ?auto_5884 ?auto_5889 ) ) ( OBJ-AT ?auto_5888 ?auto_5884 ) ( not ( = ?auto_5888 ?auto_5886 ) ) ( OBJ-AT ?auto_5886 ?auto_5889 ) ( TRUCK-AT ?auto_5891 ?auto_5884 ) ( OBJ-AT ?auto_5885 ?auto_5884 ) ( OBJ-AT ?auto_5887 ?auto_5884 ) ( not ( = ?auto_5885 ?auto_5886 ) ) ( not ( = ?auto_5885 ?auto_5887 ) ) ( not ( = ?auto_5885 ?auto_5888 ) ) ( not ( = ?auto_5886 ?auto_5887 ) ) ( not ( = ?auto_5887 ?auto_5888 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5888 ?auto_5886 ?auto_5884 )
      ( DELIVER-3PKG-VERIFY ?auto_5885 ?auto_5886 ?auto_5887 ?auto_5884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5901 - OBJ
      ?auto_5902 - OBJ
      ?auto_5903 - OBJ
      ?auto_5900 - LOCATION
    )
    :vars
    (
      ?auto_5904 - LOCATION
      ?auto_5905 - CITY
      ?auto_5906 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5904 ?auto_5905 ) ( IN-CITY ?auto_5900 ?auto_5905 ) ( not ( = ?auto_5900 ?auto_5904 ) ) ( OBJ-AT ?auto_5903 ?auto_5900 ) ( not ( = ?auto_5903 ?auto_5901 ) ) ( OBJ-AT ?auto_5901 ?auto_5904 ) ( TRUCK-AT ?auto_5906 ?auto_5900 ) ( OBJ-AT ?auto_5902 ?auto_5900 ) ( not ( = ?auto_5901 ?auto_5902 ) ) ( not ( = ?auto_5902 ?auto_5903 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5903 ?auto_5901 ?auto_5900 )
      ( DELIVER-3PKG-VERIFY ?auto_5901 ?auto_5902 ?auto_5903 ?auto_5900 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5908 - OBJ
      ?auto_5909 - OBJ
      ?auto_5910 - OBJ
      ?auto_5907 - LOCATION
    )
    :vars
    (
      ?auto_5911 - LOCATION
      ?auto_5912 - CITY
      ?auto_5913 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5911 ?auto_5912 ) ( IN-CITY ?auto_5907 ?auto_5912 ) ( not ( = ?auto_5907 ?auto_5911 ) ) ( OBJ-AT ?auto_5909 ?auto_5907 ) ( not ( = ?auto_5909 ?auto_5908 ) ) ( OBJ-AT ?auto_5908 ?auto_5911 ) ( TRUCK-AT ?auto_5913 ?auto_5907 ) ( OBJ-AT ?auto_5910 ?auto_5907 ) ( not ( = ?auto_5908 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5910 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5909 ?auto_5908 ?auto_5907 )
      ( DELIVER-3PKG-VERIFY ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5922 - OBJ
      ?auto_5923 - OBJ
      ?auto_5924 - OBJ
      ?auto_5921 - LOCATION
    )
    :vars
    (
      ?auto_5925 - LOCATION
      ?auto_5926 - CITY
      ?auto_5927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5925 ?auto_5926 ) ( IN-CITY ?auto_5921 ?auto_5926 ) ( not ( = ?auto_5921 ?auto_5925 ) ) ( OBJ-AT ?auto_5924 ?auto_5921 ) ( not ( = ?auto_5924 ?auto_5922 ) ) ( OBJ-AT ?auto_5922 ?auto_5925 ) ( TRUCK-AT ?auto_5927 ?auto_5921 ) ( OBJ-AT ?auto_5923 ?auto_5921 ) ( not ( = ?auto_5922 ?auto_5923 ) ) ( not ( = ?auto_5923 ?auto_5924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5924 ?auto_5922 ?auto_5921 )
      ( DELIVER-3PKG-VERIFY ?auto_5922 ?auto_5923 ?auto_5924 ?auto_5921 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_5929 - OBJ
      ?auto_5930 - OBJ
      ?auto_5931 - OBJ
      ?auto_5928 - LOCATION
    )
    :vars
    (
      ?auto_5933 - LOCATION
      ?auto_5934 - CITY
      ?auto_5932 - OBJ
      ?auto_5935 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5933 ?auto_5934 ) ( IN-CITY ?auto_5928 ?auto_5934 ) ( not ( = ?auto_5928 ?auto_5933 ) ) ( OBJ-AT ?auto_5932 ?auto_5928 ) ( not ( = ?auto_5932 ?auto_5929 ) ) ( OBJ-AT ?auto_5929 ?auto_5933 ) ( TRUCK-AT ?auto_5935 ?auto_5928 ) ( OBJ-AT ?auto_5930 ?auto_5928 ) ( OBJ-AT ?auto_5931 ?auto_5928 ) ( not ( = ?auto_5929 ?auto_5930 ) ) ( not ( = ?auto_5929 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5932 ) ) ( not ( = ?auto_5931 ?auto_5932 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5932 ?auto_5929 ?auto_5928 )
      ( DELIVER-3PKG-VERIFY ?auto_5929 ?auto_5930 ?auto_5931 ?auto_5928 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_5968 - OBJ
      ?auto_5967 - LOCATION
    )
    :vars
    (
      ?auto_5970 - LOCATION
      ?auto_5971 - CITY
      ?auto_5969 - OBJ
      ?auto_5972 - TRUCK
      ?auto_5973 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5970 ?auto_5971 ) ( IN-CITY ?auto_5967 ?auto_5971 ) ( not ( = ?auto_5967 ?auto_5970 ) ) ( OBJ-AT ?auto_5969 ?auto_5967 ) ( not ( = ?auto_5969 ?auto_5968 ) ) ( OBJ-AT ?auto_5968 ?auto_5970 ) ( TRUCK-AT ?auto_5972 ?auto_5967 ) ( IN-TRUCK ?auto_5973 ?auto_5972 ) ( not ( = ?auto_5969 ?auto_5973 ) ) ( not ( = ?auto_5968 ?auto_5973 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5969 ?auto_5973 ?auto_5967 )
      ( DELIVER-2PKG ?auto_5969 ?auto_5968 ?auto_5967 )
      ( DELIVER-1PKG-VERIFY ?auto_5968 ?auto_5967 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5975 - OBJ
      ?auto_5976 - OBJ
      ?auto_5974 - LOCATION
    )
    :vars
    (
      ?auto_5979 - LOCATION
      ?auto_5977 - CITY
      ?auto_5978 - TRUCK
      ?auto_5980 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5979 ?auto_5977 ) ( IN-CITY ?auto_5974 ?auto_5977 ) ( not ( = ?auto_5974 ?auto_5979 ) ) ( OBJ-AT ?auto_5975 ?auto_5974 ) ( not ( = ?auto_5975 ?auto_5976 ) ) ( OBJ-AT ?auto_5976 ?auto_5979 ) ( TRUCK-AT ?auto_5978 ?auto_5974 ) ( IN-TRUCK ?auto_5980 ?auto_5978 ) ( not ( = ?auto_5975 ?auto_5980 ) ) ( not ( = ?auto_5976 ?auto_5980 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_5976 ?auto_5974 )
      ( DELIVER-2PKG-VERIFY ?auto_5975 ?auto_5976 ?auto_5974 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5982 - OBJ
      ?auto_5983 - OBJ
      ?auto_5981 - LOCATION
    )
    :vars
    (
      ?auto_5986 - LOCATION
      ?auto_5984 - CITY
      ?auto_5987 - OBJ
      ?auto_5985 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5986 ?auto_5984 ) ( IN-CITY ?auto_5981 ?auto_5984 ) ( not ( = ?auto_5981 ?auto_5986 ) ) ( OBJ-AT ?auto_5987 ?auto_5981 ) ( not ( = ?auto_5987 ?auto_5983 ) ) ( OBJ-AT ?auto_5983 ?auto_5986 ) ( TRUCK-AT ?auto_5985 ?auto_5981 ) ( IN-TRUCK ?auto_5982 ?auto_5985 ) ( not ( = ?auto_5987 ?auto_5982 ) ) ( not ( = ?auto_5983 ?auto_5982 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5987 ?auto_5983 ?auto_5981 )
      ( DELIVER-2PKG-VERIFY ?auto_5982 ?auto_5983 ?auto_5981 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5989 - OBJ
      ?auto_5990 - OBJ
      ?auto_5988 - LOCATION
    )
    :vars
    (
      ?auto_5994 - LOCATION
      ?auto_5991 - CITY
      ?auto_5993 - TRUCK
      ?auto_5992 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_5994 ?auto_5991 ) ( IN-CITY ?auto_5988 ?auto_5991 ) ( not ( = ?auto_5988 ?auto_5994 ) ) ( OBJ-AT ?auto_5990 ?auto_5988 ) ( not ( = ?auto_5990 ?auto_5989 ) ) ( OBJ-AT ?auto_5989 ?auto_5994 ) ( TRUCK-AT ?auto_5993 ?auto_5988 ) ( IN-TRUCK ?auto_5992 ?auto_5993 ) ( not ( = ?auto_5990 ?auto_5992 ) ) ( not ( = ?auto_5989 ?auto_5992 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_5990 ?auto_5989 ?auto_5988 )
      ( DELIVER-2PKG-VERIFY ?auto_5989 ?auto_5990 ?auto_5988 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_5996 - OBJ
      ?auto_5997 - OBJ
      ?auto_5995 - LOCATION
    )
    :vars
    (
      ?auto_6000 - LOCATION
      ?auto_5998 - CITY
      ?auto_6001 - OBJ
      ?auto_5999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6000 ?auto_5998 ) ( IN-CITY ?auto_5995 ?auto_5998 ) ( not ( = ?auto_5995 ?auto_6000 ) ) ( OBJ-AT ?auto_6001 ?auto_5995 ) ( not ( = ?auto_6001 ?auto_5996 ) ) ( OBJ-AT ?auto_5996 ?auto_6000 ) ( TRUCK-AT ?auto_5999 ?auto_5995 ) ( IN-TRUCK ?auto_5997 ?auto_5999 ) ( not ( = ?auto_6001 ?auto_5997 ) ) ( not ( = ?auto_5996 ?auto_5997 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6001 ?auto_5996 ?auto_5995 )
      ( DELIVER-2PKG-VERIFY ?auto_5996 ?auto_5997 ?auto_5995 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6011 - OBJ
      ?auto_6012 - OBJ
      ?auto_6013 - OBJ
      ?auto_6010 - LOCATION
    )
    :vars
    (
      ?auto_6017 - LOCATION
      ?auto_6014 - CITY
      ?auto_6016 - TRUCK
      ?auto_6015 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_6017 ?auto_6014 ) ( IN-CITY ?auto_6010 ?auto_6014 ) ( not ( = ?auto_6010 ?auto_6017 ) ) ( OBJ-AT ?auto_6011 ?auto_6010 ) ( not ( = ?auto_6011 ?auto_6013 ) ) ( OBJ-AT ?auto_6013 ?auto_6017 ) ( TRUCK-AT ?auto_6016 ?auto_6010 ) ( IN-TRUCK ?auto_6015 ?auto_6016 ) ( not ( = ?auto_6011 ?auto_6015 ) ) ( not ( = ?auto_6013 ?auto_6015 ) ) ( OBJ-AT ?auto_6012 ?auto_6010 ) ( not ( = ?auto_6011 ?auto_6012 ) ) ( not ( = ?auto_6012 ?auto_6013 ) ) ( not ( = ?auto_6012 ?auto_6015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6011 ?auto_6013 ?auto_6010 )
      ( DELIVER-3PKG-VERIFY ?auto_6011 ?auto_6012 ?auto_6013 ?auto_6010 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6019 - OBJ
      ?auto_6020 - OBJ
      ?auto_6021 - OBJ
      ?auto_6018 - LOCATION
    )
    :vars
    (
      ?auto_6024 - LOCATION
      ?auto_6022 - CITY
      ?auto_6023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6024 ?auto_6022 ) ( IN-CITY ?auto_6018 ?auto_6022 ) ( not ( = ?auto_6018 ?auto_6024 ) ) ( OBJ-AT ?auto_6019 ?auto_6018 ) ( not ( = ?auto_6019 ?auto_6021 ) ) ( OBJ-AT ?auto_6021 ?auto_6024 ) ( TRUCK-AT ?auto_6023 ?auto_6018 ) ( IN-TRUCK ?auto_6020 ?auto_6023 ) ( not ( = ?auto_6019 ?auto_6020 ) ) ( not ( = ?auto_6021 ?auto_6020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6019 ?auto_6021 ?auto_6018 )
      ( DELIVER-3PKG-VERIFY ?auto_6019 ?auto_6020 ?auto_6021 ?auto_6018 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6026 - OBJ
      ?auto_6027 - OBJ
      ?auto_6028 - OBJ
      ?auto_6025 - LOCATION
    )
    :vars
    (
      ?auto_6032 - LOCATION
      ?auto_6029 - CITY
      ?auto_6031 - TRUCK
      ?auto_6030 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_6032 ?auto_6029 ) ( IN-CITY ?auto_6025 ?auto_6029 ) ( not ( = ?auto_6025 ?auto_6032 ) ) ( OBJ-AT ?auto_6028 ?auto_6025 ) ( not ( = ?auto_6028 ?auto_6027 ) ) ( OBJ-AT ?auto_6027 ?auto_6032 ) ( TRUCK-AT ?auto_6031 ?auto_6025 ) ( IN-TRUCK ?auto_6030 ?auto_6031 ) ( not ( = ?auto_6028 ?auto_6030 ) ) ( not ( = ?auto_6027 ?auto_6030 ) ) ( OBJ-AT ?auto_6026 ?auto_6025 ) ( not ( = ?auto_6026 ?auto_6027 ) ) ( not ( = ?auto_6026 ?auto_6028 ) ) ( not ( = ?auto_6026 ?auto_6030 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6028 ?auto_6027 ?auto_6025 )
      ( DELIVER-3PKG-VERIFY ?auto_6026 ?auto_6027 ?auto_6028 ?auto_6025 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6034 - OBJ
      ?auto_6035 - OBJ
      ?auto_6036 - OBJ
      ?auto_6033 - LOCATION
    )
    :vars
    (
      ?auto_6039 - LOCATION
      ?auto_6037 - CITY
      ?auto_6038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6039 ?auto_6037 ) ( IN-CITY ?auto_6033 ?auto_6037 ) ( not ( = ?auto_6033 ?auto_6039 ) ) ( OBJ-AT ?auto_6034 ?auto_6033 ) ( not ( = ?auto_6034 ?auto_6035 ) ) ( OBJ-AT ?auto_6035 ?auto_6039 ) ( TRUCK-AT ?auto_6038 ?auto_6033 ) ( IN-TRUCK ?auto_6036 ?auto_6038 ) ( not ( = ?auto_6034 ?auto_6036 ) ) ( not ( = ?auto_6035 ?auto_6036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6034 ?auto_6035 ?auto_6033 )
      ( DELIVER-3PKG-VERIFY ?auto_6034 ?auto_6035 ?auto_6036 ?auto_6033 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6049 - OBJ
      ?auto_6050 - OBJ
      ?auto_6051 - OBJ
      ?auto_6048 - LOCATION
    )
    :vars
    (
      ?auto_6054 - LOCATION
      ?auto_6052 - CITY
      ?auto_6053 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6054 ?auto_6052 ) ( IN-CITY ?auto_6048 ?auto_6052 ) ( not ( = ?auto_6048 ?auto_6054 ) ) ( OBJ-AT ?auto_6050 ?auto_6048 ) ( not ( = ?auto_6050 ?auto_6051 ) ) ( OBJ-AT ?auto_6051 ?auto_6054 ) ( TRUCK-AT ?auto_6053 ?auto_6048 ) ( IN-TRUCK ?auto_6049 ?auto_6053 ) ( not ( = ?auto_6050 ?auto_6049 ) ) ( not ( = ?auto_6051 ?auto_6049 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6050 ?auto_6051 ?auto_6048 )
      ( DELIVER-3PKG-VERIFY ?auto_6049 ?auto_6050 ?auto_6051 ?auto_6048 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6064 - OBJ
      ?auto_6065 - OBJ
      ?auto_6066 - OBJ
      ?auto_6063 - LOCATION
    )
    :vars
    (
      ?auto_6069 - LOCATION
      ?auto_6067 - CITY
      ?auto_6068 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6069 ?auto_6067 ) ( IN-CITY ?auto_6063 ?auto_6067 ) ( not ( = ?auto_6063 ?auto_6069 ) ) ( OBJ-AT ?auto_6066 ?auto_6063 ) ( not ( = ?auto_6066 ?auto_6065 ) ) ( OBJ-AT ?auto_6065 ?auto_6069 ) ( TRUCK-AT ?auto_6068 ?auto_6063 ) ( IN-TRUCK ?auto_6064 ?auto_6068 ) ( not ( = ?auto_6066 ?auto_6064 ) ) ( not ( = ?auto_6065 ?auto_6064 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6066 ?auto_6065 ?auto_6063 )
      ( DELIVER-3PKG-VERIFY ?auto_6064 ?auto_6065 ?auto_6066 ?auto_6063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6087 - OBJ
      ?auto_6088 - OBJ
      ?auto_6089 - OBJ
      ?auto_6086 - LOCATION
    )
    :vars
    (
      ?auto_6093 - LOCATION
      ?auto_6090 - CITY
      ?auto_6092 - TRUCK
      ?auto_6091 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_6093 ?auto_6090 ) ( IN-CITY ?auto_6086 ?auto_6090 ) ( not ( = ?auto_6086 ?auto_6093 ) ) ( OBJ-AT ?auto_6088 ?auto_6086 ) ( not ( = ?auto_6088 ?auto_6087 ) ) ( OBJ-AT ?auto_6087 ?auto_6093 ) ( TRUCK-AT ?auto_6092 ?auto_6086 ) ( IN-TRUCK ?auto_6091 ?auto_6092 ) ( not ( = ?auto_6088 ?auto_6091 ) ) ( not ( = ?auto_6087 ?auto_6091 ) ) ( OBJ-AT ?auto_6089 ?auto_6086 ) ( not ( = ?auto_6087 ?auto_6089 ) ) ( not ( = ?auto_6088 ?auto_6089 ) ) ( not ( = ?auto_6089 ?auto_6091 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6088 ?auto_6087 ?auto_6086 )
      ( DELIVER-3PKG-VERIFY ?auto_6087 ?auto_6088 ?auto_6089 ?auto_6086 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6095 - OBJ
      ?auto_6096 - OBJ
      ?auto_6097 - OBJ
      ?auto_6094 - LOCATION
    )
    :vars
    (
      ?auto_6100 - LOCATION
      ?auto_6098 - CITY
      ?auto_6099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6100 ?auto_6098 ) ( IN-CITY ?auto_6094 ?auto_6098 ) ( not ( = ?auto_6094 ?auto_6100 ) ) ( OBJ-AT ?auto_6096 ?auto_6094 ) ( not ( = ?auto_6096 ?auto_6095 ) ) ( OBJ-AT ?auto_6095 ?auto_6100 ) ( TRUCK-AT ?auto_6099 ?auto_6094 ) ( IN-TRUCK ?auto_6097 ?auto_6099 ) ( not ( = ?auto_6096 ?auto_6097 ) ) ( not ( = ?auto_6095 ?auto_6097 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6096 ?auto_6095 ?auto_6094 )
      ( DELIVER-3PKG-VERIFY ?auto_6095 ?auto_6096 ?auto_6097 ?auto_6094 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6110 - OBJ
      ?auto_6111 - OBJ
      ?auto_6112 - OBJ
      ?auto_6109 - LOCATION
    )
    :vars
    (
      ?auto_6115 - LOCATION
      ?auto_6113 - CITY
      ?auto_6114 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6115 ?auto_6113 ) ( IN-CITY ?auto_6109 ?auto_6113 ) ( not ( = ?auto_6109 ?auto_6115 ) ) ( OBJ-AT ?auto_6112 ?auto_6109 ) ( not ( = ?auto_6112 ?auto_6110 ) ) ( OBJ-AT ?auto_6110 ?auto_6115 ) ( TRUCK-AT ?auto_6114 ?auto_6109 ) ( IN-TRUCK ?auto_6111 ?auto_6114 ) ( not ( = ?auto_6112 ?auto_6111 ) ) ( not ( = ?auto_6110 ?auto_6111 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6112 ?auto_6110 ?auto_6109 )
      ( DELIVER-3PKG-VERIFY ?auto_6110 ?auto_6111 ?auto_6112 ?auto_6109 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6158 - OBJ
      ?auto_6157 - LOCATION
    )
    :vars
    (
      ?auto_6162 - LOCATION
      ?auto_6159 - CITY
      ?auto_6163 - OBJ
      ?auto_6160 - OBJ
      ?auto_6161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6162 ?auto_6159 ) ( IN-CITY ?auto_6157 ?auto_6159 ) ( not ( = ?auto_6157 ?auto_6162 ) ) ( OBJ-AT ?auto_6163 ?auto_6157 ) ( not ( = ?auto_6163 ?auto_6158 ) ) ( OBJ-AT ?auto_6158 ?auto_6162 ) ( IN-TRUCK ?auto_6160 ?auto_6161 ) ( not ( = ?auto_6163 ?auto_6160 ) ) ( not ( = ?auto_6158 ?auto_6160 ) ) ( TRUCK-AT ?auto_6161 ?auto_6162 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6161 ?auto_6162 ?auto_6157 ?auto_6159 )
      ( DELIVER-2PKG ?auto_6163 ?auto_6158 ?auto_6157 )
      ( DELIVER-1PKG-VERIFY ?auto_6158 ?auto_6157 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6165 - OBJ
      ?auto_6166 - OBJ
      ?auto_6164 - LOCATION
    )
    :vars
    (
      ?auto_6170 - LOCATION
      ?auto_6167 - CITY
      ?auto_6169 - OBJ
      ?auto_6168 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6170 ?auto_6167 ) ( IN-CITY ?auto_6164 ?auto_6167 ) ( not ( = ?auto_6164 ?auto_6170 ) ) ( OBJ-AT ?auto_6165 ?auto_6164 ) ( not ( = ?auto_6165 ?auto_6166 ) ) ( OBJ-AT ?auto_6166 ?auto_6170 ) ( IN-TRUCK ?auto_6169 ?auto_6168 ) ( not ( = ?auto_6165 ?auto_6169 ) ) ( not ( = ?auto_6166 ?auto_6169 ) ) ( TRUCK-AT ?auto_6168 ?auto_6170 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6166 ?auto_6164 )
      ( DELIVER-2PKG-VERIFY ?auto_6165 ?auto_6166 ?auto_6164 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6172 - OBJ
      ?auto_6173 - OBJ
      ?auto_6171 - LOCATION
    )
    :vars
    (
      ?auto_6175 - LOCATION
      ?auto_6174 - CITY
      ?auto_6177 - OBJ
      ?auto_6176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6175 ?auto_6174 ) ( IN-CITY ?auto_6171 ?auto_6174 ) ( not ( = ?auto_6171 ?auto_6175 ) ) ( OBJ-AT ?auto_6177 ?auto_6171 ) ( not ( = ?auto_6177 ?auto_6173 ) ) ( OBJ-AT ?auto_6173 ?auto_6175 ) ( IN-TRUCK ?auto_6172 ?auto_6176 ) ( not ( = ?auto_6177 ?auto_6172 ) ) ( not ( = ?auto_6173 ?auto_6172 ) ) ( TRUCK-AT ?auto_6176 ?auto_6175 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6177 ?auto_6173 ?auto_6171 )
      ( DELIVER-2PKG-VERIFY ?auto_6172 ?auto_6173 ?auto_6171 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6179 - OBJ
      ?auto_6180 - OBJ
      ?auto_6178 - LOCATION
    )
    :vars
    (
      ?auto_6182 - LOCATION
      ?auto_6181 - CITY
      ?auto_6184 - OBJ
      ?auto_6183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6182 ?auto_6181 ) ( IN-CITY ?auto_6178 ?auto_6181 ) ( not ( = ?auto_6178 ?auto_6182 ) ) ( OBJ-AT ?auto_6180 ?auto_6178 ) ( not ( = ?auto_6180 ?auto_6179 ) ) ( OBJ-AT ?auto_6179 ?auto_6182 ) ( IN-TRUCK ?auto_6184 ?auto_6183 ) ( not ( = ?auto_6180 ?auto_6184 ) ) ( not ( = ?auto_6179 ?auto_6184 ) ) ( TRUCK-AT ?auto_6183 ?auto_6182 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6180 ?auto_6179 ?auto_6178 )
      ( DELIVER-2PKG-VERIFY ?auto_6179 ?auto_6180 ?auto_6178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6186 - OBJ
      ?auto_6187 - OBJ
      ?auto_6185 - LOCATION
    )
    :vars
    (
      ?auto_6189 - LOCATION
      ?auto_6188 - CITY
      ?auto_6191 - OBJ
      ?auto_6190 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6189 ?auto_6188 ) ( IN-CITY ?auto_6185 ?auto_6188 ) ( not ( = ?auto_6185 ?auto_6189 ) ) ( OBJ-AT ?auto_6191 ?auto_6185 ) ( not ( = ?auto_6191 ?auto_6186 ) ) ( OBJ-AT ?auto_6186 ?auto_6189 ) ( IN-TRUCK ?auto_6187 ?auto_6190 ) ( not ( = ?auto_6191 ?auto_6187 ) ) ( not ( = ?auto_6186 ?auto_6187 ) ) ( TRUCK-AT ?auto_6190 ?auto_6189 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6191 ?auto_6186 ?auto_6185 )
      ( DELIVER-2PKG-VERIFY ?auto_6186 ?auto_6187 ?auto_6185 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6201 - OBJ
      ?auto_6202 - OBJ
      ?auto_6203 - OBJ
      ?auto_6200 - LOCATION
    )
    :vars
    (
      ?auto_6205 - LOCATION
      ?auto_6204 - CITY
      ?auto_6207 - OBJ
      ?auto_6206 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6205 ?auto_6204 ) ( IN-CITY ?auto_6200 ?auto_6204 ) ( not ( = ?auto_6200 ?auto_6205 ) ) ( OBJ-AT ?auto_6202 ?auto_6200 ) ( not ( = ?auto_6202 ?auto_6203 ) ) ( OBJ-AT ?auto_6203 ?auto_6205 ) ( IN-TRUCK ?auto_6207 ?auto_6206 ) ( not ( = ?auto_6202 ?auto_6207 ) ) ( not ( = ?auto_6203 ?auto_6207 ) ) ( TRUCK-AT ?auto_6206 ?auto_6205 ) ( OBJ-AT ?auto_6201 ?auto_6200 ) ( not ( = ?auto_6201 ?auto_6202 ) ) ( not ( = ?auto_6201 ?auto_6203 ) ) ( not ( = ?auto_6201 ?auto_6207 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6202 ?auto_6203 ?auto_6200 )
      ( DELIVER-3PKG-VERIFY ?auto_6201 ?auto_6202 ?auto_6203 ?auto_6200 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6209 - OBJ
      ?auto_6210 - OBJ
      ?auto_6211 - OBJ
      ?auto_6208 - LOCATION
    )
    :vars
    (
      ?auto_6213 - LOCATION
      ?auto_6212 - CITY
      ?auto_6214 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6213 ?auto_6212 ) ( IN-CITY ?auto_6208 ?auto_6212 ) ( not ( = ?auto_6208 ?auto_6213 ) ) ( OBJ-AT ?auto_6209 ?auto_6208 ) ( not ( = ?auto_6209 ?auto_6211 ) ) ( OBJ-AT ?auto_6211 ?auto_6213 ) ( IN-TRUCK ?auto_6210 ?auto_6214 ) ( not ( = ?auto_6209 ?auto_6210 ) ) ( not ( = ?auto_6211 ?auto_6210 ) ) ( TRUCK-AT ?auto_6214 ?auto_6213 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6209 ?auto_6211 ?auto_6208 )
      ( DELIVER-3PKG-VERIFY ?auto_6209 ?auto_6210 ?auto_6211 ?auto_6208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6216 - OBJ
      ?auto_6217 - OBJ
      ?auto_6218 - OBJ
      ?auto_6215 - LOCATION
    )
    :vars
    (
      ?auto_6220 - LOCATION
      ?auto_6219 - CITY
      ?auto_6222 - OBJ
      ?auto_6221 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6220 ?auto_6219 ) ( IN-CITY ?auto_6215 ?auto_6219 ) ( not ( = ?auto_6215 ?auto_6220 ) ) ( OBJ-AT ?auto_6218 ?auto_6215 ) ( not ( = ?auto_6218 ?auto_6217 ) ) ( OBJ-AT ?auto_6217 ?auto_6220 ) ( IN-TRUCK ?auto_6222 ?auto_6221 ) ( not ( = ?auto_6218 ?auto_6222 ) ) ( not ( = ?auto_6217 ?auto_6222 ) ) ( TRUCK-AT ?auto_6221 ?auto_6220 ) ( OBJ-AT ?auto_6216 ?auto_6215 ) ( not ( = ?auto_6216 ?auto_6217 ) ) ( not ( = ?auto_6216 ?auto_6218 ) ) ( not ( = ?auto_6216 ?auto_6222 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6218 ?auto_6217 ?auto_6215 )
      ( DELIVER-3PKG-VERIFY ?auto_6216 ?auto_6217 ?auto_6218 ?auto_6215 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6224 - OBJ
      ?auto_6225 - OBJ
      ?auto_6226 - OBJ
      ?auto_6223 - LOCATION
    )
    :vars
    (
      ?auto_6228 - LOCATION
      ?auto_6227 - CITY
      ?auto_6229 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6228 ?auto_6227 ) ( IN-CITY ?auto_6223 ?auto_6227 ) ( not ( = ?auto_6223 ?auto_6228 ) ) ( OBJ-AT ?auto_6224 ?auto_6223 ) ( not ( = ?auto_6224 ?auto_6225 ) ) ( OBJ-AT ?auto_6225 ?auto_6228 ) ( IN-TRUCK ?auto_6226 ?auto_6229 ) ( not ( = ?auto_6224 ?auto_6226 ) ) ( not ( = ?auto_6225 ?auto_6226 ) ) ( TRUCK-AT ?auto_6229 ?auto_6228 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6224 ?auto_6225 ?auto_6223 )
      ( DELIVER-3PKG-VERIFY ?auto_6224 ?auto_6225 ?auto_6226 ?auto_6223 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6239 - OBJ
      ?auto_6240 - OBJ
      ?auto_6241 - OBJ
      ?auto_6238 - LOCATION
    )
    :vars
    (
      ?auto_6243 - LOCATION
      ?auto_6242 - CITY
      ?auto_6244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6243 ?auto_6242 ) ( IN-CITY ?auto_6238 ?auto_6242 ) ( not ( = ?auto_6238 ?auto_6243 ) ) ( OBJ-AT ?auto_6240 ?auto_6238 ) ( not ( = ?auto_6240 ?auto_6241 ) ) ( OBJ-AT ?auto_6241 ?auto_6243 ) ( IN-TRUCK ?auto_6239 ?auto_6244 ) ( not ( = ?auto_6240 ?auto_6239 ) ) ( not ( = ?auto_6241 ?auto_6239 ) ) ( TRUCK-AT ?auto_6244 ?auto_6243 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6240 ?auto_6241 ?auto_6238 )
      ( DELIVER-3PKG-VERIFY ?auto_6239 ?auto_6240 ?auto_6241 ?auto_6238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6254 - OBJ
      ?auto_6255 - OBJ
      ?auto_6256 - OBJ
      ?auto_6253 - LOCATION
    )
    :vars
    (
      ?auto_6258 - LOCATION
      ?auto_6257 - CITY
      ?auto_6259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6258 ?auto_6257 ) ( IN-CITY ?auto_6253 ?auto_6257 ) ( not ( = ?auto_6253 ?auto_6258 ) ) ( OBJ-AT ?auto_6256 ?auto_6253 ) ( not ( = ?auto_6256 ?auto_6255 ) ) ( OBJ-AT ?auto_6255 ?auto_6258 ) ( IN-TRUCK ?auto_6254 ?auto_6259 ) ( not ( = ?auto_6256 ?auto_6254 ) ) ( not ( = ?auto_6255 ?auto_6254 ) ) ( TRUCK-AT ?auto_6259 ?auto_6258 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6256 ?auto_6255 ?auto_6253 )
      ( DELIVER-3PKG-VERIFY ?auto_6254 ?auto_6255 ?auto_6256 ?auto_6253 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6277 - OBJ
      ?auto_6278 - OBJ
      ?auto_6279 - OBJ
      ?auto_6276 - LOCATION
    )
    :vars
    (
      ?auto_6281 - LOCATION
      ?auto_6280 - CITY
      ?auto_6283 - OBJ
      ?auto_6282 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6281 ?auto_6280 ) ( IN-CITY ?auto_6276 ?auto_6280 ) ( not ( = ?auto_6276 ?auto_6281 ) ) ( OBJ-AT ?auto_6278 ?auto_6276 ) ( not ( = ?auto_6278 ?auto_6277 ) ) ( OBJ-AT ?auto_6277 ?auto_6281 ) ( IN-TRUCK ?auto_6283 ?auto_6282 ) ( not ( = ?auto_6278 ?auto_6283 ) ) ( not ( = ?auto_6277 ?auto_6283 ) ) ( TRUCK-AT ?auto_6282 ?auto_6281 ) ( OBJ-AT ?auto_6279 ?auto_6276 ) ( not ( = ?auto_6277 ?auto_6279 ) ) ( not ( = ?auto_6278 ?auto_6279 ) ) ( not ( = ?auto_6279 ?auto_6283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6278 ?auto_6277 ?auto_6276 )
      ( DELIVER-3PKG-VERIFY ?auto_6277 ?auto_6278 ?auto_6279 ?auto_6276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6285 - OBJ
      ?auto_6286 - OBJ
      ?auto_6287 - OBJ
      ?auto_6284 - LOCATION
    )
    :vars
    (
      ?auto_6289 - LOCATION
      ?auto_6288 - CITY
      ?auto_6290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6289 ?auto_6288 ) ( IN-CITY ?auto_6284 ?auto_6288 ) ( not ( = ?auto_6284 ?auto_6289 ) ) ( OBJ-AT ?auto_6286 ?auto_6284 ) ( not ( = ?auto_6286 ?auto_6285 ) ) ( OBJ-AT ?auto_6285 ?auto_6289 ) ( IN-TRUCK ?auto_6287 ?auto_6290 ) ( not ( = ?auto_6286 ?auto_6287 ) ) ( not ( = ?auto_6285 ?auto_6287 ) ) ( TRUCK-AT ?auto_6290 ?auto_6289 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6286 ?auto_6285 ?auto_6284 )
      ( DELIVER-3PKG-VERIFY ?auto_6285 ?auto_6286 ?auto_6287 ?auto_6284 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6300 - OBJ
      ?auto_6301 - OBJ
      ?auto_6302 - OBJ
      ?auto_6299 - LOCATION
    )
    :vars
    (
      ?auto_6304 - LOCATION
      ?auto_6303 - CITY
      ?auto_6305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6304 ?auto_6303 ) ( IN-CITY ?auto_6299 ?auto_6303 ) ( not ( = ?auto_6299 ?auto_6304 ) ) ( OBJ-AT ?auto_6302 ?auto_6299 ) ( not ( = ?auto_6302 ?auto_6300 ) ) ( OBJ-AT ?auto_6300 ?auto_6304 ) ( IN-TRUCK ?auto_6301 ?auto_6305 ) ( not ( = ?auto_6302 ?auto_6301 ) ) ( not ( = ?auto_6300 ?auto_6301 ) ) ( TRUCK-AT ?auto_6305 ?auto_6304 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6302 ?auto_6300 ?auto_6299 )
      ( DELIVER-3PKG-VERIFY ?auto_6300 ?auto_6301 ?auto_6302 ?auto_6299 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6348 - OBJ
      ?auto_6347 - LOCATION
    )
    :vars
    (
      ?auto_6350 - LOCATION
      ?auto_6349 - CITY
      ?auto_6352 - OBJ
      ?auto_6353 - OBJ
      ?auto_6351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6350 ?auto_6349 ) ( IN-CITY ?auto_6347 ?auto_6349 ) ( not ( = ?auto_6347 ?auto_6350 ) ) ( OBJ-AT ?auto_6352 ?auto_6347 ) ( not ( = ?auto_6352 ?auto_6348 ) ) ( OBJ-AT ?auto_6348 ?auto_6350 ) ( not ( = ?auto_6352 ?auto_6353 ) ) ( not ( = ?auto_6348 ?auto_6353 ) ) ( TRUCK-AT ?auto_6351 ?auto_6350 ) ( OBJ-AT ?auto_6353 ?auto_6350 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_6353 ?auto_6351 ?auto_6350 )
      ( DELIVER-2PKG ?auto_6352 ?auto_6348 ?auto_6347 )
      ( DELIVER-1PKG-VERIFY ?auto_6348 ?auto_6347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6355 - OBJ
      ?auto_6356 - OBJ
      ?auto_6354 - LOCATION
    )
    :vars
    (
      ?auto_6358 - LOCATION
      ?auto_6360 - CITY
      ?auto_6357 - OBJ
      ?auto_6359 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6358 ?auto_6360 ) ( IN-CITY ?auto_6354 ?auto_6360 ) ( not ( = ?auto_6354 ?auto_6358 ) ) ( OBJ-AT ?auto_6355 ?auto_6354 ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( OBJ-AT ?auto_6356 ?auto_6358 ) ( not ( = ?auto_6355 ?auto_6357 ) ) ( not ( = ?auto_6356 ?auto_6357 ) ) ( TRUCK-AT ?auto_6359 ?auto_6358 ) ( OBJ-AT ?auto_6357 ?auto_6358 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6356 ?auto_6354 )
      ( DELIVER-2PKG-VERIFY ?auto_6355 ?auto_6356 ?auto_6354 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6362 - OBJ
      ?auto_6363 - OBJ
      ?auto_6361 - LOCATION
    )
    :vars
    (
      ?auto_6366 - LOCATION
      ?auto_6367 - CITY
      ?auto_6364 - OBJ
      ?auto_6365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6366 ?auto_6367 ) ( IN-CITY ?auto_6361 ?auto_6367 ) ( not ( = ?auto_6361 ?auto_6366 ) ) ( OBJ-AT ?auto_6364 ?auto_6361 ) ( not ( = ?auto_6364 ?auto_6363 ) ) ( OBJ-AT ?auto_6363 ?auto_6366 ) ( not ( = ?auto_6364 ?auto_6362 ) ) ( not ( = ?auto_6363 ?auto_6362 ) ) ( TRUCK-AT ?auto_6365 ?auto_6366 ) ( OBJ-AT ?auto_6362 ?auto_6366 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6364 ?auto_6363 ?auto_6361 )
      ( DELIVER-2PKG-VERIFY ?auto_6362 ?auto_6363 ?auto_6361 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6369 - OBJ
      ?auto_6370 - OBJ
      ?auto_6368 - LOCATION
    )
    :vars
    (
      ?auto_6372 - LOCATION
      ?auto_6374 - CITY
      ?auto_6373 - OBJ
      ?auto_6371 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6372 ?auto_6374 ) ( IN-CITY ?auto_6368 ?auto_6374 ) ( not ( = ?auto_6368 ?auto_6372 ) ) ( OBJ-AT ?auto_6370 ?auto_6368 ) ( not ( = ?auto_6370 ?auto_6369 ) ) ( OBJ-AT ?auto_6369 ?auto_6372 ) ( not ( = ?auto_6370 ?auto_6373 ) ) ( not ( = ?auto_6369 ?auto_6373 ) ) ( TRUCK-AT ?auto_6371 ?auto_6372 ) ( OBJ-AT ?auto_6373 ?auto_6372 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6370 ?auto_6369 ?auto_6368 )
      ( DELIVER-2PKG-VERIFY ?auto_6369 ?auto_6370 ?auto_6368 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6376 - OBJ
      ?auto_6377 - OBJ
      ?auto_6375 - LOCATION
    )
    :vars
    (
      ?auto_6380 - LOCATION
      ?auto_6381 - CITY
      ?auto_6378 - OBJ
      ?auto_6379 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6380 ?auto_6381 ) ( IN-CITY ?auto_6375 ?auto_6381 ) ( not ( = ?auto_6375 ?auto_6380 ) ) ( OBJ-AT ?auto_6378 ?auto_6375 ) ( not ( = ?auto_6378 ?auto_6376 ) ) ( OBJ-AT ?auto_6376 ?auto_6380 ) ( not ( = ?auto_6378 ?auto_6377 ) ) ( not ( = ?auto_6376 ?auto_6377 ) ) ( TRUCK-AT ?auto_6379 ?auto_6380 ) ( OBJ-AT ?auto_6377 ?auto_6380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6378 ?auto_6376 ?auto_6375 )
      ( DELIVER-2PKG-VERIFY ?auto_6376 ?auto_6377 ?auto_6375 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6391 - OBJ
      ?auto_6392 - OBJ
      ?auto_6393 - OBJ
      ?auto_6390 - LOCATION
    )
    :vars
    (
      ?auto_6395 - LOCATION
      ?auto_6397 - CITY
      ?auto_6396 - OBJ
      ?auto_6394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6395 ?auto_6397 ) ( IN-CITY ?auto_6390 ?auto_6397 ) ( not ( = ?auto_6390 ?auto_6395 ) ) ( OBJ-AT ?auto_6391 ?auto_6390 ) ( not ( = ?auto_6391 ?auto_6393 ) ) ( OBJ-AT ?auto_6393 ?auto_6395 ) ( not ( = ?auto_6391 ?auto_6396 ) ) ( not ( = ?auto_6393 ?auto_6396 ) ) ( TRUCK-AT ?auto_6394 ?auto_6395 ) ( OBJ-AT ?auto_6396 ?auto_6395 ) ( OBJ-AT ?auto_6392 ?auto_6390 ) ( not ( = ?auto_6391 ?auto_6392 ) ) ( not ( = ?auto_6392 ?auto_6393 ) ) ( not ( = ?auto_6392 ?auto_6396 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6391 ?auto_6393 ?auto_6390 )
      ( DELIVER-3PKG-VERIFY ?auto_6391 ?auto_6392 ?auto_6393 ?auto_6390 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6399 - OBJ
      ?auto_6400 - OBJ
      ?auto_6401 - OBJ
      ?auto_6398 - LOCATION
    )
    :vars
    (
      ?auto_6403 - LOCATION
      ?auto_6404 - CITY
      ?auto_6402 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6403 ?auto_6404 ) ( IN-CITY ?auto_6398 ?auto_6404 ) ( not ( = ?auto_6398 ?auto_6403 ) ) ( OBJ-AT ?auto_6399 ?auto_6398 ) ( not ( = ?auto_6399 ?auto_6401 ) ) ( OBJ-AT ?auto_6401 ?auto_6403 ) ( not ( = ?auto_6399 ?auto_6400 ) ) ( not ( = ?auto_6401 ?auto_6400 ) ) ( TRUCK-AT ?auto_6402 ?auto_6403 ) ( OBJ-AT ?auto_6400 ?auto_6403 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6399 ?auto_6401 ?auto_6398 )
      ( DELIVER-3PKG-VERIFY ?auto_6399 ?auto_6400 ?auto_6401 ?auto_6398 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6406 - OBJ
      ?auto_6407 - OBJ
      ?auto_6408 - OBJ
      ?auto_6405 - LOCATION
    )
    :vars
    (
      ?auto_6410 - LOCATION
      ?auto_6412 - CITY
      ?auto_6411 - OBJ
      ?auto_6409 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6410 ?auto_6412 ) ( IN-CITY ?auto_6405 ?auto_6412 ) ( not ( = ?auto_6405 ?auto_6410 ) ) ( OBJ-AT ?auto_6408 ?auto_6405 ) ( not ( = ?auto_6408 ?auto_6407 ) ) ( OBJ-AT ?auto_6407 ?auto_6410 ) ( not ( = ?auto_6408 ?auto_6411 ) ) ( not ( = ?auto_6407 ?auto_6411 ) ) ( TRUCK-AT ?auto_6409 ?auto_6410 ) ( OBJ-AT ?auto_6411 ?auto_6410 ) ( OBJ-AT ?auto_6406 ?auto_6405 ) ( not ( = ?auto_6406 ?auto_6407 ) ) ( not ( = ?auto_6406 ?auto_6408 ) ) ( not ( = ?auto_6406 ?auto_6411 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6408 ?auto_6407 ?auto_6405 )
      ( DELIVER-3PKG-VERIFY ?auto_6406 ?auto_6407 ?auto_6408 ?auto_6405 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6414 - OBJ
      ?auto_6415 - OBJ
      ?auto_6416 - OBJ
      ?auto_6413 - LOCATION
    )
    :vars
    (
      ?auto_6418 - LOCATION
      ?auto_6419 - CITY
      ?auto_6417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6418 ?auto_6419 ) ( IN-CITY ?auto_6413 ?auto_6419 ) ( not ( = ?auto_6413 ?auto_6418 ) ) ( OBJ-AT ?auto_6414 ?auto_6413 ) ( not ( = ?auto_6414 ?auto_6415 ) ) ( OBJ-AT ?auto_6415 ?auto_6418 ) ( not ( = ?auto_6414 ?auto_6416 ) ) ( not ( = ?auto_6415 ?auto_6416 ) ) ( TRUCK-AT ?auto_6417 ?auto_6418 ) ( OBJ-AT ?auto_6416 ?auto_6418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6414 ?auto_6415 ?auto_6413 )
      ( DELIVER-3PKG-VERIFY ?auto_6414 ?auto_6415 ?auto_6416 ?auto_6413 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6429 - OBJ
      ?auto_6430 - OBJ
      ?auto_6431 - OBJ
      ?auto_6428 - LOCATION
    )
    :vars
    (
      ?auto_6433 - LOCATION
      ?auto_6434 - CITY
      ?auto_6432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6433 ?auto_6434 ) ( IN-CITY ?auto_6428 ?auto_6434 ) ( not ( = ?auto_6428 ?auto_6433 ) ) ( OBJ-AT ?auto_6430 ?auto_6428 ) ( not ( = ?auto_6430 ?auto_6431 ) ) ( OBJ-AT ?auto_6431 ?auto_6433 ) ( not ( = ?auto_6430 ?auto_6429 ) ) ( not ( = ?auto_6431 ?auto_6429 ) ) ( TRUCK-AT ?auto_6432 ?auto_6433 ) ( OBJ-AT ?auto_6429 ?auto_6433 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6430 ?auto_6431 ?auto_6428 )
      ( DELIVER-3PKG-VERIFY ?auto_6429 ?auto_6430 ?auto_6431 ?auto_6428 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6444 - OBJ
      ?auto_6445 - OBJ
      ?auto_6446 - OBJ
      ?auto_6443 - LOCATION
    )
    :vars
    (
      ?auto_6448 - LOCATION
      ?auto_6449 - CITY
      ?auto_6447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6448 ?auto_6449 ) ( IN-CITY ?auto_6443 ?auto_6449 ) ( not ( = ?auto_6443 ?auto_6448 ) ) ( OBJ-AT ?auto_6446 ?auto_6443 ) ( not ( = ?auto_6446 ?auto_6445 ) ) ( OBJ-AT ?auto_6445 ?auto_6448 ) ( not ( = ?auto_6446 ?auto_6444 ) ) ( not ( = ?auto_6445 ?auto_6444 ) ) ( TRUCK-AT ?auto_6447 ?auto_6448 ) ( OBJ-AT ?auto_6444 ?auto_6448 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6446 ?auto_6445 ?auto_6443 )
      ( DELIVER-3PKG-VERIFY ?auto_6444 ?auto_6445 ?auto_6446 ?auto_6443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6467 - OBJ
      ?auto_6468 - OBJ
      ?auto_6469 - OBJ
      ?auto_6466 - LOCATION
    )
    :vars
    (
      ?auto_6471 - LOCATION
      ?auto_6473 - CITY
      ?auto_6472 - OBJ
      ?auto_6470 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6471 ?auto_6473 ) ( IN-CITY ?auto_6466 ?auto_6473 ) ( not ( = ?auto_6466 ?auto_6471 ) ) ( OBJ-AT ?auto_6468 ?auto_6466 ) ( not ( = ?auto_6468 ?auto_6467 ) ) ( OBJ-AT ?auto_6467 ?auto_6471 ) ( not ( = ?auto_6468 ?auto_6472 ) ) ( not ( = ?auto_6467 ?auto_6472 ) ) ( TRUCK-AT ?auto_6470 ?auto_6471 ) ( OBJ-AT ?auto_6472 ?auto_6471 ) ( OBJ-AT ?auto_6469 ?auto_6466 ) ( not ( = ?auto_6467 ?auto_6469 ) ) ( not ( = ?auto_6468 ?auto_6469 ) ) ( not ( = ?auto_6469 ?auto_6472 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6468 ?auto_6467 ?auto_6466 )
      ( DELIVER-3PKG-VERIFY ?auto_6467 ?auto_6468 ?auto_6469 ?auto_6466 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6475 - OBJ
      ?auto_6476 - OBJ
      ?auto_6477 - OBJ
      ?auto_6474 - LOCATION
    )
    :vars
    (
      ?auto_6479 - LOCATION
      ?auto_6480 - CITY
      ?auto_6478 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6479 ?auto_6480 ) ( IN-CITY ?auto_6474 ?auto_6480 ) ( not ( = ?auto_6474 ?auto_6479 ) ) ( OBJ-AT ?auto_6476 ?auto_6474 ) ( not ( = ?auto_6476 ?auto_6475 ) ) ( OBJ-AT ?auto_6475 ?auto_6479 ) ( not ( = ?auto_6476 ?auto_6477 ) ) ( not ( = ?auto_6475 ?auto_6477 ) ) ( TRUCK-AT ?auto_6478 ?auto_6479 ) ( OBJ-AT ?auto_6477 ?auto_6479 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6476 ?auto_6475 ?auto_6474 )
      ( DELIVER-3PKG-VERIFY ?auto_6475 ?auto_6476 ?auto_6477 ?auto_6474 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6490 - OBJ
      ?auto_6491 - OBJ
      ?auto_6492 - OBJ
      ?auto_6489 - LOCATION
    )
    :vars
    (
      ?auto_6494 - LOCATION
      ?auto_6495 - CITY
      ?auto_6493 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6494 ?auto_6495 ) ( IN-CITY ?auto_6489 ?auto_6495 ) ( not ( = ?auto_6489 ?auto_6494 ) ) ( OBJ-AT ?auto_6492 ?auto_6489 ) ( not ( = ?auto_6492 ?auto_6490 ) ) ( OBJ-AT ?auto_6490 ?auto_6494 ) ( not ( = ?auto_6492 ?auto_6491 ) ) ( not ( = ?auto_6490 ?auto_6491 ) ) ( TRUCK-AT ?auto_6493 ?auto_6494 ) ( OBJ-AT ?auto_6491 ?auto_6494 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6492 ?auto_6490 ?auto_6489 )
      ( DELIVER-3PKG-VERIFY ?auto_6490 ?auto_6491 ?auto_6492 ?auto_6489 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6538 - OBJ
      ?auto_6537 - LOCATION
    )
    :vars
    (
      ?auto_6541 - LOCATION
      ?auto_6543 - CITY
      ?auto_6539 - OBJ
      ?auto_6542 - OBJ
      ?auto_6540 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6541 ?auto_6543 ) ( IN-CITY ?auto_6537 ?auto_6543 ) ( not ( = ?auto_6537 ?auto_6541 ) ) ( OBJ-AT ?auto_6539 ?auto_6537 ) ( not ( = ?auto_6539 ?auto_6538 ) ) ( OBJ-AT ?auto_6538 ?auto_6541 ) ( not ( = ?auto_6539 ?auto_6542 ) ) ( not ( = ?auto_6538 ?auto_6542 ) ) ( OBJ-AT ?auto_6542 ?auto_6541 ) ( TRUCK-AT ?auto_6540 ?auto_6537 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6540 ?auto_6537 ?auto_6541 ?auto_6543 )
      ( DELIVER-2PKG ?auto_6539 ?auto_6538 ?auto_6537 )
      ( DELIVER-1PKG-VERIFY ?auto_6538 ?auto_6537 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6545 - OBJ
      ?auto_6546 - OBJ
      ?auto_6544 - LOCATION
    )
    :vars
    (
      ?auto_6550 - LOCATION
      ?auto_6549 - CITY
      ?auto_6547 - OBJ
      ?auto_6548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6550 ?auto_6549 ) ( IN-CITY ?auto_6544 ?auto_6549 ) ( not ( = ?auto_6544 ?auto_6550 ) ) ( OBJ-AT ?auto_6545 ?auto_6544 ) ( not ( = ?auto_6545 ?auto_6546 ) ) ( OBJ-AT ?auto_6546 ?auto_6550 ) ( not ( = ?auto_6545 ?auto_6547 ) ) ( not ( = ?auto_6546 ?auto_6547 ) ) ( OBJ-AT ?auto_6547 ?auto_6550 ) ( TRUCK-AT ?auto_6548 ?auto_6544 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6546 ?auto_6544 )
      ( DELIVER-2PKG-VERIFY ?auto_6545 ?auto_6546 ?auto_6544 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6552 - OBJ
      ?auto_6553 - OBJ
      ?auto_6551 - LOCATION
    )
    :vars
    (
      ?auto_6554 - LOCATION
      ?auto_6556 - CITY
      ?auto_6555 - OBJ
      ?auto_6557 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6554 ?auto_6556 ) ( IN-CITY ?auto_6551 ?auto_6556 ) ( not ( = ?auto_6551 ?auto_6554 ) ) ( OBJ-AT ?auto_6555 ?auto_6551 ) ( not ( = ?auto_6555 ?auto_6553 ) ) ( OBJ-AT ?auto_6553 ?auto_6554 ) ( not ( = ?auto_6555 ?auto_6552 ) ) ( not ( = ?auto_6553 ?auto_6552 ) ) ( OBJ-AT ?auto_6552 ?auto_6554 ) ( TRUCK-AT ?auto_6557 ?auto_6551 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6555 ?auto_6553 ?auto_6551 )
      ( DELIVER-2PKG-VERIFY ?auto_6552 ?auto_6553 ?auto_6551 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6559 - OBJ
      ?auto_6560 - OBJ
      ?auto_6558 - LOCATION
    )
    :vars
    (
      ?auto_6561 - LOCATION
      ?auto_6563 - CITY
      ?auto_6562 - OBJ
      ?auto_6564 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6561 ?auto_6563 ) ( IN-CITY ?auto_6558 ?auto_6563 ) ( not ( = ?auto_6558 ?auto_6561 ) ) ( OBJ-AT ?auto_6560 ?auto_6558 ) ( not ( = ?auto_6560 ?auto_6559 ) ) ( OBJ-AT ?auto_6559 ?auto_6561 ) ( not ( = ?auto_6560 ?auto_6562 ) ) ( not ( = ?auto_6559 ?auto_6562 ) ) ( OBJ-AT ?auto_6562 ?auto_6561 ) ( TRUCK-AT ?auto_6564 ?auto_6558 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6560 ?auto_6559 ?auto_6558 )
      ( DELIVER-2PKG-VERIFY ?auto_6559 ?auto_6560 ?auto_6558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6566 - OBJ
      ?auto_6567 - OBJ
      ?auto_6565 - LOCATION
    )
    :vars
    (
      ?auto_6568 - LOCATION
      ?auto_6570 - CITY
      ?auto_6569 - OBJ
      ?auto_6571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6568 ?auto_6570 ) ( IN-CITY ?auto_6565 ?auto_6570 ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( OBJ-AT ?auto_6569 ?auto_6565 ) ( not ( = ?auto_6569 ?auto_6566 ) ) ( OBJ-AT ?auto_6566 ?auto_6568 ) ( not ( = ?auto_6569 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( OBJ-AT ?auto_6567 ?auto_6568 ) ( TRUCK-AT ?auto_6571 ?auto_6565 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6569 ?auto_6566 ?auto_6565 )
      ( DELIVER-2PKG-VERIFY ?auto_6566 ?auto_6567 ?auto_6565 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6581 - OBJ
      ?auto_6582 - OBJ
      ?auto_6583 - OBJ
      ?auto_6580 - LOCATION
    )
    :vars
    (
      ?auto_6584 - LOCATION
      ?auto_6586 - CITY
      ?auto_6585 - OBJ
      ?auto_6587 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6584 ?auto_6586 ) ( IN-CITY ?auto_6580 ?auto_6586 ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( OBJ-AT ?auto_6581 ?auto_6580 ) ( not ( = ?auto_6581 ?auto_6583 ) ) ( OBJ-AT ?auto_6583 ?auto_6584 ) ( not ( = ?auto_6581 ?auto_6585 ) ) ( not ( = ?auto_6583 ?auto_6585 ) ) ( OBJ-AT ?auto_6585 ?auto_6584 ) ( TRUCK-AT ?auto_6587 ?auto_6580 ) ( OBJ-AT ?auto_6582 ?auto_6580 ) ( not ( = ?auto_6581 ?auto_6582 ) ) ( not ( = ?auto_6582 ?auto_6583 ) ) ( not ( = ?auto_6582 ?auto_6585 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6581 ?auto_6583 ?auto_6580 )
      ( DELIVER-3PKG-VERIFY ?auto_6581 ?auto_6582 ?auto_6583 ?auto_6580 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6589 - OBJ
      ?auto_6590 - OBJ
      ?auto_6591 - OBJ
      ?auto_6588 - LOCATION
    )
    :vars
    (
      ?auto_6592 - LOCATION
      ?auto_6593 - CITY
      ?auto_6594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6592 ?auto_6593 ) ( IN-CITY ?auto_6588 ?auto_6593 ) ( not ( = ?auto_6588 ?auto_6592 ) ) ( OBJ-AT ?auto_6589 ?auto_6588 ) ( not ( = ?auto_6589 ?auto_6591 ) ) ( OBJ-AT ?auto_6591 ?auto_6592 ) ( not ( = ?auto_6589 ?auto_6590 ) ) ( not ( = ?auto_6591 ?auto_6590 ) ) ( OBJ-AT ?auto_6590 ?auto_6592 ) ( TRUCK-AT ?auto_6594 ?auto_6588 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6589 ?auto_6591 ?auto_6588 )
      ( DELIVER-3PKG-VERIFY ?auto_6589 ?auto_6590 ?auto_6591 ?auto_6588 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6596 - OBJ
      ?auto_6597 - OBJ
      ?auto_6598 - OBJ
      ?auto_6595 - LOCATION
    )
    :vars
    (
      ?auto_6599 - LOCATION
      ?auto_6601 - CITY
      ?auto_6600 - OBJ
      ?auto_6602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6599 ?auto_6601 ) ( IN-CITY ?auto_6595 ?auto_6601 ) ( not ( = ?auto_6595 ?auto_6599 ) ) ( OBJ-AT ?auto_6598 ?auto_6595 ) ( not ( = ?auto_6598 ?auto_6597 ) ) ( OBJ-AT ?auto_6597 ?auto_6599 ) ( not ( = ?auto_6598 ?auto_6600 ) ) ( not ( = ?auto_6597 ?auto_6600 ) ) ( OBJ-AT ?auto_6600 ?auto_6599 ) ( TRUCK-AT ?auto_6602 ?auto_6595 ) ( OBJ-AT ?auto_6596 ?auto_6595 ) ( not ( = ?auto_6596 ?auto_6597 ) ) ( not ( = ?auto_6596 ?auto_6598 ) ) ( not ( = ?auto_6596 ?auto_6600 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6598 ?auto_6597 ?auto_6595 )
      ( DELIVER-3PKG-VERIFY ?auto_6596 ?auto_6597 ?auto_6598 ?auto_6595 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6604 - OBJ
      ?auto_6605 - OBJ
      ?auto_6606 - OBJ
      ?auto_6603 - LOCATION
    )
    :vars
    (
      ?auto_6607 - LOCATION
      ?auto_6608 - CITY
      ?auto_6609 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6607 ?auto_6608 ) ( IN-CITY ?auto_6603 ?auto_6608 ) ( not ( = ?auto_6603 ?auto_6607 ) ) ( OBJ-AT ?auto_6604 ?auto_6603 ) ( not ( = ?auto_6604 ?auto_6605 ) ) ( OBJ-AT ?auto_6605 ?auto_6607 ) ( not ( = ?auto_6604 ?auto_6606 ) ) ( not ( = ?auto_6605 ?auto_6606 ) ) ( OBJ-AT ?auto_6606 ?auto_6607 ) ( TRUCK-AT ?auto_6609 ?auto_6603 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6604 ?auto_6605 ?auto_6603 )
      ( DELIVER-3PKG-VERIFY ?auto_6604 ?auto_6605 ?auto_6606 ?auto_6603 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6619 - OBJ
      ?auto_6620 - OBJ
      ?auto_6621 - OBJ
      ?auto_6618 - LOCATION
    )
    :vars
    (
      ?auto_6622 - LOCATION
      ?auto_6623 - CITY
      ?auto_6624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6622 ?auto_6623 ) ( IN-CITY ?auto_6618 ?auto_6623 ) ( not ( = ?auto_6618 ?auto_6622 ) ) ( OBJ-AT ?auto_6620 ?auto_6618 ) ( not ( = ?auto_6620 ?auto_6621 ) ) ( OBJ-AT ?auto_6621 ?auto_6622 ) ( not ( = ?auto_6620 ?auto_6619 ) ) ( not ( = ?auto_6621 ?auto_6619 ) ) ( OBJ-AT ?auto_6619 ?auto_6622 ) ( TRUCK-AT ?auto_6624 ?auto_6618 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6620 ?auto_6621 ?auto_6618 )
      ( DELIVER-3PKG-VERIFY ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6634 - OBJ
      ?auto_6635 - OBJ
      ?auto_6636 - OBJ
      ?auto_6633 - LOCATION
    )
    :vars
    (
      ?auto_6637 - LOCATION
      ?auto_6638 - CITY
      ?auto_6639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6637 ?auto_6638 ) ( IN-CITY ?auto_6633 ?auto_6638 ) ( not ( = ?auto_6633 ?auto_6637 ) ) ( OBJ-AT ?auto_6636 ?auto_6633 ) ( not ( = ?auto_6636 ?auto_6635 ) ) ( OBJ-AT ?auto_6635 ?auto_6637 ) ( not ( = ?auto_6636 ?auto_6634 ) ) ( not ( = ?auto_6635 ?auto_6634 ) ) ( OBJ-AT ?auto_6634 ?auto_6637 ) ( TRUCK-AT ?auto_6639 ?auto_6633 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6636 ?auto_6635 ?auto_6633 )
      ( DELIVER-3PKG-VERIFY ?auto_6634 ?auto_6635 ?auto_6636 ?auto_6633 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6657 - OBJ
      ?auto_6658 - OBJ
      ?auto_6659 - OBJ
      ?auto_6656 - LOCATION
    )
    :vars
    (
      ?auto_6660 - LOCATION
      ?auto_6662 - CITY
      ?auto_6661 - OBJ
      ?auto_6663 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6660 ?auto_6662 ) ( IN-CITY ?auto_6656 ?auto_6662 ) ( not ( = ?auto_6656 ?auto_6660 ) ) ( OBJ-AT ?auto_6658 ?auto_6656 ) ( not ( = ?auto_6658 ?auto_6657 ) ) ( OBJ-AT ?auto_6657 ?auto_6660 ) ( not ( = ?auto_6658 ?auto_6661 ) ) ( not ( = ?auto_6657 ?auto_6661 ) ) ( OBJ-AT ?auto_6661 ?auto_6660 ) ( TRUCK-AT ?auto_6663 ?auto_6656 ) ( OBJ-AT ?auto_6659 ?auto_6656 ) ( not ( = ?auto_6657 ?auto_6659 ) ) ( not ( = ?auto_6658 ?auto_6659 ) ) ( not ( = ?auto_6659 ?auto_6661 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6658 ?auto_6657 ?auto_6656 )
      ( DELIVER-3PKG-VERIFY ?auto_6657 ?auto_6658 ?auto_6659 ?auto_6656 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6665 - OBJ
      ?auto_6666 - OBJ
      ?auto_6667 - OBJ
      ?auto_6664 - LOCATION
    )
    :vars
    (
      ?auto_6668 - LOCATION
      ?auto_6669 - CITY
      ?auto_6670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6668 ?auto_6669 ) ( IN-CITY ?auto_6664 ?auto_6669 ) ( not ( = ?auto_6664 ?auto_6668 ) ) ( OBJ-AT ?auto_6666 ?auto_6664 ) ( not ( = ?auto_6666 ?auto_6665 ) ) ( OBJ-AT ?auto_6665 ?auto_6668 ) ( not ( = ?auto_6666 ?auto_6667 ) ) ( not ( = ?auto_6665 ?auto_6667 ) ) ( OBJ-AT ?auto_6667 ?auto_6668 ) ( TRUCK-AT ?auto_6670 ?auto_6664 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6666 ?auto_6665 ?auto_6664 )
      ( DELIVER-3PKG-VERIFY ?auto_6665 ?auto_6666 ?auto_6667 ?auto_6664 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6680 - OBJ
      ?auto_6681 - OBJ
      ?auto_6682 - OBJ
      ?auto_6679 - LOCATION
    )
    :vars
    (
      ?auto_6683 - LOCATION
      ?auto_6684 - CITY
      ?auto_6685 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6683 ?auto_6684 ) ( IN-CITY ?auto_6679 ?auto_6684 ) ( not ( = ?auto_6679 ?auto_6683 ) ) ( OBJ-AT ?auto_6682 ?auto_6679 ) ( not ( = ?auto_6682 ?auto_6680 ) ) ( OBJ-AT ?auto_6680 ?auto_6683 ) ( not ( = ?auto_6682 ?auto_6681 ) ) ( not ( = ?auto_6680 ?auto_6681 ) ) ( OBJ-AT ?auto_6681 ?auto_6683 ) ( TRUCK-AT ?auto_6685 ?auto_6679 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6682 ?auto_6680 ?auto_6679 )
      ( DELIVER-3PKG-VERIFY ?auto_6680 ?auto_6681 ?auto_6682 ?auto_6679 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6728 - OBJ
      ?auto_6727 - LOCATION
    )
    :vars
    (
      ?auto_6729 - LOCATION
      ?auto_6732 - CITY
      ?auto_6730 - OBJ
      ?auto_6731 - OBJ
      ?auto_6733 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6729 ?auto_6732 ) ( IN-CITY ?auto_6727 ?auto_6732 ) ( not ( = ?auto_6727 ?auto_6729 ) ) ( not ( = ?auto_6730 ?auto_6728 ) ) ( OBJ-AT ?auto_6728 ?auto_6729 ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6728 ?auto_6731 ) ) ( OBJ-AT ?auto_6731 ?auto_6729 ) ( TRUCK-AT ?auto_6733 ?auto_6727 ) ( IN-TRUCK ?auto_6730 ?auto_6733 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6730 ?auto_6727 )
      ( DELIVER-2PKG ?auto_6730 ?auto_6728 ?auto_6727 )
      ( DELIVER-1PKG-VERIFY ?auto_6728 ?auto_6727 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6735 - OBJ
      ?auto_6736 - OBJ
      ?auto_6734 - LOCATION
    )
    :vars
    (
      ?auto_6739 - LOCATION
      ?auto_6738 - CITY
      ?auto_6737 - OBJ
      ?auto_6740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6739 ?auto_6738 ) ( IN-CITY ?auto_6734 ?auto_6738 ) ( not ( = ?auto_6734 ?auto_6739 ) ) ( not ( = ?auto_6735 ?auto_6736 ) ) ( OBJ-AT ?auto_6736 ?auto_6739 ) ( not ( = ?auto_6735 ?auto_6737 ) ) ( not ( = ?auto_6736 ?auto_6737 ) ) ( OBJ-AT ?auto_6737 ?auto_6739 ) ( TRUCK-AT ?auto_6740 ?auto_6734 ) ( IN-TRUCK ?auto_6735 ?auto_6740 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6736 ?auto_6734 )
      ( DELIVER-2PKG-VERIFY ?auto_6735 ?auto_6736 ?auto_6734 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6742 - OBJ
      ?auto_6743 - OBJ
      ?auto_6741 - LOCATION
    )
    :vars
    (
      ?auto_6744 - LOCATION
      ?auto_6746 - CITY
      ?auto_6745 - OBJ
      ?auto_6747 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6744 ?auto_6746 ) ( IN-CITY ?auto_6741 ?auto_6746 ) ( not ( = ?auto_6741 ?auto_6744 ) ) ( not ( = ?auto_6745 ?auto_6743 ) ) ( OBJ-AT ?auto_6743 ?auto_6744 ) ( not ( = ?auto_6745 ?auto_6742 ) ) ( not ( = ?auto_6743 ?auto_6742 ) ) ( OBJ-AT ?auto_6742 ?auto_6744 ) ( TRUCK-AT ?auto_6747 ?auto_6741 ) ( IN-TRUCK ?auto_6745 ?auto_6747 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6745 ?auto_6743 ?auto_6741 )
      ( DELIVER-2PKG-VERIFY ?auto_6742 ?auto_6743 ?auto_6741 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6749 - OBJ
      ?auto_6750 - OBJ
      ?auto_6748 - LOCATION
    )
    :vars
    (
      ?auto_6751 - LOCATION
      ?auto_6753 - CITY
      ?auto_6752 - OBJ
      ?auto_6754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6751 ?auto_6753 ) ( IN-CITY ?auto_6748 ?auto_6753 ) ( not ( = ?auto_6748 ?auto_6751 ) ) ( not ( = ?auto_6750 ?auto_6749 ) ) ( OBJ-AT ?auto_6749 ?auto_6751 ) ( not ( = ?auto_6750 ?auto_6752 ) ) ( not ( = ?auto_6749 ?auto_6752 ) ) ( OBJ-AT ?auto_6752 ?auto_6751 ) ( TRUCK-AT ?auto_6754 ?auto_6748 ) ( IN-TRUCK ?auto_6750 ?auto_6754 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6750 ?auto_6749 ?auto_6748 )
      ( DELIVER-2PKG-VERIFY ?auto_6749 ?auto_6750 ?auto_6748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6756 - OBJ
      ?auto_6757 - OBJ
      ?auto_6755 - LOCATION
    )
    :vars
    (
      ?auto_6758 - LOCATION
      ?auto_6760 - CITY
      ?auto_6759 - OBJ
      ?auto_6761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6758 ?auto_6760 ) ( IN-CITY ?auto_6755 ?auto_6760 ) ( not ( = ?auto_6755 ?auto_6758 ) ) ( not ( = ?auto_6759 ?auto_6756 ) ) ( OBJ-AT ?auto_6756 ?auto_6758 ) ( not ( = ?auto_6759 ?auto_6757 ) ) ( not ( = ?auto_6756 ?auto_6757 ) ) ( OBJ-AT ?auto_6757 ?auto_6758 ) ( TRUCK-AT ?auto_6761 ?auto_6755 ) ( IN-TRUCK ?auto_6759 ?auto_6761 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6759 ?auto_6756 ?auto_6755 )
      ( DELIVER-2PKG-VERIFY ?auto_6756 ?auto_6757 ?auto_6755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6779 - OBJ
      ?auto_6780 - OBJ
      ?auto_6781 - OBJ
      ?auto_6778 - LOCATION
    )
    :vars
    (
      ?auto_6782 - LOCATION
      ?auto_6783 - CITY
      ?auto_6784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6782 ?auto_6783 ) ( IN-CITY ?auto_6778 ?auto_6783 ) ( not ( = ?auto_6778 ?auto_6782 ) ) ( not ( = ?auto_6779 ?auto_6781 ) ) ( OBJ-AT ?auto_6781 ?auto_6782 ) ( not ( = ?auto_6779 ?auto_6780 ) ) ( not ( = ?auto_6781 ?auto_6780 ) ) ( OBJ-AT ?auto_6780 ?auto_6782 ) ( TRUCK-AT ?auto_6784 ?auto_6778 ) ( IN-TRUCK ?auto_6779 ?auto_6784 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6779 ?auto_6781 ?auto_6778 )
      ( DELIVER-3PKG-VERIFY ?auto_6779 ?auto_6780 ?auto_6781 ?auto_6778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6794 - OBJ
      ?auto_6795 - OBJ
      ?auto_6796 - OBJ
      ?auto_6793 - LOCATION
    )
    :vars
    (
      ?auto_6797 - LOCATION
      ?auto_6798 - CITY
      ?auto_6799 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6797 ?auto_6798 ) ( IN-CITY ?auto_6793 ?auto_6798 ) ( not ( = ?auto_6793 ?auto_6797 ) ) ( not ( = ?auto_6794 ?auto_6795 ) ) ( OBJ-AT ?auto_6795 ?auto_6797 ) ( not ( = ?auto_6794 ?auto_6796 ) ) ( not ( = ?auto_6795 ?auto_6796 ) ) ( OBJ-AT ?auto_6796 ?auto_6797 ) ( TRUCK-AT ?auto_6799 ?auto_6793 ) ( IN-TRUCK ?auto_6794 ?auto_6799 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6794 ?auto_6795 ?auto_6793 )
      ( DELIVER-3PKG-VERIFY ?auto_6794 ?auto_6795 ?auto_6796 ?auto_6793 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6809 - OBJ
      ?auto_6810 - OBJ
      ?auto_6811 - OBJ
      ?auto_6808 - LOCATION
    )
    :vars
    (
      ?auto_6812 - LOCATION
      ?auto_6813 - CITY
      ?auto_6814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6812 ?auto_6813 ) ( IN-CITY ?auto_6808 ?auto_6813 ) ( not ( = ?auto_6808 ?auto_6812 ) ) ( not ( = ?auto_6810 ?auto_6811 ) ) ( OBJ-AT ?auto_6811 ?auto_6812 ) ( not ( = ?auto_6810 ?auto_6809 ) ) ( not ( = ?auto_6811 ?auto_6809 ) ) ( OBJ-AT ?auto_6809 ?auto_6812 ) ( TRUCK-AT ?auto_6814 ?auto_6808 ) ( IN-TRUCK ?auto_6810 ?auto_6814 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6810 ?auto_6811 ?auto_6808 )
      ( DELIVER-3PKG-VERIFY ?auto_6809 ?auto_6810 ?auto_6811 ?auto_6808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6824 - OBJ
      ?auto_6825 - OBJ
      ?auto_6826 - OBJ
      ?auto_6823 - LOCATION
    )
    :vars
    (
      ?auto_6827 - LOCATION
      ?auto_6828 - CITY
      ?auto_6829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6827 ?auto_6828 ) ( IN-CITY ?auto_6823 ?auto_6828 ) ( not ( = ?auto_6823 ?auto_6827 ) ) ( not ( = ?auto_6826 ?auto_6825 ) ) ( OBJ-AT ?auto_6825 ?auto_6827 ) ( not ( = ?auto_6826 ?auto_6824 ) ) ( not ( = ?auto_6825 ?auto_6824 ) ) ( OBJ-AT ?auto_6824 ?auto_6827 ) ( TRUCK-AT ?auto_6829 ?auto_6823 ) ( IN-TRUCK ?auto_6826 ?auto_6829 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6826 ?auto_6825 ?auto_6823 )
      ( DELIVER-3PKG-VERIFY ?auto_6824 ?auto_6825 ?auto_6826 ?auto_6823 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6855 - OBJ
      ?auto_6856 - OBJ
      ?auto_6857 - OBJ
      ?auto_6854 - LOCATION
    )
    :vars
    (
      ?auto_6858 - LOCATION
      ?auto_6859 - CITY
      ?auto_6860 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6858 ?auto_6859 ) ( IN-CITY ?auto_6854 ?auto_6859 ) ( not ( = ?auto_6854 ?auto_6858 ) ) ( not ( = ?auto_6856 ?auto_6855 ) ) ( OBJ-AT ?auto_6855 ?auto_6858 ) ( not ( = ?auto_6856 ?auto_6857 ) ) ( not ( = ?auto_6855 ?auto_6857 ) ) ( OBJ-AT ?auto_6857 ?auto_6858 ) ( TRUCK-AT ?auto_6860 ?auto_6854 ) ( IN-TRUCK ?auto_6856 ?auto_6860 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6856 ?auto_6855 ?auto_6854 )
      ( DELIVER-3PKG-VERIFY ?auto_6855 ?auto_6856 ?auto_6857 ?auto_6854 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6870 - OBJ
      ?auto_6871 - OBJ
      ?auto_6872 - OBJ
      ?auto_6869 - LOCATION
    )
    :vars
    (
      ?auto_6873 - LOCATION
      ?auto_6874 - CITY
      ?auto_6875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_6873 ?auto_6874 ) ( IN-CITY ?auto_6869 ?auto_6874 ) ( not ( = ?auto_6869 ?auto_6873 ) ) ( not ( = ?auto_6872 ?auto_6870 ) ) ( OBJ-AT ?auto_6870 ?auto_6873 ) ( not ( = ?auto_6872 ?auto_6871 ) ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( OBJ-AT ?auto_6871 ?auto_6873 ) ( TRUCK-AT ?auto_6875 ?auto_6869 ) ( IN-TRUCK ?auto_6872 ?auto_6875 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6872 ?auto_6870 ?auto_6869 )
      ( DELIVER-3PKG-VERIFY ?auto_6870 ?auto_6871 ?auto_6872 ?auto_6869 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_6918 - OBJ
      ?auto_6917 - LOCATION
    )
    :vars
    (
      ?auto_6919 - LOCATION
      ?auto_6922 - CITY
      ?auto_6921 - OBJ
      ?auto_6920 - OBJ
      ?auto_6923 - TRUCK
      ?auto_6924 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6919 ?auto_6922 ) ( IN-CITY ?auto_6917 ?auto_6922 ) ( not ( = ?auto_6917 ?auto_6919 ) ) ( not ( = ?auto_6921 ?auto_6918 ) ) ( OBJ-AT ?auto_6918 ?auto_6919 ) ( not ( = ?auto_6921 ?auto_6920 ) ) ( not ( = ?auto_6918 ?auto_6920 ) ) ( OBJ-AT ?auto_6920 ?auto_6919 ) ( IN-TRUCK ?auto_6921 ?auto_6923 ) ( TRUCK-AT ?auto_6923 ?auto_6924 ) ( IN-CITY ?auto_6924 ?auto_6922 ) ( not ( = ?auto_6917 ?auto_6924 ) ) ( not ( = ?auto_6919 ?auto_6924 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_6923 ?auto_6924 ?auto_6917 ?auto_6922 )
      ( DELIVER-2PKG ?auto_6921 ?auto_6918 ?auto_6917 )
      ( DELIVER-1PKG-VERIFY ?auto_6918 ?auto_6917 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6926 - OBJ
      ?auto_6927 - OBJ
      ?auto_6925 - LOCATION
    )
    :vars
    (
      ?auto_6929 - LOCATION
      ?auto_6932 - CITY
      ?auto_6930 - OBJ
      ?auto_6928 - TRUCK
      ?auto_6931 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6929 ?auto_6932 ) ( IN-CITY ?auto_6925 ?auto_6932 ) ( not ( = ?auto_6925 ?auto_6929 ) ) ( not ( = ?auto_6926 ?auto_6927 ) ) ( OBJ-AT ?auto_6927 ?auto_6929 ) ( not ( = ?auto_6926 ?auto_6930 ) ) ( not ( = ?auto_6927 ?auto_6930 ) ) ( OBJ-AT ?auto_6930 ?auto_6929 ) ( IN-TRUCK ?auto_6926 ?auto_6928 ) ( TRUCK-AT ?auto_6928 ?auto_6931 ) ( IN-CITY ?auto_6931 ?auto_6932 ) ( not ( = ?auto_6925 ?auto_6931 ) ) ( not ( = ?auto_6929 ?auto_6931 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_6927 ?auto_6925 )
      ( DELIVER-2PKG-VERIFY ?auto_6926 ?auto_6927 ?auto_6925 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6934 - OBJ
      ?auto_6935 - OBJ
      ?auto_6933 - LOCATION
    )
    :vars
    (
      ?auto_6937 - LOCATION
      ?auto_6936 - CITY
      ?auto_6940 - OBJ
      ?auto_6939 - TRUCK
      ?auto_6938 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6937 ?auto_6936 ) ( IN-CITY ?auto_6933 ?auto_6936 ) ( not ( = ?auto_6933 ?auto_6937 ) ) ( not ( = ?auto_6940 ?auto_6935 ) ) ( OBJ-AT ?auto_6935 ?auto_6937 ) ( not ( = ?auto_6940 ?auto_6934 ) ) ( not ( = ?auto_6935 ?auto_6934 ) ) ( OBJ-AT ?auto_6934 ?auto_6937 ) ( IN-TRUCK ?auto_6940 ?auto_6939 ) ( TRUCK-AT ?auto_6939 ?auto_6938 ) ( IN-CITY ?auto_6938 ?auto_6936 ) ( not ( = ?auto_6933 ?auto_6938 ) ) ( not ( = ?auto_6937 ?auto_6938 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6940 ?auto_6935 ?auto_6933 )
      ( DELIVER-2PKG-VERIFY ?auto_6934 ?auto_6935 ?auto_6933 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6942 - OBJ
      ?auto_6943 - OBJ
      ?auto_6941 - LOCATION
    )
    :vars
    (
      ?auto_6946 - LOCATION
      ?auto_6944 - CITY
      ?auto_6945 - OBJ
      ?auto_6948 - TRUCK
      ?auto_6947 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6946 ?auto_6944 ) ( IN-CITY ?auto_6941 ?auto_6944 ) ( not ( = ?auto_6941 ?auto_6946 ) ) ( not ( = ?auto_6943 ?auto_6942 ) ) ( OBJ-AT ?auto_6942 ?auto_6946 ) ( not ( = ?auto_6943 ?auto_6945 ) ) ( not ( = ?auto_6942 ?auto_6945 ) ) ( OBJ-AT ?auto_6945 ?auto_6946 ) ( IN-TRUCK ?auto_6943 ?auto_6948 ) ( TRUCK-AT ?auto_6948 ?auto_6947 ) ( IN-CITY ?auto_6947 ?auto_6944 ) ( not ( = ?auto_6941 ?auto_6947 ) ) ( not ( = ?auto_6946 ?auto_6947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6943 ?auto_6942 ?auto_6941 )
      ( DELIVER-2PKG-VERIFY ?auto_6942 ?auto_6943 ?auto_6941 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_6950 - OBJ
      ?auto_6951 - OBJ
      ?auto_6949 - LOCATION
    )
    :vars
    (
      ?auto_6953 - LOCATION
      ?auto_6952 - CITY
      ?auto_6956 - OBJ
      ?auto_6955 - TRUCK
      ?auto_6954 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6953 ?auto_6952 ) ( IN-CITY ?auto_6949 ?auto_6952 ) ( not ( = ?auto_6949 ?auto_6953 ) ) ( not ( = ?auto_6956 ?auto_6950 ) ) ( OBJ-AT ?auto_6950 ?auto_6953 ) ( not ( = ?auto_6956 ?auto_6951 ) ) ( not ( = ?auto_6950 ?auto_6951 ) ) ( OBJ-AT ?auto_6951 ?auto_6953 ) ( IN-TRUCK ?auto_6956 ?auto_6955 ) ( TRUCK-AT ?auto_6955 ?auto_6954 ) ( IN-CITY ?auto_6954 ?auto_6952 ) ( not ( = ?auto_6949 ?auto_6954 ) ) ( not ( = ?auto_6953 ?auto_6954 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6956 ?auto_6950 ?auto_6949 )
      ( DELIVER-2PKG-VERIFY ?auto_6950 ?auto_6951 ?auto_6949 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6976 - OBJ
      ?auto_6977 - OBJ
      ?auto_6978 - OBJ
      ?auto_6975 - LOCATION
    )
    :vars
    (
      ?auto_6980 - LOCATION
      ?auto_6979 - CITY
      ?auto_6982 - TRUCK
      ?auto_6981 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6980 ?auto_6979 ) ( IN-CITY ?auto_6975 ?auto_6979 ) ( not ( = ?auto_6975 ?auto_6980 ) ) ( not ( = ?auto_6976 ?auto_6978 ) ) ( OBJ-AT ?auto_6978 ?auto_6980 ) ( not ( = ?auto_6976 ?auto_6977 ) ) ( not ( = ?auto_6978 ?auto_6977 ) ) ( OBJ-AT ?auto_6977 ?auto_6980 ) ( IN-TRUCK ?auto_6976 ?auto_6982 ) ( TRUCK-AT ?auto_6982 ?auto_6981 ) ( IN-CITY ?auto_6981 ?auto_6979 ) ( not ( = ?auto_6975 ?auto_6981 ) ) ( not ( = ?auto_6980 ?auto_6981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6976 ?auto_6978 ?auto_6975 )
      ( DELIVER-3PKG-VERIFY ?auto_6976 ?auto_6977 ?auto_6978 ?auto_6975 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_6993 - OBJ
      ?auto_6994 - OBJ
      ?auto_6995 - OBJ
      ?auto_6992 - LOCATION
    )
    :vars
    (
      ?auto_6997 - LOCATION
      ?auto_6996 - CITY
      ?auto_6999 - TRUCK
      ?auto_6998 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_6997 ?auto_6996 ) ( IN-CITY ?auto_6992 ?auto_6996 ) ( not ( = ?auto_6992 ?auto_6997 ) ) ( not ( = ?auto_6993 ?auto_6994 ) ) ( OBJ-AT ?auto_6994 ?auto_6997 ) ( not ( = ?auto_6993 ?auto_6995 ) ) ( not ( = ?auto_6994 ?auto_6995 ) ) ( OBJ-AT ?auto_6995 ?auto_6997 ) ( IN-TRUCK ?auto_6993 ?auto_6999 ) ( TRUCK-AT ?auto_6999 ?auto_6998 ) ( IN-CITY ?auto_6998 ?auto_6996 ) ( not ( = ?auto_6992 ?auto_6998 ) ) ( not ( = ?auto_6997 ?auto_6998 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_6993 ?auto_6994 ?auto_6992 )
      ( DELIVER-3PKG-VERIFY ?auto_6993 ?auto_6994 ?auto_6995 ?auto_6992 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7010 - OBJ
      ?auto_7011 - OBJ
      ?auto_7012 - OBJ
      ?auto_7009 - LOCATION
    )
    :vars
    (
      ?auto_7014 - LOCATION
      ?auto_7013 - CITY
      ?auto_7016 - TRUCK
      ?auto_7015 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7014 ?auto_7013 ) ( IN-CITY ?auto_7009 ?auto_7013 ) ( not ( = ?auto_7009 ?auto_7014 ) ) ( not ( = ?auto_7011 ?auto_7012 ) ) ( OBJ-AT ?auto_7012 ?auto_7014 ) ( not ( = ?auto_7011 ?auto_7010 ) ) ( not ( = ?auto_7012 ?auto_7010 ) ) ( OBJ-AT ?auto_7010 ?auto_7014 ) ( IN-TRUCK ?auto_7011 ?auto_7016 ) ( TRUCK-AT ?auto_7016 ?auto_7015 ) ( IN-CITY ?auto_7015 ?auto_7013 ) ( not ( = ?auto_7009 ?auto_7015 ) ) ( not ( = ?auto_7014 ?auto_7015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7011 ?auto_7012 ?auto_7009 )
      ( DELIVER-3PKG-VERIFY ?auto_7010 ?auto_7011 ?auto_7012 ?auto_7009 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7027 - OBJ
      ?auto_7028 - OBJ
      ?auto_7029 - OBJ
      ?auto_7026 - LOCATION
    )
    :vars
    (
      ?auto_7031 - LOCATION
      ?auto_7030 - CITY
      ?auto_7033 - TRUCK
      ?auto_7032 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7031 ?auto_7030 ) ( IN-CITY ?auto_7026 ?auto_7030 ) ( not ( = ?auto_7026 ?auto_7031 ) ) ( not ( = ?auto_7029 ?auto_7028 ) ) ( OBJ-AT ?auto_7028 ?auto_7031 ) ( not ( = ?auto_7029 ?auto_7027 ) ) ( not ( = ?auto_7028 ?auto_7027 ) ) ( OBJ-AT ?auto_7027 ?auto_7031 ) ( IN-TRUCK ?auto_7029 ?auto_7033 ) ( TRUCK-AT ?auto_7033 ?auto_7032 ) ( IN-CITY ?auto_7032 ?auto_7030 ) ( not ( = ?auto_7026 ?auto_7032 ) ) ( not ( = ?auto_7031 ?auto_7032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7029 ?auto_7028 ?auto_7026 )
      ( DELIVER-3PKG-VERIFY ?auto_7027 ?auto_7028 ?auto_7029 ?auto_7026 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7062 - OBJ
      ?auto_7063 - OBJ
      ?auto_7064 - OBJ
      ?auto_7061 - LOCATION
    )
    :vars
    (
      ?auto_7066 - LOCATION
      ?auto_7065 - CITY
      ?auto_7068 - TRUCK
      ?auto_7067 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7066 ?auto_7065 ) ( IN-CITY ?auto_7061 ?auto_7065 ) ( not ( = ?auto_7061 ?auto_7066 ) ) ( not ( = ?auto_7063 ?auto_7062 ) ) ( OBJ-AT ?auto_7062 ?auto_7066 ) ( not ( = ?auto_7063 ?auto_7064 ) ) ( not ( = ?auto_7062 ?auto_7064 ) ) ( OBJ-AT ?auto_7064 ?auto_7066 ) ( IN-TRUCK ?auto_7063 ?auto_7068 ) ( TRUCK-AT ?auto_7068 ?auto_7067 ) ( IN-CITY ?auto_7067 ?auto_7065 ) ( not ( = ?auto_7061 ?auto_7067 ) ) ( not ( = ?auto_7066 ?auto_7067 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7063 ?auto_7062 ?auto_7061 )
      ( DELIVER-3PKG-VERIFY ?auto_7062 ?auto_7063 ?auto_7064 ?auto_7061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7079 - OBJ
      ?auto_7080 - OBJ
      ?auto_7081 - OBJ
      ?auto_7078 - LOCATION
    )
    :vars
    (
      ?auto_7083 - LOCATION
      ?auto_7082 - CITY
      ?auto_7085 - TRUCK
      ?auto_7084 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7083 ?auto_7082 ) ( IN-CITY ?auto_7078 ?auto_7082 ) ( not ( = ?auto_7078 ?auto_7083 ) ) ( not ( = ?auto_7081 ?auto_7079 ) ) ( OBJ-AT ?auto_7079 ?auto_7083 ) ( not ( = ?auto_7081 ?auto_7080 ) ) ( not ( = ?auto_7079 ?auto_7080 ) ) ( OBJ-AT ?auto_7080 ?auto_7083 ) ( IN-TRUCK ?auto_7081 ?auto_7085 ) ( TRUCK-AT ?auto_7085 ?auto_7084 ) ( IN-CITY ?auto_7084 ?auto_7082 ) ( not ( = ?auto_7078 ?auto_7084 ) ) ( not ( = ?auto_7083 ?auto_7084 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7081 ?auto_7079 ?auto_7078 )
      ( DELIVER-3PKG-VERIFY ?auto_7079 ?auto_7080 ?auto_7081 ?auto_7078 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7133 - OBJ
      ?auto_7132 - LOCATION
    )
    :vars
    (
      ?auto_7136 - LOCATION
      ?auto_7134 - CITY
      ?auto_7139 - OBJ
      ?auto_7135 - OBJ
      ?auto_7138 - TRUCK
      ?auto_7137 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7136 ?auto_7134 ) ( IN-CITY ?auto_7132 ?auto_7134 ) ( not ( = ?auto_7132 ?auto_7136 ) ) ( not ( = ?auto_7139 ?auto_7133 ) ) ( OBJ-AT ?auto_7133 ?auto_7136 ) ( not ( = ?auto_7139 ?auto_7135 ) ) ( not ( = ?auto_7133 ?auto_7135 ) ) ( OBJ-AT ?auto_7135 ?auto_7136 ) ( TRUCK-AT ?auto_7138 ?auto_7137 ) ( IN-CITY ?auto_7137 ?auto_7134 ) ( not ( = ?auto_7132 ?auto_7137 ) ) ( not ( = ?auto_7136 ?auto_7137 ) ) ( OBJ-AT ?auto_7139 ?auto_7137 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_7139 ?auto_7138 ?auto_7137 )
      ( DELIVER-2PKG ?auto_7139 ?auto_7133 ?auto_7132 )
      ( DELIVER-1PKG-VERIFY ?auto_7133 ?auto_7132 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7141 - OBJ
      ?auto_7142 - OBJ
      ?auto_7140 - LOCATION
    )
    :vars
    (
      ?auto_7143 - LOCATION
      ?auto_7147 - CITY
      ?auto_7146 - OBJ
      ?auto_7144 - TRUCK
      ?auto_7145 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7143 ?auto_7147 ) ( IN-CITY ?auto_7140 ?auto_7147 ) ( not ( = ?auto_7140 ?auto_7143 ) ) ( not ( = ?auto_7141 ?auto_7142 ) ) ( OBJ-AT ?auto_7142 ?auto_7143 ) ( not ( = ?auto_7141 ?auto_7146 ) ) ( not ( = ?auto_7142 ?auto_7146 ) ) ( OBJ-AT ?auto_7146 ?auto_7143 ) ( TRUCK-AT ?auto_7144 ?auto_7145 ) ( IN-CITY ?auto_7145 ?auto_7147 ) ( not ( = ?auto_7140 ?auto_7145 ) ) ( not ( = ?auto_7143 ?auto_7145 ) ) ( OBJ-AT ?auto_7141 ?auto_7145 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7142 ?auto_7140 )
      ( DELIVER-2PKG-VERIFY ?auto_7141 ?auto_7142 ?auto_7140 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7149 - OBJ
      ?auto_7150 - OBJ
      ?auto_7148 - LOCATION
    )
    :vars
    (
      ?auto_7154 - LOCATION
      ?auto_7153 - CITY
      ?auto_7155 - OBJ
      ?auto_7151 - TRUCK
      ?auto_7152 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7154 ?auto_7153 ) ( IN-CITY ?auto_7148 ?auto_7153 ) ( not ( = ?auto_7148 ?auto_7154 ) ) ( not ( = ?auto_7155 ?auto_7150 ) ) ( OBJ-AT ?auto_7150 ?auto_7154 ) ( not ( = ?auto_7155 ?auto_7149 ) ) ( not ( = ?auto_7150 ?auto_7149 ) ) ( OBJ-AT ?auto_7149 ?auto_7154 ) ( TRUCK-AT ?auto_7151 ?auto_7152 ) ( IN-CITY ?auto_7152 ?auto_7153 ) ( not ( = ?auto_7148 ?auto_7152 ) ) ( not ( = ?auto_7154 ?auto_7152 ) ) ( OBJ-AT ?auto_7155 ?auto_7152 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7155 ?auto_7150 ?auto_7148 )
      ( DELIVER-2PKG-VERIFY ?auto_7149 ?auto_7150 ?auto_7148 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7157 - OBJ
      ?auto_7158 - OBJ
      ?auto_7156 - LOCATION
    )
    :vars
    (
      ?auto_7163 - LOCATION
      ?auto_7162 - CITY
      ?auto_7159 - OBJ
      ?auto_7160 - TRUCK
      ?auto_7161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7163 ?auto_7162 ) ( IN-CITY ?auto_7156 ?auto_7162 ) ( not ( = ?auto_7156 ?auto_7163 ) ) ( not ( = ?auto_7158 ?auto_7157 ) ) ( OBJ-AT ?auto_7157 ?auto_7163 ) ( not ( = ?auto_7158 ?auto_7159 ) ) ( not ( = ?auto_7157 ?auto_7159 ) ) ( OBJ-AT ?auto_7159 ?auto_7163 ) ( TRUCK-AT ?auto_7160 ?auto_7161 ) ( IN-CITY ?auto_7161 ?auto_7162 ) ( not ( = ?auto_7156 ?auto_7161 ) ) ( not ( = ?auto_7163 ?auto_7161 ) ) ( OBJ-AT ?auto_7158 ?auto_7161 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7158 ?auto_7157 ?auto_7156 )
      ( DELIVER-2PKG-VERIFY ?auto_7157 ?auto_7158 ?auto_7156 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7165 - OBJ
      ?auto_7166 - OBJ
      ?auto_7164 - LOCATION
    )
    :vars
    (
      ?auto_7170 - LOCATION
      ?auto_7169 - CITY
      ?auto_7171 - OBJ
      ?auto_7167 - TRUCK
      ?auto_7168 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7170 ?auto_7169 ) ( IN-CITY ?auto_7164 ?auto_7169 ) ( not ( = ?auto_7164 ?auto_7170 ) ) ( not ( = ?auto_7171 ?auto_7165 ) ) ( OBJ-AT ?auto_7165 ?auto_7170 ) ( not ( = ?auto_7171 ?auto_7166 ) ) ( not ( = ?auto_7165 ?auto_7166 ) ) ( OBJ-AT ?auto_7166 ?auto_7170 ) ( TRUCK-AT ?auto_7167 ?auto_7168 ) ( IN-CITY ?auto_7168 ?auto_7169 ) ( not ( = ?auto_7164 ?auto_7168 ) ) ( not ( = ?auto_7170 ?auto_7168 ) ) ( OBJ-AT ?auto_7171 ?auto_7168 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7171 ?auto_7165 ?auto_7164 )
      ( DELIVER-2PKG-VERIFY ?auto_7165 ?auto_7166 ?auto_7164 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7191 - OBJ
      ?auto_7192 - OBJ
      ?auto_7193 - OBJ
      ?auto_7190 - LOCATION
    )
    :vars
    (
      ?auto_7197 - LOCATION
      ?auto_7196 - CITY
      ?auto_7194 - TRUCK
      ?auto_7195 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7197 ?auto_7196 ) ( IN-CITY ?auto_7190 ?auto_7196 ) ( not ( = ?auto_7190 ?auto_7197 ) ) ( not ( = ?auto_7191 ?auto_7193 ) ) ( OBJ-AT ?auto_7193 ?auto_7197 ) ( not ( = ?auto_7191 ?auto_7192 ) ) ( not ( = ?auto_7193 ?auto_7192 ) ) ( OBJ-AT ?auto_7192 ?auto_7197 ) ( TRUCK-AT ?auto_7194 ?auto_7195 ) ( IN-CITY ?auto_7195 ?auto_7196 ) ( not ( = ?auto_7190 ?auto_7195 ) ) ( not ( = ?auto_7197 ?auto_7195 ) ) ( OBJ-AT ?auto_7191 ?auto_7195 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7191 ?auto_7193 ?auto_7190 )
      ( DELIVER-3PKG-VERIFY ?auto_7191 ?auto_7192 ?auto_7193 ?auto_7190 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7208 - OBJ
      ?auto_7209 - OBJ
      ?auto_7210 - OBJ
      ?auto_7207 - LOCATION
    )
    :vars
    (
      ?auto_7214 - LOCATION
      ?auto_7213 - CITY
      ?auto_7211 - TRUCK
      ?auto_7212 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7214 ?auto_7213 ) ( IN-CITY ?auto_7207 ?auto_7213 ) ( not ( = ?auto_7207 ?auto_7214 ) ) ( not ( = ?auto_7208 ?auto_7209 ) ) ( OBJ-AT ?auto_7209 ?auto_7214 ) ( not ( = ?auto_7208 ?auto_7210 ) ) ( not ( = ?auto_7209 ?auto_7210 ) ) ( OBJ-AT ?auto_7210 ?auto_7214 ) ( TRUCK-AT ?auto_7211 ?auto_7212 ) ( IN-CITY ?auto_7212 ?auto_7213 ) ( not ( = ?auto_7207 ?auto_7212 ) ) ( not ( = ?auto_7214 ?auto_7212 ) ) ( OBJ-AT ?auto_7208 ?auto_7212 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7208 ?auto_7209 ?auto_7207 )
      ( DELIVER-3PKG-VERIFY ?auto_7208 ?auto_7209 ?auto_7210 ?auto_7207 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7225 - OBJ
      ?auto_7226 - OBJ
      ?auto_7227 - OBJ
      ?auto_7224 - LOCATION
    )
    :vars
    (
      ?auto_7231 - LOCATION
      ?auto_7230 - CITY
      ?auto_7228 - TRUCK
      ?auto_7229 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7231 ?auto_7230 ) ( IN-CITY ?auto_7224 ?auto_7230 ) ( not ( = ?auto_7224 ?auto_7231 ) ) ( not ( = ?auto_7226 ?auto_7227 ) ) ( OBJ-AT ?auto_7227 ?auto_7231 ) ( not ( = ?auto_7226 ?auto_7225 ) ) ( not ( = ?auto_7227 ?auto_7225 ) ) ( OBJ-AT ?auto_7225 ?auto_7231 ) ( TRUCK-AT ?auto_7228 ?auto_7229 ) ( IN-CITY ?auto_7229 ?auto_7230 ) ( not ( = ?auto_7224 ?auto_7229 ) ) ( not ( = ?auto_7231 ?auto_7229 ) ) ( OBJ-AT ?auto_7226 ?auto_7229 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7226 ?auto_7227 ?auto_7224 )
      ( DELIVER-3PKG-VERIFY ?auto_7225 ?auto_7226 ?auto_7227 ?auto_7224 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7242 - OBJ
      ?auto_7243 - OBJ
      ?auto_7244 - OBJ
      ?auto_7241 - LOCATION
    )
    :vars
    (
      ?auto_7248 - LOCATION
      ?auto_7247 - CITY
      ?auto_7245 - TRUCK
      ?auto_7246 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7248 ?auto_7247 ) ( IN-CITY ?auto_7241 ?auto_7247 ) ( not ( = ?auto_7241 ?auto_7248 ) ) ( not ( = ?auto_7244 ?auto_7243 ) ) ( OBJ-AT ?auto_7243 ?auto_7248 ) ( not ( = ?auto_7244 ?auto_7242 ) ) ( not ( = ?auto_7243 ?auto_7242 ) ) ( OBJ-AT ?auto_7242 ?auto_7248 ) ( TRUCK-AT ?auto_7245 ?auto_7246 ) ( IN-CITY ?auto_7246 ?auto_7247 ) ( not ( = ?auto_7241 ?auto_7246 ) ) ( not ( = ?auto_7248 ?auto_7246 ) ) ( OBJ-AT ?auto_7244 ?auto_7246 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7244 ?auto_7243 ?auto_7241 )
      ( DELIVER-3PKG-VERIFY ?auto_7242 ?auto_7243 ?auto_7244 ?auto_7241 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7277 - OBJ
      ?auto_7278 - OBJ
      ?auto_7279 - OBJ
      ?auto_7276 - LOCATION
    )
    :vars
    (
      ?auto_7283 - LOCATION
      ?auto_7282 - CITY
      ?auto_7280 - TRUCK
      ?auto_7281 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7283 ?auto_7282 ) ( IN-CITY ?auto_7276 ?auto_7282 ) ( not ( = ?auto_7276 ?auto_7283 ) ) ( not ( = ?auto_7278 ?auto_7277 ) ) ( OBJ-AT ?auto_7277 ?auto_7283 ) ( not ( = ?auto_7278 ?auto_7279 ) ) ( not ( = ?auto_7277 ?auto_7279 ) ) ( OBJ-AT ?auto_7279 ?auto_7283 ) ( TRUCK-AT ?auto_7280 ?auto_7281 ) ( IN-CITY ?auto_7281 ?auto_7282 ) ( not ( = ?auto_7276 ?auto_7281 ) ) ( not ( = ?auto_7283 ?auto_7281 ) ) ( OBJ-AT ?auto_7278 ?auto_7281 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7278 ?auto_7277 ?auto_7276 )
      ( DELIVER-3PKG-VERIFY ?auto_7277 ?auto_7278 ?auto_7279 ?auto_7276 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7294 - OBJ
      ?auto_7295 - OBJ
      ?auto_7296 - OBJ
      ?auto_7293 - LOCATION
    )
    :vars
    (
      ?auto_7300 - LOCATION
      ?auto_7299 - CITY
      ?auto_7297 - TRUCK
      ?auto_7298 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_7300 ?auto_7299 ) ( IN-CITY ?auto_7293 ?auto_7299 ) ( not ( = ?auto_7293 ?auto_7300 ) ) ( not ( = ?auto_7296 ?auto_7294 ) ) ( OBJ-AT ?auto_7294 ?auto_7300 ) ( not ( = ?auto_7296 ?auto_7295 ) ) ( not ( = ?auto_7294 ?auto_7295 ) ) ( OBJ-AT ?auto_7295 ?auto_7300 ) ( TRUCK-AT ?auto_7297 ?auto_7298 ) ( IN-CITY ?auto_7298 ?auto_7299 ) ( not ( = ?auto_7293 ?auto_7298 ) ) ( not ( = ?auto_7300 ?auto_7298 ) ) ( OBJ-AT ?auto_7296 ?auto_7298 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7296 ?auto_7294 ?auto_7293 )
      ( DELIVER-3PKG-VERIFY ?auto_7294 ?auto_7295 ?auto_7296 ?auto_7293 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_7348 - OBJ
      ?auto_7347 - LOCATION
    )
    :vars
    (
      ?auto_7353 - LOCATION
      ?auto_7352 - CITY
      ?auto_7354 - OBJ
      ?auto_7349 - OBJ
      ?auto_7351 - LOCATION
      ?auto_7350 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7353 ?auto_7352 ) ( IN-CITY ?auto_7347 ?auto_7352 ) ( not ( = ?auto_7347 ?auto_7353 ) ) ( not ( = ?auto_7354 ?auto_7348 ) ) ( OBJ-AT ?auto_7348 ?auto_7353 ) ( not ( = ?auto_7354 ?auto_7349 ) ) ( not ( = ?auto_7348 ?auto_7349 ) ) ( OBJ-AT ?auto_7349 ?auto_7353 ) ( IN-CITY ?auto_7351 ?auto_7352 ) ( not ( = ?auto_7347 ?auto_7351 ) ) ( not ( = ?auto_7353 ?auto_7351 ) ) ( OBJ-AT ?auto_7354 ?auto_7351 ) ( TRUCK-AT ?auto_7350 ?auto_7347 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_7350 ?auto_7347 ?auto_7351 ?auto_7352 )
      ( DELIVER-2PKG ?auto_7354 ?auto_7348 ?auto_7347 )
      ( DELIVER-1PKG-VERIFY ?auto_7348 ?auto_7347 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7356 - OBJ
      ?auto_7357 - OBJ
      ?auto_7355 - LOCATION
    )
    :vars
    (
      ?auto_7358 - LOCATION
      ?auto_7360 - CITY
      ?auto_7361 - OBJ
      ?auto_7359 - LOCATION
      ?auto_7362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7358 ?auto_7360 ) ( IN-CITY ?auto_7355 ?auto_7360 ) ( not ( = ?auto_7355 ?auto_7358 ) ) ( not ( = ?auto_7356 ?auto_7357 ) ) ( OBJ-AT ?auto_7357 ?auto_7358 ) ( not ( = ?auto_7356 ?auto_7361 ) ) ( not ( = ?auto_7357 ?auto_7361 ) ) ( OBJ-AT ?auto_7361 ?auto_7358 ) ( IN-CITY ?auto_7359 ?auto_7360 ) ( not ( = ?auto_7355 ?auto_7359 ) ) ( not ( = ?auto_7358 ?auto_7359 ) ) ( OBJ-AT ?auto_7356 ?auto_7359 ) ( TRUCK-AT ?auto_7362 ?auto_7355 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_7357 ?auto_7355 )
      ( DELIVER-2PKG-VERIFY ?auto_7356 ?auto_7357 ?auto_7355 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7364 - OBJ
      ?auto_7365 - OBJ
      ?auto_7363 - LOCATION
    )
    :vars
    (
      ?auto_7367 - LOCATION
      ?auto_7368 - CITY
      ?auto_7370 - OBJ
      ?auto_7369 - LOCATION
      ?auto_7366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7367 ?auto_7368 ) ( IN-CITY ?auto_7363 ?auto_7368 ) ( not ( = ?auto_7363 ?auto_7367 ) ) ( not ( = ?auto_7370 ?auto_7365 ) ) ( OBJ-AT ?auto_7365 ?auto_7367 ) ( not ( = ?auto_7370 ?auto_7364 ) ) ( not ( = ?auto_7365 ?auto_7364 ) ) ( OBJ-AT ?auto_7364 ?auto_7367 ) ( IN-CITY ?auto_7369 ?auto_7368 ) ( not ( = ?auto_7363 ?auto_7369 ) ) ( not ( = ?auto_7367 ?auto_7369 ) ) ( OBJ-AT ?auto_7370 ?auto_7369 ) ( TRUCK-AT ?auto_7366 ?auto_7363 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7370 ?auto_7365 ?auto_7363 )
      ( DELIVER-2PKG-VERIFY ?auto_7364 ?auto_7365 ?auto_7363 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7372 - OBJ
      ?auto_7373 - OBJ
      ?auto_7371 - LOCATION
    )
    :vars
    (
      ?auto_7375 - LOCATION
      ?auto_7376 - CITY
      ?auto_7377 - OBJ
      ?auto_7378 - LOCATION
      ?auto_7374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7375 ?auto_7376 ) ( IN-CITY ?auto_7371 ?auto_7376 ) ( not ( = ?auto_7371 ?auto_7375 ) ) ( not ( = ?auto_7373 ?auto_7372 ) ) ( OBJ-AT ?auto_7372 ?auto_7375 ) ( not ( = ?auto_7373 ?auto_7377 ) ) ( not ( = ?auto_7372 ?auto_7377 ) ) ( OBJ-AT ?auto_7377 ?auto_7375 ) ( IN-CITY ?auto_7378 ?auto_7376 ) ( not ( = ?auto_7371 ?auto_7378 ) ) ( not ( = ?auto_7375 ?auto_7378 ) ) ( OBJ-AT ?auto_7373 ?auto_7378 ) ( TRUCK-AT ?auto_7374 ?auto_7371 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7373 ?auto_7372 ?auto_7371 )
      ( DELIVER-2PKG-VERIFY ?auto_7372 ?auto_7373 ?auto_7371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_7380 - OBJ
      ?auto_7381 - OBJ
      ?auto_7379 - LOCATION
    )
    :vars
    (
      ?auto_7383 - LOCATION
      ?auto_7384 - CITY
      ?auto_7386 - OBJ
      ?auto_7385 - LOCATION
      ?auto_7382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7383 ?auto_7384 ) ( IN-CITY ?auto_7379 ?auto_7384 ) ( not ( = ?auto_7379 ?auto_7383 ) ) ( not ( = ?auto_7386 ?auto_7380 ) ) ( OBJ-AT ?auto_7380 ?auto_7383 ) ( not ( = ?auto_7386 ?auto_7381 ) ) ( not ( = ?auto_7380 ?auto_7381 ) ) ( OBJ-AT ?auto_7381 ?auto_7383 ) ( IN-CITY ?auto_7385 ?auto_7384 ) ( not ( = ?auto_7379 ?auto_7385 ) ) ( not ( = ?auto_7383 ?auto_7385 ) ) ( OBJ-AT ?auto_7386 ?auto_7385 ) ( TRUCK-AT ?auto_7382 ?auto_7379 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7386 ?auto_7380 ?auto_7379 )
      ( DELIVER-2PKG-VERIFY ?auto_7380 ?auto_7381 ?auto_7379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7406 - OBJ
      ?auto_7407 - OBJ
      ?auto_7408 - OBJ
      ?auto_7405 - LOCATION
    )
    :vars
    (
      ?auto_7410 - LOCATION
      ?auto_7411 - CITY
      ?auto_7412 - LOCATION
      ?auto_7409 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7410 ?auto_7411 ) ( IN-CITY ?auto_7405 ?auto_7411 ) ( not ( = ?auto_7405 ?auto_7410 ) ) ( not ( = ?auto_7406 ?auto_7408 ) ) ( OBJ-AT ?auto_7408 ?auto_7410 ) ( not ( = ?auto_7406 ?auto_7407 ) ) ( not ( = ?auto_7408 ?auto_7407 ) ) ( OBJ-AT ?auto_7407 ?auto_7410 ) ( IN-CITY ?auto_7412 ?auto_7411 ) ( not ( = ?auto_7405 ?auto_7412 ) ) ( not ( = ?auto_7410 ?auto_7412 ) ) ( OBJ-AT ?auto_7406 ?auto_7412 ) ( TRUCK-AT ?auto_7409 ?auto_7405 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7406 ?auto_7408 ?auto_7405 )
      ( DELIVER-3PKG-VERIFY ?auto_7406 ?auto_7407 ?auto_7408 ?auto_7405 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7423 - OBJ
      ?auto_7424 - OBJ
      ?auto_7425 - OBJ
      ?auto_7422 - LOCATION
    )
    :vars
    (
      ?auto_7427 - LOCATION
      ?auto_7428 - CITY
      ?auto_7429 - LOCATION
      ?auto_7426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7427 ?auto_7428 ) ( IN-CITY ?auto_7422 ?auto_7428 ) ( not ( = ?auto_7422 ?auto_7427 ) ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( OBJ-AT ?auto_7424 ?auto_7427 ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( OBJ-AT ?auto_7425 ?auto_7427 ) ( IN-CITY ?auto_7429 ?auto_7428 ) ( not ( = ?auto_7422 ?auto_7429 ) ) ( not ( = ?auto_7427 ?auto_7429 ) ) ( OBJ-AT ?auto_7423 ?auto_7429 ) ( TRUCK-AT ?auto_7426 ?auto_7422 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7423 ?auto_7424 ?auto_7422 )
      ( DELIVER-3PKG-VERIFY ?auto_7423 ?auto_7424 ?auto_7425 ?auto_7422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7440 - OBJ
      ?auto_7441 - OBJ
      ?auto_7442 - OBJ
      ?auto_7439 - LOCATION
    )
    :vars
    (
      ?auto_7444 - LOCATION
      ?auto_7445 - CITY
      ?auto_7446 - LOCATION
      ?auto_7443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7444 ?auto_7445 ) ( IN-CITY ?auto_7439 ?auto_7445 ) ( not ( = ?auto_7439 ?auto_7444 ) ) ( not ( = ?auto_7441 ?auto_7442 ) ) ( OBJ-AT ?auto_7442 ?auto_7444 ) ( not ( = ?auto_7441 ?auto_7440 ) ) ( not ( = ?auto_7442 ?auto_7440 ) ) ( OBJ-AT ?auto_7440 ?auto_7444 ) ( IN-CITY ?auto_7446 ?auto_7445 ) ( not ( = ?auto_7439 ?auto_7446 ) ) ( not ( = ?auto_7444 ?auto_7446 ) ) ( OBJ-AT ?auto_7441 ?auto_7446 ) ( TRUCK-AT ?auto_7443 ?auto_7439 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7441 ?auto_7442 ?auto_7439 )
      ( DELIVER-3PKG-VERIFY ?auto_7440 ?auto_7441 ?auto_7442 ?auto_7439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7457 - OBJ
      ?auto_7458 - OBJ
      ?auto_7459 - OBJ
      ?auto_7456 - LOCATION
    )
    :vars
    (
      ?auto_7461 - LOCATION
      ?auto_7462 - CITY
      ?auto_7463 - LOCATION
      ?auto_7460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7461 ?auto_7462 ) ( IN-CITY ?auto_7456 ?auto_7462 ) ( not ( = ?auto_7456 ?auto_7461 ) ) ( not ( = ?auto_7459 ?auto_7458 ) ) ( OBJ-AT ?auto_7458 ?auto_7461 ) ( not ( = ?auto_7459 ?auto_7457 ) ) ( not ( = ?auto_7458 ?auto_7457 ) ) ( OBJ-AT ?auto_7457 ?auto_7461 ) ( IN-CITY ?auto_7463 ?auto_7462 ) ( not ( = ?auto_7456 ?auto_7463 ) ) ( not ( = ?auto_7461 ?auto_7463 ) ) ( OBJ-AT ?auto_7459 ?auto_7463 ) ( TRUCK-AT ?auto_7460 ?auto_7456 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7459 ?auto_7458 ?auto_7456 )
      ( DELIVER-3PKG-VERIFY ?auto_7457 ?auto_7458 ?auto_7459 ?auto_7456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7492 - OBJ
      ?auto_7493 - OBJ
      ?auto_7494 - OBJ
      ?auto_7491 - LOCATION
    )
    :vars
    (
      ?auto_7496 - LOCATION
      ?auto_7497 - CITY
      ?auto_7498 - LOCATION
      ?auto_7495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7496 ?auto_7497 ) ( IN-CITY ?auto_7491 ?auto_7497 ) ( not ( = ?auto_7491 ?auto_7496 ) ) ( not ( = ?auto_7493 ?auto_7492 ) ) ( OBJ-AT ?auto_7492 ?auto_7496 ) ( not ( = ?auto_7493 ?auto_7494 ) ) ( not ( = ?auto_7492 ?auto_7494 ) ) ( OBJ-AT ?auto_7494 ?auto_7496 ) ( IN-CITY ?auto_7498 ?auto_7497 ) ( not ( = ?auto_7491 ?auto_7498 ) ) ( not ( = ?auto_7496 ?auto_7498 ) ) ( OBJ-AT ?auto_7493 ?auto_7498 ) ( TRUCK-AT ?auto_7495 ?auto_7491 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7493 ?auto_7492 ?auto_7491 )
      ( DELIVER-3PKG-VERIFY ?auto_7492 ?auto_7493 ?auto_7494 ?auto_7491 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_7509 - OBJ
      ?auto_7510 - OBJ
      ?auto_7511 - OBJ
      ?auto_7508 - LOCATION
    )
    :vars
    (
      ?auto_7513 - LOCATION
      ?auto_7514 - CITY
      ?auto_7515 - LOCATION
      ?auto_7512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_7513 ?auto_7514 ) ( IN-CITY ?auto_7508 ?auto_7514 ) ( not ( = ?auto_7508 ?auto_7513 ) ) ( not ( = ?auto_7511 ?auto_7509 ) ) ( OBJ-AT ?auto_7509 ?auto_7513 ) ( not ( = ?auto_7511 ?auto_7510 ) ) ( not ( = ?auto_7509 ?auto_7510 ) ) ( OBJ-AT ?auto_7510 ?auto_7513 ) ( IN-CITY ?auto_7515 ?auto_7514 ) ( not ( = ?auto_7508 ?auto_7515 ) ) ( not ( = ?auto_7513 ?auto_7515 ) ) ( OBJ-AT ?auto_7511 ?auto_7515 ) ( TRUCK-AT ?auto_7512 ?auto_7508 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_7511 ?auto_7509 ?auto_7508 )
      ( DELIVER-3PKG-VERIFY ?auto_7509 ?auto_7510 ?auto_7511 ?auto_7508 ) )
  )

)

