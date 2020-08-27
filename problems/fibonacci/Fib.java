package fibonacci;

public class Fib {
    static int apply(int target) {
        if (target < 2) {
            return target;
        }
        else {
            return apply(target-1) + apply(target-2);
        }
    }
    public static void main(String[] args) {
        System.out.println(apply(4));
    }
}
