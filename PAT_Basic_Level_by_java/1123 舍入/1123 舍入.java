import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Locale;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer first = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(first.nextToken());
        int d = Integer.parseInt(first.nextToken());
        for (int i = 0; i < n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int op = Integer.parseInt(st.nextToken());
            System.out.println(round(st.nextToken(), d, op));
        }
    }

    private static String round(String number, int d, int op) {
        boolean negative = number.charAt(0) == '-';
        String value = negative ? number.substring(1) : number;
        int dot = value.indexOf('.');
        String integer = dot < 0 ? value : value.substring(0, dot);
        String decimals = dot < 0 ? "" : value.substring(dot + 1);

        if (decimals.length() < d) {
            StringBuilder padded = new StringBuilder(decimals);
            while (padded.length() < d) padded.append('0');
            return sign(negative) + integer + "." + padded;
        }

        String kept = decimals.substring(0, d);
        boolean carry = false;
        if (op == 1 || op == 3) {
            if (d < decimals.length()) {
                int next = decimals.charAt(d) - '0';
                if (op == 1) {
                    carry = next >= 5;
                } else if (next > 5) {
                    carry = true;
                } else if (next == 5) {
                    boolean nonZeroAfter = false;
                    for (int i = d + 1; i < decimals.length(); i++) {
                        if (decimals.charAt(i) != '0') {
                            nonZeroAfter = true;
                            break;
                        }
                    }
                    if (nonZeroAfter) {
                        carry = true;
                    } else {
                        int last = d == 0
                                ? integer.charAt(integer.length() - 1) - '0'
                                : kept.charAt(d - 1) - '0';
                        carry = (last & 1) == 1;
                    }
                }
            }
        }

        if (carry) {
            if (d == 0) {
                integer = addOne(integer);
            } else {
                char[] digits = kept.toCharArray();
                int carryDigit = 1;
                for (int i = digits.length - 1; i >= 0 && carryDigit != 0; i--) {
                    int digit = digits[i] - '0' + carryDigit;
                    digits[i] = (char) ('0' + digit % 10);
                    carryDigit = digit / 10;
                }
                kept = new String(digits);
                if (carryDigit != 0) integer = addOne(integer);
            }
        }

        String result = d == 0 ? integer : integer + "." + kept;
        return sign(negative) + result;
    }

    private static String sign(boolean negative) {
        return negative ? "-" : "";
    }

    private static String addOne(String value) {
        char[] digits = value.toCharArray();
        int carry = 1;
        for (int i = digits.length - 1; i >= 0 && carry != 0; i--) {
            int digit = digits[i] - '0' + carry;
            digits[i] = (char) ('0' + digit % 10);
            carry = digit / 10;
        }
        return carry == 0 ? new String(digits) : "1" + new String(digits);
    }
}
