package CountUniqueTriangles;

import java.util.HashMap;
import java.util.Map;
import java.util.Arrays;
import java.util.ArrayList;

public class CountUniqueTriangles {
    static int countTriangles(int[] a, int[] b, int[] c) {
        int N = a.length;
        ArrayList<int[]> sides = new ArrayList<int[]>(N);
        // store the frequency of triangles with same sides
        HashMap<int[], Integer> m = new HashMap<int[], Integer>();
        for (int i = 0; i < N; i += 1) {
            int[] entry = new int[]{a[i], b[i], c[i]};
            sides.set(i, entry);
            Arrays.sort(sides.get(i));
            Arrays.toString(sides.get(i));
        }
        return 0;
    }
    public static void main(String[] args) {
        System.out.println(countTriangles(new int[]{7, 5, 8, 2, 2}, new int[]{6, 7, 2, 3, 4}, new int[]{5, 6, 9, 4, 3}));
    }
}