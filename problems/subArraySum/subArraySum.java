package problems.subArraySum;

import java.util.Arrays;

/**
 * Given an array, find continuous sub array whose sum is equal to a given
 * number k.
 */

public class subArraySum {
    /*
     * Greedy: Use two loops to iterate over the indexes. Keep a sum and check if
     * sum == k.
     */
    public static void subArraySumGreed(int[] arr, int k) {
        for (int i = 0; i < arr.length; i += 1) {
            int sum = 0;
            for (int j = i; j < arr.length; j += 1) {
                sum += arr[j];
                if (sum == k) {
                    System.out.println(Arrays.toString(Arrays.copyOfRange(arr, i, j + 1)));
                }
            }
        }
    }

    /*
     * Kadane: Find the largest sum of any contiguous subarray. Keep track of 2
     * variables. Current best and best.
     */
    public static int subArraySumKadane(int[] arr, int k) {
        int best = 0;
        int current = 0;
        for (int i = 0; i < arr.length; i += 1) {
            current = Math.max(0, current + arr[i]);
            best = Math.max(current, best);
        }
        return best;
    }

    /*
     * Kadane: Keep on adding elements in current_sum till its less than the given
     * sum. If it becomes greater than given sum, start subtracting elements from
     * the start of the array till its greater than given sum.
     */

    public static int[] subArraySumKadaneK(int[] arr, int k) {
        int current = arr[0];
        int i = 0;
        int j = 0;
        while (j < arr.length) {
            if (current == k) {
                return Arrays.copyOfRange(arr, i, j + 1);
            }
            if (current < k) {
                j += 1;
                if (j < arr.length) {
                    current += arr[j];
                }
            } else { // current > k
                     // remove value at start
                current = current - arr[i];
                // slide start forward
                i += 1;
            }
        }
        return Arrays.copyOfRange(arr, i, j);
    }

    public static void main(String[] args) {
        subArraySumGreed(new int[] { 1, 2, 3, 4, 1, 7 }, 12); // [4, 1, 7]
        System.out.println(Arrays.toString(subArraySumKadaneK(new int[] { 2, 4, 17, 9, 6, 3 }, 18))); // [9, 6, 3]
        System.out.println(subArraySumKadane(new int[] { 1, 2, 3, 4, 1, 7 }, 12)); // [4, 1, 7]
    }
}