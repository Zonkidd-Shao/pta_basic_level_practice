import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    static class Question {
        int score;
        int optionCount;
        boolean[] correct = new boolean[5];
    }

    private static final Pattern ANSWER = Pattern.compile("\\((\\d+)(?:\\s+([^)]*))?\\)");

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer first = new StringTokenizer(br.readLine());
        int students = Integer.parseInt(first.nextToken());
        int questionsCount = Integer.parseInt(first.nextToken());

        Question[] questions = new Question[questionsCount];
        for (int i = 0; i < questionsCount; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            Question q = new Question();
            q.score = Integer.parseInt(st.nextToken());
            q.optionCount = Integer.parseInt(st.nextToken());
            int correctCount = Integer.parseInt(st.nextToken());
            for (int j = 0; j < correctCount; j++) {
                q.correct[st.nextToken().charAt(0) - 'a'] = true;
            }
            questions[i] = q;
        }

        int[] wrong = new int[questionsCount];
        for (int student = 0; student < students; student++) {
            Matcher matcher = ANSWER.matcher(br.readLine());
            int score = 0;
            for (int qIndex = 0; qIndex < questionsCount; qIndex++) {
                if (!matcher.find()) break;
                int selectedCount = Integer.parseInt(matcher.group(1));
                Set<Character> selected = new HashSet<>();
                String choices = matcher.group(2);
                if (choices != null) {
                    StringTokenizer st = new StringTokenizer(choices);
                    for (int j = 0; j < selectedCount && st.hasMoreTokens(); j++) {
                        selected.add(st.nextToken().charAt(0));
                    }
                }

                Question q = questions[qIndex];
                boolean exact = true;
                for (int option = 0; option < q.optionCount; option++) {
                    boolean picked = selected.contains((char) ('a' + option));
                    if (picked != q.correct[option]) {
                        exact = false;
                    }
                }
                if (exact) {
                    score += q.score;
                } else {
                    // 本题规则是只有全部选对才得分，漏选或错选均为 0 分。
                    wrong[qIndex]++;
                }
            }
            System.out.println(score);
        }

        int maxWrong = 0;
        for (int count : wrong) maxWrong = Math.max(maxWrong, count);
        if (maxWrong == 0) {
            System.out.println("Too simple");
            return;
        }

        StringBuilder result = new StringBuilder().append(maxWrong);
        for (int i = 0; i < questionsCount; i++) {
            if (wrong[i] == maxWrong) result.append(' ').append(i + 1);
        }
        System.out.println(result);
    }
}
