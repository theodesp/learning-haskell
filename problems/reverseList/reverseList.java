package reverseList;

public class reverseList {
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

    public static List reverse(List l) {
        List prev = null;
        List curr = l;
        List next = null;
        while (curr != null) {
            // store next node first
            next = curr.getNext();
            // point current into previous
            curr.next = prev;
            // advance prev and current forward
            prev = curr;
            curr = next;
        }
        l = prev;
        return l;
    }

    public static void print(List l) {
        while (l != null) {
            System.out.print(l.getValue() + " ");
            l = l.next;
        }
    }

    public static void main(String[] args) {
        List list = new List(85);
        list.setNext(new List(15));
        list.getNext().setNext(new List(20));
        list.getNext().getNext().setNext(new List(5));
        list = reverse(list);
        print(list);
    }
}