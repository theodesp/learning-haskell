package rodCutting;

public class RodCutting {
    /**
     *
     * @param values The array of values
     * @param n The length of the Rod
     * @return
     */
    static int cutRod(int[]values, int n) {
        if (n == 0) {
            return 0;
        }
        int result = Integer.MIN_VALUE;
        for (int i=0;i<n;i += 1) {
            result = Math.max(result, values[i] + cutRod(values, n-i-1));
        }

        return result;
    }

    public static void main(String[] args) {
        System.out.println(cutRod(new int[]{1,5,8,9}, 4));
    }
}
