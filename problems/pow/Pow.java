package problems.pow;

public class Pow {

    static long pow(long x, long y) {
        // Base case
        if (y == 0) {
            return 1;
        }
        if (y % 2 == 0) {
            return pow(x, y/2) * pow(x, y/2);
        } else {
            return x * pow(x, y/2) * pow(x, y/2);
        }

    }

    static long pow2(long x, long y) {
        // Base case
        if (y == 0) {
            return 1;
        }
        long temp = pow(x, y/2);
        if (y % 2 == 0) {
            return temp * temp;
        } else {
            return x * temp * temp;
        }

    }
    public static void main(String[] args) {
        System.out.println(pow(3,6));
        System.out.println(pow(2,7));
        System.out.println(pow2(2,7));
        System.out.println(pow2(3,6));
    }
}