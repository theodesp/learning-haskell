package problems.detectLoopList;

import java.util.HashSet;
import java.util.Set;

public class detectLoopList {
    static class List {
        int value;
        List next;

        List(int value) {
            this.value = value;
        }

        List getNext() {
            return this.next;
        }

        void setNext(List l) {
            this.next = l;
        }

        int getValue() {
            return this.value;
        }
    }

    /*
     * Traverse the list one by one and keep putting the node addresses in a Hash
     * Table. At any point, if NULL is reached then return false and if next of
     * current node points to any of the previously stored nodes in Hash then return
     * true.
     */
    public static boolean detectLoopHash(List l) {
        Set<List> s = new HashSet<List>();
        while (l != null) {
            // Check if we've already seen that pointer
            if (s.contains(l)) {
                return true;
            }
            s.add(l);
            l = l.next;
        }
        return false;
    }

    /*
     * Traverse linked list using two pointers. Move one pointer(slow) by one and
     * another pointer(fast) by two. If these pointers meet at the same node then
     * there is a loop. If pointers do not meet then linked list doesn’t have a
     * loop.
     */
    public static boolean detectLoopFloyd(List l) {
        List slow = l;
        List fast = l;
        boolean hasLoopFlag = false;
        while (slow != null && fast != null && fast.next != null) {
            // Advance slow by one but fast by two
            slow = slow.next;
            fast = fast.next.next;
            // Loop found!
            if (slow == fast) {
                hasLoopFlag = true;
                break;
            }
        }
        return hasLoopFlag;
    }

    public static void print(List l) {
        while (l != null) {
            System.out.print(l.getValue() + " ");
            l = l.next;
        }
    }

    public static void main(String[] args) {
        List list = new List(20);
        list.setNext(new List(15));
        list.next.setNext(new List(5));
        list.next.next.setNext(new List(25));
        list.next.next.next.next = list;

        if (detectLoopFloyd(list))
            System.out.println("Loop found");
        else
            System.out.println("No Loop");
    }
}
