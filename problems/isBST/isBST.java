package isBST;

public class isBST {

    static class TreeNode {
        int value;
        TreeNode left;
        TreeNode right;

        TreeNode(int value) {
            this.value = value;
        }

        TreeNode getLeft() {
            return this.left;
        }

        void setLeft(TreeNode node) {
            this.left = node;
        }

        TreeNode getRight() {
            return this.right;
        }

        void setRight(TreeNode node) {
            this.right = node;
        }

        int getValue() {
            return this.value;
        }
    }

    /**
     * Check if a tree is BST
     * @param node
     * @param left
     * @param right
     * @return
     */
    public static boolean apply(TreeNode node, int left, int right) {
        // Base case.
        if (node == null) {
            return true;
        }
        // Current segment does not satisfy BST property
        if (node.getValue() < left || node.getValue() > right) {
            return false;
        }
        // Check left subtree and right subtree for isBST
        return apply(node.getLeft(), left, node.getValue()) && apply(node.getRight(), node.getValue(), right);
    }

    public static void main(String[] args) {
        TreeNode a = new TreeNode(5);
        TreeNode b = new TreeNode(6);
        TreeNode c = new TreeNode(4);
        TreeNode d = new TreeNode(2);
        TreeNode e = new TreeNode(1);
        a.setLeft(b);
        a.setRight(c);
        c.setLeft(d);
        d.setLeft(e);
        System.out.println(apply(a, Integer.MIN_VALUE, Integer.MAX_VALUE));
    }
}