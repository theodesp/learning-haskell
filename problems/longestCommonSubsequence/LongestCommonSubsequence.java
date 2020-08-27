package LongestCommonSubsequence;

import java.util.HashMap;
import java.util.Map;

public class LongestCommonSubsequence {
    public static int LCS(String a, String b, int i, int j, Map<String, Integer> lookup) {
        // no more strings left to compare
        if (i == 0 || j == 0) {
            return 0;
        }
        // Create a new key from i,j pair
        String key = i + "," + j;
        // If we don't already have it in the lookup table just increment total by one if they are equal
        if (!lookup.containsKey(key)) {
            if (a.charAt(i-1) == b.charAt(j-1)) {
                lookup.put(key, LCS(a, b, i-1, j-1, lookup) + 1);
            }  else {
                // Else if they don't match just put the maximum of
                // either the LCS with i included in the result or LCS with j included in the result
                lookup.put(key,  Integer.max(
                        LCS(a, b, i-1, j, lookup),
                        LCS(a, b, i, j-1, lookup)
                ));
            }
        }
        // Restore from cache instead
        return lookup.get(key);

    }

    public static int LCSLength(String a, String b) {
        int m = a.length(), n = b.length();

        // lookup table stores solution to already computed sub-problems
        int[][] lookup = new int[m + 1][n + 1];

        // fill the lookup table in bottom-up manner
        for (int i = 1; i <= m; i++)
        {
            for (int j = 1; j <= n; j++)
            {
                // Case 1: Last characters matches. Just add 1 to the previous row and column
                if (a.charAt(i - 1) == b.charAt(j - 1)) {
                    lookup[i][j] = lookup[i - 1][j - 1] + 1;
                }
                // Case 1: Last characters do not matches.
                // Get the max of either the previous row with same column or previous column with same row
                else {
                    lookup[i][j] = Integer.max(lookup[i - 1][j], lookup[i][j - 1]);
                }
            }
        }

        // LCS will be last entry in the lookup table
        return lookup[m][n];
    }
    public static void main(String[] args) {
        String X = "XMJYAUZ";
        String Y = "MZJAWXU";
        System.out.println("LCS is: " + LCSLength(X, Y));
    }
}