class Node {

    int data;
    Node left, right;

    Node(int d) {
        data = d;
        left = right = null;
    }
}

class BinaryTree {

    static Node root;

    Node sortedArrToBST(int arr[], int start, int end) {

        if (start > end) {
            return null;
        }

        int mid = (start + end) / 2;
        Node node = new Node(arr[mid]);

        node.left = sortedArrToBST(arr, start, mid - 1);

        node.right = sortedArrToBST(arr, mid + 1, end);

        return node;
    }

    void preOrder(Node node) {
        if (node == null) {
            return;
        }
        System.out.print(node.data + " ");
        preOrder(node.left);
        preOrder(node.right);
    }

    public static void main(String[] args) {
        BinaryTree tree = new BinaryTree();
        int arr[] = new int[]{2, 4, 6, 8, 10};
        int n = arr.length;
        root = tree.sortedArrToBST(arr, 0, n - 1);
        tree.preOrder(root);
    }
}