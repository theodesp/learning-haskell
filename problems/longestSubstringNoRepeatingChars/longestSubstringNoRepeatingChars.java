package problems.longestSubstringNoRepeatingChars;

import java.util.HashSet;
import java.util.Set;

/*
Given a string str, find the length of the longest substring without repeating characters.

For “ABDEFGABEF”, the longest substring are “BDEFGA” and “DEFGAB”, with length 6.
For “BBBB” the longest substring is “B”, with length 1.
For “GEEKSFORGEEKS”, there are two longest substrings shown in the below diagrams, with length 7
*/

public class longestSubstringNoRepeatingChars {
    /*
     * We consider all substrings starting from the first till the end O(n^3)
     */
    public static int applyGreed(String input) {
        int result = 0;
        for (int i = 0; i < input.length(); i += 1) {
            for (int j = i; j < input.length(); j += 1) {
                if (areDistinct(input.substring(i, j))) {
                    result = Math.max(result, j - i + 1);
                }
            }
        }
        return result;
    }

    private static Boolean areDistinct(String input) {
        Set<Character> set = new HashSet<>();
        char[] characters = input.toCharArray();

        for (Character c : characters) {
            if (!set.add(c)) {
                return false;
            }
        }
        return true;
    }

    /*
     * Whenever we see repetition, we remove the pervious occurrance and slide the
     * window. O(n^2)
     */
    public static int applySlidingWindow(String input) {
        int result = 0;
        Set<Character> set = new HashSet<>();
        for (int i = 0; i < input.length(); i += 1) {
            for (int j = i; j < input.length(); j += 1) {
                // If current character is visited then break
                if (set.contains(input.charAt(j))) {
                    break;
                }
                result = Math.max(result, j - i + 1);
                set.add(input.charAt(j));
            }
            // Remove the first character of previous window
            set.remove(input.charAt(i));
        }
        return result;
    }

    /*
     * Whenever we see repetition, we remove the pervious occurrance and slide the
     * window. O(n^2)
     */
    public static int applySlidingWindow2(String input) {
        int result = 0;
        int i = 0;
        Set<Character> set = new HashSet<>();
        for (int j = 0; j < input.length(); j += 1) {
            char c = input.charAt(j);
            if (!set.contains(c)) {
                set.add(c);
                result = Math.max(result, set.size());
            } else {
                while (i < j) {
                    if (input.charAt(i) == c) {
                        i += 1;
                        break;
                    }

                    set.remove(input.charAt(i));
                    i += 1;
                }
            }
        }
        return result;
    }

    /*
     * Whenever we see repetition, we remove the pervious occurrance and slide the
     * window. O(n^2). Keep two pointers, left and right. If character is already
     * present in the set then remove the character at left pointer and move the
     * left pointer by 1 Keep on doing this till right pointer reaches the end of
     * string.
     */
    public static int applySlidingWindow3(String input) {
        int result = 0;
        int i = 0;
        int j = 0;
        Set<Character> set = new HashSet<>();
        while (j < input.length()) {
            if (set.contains(input.charAt(j))) {
                set.remove(input.charAt(i));
                i += 1;
            } else {
                set.add(input.charAt(j));
                j += 1;
                result = Math.max(result, set.size());
            }
        }
        return result;
    }

    public static void main(String[] args) {
        int result = applyGreed("geeksforgeeks");
        int result2 = applySlidingWindow3("geeksforgeeks");
        System.out.println(result2);
    }
}