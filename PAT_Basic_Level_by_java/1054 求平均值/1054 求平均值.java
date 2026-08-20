import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Locale;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        String[] values = br.readLine().trim().split("\\s+");

        int validCount = 0;
        double sum = 0;
        for (String value : values) {
            if (isLegal(value)) {
                validCount++;
                sum += Double.parseDouble(value);
            } else {
                System.out.println("ERROR: " + value + " is not a legal number");
            }
        }

        if (validCount == 0) {
            System.out.println("The average of 0 numbers is Undefined");
        } else {
            double average = sum / validCount;
            String noun = validCount == 1 ? "number" : "numbers";
            System.out.printf(Locale.US, "The average of %d %s is %.2f%n",
                    validCount, noun, average);
        }
    }

    private static boolean isLegal(String value) {
        // 前导零不影响实数的合法性，例如 000.50 仍是合法数字。
        if (!value.matches("-?[0-9]+(?:\\.[0-9]{1,2})?")) {
            return false;
        }
        double number = Double.parseDouble(value);
        return number >= -1000 && number <= 1000;
    }
}
