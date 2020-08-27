package longestValidParenthesis;

import java.util.Stack;

class longestValidParenthesis {

    // Function to return the length
    // of the longest valid substring
    public static int solve(String s, int n) {

        // Variables for left and right
        // counter maxlength to store
        // the maximum length found so far
        int left = 0, right = 0;
        int maxlength = 0;

        // Iterating the string from left to right
        for (int i = 0; i < n; i++) {

            // If "(" is encountered, then
            // left counter is incremented
            // else right counter is incremented
            if (s.charAt(i) == '(')
                left++;
            else
                right++;
            System.out.println(left);
            System.out.println(right);
            // Whenever left is equal to right,
            // it signifies that the subsequence
            // is valid and
            if (left == right)
                maxlength = Math.max(maxlength, 2 * right);

            // Resetting the counters when the
            // subsequence becomes invalid
            else if (right > left)
                left = right = 0;
        }

        left = right = 0;

        // Iterating the string from right to left
        for (int i = n - 1; i >= 0; i--) {

            // If "(" is encountered, then
            // left counter is incremented
            // else right counter is incremented
            if (s.charAt(i) == '(')
                left++;
            else
                right++;

            // Whenever left is equal to right,
            // it signifies that the subsequence
            // is valid and
            if (left == right)
                maxlength = Math.max(maxlength, 2 * left);

            // Resetting the counters when the
            // subsequence becomes invalid
            else if (left > right)
                left = right = 0;
        }
        return maxlength;
    }

    // method to get length of the longest valid
    static int findMaxLen(String str) {
        int n = str.length();

        // Create a stack and push -1 as initial index to it.
        Stack<Integer> stk = new Stack<>();
        stk.push(-1);

        // Initialize result
        int result = 0;

        // Traverse all characters of given string
        for (int i = 0; i < n; i++) {
            // If opening bracket, push index of it
            if (str.charAt(i) == '(')
                stk.push(i);

            else // If closing bracket, i.e.,str[i] = ')'
            {
                // Pop the previous opening bracket's index
                stk.pop();

                // Check if this length formed with base of
                // current valid substring is more than max
                // so far
                if (!stk.empty()) {
                    System.out.println(i);
                    System.out.println(stk.peek());
                    result = Math.max(result, i - stk.peek());
                }

                // If stack is empty. push current index as
                // base for next valid substring (if any)
                else
                    stk.push(i);
            }
        }

        return result;
    }

    // Driver code
    public static void main(String args[]) {
        System.out.print(findMaxLen("((())"));
    }
}