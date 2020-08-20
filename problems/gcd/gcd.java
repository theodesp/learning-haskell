package problems.gcd;

public class gcd {
    /**
     * Using the Euclidian algorithm
     * @param p
     * @param q
     * @return
     */
    public static int apply(int p, int q) {
        if (q == 0) {
            return p;
        }
        return apply(q, p % q);
    }

    public static void main(String[] args) {
        System.out.println(apply(54, 24));
    }
}